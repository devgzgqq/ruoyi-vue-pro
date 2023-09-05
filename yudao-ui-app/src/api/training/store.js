import request from '@/utils/request'

// 创建门店
export function createStore(data) {
  return request({
    url: '/training/store/create',
    method: 'post',
    data: data
  })
}

// 更新门店
export function updateStore(data) {
  return request({
    url: '/training/store/update',
    method: 'put',
    data: data
  })
}

// 删除门店
export function deleteStore(id) {
  return request({
    url: '/training/store/delete?id=' + id,
    method: 'delete'
  })
}

// 获得门店
export function getStore(id) {
  return request({
    url: '/training/store/get?id=' + id,
    method: 'get'
  })
}

// 获得门店分页
export function getStorePage(query) {
  return request({
    url: '/training/store/page',
    method: 'get',
    params: query
  })
}

// 导出门店 Excel
export function exportStoreExcel(query) {
  return request({
    url: '/training/store/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
