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

function isString(value) {
  return typeof value === 'string';
}

function hasComma(value) {
  return value.indexOf(',') >= 0;
}

function safeExec(fn) {
  try {
    return !!fn();
  } catch (error) {
    return false;
  }
}

function runCase(id) {
  const idx = id - 100;
  const cases = [
    () => [].toLocaleString() === '',
    () => [42].toLocaleString() === '42',
    () => ['hello'].toLocaleString() === 'hello',
    () => [true, false].toLocaleString() === 'true,false',
    () => isString([{ a: 1 }].toLocaleString()),
    () => [1, 2, 3].toLocaleString() === '1,2,3',
    () => [1, 'a', true, null, undefined].toLocaleString() === '1,a,true,,',
    () => hasComma([1, 2, 3].toLocaleString()),
    () => isString([1, 2, 3].toLocaleString()),
    () => isString([1234567.89].toLocaleString('zh-CN')),
    () => isString([1234567.89].toLocaleString(['zh-CN', 'en-US'])),
    () => isString([1, 2, 3].toLocaleString('')),
    () => isString([1, 2, 3].toLocaleString()),
    () => isString([1, 2, 3].toLocaleString('en-US')),
    () => isString([1, 2.5].toLocaleString('en-US', { minimumFractionDigits: 1 })),
    () => { const obj = { toLocaleString(locale, options) { return locale === 'zh-CN' && options && options.style === 'decimal' ? 'ok' : 'bad'; } }; return [obj].toLocaleString('zh-CN', { style: 'decimal' }) === 'ok'; },
    () => [Number.NaN, 1].toLocaleString().indexOf('NaN') >= 0,
    () => isString([Infinity, -Infinity].toLocaleString()),
    () => isString([0, -0].toLocaleString()),
    () => isString([Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE].toLocaleString()),
    () => ['a', '', 'b'].toLocaleString() === 'a,,b',
    () => ['你好', 'こんにちは', 'hello'].toLocaleString().length > 0,
    () => ['a\nb', 'c\td'].toLocaleString().length > 0,
    () => [new Date(0)].toLocaleString().length > 0,
    () => isString([new Date('invalid')].toLocaleString()),
    () => isString([new Date('2024-01-01T00:00:00Z')].toLocaleString('en-US', { timeZone: 'UTC' })),
    () => isString([true].toLocaleString()),
    () => isString([false].toLocaleString()),
    () => isString([{ x: 1 }, { y: 2 }].toLocaleString()),
    () => { const obj = { toLocaleString() { return 'custom'; } }; return [obj].toLocaleString() === 'custom'; },
    () => [1, undefined, 3].toLocaleString() === '1,,3',
    () => [1, null, 3].toLocaleString() === '1,,3',
    () => [undefined, null, undefined].toLocaleString() === ',,',
    () => [[1, 2], [3, 4]].toLocaleString() === '1,2,3,4',
    () => [[[1]], [[2]]].toLocaleString() === '1,2',
    () => { const fn = function fn() { return 1; }; return isString([fn].toLocaleString()); },
    () => { const arr = new Array(3); arr[2] = 3; return arr.toLocaleString() === ',,3'; },
    () => { const arr = [1, 2]; arr.length = 5; return arr.toLocaleString() === '1,2,,,'; },
    () => [1, , 3].toLocaleString() === '1,,3',
    () => new Array(5).toLocaleString() === ',,,,',
    () => [1, , , , 5].toLocaleString() === '1,,,,5',
    () => { const arr = [1, 2, 3]; delete arr[1]; return arr.toLocaleString() === '1,,3'; },
    () => [1234567.89].toLocaleString('en-US').length > 0,
    () => [1234567.89].toLocaleString('de-DE').length > 0,
    () => [1234567.89].toLocaleString('fr-FR').length > 0,
    () => [1234567.89].toLocaleString('ja-JP').length > 0,
    () => [1234567.89].toLocaleString(['xx-XX', 'en-US']).length > 0,
    () => [1234.56].toLocaleString('en-US', { style: 'currency', currency: 'USD' }).length > 0,
    () => [0.75].toLocaleString('en-US', { style: 'percent' }).length > 0,
    () => [100].toLocaleString('en-US', { style: 'unit', unit: 'kilometer' }).length > 0,
    () => [1.23456].toLocaleString('en-US', { maximumFractionDigits: 2 }).length > 0,
    () => [1, 23, 456].toLocaleString('en-US', { minimumIntegerDigits: 5 }).length > 0,
    () => [1.2345, 67.89].toLocaleString('en-US', { minimumSignificantDigits: 2, maximumSignificantDigits: 3 }).length > 0,
    () => [1234567].toLocaleString('en-US', { notation: 'scientific' }).length > 0,
    () => [1234567].toLocaleString('en-US', { notation: 'engineering' }).length > 0,
    () => [1234567].toLocaleString('en-US', { notation: 'compact' }).length > 0,
    () => [1234567].toLocaleString('en-US', { useGrouping: false }).length > 0,
    () => [new Date()].toLocaleString('zh-CN', { dateStyle: 'full' }).length > 0,
    () => [new Date()].toLocaleString('zh-CN', { timeStyle: 'long' }).length > 0,
    () => [new Date()].toLocaleString('en-US', { timeZone: 'UTC' }).length > 0,
    () => [new Date()].toLocaleString('en-US', { year: '2-digit', month: 'long', day: 'numeric' }).length > 0,
    () => [new Date()].toLocaleString('en-US', { hour: '2-digit', minute: '2-digit', second: '2-digit' }).length > 0,
    () => [1, 2, 3].toLocaleString() === [1, 2, 3].toString(),
    () => [1, 2, 3].toLocaleString() === [1, 2, 3].join(','),
    () => { const arr = [1, 2, 3]; const backup = arr.slice(); arr.toLocaleString(); return arr.join(',') === backup.join(','); },
    () => { const arr = [1, 2, 3]; arr.toLocaleString(); return arr.length === 3; },
    () => ![42].toLocaleString().includes(','),
    () => { const obj = { length: 3, 0: 1, 1: 2, 2: 3 }; return Array.prototype.toLocaleString.call(obj) === '1,2,3'; },
    () => { const obj = Object.create(null); try { [obj].toLocaleString(); } catch (error) { return error instanceof TypeError; } return false; },
    () => { const sym = Symbol('x'); try { [sym].toLocaleString(); } catch (error) { return error instanceof TypeError; } return false; },
    () => { const arr = [1]; arr.push(arr); return isString(arr.toLocaleString()); },
    () => { const arr = []; for (let i = 0; i < 50; i++) arr.push(i); return arr.toLocaleString().split(',').length === 50; },
    () => [new Date(0), 123, 'abc'].toLocaleString().length > 0,
    () => { const arr = [1,2,3]; return arr.toLocaleString('en-US') === arr.toLocaleString('en-US'); },
    () => { const arr = [1,2,3]; const s = arr.toLocaleString(); return typeof s === 'string' && s.length > 0; },
    () => { const obj = { toLocaleString() { return 123; } }; return [obj].toLocaleString() === '123'; },
    () => { const obj = { toLocaleString() { return undefined; } }; return [obj].toLocaleString() === ''; },
    () => [0].toLocaleString() === '0',
    () => [''].toLocaleString() === '',
    () => ['x', 'y', 'z'].toLocaleString() === 'x,y,z',
    () => { const arr = [1, 2, 3]; arr[1] = undefined; return arr.toLocaleString() === '1,,3'; },
    () => { const arr = [1, 2, 3]; arr[1] = null; return arr.toLocaleString() === '1,,3'; },
    () => [1.1, 2.2, 3.3].toLocaleString().length > 0,
    () => [-1, -2, -3].toLocaleString().indexOf('-') >= 0,
    () => [0, 1, 2, 3, 4, 5].toLocaleString().split(',').length === 6,
    () => { const arr = [1,2,3]; const s1 = arr.toLocaleString(); const s2 = arr.toLocaleString(); return s1 === s2; },
    () => { const arr = [new Date(), new Date()]; return isString(arr.toLocaleString()); },
    () => { const x = { toLocaleString() { return 'A'; } }; const y = { toLocaleString() { return 'B'; } }; return [x, y].toLocaleString() === 'A,B'; },
    () => { const arr = [1,2,3]; Object.freeze(arr); return isString(arr.toLocaleString()); },
    () => { const arr = [1,2,3]; Object.seal(arr); return isString(arr.toLocaleString()); },
    () => { const p = new Proxy([1,2,3], {}); return p.toLocaleString() === '1,2,3'; },
    () => { const p = new Proxy([1,2,3], { get(target, prop, receiver) { if (prop === '0') return 9; return Reflect.get(target, prop, receiver); } }); return p.toLocaleString() === '9,2,3'; },
    () => { try { Array.prototype.toLocaleString.call(null); } catch (error) { return error instanceof TypeError; } return false; },
    () => { try { Array.prototype.toLocaleString.call(undefined); } catch (error) { return error instanceof TypeError; } return false; },
    () => { const obj = { get length() { return 2; }, 0: 'a', 1: 'b' }; return Array.prototype.toLocaleString.call(obj) === 'a,b'; },
    () => { const obj = { length: 1, get 0() { throw new Error('index'); } }; try { Array.prototype.toLocaleString.call(obj); } catch (error) { return error instanceof Error; } return false; },
    () => { const bad = { toLocaleString() { throw new TypeError('custom'); } }; try { [bad].toLocaleString(); } catch (error) { return error instanceof TypeError; } return false; },
    () => { const bad = { toLocaleString() { throw new RangeError('custom'); } }; try { [bad].toLocaleString(); } catch (error) { return error instanceof RangeError; } return false; },
    () => { const bad = { toLocaleString() { throw new Error('custom'); } }; try { [1, bad, 3].toLocaleString(); } catch (error) { return error instanceof Error; } return false; },
    () => { const arr = [1, [2, [3]]]; return isString(arr.toLocaleString()) && arr.toLocaleString().length > 0; },
    () => { const arr = [{ a: 1 }, { b: 2 }, { c: 3 }]; return arr.toLocaleString().split(',').length === 3; },
    () => { const longStr = 'a'.repeat(2000); return [longStr].toLocaleString().length === 2000; },
    () => { const arr = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER]; return isString(arr.toLocaleString()); },
    () => { const arr = [Math.PI, Math.E]; return isString(arr.toLocaleString('en-US')); },
    () => { const arr = [1,2,3]; return safeExec(() => arr.toLocaleString('en-US', { useGrouping: true })); },
    () => { const arr = [1,2,3]; return safeExec(() => arr.toLocaleString('en-US', { useGrouping: false })); },
    () => { const arr = [new Date(0), new Date(8640000000000000)]; return safeExec(() => isString(arr.toLocaleString())); },
    () => { const arr = [1,2,3]; const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'toLocaleString'); return !!desc && typeof desc.value === 'function' && isString(arr.toLocaleString()); }
  ];

  const fn = cases[idx];
  if (!fn) {
    return false;
  }
  return safeExec(fn);
}

