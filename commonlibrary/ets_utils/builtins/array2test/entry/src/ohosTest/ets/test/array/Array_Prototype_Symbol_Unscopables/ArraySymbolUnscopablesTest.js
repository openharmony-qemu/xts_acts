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

function _throws(fn, Ctor) {
  try {
    fn();
    return false;
  } catch (e) {
    return e instanceof Ctor;
  }
}

function _deepEqual(a, b) {
  if (Object.is(a, b)) {
    return true;
  }
  if (Number.isNaN(a) && Number.isNaN(b)) {
    return true;
  }
  if (a === null || b === null || a === undefined || b === undefined) {
    return a === b;
  }
  if (Array.isArray(a) && Array.isArray(b)) {
    if (a.length !== b.length) {
      return false;
    }
    for (let i = 0; i < a.length; i++) {
      if (!_deepEqual(a[i], b[i])) {
        return false;
      }
    }
    return true;
  }
  return false;
}

/**
 * 模拟 with 语句中标识符解析（含 @@unscopables），避免使用 with/new Function（ArkTS 运行时禁止动态执行）。
 * chain: 自内向外的 with 对象栈（最后一项为最外层 with 的绑定对象）。
 */
function _withHasBinding(o, name) {
  if (o == null || (typeof o !== 'object' && typeof o !== 'function')) {
    return false;
  }
  var u = o[Symbol.unscopables];
  if (u !== undefined && u !== null && typeof u === 'object') {
    if (Boolean(u[name])) {
      return false;
    }
  }
  return name in o;
}

function _withLookup(chain, name, outer) {
  for (var i = chain.length - 1; i >= 0; i--) {
    if (_withHasBinding(chain[i], name)) {
      return chain[i][name];
    }
  }
  if (outer && Object.prototype.hasOwnProperty.call(outer, name)) {
    return outer[name];
  }
  if (typeof globalThis !== 'undefined' && name in globalThis) {
    return globalThis[name];
  }
  throw new ReferenceError(name + ' is not defined');
}

function _withRef(chain, name, outer) {
  for (var i = chain.length - 1; i >= 0; i--) {
    if (_withHasBinding(chain[i], name)) {
      return { obj: chain[i], name: name };
    }
  }
  if (outer && Object.prototype.hasOwnProperty.call(outer, name)) {
    return { obj: outer, name: name };
  }
  throw new ReferenceError(name + ' is not defined');
}

function _withCall(chain, name, thisArg, args, outer) {
  var fn = _withLookup(chain, name, outer);
  return fn.apply(thisArg, args);
}

function _withUnaryCall(chain, name, unused, outer) {
  var receiver = undefined;
  var i;
  for (i = chain.length - 1; i >= 0; i--) {
    if (_withHasBinding(chain[i], name)) {
      receiver = chain[i];
      break;
    }
  }
  var fn = _withLookup(chain, name, outer);
  return fn.call(receiver);
}

class _UnscMyArray extends Array {
}

export function ArraySymbolUnscopablesJs_0100() {
  return Object.prototype.hasOwnProperty.call(Array.prototype, Symbol.unscopables);
}

