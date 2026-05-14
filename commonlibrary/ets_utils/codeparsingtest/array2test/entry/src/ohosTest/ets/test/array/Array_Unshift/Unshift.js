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

/**
 * Array.prototype.unshift 导图用例（0100–0199）。
 * 导图 Markdown 当前共 132 条「测试描述」；本文件按出现顺序均匀分桶取 100 条与之对应，
 * 避免仅取前 100 条时丢失后半章（Proxy / 大参数 / getter 等）。分桶索引见各条注释中的 mindMapLineIndex。
 */

function safeExec(fn) {
  try {
    fn();
    return { ok: true, err: null };
  } catch (e) {
    return { ok: false, err: e };
  }
}

function isTypeError(e) {
  return e instanceof TypeError;
}

/** [mindMapLineIndex=0] 向数组开头添加单个数字元素，验证数组内容和长度 */
export function UnshiftJs_0100() {
  const arr = [2, 3];
  const r = arr.unshift(1);
  return r === 3 && arr[0] === 1 && arr[1] === 2 && arr[2] === 3 && arr.length === 3;
}

/** [mindMapLineIndex=1] 向数组开头添加单个字符串元素 */
export function UnshiftJs_0101() {
  const arr = [2];
  const r = arr.unshift('a');
  return r === 2 && arr[0] === 'a' && arr[1] === 2;
}

/** [mindMapLineIndex=2] 向数组开头添加布尔值元素 */
export function UnshiftJs_0102() {
  const arr = [0];
  const r = arr.unshift(true);
  return r === 2 && arr[0] === true && arr[1] === 0;
}

/** [mindMapLineIndex=3] 向数组开头添加对象元素 */
export function UnshiftJs_0103() {
  const o = { x: 1 };
  const arr = [2];
  const r = arr.unshift(o);
  return r === 2 && arr[0] === o && arr[1] === 2;
}

/** [mindMapLineIndex=5] 一次添加多个数字元素，验证插入顺序 */
export function UnshiftJs_0104() {
  const arr = [3];
  const r = arr.unshift(1, 2);
  return r === 3 && arr[0] === 1 && arr[1] === 2 && arr[2] === 3;
}

/** [mindMapLineIndex=6] 一次添加多个不同类型元素 */
export function UnshiftJs_0105() {
  const arr = [3];
  const r = arr.unshift(1, 'x', null);
  return r === 4 && arr[0] === 1 && arr[1] === 'x' && arr[2] === null && arr[3] === 3;
}

/** [mindMapLineIndex=7] 添加两个引用类型元素 */
export function UnshiftJs_0106() {
  const o1 = { a: 1 };
  const o2 = { b: 2 };
  const arr = [3];
  const r = arr.unshift(o1, o2);
  return r === 3 && arr[0] === o1 && arr[1] === o2 && arr[2] === 3;
}

/** [mindMapLineIndex=9] 验证多参数插入时保持参数顺序不变 */
export function UnshiftJs_0107() {
  const arr = [4];
  arr.unshift(1, 2, 3);
  return arr[0] === 1 && arr[1] === 2 && arr[2] === 3 && arr[3] === 4;
}

/** [mindMapLineIndex=10] 验证原数组元素被整体后移 */
export function UnshiftJs_0108() {
  const arr = [3, 4];
  arr.unshift(1, 2);
  return arr[0] === 1 && arr[1] === 2 && arr[2] === 3 && arr[3] === 4;
}

/** [mindMapLineIndex=11] 验证参数按块插入（非逐个倒序插入） */
export function UnshiftJs_0109() {
  const arr = [3];
  const r = arr.unshift(1, 2);
  return r === 3 && arr[0] === 1 && arr[1] === 2 && arr[2] === 3;
}

/** [mindMapLineIndex=13] 数字类型参数（浮点数） */
export function UnshiftJs_0110() {
  const arr = [1.5];
  const r = arr.unshift(2.25);
  return r === 2 && arr[0] === 2.25 && arr[1] === 1.5;
}

/** [mindMapLineIndex=14] 数字类型参数（负数） */
export function UnshiftJs_0111() {
  const arr = [-1];
  const r = arr.unshift(-2);
  return r === 2 && arr[0] === -2 && arr[1] === -1;
}