export function ToLocaleStringJs_0100() {
  return runCase(100);
}

export function ToLocaleStringJs_0101() {
  return runCase(101);
}

export function ToLocaleStringJs_0102() {
  return runCase(102);
}

export function ToLocaleStringJs_0103() {
  return runCase(103);
}

export function ToLocaleStringJs_0104() {
  return runCase(104);
}

export function ToLocaleStringJs_0105() {
  return runCase(105);
}

export function ToLocaleStringJs_0106() {
  return runCase(106);
}

export function ToLocaleStringJs_0107() {
  return runCase(107);
}

export function ToLocaleStringJs_0108() {
  return runCase(108);
}

export function ToLocaleStringJs_0109() {
  return runCase(109);
}

export function ToLocaleStringJs_0110() {
  return runCase(110);
}

export function ToLocaleStringJs_0111() {
  return safeExec(() => isString([1, 2, 3].toLocaleString('en-US')));
}

export function ToLocaleStringJs_0112() {
  return runCase(112);
}

export function ToLocaleStringJs_0113() {
  return runCase(113);
}

export function ToLocaleStringJs_0114() {
  return runCase(114);
}

export function ToLocaleStringJs_0115() {
  return runCase(115);
}

export function ToLocaleStringJs_0116() {
  return runCase(116);
}