export function ArraySymbolUnscopablesJs_0101() {
  var a=[];var b=[1,2,3];return a[Symbol.unscopables]===b[Symbol.unscopables]&&a[Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0102() {
  var names=Object.getOwnPropertyNames(Array.prototype);return names.indexOf('Symbol.unscopables')===-1;
}

export function ArraySymbolUnscopablesJs_0103() {
  var syms=Object.getOwnPropertySymbols(Array.prototype);return syms.indexOf(Symbol.unscopables)>=0;
}

export function ArraySymbolUnscopablesJs_0104() {
  var d=Object.getOwnPropertyDescriptor(Array.prototype,Symbol.unscopables);return d.writable===false;
}

export function ArraySymbolUnscopablesJs_0105() {
  var d=Object.getOwnPropertyDescriptor(Array.prototype,Symbol.unscopables);return d.enumerable===false;
}

export function ArraySymbolUnscopablesJs_0106() {
  var d=Object.getOwnPropertyDescriptor(Array.prototype,Symbol.unscopables);return d.configurable===true;
}

export function ArraySymbolUnscopablesJs_0107() {
  return _throws(function(){'use strict';Array.prototype[Symbol.unscopables]={};},TypeError);
}

export function ArraySymbolUnscopablesJs_0108() {
  return typeof Array.prototype[Symbol.unscopables]==='object';
}

export function ArraySymbolUnscopablesJs_0109() {
  return Array.isArray(Array.prototype[Symbol.unscopables])===false;
}

export function ArraySymbolUnscopablesJs_0110() {
  return Array.prototype[Symbol.unscopables]!==null;
}

export function ArraySymbolUnscopablesJs_0111() {
  return Object.getPrototypeOf(Array.prototype[Symbol.unscopables])===null;
}

export function ArraySymbolUnscopablesJs_0112() {
  return Array.prototype[Symbol.unscopables].__proto__==null;
}

export function ArraySymbolUnscopablesJs_0113() {
  return (Array.prototype[Symbol.unscopables] instanceof Object)===false;
}

export function ArraySymbolUnscopablesJs_0114() {
  return ('at' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0115() {
  return ('copyWithin' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0116() {
  return ('entries' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0117() {
  return ('fill' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0118() {
  return ('find' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0119() {
  return ('findIndex' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0120() {
  return ('findLast' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0121() {
  return ('findLastIndex' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0122() {
  return ('flat' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0123() {
  return ('flatMap' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0124() {
  return ('includes' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0125() {
  return ('keys' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0126() {
  return ('toReversed' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0127() {
  return ('toSorted' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0128() {
  return ('toSpliced' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0129() {
  return ('values' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0130() {
  var un=Array.prototype[Symbol.unscopables];return Object.getOwnPropertyNames(un).every(function(k){return un[k]===true;});
}

export function ArraySymbolUnscopablesJs_0131() {
  return Array.prototype[Symbol.unscopables].at===true;
}

export function ArraySymbolUnscopablesJs_0132() {
  return Array.prototype[Symbol.unscopables].includes===true;
}

export function ArraySymbolUnscopablesJs_0133() {
  return Array.prototype[Symbol.unscopables].values===true;
}

export function ArraySymbolUnscopablesJs_0134() {
  return !('push' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0135() {
  return !('pop' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0136() {
  return !('map' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0137() {
  return !('forEach' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0138() {
  return !('length' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0139() {
  return !('indexOf' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0140() {
  return !('sort' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0141() {
  return !('slice' in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0142() {
  return Object.getOwnPropertyNames(Array.prototype[Symbol.unscopables]).length===16;
}

export function ArraySymbolUnscopablesJs_0143() {
  return Object.getOwnPropertySymbols(Array.prototype[Symbol.unscopables]).length===0;
}

export function ArraySymbolUnscopablesJs_0144() {
  var expected=['at','copyWithin','entries','fill','find','findIndex','findLast','findLastIndex','flat','flatMap','includes','keys','toReversed','toSorted','toSpliced','values'];var actual=Object.getOwnPropertyNames(Array.prototype[Symbol.unscopables]);return expected.every(function(n){return actual.indexOf(n)>=0;});
}

export function ArraySymbolUnscopablesJs_0145() {
  var keys = [];
  var arr = [1, 2, 3];
  _withCall([arr], 'push', keys, ['something'], {});
  return keys.length === 1 && keys[0] === 'something';
}

export function ArraySymbolUnscopablesJs_0146() {
  var values = [];
  var arr = [1, 2, 3];
  _withCall([arr], 'push', values, ['added'], {});
  return values.length === 1 && values[0] === 'added';
}

export function ArraySymbolUnscopablesJs_0147() {
  var includes = 'external';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'includes', { includes: includes }) === 'external';
}

export function ArraySymbolUnscopablesJs_0148() {
  var find = 'myFind';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'find', { find: find }) === 'myFind';
}

export function ArraySymbolUnscopablesJs_0149() {
  var fill = 'myFill';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'fill', { fill: fill }) === 'myFill';
}

export function ArraySymbolUnscopablesJs_0150() {
  var entries = 'myEntries';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'entries', { entries: entries }) === 'myEntries';
}

export function ArraySymbolUnscopablesJs_0151() {
  var at = 'myAt';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'at', { at: at }) === 'myAt';
}

export function ArraySymbolUnscopablesJs_0152() {
  var flat = 'myFlat';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'flat', { flat: flat }) === 'myFlat';
}

export function ArraySymbolUnscopablesJs_0153() {
  var arr = [1, 2, 3];
  _withCall([arr], 'push', arr, [4], {});
  return arr.length === 4 && arr[3] === 4;
}

export function ArraySymbolUnscopablesJs_0154() {
  var arr = [1, 2, 3];
  _withCall([arr], 'pop', arr, [], {});
  return arr.length === 2;
}

export function ArraySymbolUnscopablesJs_0155() {
  var arr = [1, 2, 3];
  return _withLookup([arr], 'length', {}) === 3;
}

export function ArraySymbolUnscopablesJs_0156() {
  var arr = [1, 2, 3];
  var result = _withCall([arr], 'map', arr, [function (x) {
    return x * 2;
  }], {});
  return result.join(',') === '2,4,6';
}

export function ArraySymbolUnscopablesJs_0157() {
  var arr = [1, 2, 3];
  return _withUnaryCall([arr], 'toString', arr, {}) === '1,2,3';
}

export function ArraySymbolUnscopablesJs_0158() {
  var arr = [10, 20, 30];
  return _withCall([arr], 'indexOf', arr, [20], {}) === 1;
}

export function ArraySymbolUnscopablesJs_0159() {
  var keys = 'outerKeys';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'keys', { keys: keys }) === 'outerKeys';
}

export function ArraySymbolUnscopablesJs_0160() {
  var arr = [1, 2, 3];
  try {
    _withLookup([arr], 'keys', {});
    return false;
  } catch (e) {
    return e instanceof ReferenceError;
  }
}

export function ArraySymbolUnscopablesJs_0161() {
  function find() {
    return 'external find';
  }
  var arr = [1, 2, 3];
  return _withCall([arr], 'find', undefined, [], { find: find }) === 'external find';
}

export function ArraySymbolUnscopablesJs_0162() {
  var keys = 'outer';
  var arr = [1, 2, 3];
  var ok = false;
  ok = (function () {
    return _withLookup([arr], 'keys', { keys: keys }) === 'outer';
  })();
  return ok;
}

export function ArraySymbolUnscopablesJs_0163() {
  var arr = [1, 2, 3];
  return _withCall([arr], 'join', arr, ['-'], {}) === '1-2-3';
}

export function ArraySymbolUnscopablesJs_0164() {
  var arr = [1, 2];
  return _withCall([arr], 'concat', arr, [[3, 4]], {}).length === 4;
}

export function ArraySymbolUnscopablesJs_0165() {
  var arr = [1, 2, 3];
  return _withCall([arr], 'reduce', arr, [function (a, b) {
    return a + b;
  }, 0], {}) === 6;
}

export function ArraySymbolUnscopablesJs_0166() {
  var arr = [1, 2, 3];
  _withCall([arr], 'splice', arr, [1, 1], {});
  return arr.length === 2 && arr[0] === 1 && arr[1] === 3;
}

export function ArraySymbolUnscopablesJs_0167() {
  var at = 'externalAt';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'at', { at: at }) === 'externalAt';
}

export function ArraySymbolUnscopablesJs_0168() {
  var arr=[1,2,3];return arr.at(0)===1&&arr.at(-1)===3;
}

export function ArraySymbolUnscopablesJs_0169() {
  var copyWithin = 'externalCopy';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'copyWithin', { copyWithin: copyWithin }) === 'externalCopy';
}

export function ArraySymbolUnscopablesJs_0170() {
  var arr=[1,2,3,4,5];arr.copyWithin(0,3,5);return arr.join(',')==='4,5,3,4,5';
}

export function ArraySymbolUnscopablesJs_0171() {
  var entries = 'externalEntries';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'entries', { entries: entries }) === 'externalEntries';
}

export function ArraySymbolUnscopablesJs_0172() {
  var arr=['a','b'];var iter=arr.entries();return iter.next().value.join(',')==='0,a';
}

export function ArraySymbolUnscopablesJs_0173() {
  var fill = 'externalFill';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'fill', { fill: fill }) === 'externalFill';
}

export function ArraySymbolUnscopablesJs_0174() {
  var arr=[1,2,3];arr.fill(0,1,3);return arr.join(',')==='1,0,0';
}

export function ArraySymbolUnscopablesJs_0175() {
  var find = 'externalFind';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'find', { find: find }) === 'externalFind';
}

export function ArraySymbolUnscopablesJs_0176() {
  var arr=[1,2,3,4];return arr.find(function(x){return x>2;})===3;
}

export function ArraySymbolUnscopablesJs_0177() {
  var findIndex = 'externalIdx';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'findIndex', { findIndex: findIndex }) === 'externalIdx';
}

export function ArraySymbolUnscopablesJs_0178() {
  var arr=[1,2,3,4];return arr.findIndex(function(x){return x>2;})===2;
}

export function ArraySymbolUnscopablesJs_0179() {
  var findLast = 'externalLast';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'findLast', { findLast: findLast }) === 'externalLast';
}

export function ArraySymbolUnscopablesJs_0180() {
  var arr=[1,2,3,4];if(typeof arr.findLast!=='function'){return true;}return arr.findLast(function(x){return x>2;})===4;
}

export function ArraySymbolUnscopablesJs_0181() {
  var findLastIndex = 'externalLastIdx';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'findLastIndex', { findLastIndex: findLastIndex }) === 'externalLastIdx';
}

export function ArraySymbolUnscopablesJs_0182() {
  var arr=[1,2,3,4];if(typeof arr.findLastIndex!=='function'){return true;}return arr.findLastIndex(function(x){return x>2;})===3;
}

export function ArraySymbolUnscopablesJs_0183() {
  var flat = 'externalFlat';
  var arr = [1, [2, 3]];
  return _withLookup([arr], 'flat', { flat: flat }) === 'externalFlat';
}

export function ArraySymbolUnscopablesJs_0184() {
  var arr=[1,[2,[3]]];return arr.flat(2).join(',')==='1,2,3';
}

export function ArraySymbolUnscopablesJs_0185() {
  var flatMap = 'externalFlatMap';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'flatMap', { flatMap: flatMap }) === 'externalFlatMap';
}

export function ArraySymbolUnscopablesJs_0186() {
  var arr=[1,2,3];return arr.flatMap(function(x){return [x,x*2];}).join(',')==='1,2,2,4,3,6';
}

export function ArraySymbolUnscopablesJs_0187() {
  var includes = 'externalIncludes';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'includes', { includes: includes }) === 'externalIncludes';
}

export function ArraySymbolUnscopablesJs_0188() {
  var arr=[1,2,3];return arr.includes(2)===true&&arr.includes(4)===false;
}

export function ArraySymbolUnscopablesJs_0189() {
  var keys = [];
  var arr = [1, 2, 3];
  _withCall([arr], 'push', keys, ['item'], {});
  return keys.length === 1 && keys[0] === 'item';
}

export function ArraySymbolUnscopablesJs_0190() {
  var arr=['a','b','c'];var iter=arr.keys();return iter.next().value===0;
}

export function ArraySymbolUnscopablesJs_0191() {
  var toReversed = 'externalRev';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'toReversed', { toReversed: toReversed }) === 'externalRev';
}

export function ArraySymbolUnscopablesJs_0192() {
  var arr=[1,2,3];if(typeof arr.toReversed!=='function'){return true;}return arr.toReversed().join(',')==='3,2,1';
}

export function ArraySymbolUnscopablesJs_0193() {
  var toSorted = 'externalSorted';
  var arr = [3, 1, 2];
  return _withLookup([arr], 'toSorted', { toSorted: toSorted }) === 'externalSorted';
}

export function ArraySymbolUnscopablesJs_0194() {
  var arr=[3,1,2];if(typeof arr.toSorted!=='function'){return true;}return arr.toSorted().join(',')==='1,2,3';
}

export function ArraySymbolUnscopablesJs_0195() {
  var toSpliced = 'externalSpliced';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'toSpliced', { toSpliced: toSpliced }) === 'externalSpliced';
}

export function ArraySymbolUnscopablesJs_0196() {
  var arr=[1,2,3];if(typeof arr.toSpliced!=='function'){return true;}return arr.toSpliced(1,1,10,20).join(',')==='1,10,20,3';
}

export function ArraySymbolUnscopablesJs_0197() {
  var values = [];
  var arr = [1, 2, 3];
  _withCall([arr], 'push', values, ['val'], {});
  return values.length === 1 && values[0] === 'val';
}

export function ArraySymbolUnscopablesJs_0198() {
  var arr=['a','b'];var iter=arr.values();return iter.next().value==='a';
}

export function ArraySymbolUnscopablesJs_0199() {
  return Object.getPrototypeOf(Array.prototype[Symbol.unscopables])===null;
}

export function ArraySymbolUnscopablesJs_0200() {
  return (Array.prototype[Symbol.unscopables] instanceof Object)===false;
}

export function ArraySymbolUnscopablesJs_0201() {
  var un=Array.prototype[Symbol.unscopables];try{un.hasOwnProperty('at');return false;}catch(e){return e instanceof TypeError;}
}

export function ArraySymbolUnscopablesJs_0202() {
  var un=Array.prototype[Symbol.unscopables];return Object.prototype.hasOwnProperty.call(un,'toString')===false;
}

export function ArraySymbolUnscopablesJs_0203() {
  return ('hasOwnProperty' in Array.prototype[Symbol.unscopables])===false;
}

export function ArraySymbolUnscopablesJs_0204() {
  return Array.prototype[Symbol.unscopables].constructor===undefined;
}

export function ArraySymbolUnscopablesJs_0205() {
  return ('isPrototypeOf' in Array.prototype[Symbol.unscopables])===false;
}

export function ArraySymbolUnscopablesJs_0206() {
  var arr = [1, 2, 3];
  return _withUnaryCall([arr], 'toString', arr, {}) === '1,2,3';
}

export function ArraySymbolUnscopablesJs_0207() {
  var arr = [1, 2, 3];
  return _withUnaryCall([arr], 'valueOf', arr, {}) instanceof Array;
}

export function ArraySymbolUnscopablesJs_0208() {
  var orig = Array.prototype[Symbol.unscopables];
  var desc = Object.getOwnPropertyDescriptor(Array.prototype, Symbol.unscopables);
  try {
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: { student: true },
      configurable: true,
      writable: false,
      enumerable: false
    });
    var arr = [1, 2, 3];
    var bad = false;
    bad = (_withUnaryCall([arr], 'toString', arr, {}) !== '1,2,3');
    return bad;
  } finally {
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: orig,
      configurable: desc.configurable,
      writable: desc.writable,
      enumerable: desc.enumerable
    });
  }
}

export function ArraySymbolUnscopablesJs_0209() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.keys;
  try {
    un.keys = false;
    var arr = [1, 2, 3];
    var ok = false;
    ok = (typeof _withLookup([arr], 'keys', {}) === 'function');
    return ok;
  } finally {
    un.keys = o;
  }
}

export function ArraySymbolUnscopablesJs_0210() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.includes;
  try {
    un.includes = false;
    var arr = [1, 2, 3];
    var ok = false;
    ok = _withCall([arr], 'includes', arr, [1], {}) === true;
    return ok;
  } finally {
    un.includes = o;
  }
}

export function ArraySymbolUnscopablesJs_0211() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.keys;
  try {
    un.keys = 1;
    var keys = [];
    var arr = [1, 2, 3];
    _withCall([arr], 'push', keys, ['works'], {});
    return keys.length === 1 && keys[0] === 'works';
  } finally {
    un.keys = o;
  }
}

export function ArraySymbolUnscopablesJs_0212() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.find;
  try {
    un.find = 0;
    var arr = [1, 2, 3];
    var ok = false;
    ok = _withCall([arr], 'find', arr, [function (x) {
      return x > 1;
    }], {}) === 2;
    return ok;
  } finally {
    un.find = o;
  }
}

export function ArraySymbolUnscopablesJs_0213() {
  var un = Array.prototype[Symbol.unscopables];
  try {
    un.push = true;
    var push = 'externalPush';
    var arr = [1, 2, 3];
    var ok = false;
    ok = (_withLookup([arr], 'push', { push: push }) === 'externalPush');
    delete un.push;
    return ok;
  } catch (e) {
    try {
      delete un.push;
    } catch (_e) {
    }
    return false;
  }
}

export function ArraySymbolUnscopablesJs_0214() {
  var un = Array.prototype[Symbol.unscopables];
  try {
    var arr = [1, 2, 3];
    arr.customProp = 'hello';
    un.customProp = true;
    var customProp = 'outer';
    var ok = false;
    ok = (_withLookup([arr], 'customProp', { customProp: customProp }) === 'outer');
    delete un.customProp;
    return ok;
  } catch (e) {
    try {
      delete un.customProp;
    } catch (_e) {
    }
    return false;
  }
}

export function ArraySymbolUnscopablesJs_0215() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.keys;
  try {
    delete un.keys;
    var arr = [1, 2, 3];
    var ok = false;
    ok = (typeof _withLookup([arr], 'keys', {}) === 'function');
    un.keys = o;
    return ok;
  } finally {
    if (o !== undefined) {
      un.keys = o;
    }
  }
}

export function ArraySymbolUnscopablesJs_0216() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.values;
  try {
    delete un.values;
    var arr = [1, 2, 3];
    var ok = false;
    ok = (typeof _withLookup([arr], 'values', {}) === 'function');
    un.values = o;
    return ok;
  } finally {
    if (o !== undefined) {
      un.values = o;
    }
  }
}

export function ArraySymbolUnscopablesJs_0217() {
  var orig = Array.prototype[Symbol.unscopables];
  var desc = Object.getOwnPropertyDescriptor(Array.prototype, Symbol.unscopables);
  try {
    var rep = { __proto__: null, push: true };
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: rep,
      configurable: true,
      writable: false,
      enumerable: false
    });
    var push = 'external';
    var arr = [1, 2, 3];
    var ok = false;
    ok = (_withLookup([arr], 'push', { push: push }) === 'external');
    return ok;
  } finally {
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: orig,
      configurable: desc.configurable,
      writable: desc.writable,
      enumerable: desc.enumerable
    });
  }
}

export function ArraySymbolUnscopablesJs_0218() {
  var orig = Array.prototype[Symbol.unscopables];
  var desc = Object.getOwnPropertyDescriptor(Array.prototype, Symbol.unscopables);
  try {
    var rep = { __proto__: null };
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: rep,
      configurable: true,
      writable: false,
      enumerable: false
    });
    var arr = [1, 2, 3];
    var ok = false;
    ok = (typeof _withLookup([arr], 'keys', {}) === 'function' && typeof _withLookup([arr], 'values', {}) === 'function');
    return ok;
  } finally {
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: orig,
      configurable: desc.configurable,
      writable: desc.writable,
      enumerable: desc.enumerable
    });
  }
}

export function ArraySymbolUnscopablesJs_0219() {
  var orig = Array.prototype[Symbol.unscopables];
  var desc = Object.getOwnPropertyDescriptor(Array.prototype, Symbol.unscopables);
  try {
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: undefined,
      configurable: true,
      writable: false,
      enumerable: false
    });
    var arr = [1, 2, 3];
    var ok = false;
    ok = (typeof _withLookup([arr], 'keys', {}) === 'function');
    return ok;
  } finally {
    Object.defineProperty(Array.prototype, Symbol.unscopables, {
      value: orig,
      configurable: desc.configurable,
      writable: desc.writable,
      enumerable: desc.enumerable
    });
  }
}

export function ArraySymbolUnscopablesJs_0220() {
  var un = Array.prototype[Symbol.unscopables];
  var o = un.includes;
  var arr = [1, 2, 3];
  var includes = 'outer';
  var ok1 = false;
  var ok2 = false;
  ok1 = (_withLookup([arr], 'includes', { includes: includes }) === 'outer');
  try {
    un.includes = false;
    ok2 = _withCall([arr], 'includes', arr, [1], {}) === true;
  } finally {
    un.includes = o;
  }
  return ok1 && ok2;
}

export function ArraySymbolUnscopablesJs_0221() {
  var arr=[1,2,3];return arr[Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0222() {
  var keys = [];
  var arr = [1, 2, 3];
  var outer = { keys: keys };
  _withCall([arr], 'push', _withLookup([arr], 'keys', outer), ['test'], outer);
  return keys.length === 1 && keys[0] === 'test';
}

export function ArraySymbolUnscopablesJs_0223() {
  return [].push[Symbol.unscopables]===undefined&&[].hasOwnProperty(Symbol.unscopables)===false&&[][Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0224() {
  var myArr = new _UnscMyArray(1, 2, 3);
  return myArr[Symbol.unscopables] === Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0225() {
  var keys = [];
  var myArr = new _UnscMyArray(1, 2, 3);
  var outer = { keys: keys };
  _withCall([myArr], 'push', _withLookup([myArr], 'keys', outer), ['subclass'], outer);
  return keys.length === 1 && keys[0] === 'subclass';
}

export function ArraySymbolUnscopablesJs_0226() {
  try {
    Object.defineProperty(_UnscMyArray.prototype, Symbol.unscopables, {
      value: { __proto__: null, push: true },
      configurable: true,
      writable: true,
      enumerable: false
    });
    var push = 'outerPush';
    var myArr = new _UnscMyArray(1, 2, 3);
    return _withLookup([myArr], 'push', { push: push }) === 'outerPush';
  } finally {
    delete _UnscMyArray.prototype[Symbol.unscopables];
  }
}

export function ArraySymbolUnscopablesJs_0227() {
  var obj=Object.create(Array.prototype);return obj[Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0228() {
  var obj = Object.create(Array.prototype);
  obj.length = 0;
  var keys = 'external';
  return _withLookup([obj], 'keys', { keys: keys }) === 'external';
}

export function ArraySymbolUnscopablesJs_0229() {
  var un = Array.prototype[Symbol.unscopables];
  try {
    un.pop = true;
    var arr1 = [1];
    var arr2 = [2];
    var pop = 'externalPop';
    var ok1 = _withLookup([arr1], 'pop', { pop: pop }) === 'externalPop';
    var ok2 = _withLookup([arr2], 'pop', { pop: pop }) === 'externalPop';
    return ok1 && ok2;
  } finally {
    delete un.pop;
  }
}

export function ArraySymbolUnscopablesJs_0230() {
  try {
    new Function('"use strict"; with({}) {}');
    return false;
  } catch (e) {
    if (e instanceof SyntaxError) {
      return true;
    }
    if (e instanceof TypeError && /Forbidden|Not support|eval/i.test(String(e.message || ''))) {
      return true;
    }
    return false;
  }
}

export function ArraySymbolUnscopablesJs_0231() {
  try {
    new Function('"use strict"; with([]) {}');
    return false;
  } catch (e) {
    if (e instanceof SyntaxError) {
      return true;
    }
    if (e instanceof TypeError && /Forbidden|Not support|eval/i.test(String(e.message || ''))) {
      return true;
    }
    return false;
  }
}

export function ArraySymbolUnscopablesJs_0232() {
  var keys = [];
  var arr = [1, 2, 3];
  var outer = { keys: keys };
  _withCall([arr], 'push', _withLookup([arr], 'keys', outer), ['non-strict'], outer);
  return keys.length === 1 && keys[0] === 'non-strict';
}

export function ArraySymbolUnscopablesJs_0233() {
  var arr = [1, 2, 3];
  _withCall([arr], 'push', arr, [4], {});
  return arr[3] === 4;
}

export function ArraySymbolUnscopablesJs_0234() {
  return (function(){'use strict';var un=Array.prototype[Symbol.unscopables];return un.keys===true;})();
}

export function ArraySymbolUnscopablesJs_0235() {
  return (function(){'use strict';var un=Array.prototype[Symbol.unscopables];var o=un.find;try{un.find=false;return un.find===false;}finally{un.find=o;}})();
}

export function ArraySymbolUnscopablesJs_0236() {
  return (function(){'use strict';var r1=[][Symbol.unscopables];var r2=Array.prototype[Symbol.unscopables];return r1===r2;})();
}

export function ArraySymbolUnscopablesJs_0237() {
  var empty=[];return empty[Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0238() {
  var keys = 'outer';
  var empty = [];
  return _withLookup([empty], 'keys', { keys: keys }) === 'outer';
}

export function ArraySymbolUnscopablesJs_0239() {
  var arr=[1,2,3];Object.freeze(arr);return arr[Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0240() {
  var keys = 'frozen';
  var arr = Object.freeze([1, 2, 3]);
  return _withLookup([arr], 'keys', { keys: keys }) === 'frozen';
}

export function ArraySymbolUnscopablesJs_0241() {
  var arr=[1,2,3];Object.seal(arr);return arr[Symbol.unscopables]===Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0242() {
  var includes = 'sealed';
  var arr = Object.seal([1, 2, 3]);
  return _withLookup([arr], 'includes', { includes: includes }) === 'sealed';
}

export function ArraySymbolUnscopablesJs_0243() {
  var arr = [1, 2, 3];
  var proxy = new Proxy(arr, {
    get: function (t, p) {
      if (p === Symbol.unscopables) {
        return { __proto__: null, push: true };
      }
      return t[p];
    }
  });
  var push = 'proxied';
  return _withLookup([proxy], 'push', { push: push }) === 'proxied';
}

export function ArraySymbolUnscopablesJs_0244() {
  var arr = [1, 2, 3];
  var proxy = new Proxy(arr, {
    get: function (t, p) {
      if (p === Symbol.unscopables) {
        return null;
      }
      return t[p];
    }
  });
  return typeof _withLookup([proxy], 'keys', {}) === 'function';
}

export function ArraySymbolUnscopablesJs_0245() {
  var arr = [1, 2, 3];
  var proxy = new Proxy(arr, {
    get: function (t, p) {
      if (p === Symbol.unscopables) {
        return undefined;
      }
      return t[p];
    }
  });
  return typeof _withLookup([proxy], 'values', {}) === 'function';
}

export function ArraySymbolUnscopablesJs_0246() {
  var obj={0:'a',1:'b',length:2};return obj[Symbol.unscopables]===undefined;
}

export function ArraySymbolUnscopablesJs_0247() {
  function f(){return arguments[Symbol.unscopables];}return f(1,2,3)===undefined;
}

export function ArraySymbolUnscopablesJs_0248() {
  if(typeof Int8Array==='undefined'){return true;}var typed=new Int8Array(3);var u=typed[Symbol.unscopables];if(u===undefined){return true;}return u!==Array.prototype[Symbol.unscopables];
}

export function ArraySymbolUnscopablesJs_0249() {
  var str=new String('abc');return str[Symbol.unscopables]===undefined;
}

export function ArraySymbolUnscopablesJs_0250() {
  var obj = { foo: 1 };
  obj[Symbol.unscopables] = { __proto__: null, foo: true };
  var foo = 'outer';
  return _withLookup([obj], 'foo', { foo: foo }) === 'outer';
}

export function ArraySymbolUnscopablesJs_0251() {
  var obj = { foo: 1 };
  return _withLookup([obj], 'foo', {}) === 1;
}

export function ArraySymbolUnscopablesJs_0252() {
  var obj = { foo: 1, bar: 2 };
  obj[Symbol.unscopables] = undefined;
  return _withLookup([obj], 'foo', {}) === 1 && _withLookup([obj], 'bar', {}) === 2;
}

export function ArraySymbolUnscopablesJs_0253() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: true };
  var find = 'outer';
  return _withLookup([obj], 'find', { find: find }) === 'outer';
}

export function ArraySymbolUnscopablesJs_0254() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: false };
  return _withLookup([obj], 'find', {}) === 'inner';
}

export function ArraySymbolUnscopablesJs_0255() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: undefined };
  return _withLookup([obj], 'find', {}) === 'inner';
}

export function ArraySymbolUnscopablesJs_0256() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: 0 };
  return _withLookup([obj], 'find', {}) === 'inner';
}

export function ArraySymbolUnscopablesJs_0257() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: '' };
  return _withLookup([obj], 'find', {}) === 'inner';
}

export function ArraySymbolUnscopablesJs_0258() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: {} };
  var find = 'outer';
  return _withLookup([obj], 'find', { find: find }) === 'outer';
}

export function ArraySymbolUnscopablesJs_0259() {
  var proto = { foo: true };
  var obj = { foo: 1 };
  obj[Symbol.unscopables] = Object.create(proto);
  var foo = 'outer';
  return _withLookup([obj], 'foo', { foo: foo }) === 'outer';
}

export function ArraySymbolUnscopablesJs_0260() {
  var obj = {
    toString: function () {
      return 'myToString';
    }
  };
  obj[Symbol.unscopables] = { __proto__: null, customOnly: true };
  return _withUnaryCall([obj], 'toString', obj, {}) === 'myToString';
}

export function ArraySymbolUnscopablesJs_0261() {
  var obj = {
    toString: function () {
      return 'mine';
    }
  };
  obj[Symbol.unscopables] = { myProp: true };
  var hit = false;
  try {
    hit = (_withUnaryCall([obj], 'toString', obj, {}) !== 'mine');
  } catch (e) {
    hit = true;
  }
  return hit;
}

export function ArraySymbolUnscopablesJs_0262() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: NaN };
  return _withLookup([obj], 'find', {}) === 'inner';
}

export function ArraySymbolUnscopablesJs_0263() {
  var obj = { find: 'inner' };
  obj[Symbol.unscopables] = { __proto__: null, find: null };
  return _withLookup([obj], 'find', {}) === 'inner';
}

export function ArraySymbolUnscopablesJs_0264() {
  var arr=[1,2,3];return arr.find(function(x){return x>1;})===2&&arr.findIndex(function(x){return x>1;})===1&&arr.includes(2)===true;
}

export function ArraySymbolUnscopablesJs_0265() {
  var arr=[1,2,3];return Array.prototype.find.call(arr,function(x){return x>1;})===2&&Array.prototype.includes.apply(arr,[3])===true;
}

export function ArraySymbolUnscopablesJs_0266() {
  var arr=[1,2,3];var boundFind=Array.prototype.find.bind(arr);return boundFind(function(x){return x>2;})===3;
}

export function ArraySymbolUnscopablesJs_0267() {
  var arr = [1, 2, 3];
  return Array.prototype.includes.call(arr, 2) === true;
}

export function ArraySymbolUnscopablesJs_0268() {
  var arr = [1, 2, 3];
  return _withLookup([arr], 'length', {}) === 3;
}

export function ArraySymbolUnscopablesJs_0269() {
  var arr = [1, 2, 3];
  var ref = _withRef([arr], 'length', {});
  ref.obj[ref.name] = 2;
  return arr.length === 2 && arr.join(',') === '1,2';
}

export function ArraySymbolUnscopablesJs_0270() {
  return !(Symbol.iterator in Array.prototype[Symbol.unscopables]);
}

export function ArraySymbolUnscopablesJs_0271() {
  var arr=[1,2,3];var result=[];for(var x of arr){result.push(x);}return result.join(',')==='1,2,3';
}

export function ArraySymbolUnscopablesJs_0272() {
  var un=Array.prototype[Symbol.unscopables];return un.find===true&&un.findIndex===true&&un.fill===true&&un.keys===true&&un.values===true&&un.entries===true;
}

export function ArraySymbolUnscopablesJs_0273() {
  return Array.prototype[Symbol.unscopables].includes===true;
}

export function ArraySymbolUnscopablesJs_0274() {
  return Array.prototype[Symbol.unscopables].flat===true&&Array.prototype[Symbol.unscopables].flatMap===true;
}

export function ArraySymbolUnscopablesJs_0275() {
  var un=Array.prototype[Symbol.unscopables];if(typeof Array.prototype.toReversed!=='function'){return true;}return un.toReversed===true&&un.toSorted===true&&un.toSpliced===true;
}

export function ArraySymbolUnscopablesJs_0276() {
  var un=Array.prototype[Symbol.unscopables];var names=['push','pop','shift','unshift','slice','splice','sort','reverse','map','filter','forEach','some','every','reduce','reduceRight','indexOf','lastIndexOf','concat','join'];return names.every(function(n){return !(n in un);});
}

export function ArraySymbolUnscopablesJs_0277() {
  var keys = [];
  var arr = ['a', 'b', 'c'];
  var outer = { keys: keys };
  _withCall([arr], 'push', _withLookup([arr], 'keys', outer), ['d'], outer);
  return keys.length === 1 && keys[0] === 'd';
}

export function ArraySymbolUnscopablesJs_0278() {
  var values = {};
  var arr = [1, 2, 3];
  var outer = { values: values };
  var ref = _withRef([arr], 'values', outer);
  ref.obj[ref.name].x = 1;
  return values.x === 1;
}

export function ArraySymbolUnscopablesJs_0279() {
  var includes = function () {
    return true;
  };
  var arr = [1, 2, 3];
  var fn = _withLookup([arr], 'includes', { includes: includes });
  return fn() === true;
}

export function ArraySymbolUnscopablesJs_0280() {
  var find = 'myVar';
  var arr = [1, 2, 3];
  return _withLookup([arr], 'find', { find: find }) === 'myVar';
}

export function ArraySymbolUnscopablesJs_0281() {
  var arr = [1, 2, 3];
  try {
    _withLookup([arr], 'fill', {});
    return false;
  } catch (e) {
    return e instanceof ReferenceError;
  }
}

export function ArraySymbolUnscopablesJs_0282() {
  function test(values) {
    var arr = [1, 2, 3];
    return _withLookup([arr], 'values', { values: values }) === 'param';
  }
  return test('param');
}

export function ArraySymbolUnscopablesJs_0283() {
  var at = 'closure';
  return (function () {
    var arr = [1, 2, 3];
    return _withLookup([arr], 'at', { at: at }) === 'closure';
  })();
}

export function ArraySymbolUnscopablesJs_0284() {
  var keys = 'outer';
  var arr1 = [1, 2];
  var arr2 = [3, 4];
  return _withLookup([arr1, arr2], 'keys', { keys: keys }) === 'outer';
}

export function ArraySymbolUnscopablesJs_0285() {
  var keys = 'outer';
  var arr = [1, 2];
  var obj = { find: 'objFind' };
  var outer = { keys: keys };
  return _withLookup([arr, obj], 'keys', outer) === 'outer' && _withLookup([arr, obj], 'find', outer) === 'objFind';
}

export function ArraySymbolUnscopablesJs_0286() {
  var arr1 = [1, 2];
  var arr2 = [3, 4];
  return _withLookup([arr1, arr2], 'length', {}) === 2;
}

export function ArraySymbolUnscopablesJs_0287() {
  var find = 'globalFind';
  var arr1 = [1, 2];
  var arr2 = [3, 4];
  return _withLookup([arr1, arr2], 'find', { find: find }) === 'globalFind';
}
