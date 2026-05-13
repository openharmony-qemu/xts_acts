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
  constructor (x: T) {}
}

class Pos<T extends number> {
  constructor (x: T) {}
}

namespace testNS1_14 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U, V> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I1<number, null> | I1<number, string> | I1<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I1<number, null> | I1<number, string> | I1<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I1<number, null> | I1<number, string> | I1<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_14(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_14 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U, V> extends I1<U, V>, I2<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U, V> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U, V> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I2<number, null> | I2<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I2<number, null> | I2<number, string> | I2<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III2<number, string> | II2<bigint, undefined>): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I2<number, null> | I2<number, string> | I2<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_14(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_14<U, V> {}
interface I2_14<U, V> {}
interface II1_14<U, V> extends I1_14<U, V>, I2_14<U, V> {}
interface II2_14<U, V> extends I1_14<U, V>, I2_14<U, V> {}
interface III1_14<U, V> extends II1_14<U, V> {}
interface III2_14<U, V> extends II1_14<U, V> {}
class C1_14<U, V> implements III1_14<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_14<U, V> implements III2_14<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_14<U, V> implements II2_14<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_14(a: object) {
  expect(a instanceof C1_14).assertTrue();
  expect((a as C1_14<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_14(a: object) {
  expect(a instanceof C2_14).assertTrue();
  expect((a as C2_14<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_14(a: object) {
  expect(a instanceof C3_14).assertTrue();
  expect((a as C3_14<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_14(v: I1_14<number, null> | I1_14<number, string> | I1_14<bigint, undefined>): void {
  expect(v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14).assertTrue();
}
function f1_14(v: III1_14<number, null> | III2_14<number, string> | II2_14<bigint, undefined>): number {
  if (v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14) {
    foo_14(v as I1_14<number, null> | I1_14<number, string> | I1_14<bigint, undefined>);
    return f2_14(v);
  }
  else {
    return 0;
  }
}
function f2_14(v: III1_14<number, null> | III2_14<number, string> | II2_14<bigint, undefined>): number {
  if (v instanceof C1_14 || v instanceof C2_14) { // II1_14 check
    check_C2_14(v);
    return 1;
  }
  else {
    expect(v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14).assertTrue();
    expect(v instanceof C1_14 || v instanceof C2_14 || v instanceof C3_14).assertTrue();
    foo_14(v as I1_14<number, null> | I1_14<number, string> | I1_14<bigint, undefined>);
    check_C3_14(v);
    return 2;
  }
}

namespace testNS1_15 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: III1 | II2 | III2 | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C3 || v instanceof C2) {
      foo(v);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v as III1 | II2 | III2 | number);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_15(): boolean {
    let res: number = f1(new C1(123));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_15 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: II1<number, null> | II1<number, string> | II2): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C3 || v instanceof C2) {
      foo(v as II1<number, null> | II1<number, string> | II2);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C3 || v instanceof C2).assertTrue();
      foo(v as II1<number, null> | II1<number, string> | II2);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_15(): boolean {
    let res: number = f1(new C2(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS3_15 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> implements III2<U, V>  {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V>  {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I1<number, null> | I1<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I1<number, null> | I1<number, string> | I2<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I1<number, null> | I1<number, string> | I2<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_15(): boolean {
    let res: number = f1(new C1(123));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_15<U, V> {}
interface I2_15<U, V> {}
interface II1_15<U, V> extends I1_15<U, V>, I2_15<U, V> {}
interface II2_15<U = bigint, V = undefined> extends I1_15<U, V>, I2_15<U, V> {}
interface III1_15<U = number, V = null> extends II1_15<U, V> {}
interface III2_15<U = number, V = string> extends II1_15<U, V> {}
class C1_15<U = number, V = null> implements III1_15<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_15<U = number, V = string> implements III2_15<U, V>  {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_15<U = bigint, V = undefined> implements II2_15<U, V>  {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_15(a: object) {
  expect(a instanceof C1_15).assertTrue();
  expect((a as C1_15).c1_v as number).assertEqual(123);
}
function check_C2_15(a: object) {
  expect(a instanceof C2_15).assertTrue();
  expect((a as C2_15).c2_v as number).assertEqual(6.7);
}
function check_C3_15(a: object) {
  expect(a instanceof C3_15).assertTrue();
  expect((a as C3_15).c3_v as bigint).assertEqual(321n);
}
function foo_15(v: III1_15 | II2_15 | III2_15 | number): void {
  expect(v instanceof C1_15 || v instanceof C2_15 || v instanceof C3_15).assertTrue();
}
function f1_15(v: III1_15 | III2_15 | II2_15): number {
  if (v instanceof C1_15 || v instanceof C3_15 || v instanceof C2_15) {
    foo_15(v);
    return f2_15(v);
  }
  else {
    return 0;
  }
}
function f2_15(v: III1_15 | III2_15 | II2_15): number {
  if (v instanceof C1_15 || v instanceof C2_15) { // II1_15 check
    check_C1_15(v);
    return 1;
  }
  else {
    expect(v instanceof C1_15 || v instanceof C2_15 || v instanceof C3_15).assertTrue();
    expect(v instanceof C1_15 || v instanceof C3_15 || v instanceof C2_15 || typeof v === 'number').assertTrue();
    foo_15(v as III1_15 | II2_15 | III2_15 | number);
    check_C3_15(v);
    return 2;
  }
}

namespace testNS1_16 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> implements III2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I1<number, null> | I1<number, string> | I1<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I1<number, null> | I1<number, string> | I1<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C2(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I1<number, null> | I1<number, string> | I1<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_16(): boolean {
    let res: number = f1(new C2(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_16 {
  interface I1<U, V> {}
  interface I2<U, V> {}
  interface II1<U, V> extends I1<U, V>, I2<U, V> {}
  interface II2<U = bigint, V = undefined> extends I1<U, V>, I2<U, V> {}
  interface III1<U = number, V = null> extends II1<U, V> {}
  interface III2<U = number, V = string> extends II1<U, V> {}
  class C1<U = number, V = null> implements III1<U, V> {
    c1_v: U | V
    constructor (p: U | V) {
      this.c1_v = p
    }
  }
  class C2<U = number, V = string> implements III2<U, V> {
    c2_v: U | V
    constructor (p: U | V) {
      this.c2_v = p
    }
  }
  class C3<U = bigint, V = undefined> implements II2<U, V> {
    c3_v: U | V
    constructor (p: U | V) {
      this.c3_v = p
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I2<number, null> | I2<number, string> | I2<bigint, undefined>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I2<number, null> | I2<number, string> | I2<bigint, undefined>);
      return f2(v);
    }
    else {
      return 0;
    }
  }
  function f2(v: III1 | III2 | II2): number {
    if (v instanceof C1 || v instanceof C2) { // II1 check
      check_C1(v);
      return 1;
    }
    else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I2<number, null> | I2<number, string> | I2<bigint, undefined>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_16(): boolean {
    let res: number = f1(new C1(123));
    expect(res).assertEqual(1);
    res = f1(new C3(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I1_16<U, V> {}
interface I2_16<U, V> {}
interface II1_16<U, V> extends I1_16<U, V>, I2_16<U, V> {}
interface II2_16<U = bigint, V = undefined> extends I1_16<U, V>, I2_16<U, V> {}
interface III1_16<U = number, V = null> extends II1_16<U, V> {}
interface III2_16<U = number, V = string> extends II1_16<U, V> {}
class C1_16<U = number, V = null> implements III1_16<U, V> {
  c1_v: U | V
  constructor (p: U | V) {
    this.c1_v = p
  }
}
class C2_16<U = number, V = string> implements III2_16<U, V> {
  c2_v: U | V
  constructor (p: U | V) {
    this.c2_v = p
  }
}
class C3_16<U = bigint, V = undefined> implements II2_16<U, V> {
  c3_v: U | V
  constructor (p: U | V) {
    this.c3_v = p
  }
}
function check_C1_16(a: object) {
  expect(a instanceof C1_16).assertTrue();
  expect((a as C1_16).c1_v as number).assertEqual(123);
}
function check_C2_16(a: object) {
  expect(a instanceof C2_16).assertTrue();
  expect((a as C2_16).c2_v as number).assertEqual(6.7);
}
function check_C3_16(a: object) {
  expect(a instanceof C3_16).assertTrue();
  expect((a as C3_16).c3_v as bigint).assertEqual(321n);
}
function foo_16(v: I1_16<number, null> | I1_16<number, string> | I1_16<bigint, undefined>): void {
  expect(v instanceof C1_16 || v instanceof C2_16 || v instanceof C3_16).assertTrue();
}
function f1_16(v: III1_16 | III2_16 | II2_16): number {
  if (v instanceof C1_16 || v instanceof C2_16 || v instanceof C3_16) {
    foo_16(v as I1_16<number, null> | I1_16<number, string> | I1_16<bigint, undefined>);
    return f2_16(v);
  }
  else {
    return 0;
  }
}
function f2_16(v: III1_16 | III2_16 | II2_16): number {
  if (v instanceof C1_16 || v instanceof C2_16) { // II1_16 check
    check_C2_16(v);
    return 1;
  }
  else {
    expect(v instanceof C1_16 || v instanceof C2_16 || v instanceof C3_16).assertTrue();
    expect(v instanceof C1_16 || v instanceof C2_16 || v instanceof C3_16).assertTrue();
    foo_16(v as I1_16<number, null> | I1_16<number, string> | I1_16<bigint, undefined>);
    check_C3_16(v);
    return 2;
  }
}

namespace testNS1_17 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: III1<number, null> | III1<bigint, undefined> |
  II2<number, string> | III2<number, string> | number): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as III1<number, null> | III1<bigint, undefined> | II2<number, string> | III2<number, string> | number);
      return f2(v);
    } else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) { // III2 check
      check_C1(v);
      return 1;
    } else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3 || typeof v === 'number').assertTrue();
      foo(v as III1<number, null> | III1<bigint, undefined> | II2<number, string> | III2<number, string> | number);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_17(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

namespace testNS2_17 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: II1<number, null> | II1<bigint, undefined> | II2<number, string>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as II1<number, null> | II1<bigint, undefined> | II2<number, string>);
      return f2(v);
    } else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) { // III2 check
      check_C2(v);
      return 1;
    } else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as II1<number, null> | II1<bigint, undefined> | II2<number, string>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_17(): boolean {
    let res: number = f1(new C2<number, string>(6.7));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_17<U, V> {}
interface II1_17<U, V> extends I_17<U, V> {}
interface II2_17<U, V> extends I_17<U, V> {}
interface III1_17<U, V> extends II1_17<U, V> {}
interface III2_17<U, V> extends II1_17<U, V> {}
class C1_17<U, V> implements III1_17<U, V>, III2_17<U, V> {
  c1_v: U | V;
  constructor(p: U | V) {
    this.c1_v = p;
  }
}
class C2_17<U, V> implements II2_17<U, V>, III2_17<U, V> {
  c2_v: U | V;
  constructor(p: U | V) {
    this.c2_v = p;
  }
}
class C3_17<U, V> implements III1_17<U, V> {
  c3_v: U | V;
  constructor(p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_17(a: object) {
  expect(a instanceof C1_17).assertTrue();
  expect((a as C1_17<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_17(a: object) {
  expect(a instanceof C2_17).assertTrue();
  expect((a as C2_17<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_17(a: object) {
  expect(a instanceof C3_17).assertTrue();
  expect((a as C3_17<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_17(v: III1_17<number, null> | III1_17<bigint, undefined> |
II2_17<number, string> | III2_17<number, string> | number): void {
  expect(v instanceof C1_17 || v instanceof C2_17 || v instanceof C3_17).assertTrue();
}
function f1_17(v: III1_17<number, null> | III1_17<bigint, undefined> | II2_17<number, string>): number {
  if (v instanceof C1_17 || v instanceof C2_17 || v instanceof C3_17) {
    foo_17(v as III1_17<number, null> | III1_17<bigint, undefined> |
    II2_17<number, string> | III2_17<number, string> | number);
    return f2_17(v);
  } else {
    return 0;
  }
}
function f2_17(v: III1_17<number, null> | III1_17<bigint, undefined> | II2_17<number, string>): number {
  if (v instanceof C1_17 || v instanceof C2_17) { // III2_17 check
    check_C1_17(v);
    return 1;
  } else {
    expect(v instanceof C1_17 || v instanceof C2_17 || v instanceof C3_17).assertTrue();
    expect(v instanceof C1_17 || v instanceof C2_17 || v instanceof C3_17 || typeof v === 'number').assertTrue();
    foo_17(v as III1_17<number, null> | III1_17<bigint, undefined> |
    II2_17<number, string> | III2_17<number, string> | number);
    check_C3_17(v);
    return 2;
  }
}

namespace testNS1_18 {
  interface I<U, V> {}
  interface II1<U, V> extends I<U, V> {}
  interface II2<U, V> extends I<U, V> {}
  interface III1<U, V> extends II1<U, V> {}
  interface III2<U, V> extends II1<U, V> {}
  class C1<U, V> implements III1<U, V>, III2<U, V> {
    c1_v: U | V;
    constructor(p: U | V) {
      this.c1_v = p;
    }
  }
  class C2<U, V> implements II2<U, V>, III2<U, V> {
    c2_v: U | V;
    constructor(p: U | V) {
      this.c2_v = p;
    }
  }
  class C3<U, V> implements III1<U, V> {
    c3_v: U | V;
    constructor(p: U | V) {
      this.c3_v = p;
    }
  }
  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect((a as C1<number, null>).c1_v as number).assertEqual(123);
  }
  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect((a as C2<number, string>).c2_v as number).assertEqual(6.7);
  }
  function check_C3(a: object) {
    expect(a instanceof C3).assertTrue();
    expect((a as C3<bigint, undefined>).c3_v as bigint).assertEqual(321n);
  }
  function foo(v: I<number, null> | I<bigint, undefined> | I<number, string>): void {
    expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
  }
  function f1(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2 || v instanceof C3) {
      foo(v as I<number, null> | I<bigint, undefined> | I<number, string>);
      return f2(v);
    } else {
      return 0;
    }
  }
  function f2(v: III1<number, null> | III1<bigint, undefined> | II2<number, string>): number {
    if (v instanceof C1 || v instanceof C2) { // III2 check
      check_C1(v);
      return 1;
    } else {
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || v instanceof C3).assertTrue();
      foo(v as I<number, null> | I<bigint, undefined> | I<number, string>);
      check_C3(v);
      return 2;
    }
  }

  export function runTest_18(): boolean {
    let res: number = f1(new C1<number, null>(123));
    expect(res).assertEqual(1);
    res = f1(new C3<bigint, undefined>(321n));
    expect(res).assertEqual(2);
    return true;
  }
}

interface I_18<U, V> {}
interface II1_18<U, V> extends I_18<U, V> {}
interface II2_18<U, V> extends I_18<U, V> {}
interface III1_18<U, V> extends II1_18<U, V> {}
interface III2_18<U, V> extends II1_18<U, V> {}
class C1_18<U, V> implements III1_18<U, V>, III2_18<U, V> {
  c1_v: U | V;
  constructor(p: U | V) {
    this.c1_v = p;
  }
}
class C2_18<U, V> implements II2_18<U, V>, III2_18<U, V> {
  c2_v: U | V;
  constructor(p: U | V) {
    this.c2_v = p;
  }
}
class C3_18<U, V> implements III1_18<U, V> {
  c3_v: U | V;
  constructor(p: U | V) {
    this.c3_v = p;
  }
}
function check_C1_18(a: object) {
  expect(a instanceof C1_18).assertTrue();
  expect((a as C1_18<number, null>).c1_v as number).assertEqual(123);
}
function check_C2_18(a: object) {
  expect(a instanceof C2_18).assertTrue();
  expect((a as C2_18<number, string>).c2_v as number).assertEqual(6.7);
}
function check_C3_18(a: object) {
  expect(a instanceof C3_18).assertTrue();
  expect((a as C3_18<bigint, undefined>).c3_v as bigint).assertEqual(321n);
}
function foo_18(v: I_18<number, null> | I_18<bigint, undefined> | I_18<number, string>): void {
  expect(v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18).assertTrue();
}
function f1_18(v: III1_18<number, null> | III1_18<bigint, undefined> | II2_18<number, string>): number {
  if (v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18) {
    foo_18(v as I_18<number, null> | I_18<bigint, undefined> | I_18<number, string>);
    return f2_18(v);
  } else {
    return 0;
  }
}
function f2_18(v: III1_18<number, null> | III1_18<bigint, undefined> | II2_18<number, string>): number {
  if (v instanceof C1_18 || v instanceof C2_18) { // III2_18 check
    check_C1_18(v);
    return 1;
  } else {
    expect(v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18).assertTrue();
    expect(v instanceof C1_18 || v instanceof C2_18 || v instanceof C3_18).assertTrue();
    foo_18(v as I_18<number, null> | I_18<bigint, undefined> | I_18<number, string>);
    check_C3_18(v);
    return 2;
  }
}

namespace testNS1_19 {
  class C1<in T1, out T2> {
    readonly c1_v: T2;
    constructor(p: T2) {
      this.c1_v = p;
    }
  }

  class C2<out T1, in T2> {
    readonly c2_v: T1;
    constructor(p: T1) {
      this.c2_v = p;
    }
  }

  class Base {
    b_v: bigint;
    constructor(p: bigint) {
      this.b_v = p;
    }
  }

  class Derived extends Base {
    d_v: number;
    constructor(p: number) {
      super(0n);
      this.d_v = p;
    }
  }

  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect(((a as C1<Base, Base>).c1_v as Base).b_v).assertEqual(123n);
  }

  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect(((a as C2<Derived, Base>).c2_v as Derived).d_v).assertEqual(321);
  }

  function foo(v: C1<Derived, Base> | C2<Base, Derived> | number): void {
    expect(v instanceof C1 || v instanceof C2).assertTrue();
  }

  function f1(v: C1<Derived, Base> | C2<Base, Derived>): number {
    if (v instanceof C1 || v instanceof C2) {
      foo(v);
      return f2(v);
    } else {
      return 0;
    }
  }

  function f2(v: C1<Derived, Base> | C2<Base, Derived>): number {
    if (v instanceof C2) {
      check_C2(v);
      return 1;
    } else {
      expect(v instanceof C1 || v instanceof C2).assertTrue();
      expect(v instanceof C1 || v instanceof C2 || typeof v === 'number').assertTrue();
      foo(v);
      check_C1(v);
      return 2;
    }
  }

  export function runTest_19(): boolean {
    let res: number = f1(new C2<Derived, Base>(new Derived(321)));
    expect(res).assertEqual(1);
    res = f1(new C1<Base, Base>(new Base(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

class C1_19<in T1, out T2> {
  readonly c1_v: T2;
  constructor(p: T2) {
    this.c1_v = p;
  }
}

class C2_19<out T1, in T2> {
  readonly c2_v: T1;
  constructor(p: T1) {
    this.c2_v = p;
  }
}

class Base_19 {
  b_v: bigint;
  constructor(p: bigint) {
    this.b_v = p;
  }
}

class Derived_19 extends Base_19 {
  d_v: number;
  constructor(p: number) {
    super(0n);
    this.d_v = p;
  }
}

function check_C1_19(a: object) {
  expect(a instanceof C1_19).assertTrue();
  expect(((a as C1_19<Base_19, Base_19>).c1_v as Base_19).b_v).assertEqual(123n);
}

function check_C2_19(a: object) {
  expect(a instanceof C2_19).assertTrue();
  expect(((a as C2_19<Derived_19, Base_19>).c2_v as Derived_19).d_v).assertEqual(321);
}

function foo_19(v: C1_19<Derived_19, Base_19> | C2_19<Base_19, Derived_19> | number): void {
  expect(v instanceof C1_19 || v instanceof C2_19).assertTrue();
}

function f1_19(v: C1_19<Derived_19, Base_19> | C2_19<Base_19, Derived_19>): number {
  if (v instanceof C1_19 || v instanceof C2_19) {
    foo_19(v);
    return f2_19(v);
  } else {
    return 0;
  }
}

function f2_19(v: C1_19<Derived_19, Base_19> | C2_19<Base_19, Derived_19>): number {
  if (v instanceof C2_19) {
    check_C2_19(v);
    return 1;
  } else {
    expect(v instanceof C1_19 || v instanceof C2_19).assertTrue();
    expect(v instanceof C1_19 || v instanceof C2_19 || typeof v === 'number').assertTrue();
    foo_19(v);
    check_C1_19(v);
    return 2;
  }
}

namespace testNS1_20 {
  class C1<in T1, out T2> {
    readonly c1_v: T2;
    constructor(p: T2) {
      this.c1_v = p;
    }
  }

  class C2<out T1, in T2> {
    readonly c2_v: T1;
    constructor(p: T1) {
      this.c2_v = p;
    }
  }

  class Base {
    b_v: bigint;
    constructor(p: bigint) {
      this.b_v = p;
    }
  }

  class Derived extends Base {
    d_v: number;
    constructor(p: number) {
      super(0n);
      this.d_v = p;
    }
  }

  function check_C1(a: object) {
    expect(a instanceof C1).assertTrue();
    expect(((a as C1<Base, Base>).c1_v as Base).b_v).assertEqual(123n);
  }

  function check_C2(a: object) {
    expect(a instanceof C2).assertTrue();
    expect(((a as C2<Derived, Base>).c2_v as Derived).d_v).assertEqual(321);
  }

  function foo(v: object): void {
    expect(v instanceof C1 || v instanceof C2).assertTrue();
  }

  function f1(v: C1<Derived, Base> | C2<Base, Derived>): number {
    if (typeof v !== 'undefined') {
      foo(v);
      return f2(v);
    } else {
      return 0;
    }
  }

  function f2(v: C1<Derived, Base> | C2<Base, Derived>): number {
    if (v instanceof C2) {
      check_C2(v);
      return 1;
    } else {
      expect(v instanceof C1 || v instanceof C2).assertTrue();
      foo(v);
      check_C1(v);
      return 2;
    }
  }

  export function runTest_20(): boolean {
    let res: number = f1(new C2<Derived, Base>(new Derived(321)));
    expect(res).assertEqual(1);
    res = f1(new C1<Base, Base>(new Base(123n)));
    expect(res).assertEqual(2);
    return true;
  }
}

class C1_20<in T1, out T2> {
  readonly c1_v: T2;
  constructor(p: T2) {
    this.c1_v = p;
  }
}

class C2_20<out T1, in T2> {
  readonly c2_v: T1;
  constructor(p: T1) {
    this.c2_v = p;
  }
}

class Base_20 {
  b_v: bigint;
  constructor(p: bigint) {
    this.b_v = p;
  }
}

class Derived_20 extends Base_20 {
  d_v: number;
  constructor(p: number) {
    super(0n);
    this.d_v = p;
  }
}

function check_C1_20(a: object) {
  expect(a instanceof C1_20).assertTrue();
  expect(((a as C1_20<Base_20, Base_20>).c1_v as Base_20).b_v).assertEqual(123n);
}

function check_C2_20(a: object) {
  expect(a instanceof C2_20).assertTrue();
  expect(((a as C2_20<Derived_20, Base_20>).c2_v as Derived_20).d_v).assertEqual(321);
}

function foo_20(v: object): void {
  expect(v instanceof C1_20 || v instanceof C2_20).assertTrue();
}

function f1_20(v: C1_20<Derived_20, Base_20> | C2_20<Base_20, Derived_20>): number {
  if (typeof v !== 'undefined') {
    foo_20(v);
    return f2_20(v);
  } else {
    return 0;
  }
}

function f2_20(v: C1_20<Derived_20, Base_20> | C2_20<Base_20, Derived_20>): number {
  if (v instanceof C2_20) {
    check_C2_20(v);
    return 1;
  } else {
    expect(v instanceof C1_20 || v instanceof C2_20).assertTrue();
    foo_20(v);
    check_C1_20(v);
    return 2;
  }
}

export default function DiffTypeIsSubOfTypeTOnGenTest02(): void {
  describe('DiffTypeIsSubOfTypeTOnGenTest02', () => {
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
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1400
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0014
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0014';
      let res: number = f1_14(new C2_14<number, string>(6.7))
      expect(res).assertEqual(1)
      res = f1_14(new C3_14<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS1_14.runTest_14()).assertTrue()
      expect(testNS2_14.runTest_14()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1500
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0015
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0015';
      let res: number = f1_15(new C1_15(123))
      expect(res).assertEqual(1)
      res = f1_15(new C3_15(321n))
      expect(res).assertEqual(2)
      expect(testNS1_15.runTest_15()).assertTrue()
      expect(testNS2_15.runTest_15()).assertTrue()
      expect(testNS3_15.runTest_15()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1600
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0016
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0016';
      let res: number = f1_16(new C2_16(6.7))
      expect(res).assertEqual(1)
      res = f1_16(new C3_16(321n))
      expect(res).assertEqual(2)
      expect(testNS1_16.runTest_16()).assertTrue()
      expect(testNS2_16.runTest_16()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1700
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0017
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0017';
      let res: number = f1_17(new C1_17<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_17(new C3_17<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS1_17.runTest_17()).assertTrue()
      expect(testNS2_17.runTest_17()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1800
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0018
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0018';
      let res: number = f1_18(new C1_18<number, null>(123))
      expect(res).assertEqual(1)
      res = f1_18(new C3_18<bigint, undefined>(321n))
      expect(res).assertEqual(2)
      expect(testNS1_18.runTest_18()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_1900
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0019
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0019';
      let res: number = f1_19(new C2_19<Derived_19, Base_19>(new Derived_19(321)))
      expect(res).assertEqual(1)
      res = f1_19(new C1_19<Base_19, Base_19>(new Base_19(123n)))
      expect(res).assertEqual(2)
      expect(testNS1_19.runTest_19()).assertTrue()
    });

    /**
     * @tc.number    SUB_DIFF_TYPE_IS_SUB_OF_TYPE_T_ON_GEN_2000
     * @tc.name      testDiffTypeIsSubOfTypeTOnGen0020
     * @tc.desc      Checking that difference type A - B is a subtype of T if A is a subtype of T
    in case of usage instanceof on generic custom types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDiffTypeIsSubOfTypeTOnGen0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDiffTypeIsSubOfTypeTOnGen0020';
      let res: number = f1_20(new C2_20<Derived_20, Base_20>(new Derived_20(321)))
      expect(res).assertEqual(1)
      res = f1_20(new C1_20<Base_20, Base_20>(new Base_20(123n)))
      expect(res).assertEqual(2)
      expect(testNS1_20.runTest_20()).assertTrue()
    });
  })
}