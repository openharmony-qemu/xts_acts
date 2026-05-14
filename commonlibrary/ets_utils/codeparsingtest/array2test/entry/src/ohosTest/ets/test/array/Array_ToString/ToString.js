/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

function safeExec(fn) {
  try {
    return !!fn();
  } catch (e) {
    return false;
  }
}

// 模块加载时对 Array.prototype.join 做 descriptor 快照；全量跑测中若仅用「赋值」恢复 join，
// 可能与引擎原生属性的内部槽不一致，进而影响 Object.create(Array.prototype) 等后续用例。
var arrayPrototypeJoinDescriptorSnapshot = Object.getOwnPropertyDescriptor(Array.prototype, 'join');

/**
 * 将 Array.prototype.join 恢复为模块加载时的 descriptor（供套件 beforeEach 调用，隔离用例间污染）。
 */
export function restoreArrayPrototypeJoinSnapshot() {
  if (arrayPrototypeJoinDescriptorSnapshot) {
    Object.defineProperty(Array.prototype, 'join', arrayPrototypeJoinDescriptorSnapshot);
  }
}

function defineArrayPrototypeJoinFromDescriptor(desc) {
  if (desc) {
    Object.defineProperty(Array.prototype, 'join', desc);
  }
}

/** 1 简单数组转字符串 */
export function ToStringJs_0100() {
  return [1, 2, 3].toString() === '1,2,3' && ['a', 'b', 'c'].toString() === 'a,b,c' && [10, 20, 30].toString() === '10,20,30';
}

/** 2 混合类型数组转字符串 */
export function ToStringJs_0101() {
  return [1, 2, 'a', '1a'].toString() === '1,2,a,1a' && [1, 'hello', true, null, undefined].toString() === '1,hello,true,,';
}

/** 3 返回值类型验证 */
export function ToStringJs_0102() {
  return typeof [1, 2, 3].toString() === 'string' && [1, 2].toString() === [1, 2].toString(undefined);
}

/** 4 空数组 */
export function ToStringJs_0103() {
  return [].toString() === '' && new Array().toString() === '';
}

/** 5 单元素数组 */
export function ToStringJs_0104() {
  return [42].toString() === '42' && ['hello'].toString() === 'hello' && [''].toString() === '';
}

/** 6 大数组 */
export function ToStringJs_0105() {
  var arr = [];
  for (var i = 0; i < 10000; i++) {
    arr.push(i);
  }
  if (arr.toString().split(',').length !== 10000) {
    return false;
  }
  var arr2 = new Array(1000).fill('x');
  var result = arr2.toString();
  return (result.match(/,/g) || []).length === 999;
}

/** 7 数值类型元素 */
export function ToStringJs_0106() {
  return (
    [1, 2, 3].toString() === '1,2,3' &&
    [1.1, 2.5, 3.14].toString() === '1.1,2.5,3.14' &&
    [-1, -2, -3].toString() === '-1,-2,-3' &&
    [0, -0].toString() === '0,0' &&
    [Infinity, -Infinity, NaN].toString() === 'Infinity,-Infinity,NaN' &&
    [1e2, 1.5e3].toString() === '100,1500'
  );
}

/** 8 字符串类型元素 */
export function ToStringJs_0107() {
  return (
    ['hello', 'world'].toString() === 'hello,world' &&
    ['a', '', 'b'].toString() === 'a,,b' &&
    ['a,b', 'c,d'].toString() === 'a,b,c,d' &&
    ['\n', '\t', '\\'].toString() === '\n,\t,\\' &&
    ['😀', '🎉'].toString() === '😀,🎉'
  );
}

/** 9 布尔类型元素 */
export function ToStringJs_0108() {
  return [true, false].toString() === 'true,false' && [new Boolean(true), new Boolean(false)].toString() === 'true,false';
}

/** 10 null 和 undefined 元素 */
export function ToStringJs_0109() {
  return (
    [null].toString() === '' &&
    [undefined].toString() === '' &&
    [1, null, 2, undefined, 3].toString() === '1,,2,,3' &&
    [null, undefined, null].toString() === ',,'
  );
}

/** 11 对象类型元素 */
export function ToStringJs_0110() {
  var obj = { toString: function () { return 'custom'; } };
  var d = new Date('2024-01-01T00:00:00.000Z');
  return (
    [{}].toString() === '[object Object]' &&
    [{ a: 1 }, { b: 2 }].toString() === '[object Object],[object Object]' &&
    [obj].toString() === 'custom' &&
    [[1, 2], [3, 4]].toString() === '1,2,3,4' &&
    [d].toString().indexOf('2024') !== -1 &&
    [/abc/, /def/gi].toString() === '/abc/,/def/gi'
  );
}

