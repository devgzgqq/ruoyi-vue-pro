<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch">
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入顾问名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="昵称" prop="name">
        <el-input v-model="queryParams.nickname" placeholder="请输入顾问名称" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="手机号" prop="mobile">
        <el-input v-model="queryParams.mobile" placeholder="请输入顾问手机号" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="级别" prop="level">
        <el-select v-model="queryParams.level" placeholder="请选择顾问级别" clearable>
          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.OPERATION_SALESPERSON_LEVEL)"
                       :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
<!--      <el-form-item label="状态" prop="status">-->
<!--        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>-->
<!--          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"-->
<!--                       :key="dict.value" :label="dict.label" :value="dict.value"/>-->
<!--        </el-select>-->
<!--      </el-form-item>-->
<!--      <el-form-item label="推荐" prop="recommend">-->
<!--        <el-select v-model="queryParams.recommend" placeholder="请选择推荐" clearable>-->
<!--          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"-->
<!--                       :key="dict.value" :label="dict.label" :value="dict.value"/>-->
<!--        </el-select>-->
<!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 操作工具栏 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" icon="el-icon-plus" size="mini" @click="handleAdd"
                   v-hasPermi="['operation:salesperson:create']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button icon="el-icon-download" size="mini" @click="handleExport" :loading="exportLoading"
                   v-hasPermi="['operation:salesperson:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="姓名" align="center" prop="name" />
      <el-table-column label="昵称" align="center" prop="nickname" />
      <el-table-column label="手机号" align="center" prop="mobile" />
      <el-table-column label="级别" align="center" prop="level">
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.OPERATION_SALESPERSON_LEVEL" :value="scope.row.level" />
        </template>
      </el-table-column>
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
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['operation:salesperson:update']">修改</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['operation:salesperson:delete']">删除</el-button>
          <el-button :disabled="!!scope.row.userId" size="mini" type="text" @click="handleCreateUser(scope.row)"
                     v-hasPermi="['operation:salesperson:update']">创建用户</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="500px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入顾问名称" />
        </el-form-item>
        <el-form-item label="昵称" prop="nickname">
          <el-input v-model="form.nickname" placeholder="请输入顾问昵称" />
        </el-form-item>
        <el-form-item label="手机号" prop="mobile">
          <el-input v-model="form.mobile" placeholder="请输入顾问手机号" />
        </el-form-item>
        <el-form-item label="头像">
          <imageUpload v-model="form.avatar"/>
        </el-form-item>
        <el-form-item label="级别" prop="level">
          <el-select v-model="form.level" placeholder="请选择顾问级别">
            <el-option v-for="dict in this.getDictDatas(DICT_TYPE.OPERATION_SALESPERSON_LEVEL)"
                       :key="dict.value" :label="dict.label" :value="dict.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="图片">
          <imageUpload v-model="form.images"/>
        </el-form-item>
        <el-form-item label="介绍" prop="introduce">
          <el-input v-model="form.introduce" placeholder="请输入顾问介绍" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-switch v-model="form.status"></el-switch>
        </el-form-item>
        <el-form-item label="推荐" prop="recommend">
          <el-switch v-model="form.recommend"></el-switch>
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
import { createSalesperson, createUser, updateSalesperson, deleteSalesperson, getSalesperson, getSalespersonPage, exportSalespersonExcel } from "@/api/operation/salesperson";
import ImageUpload from '@/components/ImageUpload';

export default {
  name: "Salesperson",
  components: {
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
      // 顾问列表
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
        mobile: null,
        level: null,
        status: null,
        recommend: null,
        sort: null,
        createTime: [],
        userId: null,
        nickname: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [{ required: true, message: "顾问名称不能为空", trigger: "blur" }],
        nickname: [{ required: true, message: "顾问昵称不能为空", trigger: "blur" }],
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
      getSalespersonPage(this.queryParams).then(response => {
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
        name: undefined,
        mobile: undefined,
        avatar: undefined,
        level: undefined,
        images: undefined,
        introduce: undefined,
        status: undefined,
        recommend: undefined,
        sort: undefined,
        userId: undefined,
        nickname: undefined,
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
      this.title = "添加顾问";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getSalesperson(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改顾问";
      });
    },
    handleCreateUser(row) {
      try {
        createUser(row).then(response => {
          this.$modal.msgSuccess("创建用户成功");
          this.getList();
        });
      } catch (e) {
        this.$modal.msgError(e);
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (!valid) {
          return;
        }
        // 修改的提交
        if (this.form.id != null) {
          updateSalesperson(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createSalesperson(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除顾问编号为"' + id + '"的数据项?').then(function() {
          return deleteSalesperson(id);
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
      this.$modal.confirm('是否确认导出所有顾问数据项?').then(() => {
          this.exportLoading = true;
          return exportSalespersonExcel(params);
        }).then(response => {
          this.$download.excel(response, '顾问.xls');
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
