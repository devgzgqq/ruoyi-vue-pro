<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch">
      <el-form-item label="用户" prop="userId">
        <el-input v-model="queryParams.userId" placeholder="请输入签到用户" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="第几天" prop="day">
        <el-input v-model="queryParams.day" placeholder="请输入第几天签到" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="分数" prop="point">
        <el-input v-model="queryParams.point" placeholder="请输入签到的分数" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="签到时间" prop="createTime">
        <el-date-picker v-model="queryParams.createTime" style="width: 240px" value-format="yyyy-MM-dd HH:mm:ss" type="daterange"
                        range-separator="-" start-placeholder="开始日期" end-placeholder="结束日期" :default-time="['00:00:00', '23:59:59']" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>


    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="ID" prop="id" show-overflow-tooltip />
      <el-table-column label="用户" prop="userId" show-overflow-tooltip />
      <el-table-column label="第几天" prop="day" show-overflow-tooltip />
      <el-table-column label="分数" prop="point" show-overflow-tooltip />
      <el-table-column label="时间" prop="createTime">
        <template v-slot="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="100">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['point:sign-in-record:update']">修改</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['point:sign-in-record:delete']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="500px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="签到用户" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入签到用户" />
        </el-form-item>
        <el-form-item label="第几天签到" prop="day">
          <el-input v-model="form.day" placeholder="请输入第几天签到" />
        </el-form-item>
        <el-form-item label="签到的分数" prop="point">
          <el-input v-model="form.point" placeholder="请输入签到的分数" />
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
import { createSignInRecord, updateSignInRecord, deleteSignInRecord, getSignInRecord, getSignInRecordPage, exportSignInRecordExcel } from "@/api/member/signInRecord";

export default {
  name: "SignInRecord",
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
      // 签到记录列表
      list: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNo: 1,
        pageSize: 10,
        userId: null,
        day: null,
        point: null,
        createTime: [],
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
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
      getSignInRecordPage(this.queryParams).then(response => {
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
        userId: undefined,
        day: undefined,
        point: undefined,
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
      this.title = "添加签到记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getSignInRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改签到记录";
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
          updateSignInRecord(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createSignInRecord(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除签到记录编号为"' + id + '"的数据项?').then(function() {
        return deleteSignInRecord(id);
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
      this.$modal.confirm('是否确认导出所有签到记录数据项?').then(() => {
        this.exportLoading = true;
        return exportSignInRecordExcel(params);
      }).then(response => {
        this.$download.excel(response, '签到记录.xls');
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
