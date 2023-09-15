import request from '@/utils/request'

// 创建会员等级
export function createLevel(data) {
  return request({
    url: '/member/level/create',
    method: 'post',
    data: data
  })
}

// 更新会员等级
export function updateLevel(data) {
  return request({
    url: '/member/level/update',
    method: 'put',
    data: data
  })
}

// 删除会员等级
export function deleteLevel(id) {
  return request({
    url: '/member/level/delete?id=' + id,
    method: 'delete'
  })
}

// 获得会员等级
export function getLevel(id) {
  return request({
    url: '/member/level/get?id=' + id,
    method: 'get'
  })
}

// 获得会员等级分页
export function getLevelList(query) {
  return request({
    url: '/member/level/list',
    method: 'get',
    params: query
  })
}

// 导出会员等级 Excel
export function exportLevelExcel(query) {
  return request({
    url: '/member/level/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
