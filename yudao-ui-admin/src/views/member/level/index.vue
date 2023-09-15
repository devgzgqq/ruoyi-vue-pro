<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch">
      <el-form-item label="等级名称" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入等级名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="等级" prop="level">
        <el-input v-model="queryParams.level" placeholder="请输入等级" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option v-for="dict in statusDictDatas" :key="parseInt(dict.value)" :label="dict.label" :value="parseInt(dict.value)"/>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作工具栏 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['member:level:create']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" :loading="exportLoading"
                   v-hasPermi="['member:level:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="编号" prop="id" show-overflow-tooltip />
      <el-table-column label="等级名称" prop="name" show-overflow-tooltip />
      <el-table-column label="等级" prop="level" show-overflow-tooltip />
      <el-table-column label="升级经验" prop="experience" show-overflow-tooltip />
      <el-table-column label="享受折扣" prop="discountPercent" show-overflow-tooltip />
      <el-table-column label="等级图标" prop="icon" show-overflow-tooltip />
      <el-table-column label="等级背景图" prop="backgroundUrl" show-overflow-tooltip />
      <el-table-column label="状态" prop="status" show-overflow-tooltip>
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.COMMON_STATUS" :value="scope.row.status"/>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" prop="createTime">
        <template v-slot="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="100">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['member:level:update']">修改</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['member:level:delete']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="500px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="等级名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入等级名称" />
        </el-form-item>
        <el-form-item label="等级" prop="level">
          <el-input v-model="form.level" placeholder="请输入等级" />
        </el-form-item>
        <el-form-item label="升级经验" prop="experience">
          <el-input v-model="form.experience" placeholder="请输入升级经验" />
        </el-form-item>
        <el-form-item label="享受折扣" prop="discountPercent">
          <el-input v-model="form.discountPercent" placeholder="请输入享受折扣" />
        </el-form-item>
        <el-form-item label="图标" prop="icon">
          <imageUpload v-model="form.icon"/>
        </el-form-item>
        <el-form-item label="背景图" prop="backgroundUrl">
          <imageUpload v-model="form.backgroundUrl"/>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in statusDictDatas" :key="parseInt(dict.value)" :label="parseInt(dict.value)" :value="parseInt(dict.value)">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { createLevel, updateLevel, deleteLevel, getLevel, getLevelList, exportLevelExcel } from "@/api/member/level";
import { DICT_TYPE, getDictDatas } from '@/utils/dict'
import ImageUpload from '@/components/ImageUpload/index.vue'

export default {
  name: "Level",
  components: {
    ImageUpload
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 导出遮罩层
      exportLoading: false,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 会员等级列表
      list: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNo: 1,
        pageSize: 10,
        name: null,
        level: null,
        experience: null,
        discountPercent: null,
        icon: null,
        backgroundUrl: null,
        status: null,
        createTime: [],
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [{ required: true, message: "等级名称不能为空", trigger: "blur" }],
        level: [{ required: true, message: "等级不能为空", trigger: "blur" }],
        experience: [{ required: true, message: "升级经验不能为空", trigger: "blur" }],
        discountPercent: [{ required: true, message: "享受折扣不能为空", trigger: "blur" }],
        status: [{ required: true, message: "状态不能为空", trigger: "blur" }],
      },
      statusDictDatas: getDictDatas(DICT_TYPE.COMMON_STATUS),
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      // 执行查询
      getLevelList(this.queryParams).then(response => {
        this.list = response.data;
        this.loading = false;
      });
    },
    /** 取消按钮 */
    cancel() {
      this.open = false;
      this.reset();
    },
    /** 表单重置 */
    reset() {
      this.form = {
        id: undefined,
        name: undefined,
        level: undefined,
        experience: undefined,
        discountPercent: undefined,
        icon: undefined,
        backgroundUrl: undefined,
        status: undefined,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNo = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加会员等级";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getLevel(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会员等级";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (!valid) {
          return;
        }
        // 修改的提交
        if (this.form.id != null) {
          updateLevel(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createLevel(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除会员等级编号为"' + id + '"的数据项?').then(function() {
        return deleteLevel(id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      // 处理查询参数
      let params = {...this.queryParams};
      params.pageNo = undefined;
      params.pageSize = undefined;
      this.$modal.confirm('是否确认导出所有会员等级数据项?').then(() => {
        this.exportLoading = true;
        return exportLevelExcel(params);
      }).then(response => {
        this.$download.excel(response, '会员等级.xls');
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
