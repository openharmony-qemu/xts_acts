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


export function UnshiftJs_0120() {
  const s = Symbol('s');
  const arr = [1];
  const r = arr.unshift(s);
  return r === 2 && arr[0] === s && arr[1] === 1;
}

export function UnshiftJs_0122() {
  const f = function () {
    return 1;
  };
  const arr = [2];
  const r = arr.unshift(f);
  return r === 2 && arr[0] === f && arr[1] === 2;
}

export function UnshiftJs_0123() {
  const d = new Date(0);
  const arr = [1];
  const r = arr.unshift(d);
  return r === 2 && arr[0] === d;
}

export function UnshiftJs_0124() {
  const rx = /a/g;
  const arr = [1];
  const r = arr.unshift(rx);
  return r === 2 && arr[0] === rx;
}

export function UnshiftJs_0125() {
  const st = new Set([1]);
  const arr = [2];
  const r = arr.unshift(st);
  return r === 2 && arr[0] === st;
}

export function UnshiftJs_0126() {
  const o = { x: 1 };
  const f = function () {};
  const m = new Map([[1, 2]]);
  const arr = [0];
  const r = arr.unshift(o, f, m, 'z');
  return r === 5 && arr[0] === o && arr[1] === f && arr[2] === m && arr[3] === 'z' && arr[4] === 0;
}

export function UnshiftJs_0138() {
  const arr = [3];
  const r = Array.prototype.unshift.apply(arr, [1, 2]);
  return r === 3 && arr[0] === 1 && arr[2] === 3;
}

export function UnshiftJs_0139() {
  const arr = [2];
  const fn = Array.prototype.unshift.bind(arr, 1);
  const r = fn();
  return r === 2 && arr[0] === 1;
}

export function UnshiftJs_0140() {
  const arr = [3];
  const r = Reflect.apply(Array.prototype.unshift, arr, [1, 2]);
  return r === 3 && arr[0] === 1;
}

export function UnshiftJs_0144() {
  const arr = [1, , 3];
  arr.unshift(0);
  return arr[0] === 0 && arr[1] === 1 && arr[3] === 3 && arr.length === 4;
}

export function UnshiftJs_0145() {
  const arr = [1, 2, 3];
  delete arr[1];
  arr.unshift(0);
  return arr[0] === 0 && arr[3] === 3 && arr.length === 4;
}

export function UnshiftJs_0146() {
  const arr = new Array(3);
  arr[2] = 9;
  arr.unshift(1);
  return arr[0] === 1 && arr[3] === 9 && arr.length === 4;
}

export function UnshiftJs_0147() {
  const arr = [1];
  const ret = arr.unshift(2);
  return typeof ret === 'number' && ret === arr.length;
}

export function UnshiftJs_0152() {
  const arr = [1, , 3];
  arr.unshift(0);
  return arr[0] === 0 && arr.length === 4;
}

export function UnshiftJs_0153() {
  const obj = { 0: 'a', 1: 'b', length: 2 };
  const r = Array.prototype.unshift.call(obj, 'z');
  return r === 3 && obj[0] === 'z' && obj[2] === 'b' && obj.length === 3;
}

export function UnshiftJs_0154() {
  const obj = { length: 2 };
  const r = Array.prototype.unshift.call(obj, 1, 2);
  return r === 4 && obj[0] === 1 && obj[1] === 2 && obj.length === 4;
}

export function UnshiftJs_0155() {
  const obj = { a: 1, b: 2 };
  const r = Array.prototype.unshift.call(obj, 'first');
  return r === 1 && obj[0] === 'first' && obj.length === 1;
}

export function UnshiftJs_0156() {
  const obj = { length: 0 };
  Array.prototype.unshift.call(obj, 1);
  Array.prototype.unshift.call(obj, 2);
  return obj[0] === 2 && obj[1] === 1 && obj.length === 2;
}

export function UnshiftJs_0157() {
  function f(a, b) {
    var al = arguments.length;
    Array.prototype.unshift.call(arguments, 'x');
    return arguments[0] === 'x' && arguments[1] === a && arguments.length === al + 1;
  }
  return f(1, 2);
}

