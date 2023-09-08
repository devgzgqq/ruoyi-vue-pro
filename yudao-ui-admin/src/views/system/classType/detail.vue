<script>
import { defineComponent } from 'vue'
import { getClassType } from '@/api/system/classType'
import GoBack from '@/components/GoBack/index'

export default defineComponent({
  name: 'detail',
  components: {
    GoBack
  },
  data() {
    return {
      classDetail: {}
    }
  },
  created() {
    this.getClassDetail()
  },
  methods: {
    getClassDetail() {
      const id = this.$route.params.id;
      getClassType(id).then(response => {
        this.classDetail = response.data;
      });
    }
  }
})
</script>

<template>
  <div class="app-container">
    <div class="gw-flex gw-mb-8">
      <go-back></go-back>
    </div>

    <el-descriptions title="分类详情">
      <el-descriptions-item label="分类名称">{{classDetail.className}}</el-descriptions-item>
      <el-descriptions-item label="分类CODE">{{classDetail.classType}}</el-descriptions-item>
    </el-descriptions>
  </div>
</template>

<style scoped lang="scss">

</style>
