/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../hypium";

enum EN1 { a, b, c }
enum ES1 { a = "a", b = "b", c = "c" }
interface I1 {}
class C1 implements I1 {}
 - 测试框架所需
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

function c() {}

const array1 = [ "a", "b", "c" ]
const array2 = [ 1, 2, 3, 4 ]
let a1: int = 4
let b1: int = 0
function foo1(): string|int { return a1 > b1 ? a1/b1 : "" }
function foo2(flag: boolean) { if (flag) { throw new Error() }; return flag }
class A1<T> { f: T; m() { return typeof this.f }; constructor(p: T) { this.f = p } }
class A2 {}
class B1 {}

function f1(o: Object) { return typeof o }
function f2(o: A2|B1) { return typeof o }

class AI1 implements I1 {}
let aa1 = 42
type F1 = (p: int) => int
function fooo1(p: int): int {
  return p + p
}
let ff1: F1 = (p: int): int => { return p * p }
enum Color1 { Red, Green, Blue }
enum Size1 { S, M, L, XL }
enum Color2 { Red = "red", Green = "green", Blue = "blue" }
enum Size2 { S = "small", M = "mid", L = "large", XL = "extra-large" }
class CC1<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
class B2 {}
class C2 {}
interface I2 {}
class A3 implements I2 {}
class B3 extends A3 {}
const g1: Comparable<Short> = new Short()
const g2: Comparable<Int> = new Int()
const g3: Comparable<Long> = new Long()
const g4: Comparable<Char> = new Char()
const g5: Floating = 3.14f
const g6: Integral = 42

interface I3 {}
class AA1 implements I1 {}
class A4 implements I3 {}
class A5 implements I3 {}
class BB3 extends A4 {}

class CC2 {}
type FF1 = (p: int) => int

// 从 tof_func_0.js 提取的函数
function tof_func_0_foo1(p: number): string { return typeof p }
function tof_func_0_foo2(p: number): string { return typeof p }

// 从 tof_func_1.js 提取的函数
function tof_func_1_foo1(p: double): string { return typeof p }
function tof_func_1_foo2(p: double): string { return typeof p }

// 从 tof_func_2.js 提取的函数
function tof_func_2_foo1(p: string): string { return typeof p }
function tof_func_2_foo2(p: string): string { return typeof p }
function tof_func_2_foo3(p: string): string { return typeof p }
function tof_func_2_foo4(p: Comparable<String>): string { return typeof p }

// 从 tof_func_3.js 提取的函数
function tof_func_3_foo1(p: boolean): string { return typeof p }
function tof_func_3_foo2(p: boolean): string { return typeof p }
function tof_func_3_foo3(p: Comparable<Boolean>): string { return typeof p }

// 从 tof_func_4.js 提取的函数
function tof_func_4_foo1(p: bigint): string { return typeof p }
function tof_func_4_foo2(p: bigint): string { return typeof p }

// 从 tof_func_5.js 提取的函数
function tof_func_5_foo1(p: AA1): string { return typeof p }
function tof_func_5_foo2(p: I1): string { return typeof p }

// 从 tof_func_6.js 提取的函数
function tof_func_6_foo1(p: Numeric): string { return typeof p }

// 从 tof_func_7.js 提取的函数
function tof_func_7_foo1(p: number[]): string { return typeof p }
function tof_func_7_foo2(p: number[]): string { return typeof p }

// 从 tof_func_8.js 提取的函数
function tof_func_8_foo1(p: byte[]): string { return typeof p }
function tof_func_8_foo2(p: short[]): string { return typeof p }
function tof_func_8_foo3(p: int[]): string { return typeof p }
function tof_func_8_foo4(p: long[]): string { return typeof p }
function tof_func_8_foo5(p: float[]): string { return typeof p }
function tof_func_8_foo6(p: double[]): string { return typeof p }
function tof_func_8_foo7(p: char[]): string { return typeof p }

// 从 tof_func_9.js 提取的函数
function tof_func_9_foo1(p: AA1[]): string { return typeof p }
function tof_func_9_foo2(p: I1[]): string { return typeof p }
function tof_func_9_foo3(p: Comparable<Float>[]): string { return typeof p }

// 从 tof_func_10.js 提取的函数
function tof_func_10_foo1(p: Floating[]): string { return typeof p }
function tof_func_10_foo2(p: Integral[]): string { return typeof p }
function tof_func_10_foo3(p: Numeric[]): string { return typeof p }

// 从 tof_func_11.js 提取的函数
function tof_func_11_foo1(p: FF1): string { return typeof p }
function tof_func_11_foo2(p: ((p: int) => int)): string { return typeof p }
function tof_func_11_foo3(p: FF1): string { return typeof p }
function tof_func_11_foo4(p: ((p: int) => int)): string { return typeof p }
function tof_func_11_foo5(p: (() => void)): string { return typeof p }

// 从 tof_func_12.js 提取的函数
function tof_func_12_foo1(p: undefined): string { return typeof p }

// 从 tof_func_13.js 提取的函数
function tof_func_13_foo1(p: null): string { return typeof p }

// 从 tof_func_14.js 提取的函数
function tof_func_14_foo1(p: A2|null): string { return typeof p }
function tof_func_14_foo2(p: A2|null): string { return typeof p }
function tof_func_14_foo3(p: I3|null): string { return typeof p }
function tof_func_14_foo4(p: I3|null): string { return typeof p }
function tof_func_14_foo5(p: A2[]|null): string { return typeof p }
function tof_func_14_foo6(p: A2[]|null): string { return typeof p }
function tof_func_14_foo7(p: I3[]|null): string { return typeof p }
function tof_func_14_foo8(p: I3[]|null): string { return typeof p }

// 从 tof_func_15.js 提取的函数
function tof_func_15_foo1(p: Color1): string { return typeof p }
function tof_func_15_foo2(p: Size1): string { return typeof p }

// 从 tof_func_16.js 提取的函数
function tof_func_16_foo1(p: Color2): string { return typeof p }
function tof_func_16_foo2(p: Size2): string { return typeof p }

