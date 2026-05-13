import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType }
  from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Neg<T extends number> {
  constructor(x: T) {}
}

class Pos<T extends number> {
  constructor(x: T) {}
}

namespace testNS1_8 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: III1) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: III2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: II2) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: I1): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof I1) {
      foo(v);
      return f2(v as III1 | III2 | II2);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof II1) {
      check_C2(v as III2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof I1).assertTrue();
      foo(v);
      check_C3(v as II2);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C2());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_8 {
  interface I1 {}
  interface I2 {}
  interface II1 extends I1, I2 {}
  interface II2 extends I1, I2 {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  class C1 implements III1 {v: bigint = 123n}
  class C2 implements III2 {v: number = 321}
  class C3 implements II2 {v: number = 7.8}
  function check_C1(a: III1) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: III2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: II2) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof I1).assertTrue();
    expect(a instanceof I2).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: I2): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof I2) {
      foo(v);
      return f2(v as III1 | III2 | II2);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof II1) {
      check_C1(v as III1);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof I2).assertTrue();
      foo(v);
      check_C3(v as II2);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C1());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_8 {}
interface I2_8 {}
interface II1_8 extends I1_8, I2_8 {}
interface II2_8 extends I1_8, I2_8 {}
interface III1_8 extends II1_8 {}
interface III2_8 extends II1_8 {}
class C1_8 implements III1_8 {v: bigint = 123n}
class C2_8 implements III2_8 {v: number = 321}
class C3_8 implements II2_8 {v: number = 7.8}
function check_C1_8(a: III1_8) {
  expect(a instanceof C1_8).assertTrue();
  expect(a instanceof III1_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I1_8).assertTrue();
  expect(a instanceof I2_8).assertTrue();
  expect((a as C1_8).v).assertEqual(123n);
}
function check_C2_8(a: III2_8) {
  expect(a instanceof C2_8).assertTrue();
  expect(a instanceof III2_8).assertTrue();
  expect(a instanceof II1_8).assertTrue();
  expect(a instanceof I1_8).assertTrue();
  expect(a instanceof I2_8).assertTrue();
  expect((a as C2_8).v).assertEqual(321);
}
function check_C3_8(a: II2_8) {
  expect(a instanceof C3_8).assertTrue();
  expect(a instanceof II2_8).assertTrue();
  expect(a instanceof I1_8).assertTrue();
  expect(a instanceof I2_8).assertTrue();
  expect((a as C3_8).v).assertEqual(7.8);
}
function foo_8(v: I1_8): void {
  expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
}
function f1_8(v: III1_8 | III2_8 | II2_8): number {
  if (v instanceof I1_8) {
    foo_8(v);
    return f2_8(v as III1_8 | III2_8 | II2_8);
  }
  else {
    return 0;
  }
}
function f2_8(v: III1_8 | III2_8 | II2_8): number {
  if (v instanceof II1_8) {
    check_C2_8(v as III2_8);
    return 1;
  }
  else {
    expect(v instanceof III1_8 || v instanceof III2_8 || v instanceof II2_8).assertTrue();
    expect(v instanceof I1_8).assertTrue();
    foo_8(v);
    check_C3_8(v as II2_8);
    return 2;
  }
}

namespace testNS1_9 {
  interface I {}
  interface II1 extends I {}
  interface II2 extends I {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  interface III1AndIII2 extends III1, III2 {}
  interface II2AndIII2 extends II2, III2 {}
  class C1 implements III1AndIII2 {v: bigint = 123n}
  class C2 implements II2AndIII2 {v: number = 321}
  class C3 implements III1 {v: number = 7.8}
  function check_C1(a: III1AndIII2) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: II2AndIII2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: III1) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: III1 | II2 | III2): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof III1 || v instanceof II2 || v instanceof III2).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof III2) {
      check_C1(v as III1AndIII2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof III1 || v instanceof II2 || v instanceof III2).assertTrue();
      foo(v);
      check_C3(v as III1);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C1());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_9 {
  interface I {}
  interface II1 extends I {}
  interface II2 extends I {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  interface III1AndIII2 extends III1, III2 {}
  interface II2AndIII2 extends II2, III2 {}
  class C1 implements III1AndIII2 {v: bigint = 123n}
  class C2 implements II2AndIII2 {v: number = 321}
  class C3 implements III1 {v: number = 7.8}
  function check_C1(a: III1AndIII2) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: II2AndIII2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: III1) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: II1 | II2): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof II1 || v instanceof II2).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof III2) {
      check_C2(v as II2AndIII2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof II1 || v instanceof II2).assertTrue();
      foo(v);
      check_C3(v as III1);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C2());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_9 {}
