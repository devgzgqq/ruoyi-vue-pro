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
        classStructure: [{
          name: '',
          code: '',
          type: ''
        }],
        sort: 0,
        status: true,
      },
      // 表单校验
      rules: {
        className: [{ required: true, message: "名称不能为空", trigger: "blur" }],
        classType: [{ required: true, message: "类型不能为空", trigger: "blur" }],
        classGroup: [{ required: true, message: "分组不能为空", trigger: "change" }],
        // status: [{ required: true, message: "状态不能为空", trigger: "blur" }],
      }
    };
  },
  methods: {
    removeSttr(item) {
      var index = this.form.classStructure.indexOf(item)
      if (index !== -1) {
        this.form.classStructure.splice(index, 1)
      }
    },
    addSttr() {
      this.form.classStructure.push({
        name: '',
        code: '',
        type: ''
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
        this.form.classStructure = JSON.stringify(this.form.classStructure)
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
      </el-form>
      <div class="gw-text-2xl gw-font-medium gw-my-6">
        结构信息
      </div>
      <div class="gw-mb-8">
        <div>
          <el-button icon="el-icon-plus" @click="addSttr" circle></el-button>
        </div>
        <el-form :model="form" ref="dynamicValidateForm" label-width="0px">
          <el-table :data="form.classStructure">
            <el-table-column label="域名" width="120">
              <template #default="{row, column, $index}">
                <el-form-item :prop="'classStructure.' + $index + '.name'" :rules="{
      required: true, message: '域名不能为空', trigger: 'blur'
    }">
                  <el-input v-model="row.name"></el-input>
                </el-form-item>
              </template>
            </el-table-column>
            <el-table-column label="编码" width="120">
              <template #default="{row, column, $index}">
                <el-form-item :prop="'classStructure.' + $index + '.code'" :rules="{
      required: true, message: '编码不能为空', trigger: 'blur'
    }">
                  <el-input v-model="row.code"></el-input>
                </el-form-item>
              </template>
            </el-table-column>
            <el-table-column label="类型" width="120">
              <template #default="{row, column, $index}">
                <el-form-item :prop="'classStructure.' + $index + '.type'" :rules="{
      required: true, message: '类型不能为空', trigger: 'blur'
    }">
                  <el-input v-model="row.type"></el-input>
                </el-form-item>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="120">
              <template #default="{row}">
                <el-button @click.prevent="removeSttr(row)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>
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