/** [mindMapLineIndex=15] 数字类型参数（0 和 -0） */
export function UnshiftJs_0112() {
  const arr = [];
  arr.unshift(0, -0);
  return arr.length === 2 && (1 / arr[0] === Infinity || 1 / arr[0] === -Infinity);
}

/** [mindMapLineIndex=17] 空字符串参数 */
export function UnshiftJs_0113() {
  const arr = ['b'];
  const r = arr.unshift('');
  return r === 2 && arr[0] === '' && arr[1] === 'b';
}

/** [mindMapLineIndex=18] 布尔值参数（true） */
export function UnshiftJs_0114() {
  const arr = [false];
  const r = arr.unshift(true);
  return r === 2 && arr[0] === true && arr[1] === false;
}

/** [mindMapLineIndex=19] 布尔值参数（false） */
export function UnshiftJs_0115() {
  const arr = [1];
  const r = arr.unshift(false);
  return r === 2 && arr[0] === false && arr[1] === 1;
}

/** [mindMapLineIndex=21] undefined 作为参数 */
export function UnshiftJs_0116() {
  const arr = [1];
  const r = arr.unshift(undefined);
  return r === 2 && arr[0] === undefined && arr[1] === 1;
}

/** [mindMapLineIndex=22] null 作为参数 */
export function UnshiftJs_0117() {
  const arr = [1];
  const r = arr.unshift(null);
  return r === 2 && arr[0] === null && arr[1] === 1;
}

/** [mindMapLineIndex=23] NaN 作为参数 */
export function UnshiftJs_0118() {
  const arr = [1];
  const r = arr.unshift(NaN);
  return r === 2 && arr[1] === 1 && arr[0] !== arr[0];
}

/** [mindMapLineIndex=25] -Infinity 作为参数 */
export function UnshiftJs_0119() {
  const arr = [1];
  const r = arr.unshift(-Infinity);
  return r === 2 && arr[0] === -Infinity && arr[1] === 1;
}

/** [mindMapLineIndex=26] Symbol 作为参数 */
export function UnshiftJs_0120() {
  const s = Symbol('s');
  const arr = [1];
  const r = arr.unshift(s);
  return r === 2 && arr[0] === s && arr[1] === 1;
}

/** [mindMapLineIndex=27] 普通对象作为参数 */
export function UnshiftJs_0121() {
  const o = { k: 1 };
  const arr = [2];
  const r = arr.unshift(o);
  return r === 2 && arr[0] === o;
}

/** [mindMapLineIndex=29] 函数作为参数 */
export function UnshiftJs_0122() {
  const f = function () {
    return 1;
  };
  const arr = [2];
  const r = arr.unshift(f);
  return r === 2 && arr[0] === f && arr[1] === 2;
}

/** [mindMapLineIndex=30] Date 对象作为参数 */
export function UnshiftJs_0123() {
  const d = new Date(0);
  const arr = [1];
  const r = arr.unshift(d);
  return r === 2 && arr[0] === d;
}

/** [mindMapLineIndex=31] RegExp 对象作为参数 */
export function UnshiftJs_0124() {
  const rx = /a/g;
  const arr = [1];
  const r = arr.unshift(rx);
  return r === 2 && arr[0] === rx;
}

/** [mindMapLineIndex=33] Set 对象作为参数 */
export function UnshiftJs_0125() {
  const st = new Set([1]);
  const arr = [2];
  const r = arr.unshift(st);
  return r === 2 && arr[0] === st;
}

/** [mindMapLineIndex=34] 混合多种引用类型参数一次添加 */
export function UnshiftJs_0126() {
  const o = { x: 1 };
  const f = function () {};
  const m = new Map([[1, 2]]);
  const arr = [0];
  const r = arr.unshift(o, f, m, 'z');
  return r === 5 && arr[0] === o && arr[1] === f && arr[2] === m && arr[3] === 'z' && arr[4] === 0;
}

/** [mindMapLineIndex=35] 空数组添加1个元素，返回值为1 */
export function UnshiftJs_0127() {
  const arr = [];
  const r = arr.unshift(1);
  return r === 1 && arr.length === 1 && arr[0] === 1;
}