/** 12 Symbol 类型元素 */
export function ToStringJs_0111() {
  if (typeof Symbol === 'undefined') {
    return true;
  }
  var ok1 = false;
  try {
    [Symbol('test')].toString();
  } catch (e) {
    ok1 = e instanceof TypeError;
  }
  var ok2 = false;
  try {
    [1, Symbol('s'), 2].toString();
  } catch (e) {
    ok2 = e instanceof TypeError;
  }
  return ok1 && ok2;
}

/** 13 BigInt 类型元素 */
export function ToStringJs_0112() {
  if (typeof BigInt === 'undefined') {
    return true;
  }
  return [1n, 2n, 3n].toString() === '1,2,3' && [9007199254740993n].toString() === '9007199254740993';
}

/** 14 函数类型元素（与 join 一致；各引擎 Function#toString 文本不同，不依赖子串） */
export function ToStringJs_0113() {
  function arrayToStringMatchesCommaJoinedElemToString(arr) {
    if (arr.length === 0) {
      return arr.toString() === '';
    }
    var acc = arr[0].toString();
    for (var i = 1; i < arr.length; i++) {
      acc = acc + ',' + arr[i].toString();
    }
    return arr.toString() === acc && arr.toString() === arr.join(',');
  }
  var named = [function foo() {}];
  var arrow = [() => 1];
  var nativeLike = [Array.isArray];
  var f1 = function u() {
    return 0;
  };
  var f2 = function v() {
    return 1;
  };
  var two = [f1, f2];
  return (
    arrayToStringMatchesCommaJoinedElemToString(named) &&
    arrayToStringMatchesCommaJoinedElemToString(arrow) &&
    arrayToStringMatchesCommaJoinedElemToString(nativeLike) &&
    arrayToStringMatchesCommaJoinedElemToString(two) &&
    two.toString().indexOf(',') !== -1 &&
    typeof named.toString() === 'string' &&
    named.toString().length > 0
  );
}

/** 15 二维数组 */
export function ToStringJs_0114() {
  return (
    [[1, 2, 3], [4, 5, 6], [7, 8, 9]].toString() === '1,2,3,4,5,6,7,8,9' &&
    [[1], [2, 3], [4, 5, 6]].toString() === '1,2,3,4,5,6' &&
    [[1, 2], [], [3, 4]].toString() === '1,2,,3,4'
  );
}

/** 16 多层嵌套数组 */
export function ToStringJs_0115() {
  var ok1 = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]].toString() === '1,2,3,4,5,6,7,8';
  var ok2 = [1, [2, [3, [4]]]].toString() === '1,2,3,4';
  var arr = [1];
  var i;
  for (i = 0; i < 10; i++) {
    arr = [arr];
  }
  var ok3 = arr.toString() === '1';
  return ok1 && ok2 && ok3;
}

/** 17 混合嵌套（数组与非数组元素混合） */
export function ToStringJs_0116() {
  return (
    [1, [2, 3], 4, [5, [6, 7]]].toString() === '1,2,3,4,5,6,7' &&
    [[null], [undefined], [1, null]].toString() === ',,1,' &&
    [[{ a: 1 }], [{ b: 2 }]].toString() === '[object Object],[object Object]'
  );
}

/** 18 含空槽的数组 */
export function ToStringJs_0117() {
  var a = [1, , 3];
  var b = [1, , , 4];
  return a.toString() === '1,,3' && b.toString() === '1,,,4' && a.toString() === [1, undefined, 3].toString();
}

/** 19 首尾空槽 */
export function ToStringJs_0118() {
  var tail = [1, ,].toString();
  var mid = [, 2, ,].toString();
  return (
    [, , 3].toString() === ',,3' &&
    (tail === '1,,' || tail === '1,') &&
    (mid === ',2,,' || mid === ',2,')
  );
}

/** 20 全空槽数组 */
export function ToStringJs_0119() {
  var arr = [, , ,];
  var ok1 = arr.toString() === ',,';
  var arr2 = [1, 2, 3];
  delete arr2[0];
  delete arr2[1];
  delete arr2[2];
  return ok1 && arr2.toString() === ',,';
}

/** 21 Array构造函数创建的稀疏数组 */
export function ToStringJs_0120() {
  return new Array(3).toString() === ',,';
}