interface II1_9 extends I_9 {}
interface II2_9 extends I_9 {}
interface III1_9 extends II1_9 {}
interface III2_9 extends II1_9 {}
interface III1_9AndIII2_9 extends III1_9, III2_9 {}
interface II2_9AndIII2_9 extends II2_9, III2_9 {}
class C1_9 implements III1_9AndIII2_9 {v: bigint = 123n}
class C2_9 implements II2_9AndIII2_9 {v: number = 321}
class C3_9 implements III1_9 {v: number = 7.8}
function check_C1_9(a: III1_9AndIII2_9) {
  expect(a instanceof C1_9).assertTrue();
  expect(a instanceof III1_9).assertTrue();
  expect(a instanceof III2_9).assertTrue();
  expect(a instanceof II1_9).assertTrue();
  expect(a instanceof I_9).assertTrue();
  expect((a as C1_9).v).assertEqual(123n);
}
function check_C2_9(a: II2_9AndIII2_9) {
  expect(a instanceof C2_9).assertTrue();
  expect(a instanceof II2_9).assertTrue();
  expect(a instanceof III2_9).assertTrue();
  expect(a instanceof II1_9).assertTrue();
  expect(a instanceof I_9).assertTrue();
  expect((a as C2_9).v).assertEqual(321);
}
function check_C3_9(a: III1_9) {
  expect(a instanceof C3_9).assertTrue();
  expect(a instanceof III1_9).assertTrue();
  expect(a instanceof II1_9).assertTrue();
  expect(a instanceof I_9).assertTrue();
  expect((a as C3_9).v).assertEqual(7.8);
}
function foo_9(v: III1_9 | II2_9 | III2_9): void {
  expect(v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9).assertTrue();
}
function f1_9(v: III1_9 | III2_9 | II2_9): number {
  expect(v instanceof III1_9 || v instanceof II2_9 || v instanceof III2_9).assertTrue();
  foo_9(v);
  return f2_9(v);
}
function f2_9(v: III1_9 | III2_9 | II2_9): number {
  if (v instanceof III2_9) {
    check_C1_9(v as III1_9AndIII2_9);
    return 1;
  }
  else {
    expect(v instanceof III1_9 || v instanceof III2_9 || v instanceof II2_9).assertTrue();
    expect(v instanceof III1_9 || v instanceof II2_9 || v instanceof III2_9).assertTrue();
    foo_9(v);
    check_C3_9(v as III1_9);
    return 2;
  }
}

namespace testNS1_10 {
  interface I {}
  interface II1 extends I {}
  interface II2 extends I {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  interface III1AndIII2 extends III1, III2 {}
  interface II2AndIII2 extends II2, III2 {}
  class C1 implements III1AndIII2 {v: bigint = 123n}
  class C2 implements II2AndIII2 {v: number = 321}
  class C3 implements III1 {v: number = 7.8}
  function check_C1(a: III1AndIII2) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: II2AndIII2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: III1) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: III1 | II2 | III2): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof III1 || v instanceof II2 || v instanceof III2) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof III2) {
      check_C1(v as III1AndIII2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof III1 || v instanceof II2 || v instanceof III2).assertTrue();
      foo(v);
      check_C3(v as III1);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C1());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_10 {
  interface I {}
  interface II1 extends I {}
  interface II2 extends I {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  interface III1AndIII2 extends III1, III2 {}
  interface II2AndIII2 extends II2, III2 {}
  class C1 implements III1AndIII2 {v: bigint = 123n}
  class C2 implements II2AndIII2 {v: number = 321}
  class C3 implements III1 {v: number = 7.8}
  function check_C1(a: III1AndIII2) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: II2AndIII2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: III1) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: II1 | II2): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof II1 || v instanceof II2) {
      foo(v);
      return f2(v as III1 | III2 | II2);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof III2) {
      check_C2(v as II2AndIII2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof II1 || v instanceof II2).assertTrue();
      foo(v);
      check_C3(v as III1);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C2());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_10 {}
