import request from '@/utils/request'

// 创建教练
export function createCoach(data) {
  return request({
    url: '/training/coach/create',
    method: 'post',
    data: data
  })
}

export function createUserOfCoach(data) {
  return request({
    url: '/training/coach/create-user',
    method: 'post',
    data: data
  })
}

// 更新教练
export function updateCoach(data) {
  return request({
    url: '/training/coach/update',
    method: 'put',
    data: data
  })
}

// 删除教练
export function deleteCoach(id) {
  return request({
    url: '/training/coach/delete?id=' + id,
    method: 'delete'
  })
}

// 获得教练
export function getCoach(id) {
  return request({
    url: '/training/coach/get?id=' + id,
    method: 'get'
  })
}

// 获得教练分页
export function getCoachPage(query) {
  return request({
    url: '/training/coach/page',
    method: 'get',
    params: query
  })
}

// 导出教练 Excel
export function exportCoachExcel(query) {
  return request({
    url: '/training/coach/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
