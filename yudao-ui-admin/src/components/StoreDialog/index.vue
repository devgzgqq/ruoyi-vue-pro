<script>
import { defineComponent } from 'vue'
import { getStorePage, } from "@/api/training/store";

export default defineComponent({
  name: 'index',
  props: {
    visible: {
      type: Boolean,
      default: false
    },
    title: {
      type: String,
      default: '门店选择'
    },
    width: {
      type: String,
      default: '30%'
    },
    // 多选
    multiple: {
      type: Boolean,
      default: false
    },
  },
  data () {
    return {
      // 遮罩层
      loading: true,
      dialogVisible: this.visible,
      // 总条数
      total: 0,
      // 门店列表
      list: [],
      // 查询参数
      queryParams: {
        pageNo: 1,
        pageSize: 10,
        name: null,
        status: true
      },
      selectRows: []
    }
  },
  watch: {
    visible (val) {
      this.dialogVisible = val
    },
    dialogVisible(val) {
      if(val) {
        this.resetQuery()
        return
      }
      this.handleClose()
    }
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询列表 */
    getList() {
      this.loading = true;
      // 执行查询
      getStorePage(this.queryParams).then(response => {
        this.list = response.data.list;
        this.total = response.data.total;
        this.loading = false;
      });
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
    handleClose () {
      this.list = []
      this.total = 0
      this.$emit('update:visible', false)
    },
    handleSelectionChange(val) {
      this.selectRows = val
    },
    handleSubmit() {
      this.$emit('submit', this.selectRows)
      this.handleClose()
    }
  }
})
</script>

<template>
<div>
  <el-dialog
    :title="title"
    v-bind="$attrs"
    v-on="$listeners"
    :visible.sync="dialogVisible"
    :width="width"
    :before-close="handleClose">
    <div>
      <!-- 搜索工作栏 -->
      <el-form :model="queryParams" ref="queryForm" :inline="true" size="mini" label-position="left" >
        <el-form-item label="名称" prop="name">
          <el-input v-model="queryParams.name" placeholder="请输入门店名称" clearable @keyup.enter.native="handleQuery"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <!-- 列表 -->
      <el-table v-loading="loading" :data="list" @selection-change="handleSelectionChange" @row-click="handleSelectionChange" highlight-current-row>
        <el-table-column v-if="multiple" align="center" type="selection" width="55" />
        <el-table-column label="名称" align="left" prop="name" show-overflow-tooltip />
        <el-table-column label="地址" align="left" prop="address" show-overflow-tooltip />
      </el-table>
      <!-- 分页组件 -->
      <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNo" :limit.sync="queryParams.pageSize"
                  @pagination="getList"/>
    </div>
    <span slot="footer" class="dialog-footer">
      <el-button @click="dialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="handleSubmit">确 定</el-button>
    </span>
  </el-dialog>
</div>
</template>

<style scoped lang="scss">

</style>
