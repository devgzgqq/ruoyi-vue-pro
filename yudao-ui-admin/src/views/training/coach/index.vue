<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch" label-position="left">
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入教练名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="手机号" prop="mobile">
        <el-input v-model="queryParams.mobile" placeholder="请输入教练手机号" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="级别" prop="level">
        <el-select v-model="queryParams.level" placeholder="请选择教练级别" clearable size="mini">
          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.TRAINING_COACH_LEVEL)"
                       :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable size="mini">
          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"
                       :key="dict.value" :label="dict.label" :value="dict.value"/>
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
        <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['training:coach:create']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button plain icon="el-icon-download" size="mini" @click="handleExport" :loading="exportLoading"
                   v-hasPermi="['training:coach:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="编号" align="center" prop="id"  width="80" />
      <el-table-column label="昵称" align="center" prop="nickname" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="手机号" align="center" prop="mobile" />
      <el-table-column label="级别" align="center" prop="level">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.TRAINING_COACH_LEVEL" :value="scope.row.level" />
        </template>
      </el-table-column>
      <el-table-column label="标签" align="center" prop="label">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.TRAINING_COACH_TAGS" :value="scope.row.label" />
        </template>
      </el-table-column>
      <el-table-column label="授课单价" align="center" prop="price" />
      <el-table-column label="状态" align="center" prop="status">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.INFRA_BOOLEAN_STRING" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="推荐" align="center" prop="recommend">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.INFRA_BOOLEAN_STRING" :value="scope.row.recommend" />
        </template>
      </el-table-column>
      <el-table-column label="排序" align="center" prop="sort" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template v-slot="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="180">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['training:coach:update']">修改</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['training:coach:delete']">删除</el-button>
          <el-button size="mini" type="text" @click="handleContactUser(scope.row)"
                     v-hasPermi="['training:coach:update']">创建用户</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="700px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入教练名称" />
        </el-form-item>
        <el-form-item label="昵称" prop="nickname">
          <el-input v-model="form.nickname" placeholder="请输入教练昵称" />
        </el-form-item>
        <el-form-item label="手机号" prop="mobile">
          <el-input v-model="form.mobile" placeholder="请输入教练手机号" />
        </el-form-item>
        <el-form-item label="级别" prop="level">
          <el-select v-model="form.level" placeholder="请选择教练级别">
            <el-option v-for="dict in this.getDictDatas(DICT_TYPE.TRAINING_COACH_LEVEL)"
                       :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="教练标签" prop="label">
          <el-checkbox-group v-model="form.label">
            <el-checkbox v-for="dict in this.getDictDatas(DICT_TYPE.TRAINING_COACH_TAGS)"
                         :key="dict.value" :label="dict.value">{{dict.label}}</el-checkbox>
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="授课单价" prop="price">
          <el-input v-model="form.price" placeholder="请输入授课单价" />
        </el-form-item>
        <el-form-item label="头像">
          <imageUpload v-model="form.avatar"/>
        </el-form-item>
        <el-form-item label="教练图片">
          <imageUpload v-model="form.images"/>
        </el-form-item>
        <el-form-item label="教练介绍" prop="introduce">
          <editor v-model="form.introduce" :min-height="192"/>
        </el-form-item>
        <el-form-item label="状态" prop="status">
<!--          <el-radio-group v-model="form.status">-->
<!--            <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"-->
<!--                      :key="dict.value" :label="dict.value">{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
          <el-switch v-model="form.status"></el-switch>
        </el-form-item>
        <el-form-item label="推荐" prop="recommend">
<!--          <el-radio-group v-model="form.recommend">-->
<!--            <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"-->
<!--                      :key="dict.value" :label="dict.value">{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
          <el-switch v-model="form.recommend"></el-switch>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input-number v-model="form.sort" placeholder="请输入排序" />
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
import { createCoach, createUserOfCoach, updateCoach, deleteCoach, getCoach, getCoachPage, exportCoachExcel } from "@/api/training/coach";
import ImageUpload from '@/components/ImageUpload';
import Editor from '@/components/Editor/index.vue'

export default {
  name: "Coach",
  components: {
    Editor,
    ImageUpload,
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
      // 教练列表
      list: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      contactUserOpen: false,
      // 查询参数
      queryParams: {
        pageNo: 1,
        pageSize: 10,
        name: null,
        mobile: null,
        level: null,
        status: null,
        createTime: [],
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [{ required: true, message: "教练名称不能为空", trigger: "blur" }],
        nickname: [{ required: true, message: "教练昵称不能为空", trigger: "blur" }],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    createUserOfCoach(row) {
      createUserOfCoach(row).then(response => {
        this.$modal.msgSuccess("创建用户成功");
        this.contactUserOpen = false;
      });
    },
    /** 查询列表 */
    getList() {
      this.loading = true;
      // 执行查询
      getCoachPage(this.queryParams).then(response => {
        this.list = response.data.list;
        this.total = response.data.total;
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
        nickname: undefined,
        name: undefined,
        mobile: undefined,
        avatar: undefined,
        level: undefined,
        images: undefined,
        label: [],
        introduce: undefined,
        price: undefined,
        status: true,
        recommend: false,
        sort: '1',
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
      this.title = "添加教练";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getCoach(id).then(response => {
        this.form = response.data;
        this.form.label = this.form.label.split(",");
        this.open = true;
        this.title = "修改教练";
      });
    },
    /** 关联用户按钮操作 */
    handleContactUser(row) {
      try {
        this.createUserOfCoach(row).then(response => {
          if(response && response.data()) {
            this.$modal.msgSuccess("创建用户成功");
          }
        });
      } catch (e) {

      }

    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (!valid) {
          return;
        }
        this.form.label = this.form.label.join(",");
        // 修改的提交
        if (this.form.id != null) {
          updateCoach(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createCoach(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除教练编号为"' + id + '"的数据项?').then(function() {
          return deleteCoach(id);
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
      this.$modal.confirm('是否确认导出所有教练数据项?').then(() => {
          this.exportLoading = true;
          return exportCoachExcel(params);
        }).then(response => {
          this.$download.excel(response, '教练.xls');
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