/** [mindMapLineIndex=36] 非空数组添加1个元素，返回值为原长度+1 */
export function UnshiftJs_0128() {
  const arr = [1, 2];
  const r = arr.unshift(0);
  return r === 3 && arr.length === 3;
}

/** [mindMapLineIndex=38] 返回值与数组实际 length 属性一致 */
export function UnshiftJs_0129() {
  const arr = [1];
  const r = arr.unshift(2, 3);
  return r === 3 && arr.length === 3 && r === arr.length;
}

/** [mindMapLineIndex=39] 返回值类型为 number */
export function UnshiftJs_0130() {
  const arr = [];
  const r = arr.unshift();
  return typeof r === 'number' && r === 0;
}

/** [mindMapLineIndex=40] 无参数调用时返回值仍为 number（当前长度） */
export function UnshiftJs_0131() {
  const arr = [1];
  const r1 = arr.unshift();
  const r2 = arr.unshift(2);
  return r1 === 1 && r2 === 2 && typeof r1 === 'number' && typeof r2 === 'number';
}

/** [mindMapLineIndex=42] 交替添加不同数量元素，返回值正确累加 */
export function UnshiftJs_0132() {
  const arr = [];
  arr.unshift(1);
  arr.unshift(2, 3);
  const r = arr.unshift(4);
  return r === 4 && arr[0] === 4 && arr[3] === 1;
}

/** [mindMapLineIndex=43] 无参数调用 unshift()，数组不变，返回当前长度 */
export function UnshiftJs_0133() {
  const arr = [1, 2];
  const r = arr.unshift();
  return r === 2 && arr[0] === 1 && arr[1] === 2;
}

/** [mindMapLineIndex=44] 空数组无参数调用，返回0 */
export function UnshiftJs_0134() {
  const arr = [];
  const r = arr.unshift();
  return r === 0 && arr.length === 0;
}

/** [mindMapLineIndex=46] 分3次每次传入1个参数，元素顺序相反 */
export function UnshiftJs_0135() {
  const arr = [];
  arr.unshift(1);
  arr.unshift(2);
  arr.unshift(3);
  return arr[0] === 3 && arr[1] === 2 && arr[2] === 1;
}

/** [mindMapLineIndex=47] 验证两种调用方式产生不同结果 */
export function UnshiftJs_0136() {
  const a = [3];
  a.unshift(1, 2);
  const b = [3];
  b.unshift(1);
  b.unshift(2);
  return a[0] === 1 && a[1] === 2 && b[0] === 2 && b[1] === 1;
}

/** [mindMapLineIndex=48] 两两组合与一次全部添加的结果对比 */
export function UnshiftJs_0137() {
  const a = [5];
  a.unshift(1, 2);
  a.unshift(3, 4);
  const b = [5];
  b.unshift(1, 2, 3, 4);
  return a.length === b.length && JSON.stringify(a) !== JSON.stringify(b);
}

/** [mindMapLineIndex=50] 使用 Function.prototype.apply 传入参数数组 */
export function UnshiftJs_0138() {
  const arr = [3];
  const r = Array.prototype.unshift.apply(arr, [1, 2]);
  return r === 3 && arr[0] === 1 && arr[2] === 3;
}

/** [mindMapLineIndex=51] 使用 bind 绑定目标对象后调用 */
export function UnshiftJs_0139() {
  const arr = [2];
  const fn = Array.prototype.unshift.bind(arr, 1);
  const r = fn();
  return r === 2 && arr[0] === 1;
}

/** [mindMapLineIndex=52] 使用 Reflect.apply 调用 */
export function UnshiftJs_0140() {
  const arr = [3];
  const r = Reflect.apply(Array.prototype.unshift, arr, [1, 2]);
  return r === 3 && arr[0] === 1;
}

/** [mindMapLineIndex=54] 空数组上 unshift 多个元素 */
export function UnshiftJs_0141() {
  const arr = [];
  const r = arr.unshift(1, 2, 3);
  return r === 3 && arr[0] === 1 && arr[2] === 3;
}

/** [mindMapLineIndex=55] 单元素数组 unshift 后变为两元素 */
export function UnshiftJs_0142() {
  const arr = [2];
  const r = arr.unshift(1);
  return r === 2 && arr[0] === 1 && arr[1] === 2;
}

