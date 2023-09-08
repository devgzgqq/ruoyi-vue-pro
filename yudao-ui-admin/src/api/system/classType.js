import request from '@/utils/request'

// 创建类型
export function createClassType(data) {
  return request({
    url: '/system/class-type/create',
    method: 'post',
    data: data
  })
}

// 更新类型
export function updateClassType(data) {
  return request({
    url: '/system/class-type/update',
    method: 'put',
    data: data
  })
}

// 删除类型
export function deleteClassType(id) {
  return request({
    url: '/system/class-type/delete?id=' + id,
    method: 'delete'
  })
}

// 获得类型
export function getClassType(id) {
  return request({
    url: '/system/class-type/get?id=' + id,
    method: 'get'
  })
}

// 获得类型分页
export function getClassTypePage(query) {
  return request({
    url: '/system/class-type/page',
    method: 'get',
    params: query
  })
}

// 导出类型 Excel
export function exportClassTypeExcel(query) {
  return request({
    url: '/system/class-type/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
