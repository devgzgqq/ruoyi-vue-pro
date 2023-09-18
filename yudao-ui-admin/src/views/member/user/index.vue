<template>
  <div class="app-container">

    <!-- 搜索工作栏 -->
    <el-form :model="queryParams" ref="queryForm" size="mini" :inline="true" v-show="showSearch">
      <el-form-item label="手机号" prop="mobile">
        <el-input v-model="queryParams.mobile" placeholder="请输入手机号" clearable @keyup.enter.native="handleQuery"/>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="queryParams.status" placeholder="请选择状态" clearable>
          <el-option v-for="dict in this.getDictDatas(DICT_TYPE.COMMON_STATUS)"
                     :key="dict.value" :label="dict.label" :value="dict.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="等级" prop="levelId">
        <el-select v-model="queryParams.levelId" placeholder="请选择等级编号" clearable>
          <el-option label="请选择字典生成" value="" />
        </el-select>
      </el-form-item>
      <el-form-item label="用户分组" prop="groupId">
        <el-select v-model="queryParams.groupId" placeholder="请选择用户分组编号" clearable>
          <el-option label="请选择字典生成" value="" />
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
                   v-hasPermi="['member:user:create']">新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport" :loading="exportLoading"
                   v-hasPermi="['member:user:export']">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <!-- 列表 -->
    <el-table v-loading="loading" :data="list">
      <el-table-column label="编号" prop="id" show-overflow-tooltip />
      <el-table-column label="手机号" prop="mobile" show-overflow-tooltip />