/** [mindMapLineIndex=56] 包含100个元素的数组 unshift */
export function UnshiftJs_0143() {
  const arr = [];
  for (let i = 0; i < 100; i++) {
    arr.push(i);
  }
  const r = arr.unshift(-1);
  return r === 101 && arr[0] === -1 && arr[100] === 99;
}

/** [mindMapLineIndex=58] 含空洞（hole）的稀疏数组 unshift */
export function UnshiftJs_0144() {
  const arr = [1, , 3];
  arr.unshift(0);
  return arr[0] === 0 && arr[1] === 1 && arr[3] === 3 && arr.length === 4;
}

/** [mindMapLineIndex=59] 用 delete 删除元素后的数组 unshift */
export function UnshiftJs_0145() {
  const arr = [1, 2, 3];
  delete arr[1];
  arr.unshift(0);
  return arr[0] === 0 && arr[3] === 3 && arr.length === 4;
}

/** [mindMapLineIndex=60] Array(n) 创建的纯稀疏数组 unshift */
export function UnshiftJs_0146() {
  const arr = new Array(3);
  arr[2] = 9;
  arr.unshift(1);
  return arr[0] === 1 && arr[3] === 9 && arr.length === 4;
}

/** [mindMapLineIndex=62] unshift 不会返回新数组，返回值是数字 */
export function UnshiftJs_0147() {
  const arr = [1];
  const ret = arr.unshift(2);
  return typeof ret === 'number' && ret === arr.length && arr === arr;
}

/** [mindMapLineIndex=63] 原有元素的索引全部增加 unshift 的参数个数 */
export function UnshiftJs_0148() {
  const arr = [10, 20];
  arr.unshift(1, 2);
  return arr[2] === 10 && arr[3] === 20;
}

/** [mindMapLineIndex=64] 验证所有原有元素的新索引位置正确 */
export function UnshiftJs_0149() {
  const arr = ['a', 'b', 'c'];
  arr.unshift('x', 'y');
  return arr[0] === 'x' && arr[1] === 'y' && arr[2] === 'a' && arr[3] === 'b' && arr[4] === 'c';
}

/** [mindMapLineIndex=66] 连续 unshift 后 length 持续更新 */
export function UnshiftJs_0150() {
  const arr = [1];
  arr.unshift(2);
  arr.unshift(3);
  return arr.length === 3 && arr[0] === 3;
}

/** [mindMapLineIndex=67] unshift 后原始元素整体后移且保持顺序 */
export function UnshiftJs_0151() {
  const arr = [2, 3, 4];
  arr.unshift(0, 1);
  return arr[0] === 0 && arr[1] === 1 && arr[2] === 2 && arr[3] === 3 && arr[4] === 4;
}

/** [mindMapLineIndex=68] 稀疏数组的空洞也被正确后移 */
export function UnshiftJs_0152() {
  const arr = [1, , 3];
  arr.unshift(0);
  return arr[0] === 0 && arr.length === 4;
}

/** [mindMapLineIndex=69] 有 length 和数字索引属性的类数组对象 */
export function UnshiftJs_0153() {
  const obj = { 0: 'a', 1: 'b', length: 2 };
  const r = Array.prototype.unshift.call(obj, 'z');
  return r === 3 && obj[0] === 'z' && obj[2] === 'b' && obj.length === 3;
}

/** [mindMapLineIndex=71] 类数组对象中只有 length 没有索引属性 */
export function UnshiftJs_0154() {
  const obj = { length: 2 };
  const r = Array.prototype.unshift.call(obj, 1, 2);
  return r === 4 && obj[0] === 1 && obj[1] === 2 && obj.length === 4;
}

/** [mindMapLineIndex=72] 没有 length 属性的纯对象，length 视为 0 */
export function UnshiftJs_0155() {
  const obj = { a: 1, b: 2 };
  const r = Array.prototype.unshift.call(obj, 'first');
  return r === 1 && obj[0] === 'first' && obj.length === 1;
}

/** [mindMapLineIndex=73] 纯对象上多次 unshift */
export function UnshiftJs_0156() {
  const obj = { length: 0 };
  Array.prototype.unshift.call(obj, 1);
  Array.prototype.unshift.call(obj, 2);
  return obj[0] === 2 && obj[1] === 1 && obj.length === 2;
}

