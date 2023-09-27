import request from '@/utils/request'

// 创建班级信息
export function createClasses(data) {
  return request({
    url: '/training/classes/create',
    method: 'post',
    data: data
  })
}

// 更新班级信息
export function updateClasses(data) {
  return request({
    url: '/training/classes/update',
    method: 'put',
    data: data
  })
}

// 删除班级信息
export function deleteClasses(id) {
  return request({
    url: '/training/classes/delete?id=' + id,
    method: 'delete'
  })
}

// 获得班级信息
export function getClasses(id) {
  return request({
    url: '/training/classes/get?id=' + id,
    method: 'get'
  })
}

// 获得班级信息分页
export function getClassesPage(query) {
  return request({
    url: '/training/classes/page',
    method: 'get',
    params: query
  })
}

// 导出班级信息 Excel
export function exportClassesExcel(query) {
  return request({
    url: '/training/classes/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