interface II1_10 extends I_10 {}
interface II2_10 extends I_10 {}
interface III1_10 extends II1_10 {}
interface III2_10 extends II1_10 {}
interface III1_10AndIII2_10 extends III1_10, III2_10 {}
interface II2_10AndIII2_10 extends II2_10, III2_10 {}
class C1_10 implements III1_10AndIII2_10 {v: bigint = 123n}
class C2_10 implements II2_10AndIII2_10 {v: number = 321}
class C3_10 implements III1_10 {v: number = 7.8}
function check_C1_10(a: III1_10AndIII2_10) {
  expect(a instanceof C1_10).assertTrue();
  expect(a instanceof III1_10).assertTrue();
  expect(a instanceof III2_10).assertTrue();
  expect(a instanceof II1_10).assertTrue();
  expect(a instanceof I_10).assertTrue();
  expect((a as C1_10).v).assertEqual(123n);
}
function check_C2_10(a: II2_10AndIII2_10) {
  expect(a instanceof C2_10).assertTrue();
  expect(a instanceof II2_10).assertTrue();
  expect(a instanceof III2_10).assertTrue();
  expect(a instanceof II1_10).assertTrue();
  expect(a instanceof I_10).assertTrue();
  expect((a as C2_10).v).assertEqual(321);
}
function check_C3_10(a: III1_10) {
  expect(a instanceof C3_10).assertTrue();
  expect(a instanceof III1_10).assertTrue();
  expect(a instanceof II1_10).assertTrue();
  expect(a instanceof I_10).assertTrue();
  expect((a as C3_10).v).assertEqual(7.8);
}
function foo_10(v: III1_10 | II2_10 | III2_10): void {
  expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10).assertTrue();
}
function f1_10(v: III1_10 | III2_10 | II2_10): number {
  if (v instanceof III1_10 || v instanceof II2_10 || v instanceof III2_10) {
    foo_10(v);
    return f2_10(v);
  }
  else {
    return 0;
  }
}
function f2_10(v: III1_10 | III2_10 | II2_10): number {
  if (v instanceof III2_10) {
    check_C1_10(v as III1_10AndIII2_10);
    return 1;
  }
  else {
    expect(v instanceof III1_10 || v instanceof III2_10 || v instanceof II2_10).assertTrue();
    expect(v instanceof III1_10 || v instanceof II2_10 || v instanceof III2_10).assertTrue();
    foo_10(v);
    check_C3_10(v as III1_10);
    return 2;
  }
}

namespace testNS1_11 {
  interface I {}
  interface II1 extends I {}
  interface II2 extends I {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  interface III1AndIII2 extends III1, III2 {}
  interface II2AndIII2 extends II2, III2 {}
  class C1 implements III1AndIII2 {v: bigint = 123n}
  class C2 implements II2AndIII2 {v: number = 321}
  class C3 implements III1 {v: number = 7.8}
  function check_C1(a: III1AndIII2) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: II2AndIII2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: III1) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: I): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    expect(v instanceof I).assertTrue();
    foo(v);
    return f2(v);
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof III2) {
      check_C1(v as III1AndIII2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof I).assertTrue();
      foo(v);
      check_C3(v as III1);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C1());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_11 {}