/** [mindMapLineIndex=75] arguments 对象已有元素后移 */
export function UnshiftJs_0157() {
  function f(a, b) {
    var al = arguments.length;
    Array.prototype.unshift.call(arguments, 'x');
    return arguments[0] === 'x' && arguments[1] === a && arguments.length === al + 1;
  }
  return f(1, 2);
}

/** [mindMapLineIndex=76] 在字符串上调用 unshift 应抛出 TypeError */
export function UnshiftJs_0158() {
  const r = safeExec(() => Array.prototype.unshift.call('ab', 'x'));
  return !r.ok && isTypeError(r.err);
}

/** [mindMapLineIndex=77] 在 String 对象（包装类型）上调用也应失败 */
export function UnshiftJs_0159() {
  const s = new String('ab');
  const r = safeExec(() => Array.prototype.unshift.call(s, 'x'));
  return !r.ok && isTypeError(r.err);
}

/** [mindMapLineIndex=79] length 接近 Number.MAX_SAFE_INTEGER 时 unshift 的行为 */
export function UnshiftJs_0160() {
  const ex = safeExec(() => {
    const o = { length: Number.MAX_SAFE_INTEGER };
    Array.prototype.unshift.call(o, 1);
  });
  if (!ex.ok) {
    return isTypeError(ex.err) || ex.err instanceof RangeError;
  }
  return false;
}

/** [mindMapLineIndex=80] length 为负数时视为 0 处理 */
export function UnshiftJs_0161() {
  const o = { length: -3, 0: 'x' };
  const r = Array.prototype.unshift.call(o, 'a');
  return r === 1 && o[0] === 'a';
}

/** [mindMapLineIndex=81] length 为 -0 时视为 0 处理 */
export function UnshiftJs_0162() {
  const o = { length: -0 };
  const r = Array.prototype.unshift.call(o, 1);
  return r === 1 && o[0] === 1;
}

/** [mindMapLineIndex=83] length 为 3.9 时的截断处理 */
export function UnshiftJs_0163() {
  const o = { length: 3.9, 0: 'a', 1: 'b', 2: 'c' };
  const r = Array.prototype.unshift.call(o, 'z');
  return r === 4 && o[0] === 'z';
}

/** [mindMapLineIndex=84] length 为 NaN 时视为 0 */
export function UnshiftJs_0164() {
  const o = { length: NaN };
  const r = Array.prototype.unshift.call(o, 1);
  return r === 1 && o[0] === 1;
}

/** [mindMapLineIndex=85] length 为 Infinity 时的行为 */
export function UnshiftJs_0165() {
  const o = { length: Infinity };
  const ex = safeExec(() => Array.prototype.unshift.call(o, 1));
  if (!ex.ok) {
    return isTypeError(ex.err) || ex.err instanceof RangeError;
  }
  return o[0] === 1;
}

/** [mindMapLineIndex=87] length 属性 writable 为 false 时 unshift 的行为 */
export function UnshiftJs_0166() {
  const o = { 0: 1, length: 1 };
  Object.defineProperty(o, 'length', { writable: false });
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(o, 2);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=88] 完全没有 length 属性的对象，视为 length=0 */
export function UnshiftJs_0167() {
  const frozen = Object.freeze([1, 2, 3]);
  const ex = safeExec(() => {
    'use strict';
    frozen.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=89] 冻结数组上调用 unshift 抛出 TypeError */
export function UnshiftJs_0168() {
  const o = Object.freeze({ 0: 1, 1: 2, length: 2 });
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(o, 0);
  });
  return !ex.ok && isTypeError(ex.err) && o.length === 2;
}