<!--      <el-table-column label="密码" prop="password" show-overflow-tooltip />-->
<!--      <el-table-column label="注册 IP" prop="registerIp" show-overflow-tooltip />-->
<!--      <el-table-column label="最后登录IP" prop="loginIp" show-overflow-tooltip />-->
<!--      <el-table-column label="最后登录时间" prop="loginDate" width="80">-->
<!--        <template v-slot="scope">-->
<!--          <span>{{ parseTime(scope.row.loginDate) }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
      <el-table-column label="昵称" prop="nickname" show-overflow-tooltip />
<!--      <el-table-column label="头像" prop="avatar" show-overflow-tooltip />-->
<!--      <el-table-column label="真实名字" prop="name" show-overflow-tooltip />-->
      <el-table-column label="性别" prop="sex" show-overflow-tooltip>
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.SYSTEM_USER_SEX" :value="scope.row.sex" />
        </template>
      </el-table-column>
<!--      <el-table-column label="所在地" prop="areaId" show-overflow-tooltip />-->
<!--      <el-table-column label="出生日期" prop="birthday" width="80">-->
<!--        <template v-slot="scope">-->
<!--          <span>{{ parseTime(scope.row.birthday) }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="会员备注" prop="mark" show-overflow-tooltip />-->
      <el-table-column label="积分" prop="point" show-overflow-tooltip />
<!--      <el-table-column label="标签" prop="tagIds" show-overflow-tooltip />-->
      <el-table-column label="等级" prop="levelName" show-overflow-tooltip />
      <el-table-column label="经验" prop="experience" show-overflow-tooltip />
      <el-table-column label="分组" prop="groupName" show-overflow-tooltip />
      <el-table-column label="状态" prop="status" show-overflow-tooltip>
        <template v-slot="scope">
          <dict-tag :type="DICT_TYPE.COMMON_STATUS" :value="scope.row.status" />
        </template>
      </el-table-column>
      <el-table-column label="创建时间" prop="createTime" width="140">
        <template v-slot="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="100">
        <template v-slot="scope">
          <el-button size="mini" type="text" @click="handleUpdate(scope.row)"
                     v-hasPermi="['member:user:update']">修改</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)"
                     v-hasPermi="['member:user:delete']">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <!-- 分页组件 -->
    <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                @pagination="getList"/>

    <!-- 对话框(添加 / 修改) -->
    <el-dialog :title="title" :visible.sync="open" width="686px" v-dialogDrag append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="left">
        <el-form-item label="头像">
          <imageUpload :limit="1" v-model="form.avatar"/>
        </el-form-item>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div>
            <el-form-item label="昵称" prop="nickname">
              <el-input v-model="form.nickname" placeholder="请输入用户昵称" />
            </el-form-item>

          </div>
          <div>
            <el-form-item label="真名" prop="name">
              <el-input v-model="form.name" placeholder="请输入真实名字" />
            </el-form-item>
          </div>
        </div>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div>
            <el-form-item label="手机号" prop="mobile">
              <el-input v-model="form.mobile" placeholder="请输入手机号" />
            </el-form-item>
          </div>
          <div>
            <el-form-item label="性别" prop="sex">
              <el-radio-group v-model="form.sex">
                <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.SYSTEM_USER_SEX)"
                          :key="dict.value" :label="parseInt(dict.value)">{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </div>
        </div>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div>
            <el-form-item label="标签" prop="tagIds">
              <el-select class="gw-w-full" multiple v-model="form.tagIds" placeholder="请选择用户标签">
                <el-option v-for="item in tagsOptions" :key="item.id" :label="item.lable" :value="item.value" />
              </el-select>
            </el-form-item>
          </div>
          <div>
            <el-form-item label="出生日期" prop="birthday">
              <el-date-picker class="gw-w-full" clearable v-model="form.birthday" type="date" value-format="timestamp" placeholder="选择出生日期" />
            </el-form-item>
          </div>
        </div>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div>
            <el-form-item label="等级" prop="levelId">
              <el-select class="gw-w-full" v-model="form.levelId" placeholder="请选择等级">
                <el-option v-for="item in levelOptions" :key="item.value" :label="item.label" :value="item.value" />
              </el-select>
            </el-form-item>
          </div>
          <div>
            <el-form-item label="分组" prop="groupId">
              <el-select class="gw-w-full" v-model="form.groupId" placeholder="请选择用户分组">
                <el-option v-for="item in groupOptions" :key="item.value" :label="item.label" :value="item.value" />
              </el-select>
            </el-form-item>
          </div>
        </div>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.COMMON_STATUS)"
                      :key="dict.value" :label="parseInt(dict.value)">{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
          </div>
          <div>
            <el-form-item label="所在地" prop="areaId">
              <el-input v-model="form.areaId" placeholder="请输入所在地" />
            </el-form-item>
          </div>
          </div>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div>
            <el-form-item label="积分" prop="point">
              <el-input v-model="form.point" placeholder="请输入积分" />
            </el-form-item>
          </div>
          <div>
            <el-form-item label="经验" prop="experience">
              <el-input v-model="form.experience" placeholder="请输入经验" />
            </el-form-item>
          </div>
        </div>

        <el-form-item label="备注" prop="mark">
          <el-input :row="6" v-model="form.mark" type="textarea" placeholder="请输入内容" />
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
import { createUser, updateUser, deleteUser, getUser, getUserPage, exportUserExcel } from "@/api/member/user";
import { getSimpleTags } from '@/api/member/tag';
import { getSimpleGroups } from '@/api/member/group';
import { getLevelList } from '@/api/member/level';
import ImageUpload from '@/components/ImageUpload';

export default {
  name: "User",
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
      // 会员用户列表
      list: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNo: 1,
        pageSize: 10,
        mobile: null,
        password: null,
        status: null,
        registerIp: null,
        loginIp: null,
        loginDate: [],
        nickname: null,
        avatar: null,
        name: null,
        sex: null,
        areaId: null,
        birthday: null,
        mark: null,
        point: null,
        tagIds: null,
        levelId: null,
        experience: null,
        groupId: null,
        createTime: [],
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        mobile: [{ required: true, message: "手机号不能为空", trigger: "blur" }],
        status: [{ required: true, message: "状态不能为空", trigger: "blur" }],
        registerIp: [{ required: true, message: "注册 IP不能为空", trigger: "blur" }],
        nickname: [{ required: true, message: "用户昵称不能为空", trigger: "blur" }],
        avatar: [{ required: true, message: "头像不能为空", trigger: "blur" }],
        point: [{ required: true, message: "积分不能为空", trigger: "blur" }],
        experience: [{ required: true, message: "经验不能为空", trigger: "blur" }],
      },
      tagsOptions: [],
      groupOptions: [],
      levelOptions: []
    };
  },
  created() {
    this.getList();
    this.getTapsOptions();
    this.getGroupOptions();
    this.getLevelOptions()
  },
  methods: {
    async getLevelOptions() {
      const { data } = await getLevelList()
      if(data) {
        if(data) {
          this.levelOptions = data.map(item => {
            return {
              label: item.name,
              value: item.id
            }
          })
        }
      }
    },
    /** 获取分组列表 */
    async getGroupOptions() {
      const { data } = await getSimpleGroups();
      if(data) {
        this.groupOptions = data.map(item => {
          return {
            label: item.name,
            value: item.id
          }
        })
      }
    },
    /** 获取标签列表 */
    async getTapsOptions() {
      const { data } = await getSimpleTags()
      if(data) {
        this.tagsOptions = data.map(item => {
          return {
            lable: item.name,
            value: item.id
          }
        })
      }
    },
    /** 查询列表 */
    getList() {
      this.loading = true;
      // 执行查询
      getUserPage(this.queryParams).then(response => {
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
        mobile: undefined,
        password: undefined,
        status: undefined,
        registerIp: undefined,
        loginIp: undefined,
        loginDate: undefined,
        nickname: undefined,
        avatar: undefined,
        name: undefined,
        sex: undefined,
        areaId: undefined,
        birthday: undefined,
        mark: undefined,
        point: undefined,
        tagIds: undefined,
        levelId: undefined,
        experience: undefined,
        groupId: undefined,
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
      this.title = "添加会员用户";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getUser(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改会员用户";
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
          updateUser(this.form).then(response => {
            this.$modal.msgSuccess("修改成功");
            this.open = false;
            this.getList();
          });
          return;
        }
        // 添加的提交
        createUser(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.open = false;
          this.getList();
        });
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$modal.confirm('是否确认删除会员用户编号为"' + id + '"的数据项?').then(function() {
        return deleteUser(id);
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
      this.$modal.confirm('是否确认导出所有会员用户数据项?').then(() => {
        this.exportLoading = true;
        return exportUserExcel(params);
      }).then(response => {
        this.$download.excel(response, '会员用户.xls');
        this.exportLoading = false;
      }).catch(() => {});
    }
  }
};
</script>