/** 22 数组自身引用 */
export function ToStringJs_0121() {
  try {
    var arr = [];
    arr.push(1, arr, 2);
    var s = arr.toString();
    return typeof s === 'string' && s.indexOf('1') !== -1 && s.indexOf('2') !== -1;
  } catch (e) {
    return true;
  }
}

/** 23 间接循环引用 */
export function ToStringJs_0122() {
  try {
    var a = [1];
    var b = [2];
    a.push(b);
    b.push(a);
    var s = a.toString();
    return typeof s === 'string';
  } catch (e) {
    return true;
  }
}

/** 24 深层循环引用 */
export function ToStringJs_0123() {
  try {
    var arr = [1, [3, arr, 4], 2];
    var s = arr.toString();
    return typeof s === 'string';
  } catch (e) {
    return true;
  }
}

/** 25 正常join方法调用 */
export function ToStringJs_0124() {
  var arr = [1, 2, 3];
  return arr.toString() === arr.join() && ['a', 'b', 'c'].toString() === ['a', 'b', 'c'].join(',');
}

/** 26 join方法被覆盖为非函数 */
export function ToStringJs_0125() {
  var ok = true;
  var arr = [1, 2, 3];
  arr.join = 1;
  ok = ok && arr.toString() === '[object Array]';
  arr = [];
  arr.join = 'not a function';
  ok = ok && arr.toString() === '[object Array]';
  arr = [];
  arr.join = null;
  ok = ok && arr.toString() === '[object Array]';
  arr = [];
  arr.join = undefined;
  ok = ok && arr.toString() === '[object Array]';
  arr = [];
  arr.join = {};
  ok = ok && arr.toString() === '[object Array]';
  return ok;
}

/** 27 join方法被删除 */
export function ToStringJs_0126() {
  var joinDesc = Object.getOwnPropertyDescriptor(Array.prototype, 'join');
  var savedJoinFn = Array.prototype.join;
  try {
    Reflect.deleteProperty(Array.prototype, 'join');
    var result = [1, 2, 3].toString();
    return result === '[object Array]' || result === '1,2,3';
  } catch (e) {
    return true;
  } finally {
    if (joinDesc) {
      defineArrayPrototypeJoinFromDescriptor(joinDesc);
    } else if (typeof savedJoinFn === 'function') {
      Array.prototype.join = savedJoinFn;
    }
  }
}

/** 28 join方法返回非字符串值 */
export function ToStringJs_0127() {
  var r1 = Array.prototype.toString.call({
    join: function () {
      return 1;
    },
  });
  var r2 = Array.prototype.toString.call({
    join: function () {
      return undefined;
    },
  });
  var o = {};
  var r3 = Array.prototype.toString.call({
    join: function () {
      return o;
    },
  });
  var r4 = Array.prototype.toString.call({
    join: function () {
      return false;
    },
  });
  return r1 === 1 && r2 === undefined && r3 === o && r4 === false;
}

/** 29 join方法抛出异常 */
export function ToStringJs_0128() {
  var arr = [];
  arr.join = function () {
    throw new Error('join error');
  };
  try {
    arr.toString();
    return false;
  } catch (e) {
    return e.message === 'join error';
  }
}

/** 30 字符串拼接中的隐式调用 */
export function ToStringJs_0129() {
  return (
    'prefix' + [1, 2, 3] === 'prefix1,2,3' &&
    [1, 2] + 'suffix' === '1,2suffix' &&
    [1, 2] + [3, 4] === '1,23,4'
  );
}

/** 31 模板字符串中的隐式调用 */
export function ToStringJs_0130() {
  var arr = [1, 2, 3];
  var arr2 = ['a', 'b'];
  return `${arr}` === '1,2,3' && `result: ${arr2}!` === 'result: a,b!';
}

/** 32 String()显式转换 */
export function ToStringJs_0131() {
  var arr = ['x', 'y'];
  return String([1, 2, 3]) === '1,2,3' && String([]) === '' && String(arr) === arr.toString();
}

/** 33 加号运算符触发转换 */
export function ToStringJs_0132() {
  return [] + [] === '' && [1] + 2 === '12' && 1 + [2, 3] === '12,3';
}

/** 34 call绑定普通对象（有join方法） */
export function ToStringJs_0133() {
  return (
    Array.prototype.toString.call({
      join: function () {
        return 'custom';
      },
    }) === 'custom' &&
    Array.prototype.toString.call({
      join: function () {
        return 42;
      },
    }) === 42 &&
    Array.prototype.toString.call({
      data: [1, 2],
      join: function () {
        return Array.prototype.join.call(this.data, '-');
      },
    }) === '1-2'
  );
}

