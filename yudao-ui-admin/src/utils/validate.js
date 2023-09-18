/**
 * @param {string} path
 * @returns {Boolean}
 */
export function isExternal(path) {
  return /^(https?:|mailto:|tel:)/.test(path)
}

// 手机号正则验证
export const phoneNumReg = /^[1][3,4,5,6,7,8,9][0-9]{9}$/;
// 只能输入中英文和空格（适用于姓名类的校验）
export const nameReg = /^[(^\s+)|(\s+$)|\s+/g\u4e00-\u9fa5a-zA-Z]{2,32}$/;

// 只能输入字母、数字、下划线
export const userNameReg = /^[a-zA-Z0-9_]{1,}$/;

// ----------------------------------公共字段校验--------------------------------------
// 用户名校验（允许输入字母、数字、下划线，但不能为纯数字 && 长度需在2-32个字符）
export function checkName(rule, value, callback) {
  const filterVal = value.trim();
  if (value.length < 2 || value.length > 32) {
    callback(new Error('长度应在2-32个字符'));
  } else if (filterVal && (!nameReg.test(filterVal))) {
    callback(new Error('只能输入中英文'));
  } else {
    callback();
  }
}

// 用户名校验
export function checkCommonName(rule, value, callback) {
  const valueder = !/^[\u4e00-\u9fa5_a-zA-Z0-9-_]{2,32}$/.test(value);
  if (value.length < 2 || value.length > 32) {
    callback(new Error('长度应在2-32个字符'));
  } else if (valueder) {
    callback(new Error('只能输入中文、英文、数字、下划线、中划线'));
  } else {
    callback();
  }
};

export function checkPhoneNum(rule, value, callback) {
  if(!value) {
    callback()
  }
  if (!phoneNumReg.test(value)) {
    callback(new Error('请输入正确的手机号'));
  } else {
    callback();
  }
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validUsername(str) {
  const valid_map = ['admin', 'editor']
  return valid_map.indexOf(str.trim()) >= 0
}

/**
 * @param {string} url
 * @returns {Boolean}
 */
export function validURL(url) {
  const reg = /^(https?|ftp):\/\/([a-zA-Z0-9.-]+(:[a-zA-Z0-9.&%$-]+)*@)*((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])){3}|([a-zA-Z0-9-]+\.)*[a-zA-Z0-9-]+\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(:[0-9]+)*(\/($|[a-zA-Z0-9.,?'\\+&%$#=~_-]+))*$/
  return reg.test(url)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validLowerCase(str) {
  const reg = /^[a-z]+$/
  return reg.test(str)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validUpperCase(str) {
  const reg = /^[A-Z]+$/
  return reg.test(str)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function validAlphabets(str) {
  const reg = /^[A-Za-z]+$/
  return reg.test(str)
}

/**
 * @param {string} email
 * @returns {Boolean}
 */
export function validEmail(email) {
  const reg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
  return reg.test(email)
}

/**
 * @param {string} str
 * @returns {Boolean}
 */
export function isString(str) {
  return typeof str === 'string' || str instanceof String;

}

/**
 * @param {Array} arg
 * @returns {Boolean}
 */
export function isArray(arg) {
  if (typeof Array.isArray === 'undefined') {
    return Object.prototype.toString.call(arg) === '[object Array]'
  }
  return Array.isArray(arg)
}
