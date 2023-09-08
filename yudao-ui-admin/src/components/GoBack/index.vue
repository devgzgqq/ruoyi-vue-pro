<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'index'
})
</script>

<template>
  <el-button type="primary" round size="mini" icon="el-icon-arrow-left" @click="$router.go(-1)">返回</el-button>
</template>

<style scoped lang="scss">

</style>
