<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch">
      <el-form-item label="名称" prop="className">
        <el-input v-model="queryParams.className" placeholder="请输入名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="类型" prop="classType">
        <el-input v-model="queryParams.classType" placeholder="请输入类型" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="分组" prop="classGroup">
        <el-select v-model="queryParams.classGroup" placeholder="请选择分组" clearable>
          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.SYSTEM_CLASS_GROUP)"
                       :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
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
                   v-hasPermi="['system:class-type:create']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button icon="el-icon-download" size="mini" @click="handleExport" :loading="exportLoading"
                   v-hasPermi="['system:class-type:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="编号" align="left" prop="id"  width="80" />
      <el-table-column label="名称" align="left" prop="className" />
      <el-table-column label="编码" align="left" prop="classType" />
      <el-table-column label="分组" align="left" prop="classGroup">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.SYSTEM_CLASS_GROUP" :value="scope.row.classGroup" />
        </template>
      </el-table-column>
<!--      <el-table-column label="结构" align="left" prop="classStructure" />-->
      <el-table-column label="状态" align="left" prop="status">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.INFRA_BOOLEAN_STRING" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="排序" align="left" prop="sort" />
      <el-table-column label="创建时间" align="left" prop="createTime" width="180">
        <template v-slot="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="left" class-name="small-padding fixed-width">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleDetail(scope.row)"
                     v-hasPermi="['system:class-type:query']">查看</el-button>
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['system:class-type:update']">修改</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['system:class-type:delete']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="500px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="名称" prop="className">
          <el-input v-model="form.className" placeholder="请输入名称" />
        </el-form-item>
        <el-form-item label="类型" prop="classType">
          <el-input v-model="form.classType" placeholder="请输入类型" />
        </el-form-item>
        <el-form-item label="分组" prop="classGroup">
          <el-select v-model="form.classGroup" placeholder="请选择分组">
            <el-option v-for="dict in this.getDictDatas(DICT_TYPE.SYSTEM_CLASS_GROUP)"
                       :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
<!--        <el-form-item label="结构" prop="classStructure">-->
<!--          <el-input v-model="form.classStructure" placeholder="请输入结构" />-->
<!--        </el-form-item>-->
        <el-form-item label="状态" prop="status">
<!--          <el-radio-group v-model="form.status">-->
<!--            <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"-->
<!--                      :key="dict.value" :label="dict.value">{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
          <el-switch v-model="form.status"></el-switch>
        </el-form-item>
        <el-form-item label="排序" prop="sort">
          <el-input v-model="form.sort" placeholder="请输入排序" />
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
import { createClassType, updateClassType, deleteClassType, getClassType, getClassTypePage, exportClassTypeExcel } from "@/api/system/classType";

export default {
  name: "ClassType",
  components: {
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
      // 类型列表
      list: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNo: 1,
        pageSize: 10,
        className: null,
        classType: null,
        classGroup: null,
        status: null,
        sort: null,
        createTime: [],
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        className: [{ required: true, message: "名称不能为空", trigger: "blur" }],
        classType: [{ required: true, message: "类型不能为空", trigger: "blur" }],
        classGroup: [{ required: true, message: "分组不能为空", trigger: "change" }],
        status: [{ required: true, message: "状态不能为空", trigger: "blur" }],
      }
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
      getClassTypePage(this.queryParams).then(response => {
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
        className: undefined,
        classType: undefined,
        classGroup: undefined,
        classStructure: undefined,
        status: undefined,
        sort: undefined,
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
    /** 查看按钮操作 */
    handleDetail(row) {
      // 跳转到详情页面
      this.$router.push({ path: "/system/classtype/class-detail/" + row.id });
    },
    /** 新增按钮操作 */
    handleAdd() {
      // this.reset();
      // this.open = true;
      // this.title = "添加类型";
      // 跳转到详情页面
      this.$router.push({ path: "/system/classtype/create" });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getClassType(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改类型";
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
          updateClassType(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createClassType(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除类型编号为"' + id + '"的数据项?').then(function() {
          return deleteClassType(id);
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
      this.$modal.confirm('是否确认导出所有类型数据项?').then(() => {
          this.exportLoading = true;
          return exportClassTypeExcel(params);
        }).then(response => {
          this.$download.excel(response, '类型.xls');
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
