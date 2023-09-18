import request from '@/utils/request'

// 创建会员用户
export function createUser(data) {
  return request({
    url: '/member/user/create',
    method: 'post',
    data: data
  })
}

// 更新会员用户
export function updateUser(data) {
  return request({
    url: '/member/user/update',
    method: 'put',
    data: data
  })
}

// 删除会员用户
export function deleteUser(id) {
  return request({
    url: '/member/user/delete?id=' + id,
    method: 'delete'
  })
}

// 获得会员用户
export function getUser(id) {
  return request({
    url: '/member/user/get?id=' + id,
    method: 'get'
  })
}

// 获得会员用户分页
export function getUserPage(query) {
  return request({
    url: '/member/user/page',
    method: 'get',
    params: query
  })
}

// 导出会员用户 Excel
export function exportUserExcel(query) {
  return request({
    url: '/member/user/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