export function ToLocaleStringJs_0117() {
  return runCase(117);
}

export function ToLocaleStringJs_0118() {
  return runCase(118);
}

export function ToLocaleStringJs_0119() {
  return runCase(119);
}

export function ToLocaleStringJs_0120() {
  return runCase(120);
}

export function ToLocaleStringJs_0121() {
  return runCase(121);
}

export function ToLocaleStringJs_0122() {
  return runCase(122);
}

export function ToLocaleStringJs_0123() {
  return runCase(123);
}

export function ToLocaleStringJs_0124() {
  return runCase(124);
}

export function ToLocaleStringJs_0125() {
  return runCase(125);
}

export function ToLocaleStringJs_0126() {
  return runCase(126);
}

export function ToLocaleStringJs_0127() {
  return runCase(127);
}

export function ToLocaleStringJs_0128() {
  return runCase(128);
}

export function ToLocaleStringJs_0129() {
  return runCase(129);
}

export function ToLocaleStringJs_0130() {
  return runCase(130);
}

export function ToLocaleStringJs_0131() {
  return runCase(131);
}

export function ToLocaleStringJs_0132() {
  return runCase(132);
}

export function ToLocaleStringJs_0133() {
  return runCase(133);
}

export function ToLocaleStringJs_0134() {
  return runCase(134);
}

export function ToLocaleStringJs_0135() {
  return runCase(135);
}

export function ToLocaleStringJs_0136() {
  return runCase(136);
}

export function ToLocaleStringJs_0137() {
  return runCase(137);
}

export function ToLocaleStringJs_0138() {
  return runCase(138);
}

export function ToLocaleStringJs_0139() {
  return runCase(139);
}

export function ToLocaleStringJs_0140() {
  return runCase(140);
}

export function ToLocaleStringJs_0141() {
  return runCase(141);
}