interface II1_11 extends I_11 {}
interface II2_11 extends I_11 {}
interface III1_11 extends II1_11 {}
interface III2_11 extends II1_11 {}
interface III1_11AndIII2_11 extends III1_11, III2_11 {}
interface II2_11AndIII2_11 extends II2_11, III2_11 {}
class C1_11 implements III1_11AndIII2_11 {v: bigint = 123n}
class C2_11 implements II2_11AndIII2_11 {v: number = 321}
class C3_11 implements III1_11 {v: number = 7.8}
function check_C1_11(a: III1_11AndIII2_11) {
  expect(a instanceof C1_11).assertTrue();
  expect(a instanceof III1_11).assertTrue();
  expect(a instanceof III2_11).assertTrue();
  expect(a instanceof II1_11).assertTrue();
  expect(a instanceof I_11).assertTrue();
  expect((a as C1_11).v).assertEqual(123n);
}
function check_C2_11(a: II2_11AndIII2_11) {
  expect(a instanceof C2_11).assertTrue();
  expect(a instanceof II2_11).assertTrue();
  expect(a instanceof III2_11).assertTrue();
  expect(a instanceof II1_11).assertTrue();
  expect(a instanceof I_11).assertTrue();
  expect((a as C2_11).v).assertEqual(321);
}
function check_C3_11(a: III1_11) {
  expect(a instanceof C3_11).assertTrue();
  expect(a instanceof III1_11).assertTrue();
  expect(a instanceof II1_11).assertTrue();
  expect(a instanceof I_11).assertTrue();
  expect((a as C3_11).v).assertEqual(7.8);
}
function foo_11(v: I_11): void {
  expect(v instanceof III1_11 || v instanceof III2_11 || v instanceof II2_11).assertTrue();
}
function f1_11(v: III1_11 | III2_11 | II2_11): number {
  expect(v instanceof I_11).assertTrue();
  foo_11(v);
  return f2_11(v);
}
function f2_11(v: III1_11 | III2_11 | II2_11): number {
  if (v instanceof III2_11) {
    check_C1_11(v as III1_11AndIII2_11);
    return 1;
  }
  else {
    expect(v instanceof III1_11 || v instanceof III2_11 || v instanceof II2_11).assertTrue();
    expect(v instanceof I_11).assertTrue();
    foo_11(v);
    check_C3_11(v as III1_11);
    return 2;
  }
}

