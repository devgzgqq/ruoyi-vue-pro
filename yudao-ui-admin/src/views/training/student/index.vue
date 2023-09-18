<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch" label-position="left">
      <el-form-item label="姓名" prop="name">
        <el-input v-model="queryParams.name" placeholder="请输入姓名" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
<!--      <el-form-item label="状态" prop="status">-->
<!--        <el-select v-model="queryParams.status" placeholder="请选择状态">-->
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
                   v-hasPermi="['training:student:create']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button plain icon="el-icon-download" size="mini" @click="handleExport" :loading="exportLoading"
                   v-hasPermi="['training:student:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="编号" align="left" prop="id" width="80px" />
      <el-table-column label="姓名" align="left" prop="name" />
      <el-table-column label="所属门店" align="left" prop="storeName" />
      <el-table-column label="所属教练" align="left" prop="coachName" />
      <el-table-column label="所属会员" align="left" prop="memberName" />
<!--      <el-table-column label="头像" align="left" prop="avatar" />-->
<!--      <el-table-column label="状态" align="left" prop="status">-->
<!--        <template v-slot="scope">-->
<!--          <dict-tag :type="DICT_TYPE.INFRA_BOOLEAN_STRING" :value="scope.row.status" />-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="排序" align="left" prop="sort" />-->
      <el-table-column label="创建时间" align="left" prop="createTime" width="180">
        <template v-slot="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="left" class-name="small-padding fixed-width" width="100">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['training:student:update']">修改</el-button>
<!--          <el-button size="mini"type="text" @click="handleDelete(scope.row)"-->
<!--                     v-hasPermi="['training:student:delete']">删除</el-button>-->
          <el-dropdown  @command="(command) => handleCommand(command, scope.$index, scope.row)"
                        v-hasPermi="['training:student:delete', 'training:student:update']">
            <el-button size="mini" type="text">更多</el-button>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item command="handleDelete" size="mini"type="text"
                                v-hasPermi="['training:student:delete']">删除</el-dropdown-item>
              <el-dropdown-item command="handleSetStore" size="mini" type="text"
                                v-hasPermi="['training:student:update']">设置门店</el-dropdown-item>
              <el-dropdown-item command="handleSetCoach" size="mini" type="text"
                                v-hasPermi="['training:student:update']">设置教练</el-dropdown-item>
              <el-dropdown-item command="handleSetMember" size="mini" type="text"
                                v-hasPermi="['training:student:update']">设置会员</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="500px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="头像">
          <imageUpload v-model="form.avatar"/>
        </el-form-item>
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名" />
        </el-form-item>
<!--        <el-form-item label="门店ID" prop="storeId">-->
<!--          <el-input v-model="form.storeId" placeholder="请输入门店ID" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="教练ID" prop="coachId">-->
<!--          <el-input v-model="form.coachId" placeholder="请输入教练ID" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="会员ID" prop="memberId">-->
<!--          <el-input v-model="form.memberId" placeholder="请输入会员ID" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="状态" prop="status">-->
<!--          <el-radio-group v-model="form.status">-->
<!--            <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"-->
<!--                      :key="dict.value" :label="dict.value">{{dict.label}}</el-radio>-->
<!--          </el-radio-group>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="排序" prop="sort">-->
<!--          <el-input-number v-model="form.sort" :min="0" placeholder="请输入排序" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <StoreDialog v-if="storeOpen" :visible.sync="storeOpen" @submit="storeSelectChange"></StoreDialog>
    <AdminUserDialog v-if="adminUserOpen" user-type="coach" title="选择所属教练" :visible.sync="adminUserOpen" @submit="coachSelectChange"></AdminUserDialog>
    <MemberDialog v-if="memberUserOpen" title="选择所属会员" :visible.sync="memberUserOpen" @submit="memberSelectChange"></MemberDialog>
  </div>
</template>

<script>
import { createStudent, updateStudent, deleteStudent, getStudent, getStudentPage, exportStudentExcel } from "@/api/training/student";
import ImageUpload from '@/components/ImageUpload';
import StoreDialog from '@/components/StoreDialog'
import AdminUserDialog from '@/components/AdminUserDialog'
import MemberDialog from '@/components/MemberDialog'
import { checkName } from '@/utils/validate'

export default {
  name: "Student",
  components: {
    ImageUpload,
    StoreDialog,
    AdminUserDialog,
    MemberDialog
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
      // 学员列表
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
        avatar: null,
        createTime: [],
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "姓名不能为空", trigger: "blur" },
          { validator: checkName, trigger: 'blur'}
        ],
      },
      storeOpen: false,
      adminUserOpen: false,
      memberUserOpen: false,
      // 当前选中学生
      currentStudent: {}
    };
  },
  created() {
    this.getList();
  },
  methods: {
    memberSelectChange(item) {
      const student = {
        id: this.currentStudent.id,
        name: this.currentStudent.name,
        memberId: item.data.id
      }
      updateStudent(student).then(res => {
        if (res) {
          this.$modal.msgSuccess("修改成功");
          this.getList()
        }
      })
    },
    coachSelectChange(item) {
      const student = {
        id: this.currentStudent.id,
        name: this.currentStudent.name,
        coachId: item.data.id
      }
      updateStudent(student).then(res => {
        if (res) {
          this.$modal.msgSuccess("修改成功");
          this.getList()
        }
      })
    },
    storeSelectChange(store) {
      const student = {
        id: this.currentStudent.id,
        name: this.currentStudent.name,
        storeId: store.id
      }
      updateStudent(student).then(res => {
        if (res) {
          this.$modal.msgSuccess("修改成功");
          this.getList()
        }
      })
    },
    // 更多操作
    handleCommand(command, index, row) {
      this.currentStudent = row
      switch (command) {
        case 'handleDelete':
          this.handleDelete(row);//红号变更
          break;
        case 'handleSetStore':
          this.handleSetStore(row);
          break;
        case 'handleSetCoach':
          this.handleSetCoach(row);
          break;
        case 'handleSetMember':
          this.handleSetMember(row)
        default:
          break;
      }
    },
    handleSetStore() {
      this.storeOpen = true
    },
    handleSetCoach() {
      this.adminUserOpen = true
    },
    handleSetMember() {
      this.memberUserOpen = true
    },
    /** 查询列表 */
    getList() {
      this.loading = true;
      // 执行查询
      getStudentPage(this.queryParams).then(response => {
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
        // storeId: undefined,
        // coachId: undefined,
        // memberId: undefined,
        name: undefined,
        avatar: undefined,
        status: undefined,
        sort: 0,
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
      this.title = "添加学员";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getStudent(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改学员";
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
          updateStudent(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createStudent(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除学员编号为"' + id + '"的数据项?').then(function() {
          return deleteStudent(id);
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
      this.$modal.confirm('是否确认导出所有学员数据项?').then(() => {
          this.exportLoading = true;
          return exportStudentExcel(params);
        }).then(response => {
          this.$download.excel(response, '学员.xls');
          this.exportLoading = false;
        }).catch(() => {});
    }
  }
};
</script>