// 从 tof_func_17.js 提取的函数
function tof_func_17_foo1(p: number|string|boolean): string { return typeof p }
function tof_func_17_foo2(p: number|boolean): string { return typeof p }
function tof_func_17_foo3(p: boolean|never|long): string { return typeof p }

// 从 tof_func_18.js 提取的函数
function tof_func_18_foo1(p: number|string|boolean): string { return typeof p }
function tof_func_18_foo2(p: number|string): string { return typeof p }
function tof_func_18_foo3(p: boolean|never|long|string): string { return typeof p }

// 从 tof_func_19.js 提取的函数
function tof_func_19_foo1(p: A3|B2|CC2): string { return typeof p }
function tof_func_19_foo2(p: B2|never|undefined|A3): string { return typeof p }

// 从 tof_func_20.js 提取的函数
function tof_func_20_foo1(p: CC1<A2>): string { return typeof p }
function tof_func_20_foo2(p: CC1<B1>): string { return typeof p }
function tof_func_20_foo3(p: CC1<I3>): string { return typeof p }

// 从 tof_func_21.js 提取的函数
function tof_func_21_foo1(p: Comparable<Double>): string { return typeof p }

// 从 tof_func_22.js 提取的函数
function tof_func_22_foo1(p: byte): string { return typeof p }
function tof_func_22_foo2(p: byte): string { return typeof p }

// 从 tof_func_23.js 提取的函数
function tof_func_23_foo1(p: short): string { return typeof p }
function tof_func_23_foo2(p: short): string { return typeof p }

// 从 tof_func_24.js 提取的函数
function tof_func_24_foo1(p: int): string { return typeof p }
function tof_func_24_foo2(p: int): string { return typeof p }

// 从 tof_func_25.js 提取的函数
function tof_func_25_foo1(p: long): string { return typeof p }
function tof_func_25_foo2(p: long): string { return typeof p }

// 从 tof_func_26.js 提取的函数
function tof_func_26_foo1(p: float): string { return typeof p }
function tof_func_26_foo2(p: float): string { return typeof p }

// 从 tof_func_27.js 提取的函数
function tof_func_27_foo1(p: char): string { return typeof p }
function tof_func_27_foo2(p: char): string { return typeof p }

// 从 tof_func_28.js 提取的函数
function tof_func_28_foo1(p: Comparable<Float>): string { return typeof p }

// 从 tof_func_29.js 提取的函数
function tof_func_29_foo1(p: Comparable<Byte>): string { return typeof p }

// 从 tof_func_30.js 提取的函数
function tof_func_30_foo1(p: Comparable<Short>): string { return typeof p }

// 从 tof_func_31.js 提取的函数
function tof_func_31_foo1(p: Comparable<Int>): string { return typeof p }

// 从 tof_func_32.js 提取的函数
function tof_func_32_foo1(p: Comparable<Long>): string { return typeof p }

// 从 tof_func_33.js 提取的函数
function tof_func_33_foo1(p: Comparable<Char>): string { return typeof p }

// 从 tof_func_34.js 提取的函数
function tof_func_34_foo1(p: Floating): string { return typeof p }

// 从 tof_func_35.js 提取的函数
function tof_func_35_foo1(p: Integral): string { return typeof p }

// 从 tof_func_11.js 提取的额外函数（重命名避免冲突）
function tof_func_11_original_foo(p: int): int { return p + p }

