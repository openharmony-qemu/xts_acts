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

function same(a, b) {
  if (!Array.isArray(a) || !Array.isArray(b) || a.length !== b.length) {
    return false;
  }
  for (let i = 0; i < a.length; i++) {
    if (!Object.is(a[i], b[i])) {
      return false;
    }
  }
  return true;
}

function tsp(target, ...args) {
  if (typeof Array.prototype.toSpliced !== 'function') {
    return [];
  }
  return Array.prototype.toSpliced.apply(target, args);
}

function runCase(id) {
  const idx = id - 100;
  const cases = [
    () => same(tsp([1, 2, 3, 4, 5], 2, 1), [1, 2, 4, 5]),
    () => same(tsp([1, 2, 3, 4, 5], 0, 2), [3, 4, 5]),
    () => same(tsp([1, 2, 3, 4, 5], 3, 2), [1, 2, 3]),
    () => same(tsp([1, 2, 3], 0, 3), []),
    () => same(tsp([1, 2, 5, 6], 2, 0, 3, 4), [1, 2, 3, 4, 5, 6]),
    () => same(tsp([3, 4, 5], 0, 0, 1, 2), [1, 2, 3, 4, 5]),
    () => same(tsp([1, 2, 3], 3, 0, 4, 5), [1, 2, 3, 4, 5]),
    () => same(tsp([1, 3], 1, 0, 2), [1, 2, 3]),
    () => same(tsp([1, 5], 1, 0, 2, 3, 4), [1, 2, 3, 4, 5]),
    () => same(tsp([1, 2, 3], 1, 1, 20), [1, 20, 3]),
    () => same(tsp([1, 2, 5], 1, 1, 3, 4), [1, 3, 4, 5]),
    () => same(tsp([1, 2, 3, 4, 5], 1, 3, 10), [1, 10, 5]),
    () => same(tsp([1, 2, 3, 4, 5], 1, 2, 10, 20, 30, 40), [1, 10, 20, 30, 40, 4, 5]),
    () => {
  const a = [1, 2, 3];
  const r = tsp(a, 0, 0);
  return same(r, [1, 2, 3]) && r !== a;
},
    () => {
  const a = [1, 2, 3];
  const r = tsp(a, 3);
  return same(r, [1, 2, 3]) && r !== a;
},
    () => same(tsp([1, 2, 3, 4], 0, 2, 10), [10, 3, 4]),
    () => same(tsp([1, 2, 3, 4, 5], 2, 1, 30), [1, 2, 30, 4, 5]),
    () => same(tsp([1, 2, 3], 3, 0, 4, 5), [1, 2, 3, 4, 5]),
    () => same(tsp([1, 2, 3, 4, 5], 10, 0, 9), [1, 2, 3, 4, 5, 9]),
    () => same(tsp([1, 2, 3, 4, 5], -1, 1), [1, 2, 3, 4]),
    () => same(tsp([1, 2, 3, 4, 5], -2, 2), [1, 2, 3]),
    () => same(tsp([1, 2, 3], -3, 1), [2, 3]),
    () => same(tsp([1, 2, 3], -10, 1), [2, 3]),
    () => {
  const a = [1, 2, 3];
  const r = tsp(a);
  return same(r, [1, 2, 3]) && r !== a;
},
    () => same(tsp([1, 2, 3], NaN, 1), [2, 3]),
    () => same(tsp([1, 2, 3], Infinity, 0, 9), [1, 2, 3, 9]),
    () => same(tsp([1, 2, 3], -Infinity, 1, 9), [9, 2, 3]),
    () => same(tsp([1, 2, 3], 1.7, 1, 9), [1, 9, 3]),
    () => same(tsp([1, 2, 3], '1', 1, 9), [1, 9, 3]),
    () => same(tsp([1, 2, 3], null, 1, 9), [9, 2, 3]),
    () => same(tsp([1, 2, 3], undefined, 1, 9), [9, 2, 3]),
    () => same(tsp([1, 2, 3], true, 1, 9), [1, 9, 3]) && same(tsp([1, 2, 3], false, 1, 9), [9, 2, 3]),
    () => same(tsp([1, 2, 3, 4], 1, 0, 9), [1, 9, 2, 3, 4]),
    () => same(tsp([1, 2, 3, 4, 5], 2, 2), [1, 2, 5]),
    () => same(tsp([1, 2, 3, 4, 5], 2, 3), [1, 2]),
    () => same(tsp([1, 2, 3, 4, 5], 2, 99), [1, 2]),
    () => same(tsp([1, 2, 3, 4, 5], 2), [1, 2]),
    () => same(tsp([1, 2, 3], 0, undefined), [1, 2, 3]),
    () => same(tsp([1, 2, 3], 0, undefined, 9), [9, 1, 2, 3]),
    () => same(tsp([1, 2, 3], 0, Infinity, 9), [9]),
    () => same(tsp([1, 2, 3], 1, -1, 9), [1, 9, 2, 3]),
    () => same(tsp([1, 2, 3], 0, NaN, 9), [9, 1, 2, 3]),
    () => same(tsp([1, 2, 3], 0, 1.9, 9), [9, 2, 3]),
    () => same(tsp([1, 2, 3], 0, '1', 9), [9, 2, 3]),
    () => same(tsp([1, 2, 3], 0, null, 9), [9, 1, 2, 3]),
    () => same(tsp([1, 2, 3], 0, true, 9), [9, 2, 3]) && same(tsp([1, 2, 3], 0, false, 9), [9, 1, 2, 3]),
    () => same(tsp([0], 0, 1, 42), [42]),
    () => same(tsp([0], 0, 1, 'x'), ['x']),
    () => {
  const o = { k: 1 };
  return same(tsp([0], 0, 1, o), [o]);
},
    () => {
  const r = tsp([0], 0, 1, [1, 2]);
  return Array.isArray(r[0]) && r[0][0] === 1 && r[0][1] === 2;
},
    () => same(tsp([1, 2], 1, 0, undefined), [1, undefined, 2]),
    () => same(tsp([1, 2], 1, 0, null), [1, null, 2]),
    () => same(tsp([1, 2], 1, 0, true), [1, true, 2]),
    () => {
  const fn = () => 1;
  const r = tsp([1, 2], 1, 0, fn);
  return r[1] === fn;
},
    () => {
  const s = Symbol('x');
  return same(tsp([1, 2], 1, 0, s), [1, s, 2]);
},
    () => same(tsp([1n, 2n], 1, 0, 3n), [1n, 3n, 2n]),
    () => same(tsp([1, 2, 3], 1, 1), [1, 3]),
    () => same(tsp([1, 3], 1, 0, 2), [1, 2, 3]),
    () => same(tsp([1, 5], 1, 0, 2, 3, 4), [1, 2, 3, 4, 5]),
    () => {
  const items = Array.from({ length: 200 }, (_, i) => i);
  const a = [0];
  return tsp(a, 1, 0, ...items).length === 201;
},
    () => {
  const d = new Date(1);
  return tsp([0], 0, 1, d)[0] === d;
},
    () => {
  const rx = /a/;
  return tsp([0], 0, 1, rx)[0] === rx;
},
    () => {
  const m = new Map([[1, 2]]);
  const s = new Set([3]);
  const r = tsp([0, 0], 1, 0, m, s);
  return r.length === 4 && r[1] === m && r[2] === s;
},
    () => {
  const inner = [, 2];
  const r = tsp([1], 1, 0, inner);
  return Array.isArray(r[1]) && r[1].length === 2;
},
    () => {
  const a = [1, 2, 3];
  const r = tsp(a, 1, 1, 9);
  return r !== a && same(r, [1, 9, 3]);
},
    () => tsp([1, 2, 3], 1, 1, 9).length === 3,
    () => Array.isArray(tsp([1, 2, 3], 1, 1, 9)),
    () => same(tsp([1, 2, 3, 4], 1, 2, 9), [1, 9, 4]),
    () => {
  const a = [3, 1, 2];
  const s = a.join(',');
  tsp(a, 1, 1, 9);
  return a.join(',') === s;
},
    () => {
  const a = [1, 2, 3];
  const r = tsp(a, 0, 0);
  return a.length === 3 && r.length === 3;
},
    () => {
  const o = { x: 1 };
  const a = [o, { y: 2 }];
  const r = tsp(a, 0, 0);
  return r[0] === o && r[1] === a[1];
},
    () => {
  const a = [1, 2, 3];
  const r1 = tsp(a, 1, 0, 9);
  const r2 = tsp(a, 2, 0, 8);
  return same(r1, [1, 9, 2, 3]) && same(r2, [1, 2, 8, 3]) && a.join(',') === '1,2,3';
},
    () => {
  const o = { a: 1 };
  const a = [o];
  const r = tsp(a, 0, 0);
  return r !== a && r[0] === o;
},
    () => {
  const o = { a: 1 };
  const x = { b: 2 };
  const a = [o, x, { c: 3 }];
  const r = tsp(a, 1, 1, 9);
  return r[0] === o && r[2] === a[2];
},
    () => {
  const a = [1, , 3];
  const r = tsp(a, 0, 0);
  return r[1] === undefined && Object.prototype.hasOwnProperty.call(r, '1');
},
    () => {
  const a = [1, , 3];
  const r = tsp(a, 0, 0);
  for (let i = 0; i < r.length; i++) {
    if (!Object.prototype.hasOwnProperty.call(r, String(i))) {
      return false;
    }
  }
  return true;
},
    () => same(tsp([1, , 3, 4], 1, 2, 9), [1, 9, 4]),
    () => {
  const r = tsp([1, , 3, 4], 0, 1, 9);
  return r.length === 4 && r[1] === undefined && Object.prototype.hasOwnProperty.call(r, '1');
},
    () => {
  const r = tsp(new Array(3), 0, 0);
  return r.length === 3 && r.every((_, i) => Object.prototype.hasOwnProperty.call(r, String(i)));
},
    () => {
  const b = [1];
  b[10] = 2;
  const r = tsp(b, 0, 0);
  return r.length === 11 && r[5] === undefined;
},
    () => {
  const r = tsp([], 0, 0, 1);
  return Array.isArray(r) && r.length === 1 && r[0] === 1;
},
    () => {
  const r = tsp([]);
  return r.length === 0 && r !== [];
},
    () => {
  const r = tsp([], 0);
  return r.length === 0;
},
    () => same(tsp([42], 0, 1), []),
    () => same(tsp([42], 0, 1, 99), [99]),
    () => same(tsp([42], 0, 0, 1, 2), [1, 2, 42]),
    () => {
  const r = tsp([1, 'a', true], 1, 1, 'b');
  return r.length === 3 && r[1] === 'b';
},
    () => {
  const r = tsp([1, 'a'], 1, 0, null, false, 3n);
  return r.length === 5;
},
    () => {
  const a = Array.from({ length: 500 }, (_, i) => i);
  const r = tsp(a, 100, 50);
  return r.length === 450 && r[0] === 0 && r[449] === 499;
},
    () => {
  const a = Array.from({ length: 300 }, (_, i) => i);
  const ins = Array.from({ length: 50 }, (_, i) => i + 1000);
  const r = tsp(a, 10, 0, ...ins);
  return r.length === 350;
},
    () => {
  const a = Object.freeze([3, 1, 2]);
  return same(tsp(a, 1, 1, 9), [3, 9, 2]) && same(a, [3, 1, 2]);
},
    () => {
  const a = Object.seal([3, 1, 2]);
  return same(tsp(a, 1, 1, 9), [3, 9, 2]);
},
    () => {
  const al = { length: 3, unrelated: 'foo', 0: 5, 2: 4 };
  const r = tsp(al, 0, 1, 2, 3);
  return r.length === 4 && r[0] === 2 && r[1] === 3 && r[3] === 4;
},
    () => {
  function f() {
    return tsp(arguments, 1, 1, 'new');
  }
  return same(f(1, 2, 3), [1, 'new', 3]);
},
    () => same(tsp('abc', 1, 1, 'X'), ['a', 'X', 'c']),
    () => {
  if (typeof document === 'undefined') {
    return true;
  }
  const fake = { length: 2, 0: 'a', 1: 'b' };
  return tsp(fake, 0, 1).length === 1;
},
    () => same(tsp({ length: 0 }, 0, 0, 1), [1]),
    () => {
  const obj = { length: 5, 0: 'a', 2: 'c' };
  const r = tsp(obj, 1, 2, 'X');
  return r[0] === 'a' && r[1] === 'X' && r.length >= 4;
},
    () => {
  const obj = { length: 2, 0: 'a', 1: 'b', 2: 'c', 3: 'd' };
  return same(tsp(obj, 1, 1, 'X'), ['a', 'X']);
},
    () => same(tsp({ length: -1, 0: 'a', 1: 'b' }, 0, 0, 'new'), ['new']),

  ];
  const fn = cases[idx];
  if (!fn) {
    return false;
  }
  return safeExec(fn);
}

