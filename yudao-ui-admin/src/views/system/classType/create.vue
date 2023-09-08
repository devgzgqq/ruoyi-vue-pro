<script>
import { defineComponent } from 'vue'
import { createClassType } from '@/api/system/classType'

export default defineComponent({
  name: 'create',
  data() {
    return {
      // 表单参数
      form: {
        className: '',
        classType: '',
        classGroup: '',
        sort: 0,
        status: true,
      },
      // 表单校验
      rules: {
        className: [{ required: true, message: "名称不能为空", trigger: "blur" }],
        classType: [{ required: true, message: "类型不能为空", trigger: "blur" }],
        classGroup: [{ required: true, message: "分组不能为空", trigger: "change" }],
        // status: [{ required: true, message: "状态不能为空", trigger: "blur" }],
      },
      dynamicValidateForm: {
        domains: [{
          value: ''
        }],
        email: ''
      }
    };
  },
  methods: {
    removeDomain(item) {
      var index = this.dynamicValidateForm.domains.indexOf(item)
      if (index !== -1) {
        this.dynamicValidateForm.domains.splice(index, 1)
      }
    },
    addDomain() {
      this.dynamicValidateForm.domains.push({
        value: '',
        key: Date.now()
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (!valid) {
          return;
        }
        // 修改的提交
        // if (this.form.id != null) {
        //   updateClassType(this.form).then(response => {
        //     this.$modal.msgSuccess("修改成功");
        //     this.open = false;
        //     this.getList();
        //   });
        //   return;
        // }
        // 添加的提交
        createClassType(this.form).then(response => {
          this.$modal.msgSuccess("新增成功");
          this.reset();
          this.$router.go(-1);
          // this.getList();
        });
      });
    },
    /** 表单重置 */
    reset() {
      this.form = {
        id: undefined,
        className: undefined,
        classType: undefined,
        classGroup: undefined,
        classStructure: undefined,
        sort: 0,
      };
      this.resetForm("form");
    },
    cancel() {
      // 返回上一页
      this.$router.go(-1);
    },
  }
})
</script>

<template>
  <div class="app-container">
    <div class="gw-m-auto gw-w-5/12">
      <div class="gw-text-2xl gw-font-medium gw-my-6">
        类型信息
      </div>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px" label-position="top">
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div class="gw-col-span-1">
            <el-form-item label="名称" prop="className">
              <el-input v-model="form.className" placeholder="请输入名称" />
            </el-form-item>
          </div>
          <div class="gw-col-span-1">
            <el-form-item label="类型" prop="classType">
              <el-input v-model="form.classType" placeholder="请输入类型" />
            </el-form-item>
          </div>
        </div>
        <div class="gw-grid gw-grid-cols-2 gw-gap-8">
          <div class="gw-col-span-1">
            <el-form-item label="分组" prop="classGroup">
              <el-select v-model="form.classGroup" placeholder="请选择分组" class="!gw-w-full">
                <el-option v-for="dict in this.getDictDatas(DICT_TYPE.SYSTEM_CLASS_GROUP)"
                           :key="dict.value" :label="dict.label" :value="dict.value" />
              </el-select>
            </el-form-item>
          </div>
          <div class="gw-col-span-1">
            <el-form-item label="排序" prop="sort">
              <el-input-number v-model="form.sort" placeholder="" class="gw-w-full" />
            </el-form-item>
          </div>
        </div>



<!--        <el-form-item label="结构" prop="classStructure">-->
<!--          <el-input v-model="form.classStructure" placeholder="请输入结构" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="状态" prop="status">-->
<!--          &lt;!&ndash;          <el-radio-group v-model="form.status">&ndash;&gt;-->
<!--          &lt;!&ndash;            <el-radio v-for="dict in this.getDictDatas(DICT_TYPE.INFRA_BOOLEAN_STRING)"&ndash;&gt;-->
<!--          &lt;!&ndash;                      :key="dict.value" :label="dict.value">{{dict.label}}</el-radio>&ndash;&gt;-->
<!--          &lt;!&ndash;          </el-radio-group>&ndash;&gt;-->
<!--          <el-switch v-model="form.status"></el-switch>-->
<!--        </el-form-item>-->

      </el-form>
      <div class="gw-text-2xl gw-font-medium gw-my-6">
        结构信息
      </div>
      <div class="gw-mb-8">
        <div>
          <el-button icon="el-icon-plus" @click="addDomain" circle></el-button>
        </div>
        <el-form :model="dynamicValidateForm" ref="dynamicValidateForm" label-width="100px" class="demo-dynamic">
          <el-form-item
            v-for="(domain, index) in dynamicValidateForm.domains"
            :label="'域名' + index"
            :key="domain.key"
            :prop="'domains.' + index + '.value'"
            :rules="{
      required: true, message: '域名不能为空', trigger: 'blur'
    }"
          >
            <el-input v-model="domain.value"></el-input><el-button @click.prevent="removeDomain(domain)">删除</el-button>
          </el-form-item>
<!--          <el-form-item>-->
<!--            <el-button type="primary" @click="submitForm('dynamicValidateForm')">提交</el-button>-->
<!--            <el-button @click="addDomain">新增域名</el-button>-->
<!--            <el-button @click="resetForm('dynamicValidateForm')">重置</el-button>-->
<!--          </el-form-item>-->
        </el-form>
      </div>
      <div>
        <el-button type="primary" @click="submitForm">确认提交</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </div>
  </div>
</template>

<style scoped lang="scss">

</style>
