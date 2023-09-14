import request from '@/utils/request'

// 创建学员
export function createStudent(data) {
  return request({
    url: '/training/student/create',
    method: 'post',
    data: data
  })
}

// 更新学员
export function updateStudent(data) {
  return request({
    url: '/training/student/update',
    method: 'put',
    data: data
  })
}

// 删除学员
export function deleteStudent(id) {
  return request({
    url: '/training/student/delete?id=' + id,
    method: 'delete'
  })
}

// 获得学员
export function getStudent(id) {
  return request({
    url: '/training/student/get?id=' + id,
    method: 'get'
  })
}

// 获得学员分页
export function getStudentPage(query) {
  return request({
    url: '/training/student/joinpage',
    method: 'get',
    params: query
  })
}

// 导出学员 Excel
export function exportStudentExcel(query) {
  return request({
    url: '/training/student/export-excel',
    method: 'get',
    params: query,
    responseType: 'blob'
  })
}
