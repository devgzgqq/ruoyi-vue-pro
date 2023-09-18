import request from '@/utils/request'

// 创建用户分组
export function createGroup(data) {
  return request({
    url: '/member/group/create',
    method: 'post',
    data: data
  })
}

// 更新用户分组
export function updateGroup(data) {
  return request({
    url: '/member/group/update',
    method: 'put',
    data: data
  })
}

// 删除用户分组
export function deleteGroup(id) {
  return request({
    url: '/member/group/delete?id=' + id,
    method: 'delete'
  })
}

// 获得用户分组
export function getGroup(id) {
  return request({
    url: '/member/group/get?id=' + id,
    method: 'get'
  })
}

// 获得用户分组分页
export function getGroupPage(query) {
  return request({
    url: '/member/group/page',
    method: 'get',
    params: query
  })
}

export function getSimpleGroups() {
  return request({
    url: '/member/group/list-all-simple',
    method: 'get',
  })
}

// 导出用户分组 Excel
export function exportGroupExcel(query) {
  return request({
    url: '/member/group/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