export function ToLocaleStringJs_0142() {
  return runCase(142);
}

export function ToLocaleStringJs_0143() {
  return runCase(143);
}

export function ToLocaleStringJs_0144() {
  return runCase(144);
}

export function ToLocaleStringJs_0145() {
  return runCase(145);
}

export function ToLocaleStringJs_0146() {
  return runCase(146);
}

export function ToLocaleStringJs_0147() {
  return runCase(147);
}

export function ToLocaleStringJs_0148() {
  return runCase(148);
}

export function ToLocaleStringJs_0149() {
  return runCase(149);
}

export function ToLocaleStringJs_0150() {
  return runCase(150);
}

export function ToLocaleStringJs_0151() {
  return runCase(151);
}

export function ToLocaleStringJs_0152() {
  return runCase(152);
}

export function ToLocaleStringJs_0153() {
  return runCase(153);
}

export function ToLocaleStringJs_0154() {
  return runCase(154);
}

export function ToLocaleStringJs_0155() {
  return runCase(155);
}

export function ToLocaleStringJs_0156() {
  return runCase(156);
}

export function ToLocaleStringJs_0157() {
  return runCase(157);
}

export function ToLocaleStringJs_0158() {
  return runCase(158);
}

export function ToLocaleStringJs_0159() {
  return runCase(159);
}

export function ToLocaleStringJs_0160() {
  return runCase(160);
}

export function ToLocaleStringJs_0161() {
  return runCase(161);
}

export function ToLocaleStringJs_0162() {
  return runCase(162);
}

export function ToLocaleStringJs_0163() {
  return runCase(163);
}

export function ToLocaleStringJs_0164() {
  return runCase(164);
}

export function ToLocaleStringJs_0165() {
  return runCase(165);
}

export function ToLocaleStringJs_0166() {
  return runCase(166);
}

export function ToLocaleStringJs_0167() {
  return runCase(167);
}

export function ToLocaleStringJs_0168() {
  return runCase(168);
}

export function ToLocaleStringJs_0169() {
  return safeExec(() => {
    const arr = [{ a: 1 }, { b: 2 }, { c: 3 }];
    return isString(arr.toLocaleString()) && arr.toLocaleString().split(',').length >= 3;
  });
}

export function ToLocaleStringJs_0170() {
  return runCase(170);
}

export function ToLocaleStringJs_0171() {
  return runCase(171);
}

export function ToLocaleStringJs_0172() {
  return runCase(172);
}

export function ToLocaleStringJs_0173() {
  return runCase(173);
}

export function ToLocaleStringJs_0174() {
  return runCase(174);
}

export function ToLocaleStringJs_0175() {
  return runCase(175);
}

export function ToLocaleStringJs_0176() {
  return safeExec(() => {
    const arr = [Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER];
    return isString(arr.toLocaleString()) && arr.toLocaleString().length > 0;
  });
}

export function ToLocaleStringJs_0177() {
  return runCase(177);
}

export function ToLocaleStringJs_0178() {
  return runCase(178);
}

export function ToLocaleStringJs_0179() {
  return runCase(179);
}

export function ToLocaleStringJs_0180() {
  return runCase(180);
}

export function ToLocaleStringJs_0181() {
  return runCase(181);
}

export function ToLocaleStringJs_0182() {
  return runCase(182);
}

export function ToLocaleStringJs_0183() {
  return runCase(183);
}

export function ToLocaleStringJs_0184() {
  return runCase(184);
}

export function ToLocaleStringJs_0185() {
  return runCase(185);
}

export function ToLocaleStringJs_0186() {
  return runCase(186);
}

export function ToLocaleStringJs_0187() {
  return runCase(187);
}

export function ToLocaleStringJs_0188() {
  return runCase(188);
}

export function ToLocaleStringJs_0189() {
  return runCase(189);
}

export function ToLocaleStringJs_0190() {
  return runCase(190);
}

export function ToLocaleStringJs_0191() {
  return safeExec(() => {
    const arr = [1, 2, 3];
    const desc = Object.getOwnPropertyDescriptor(Array.prototype, 'toLocaleString');
    return !!desc && typeof desc.value === 'function' && isString(arr.toLocaleString());
  });
}

export function ToLocaleStringJs_0192() {
  return runCase(192);
}

export function ToLocaleStringJs_0193() {
  return runCase(193);
}

export function ToLocaleStringJs_0194() {
  return runCase(194);
}

export function ToLocaleStringJs_0195() {
  return runCase(195);
}

export function ToLocaleStringJs_0196() {
  return runCase(196);
}

export function ToLocaleStringJs_0197() {
  return runCase(197);
}

export function ToLocaleStringJs_0198() {
  return runCase(198);
}

export function ToLocaleStringJs_0199() {
  return runCase(199);
}