namespace testNS1_12 {
  interface I {}
  interface II1 extends I {}
  interface II2 extends I {}
  interface III1 extends II1 {}
  interface III2 extends II1 {}
  interface III1AndIII2 extends III1, III2 {}
  interface II2AndIII2 extends II2, III2 {}
  class C1 implements III1AndIII2 {v: bigint = 123n}
  class C2 implements II2AndIII2 {v: number = 321}
  class C3 implements III1 {v: number = 7.8}
  function check_C1(a: III1AndIII2) {
    expect(a instanceof C1).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C1).v).assertEqual(123n);
  }
  function check_C2(a: II2AndIII2) {
    expect(a instanceof C2).assertTrue();
    expect(a instanceof II2).assertTrue();
    expect(a instanceof III2).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C2).v).assertEqual(321);
  }
  function check_C3(a: III1) {
    expect(a instanceof C3).assertTrue();
    expect(a instanceof III1).assertTrue();
    expect(a instanceof II1).assertTrue();
    expect(a instanceof I).assertTrue();
    expect((a as C3).v).assertEqual(7.8);
  }
  function foo(v: I): void {
    expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof I) {
      foo(v);
      return f2(v as III1 | III2 | II2);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof III2) {
      check_C1(v as III1AndIII2);
      return 1;
    }
    else {
      expect(v instanceof III1 || v instanceof III2 || v instanceof II2).assertTrue();
      expect(v instanceof I).assertTrue();
      foo(v);
      check_C3(v as III1);
      return 2;
    }
  }
  export function runTest(): boolean {
    let res: number = f1(new C1());
    expect(res).assertEqual(1);
    res = f1(new C3());
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_12 {}
interface II1_12 extends I_12 {}
interface II2_12 extends I_12 {}
interface III1_12 extends II1_12 {}
interface III2_12 extends II1_12 {}
interface III1_12AndIII2_12 extends III1_12, III2_12 {}
interface II2_12AndIII2_12 extends II2_12, III2_12 {}
class C1_12 implements III1_12AndIII2_12 {v: bigint = 123n}
class C2_12 implements II2_12AndIII2_12 {v: number = 321}
class C3_12 implements III1_12 {v: number = 7.8}
function check_C1_12(a: III1_12AndIII2_12) {
  expect(a instanceof C1_12).assertTrue();
  expect(a instanceof III1_12).assertTrue();
  expect(a instanceof III2_12).assertTrue();
  expect(a instanceof II1_12).assertTrue();
  expect(a instanceof I_12).assertTrue();
  expect((a as C1_12).v).assertEqual(123n);
}
function check_C2_12(a: II2_12AndIII2_12) {
  expect(a instanceof C2_12).assertTrue();
  expect(a instanceof II2_12).assertTrue();
  expect(a instanceof III2_12).assertTrue();
  expect(a instanceof II1_12).assertTrue();
  expect(a instanceof I_12).assertTrue();
  expect((a as C2_12).v).assertEqual(321);
}
function check_C3_12(a: III1_12) {
  expect(a instanceof C3_12).assertTrue();
  expect(a instanceof III1_12).assertTrue();
  expect(a instanceof II1_12).assertTrue();
  expect(a instanceof I_12).assertTrue();
  expect((a as C3_12).v).assertEqual(7.8);
}
function foo_12(v: I_12): void {
  expect(v instanceof III1_12 || v instanceof III2_12 || v instanceof II2_12).assertTrue();
}
function f1_12(v: III1_12 | III2_12 | II2_12): number {
  if (v instanceof I_12) {
    foo_12(v);
    return f2_12(v as III1_12 | III2_12 | II2_12);
  }
  else {
    return 0;
  }
}
function f2_12(v: III1_12 | III2_12 | II2_12): number {
  if (v instanceof III2_12) {
    check_C1_12(v as III1_12AndIII2_12);
    return 1;
  }
  else {
    expect(v instanceof III1_12 || v instanceof III2_12 || v instanceof II2_12).assertTrue();
    expect(v instanceof I_12).assertTrue();
    foo_12(v);
    check_C3_12(v as III1_12);
    return 2;
  }
}
export default function DiffTypeIsSubOfTypeTOnNonGenTest01(): void {
  describe('DiffTypeIsSubOfTypeTOnNonGenTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0800
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0008
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0008';

      let res: number = f1_8(new C2_8())
      expect(res).assertEqual(1)
      res = f1_8(new C3_8())
      expect(res).assertEqual(2)

      expect(testNS1_8.runTest()).assertTrue()
      expect(testNS2_8.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_0900
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0009
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0009';

      let res: number = f1_9(new C1_9())
      expect(res).assertEqual(1)
      res = f1_9(new C3_9())
      expect(res).assertEqual(2)

      expect(testNS1_9.runTest()).assertTrue()
      expect(testNS2_9.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_1000
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0010
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0010';

      let res: number = f1_10(new C1_10())
      expect(res).assertEqual(1)
      res = f1_10(new C3_10())
      expect(res).assertEqual(2)

      expect(testNS1_10.runTest()).assertTrue()
      expect(testNS2_10.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_1100
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0011
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0011';

      let res: number = f1_11(new C1_11())
      expect(res).assertEqual(1)
      res = f1_11(new C3_11())
      expect(res).assertEqual(2)

      expect(testNS1_11.runTest()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_NON_GEN_1200
     * @tc.name      testDiffTypeIsSubOfTypeTOnNonGen0012
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on non generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnNonGen0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnNonGen0012';

      let res: number = f1_12(new C1_12())
      expect(res).assertEqual(1)
      res = f1_12(new C3_12())
      expect(res).assertEqual(2)

      expect(testNS1_12.runTest()).assertTrue()
    });
  })
}