class tof_meth_0_Z1 {
  fld: string = ""
  constructor(p: number) {
    this.fld = typeof p
  }
  meth(p: number): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_0_Z2 {
  fld: string = ""
  constructor(p: number) {
    this.fld = typeof p
  }
  meth(p: number): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_1.js 提取
class tof_meth_1_Z1 {
  fld: string = ""
  constructor(p: double) {
    this.fld = typeof p
  }
  meth(p: double): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_1_Z2 {
  fld: string = ""
  constructor(p: double) {
    this.fld = typeof p
  }
  meth(p: double): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_2.js 提取
let tof_meth_2_a = 42
class tof_meth_2_Z1 {
  fld: string = ""
  constructor(p: string) {
    this.fld = typeof p
  }
  meth(p: string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z2 {
  fld: string = ""
  constructor(p: string) {
    this.fld = typeof p
  }
  meth(p: string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z3 {
  fld: string = ""
  constructor(p: string) {
    this.fld = typeof p
  }
  meth(p: string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z4 {
  fld: string = ""
  constructor(p: String) {
    this.fld = typeof p
  }
  meth(p: String): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z5 {
  fld: string = ""
  constructor(p: String) {
    this.fld = typeof p
  }
  meth(p: String): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z6 {
  fld: string = ""
  constructor(p: String) {
    this.fld = typeof p
  }
  meth(p: String): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z7 {
  fld: string = ""
  constructor(p: Comparable<String>) {
    this.fld = typeof p
  }
  meth(p: Comparable<String>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_3.js 提取
class tof_meth_3_Z1 {
  fld: string = ""
  constructor(p: boolean) {
    this.fld = typeof p
  }
  meth(p: boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_3_Z2 {
  fld: string = ""
  constructor(p: boolean) {
    this.fld = typeof p
  }
  meth(p: boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_3_Z3 {
  fld: string = ""
  constructor(p: Comparable<Boolean>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Boolean>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_4.js 提取
class tof_meth_4_Z1 {
  fld: string = ""
  constructor(p: bigint) {
    this.fld = typeof p
  }
  meth(p: bigint): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_4_Z2 {
  fld: string = ""
  constructor(p: bigint) {
    this.fld = typeof p
  }
  meth(p: bigint): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_5.js 提取
interface tof_meth_5_I {}
class tof_meth_5_A implements tof_meth_5_I {}
class tof_meth_5_Z1 {
  fld: string = ""
  constructor(p: tof_meth_5_A) {
    this.fld = typeof p
  }
  meth(p: tof_meth_5_A): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_5_Z2 {
  fld: string = ""
  constructor(p: tof_meth_5_I) {
    this.fld = typeof p
  }
  meth(p: tof_meth_5_I): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_6.js 提取
class tof_meth_6_Z1 {
  fld: string = ""
  constructor(p: Numeric) {
    this.fld = typeof p
  }
  meth(p: Numeric): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_7.js 提取
class tof_meth_7_Z1 {
  fld: string = ""
  constructor(p: number[]) {
    this.fld = typeof p
  }
  meth(p: number[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_7_Z2 {
  fld: string = ""
  constructor(p: number[]) {
    this.fld = typeof p
  }
  meth(p: number[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_8.js 提取
class tof_meth_8_Z1 {
  fld: string = ""
  constructor(p: byte[]) {
    this.fld = typeof p
  }
  meth(p: byte[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z2 {
  fld: string = ""
  constructor(p: short[]) {
    this.fld = typeof p
  }
  meth(p: short[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z3 {
  fld: string = ""
  constructor(p: int[]) {
    this.fld = typeof p
  }
  meth(p: int[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z4 {
  fld: string = ""
  constructor(p: long[]) {
    this.fld = typeof p
  }
  meth(p: long[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z5 {
  fld: string = ""
  constructor(p: float[]) {
    this.fld = typeof p
  }
  meth(p: float[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z6 {
  fld: string = ""
  constructor(p: double[]) {
    this.fld = typeof p
  }
  meth(p: double[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z7 {
  fld: string = ""
  constructor(p: char[]) {
    this.fld = typeof p
  }
  meth(p: char[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_9.js 提取
interface tof_meth_9_I {}
class tof_meth_9_A implements tof_meth_9_I {}
class tof_meth_9_Z1 {
  fld: string = ""
  constructor(p: tof_meth_9_A[]) {
    this.fld = typeof p
  }
  meth(p: tof_meth_9_A[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_9_Z2 {
  fld: string = ""
  constructor(p: tof_meth_9_I[]) {
    this.fld = typeof p
  }
  meth(p: tof_meth_9_I[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_9_Z3 {
  fld: string = ""
  constructor(p: Comparable<Float>[]) {
    this.fld = typeof p
  }
  meth(p: Comparable<Float>[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_10.js 提取
class tof_meth_10_Z1 {
  fld: string = ""
  constructor(p: Floating[]) {
    this.fld = typeof p
  }
  meth(p: Floating[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_10_Z2 {
  fld: string = ""
  constructor(p: Integral[]) {
    this.fld = typeof p
  }
  meth(p: Integral[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_10_Z3 {
  fld: string = ""
  constructor(p: Numeric[]) {
    this.fld = typeof p
  }
  meth(p: Numeric[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_11.js 提取
type tof_meth_11_F = (p: int) => int
function tof_meth_11_foo(p: int): int {
  return p + p
}
let tof_meth_11_f: tof_meth_11_F = (p: int): int => { return p * p }
class tof_meth_11_Z1 {
  fld: string = ""
  constructor(p: tof_meth_11_F) {
    this.fld = typeof p
  }
  meth(p: tof_meth_11_F): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z2 {
  fld: string = ""
  constructor(p: ((p: int) => int)) {
    this.fld = typeof p
  }
  meth(p: ((p: int) => int)): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z3 {
  fld: string = ""
  constructor(p: tof_meth_11_F) {
    this.fld = typeof p
  }
  meth(p: tof_meth_11_F): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z4 {
  fld: string = ""
  constructor(p: ((p: int) => int)) {
    this.fld = typeof p
  }
  meth(p: ((p: int) => int)): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z5 {
  fld: string = ""
  constructor(p: (() => void)) {
    this.fld = typeof p
  }
  meth(p: (() => void)): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_12.js 提取
class tof_meth_12_Z1 {
  fld: string = ""
  constructor(p: undefined) {
    this.fld = typeof p
  }
  meth(p: undefined): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_13.js 提取
class tof_meth_13_Z1 {
  fld: string = ""
  constructor(p: null) {
    this.fld = typeof p
  }
  meth(p: null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_14.js 提取
interface tof_meth_14_I {}
class tof_meth_14_A implements tof_meth_14_I {}
class tof_meth_14_Z1 {
  fld: string = ""
  constructor(p: tof_meth_14_A|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z2 {
  fld: string = ""
  constructor(p: tof_meth_14_A|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z3 {
  fld: string = ""
  constructor(p: tof_meth_14_I|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z4 {
  fld: string = ""
  constructor(p: tof_meth_14_I|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z5 {
  fld: string = ""
  constructor(p: tof_meth_14_A[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z6 {
  fld: string = ""
  constructor(p: tof_meth_14_A[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z7 {
  fld: string = ""
  constructor(p: tof_meth_14_I[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z8 {
  fld: string = ""
  constructor(p: tof_meth_14_I[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_15.js 提取
enum tof_meth_15_Color { Red, Green, Blue }
enum tof_meth_15_Size { S, M, L, XL }
class tof_meth_15_Z1 {
  fld: string = ""
  constructor(p: tof_meth_15_Color) {
    this.fld = typeof p
  }
  meth(p: tof_meth_15_Color): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_15_Z2 {
  fld: string = ""
  constructor(p: tof_meth_15_Size) {
    this.fld = typeof p
  }
  meth(p: tof_meth_15_Size): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_16.js 提取
enum tof_meth_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_meth_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
class tof_meth_16_Z1 {
  fld: string = ""
  constructor(p: tof_meth_16_Color) {
    this.fld = typeof p
  }
  meth(p: tof_meth_16_Color): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_16_Z2 {
  fld: string = ""
  constructor(p: tof_meth_16_Size) {
    this.fld = typeof p
  }
  meth(p: tof_meth_16_Size): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_17.js 提取
class tof_meth_17_Z1 {
  fld: string = ""
  constructor(p: number|string|boolean) {
    this.fld = typeof p
  }
  meth(p: number|string|boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_17_Z2 {
  fld: string = ""
  constructor(p: number|boolean) {
    this.fld = typeof p
  }
  meth(p: number|boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_17_Z3 {
  fld: string = ""
  constructor(p: boolean|never|long) {
    this.fld = typeof p
  }
  meth(p: boolean|never|long): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_18.js 提取
class tof_meth_18_Z1 {
  fld: string = ""
  constructor(p: number|string|boolean) {
    this.fld = typeof p
  }
  meth(p: number|string|boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_18_Z2 {
  fld: string = ""
  constructor(p: number|string) {
    this.fld = typeof p
  }
  meth(p: number|string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_18_Z3 {
  fld: string = ""
  constructor(p: boolean|never|long|string) {
    this.fld = typeof p
  }
  meth(p: boolean|never|long|string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_19.js 提取
class tof_meth_19_A {}
class tof_meth_19_B {}
class tof_meth_19_C {}
class tof_meth_19_Z1 {
  fld: string = ""
  constructor(p: tof_meth_19_A|tof_meth_19_B|tof_meth_19_C) {
    this.fld = typeof p
  }
  meth(p: tof_meth_19_A|tof_meth_19_B|tof_meth_19_C): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_19_Z2 {
  fld: string = ""
  constructor(p: tof_meth_19_B|never|undefined|tof_meth_19_A) {
    this.fld = typeof p
  }
  meth(p: tof_meth_19_B|never|undefined|tof_meth_19_A): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_20.js 提取
interface tof_meth_20_I {}
class tof_meth_20_A implements tof_meth_20_I {}
class tof_meth_20_B extends tof_meth_20_A {}
class tof_meth_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
class tof_meth_20_Z1 {
  fld: string = ""
  constructor(p: tof_meth_20_C<tof_meth_20_A>) {
    this.fld = typeof p
  }
  meth(p: tof_meth_20_C<tof_meth_20_A>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_20_Z2 {
  fld: string = ""
  constructor(p: tof_meth_20_C<tof_meth_20_B>) {
    this.fld = typeof p
  }
  meth(p: tof_meth_20_C<tof_meth_20_B>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_20_Z3 {
  fld: string = ""
  constructor(p: tof_meth_20_C<tof_meth_20_I>) {
    this.fld = typeof p
  }
  meth(p: tof_meth_20_C<tof_meth_20_I>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_21.js 提取
class tof_meth_21_Z1 {
  fld: string = ""
  constructor(p: Comparable<Double>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Double>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_22.js 提取
class tof_meth_22_Z1 {
  fld: string = ""
  constructor(p: byte) {
    this.fld = typeof p
  }
  meth(p: byte): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_22_Z2 {
  fld: string = ""
  constructor(p: byte) {
    this.fld = typeof p
  }
  meth(p: byte): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_23.js 提取
class tof_meth_23_Z1 {
  fld: string = ""
  constructor(p: short) {
    this.fld = typeof p
  }
  meth(p: short): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_23_Z2 {
  fld: string = ""
  constructor(p: short) {
    this.fld = typeof p
  }
  meth(p: short): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_24.js 提取
class tof_meth_24_Z1 {
  fld: string = ""
  constructor(p: int) {
    this.fld = typeof p
  }
  meth(p: int): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_24_Z2 {
  fld: string = ""
  constructor(p: int) {
    this.fld = typeof p
  }
  meth(p: int): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_25.js 提取
class tof_meth_25_Z1 {
  fld: string = ""
  constructor(p: long) {
    this.fld = typeof p
  }
  meth(p: long): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_25_Z2 {
  fld: string = ""
  constructor(p: long) {
    this.fld = typeof p
  }
  meth(p: long): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_26.js 提取
class tof_meth_26_Z1 {
  fld: string = ""
  constructor(p: float) {
    this.fld = typeof p
  }
  meth(p: float): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_26_Z2 {
  fld: string = ""
  constructor(p: float) {
    this.fld = typeof p
  }
  meth(p: float): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_27.js 提取
class tof_meth_27_Z1 {
  fld: string = ""
  constructor(p: char) {
    this.fld = typeof p
  }
  meth(p: char): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_27_Z2 {
  fld: string = ""
  constructor(p: char) {
    this.fld = typeof p
  }
  meth(p: char): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_28.js 提取
class tof_meth_28_Z1 {
  fld: string = ""
  constructor(p: Comparable<Float>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Float>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_29.js 提取
class tof_meth_29_Z1 {
  fld: string = ""
  constructor(p: Comparable<Byte>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Byte>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_30.js 提取
class tof_meth_30_Z1 {
  fld: string = ""
  constructor(p: Comparable<Short>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Short>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_31.js 提取
class tof_meth_31_Z1 {
  fld: string = ""
  constructor(p: Comparable<Int>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Int>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_32.js 提取
class tof_meth_32_Z1 {
  fld: string = ""
  constructor(p: Comparable<Long>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Long>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_33.js 提取
class tof_meth_33_Z1 {
  fld: string = ""
  constructor(p: Comparable<Char>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Char>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_34.js 提取
class tof_meth_34_Z1 {
  fld: string = ""
  constructor(p: Floating) {
    this.fld = typeof p
  }
  meth(p: Floating): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

// 从 tof_meth_35.js 提取
class tof_meth_35_Z1 {
  fld: string = ""
  constructor(p: Integral) {
    this.fld = typeof p
  }
  meth(p: Integral): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_obj_0_Z1 {
  fld: number
}
class tof_obj_0_Z2 {
  fld: number
}

// 从 tof_obj_1.js 提取
class tof_obj_1_Z1 {
  fld: double
}
class tof_obj_1_Z2 {
  fld: double
}

// 从 tof_obj_2.js 提取
let tof_obj_2_a = 42
class tof_obj_2_Z1 {
  fld: string = ""
}
class tof_obj_2_Z2 {
  fld: string = ""
}
class tof_obj_2_Z3 {
  fld: string = ""
}
class tof_obj_2_Z4 {
  fld: Comparable<String> = ""
}

// 从 tof_obj_3.js 提取
class tof_obj_3_Z1 {
  fld: boolean
}
class tof_obj_3_Z2 {
  fld: boolean
}
class tof_obj_3_Z3 {
  fld: Comparable<Boolean> = false
}

// 从 tof_obj_4.js 提取
class tof_obj_4_Z1 {
  fld: bigint = 0n
}
class tof_obj_4_Z2 {
  fld: bigint = 0n
}

// 从 tof_obj_5.js 提取
interface tof_obj_5_I {}
class tof_obj_5_A implements tof_obj_5_I {}
class tof_obj_5_Z1 {
  fld: tof_obj_5_A = new tof_obj_5_A()
}
class tof_obj_5_Z2 {
  fld: tof_obj_5_I = new tof_obj_5_A()
}

// 从 tof_obj_6.js 提取
class tof_obj_6_Z1 {
  fld: Numeric = 0
}

// 从 tof_obj_7.js 提取
class tof_obj_7_Z1 {
  fld: number[] = []
}
class tof_obj_7_Z2 {
  fld: number[] = []
}

// 从 tof_obj_8.js 提取
class tof_obj_8_Z1 {
  fld: byte[] = []
}
class tof_obj_8_Z2 {
  fld: short[] = []
}
class tof_obj_8_Z3 {
  fld: int[] = []
}
class tof_obj_8_Z4 {
  fld: long[] = []
}
class tof_obj_8_Z5 {
  fld: float[] = []
}
class tof_obj_8_Z6 {
  fld: double[] = []
}
class tof_obj_8_Z7 {
  fld: char[] = []
}

// 从 tof_obj_9.js 提取
interface tof_obj_9_I {}
class tof_obj_9_A implements tof_obj_9_I {}
class tof_obj_9_Z1 {
  fld: tof_obj_9_A[] = []
}
class tof_obj_9_Z2 {
  fld: tof_obj_9_I[] = []
}
class tof_obj_9_Z3 {
  fld: Comparable<Float>[] = []
}

// 从 tof_obj_10.js 提取
class tof_obj_10_Z1 {
  fld: Floating[] = []
}
class tof_obj_10_Z2 {
  fld: Integral[] = []
}
class tof_obj_10_Z3 {
  fld: Numeric[] = []
}

// 从 tof_obj_11.js 提取
type tof_obj_11_F = (p: int) => int
function tof_obj_11_foo(p: int): int {
  return p + p
}
let tof_obj_11_f: tof_obj_11_F = (p: int): int => { return p * p }
class tof_obj_11_Z1 {
  fld: tof_obj_11_F = (p: int) => 0
}
class tof_obj_11_Z2 {
  fld: ((p: int) => int) = (p: int) => 0
}
class tof_obj_11_Z3 {
  fld: tof_obj_11_F = (p: int) => 0
}
class tof_obj_11_Z4 {
  fld: ((p: int) => int) = (p: int) => 0
}
class tof_obj_11_Z5 {
  fld: (() => void) = () => {}
}

// 从 tof_obj_12.js 提取
class tof_obj_12_Z1 {
  fld: undefined
}

// 从 tof_obj_13.js 提取
class tof_obj_13_Z1 {
  fld: null = null
}

// 从 tof_obj_14.js 提取
interface tof_obj_14_I {}
class tof_obj_14_A implements tof_obj_14_I {}
class tof_obj_14_Z1 {
  fld: tof_obj_14_A|null = null
}
class tof_obj_14_Z2 {
  fld: tof_obj_14_A|null = null
}
class tof_obj_14_Z3 {
  fld: tof_obj_14_I|null = null
}
class tof_obj_14_Z4 {
  fld: tof_obj_14_I|null = null
}
class tof_obj_14_Z5 {
  fld: tof_obj_14_A[]|null = null
}
class tof_obj_14_Z6 {
  fld: tof_obj_14_A[]|null = null
}
class tof_obj_14_Z7 {
  fld: tof_obj_14_I[]|null = null
}
class tof_obj_14_Z8 {
  fld: tof_obj_14_I[]|null = null
}

// 从 tof_obj_15.js 提取
enum tof_obj_15_Color { Red, Green, Blue }
enum tof_obj_15_Size { S, M, L, XL }
class tof_obj_15_Z1 {
  fld: tof_obj_15_Color = tof_obj_15_Color.Red
}
class tof_obj_15_Z2 {
  fld: tof_obj_15_Size = tof_obj_15_Size.S
}

// 从 tof_obj_16.js 提取
enum tof_obj_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_obj_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
class tof_obj_16_Z1 {
  fld: tof_obj_16_Color = tof_obj_16_Color.Red
}
class tof_obj_16_Z2 {
  fld: tof_obj_16_Size = tof_obj_16_Size.S
}

// 从 tof_obj_17.js 提取
class tof_obj_17_Z1 {
  fld: number|string|boolean = 0
}
class tof_obj_17_Z2 {
  fld: number|boolean = 0
}
class tof_obj_17_Z3 {
  fld: boolean|never|long = false
}

// 从 tof_obj_18.js 提取
class tof_obj_18_Z1 {
  fld: number|string|boolean = 0
}
class tof_obj_18_Z2 {
  fld: number|string = 0
}
class tof_obj_18_Z3 {
  fld: boolean|never|long|string = false
}

// 从 tof_obj_19.js 提取
class tof_obj_19_A {}
class tof_obj_19_B {}
class tof_obj_19_C {}
class tof_obj_19_Z1 {
  fld: tof_obj_19_A|tof_obj_19_B|tof_obj_19_C = new tof_obj_19_A()
}
class tof_obj_19_Z2 {
  fld: tof_obj_19_B|never|undefined|tof_obj_19_A
}

// 从 tof_obj_20.js 提取
interface tof_obj_20_I {}
class tof_obj_20_A implements tof_obj_20_I {}
class tof_obj_20_B extends tof_obj_20_A {}
class tof_obj_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
class tof_obj_20_Z1 {
  fld: tof_obj_20_C<tof_obj_20_A> = new tof_obj_20_C<tof_obj_20_A>(new tof_obj_20_A())
}
class tof_obj_20_Z2 {
  fld: tof_obj_20_C<tof_obj_20_B> = new tof_obj_20_C<tof_obj_20_B>(new tof_obj_20_B())
}
class tof_obj_20_Z3 {
  fld: tof_obj_20_C<tof_obj_20_I> = new tof_obj_20_C<tof_obj_20_I>(new tof_obj_20_A())
}

// 从 tof_obj_21.js 提取
class tof_obj_21_Z1 {
  fld: Comparable<Double> = new Double()
}

// 从 tof_obj_22.js 提取
class tof_obj_22_Z1 {
  fld: byte
}
class tof_obj_22_Z2 {
  fld: byte
}

// 从 tof_obj_23.js 提取
class tof_obj_23_Z1 {
  fld: short
}
class tof_obj_23_Z2 {
  fld: short
}

// 从 tof_obj_24.js 提取
class tof_obj_24_Z1 {
  fld: int
}
class tof_obj_24_Z2 {
  fld: int
}

// 从 tof_obj_25.js 提取
class tof_obj_25_Z1 {
  fld: long
}
class tof_obj_25_Z2 {
  fld: long
}

// 从 tof_obj_26.js 提取
class tof_obj_26_Z1 {
  fld: float
}
class tof_obj_26_Z2 {
  fld: float
}

// 从 tof_obj_27.js 提取
class tof_obj_27_Z1 {
  fld: char
}
class tof_obj_27_Z2 {
  fld: char
}

// 从 tof_obj_28.js 提取
class tof_obj_28_Z1 {
  fld: Comparable<Float> = new Float()
}

// 从 tof_obj_29.js 提取
class tof_obj_29_Z1 {
  fld: Comparable<Byte> = new Byte()
}

// 从 tof_obj_30.js 提取
class tof_obj_30_Z1 {
  fld: Comparable<Short> = new Short()
}

// 从 tof_obj_31.js 提取
class tof_obj_31_Z1 {
  fld: Comparable<Int> = new Int()
}

// 从 tof_obj_32.js 提取
class tof_obj_32_Z1 {
  fld: Comparable<Long> = new Long()
}

// 从 tof_obj_33.js 提取
class tof_obj_33_Z1 {
  fld: Comparable<Char> = new Char()
}

// 从 tof_obj_34.js 提取
class tof_obj_34_Z1 {
  fld: Floating = 3.14f
}

// 从 tof_obj_35.js 提取
class tof_obj_35_Z1 {
  fld: Integral = 42
}

let tof_vars_0_g1:number = Number.MIN_VALUE
let tof_vars_0_g2:number = Number.MAX_VALUE

// 从 tof_vars_1.js 提取
let tof_vars_1_g1:double = Double.MIN_VALUE
let tof_vars_1_g2:double = Double.MAX_VALUE

// 从 tof_vars_2.js 提取
let tof_vars_2_a = 42
let tof_vars_2_g1:string = "ABC"
let tof_vars_2_g2:string = '' + '' + 'CDE'
let tof_vars_2_g3:string = `a = ${tof_vars_2_a}` + '' + "CDE"
let tof_vars_2_g4:Comparable<String> = "X"

// 从 tof_vars_3.js 提取
let tof_vars_3_g1:boolean = true
let tof_vars_3_g2:boolean = false
let tof_vars_3_g3:Comparable<Boolean> = new Boolean()

// 从 tof_vars_4.js 提取
let tof_vars_4_g1:bigint = 123456789012345678901234567890n
let tof_vars_4_g2:bigint = 999999999999999999999999999999n

// 从 tof_vars_5.js 提取
interface tof_vars_5_I {}
class tof_vars_5_A implements tof_vars_5_I {}
let tof_vars_5_g1:tof_vars_5_A = {}
let tof_vars_5_g2:tof_vars_5_I = new tof_vars_5_A()

// 从 tof_vars_6.js 提取
let tof_vars_6_g1:Numeric = 3.14

// 从 tof_vars_7.js 提取
let tof_vars_7_g1:number[] = [Number.MIN_VALUE]
let tof_vars_7_g2:number[] = [Number.MAX_VALUE]

// 从 tof_vars_8.js 提取
let tof_vars_8_g1:byte[] = [Byte.MIN_VALUE]
let tof_vars_8_g2:short[] = [Short.MIN_VALUE]
let tof_vars_8_g3:int[] = [Int.MAX_VALUE]
let tof_vars_8_g4:long[] = [Long.MIN_VALUE]
let tof_vars_8_g5:float[] = [Float.MIN_VALUE]
let tof_vars_8_g6:double[] = [Double.MIN_VALUE]
let tof_vars_8_g7:char[] = [Char.MIN_VALUE as char]

// 从 tof_vars_9.js 提取
interface tof_vars_9_I {}
class tof_vars_9_A implements tof_vars_9_I {}
let tof_vars_9_g1:tof_vars_9_A[] = [new tof_vars_9_A]
let tof_vars_9_g2:tof_vars_9_I[] = [new tof_vars_9_A]
let tof_vars_9_g3:Comparable<Float>[] = [3.14f]

// 从 tof_vars_10.js 提取
let tof_vars_10_g1:Floating[] = [3.14f]
let tof_vars_10_g2:Integral[] = [42]
let tof_vars_10_g3:Numeric[] = [3.14]

// 从 tof_vars_11.js 提取
type tof_vars_11_F = (p: int) => int
function tof_vars_11_foo(p: int): int {
  return p + p
}
let tof_vars_11_f: tof_vars_11_F = (p: int): int => { return p * p }
let tof_vars_11_g1:tof_vars_11_F = tof_vars_11_foo
let tof_vars_11_g2:((p: int) => int) = tof_vars_11_foo
let tof_vars_11_g3:tof_vars_11_F = tof_vars_11_f
let tof_vars_11_g4:((p: int) => int) = tof_vars_11_f
let tof_vars_11_g5:(() => void) = () => { console.log(1) }

// 从 tof_vars_12.js 提取
let tof_vars_12_g1:undefined = undefined

// 从 tof_vars_13.js 提取
let tof_vars_13_g1:null = null

// 从 tof_vars_14.js 提取
interface tof_vars_14_I {}
class tof_vars_14_A implements tof_vars_14_I {}
let tof_vars_14_g1:tof_vars_14_A|null = new tof_vars_14_A()
let tof_vars_14_g2:tof_vars_14_A|null = null
let tof_vars_14_g3:tof_vars_14_I|null = new tof_vars_14_A()
let tof_vars_14_g4:tof_vars_14_I|null = null
let tof_vars_14_g5:tof_vars_14_A[]|null = [new tof_vars_14_A()]
let tof_vars_14_g6:tof_vars_14_A[]|null = null
let tof_vars_14_g7:tof_vars_14_I[]|null = [new tof_vars_14_A()]
let tof_vars_14_g8:tof_vars_14_I[]|null = null

// 从 tof_vars_15.js 提取
enum tof_vars_15_Color { Red, Green, Blue }
enum tof_vars_15_Size { S, M, L, XL }
let tof_vars_15_g1:tof_vars_15_Color = tof_vars_15_Color.Red
let tof_vars_15_g2:tof_vars_15_Size = tof_vars_15_Size.XL

// 从 tof_vars_16.js 提取
enum tof_vars_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_vars_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
let tof_vars_16_g1:tof_vars_16_Color = tof_vars_16_Color.Blue
let tof_vars_16_g2:tof_vars_16_Size = tof_vars_16_Size.L

// 从 tof_vars_17.js 提取
let tof_vars_17_g1:number|string|boolean = false
let tof_vars_17_g2:number|boolean = true
let tof_vars_17_g3:boolean|never|long = true

// 从 tof_vars_18.js 提取
let tof_vars_18_g1:number|string|boolean = "false"
let tof_vars_18_g2:number|string = "3.14"
let tof_vars_18_g3:boolean|never|long|string = "1234567890"

// 从 tof_vars_19.js 提取
class tof_vars_19_A {}
class tof_vars_19_B {}
class tof_vars_19_C {}
let tof_vars_19_g1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
let tof_vars_19_g2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()

// 从 tof_vars_20.js 提取
interface tof_vars_20_I {}
class tof_vars_20_A implements tof_vars_20_I {}
class tof_vars_20_B extends tof_vars_20_A {}
class tof_vars_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
let tof_vars_20_g1:tof_vars_20_C<tof_vars_20_A> = new tof_vars_20_C<tof_vars_20_A>(new tof_vars_20_A())
let tof_vars_20_g2:tof_vars_20_C<tof_vars_20_B> = new tof_vars_20_C<tof_vars_20_B>(new tof_vars_20_B())
let tof_vars_20_g3:tof_vars_20_C<tof_vars_20_I> = new tof_vars_20_C<tof_vars_20_I>(new tof_vars_20_B())

// 从 tof_vars_21.js 提取
let tof_vars_21_g1:Comparable<Double> = new Double()

// 从 tof_vars_22.js 提取
let tof_vars_22_g1:byte = Byte.MIN_VALUE
let tof_vars_22_g2:byte = Byte.MAX_VALUE

// 从 tof_vars_23.js 提取
let tof_vars_23_g1:short = Short.MIN_VALUE
let tof_vars_23_g2:short = Short.MAX_VALUE

// 从 tof_vars_24.js 提取
let tof_vars_24_g1:int = Int.MIN_VALUE
let tof_vars_24_g2:int = Int.MAX_VALUE

// 从 tof_vars_25.js 提取
let tof_vars_25_g1:long = Long.MIN_VALUE
let tof_vars_25_g2:long = Long.MAX_VALUE

// 从 tof_vars_26.js 提取
let tof_vars_26_g1:float = Float.MIN_VALUE
let tof_vars_26_g2:float = Float.MAX_VALUE

// 从 tof_vars_27.js 提取
let tof_vars_27_g1:char = Char.MIN_VALUE as char
let tof_vars_27_g2:char = Char.MAX_VALUE as char

// 从 tof_vars_28.js 提取
let tof_vars_28_g1:Comparable<Float> = new Float()

// 从 tof_vars_29.js 提取
let tof_vars_29_g1:Comparable<Byte> = new Byte()

// 从 tof_vars_30.js 提取
let tof_vars_30_g1:Comparable<Short> = new Short()

// 从 tof_vars_31.js 提取
let tof_vars_31_g1:Comparable<Int> = new Int()

// 从 tof_vars_32.js 提取
let tof_vars_32_g1:Comparable<Long> = new Long()

// 从 tof_vars_33.js 提取
let tof_vars_33_g1:Comparable<Char> = new Char()

// 从 tof_vars_34.js 提取
let tof_vars_34_g1:Floating = 3.14f

// 从 tof_vars_35.js 提取
let tof_vars_35_g1:Integral = 42

export default function ExpressionsTypePart() {
  describe("ExpressionsTypePart", () => {
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
     * @tc.number    SUB_EXPRESSIONS_TYPE_19900
     * @tc.name      testExpressionsType0199
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_14_A|null = new tof_vars_14_A()
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_14_g1).assertEqual("object")
      let v2:tof_vars_14_A|null = null
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_14_g2).assertEqual("object")
      let v3:tof_vars_14_I|null = new tof_vars_14_A()
      expect(typeof v3).assertEqual("object")
      expect(typeof tof_vars_14_g3).assertEqual("object")
      let v4:tof_vars_14_I|null = null
      expect(typeof v4).assertEqual("object")
      expect(typeof tof_vars_14_g4).assertEqual("object")
      let v5:tof_vars_14_A[]|null = [new tof_vars_14_A()]
      expect(typeof v5).assertEqual("object")
      expect(typeof tof_vars_14_g5).assertEqual("object")
      let v6:tof_vars_14_A[]|null = null
      expect(typeof v6).assertEqual("object")
      expect(typeof tof_vars_14_g6).assertEqual("object")
      let v7:tof_vars_14_I[]|null = [new tof_vars_14_A()]
      expect(typeof v7).assertEqual("object")
      expect(typeof tof_vars_14_g7).assertEqual("object")
      let v8:tof_vars_14_I[]|null = null
      expect(typeof v8).assertEqual("object")
      expect(typeof tof_vars_14_g8).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20000
     * @tc.name      testExpressionsType0200
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_15_Color = tof_vars_15_Color.Red
      expect(typeof v1).assertEqual("int")
      expect(typeof tof_vars_15_g1).assertEqual("int")
      let v2:tof_vars_15_Size = tof_vars_15_Size.XL
      expect(typeof v2).assertEqual("int")
      expect(typeof tof_vars_15_g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20100
     * @tc.name      testExpressionsType0201
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_16_Color = tof_vars_16_Color.Blue
      expect(typeof v1).assertEqual("string")
      expect(typeof tof_vars_16_g1).assertEqual("string")
      let v2:tof_vars_16_Size = tof_vars_16_Size.L
      expect(typeof v2).assertEqual("string")
      expect(typeof tof_vars_16_g2).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20200
     * @tc.name      testExpressionsType0202
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:number|string|boolean = false
      expect(typeof v1).assertEqual("boolean")
      expect(typeof tof_vars_17_g1).assertEqual("boolean")
      let v2:number|boolean = true
      expect(typeof v2).assertEqual("boolean")
      expect(typeof tof_vars_17_g2).assertEqual("boolean")
      let v3:boolean|never|long = true
      expect(typeof v3).assertEqual("boolean")
      expect(typeof tof_vars_17_g3).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20300
     * @tc.name      testExpressionsType0203
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:number|string|boolean = "false"
      expect(typeof v1).assertEqual("string")
      expect(typeof tof_vars_18_g1).assertEqual("string")
      let v2:number|string = "3.14"
      expect(typeof v2).assertEqual("string")
      expect(typeof tof_vars_18_g2).assertEqual("string")
      let v3:boolean|never|long|string = "1234567890"
      expect(typeof v3).assertEqual("string")
      expect(typeof tof_vars_18_g3).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20400
     * @tc.name      testExpressionsType0204
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_19_g1).assertEqual("object")
      let v2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_19_g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20500
     * @tc.name      testExpressionsType0205
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_20_C<tof_vars_20_A> = new tof_vars_20_C<tof_vars_20_A>(new tof_vars_20_A())
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_20_g1).assertEqual("object")
      let v2:tof_vars_20_C<tof_vars_20_B> = new tof_vars_20_C<tof_vars_20_B>(new tof_vars_20_B())
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_20_g2).assertEqual("object")
      let v3:tof_vars_20_C<tof_vars_20_I> = new tof_vars_20_C<tof_vars_20_I>(new tof_vars_20_B())
      expect(typeof v3).assertEqual("object")
      expect(typeof tof_vars_20_g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20600
     * @tc.name      testExpressionsType0206
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Double> = new Double()
      expect(typeof v1).assertEqual("number")
      expect(typeof tof_vars_21_g1).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20700
     * @tc.name      testExpressionsType0207
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = Byte.MIN_VALUE
      expect(typeof v1).assertEqual("byte")
      expect(typeof tof_vars_22_g1).assertEqual("byte")
      let v2:byte = Byte.MAX_VALUE
      expect(typeof v2).assertEqual("byte")
      expect(typeof tof_vars_22_g2).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20800
     * @tc.name      testExpressionsType0208
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = Short.MIN_VALUE
      expect(typeof v1).assertEqual("short")
      expect(typeof tof_vars_23_g1).assertEqual("short")
      let v2:short = Short.MAX_VALUE
      expect(typeof v2).assertEqual("short")
      expect(typeof tof_vars_23_g2).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_20900
     * @tc.name      testExpressionsType0209
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = Int.MIN_VALUE
      expect(typeof v1).assertEqual("int")
      expect(typeof tof_vars_24_g1).assertEqual("int")
      let v2:int = Int.MAX_VALUE
      expect(typeof v2).assertEqual("int")
      expect(typeof tof_vars_24_g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21000
     * @tc.name      testExpressionsType0210
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = Long.MIN_VALUE
      expect(typeof v1).assertEqual("long")
      expect(typeof tof_vars_25_g1).assertEqual("long")
      let v2:long = Long.MAX_VALUE
      expect(typeof v2).assertEqual("long")
      expect(typeof tof_vars_25_g2).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21100
     * @tc.name      testExpressionsType0211
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:float = Float.MIN_VALUE
      expect(typeof v1).assertEqual("float")
      expect(typeof tof_vars_26_g1).assertEqual("float")
      let v2:float = Float.MAX_VALUE
      expect(typeof v2).assertEqual("float")
      expect(typeof tof_vars_26_g2).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21200
     * @tc.name      testExpressionsType0212
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:char = Char.MIN_VALUE as char
      expect(typeof v1).assertEqual("char")
      expect(typeof tof_vars_27_g1).assertEqual("char")
      let v2:char = Char.MAX_VALUE as char
      expect(typeof v2).assertEqual("char")
      expect(typeof tof_vars_27_g2).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21300
     * @tc.name      testExpressionsType0213
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Float> = new Float()
      expect(typeof v1).assertEqual("float")
      expect(typeof tof_vars_28_g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21400
     * @tc.name      testExpressionsType0214
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Byte> = new Byte()
      expect(typeof v1).assertEqual("byte")
      expect(typeof tof_vars_29_g1).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21500
     * @tc.name      testExpressionsType0215
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Short> = new Short()
      expect(typeof v1).assertEqual("short")
      expect(typeof tof_vars_30_g1).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21600
     * @tc.name      testExpressionsType0216
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Int> = new Int()
      expect(typeof v1).assertEqual("int")
      expect(typeof tof_vars_31_g1).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21700
     * @tc.name      testExpressionsType0217
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Long> = new Long()
      expect(typeof v1).assertEqual("long")
      expect(typeof tof_vars_32_g1).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21800
     * @tc.name      testExpressionsType0218
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Comparable<Char> = new Char()
      expect(typeof v1).assertEqual("char")
      expect(typeof tof_vars_33_g1).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_21900
     * @tc.name      testExpressionsType0219
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Floating = 3.14f
      expect(typeof v1).assertEqual("float")
      expect(typeof tof_vars_34_g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_22000
     * @tc.name      testExpressionsType0220
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Integral = 42
      expect(typeof v1).assertEqual("int")
      expect(typeof tof_vars_35_g1).assertEqual("int")
    });
  });
}