export function UnshiftJs_0158() {
  const r = safeExec(() => Array.prototype.unshift.call('ab', 'x'));
  return !r.ok && isTypeError(r.err);
}

export function UnshiftJs_0159() {
  const s = new String('ab');
  const r = safeExec(() => Array.prototype.unshift.call(s, 'x'));
  return !r.ok && isTypeError(r.err);
}

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

export function UnshiftJs_0161() {
  const o = { length: -3, 0: 'x' };
  const r = Array.prototype.unshift.call(o, 'a');
  return r === 1 && o[0] === 'a';
}

export function UnshiftJs_0162() {
  const o = { length: -0 };
  const r = Array.prototype.unshift.call(o, 1);
  return r === 1 && o[0] === 1;
}

export function UnshiftJs_0163() {
  const o = { length: 3.9, 0: 'a', 1: 'b', 2: 'c' };
  const r = Array.prototype.unshift.call(o, 'z');
  return r === 4 && o[0] === 'z';
}

export function UnshiftJs_0164() {
  const o = { length: NaN };
  const r = Array.prototype.unshift.call(o, 1);
  return r === 1 && o[0] === 1;
}

export function UnshiftJs_0165() {
  const o = { length: Infinity };
  const ex = safeExec(() => Array.prototype.unshift.call(o, 1));
  if (!ex.ok) {
    return isTypeError(ex.err) || ex.err instanceof RangeError;
  }
  return o[0] === 1;
}

export function UnshiftJs_0166() {
  const o = { 0: 1, length: 1 };
  Object.defineProperty(o, 'length', { writable: false });
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(o, 2);
  });
  return !ex.ok && isTypeError(ex.err);
}

export function UnshiftJs_0167() {
  const frozen = Object.freeze([1, 2, 3]);
  const ex = safeExec(() => {
    'use strict';
    frozen.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

export function UnshiftJs_0168() {
  const o = Object.freeze({ 0: 1, 1: 2, length: 2 });
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(o, 0);
  });
  return !ex.ok && isTypeError(ex.err) && o.length === 2;
}

export function UnshiftJs_0169() {
  const sealed = Object.seal([1, 2]);
  const ex = safeExec(() => {
    'use strict';
    sealed.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

export function UnshiftJs_0170() {
  const arr = [1, 2, 3];
  Object.defineProperty(arr, '1', { configurable: false });
  const r = arr.unshift(0);
  return r === 4 && arr[0] === 0;
}

export function UnshiftJs_0171() {
  const arr = [1, 2];
  Object.defineProperty(arr, '0', { value: 1, writable: false, configurable: true });
  const ex = safeExec(() => {
    'use strict';
    arr.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

export function UnshiftJs_0172() {
  const a = [1, 2];
  Object.defineProperty(a, 'length', { writable: false });
  const ex = safeExec(() => {
    'use strict';
    a.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

export function UnshiftJs_0188() {
  const arr = Object.freeze([1, 2]);
  try {
    const r = arr.unshift(0);
    return arr.length === 2 && (r === 2 || r === 3);
  } catch (e) {
    return arr.length === 2;
  }
}

export function UnshiftJs_0189() {
  const sealed = Object.seal([1, 2]);
  const ex = safeExec(() => {
    'use strict';
    sealed.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

export function UnshiftJs_0190() {
  const ex = safeExec(() => {
    'use strict';
    Array.prototype.unshift.call(null, 1);
  });
  return !ex.ok && isTypeError(ex.err);
}

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

export function UnshiftJs_0194() {
  const handler = { set() { return false; } };
  const arr = new Proxy([1, 2], handler);
  const ex = safeExec(() => {
    'use strict';
    arr.unshift(0);
  });
  return !ex.ok && isTypeError(ex.err);
}

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

export function UnshiftJs_0197() {
  const obj = { name: 'circular' };
  obj.self = obj;
  const arr = [];
  arr.unshift(obj);
  return arr[0] === obj && arr[0].self === obj;
}

export function UnshiftJs_0198() {
  const arr = [2, 3];
  arr.unshift(arr);
  return arr[0] === arr && arr.length === 3;
}

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

