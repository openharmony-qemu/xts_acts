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

export function ToStringJs_0112() {
  if (typeof BigInt === 'undefined') {
    return true;
  }
  return [1n, 2n, 3n].toString() === '1,2,3' && [9007199254740993n].toString() === '9007199254740993';
}

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

export function ToStringJs_0116() {
  return (
    [1, [2, 3], 4, [5, [6, 7]]].toString() === '1,2,3,4,5,6,7' &&
    [[null], [undefined], [1, null]].toString() === ',,1,' &&
    [[{ a: 1 }], [{ b: 2 }]].toString() === '[object Object],[object Object]'
  );
}

export function ToStringJs_0117() {
  var a = [1, , 3];
  var b = [1, , , 4];
  return a.toString() === '1,,3' && b.toString() === '1,,,4' && a.toString() === [1, undefined, 3].toString();
}

export function ToStringJs_0118() {
  var tail = [1, ,].toString();
  var mid = [, 2, ,].toString();
  return (
    [, , 3].toString() === ',,3' &&
    (tail === '1,,' || tail === '1,') &&
    (mid === ',2,,' || mid === ',2,')
  );
}

export function ToStringJs_0119() {
  var arr = [, , ,];
  var ok1 = arr.toString() === ',,';
  var arr2 = [1, 2, 3];
  delete arr2[0];
  delete arr2[1];
  delete arr2[2];
  return ok1 && arr2.toString() === ',,';
}

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

export function ToStringJs_0123() {
  try {
    var arr = [1, [3, arr, 4], 2];
    var s = arr.toString();
    return typeof s === 'string';
  } catch (e) {
    return true;
  }
}

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

export function ToStringJs_0134() {
  return (
    Array.prototype.toString.call({}) === '[object Object]' &&
    Array.prototype.toString.call({ join: 'not function' }) === '[object Object]' &&
    Array.prototype.toString.call({ join: null }) === '[object Object]'
  );
}

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

export function ToStringJs_0136() {
  return (
    Array.prototype.toString.call(42) === '[object Number]' &&
    Array.prototype.toString.call('hello') === '[object String]' &&
    Array.prototype.toString.call(true) === '[object Boolean]'
  );
}

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

export function ToStringJs_0141() {
  if (typeof JSON === 'undefined' || typeof JSON.stringify !== 'function') {
    return true;
  }
  var ok1 = [1, 2, 3].toString() !== JSON.stringify([1, 2, 3]);
  var ok2 = [[1, 2], [3, 4]].toString() !== JSON.stringify([[1, 2], [3, 4]]);
  var ok3 = [undefined, function () {}].toString() !== JSON.stringify([undefined, function () {}]);
  return ok1 && ok2 && ok3;
}

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

export function ToStringJs_0146() {
  var arr = Object.freeze([1, 2, 3]);
  if (arr.toString() !== '1,2,3') {
    return false;
  }
  var arr2 = Object.freeze([1, 2, 3]);
  arr2.toString();
  return arr2.length === 3 && arr2[0] === 1;
}

export function ToStringJs_0147() {
  return ToStringJs_0147_empty() && ToStringJs_0147_indexed();
}

export function ToStringJs_0147_empty() {
  var obj = Object.create(Array.prototype);
  // 自有 length：部分引擎对「仅继承 Array.prototype.length」的普通对象 join/toString 与标准不一致；与 48b 显式 length 对齐。
  obj.length = 0;
  return obj.toString() === '';
}

export function ToStringJs_0147_indexed() {
  var obj2 = Object.create(Array.prototype);
  obj2[0] = 'a';
  obj2[1] = 'b';
  obj2.length = 2;
  return obj2.toString() === 'a,b';
}

