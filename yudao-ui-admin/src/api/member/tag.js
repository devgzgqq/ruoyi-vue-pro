import request from '@/utils/request'

// 创建会员标签
export function createTag(data) {
  return request({
    url: '/member/tag/create',
    method: 'post',
    data: data
  })
}

// 更新会员标签
export function updateTag(data) {
  return request({
    url: '/member/tag/update',
    method: 'put',
    data: data
  })
}

// 删除会员标签
export function deleteTag(id) {
  return request({
    url: '/member/tag/delete?id=' + id,
    method: 'delete'
  })
}

// 获得会员标签
export function getTag(id) {
  return request({
    url: '/member/tag/get?id=' + id,
    method: 'get'
  })
}

// 获得会员标签分页
export function getTagPage(query) {
  return request({
    url: '/member/tag/page',
    method: 'get',
    params: query
  })
}

// 导出会员标签 Excel
export function exportTagExcel(query) {
  return request({
    url: '/member/tag/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