export function ToSplicedJs_0100() {
  return runCase(100);
}
export function ToSplicedJs_0101() {
  return runCase(101);
}
export function ToSplicedJs_0102() {
  return runCase(102);
}
export function ToSplicedJs_0103() {
  return runCase(103);
}
export function ToSplicedJs_0104() {
  return runCase(104);
}
export function ToSplicedJs_0105() {
  return runCase(105);
}
export function ToSplicedJs_0106() {
  return runCase(106);
}
export function ToSplicedJs_0107() {
  return runCase(107);
}
export function ToSplicedJs_0108() {
  return runCase(108);
}
export function ToSplicedJs_0109() {
  return runCase(109);
}
export function ToSplicedJs_0110() {
  return runCase(110);
}
export function ToSplicedJs_0111() {
  return runCase(111);
}
export function ToSplicedJs_0112() {
  return runCase(112);
}
export function ToSplicedJs_0113() {
  return runCase(113);
}
export function ToSplicedJs_0114() {
  return runCase(114);
}
export function ToSplicedJs_0115() {
  return runCase(115);
}
export function ToSplicedJs_0116() {
  return runCase(116);
}
export function ToSplicedJs_0117() {
  return runCase(117);
}
export function ToSplicedJs_0118() {
  return runCase(118);
}
export function ToSplicedJs_0119() {
  return runCase(119);
}
export function ToSplicedJs_0120() {
  return runCase(120);
}
export function ToSplicedJs_0121() {
  return runCase(121);
}
export function ToSplicedJs_0122() {
  return runCase(122);
}
export function ToSplicedJs_0123() {
  return runCase(123);
}
export function ToSplicedJs_0124() {
  return runCase(124);
}
export function ToSplicedJs_0125() {
  return runCase(125);
}
export function ToSplicedJs_0126() {
  return runCase(126);
}
export function ToSplicedJs_0127() {
  return runCase(127);
}
export function ToSplicedJs_0128() {
  return runCase(128);
}
export function ToSplicedJs_0129() {
  return runCase(129);
}
export function ToSplicedJs_0130() {
  return runCase(130);
}
export function ToSplicedJs_0131() {
  return runCase(131);
}
export function ToSplicedJs_0132() {
  return runCase(132);
}
export function ToSplicedJs_0133() {
  return runCase(133);
}
export function ToSplicedJs_0134() {
  return runCase(134);
}
export function ToSplicedJs_0135() {
  return runCase(135);
}
export function ToSplicedJs_0136() {
  return runCase(136);
}
export function ToSplicedJs_0137() {
  return runCase(137);
}
export function ToSplicedJs_0138() {
  return runCase(138);
}
export function ToSplicedJs_0139() {
  return runCase(139);
}
export function ToSplicedJs_0140() {
  return runCase(140);
}
export function ToSplicedJs_0141() {
  return runCase(141);
}
export function ToSplicedJs_0142() {
  return runCase(142);
}
export function ToSplicedJs_0143() {
  return runCase(143);
}
export function ToSplicedJs_0144() {
  return runCase(144);
}
export function ToSplicedJs_0145() {
  return runCase(145);
}
export function ToSplicedJs_0146() {
  return runCase(146);
}
export function ToSplicedJs_0147() {
  return runCase(147);
}
export function ToSplicedJs_0148() {
  return runCase(148);
}
export function ToSplicedJs_0149() {
  return runCase(149);
}
export function ToSplicedJs_0150() {
  return runCase(150);
}
export function ToSplicedJs_0151() {
  return runCase(151);
}
export function ToSplicedJs_0152() {
  return runCase(152);
}
export function ToSplicedJs_0153() {
  return runCase(153);
}
export function ToSplicedJs_0154() {
  return runCase(154);
}
export function ToSplicedJs_0155() {
  return runCase(155);
}
export function ToSplicedJs_0156() {
  return runCase(156);
}
export function ToSplicedJs_0157() {
  return runCase(157);
}
export function ToSplicedJs_0158() {
  return runCase(158);
}
export function ToSplicedJs_0159() {
  return runCase(159);
}
export function ToSplicedJs_0160() {
  return runCase(160);
}
export function ToSplicedJs_0161() {
  return runCase(161);
}
export function ToSplicedJs_0162() {
  return runCase(162);
}
export function ToSplicedJs_0163() {
  return runCase(163);
}
export function ToSplicedJs_0164() {
  return runCase(164);
}
export function ToSplicedJs_0165() {
  return runCase(165);
}
export function ToSplicedJs_0166() {
  return runCase(166);
}
export function ToSplicedJs_0167() {
  return runCase(167);
}
export function ToSplicedJs_0168() {
  return runCase(168);
}
export function ToSplicedJs_0169() {
  return runCase(169);
}
export function ToSplicedJs_0170() {
  return runCase(170);
}
export function ToSplicedJs_0171() {
  return runCase(171);
}
export function ToSplicedJs_0172() {
  return runCase(172);
}
export function ToSplicedJs_0173() {
  return runCase(173);
}
export function ToSplicedJs_0174() {
  return runCase(174);
}
export function ToSplicedJs_0175() {
  return runCase(175);
}
export function ToSplicedJs_0176() {
  return runCase(176);
}
export function ToSplicedJs_0177() {
  return runCase(177);
}
export function ToSplicedJs_0178() {
  return runCase(178);
}
export function ToSplicedJs_0179() {
  return runCase(179);
}
export function ToSplicedJs_0180() {
  return runCase(180);
}
export function ToSplicedJs_0181() {
  return runCase(181);
}
export function ToSplicedJs_0182() {
  return runCase(182);
}
export function ToSplicedJs_0183() {
  return runCase(183);
}
export function ToSplicedJs_0184() {
  return runCase(184);
}
export function ToSplicedJs_0185() {
  return runCase(185);
}
export function ToSplicedJs_0186() {
  return runCase(186);
}
export function ToSplicedJs_0187() {
  return runCase(187);
}
export function ToSplicedJs_0188() {
  return runCase(188);
}
export function ToSplicedJs_0189() {
  return runCase(189);
}
export function ToSplicedJs_0190() {
  return runCase(190);
}
export function ToSplicedJs_0191() {
  return runCase(191);
}
export function ToSplicedJs_0192() {
  return runCase(192);
}
export function ToSplicedJs_0193() {
  return runCase(193);
}
export function ToSplicedJs_0194() {
  return runCase(194);
}
export function ToSplicedJs_0195() {
  return runCase(195);
}
export function ToSplicedJs_0196() {
  return runCase(196);
}
export function ToSplicedJs_0197() {
  return runCase(197);
}
export function ToSplicedJs_0198() {
  return runCase(198);
}
export function ToSplicedJs_0199() {
  return runCase(199);
}