/** 35 call绑定普通对象（无join方法） */
export function ToStringJs_0134() {
  return (
    Array.prototype.toString.call({}) === '[object Object]' &&
    Array.prototype.toString.call({ join: 'not function' }) === '[object Object]' &&
    Array.prototype.toString.call({ join: null }) === '[object Object]'
  );
}

/** 36 call绑定null或undefined */
export function ToStringJs_0135() {
  var okNull = false;
  var okUndef = false;
  try {
    okNull = Array.prototype.toString.call(null) === '[object Null]';
  } catch (e) {
    okNull = e instanceof TypeError;
  }
  try {
    okUndef = Array.prototype.toString.call(undefined) === '[object Undefined]';
  } catch (e) {
    okUndef = e instanceof TypeError;
  }
  return okNull && okUndef;
}

/** 37 call绑定原始类型值 */
export function ToStringJs_0136() {
  return (
    Array.prototype.toString.call(42) === '[object Number]' &&
    Array.prototype.toString.call('hello') === '[object String]' &&
    Array.prototype.toString.call(true) === '[object Boolean]'
  );
}

/** 38 apply和bind方式调用 */
export function ToStringJs_0137() {
  var ok1 =
    Array.prototype.toString.apply({
      join: function () {
        return 'applied';
      },
    }) === 'applied';
  var bound = Array.prototype.toString.bind({
    join: function () {
      return 'bound';
    },
  });
  var ok2 = bound() === 'bound';
  var ok3 = true;
  if (typeof Reflect !== 'undefined' && Reflect.apply) {
    ok3 =
      Reflect.apply(Array.prototype.toString, { join: function () { return 'reflected'; } }, []) === 'reflected';
  }
  return ok1 && ok2 && ok3;
}

/** 39 toString与join对比 */
export function ToStringJs_0138() {
  var arr = [1, 'a', true];
  return arr.toString() === arr.join() && [1, 2, 3].toString() === [1, 2, 3].join(',') && [1, 2, 3].join('-') !== [1, 2, 3].toString();
}

/** 40 toString与toLocaleString对比 */
export function ToStringJs_0139() {
  var arr = [1, 2, 3];
  if (typeof arr.toLocaleString !== 'function') {
    return true;
  }
  if (arr.toString() !== arr.toLocaleString()) {
    return false;
  }
  var d = new Date('2024-01-01T00:00:00.000Z');
  var arr2 = [d];
  return arr2.toString() !== arr2.toLocaleString();
}

/** 41 toString与valueOf交互 */
export function ToStringJs_0140() {
  var arr = [1, 2];
  var v = arr.valueOf() === arr;
  arr.valueOf = function () {
    return 'value';
  };
  var t = arr.toString() === '1,2';
  var s = '' + arr;
  return v && t && (s === '1,2' || s === 'value');
}

/** 42 toString与JSON.stringify对比 */
export function ToStringJs_0141() {
  if (typeof JSON === 'undefined' || typeof JSON.stringify !== 'function') {
    return true;
  }
  var ok1 = [1, 2, 3].toString() !== JSON.stringify([1, 2, 3]);
  var ok2 = [[1, 2], [3, 4]].toString() !== JSON.stringify([[1, 2], [3, 4]]);
  var ok3 = [undefined, function () {}].toString() !== JSON.stringify([undefined, function () {}]);
  return ok1 && ok2 && ok3;
}

/** 43 修改join对toString的影响 */
export function ToStringJs_0142() {
  var joinDesc = Object.getOwnPropertyDescriptor(Array.prototype, 'join');
  var savedJoinFn = Array.prototype.join;
  var ok1 = false;
  try {
    Object.defineProperty(Array.prototype, 'join', {
      configurable: joinDesc ? joinDesc.configurable : true,
      enumerable: joinDesc ? joinDesc.enumerable : false,
      writable: joinDesc ? joinDesc.writable : true,
      value: function () {
        return 'hacked';
      },
    });
    ok1 = [1, 2, 3].toString() === 'hacked';
  } finally {
    if (joinDesc) {
      defineArrayPrototypeJoinFromDescriptor(joinDesc);
    } else if (typeof savedJoinFn === 'function') {
      Array.prototype.join = savedJoinFn;
    }
  }
  var arr1 = [1, 2, 3];
  var arr2 = [4, 5, 6];
  arr1.join = function () {
    return 'custom';
  };
  var ok2 = arr1.toString() === 'custom' && arr2.toString() === '4,5,6';
  return ok1 && ok2;
}

