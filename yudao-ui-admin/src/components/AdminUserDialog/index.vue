<script setup>
import { onMounted, reactive, ref, watch } from 'vue'
import { listUser } from '@/api/system/user'
import { useModal } from '@/plugins/useModal'

const queryForm = ref(null)

const { msgWarning } = useModal();

const emit = defineEmits(['update:visible', 'submit', 'close'])

const props = defineProps({
  visible: Boolean,
  title: {
    type: String,
    default: '选择用户'
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
  // 用户类型
  userType: {
    type: String,
    default: ''
  }
})

const data = reactive({
  // 遮罩层
  loading: true,
  dialogVisible: props.visible,
  // 总条数
  total: 0,
  // 列表
  list: [],
  // 查询参数
  queryParams: {
    pageNo: 1,
    pageSize: 10,
    username: null,
    status: 0
  },
  selectRows: []
})

watch(() => props.visible, (val) => {
  data.dialogVisible = val
})

watch( () => data.dialogVisible, (val) => {
  if (val) return
  emit('update:visible', false)
})

async function getList() {
  data.loading = true
  if(props.userType) {
    data.queryParams.type = props.userType
  }
  const response = await listUser(data.queryParams)
  Object.assign(data, response.data)
  data.loading = false
}
function handleClose() {
  emit('update:visible', false)
  emit('close')
}

function handleSubmit() {
  if(data.selectRows.length === 0) {
    msgWarning('您还没有选择任何用户！')
    return;
  }
  emit('submit', {
    multiple: props.multiple,
    data: props.multiple ? data.selectRows : data.selectRows[0]
  })
  data.dialogVisible = false;
}

function handleQuery() {
  data.queryParams.pageNo = 1;
  getList();
}

function resetQuery() {
  resetForm(queryForm.value);
  handleQuery();
}

function handleSelectionChange(val) {
  if(val) {
    data.selectRows = Array.isArray(val) ? val : [val]
  }
}

function resetForm(refName) {
  if (refName) {
    refName.resetFields();
  }
}

onMounted(() => {
  getList()
})
</script>

<template>
  <el-dialog
    :title="title"
    v-bind="$attrs"
    v-on="$listeners"
    :visible.sync="data.dialogVisible"
    :width="width"
    :before-close="handleClose">
    <div>
      <!-- 搜索工作栏 -->
      <el-form :model="data.queryParams" ref="queryForm" :inline="true" size="mini" label-position="left" >
        <el-form-item label="用户名" prop="username">
          <el-input v-model="data.queryParams.username" placeholder="请输入用户名" clearable @keyup.enter.native="handleQuery"/>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>
      <!-- 列表 -->
      <el-table v-loading="data.loading" :data="data.list" @selection-change="handleSelectionChange" @row-click="handleSelectionChange" highlight-current-row>
        <el-table-column v-if="multiple" align="center" type="selection" width="55" />
        <el-table-column label="用户名" align="left" prop="username" show-overflow-tooltip />
        <el-table-column label="昵称" align="left" prop="nickname" show-overflow-tooltip />
        <el-table-column label="邮箱" align="left" prop="email" show-overflow-tooltip />
      </el-table>
      <!-- 分页组件 -->
      <pagination v-show="data.total > 0" :total="data.total" :page.sync="data.queryParams.pageNo" :limit.sync="data.queryParams.pageSize"
                  @pagination="getList"/>
    </div>
    <span slot="footer" class="dialog-footer">
      <el-button @click="data.dialogVisible = false">取 消</el-button>
      <el-button type="primary" @click="handleSubmit">确 定</el-button>
    </span>
  </el-dialog>
</template>

<style scoped lang="scss">

</style>
