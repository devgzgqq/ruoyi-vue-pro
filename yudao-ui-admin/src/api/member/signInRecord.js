import request from '@/utils/request'

// 创建签到记录
export function createSignInRecord(data) {
  return request({
    url: '/member/sign-in/record/create',
    method: 'post',
    data: data
  })
}

// 更新签到记录
export function updateSignInRecord(data) {
  return request({
    url: '/member/sign-in/record/update',
    method: 'put',
    data: data
  })
}

// 删除签到记录
export function deleteSignInRecord(id) {
  return request({
    url: '/member/sign-in/record/delete?id=' + id,
    method: 'delete'
  })
}

// 获得签到记录
export function getSignInRecord(id) {
  return request({
    url: '/member/sign-in/record/get?id=' + id,
    method: 'get'
  })
}

// 获得签到记录分页
export function getSignInRecordPage(query) {
  return request({
    url: '/member/sign-in/record/page',
    method: 'get',
    params: query
  })
}

// 导出签到记录 Excel
export function exportSignInRecordExcel(query) {
  return request({
    url: '/member/sign-in/record/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