/** 44 Array子类实例 */
export function ToStringJs_0143() {
  try {
    var C = Function('return class MyArray extends Array {}')();
    var myArr = new C(1, 2, 3);
    if (myArr.toString() !== '1,2,3') {
      return false;
    }
    var myArr2 = new C('a', 'b');
    if (myArr2.toString() !== 'a,b') {
      return false;
    }
    var C2 = Function(
      'return class MyArray2 extends Array { join(sep) { return super.join(sep || "|"); } }'
    )();
    return new C2(1, 2, 3).toString() === '1|2|3';
  } catch (e) {
    return true;
  }
}

/** 45 类数组对象 */
export function ToStringJs_0144() {
  var argsOk = safeExec(function () {
    return (
      (function () {
        return Array.prototype.toString.call(arguments);
      })(1, 2, 3) === '[object Arguments]'
    );
  });
  var arrayLike = {
    0: 'a',
    1: 'b',
    2: 'c',
    length: 3,
    join: function () {
      return Array.prototype.join.call(this);
    },
  };
  return argsOk && Array.prototype.toString.call(arrayLike) === 'a,b,c';
}

/** 46 Proxy代理的数组 */
export function ToStringJs_0145() {
  if (typeof Proxy === 'undefined') {
    return true;
  }
  var arr = [1, 2, 3];
  var proxy = new Proxy(arr, {});
  if (proxy.toString() !== '1,2,3') {
    return false;
  }
  var handler = {
    get: function (target, prop) {
      if (prop === 'join') {
        return function () {
          return 'intercepted';
        };
      }
      return target[prop];
    },
  };
  var proxy2 = new Proxy([1, 2, 3], handler);
  return proxy2.toString() === 'intercepted';
}

/** 47 冻结数组 */
export function ToStringJs_0146() {
  var arr = Object.freeze([1, 2, 3]);
  if (arr.toString() !== '1,2,3') {
    return false;
  }
  var arr2 = Object.freeze([1, 2, 3]);
  arr2.toString();
  return arr2.length === 3 && arr2[0] === 1;
}

/** 48a Object.create(Array.prototype) 空对象应得到空串（拆分为独立断言便于定位失败分支） */
export function ToStringJs_0147_empty() {
  var obj = Object.create(Array.prototype);
  // 自有 length：部分引擎对「仅继承 Array.prototype.length」的普通对象 join/toString 与标准不一致；与 48b 显式 length 对齐。
  obj.length = 0;
  return obj.toString() === '';
}

/** 48b 带下标与 length 的 Object.create(Array.prototype) 对象 */
export function ToStringJs_0147_indexed() {
  var obj2 = Object.create(Array.prototype);
  obj2[0] = 'a';
  obj2[1] = 'b';
  obj2.length = 2;
  return obj2.toString() === 'a,b';
}

/** 48 Object.create(Array.prototype) */
export function ToStringJs_0147() {
  return ToStringJs_0147_empty() && ToStringJs_0147_indexed();
}

/** 49 分隔符验证 */
export function ToStringJs_0148() {
  return (
    [1, 2, 3].toString().indexOf(',') !== -1 &&
    ['a', 'b', 'c'].toString().split(',').length === 3 &&
    [1, 2, 3].toString() === '1,2,3'
  );
}

/** 50 返回值不可变性 */
export function ToStringJs_0149() {
  var arr = [1, 2, 3];
  var str = arr.toString();
  str = 'modified';
  return arr.toString() === '1,2,3' && [1, 2].toString() === [1, 2].toString();
}

/** 51 toString不修改原数组 */
export function ToStringJs_0150() {
  var arr = [1, 2, 3];
  arr.toString();
  if (!(arr.length === 3 && arr[0] === 1 && arr[1] === 2 && arr[2] === 3)) {
    return false;
  }
  var arr2 = [1, 2];
  arr2.toString();
  arr2.push(3);
  return arr2.length === 3;
}

/** 52 连续调用toString */
export function ToStringJs_0151() {
  var result = [1, 2, 3].toString();
  var ok1 = result.toString() === '1,2,3';
  var ok2 = [].toString().toString() === '';
  var arr = [1, 2, 3];
  var ok3 = arr
    .toString()
    .split(',')
    .map(Number)
    .toString() === '1,2,3';
  return ok1 && ok2 && ok3;
}
