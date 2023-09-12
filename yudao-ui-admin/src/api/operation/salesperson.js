import request from '@/utils/request'

// 创建顾问
export function createSalesperson(data) {
  return request({
    url: '/operation/salesperson/create',
    method: 'post',
    data: data
  })
}

// 更新顾问
export function updateSalesperson(data) {
  return request({
    url: '/operation/salesperson/update',
    method: 'put',
    data: data
  })
}

// 删除顾问
export function deleteSalesperson(id) {
  return request({
    url: '/operation/salesperson/delete?id=' + id,
    method: 'delete'
  })
}

// 获得顾问
export function getSalesperson(id) {
  return request({
    url: '/operation/salesperson/get?id=' + id,
    method: 'get'
  })
}

// 获得顾问分页
export function getSalespersonPage(query) {
  return request({
    url: '/operation/salesperson/page',
    method: 'get',
    params: query
  })
}

// 导出顾问 Excel
export function exportSalespersonExcel(query) {
  return request({
    url: '/operation/salesperson/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
