import request from '@/utils/request'

// 创建签到规则
export function createSignInConfig(data) {
  return request({
    url: '/member/sign-in-config/create',
    method: 'post',
    data: data
  })
}

// 更新签到规则
export function updateSignInConfig(data) {
  return request({
    url: '/member/sign-in/config/update',
    method: 'put',
    data: data
  })
}

// 删除签到规则
export function deleteSignInConfig(id) {
  return request({
    url: '/member/sign-in/config/delete?id=' + id,
    method: 'delete'
  })
}

// 获得签到规则
export function getSignInConfig(id) {
  return request({
    url: '/member/sign-in/config/get?id=' + id,
    method: 'get'
  })
}

// 获得签到规则分页
export function getSignInConfigList(query) {
  return request({
    url: '/member/sign-in/config/list',
    method: 'get',
    params: query
  })
}