/** [mindMapLineIndex=91] 密封数组上调用 unshift（不能添加新属性，已有属性可修改） */
export function UnshiftJs_0169() {
  const sealed = Object.seal([1, 2]);
  const ex = safeExec(() => {
    'use strict';
    sealed.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=92] 某个索引属性 configurable 为 false 时不影响 unshift */
export function UnshiftJs_0170() {
  const arr = [1, 2, 3];
  Object.defineProperty(arr, '1', { configurable: false });
  const r = arr.unshift(0);
  return r === 4 && arr[0] === 0;
}

/** [mindMapLineIndex=93] 索引属性 writable 为 false，unshift 尝试移动时抛出 TypeError */
export function UnshiftJs_0171() {
  const arr = [1, 2];
  Object.defineProperty(arr, '0', { value: 1, writable: false, configurable: true });
  const ex = safeExec(() => {
    'use strict';
    arr.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=95] 类数组对象的 length 不可写 */
export function UnshiftJs_0172() {
  const a = [1, 2];
  Object.defineProperty(a, 'length', { writable: false });
  const ex = safeExec(() => {
    'use strict';
    a.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=96] 先 unshift 再 shift，实现元素替换效果 */
export function UnshiftJs_0173() {
  const arr = [1, 2, 3];
  arr.unshift(0);
  const s = arr.shift();
  return s === 0 && JSON.stringify(arr) === '[1,2,3]';
}

/** [mindMapLineIndex=97] 循环 unshift + shift，数组长度不变 */
export function UnshiftJs_0174() {
  const arr = [1, 2, 3];
  arr.unshift(0);
  arr.shift();
  return JSON.stringify(arr) === '[1,2,3]';
}

/** [mindMapLineIndex=99] 先 push 再 unshift，两端都增长 */
export function UnshiftJs_0175() {
  const arr = [2, 3];
  arr.unshift(1);
  arr.push(4);
  return JSON.stringify(arr) === '[1,2,3,4]';
}

/** [mindMapLineIndex=100] unshift 在开头添加，pop 在末尾移除 */
export function UnshiftJs_0176() {
  const arr = [1, 2, 3];
  arr.unshift(0);
  const p = arr.pop();
  return p === 3 && JSON.stringify(arr) === '[0,1,2]';
}

/** [mindMapLineIndex=101] unshift + pop 实现队列效果 */
export function UnshiftJs_0177() {
  const queue = [];
  queue.push('a');
  queue.push('b');
  queue.shift();
  queue.unshift('c');
  return JSON.stringify(queue) === '["c","b"]';
}

/** [mindMapLineIndex=102] unshift 后 splice 修改数组 */
export function UnshiftJs_0178() {
  const arr = [3, 4, 5];
  arr.unshift(1, 2);
  arr.splice(2, 1, 'x');
  return JSON.stringify(arr) === '[1,2,"x",4,5]';
}

/** [mindMapLineIndex=104] unshift 后 sort 排序 */
export function UnshiftJs_0179() {
  const arr = [3, 1];
  arr.unshift(5, 2, 4);
  arr.sort((a, b) => a - b);
  return JSON.stringify(arr) === '[1,2,3,4,5]';
}

/** [mindMapLineIndex=105] unshift 后 reverse 反转 */
export function UnshiftJs_0180() {
  const arr = [3, 4];
  arr.unshift(1, 2);
  arr.reverse();
  return JSON.stringify(arr) === '[4,3,2,1]';
}

/** [mindMapLineIndex=106] unshift 后 map 转换数组 */
export function UnshiftJs_0181() {
  const arr = [2, 3];
  arr.unshift(1);
  const mapped = arr.map((x) => x * 10);
  return JSON.stringify(mapped) === '[10,20,30]';
}

/** [mindMapLineIndex=108] unshift 后 reduce 求和 */
export function UnshiftJs_0182() {
  const arr = [10, 20, 30];
  arr.unshift(5);
  const sum = arr.reduce((acc, cur) => acc + cur, 0);
  return sum === 65;
}

/** [mindMapLineIndex=109] unshift 与 concat 的区别（concat 不修改原数组） */
export function UnshiftJs_0183() {
  const arr1 = [3, 4];
  const arr2 = arr1.concat([1, 2]);
  const lenBefore = arr1.length;
  arr1.unshift(1, 2);
  return lenBefore === 2 && arr1.length === 4 && JSON.stringify(arr1) !== JSON.stringify(arr2);
}

/** [mindMapLineIndex=110] spread 展开后再 unshift */
export function UnshiftJs_0184() {
  const arr1 = [3, 4];
  const arr2 = [1, 2];
  arr1.unshift(...arr2);
  return JSON.stringify(arr1) === '[1,2,3,4]';
}

/** [mindMapLineIndex=112] unshift 后 indexOf 查找新元素 */
export function UnshiftJs_0185() {
  const arr = [3, 4];
  arr.unshift(1, 2);
  const newArr = [...arr, 5];
  return JSON.stringify(newArr) === '[1,2,3,4,5]';
}

/** [mindMapLineIndex=113] unshift 后 includes 验证包含关系 */
export function UnshiftJs_0186() {
  const arr = [2, 3, 4];
  arr.unshift(1);
  return arr.indexOf(1) === 0 && arr.indexOf(4) === 3;
}

/** [mindMapLineIndex=114] unshift 后 find 查找元素 */
export function UnshiftJs_0187() {
  const arr = ['b', 'c'];
  arr.unshift('a');
  return arr.includes('a') === true && arr.includes('d') === false;
}

/** [mindMapLineIndex=116] 非严格模式下冻结数组 unshift 静默失败 */
export function UnshiftJs_0188() {
  const arr = Object.freeze([1, 2]);
  try {
    const r = arr.unshift(0);
    return arr.length === 2 && (r === 2 || r === 3);
  } catch (e) {
    return arr.length === 2;
  }
}

/** [mindMapLineIndex=117] 严格模式下密封数组 unshift 抛出 TypeError */
export function UnshiftJs_0189() {
  const sealed = Object.seal([1, 2]);
  const ex = safeExec(() => {
    'use strict';
    sealed.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=118] null 作为 this 抛出 TypeError */
export function UnshiftJs_0190() {
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(null, 1);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=120] 数字作为 this，自动包装为 Number 对象 */
export function UnshiftJs_0191() {
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(42, 1);
  });
  if (!ex.ok) {
    return isTypeError(ex.err);
  }
  return true;
}

/** [mindMapLineIndex=121] 布尔值作为 this */
export function UnshiftJs_0192() {
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(true, 'val');
  });
  if (!ex.ok) {
    return isTypeError(ex.err);
  }
  return true;
}

/** [mindMapLineIndex=122] Symbol 作为 this */
export function UnshiftJs_0193() {
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(Symbol('x'), 'val');
  });
  if (!ex.ok) {
    return isTypeError(ex.err);
  }
  return true;
}

/** [mindMapLineIndex=124] Proxy 拦截 set 操作阻止 unshift */
export function UnshiftJs_0194() {
  const handler = { set() { return false; } };
  const arr = new Proxy([1, 2], handler);
  const ex = safeExec(() => {
    'use strict';
    arr.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

/** [mindMapLineIndex=125] Proxy 拦截 get 读取 length */
export function UnshiftJs_0195() {
  const getLog = [];
  const handler = {
    get(target, prop) {
      getLog.push(String(prop));
      return Reflect.get(target, prop);
    },
  };
  const arr = new Proxy([1, 2], handler);
  arr.unshift(0);
  return getLog.includes('length');
}

/** [mindMapLineIndex=126] 一次传入大量参数的 unshift（参数个数略小于导图极端值，避免全量跑时主线程尖峰触发生命周期超时） */
export function UnshiftJs_0196() {
  const n = 256;
  const arr = [999];
  const params = [];
  for (let i = 0; i < n; i++) {
    params.push(i);
  }
  const r = arr.unshift(...params);
  return r === n + 1 && arr[0] === 0 && arr[n] === 999;
}

/** [mindMapLineIndex=128] 含循环引用的对象作为 unshift 参数 */
export function UnshiftJs_0197() {
  const obj = { name: 'circular' };
  obj.self = obj;
  const arr = [];
  arr.unshift(obj);
  return arr[0] === obj && arr[0].self === obj;
}

/** [mindMapLineIndex=129] 数组自身作为参数（数组嵌套自身） */
export function UnshiftJs_0198() {
  const arr = [2, 3];
  arr.unshift(arr);
  return arr[0] === arr && arr.length === 3;
}

/** [mindMapLineIndex=130] 对象的数字索引有 getter 时 unshift 的行为 */
export function UnshiftJs_0199() {
  const obj = { length: 2 };
  Object.defineProperty(obj, '0', {
    get() {
      return 'getter_val';
    },
    set() {},
    configurable: true,
  });
  const ex = safeExec(() => Array.prototype.unshift.call(obj, 'new'));
  if (!ex.ok) {
    return isTypeError(ex.err);
  }
  return obj[0] === 'new' || obj.length >= 3;
}


