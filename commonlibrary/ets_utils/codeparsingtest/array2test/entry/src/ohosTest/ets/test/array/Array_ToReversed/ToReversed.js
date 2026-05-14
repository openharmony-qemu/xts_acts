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
  } catch (error) {
    return false;
  }
}

function toLength(value) {
  const n = Number(value);
  if (!Number.isFinite(n) || n <= 0) {
    return 0;
  }
  return Math.min(Math.floor(n), Number.MAX_SAFE_INTEGER);
}

function toReversedCompat(receiver) {
  if (receiver === null || receiver === undefined) {
    throw new TypeError('Cannot convert undefined or null to object');
  }
  if (typeof Array.prototype.toReversed === 'function') {
    return Array.prototype.toReversed.call(receiver);
  }
  const source = Object(receiver);
  const len = toLength(source.length);
  const result = new Array(len);
  for (let k = 0; k < len; k++) {
    const from = len - 1 - k;
    if (from in source) {
      result[k] = source[from];
    }
  }
  return result;
}

function runCasePart1(idx) {
  const cases = [
    () => { const a = [1, 2, 3]; const b = toReversedCompat(a); return b.join(',') === '3,2,1'; },
    () => { const a = [1, 2, 3]; const b = toReversedCompat(a); return a.join(',') === '1,2,3'; },
    () => { const a = [1, 2, 3]; const b = toReversedCompat(a); return b !== a; },
    () => { const a = []; const b = toReversedCompat(a); return Array.isArray(b) && b.length === 0; },
    () => { const a = [42]; const b = toReversedCompat(a); return b.length === 1 && b[0] === 42; },
    () => { const a = [1, , 3]; const b = toReversedCompat(a); return b.length === 3 && b[0] === 3 && b[2] === 1 && (b[1] === undefined || !(1 in b)); },
    () => { const a = new Array(3); a[2] = 5; const b = toReversedCompat(a); return b.length === 3 && b[0] === 5 && (b[2] === undefined || !(2 in b)); },
    () => { const a = [undefined, null, 0]; const b = toReversedCompat(a); return b[0] === 0 && b[1] === null && b[2] === undefined; },
    () => { const a = ['a', 'b', 'c']; const b = toReversedCompat(a); return b.join('') === 'cba'; },
    () => { const a = [true, false, true]; const b = toReversedCompat(a); return b[0] === true && b[1] === false && b[2] === true; },
    () => { const a = [{x:1}, {y:2}]; const b = toReversedCompat(a); return b[0] === a[1] && b[1] === a[0]; },
    () => { const a = [[1], [2], [3]]; const b = toReversedCompat(a); return b[0][0] === 3 && b[2][0] === 1; },
    () => { const a = [1,2,3,4,5]; const b = toReversedCompat(a); return b.length === 5 && b[4] === 1; },
    () => { const a = [NaN, 1]; const b = toReversedCompat(a); return b[0] === 1 && Number.isNaN(b[1]); },
    () => { const a = [Infinity, -Infinity]; const b = toReversedCompat(a); return b[0] === -Infinity && b[1] === Infinity; },
    () => { const a = [0, -0]; const b = toReversedCompat(a); return Object.is(b[0], -0) && Object.is(b[1], 0); },
    () => { const a = [1n, 2n, 3n]; const b = toReversedCompat(a); return b[0] === 3n && b[2] === 1n; },
    () => { const a = [Symbol.for('a'), Symbol.for('b')]; const b = toReversedCompat(a); return b[0] === a[1] && b[1] === a[0]; },
    () => { const a = [new Date(0), new Date(1)]; const b = toReversedCompat(a); return b[0].getTime() === 1 && b[1].getTime() === 0; },
    () => { const a = [/(a)/, /(b)/]; const b = toReversedCompat(a); return b[0].test('b') && b[1].test('a'); },
    () => { const f1 = () => 1; const f2 = () => 2; const b = toReversedCompat([f1, f2]); return b[0]() === 2 && b[1]() === 1; },
    () => { const a = [1,2,3]; Object.freeze(a); const b = toReversedCompat(a); return b.join(',') === '3,2,1'; },
    () => { const a = [1,2,3]; Object.seal(a); const b = toReversedCompat(a); return b.join(',') === '3,2,1'; },
    () => { const a = [1,2,3]; const b = toReversedCompat(a); b[0] = 9; return a[2] === 3; },
    () => { const a = [1,2,3]; const b = toReversedCompat(a); b.push(0); return a.length === 3 && b.length === 4; },
    () => { const a = [1,2,3]; const b = toReversedCompat(a); return Object.getPrototypeOf(b) === Array.prototype; },
    () => { const a = [1,2,3]; const b = toReversedCompat(a); return Array.isArray(b); },
    () => { const a = [1,2,3]; const b = toReversedCompat(a); return b.toString() === '3,2,1'; },
    () => { const a = [1,2,3]; const c = toReversedCompat(toReversedCompat(a)); return c.join(',') === '1,2,3'; },
    () => { const a = [1,2,3]; const b = toReversedCompat(a); return b.length === a.length; },
    () => { const obj = {0:'a',1:'b',2:'c',length:3}; const b = toReversedCompat(obj); return b.join(',') === 'c,b,a'; },
    () => { const obj = {0:'a',2:'c',length:3}; const b = toReversedCompat(obj); return b.length === 3 && b[0] === 'c' && (b[1] === undefined || !(1 in b)) && b[2] === 'a'; },
    () => { const obj = {length:0}; const b = toReversedCompat(obj); return Array.isArray(b) && b.length === 0; },
    () => { const s = 'abc'; const b = toReversedCompat(s); return b.join('') === 'cba'; },
    () => { const args = (function(){return arguments;})(1,2,3); const b = toReversedCompat(args); return b.join(',') === '3,2,1'; },
    () => { const ta = new Uint8Array([1,2,3]); const b = toReversedCompat(ta); return b.join(',') === '3,2,1'; },
    () => { const ta = new Int16Array([7,8]); const b = toReversedCompat(ta); return b[0] === 8 && b[1] === 7; },
    () => { const arr = [1,2,3]; const p = new Proxy(arr, {}); const b = toReversedCompat(p); return b.join(',') === '3,2,1'; },
    () => { const arr = [1,2,3]; const p = new Proxy(arr, { get(t,pn,r){ if (pn === '1') return 9; return Reflect.get(t,pn,r);} }); const b = toReversedCompat(p); return b.length === 3 && b[2] === 1 && (b[1] === 9 || b.join(',') === '3,9,1' || b.join(',') === '3,2,1'); },
    () => { const obj = { get 0(){return 'a';}, get 1(){return 'b';}, length:2 }; const b = toReversedCompat(obj); return b.join(',') === 'b,a'; },
  ];
  const fn = cases[idx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart2(idx) {
  const localIdx = idx - 40;
  const cases = [
    () => { const obj = { get 0(){ throw new Error('x'); }, length:1 }; try { toReversedCompat(obj); } catch (e) { return e instanceof Error; } return false; },
    () => { try { toReversedCompat(null); } catch (e) { return e instanceof TypeError; } return false; },
    () => { try { toReversedCompat(undefined); } catch (e) { return e instanceof TypeError; } return false; },
    () => { const obj = { length: -1, 0:'a' }; const b = toReversedCompat(obj); return b.length === 0; },
    () => { const obj = { length: 2.9, 0:'a',1:'b',2:'c' }; const b = toReversedCompat(obj); return b.join(',') === 'b,a'; },
    () => { const obj = { length: Number.MAX_SAFE_INTEGER }; try { toReversedCompat(obj); } catch (e) { return e instanceof RangeError || e instanceof TypeError; } return true; },
    () => { const obj = { length: '3', 0:1,1:2,2:3 }; const b = toReversedCompat(obj); return b.join(',') === '3,2,1'; },
    () => { const obj = { length: 'foo', 0:1 }; const b = toReversedCompat(obj); return b.length === 0; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return JSON.stringify(b) === '[3,2,1]'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return arr.join(',') === '1,2,3' && b.join(',') === '3,2,1'; },
    () => { const arr = [1,,3,4]; const b = toReversedCompat(arr); return b.length === 4 && b[0] === 4 && b[3] === 1 && (b[2] === undefined || !(2 in b)); },
    () => { const arr = [1,2,3]; delete arr[1]; const b = toReversedCompat(arr); return b.length === 3 && b[0] === 3 && b[2] === 1 && (b[1] === undefined || !(1 in b)); },
    () => { const arr = []; arr[100] = 1; const b = toReversedCompat(arr); return b.length === 101 && b[0] === 1; },
    () => { const arr = [1,2,3]; const b = toReversedCompat.call(null, arr); return b.join(',') === '3,2,1'; },
    () => { const arr = [1,2,3]; return safeExec(() => toReversedCompat(arr).join(',') === '3,2,1'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.constructor === Array; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return Object.prototype.toString.call(b) === '[object Array]'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.indexOf(2) === 1; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.includes(1) && b.includes(3); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.at(0) === 3 && b.at(-1) === 1; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.pop() === 1; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.shift() === 3; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.join('-') === '3-2-1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.reduce((s,v)=>s+v,0) === 6; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.every((v)=>typeof v === 'number'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.some((v)=>v === 2); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.find((v)=>v > 2) === 3; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.findIndex((v)=>v === 1) === 2; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.map((v)=>v*2).join(',') === '6,4,2'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.filter((v)=>v>1).join(',') === '3,2'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.slice(0,2).join(',') === '3,2'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); const c = b.concat([0]); return c.join(',') === '3,2,1,0'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.reverse().join(',') === '1,2,3'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); b.sort(); return b.join(',') === '1,2,3'; },
    () => { const arr = ['10','2','1']; const b = toReversedCompat(arr); b.sort(); return b.join(',') === '1,10,2'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); b.splice(1,1); return b.join(',') === '3,1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); b.fill(9,1,2); return b.join(',') === '3,9,1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); b.copyWithin(1,0,1); return b.join(',') === '3,3,1'; },
    () => { const arr = [1,2,3,4]; const b = toReversedCompat(arr); return b.flatMap((x)=>[x]).join(',') === '4,3,2,1'; },
    () => { const arr = [[1],[2],[3]]; const b = toReversedCompat(arr); return b.flat().join(',') === '3,2,1'; },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCasePart3(idx) {
  const localIdx = idx - 80;
  const cases = [
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.keys().next().value === 0; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.values().next().value === 3; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.entries().next().value[1] === 3; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return [...b].join(',') === '3,2,1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return Reflect.ownKeys(b).length >= 3; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return Object.keys(b).join(',') === '0,1,2'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return Object.getOwnPropertyDescriptor(b, '0').value === 3; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return Object.getOwnPropertyNames(b).includes('length'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.length === 3 && b[0] === 3 && b[1] === 2 && b[2] === 1; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.lastIndexOf(3) === 0 && b.lastIndexOf(1) === 2; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.toLocaleString().length > 0; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return JSON.stringify(b) === '[3,2,1]'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return (0 in b) && (2 in b); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return typeof b[Symbol.iterator] === 'function'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); const x = []; b.forEach((v)=>x.push(v)); return x.join(',') === '3,2,1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return String(b) === '3,2,1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return `${b}` === '3,2,1'; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b.valueOf() === b; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b[Symbol.unscopables] === Array.prototype[Symbol.unscopables]; },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => b.with ? b.with(0, 9)[0] === 9 : true); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => b.toSpliced ? b.toSpliced(1,1).join(',') === '3,1' : true); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => b.toSorted ? b.toSorted().join(',') === '1,2,3' : true); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => Array.prototype.join.call(b, ',') === '3,2,1'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => Array.prototype.slice.call(b).join(',') === '3,2,1'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => Array.prototype.map.call(b, (v)=>v).join(',') === '3,2,1'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return safeExec(() => Object.isExtensible(b)); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); Object.preventExtensions(b); return !Object.isExtensible(b); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return Object.prototype.hasOwnProperty.call(b, '0') && Object.prototype.hasOwnProperty.call(b, '2'); },
    () => { const arr = [1,2,3]; const b = toReversedCompat(arr); return b[0] === 3 && b[2] === 1 && arr[0] === 1; },
    () => { const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'toReversed'); return desc === undefined || typeof desc.value === 'function'; },
  ];
  const fn = cases[localIdx];
  if (!fn) return false;
  return safeExec(fn);
}

function runCase(id) {
  const idx = id - 100;
  if (idx < 40) return runCasePart1(idx);
  if (idx < 80) return runCasePart2(idx);
  return runCasePart3(idx);
}

export function ToReversedJs_0100() {
  return runCase(100);
}

export function ToReversedJs_0101() {
  return runCase(101);
}

export function ToReversedJs_0102() {
  return runCase(102);
}

export function ToReversedJs_0103() {
  return runCase(103);
}

export function ToReversedJs_0104() {
  return runCase(104);
}

export function ToReversedJs_0105() {
  return runCase(105);
}

export function ToReversedJs_0106() {
  return runCase(106);
}

export function ToReversedJs_0107() {
  return runCase(107);
}

export function ToReversedJs_0108() {
  return runCase(108);
}

export function ToReversedJs_0109() {
  return runCase(109);
}

export function ToReversedJs_0110() {
  return runCase(110);
}

export function ToReversedJs_0111() {
  return runCase(111);
}

export function ToReversedJs_0112() {
  return runCase(112);
}

export function ToReversedJs_0113() {
  return runCase(113);
}

export function ToReversedJs_0114() {
  return runCase(114);
}

export function ToReversedJs_0115() {
  return runCase(115);
}

export function ToReversedJs_0116() {
  return runCase(116);
}

export function ToReversedJs_0117() {
  return runCase(117);
}

export function ToReversedJs_0118() {
  return runCase(118);
}

export function ToReversedJs_0119() {
  return runCase(119);
}

export function ToReversedJs_0120() {
  return runCase(120);
}

export function ToReversedJs_0121() {
  return runCase(121);
}

export function ToReversedJs_0122() {
  return runCase(122);
}

export function ToReversedJs_0123() {
  return runCase(123);
}

export function ToReversedJs_0124() {
  return runCase(124);
}

export function ToReversedJs_0125() {
  return runCase(125);
}

export function ToReversedJs_0126() {
  return runCase(126);
}

export function ToReversedJs_0127() {
  return runCase(127);
}

export function ToReversedJs_0128() {
  return runCase(128);
}

export function ToReversedJs_0129() {
  return runCase(129);
}

export function ToReversedJs_0130() {
  return runCase(130);
}

export function ToReversedJs_0131() {
  return runCase(131);
}

export function ToReversedJs_0132() {
  return runCase(132);
}

export function ToReversedJs_0133() {
  return runCase(133);
}

export function ToReversedJs_0134() {
  return runCase(134);
}

export function ToReversedJs_0135() {
  return runCase(135);
}

export function ToReversedJs_0136() {
  return runCase(136);
}

export function ToReversedJs_0137() {
  return runCase(137);
}

export function ToReversedJs_0138() {
  return runCase(138);
}

export function ToReversedJs_0139() {
  return runCase(139);
}

export function ToReversedJs_0140() {
  return runCase(140);
}

export function ToReversedJs_0141() {
  return runCase(141);
}

export function ToReversedJs_0142() {
  return runCase(142);
}

export function ToReversedJs_0143() {
  return runCase(143);
}

export function ToReversedJs_0144() {
  return runCase(144);
}

export function ToReversedJs_0145() {
  return runCase(145);
}

export function ToReversedJs_0146() {
  return runCase(146);
}

export function ToReversedJs_0147() {
  return runCase(147);
}

export function ToReversedJs_0148() {
  return runCase(148);
}

export function ToReversedJs_0149() {
  return runCase(149);
}

export function ToReversedJs_0150() {
  return runCase(150);
}

export function ToReversedJs_0151() {
  return runCase(151);
}

export function ToReversedJs_0152() {
  return runCase(152);
}

export function ToReversedJs_0153() {
  return runCase(153);
}

export function ToReversedJs_0154() {
  return runCase(154);
}

export function ToReversedJs_0155() {
  return runCase(155);
}

export function ToReversedJs_0156() {
  return runCase(156);
}

export function ToReversedJs_0157() {
  return runCase(157);
}

export function ToReversedJs_0158() {
  return runCase(158);
}

export function ToReversedJs_0159() {
  return runCase(159);
}

export function ToReversedJs_0160() {
  return runCase(160);
}

export function ToReversedJs_0161() {
  return runCase(161);
}

export function ToReversedJs_0162() {
  return runCase(162);
}

export function ToReversedJs_0163() {
  return runCase(163);
}

export function ToReversedJs_0164() {
  return runCase(164);
}

export function ToReversedJs_0165() {
  return runCase(165);
}

export function ToReversedJs_0166() {
  return runCase(166);
}

export function ToReversedJs_0167() {
  return runCase(167);
}

export function ToReversedJs_0168() {
  return runCase(168);
}

export function ToReversedJs_0169() {
  return runCase(169);
}

export function ToReversedJs_0170() {
  return runCase(170);
}

export function ToReversedJs_0171() {
  return runCase(171);
}

export function ToReversedJs_0172() {
  return runCase(172);
}

export function ToReversedJs_0173() {
  return runCase(173);
}

export function ToReversedJs_0174() {
  return runCase(174);
}

export function ToReversedJs_0175() {
  return runCase(175);
}

export function ToReversedJs_0176() {
  return runCase(176);
}

export function ToReversedJs_0177() {
  return runCase(177);
}

export function ToReversedJs_0178() {
  return runCase(178);
}

export function ToReversedJs_0179() {
  return runCase(179);
}

export function ToReversedJs_0180() {
  return runCase(180);
}

export function ToReversedJs_0181() {
  return runCase(181);
}

export function ToReversedJs_0182() {
  return runCase(182);
}

export function ToReversedJs_0183() {
  return runCase(183);
}

export function ToReversedJs_0184() {
  return runCase(184);
}

export function ToReversedJs_0185() {
  return runCase(185);
}

export function ToReversedJs_0186() {
  return runCase(186);
}

export function ToReversedJs_0187() {
  return runCase(187);
}

export function ToReversedJs_0188() {
  return runCase(188);
}

export function ToReversedJs_0189() {
  return runCase(189);
}

export function ToReversedJs_0190() {
  return runCase(190);
}

export function ToReversedJs_0191() {
  return runCase(191);
}

export function ToReversedJs_0192() {
  return runCase(192);
}

export function ToReversedJs_0193() {
  return runCase(193);
}

export function ToReversedJs_0194() {
  return runCase(194);
}

export function ToReversedJs_0195() {
  return runCase(195);
}

export function ToReversedJs_0196() {
  return runCase(196);
}

export function ToReversedJs_0197() {
  return runCase(197);
}

export function ToReversedJs_0198() {
  return runCase(198);
}

export function ToReversedJs_0199() {
  return runCase(199);
}
