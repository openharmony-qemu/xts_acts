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

function tof_func_0_foo1(p: number): string { return typeof p }
function tof_func_0_foo2(p: number): string { return typeof p }

function tof_func_1_foo1(p: double): string { return typeof p }
function tof_func_1_foo2(p: double): string { return typeof p }

function tof_func_2_foo1(p: string): string { return typeof p }
function tof_func_2_foo2(p: string): string { return typeof p }
function tof_func_2_foo3(p: string): string { return typeof p }
function tof_func_2_foo4(p: Comparable<String>): string { return typeof p }

function tof_func_3_foo1(p: boolean): string { return typeof p }
function tof_func_3_foo2(p: boolean): string { return typeof p }
function tof_func_3_foo3(p: Comparable<Boolean>): string { return typeof p }

function tof_func_4_foo1(p: bigint): string { return typeof p }
function tof_func_4_foo2(p: bigint): string { return typeof p }

function tof_func_5_foo1(p: AA1): string { return typeof p }
function tof_func_5_foo2(p: I1): string { return typeof p }

function tof_func_6_foo1(p: Numeric): string { return typeof p }

function tof_func_7_foo1(p: number[]): string { return typeof p }
function tof_func_7_foo2(p: number[]): string { return typeof p }

function tof_func_8_foo1(p: byte[]): string { return typeof p }
function tof_func_8_foo2(p: short[]): string { return typeof p }
function tof_func_8_foo3(p: int[]): string { return typeof p }
function tof_func_8_foo4(p: long[]): string { return typeof p }
function tof_func_8_foo5(p: float[]): string { return typeof p }
function tof_func_8_foo6(p: double[]): string { return typeof p }
function tof_func_8_foo7(p: char[]): string { return typeof p }

function tof_func_9_foo1(p: AA1[]): string { return typeof p }
function tof_func_9_foo2(p: I1[]): string { return typeof p }
function tof_func_9_foo3(p: Comparable<Float>[]): string { return typeof p }

function tof_func_10_foo1(p: Floating[]): string { return typeof p }
function tof_func_10_foo2(p: Integral[]): string { return typeof p }
function tof_func_10_foo3(p: Numeric[]): string { return typeof p }

function tof_func_11_foo1(p: FF1): string { return typeof p }
function tof_func_11_foo2(p: ((p: int) => int)): string { return typeof p }
function tof_func_11_foo3(p: FF1): string { return typeof p }
function tof_func_11_foo4(p: ((p: int) => int)): string { return typeof p }
function tof_func_11_foo5(p: (() => void)): string { return typeof p }

function tof_func_12_foo1(p: undefined): string { return typeof p }

function tof_func_13_foo1(p: null): string { return typeof p }

function tof_func_14_foo1(p: A2|null): string { return typeof p }
function tof_func_14_foo2(p: A2|null): string { return typeof p }
function tof_func_14_foo3(p: I3|null): string { return typeof p }
function tof_func_14_foo4(p: I3|null): string { return typeof p }
function tof_func_14_foo5(p: A2[]|null): string { return typeof p }
function tof_func_14_foo6(p: A2[]|null): string { return typeof p }
function tof_func_14_foo7(p: I3[]|null): string { return typeof p }
function tof_func_14_foo8(p: I3[]|null): string { return typeof p }

function tof_func_15_foo1(p: Color1): string { return typeof p }
function tof_func_15_foo2(p: Size1): string { return typeof p }

function tof_func_16_foo1(p: Color2): string { return typeof p }
function tof_func_16_foo2(p: Size2): string { return typeof p }

function tof_func_17_foo1(p: number|string|boolean): string { return typeof p }
function tof_func_17_foo2(p: number|boolean): string { return typeof p }
function tof_func_17_foo3(p: boolean|never|long): string { return typeof p }

function tof_func_18_foo1(p: number|string|boolean): string { return typeof p }
function tof_func_18_foo2(p: number|string): string { return typeof p }
function tof_func_18_foo3(p: boolean|never|long|string): string { return typeof p }

function tof_func_19_foo1(p: A3|B2|CC2): string { return typeof p }
function tof_func_19_foo2(p: B2|never|undefined|A3): string { return typeof p }

function tof_func_20_foo1(p: CC1<A2>): string { return typeof p }
function tof_func_20_foo2(p: CC1<B1>): string { return typeof p }
function tof_func_20_foo3(p: CC1<I3>): string { return typeof p }

function tof_func_21_foo1(p: Comparable<Double>): string { return typeof p }

function tof_func_22_foo1(p: byte): string { return typeof p }
function tof_func_22_foo2(p: byte): string { return typeof p }

function tof_func_23_foo1(p: short): string { return typeof p }
function tof_func_23_foo2(p: short): string { return typeof p }

function tof_func_24_foo1(p: int): string { return typeof p }
function tof_func_24_foo2(p: int): string { return typeof p }

function tof_func_25_foo1(p: long): string { return typeof p }
function tof_func_25_foo2(p: long): string { return typeof p }

function tof_func_26_foo1(p: float): string { return typeof p }
function tof_func_26_foo2(p: float): string { return typeof p }

function tof_func_27_foo1(p: char): string { return typeof p }
function tof_func_27_foo2(p: char): string { return typeof p }

function tof_func_28_foo1(p: Comparable<Float>): string { return typeof p }

function tof_func_29_foo1(p: Comparable<Byte>): string { return typeof p }

function tof_func_30_foo1(p: Comparable<Short>): string { return typeof p }

function tof_func_31_foo1(p: Comparable<Int>): string { return typeof p }

function tof_func_32_foo1(p: Comparable<Long>): string { return typeof p }

function tof_func_33_foo1(p: Comparable<Char>): string { return typeof p }

function tof_func_34_foo1(p: Floating): string { return typeof p }

function tof_func_35_foo1(p: Integral): string { return typeof p }

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

class tof_meth_6_Z1 {
  fld: string = ""
  constructor(p: Numeric) {
    this.fld = typeof p
  }
  meth(p: Numeric): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

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

class tof_meth_12_Z1 {
  fld: string = ""
  constructor(p: undefined) {
    this.fld = typeof p
  }
  meth(p: undefined): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_13_Z1 {
  fld: string = ""
  constructor(p: null) {
    this.fld = typeof p
  }
  meth(p: null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

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

class tof_meth_21_Z1 {
  fld: string = ""
  constructor(p: Comparable<Double>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Double>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

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

class tof_meth_28_Z1 {
  fld: string = ""
  constructor(p: Comparable<Float>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Float>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_29_Z1 {
  fld: string = ""
  constructor(p: Comparable<Byte>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Byte>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_30_Z1 {
  fld: string = ""
  constructor(p: Comparable<Short>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Short>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_31_Z1 {
  fld: string = ""
  constructor(p: Comparable<Int>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Int>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_32_Z1 {
  fld: string = ""
  constructor(p: Comparable<Long>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Long>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_33_Z1 {
  fld: string = ""
  constructor(p: Comparable<Char>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Char>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_34_Z1 {
  fld: string = ""
  constructor(p: Floating) {
    this.fld = typeof p
  }
  meth(p: Floating): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

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

class tof_obj_1_Z1 {
  fld: double
}
class tof_obj_1_Z2 {
  fld: double
}

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

class tof_obj_3_Z1 {
  fld: boolean
}
class tof_obj_3_Z2 {
  fld: boolean
}
class tof_obj_3_Z3 {
  fld: Comparable<Boolean> = false
}

class tof_obj_4_Z1 {
  fld: bigint = 0n
}
class tof_obj_4_Z2 {
  fld: bigint = 0n
}

interface tof_obj_5_I {}
class tof_obj_5_A implements tof_obj_5_I {}
class tof_obj_5_Z1 {
  fld: tof_obj_5_A = new tof_obj_5_A()
}
class tof_obj_5_Z2 {
  fld: tof_obj_5_I = new tof_obj_5_A()
}

class tof_obj_6_Z1 {
  fld: Numeric = 0
}

class tof_obj_7_Z1 {
  fld: number[] = []
}
class tof_obj_7_Z2 {
  fld: number[] = []
}

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

class tof_obj_10_Z1 {
  fld: Floating[] = []
}
class tof_obj_10_Z2 {
  fld: Integral[] = []
}
class tof_obj_10_Z3 {
  fld: Numeric[] = []
}

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

class tof_obj_12_Z1 {
  fld: undefined
}

class tof_obj_13_Z1 {
  fld: null = null
}

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

enum tof_obj_15_Color { Red, Green, Blue }
enum tof_obj_15_Size { S, M, L, XL }
class tof_obj_15_Z1 {
  fld: tof_obj_15_Color = tof_obj_15_Color.Red
}
class tof_obj_15_Z2 {
  fld: tof_obj_15_Size = tof_obj_15_Size.S
}

enum tof_obj_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_obj_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
class tof_obj_16_Z1 {
  fld: tof_obj_16_Color = tof_obj_16_Color.Red
}
class tof_obj_16_Z2 {
  fld: tof_obj_16_Size = tof_obj_16_Size.S
}

class tof_obj_17_Z1 {
  fld: number|string|boolean = 0
}
class tof_obj_17_Z2 {
  fld: number|boolean = 0
}
class tof_obj_17_Z3 {
  fld: boolean|never|long = false
}

class tof_obj_18_Z1 {
  fld: number|string|boolean = 0
}
class tof_obj_18_Z2 {
  fld: number|string = 0
}
class tof_obj_18_Z3 {
  fld: boolean|never|long|string = false
}

class tof_obj_19_A {}
class tof_obj_19_B {}
class tof_obj_19_C {}
class tof_obj_19_Z1 {
  fld: tof_obj_19_A|tof_obj_19_B|tof_obj_19_C = new tof_obj_19_A()
}
class tof_obj_19_Z2 {
  fld: tof_obj_19_B|never|undefined|tof_obj_19_A
}

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

class tof_obj_21_Z1 {
  fld: Comparable<Double> = new Double()
}

class tof_obj_22_Z1 {
  fld: byte
}
class tof_obj_22_Z2 {
  fld: byte
}

class tof_obj_23_Z1 {
  fld: short
}
class tof_obj_23_Z2 {
  fld: short
}

class tof_obj_24_Z1 {
  fld: int
}
class tof_obj_24_Z2 {
  fld: int
}

class tof_obj_25_Z1 {
  fld: long
}
class tof_obj_25_Z2 {
  fld: long
}

class tof_obj_26_Z1 {
  fld: float
}
class tof_obj_26_Z2 {
  fld: float
}

class tof_obj_27_Z1 {
  fld: char
}
class tof_obj_27_Z2 {
  fld: char
}

class tof_obj_28_Z1 {
  fld: Comparable<Float> = new Float()
}

class tof_obj_29_Z1 {
  fld: Comparable<Byte> = new Byte()
}

class tof_obj_30_Z1 {
  fld: Comparable<Short> = new Short()
}

class tof_obj_31_Z1 {
  fld: Comparable<Int> = new Int()
}

class tof_obj_32_Z1 {
  fld: Comparable<Long> = new Long()
}

class tof_obj_33_Z1 {
  fld: Comparable<Char> = new Char()
}

class tof_obj_34_Z1 {
  fld: Floating = 3.14f
}

class tof_obj_35_Z1 {
  fld: Integral = 42
}

let tof_vars_0_g1:number = Number.MIN_VALUE
let tof_vars_0_g2:number = Number.MAX_VALUE

let tof_vars_1_g1:double = Double.MIN_VALUE
let tof_vars_1_g2:double = Double.MAX_VALUE

let tof_vars_2_a = 42
let tof_vars_2_g1:string = "ABC"
let tof_vars_2_g2:string = '' + '' + 'CDE'
let tof_vars_2_g3:string = `a = ${tof_vars_2_a}` + '' + "CDE"
let tof_vars_2_g4:Comparable<String> = "X"

let tof_vars_3_g1:boolean = true
let tof_vars_3_g2:boolean = false
let tof_vars_3_g3:Comparable<Boolean> = new Boolean()

let tof_vars_4_g1:bigint = 123456789012345678901234567890n
let tof_vars_4_g2:bigint = 999999999999999999999999999999n

interface tof_vars_5_I {}
class tof_vars_5_A implements tof_vars_5_I {}
let tof_vars_5_g1:tof_vars_5_A = {}
let tof_vars_5_g2:tof_vars_5_I = new tof_vars_5_A()

let tof_vars_6_g1:Numeric = 3.14

let tof_vars_7_g1:number[] = [Number.MIN_VALUE]
let tof_vars_7_g2:number[] = [Number.MAX_VALUE]

let tof_vars_8_g1:byte[] = [Byte.MIN_VALUE]
let tof_vars_8_g2:short[] = [Short.MIN_VALUE]
let tof_vars_8_g3:int[] = [Int.MAX_VALUE]
let tof_vars_8_g4:long[] = [Long.MIN_VALUE]
let tof_vars_8_g5:float[] = [Float.MIN_VALUE]
let tof_vars_8_g6:double[] = [Double.MIN_VALUE]
let tof_vars_8_g7:char[] = [Char.MIN_VALUE as char]

interface tof_vars_9_I {}
class tof_vars_9_A implements tof_vars_9_I {}
let tof_vars_9_g1:tof_vars_9_A[] = [new tof_vars_9_A]
let tof_vars_9_g2:tof_vars_9_I[] = [new tof_vars_9_A]
let tof_vars_9_g3:Comparable<Float>[] = [3.14f]

let tof_vars_10_g1:Floating[] = [3.14f]
let tof_vars_10_g2:Integral[] = [42]
let tof_vars_10_g3:Numeric[] = [3.14]

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

let tof_vars_12_g1:undefined = undefined

let tof_vars_13_g1:null = null

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

enum tof_vars_15_Color { Red, Green, Blue }
enum tof_vars_15_Size { S, M, L, XL }
let tof_vars_15_g1:tof_vars_15_Color = tof_vars_15_Color.Red
let tof_vars_15_g2:tof_vars_15_Size = tof_vars_15_Size.XL

enum tof_vars_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_vars_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
let tof_vars_16_g1:tof_vars_16_Color = tof_vars_16_Color.Blue
let tof_vars_16_g2:tof_vars_16_Size = tof_vars_16_Size.L

let tof_vars_17_g1:number|string|boolean = false
let tof_vars_17_g2:number|boolean = true
let tof_vars_17_g3:boolean|never|long = true

let tof_vars_18_g1:number|string|boolean = "false"
let tof_vars_18_g2:number|string = "3.14"
let tof_vars_18_g3:boolean|never|long|string = "1234567890"

class tof_vars_19_A {}
class tof_vars_19_B {}
class tof_vars_19_C {}
let tof_vars_19_g1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
let tof_vars_19_g2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()

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

let tof_vars_21_g1:Comparable<Double> = new Double()

let tof_vars_22_g1:byte = Byte.MIN_VALUE
let tof_vars_22_g2:byte = Byte.MAX_VALUE

let tof_vars_23_g1:short = Short.MIN_VALUE
let tof_vars_23_g2:short = Short.MAX_VALUE

let tof_vars_24_g1:int = Int.MIN_VALUE
let tof_vars_24_g2:int = Int.MAX_VALUE

let tof_vars_25_g1:long = Long.MIN_VALUE
let tof_vars_25_g2:long = Long.MAX_VALUE

let tof_vars_26_g1:float = Float.MIN_VALUE
let tof_vars_26_g2:float = Float.MAX_VALUE

let tof_vars_27_g1:char = Char.MIN_VALUE as char
let tof_vars_27_g2:char = Char.MAX_VALUE as char

let tof_vars_28_g1:Comparable<Float> = new Float()

let tof_vars_29_g1:Comparable<Byte> = new Byte()

let tof_vars_30_g1:Comparable<Short> = new Short()

let tof_vars_31_g1:Comparable<Int> = new Int()

let tof_vars_32_g1:Comparable<Long> = new Long()

let tof_vars_33_g1:Comparable<Char> = new Char()

let tof_vars_34_g1:Floating = 3.14f

let tof_vars_35_g1:Integral = 42

export default function ExpressionsTypeTest(): void {
  describe("ExpressionsTypeTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0100
     * @tc.name      testExpressionsType0001
     * @tc.desc      Types defined at compile time enum - "int"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: EN1 = EN1.a
      const t = typeof c
      expect(t).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0200
     * @tc.name      testExpressionsType0002
     * @tc.desc      Types defined at compile time enum - "string"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: ES1 = ES1.a
      const t = typeof c
      expect(t).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0300
     * @tc.name      testExpressionsType0003
     * @tc.desc      Types defined at compile time bigint - "bigint"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: bigint = 123n
      const t = typeof c
      expect(t).assertEqual("bigint")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0400
     * @tc.name      testExpressionsType0004
     * @tc.desc      Types defined at compile time boolean - "boolean"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: boolean = true
      const t = typeof c
      expect(t).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0500
     * @tc.name      testExpressionsType0005
     * @tc.desc      Types defined at compile time numeric type - "number"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: number = 123
      const t = typeof c
      expect(t).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0600
     * @tc.name      testExpressionsType0006
     * @tc.desc      Types defined at compile time byte type - "byte"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: byte = 123
      const t = typeof c
      expect(t).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0700
     * @tc.name      testExpressionsType0007
     * @tc.desc      Types defined at compile time short type - "short"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: short = 123
      const t = typeof c
      expect(t).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0800
     * @tc.name      testExpressionsType0008
     * @tc.desc      Types defined at compile time int type - "int"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: int = 123
      const t = typeof c
      expect(t).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_0900
     * @tc.name      testExpressionsType0009
     * @tc.desc      Types defined at compile time long type - "long"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: long = 123
      const t = typeof c
      expect(t).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1000
     * @tc.name      testExpressionsType0010
     * @tc.desc      Types defined at compile time float type - "float"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: float = 123.1f
      const t = typeof c
      expect(t).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1100
     * @tc.name      testExpressionsType0011
     * @tc.desc      Types defined at compile time numeric type - "number"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: double = 123.8
      const t = typeof c
      expect(t).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1200
     * @tc.name      testExpressionsType0012
     * @tc.desc      Types defined at compile time any class or interface - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: C1 = new C1
      const t = typeof c
      expect(t).assertEqual("object")
    });
	
	
    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1300
     * @tc.name      testExpressionsType0013
     * @tc.desc      Types defined at compile time any class or interface - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: I1 = new C1
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1400
     * @tc.name      testExpressionsType0014
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: C1|null = new C1
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1500
     * @tc.name      testExpressionsType0015
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: I1|null = new C1
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1600
     * @tc.name      testExpressionsType0016
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: bigint[]|null = [ 1n, 2n, 3n, 4n, 5n]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1700
     * @tc.name      testExpressionsType0017
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: boolean[]|null = [ true, false, true, false ]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1800
     * @tc.name      testExpressionsType0018
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: number[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_1900
     * @tc.name      testExpressionsType0019
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: byte[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2000
     * @tc.name      testExpressionsType0020
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: short[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2100
     * @tc.name      testExpressionsType0021
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: int[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2200
     * @tc.name      testExpressionsType0022
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: long[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2300
     * @tc.name      testExpressionsType0023
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: float[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2400
     * @tc.name      testExpressionsType0024
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: double[]|null = [ 1, 2, 3, 4, 5]
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2500
     * @tc.name      testExpressionsType0025
     * @tc.desc      Types defined at compile time T|null - T is a class (but not Object), interface or array - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: C1|null = null
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2600
     * @tc.name      testExpressionsType0026
     * @tc.desc      Types defined at compile time string - "string"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c: string = "Just a test"
      const t = typeof c
      expect(t).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2700
     * @tc.name      testExpressionsType0027
     * @tc.desc      Types defined at compile time undefined - "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = undefined
      const t = typeof c
      expect(t).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2800
     * @tc.name      testExpressionsType0028
     * @tc.desc      Types defined at compile time null - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c = null
      const t = typeof c
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_2900
     * @tc.name      testExpressionsType0029
     * @tc.desc      Types defined at compile time any function type - "function"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const t = typeof c
      expect(t).assertEqual("function")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3000
     * @tc.name      testExpressionsType0030
     * @tc.desc      If evaluation causes an error, then the result of a typeof expression cannot
     *               be determined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = "initial value"
      try {
        t = typeof array1[4]
      } catch (error) {
        // do nothing
      }
      expect(t).assertEqual("initial value")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3100
     * @tc.name      testExpressionsType0031
     * @tc.desc      If evaluation causes an error, then the result of a typeof expression cannot
     *               be determined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = "initial value"
      try {
        t = typeof array2[4]
      } catch (error) {
        // do nothing
      }
      expect(t).assertEqual("initial value")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3200
     * @tc.name      testExpressionsType0032
     * @tc.desc      If evaluation causes an error, then the result of a typeof expression cannot
     *               be determined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = "initial value"
      try {
        t = typeof foo1()
      } catch (error) {
        // do nothing
      }
      expect(t).assertEqual("initial value")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3300
     * @tc.name      testExpressionsType0033
     * @tc.desc      If evaluation causes an error, then the result of a typeof expression cannot
     *               be determined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = "initial value"
      try {
        t = typeof foo2(true)
      } catch (error) {
        // do nothing
      }
      expect(t).assertEqual("initial value")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3400
     * @tc.name      testExpressionsType0034
     * @tc.desc      Types evaluated at runtime
     *               numeric type - "int"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n = 53
      let t = typeof (n / 2)
      expect(t).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3500
     * @tc.name      testExpressionsType0035
     * @tc.desc      Types evaluated at runtime
     *               Object - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = f1(new Object)
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3600
     * @tc.name      testExpressionsType0036
     * @tc.desc      Types evaluated at runtime
     *               union type - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = f2(new A2)
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3700
     * @tc.name      testExpressionsType0037
     * @tc.desc      Types evaluated at runtime
     *               union type - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = f2(new B1)
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3800
     * @tc.name      testExpressionsType0038
     * @tc.desc      Types evaluated at runtime
     *               type parameter - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1<Object>(new Object())
      let t = a.m()
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_3900
     * @tc.name      testExpressionsType0039
     * @tc.desc      Types evaluated at runtime
     *               type parameter - "object"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1<null>(null)
      let t = a.m()
      expect(t).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4000
     * @tc.name      testExpressionsType0040
     * @tc.desc      Types evaluated at runtime
     *               type parameter - "undefined"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1<undefined>(undefined)
      let t = a.m()
      expect(t).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4100
     * @tc.name      testExpressionsType0041
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:number = Number.MIN_VALUE
      const g1:number = Number.MIN_VALUE
      expect(typeof c1).assertEqual("number")
      expect(typeof g1).assertEqual("number")
      const c2:number = Number.MAX_VALUE
      const g2:number = Number.MAX_VALUE
      expect(typeof c2).assertEqual("number")
      expect(typeof g2).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4200
     * @tc.name      testExpressionsType0042
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:double = Double.MIN_VALUE
      const g1:double = Double.MIN_VALUE
      expect(typeof c1).assertEqual("number")
      expect(typeof g1).assertEqual("number")
      const c2:double = Double.MAX_VALUE
      const g2:double = Double.MAX_VALUE
      expect(typeof c2).assertEqual("number")
      expect(typeof g2).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4300
     * @tc.name      testExpressionsType0043
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:string = "ABC"
      const g1:string = "ABC"
      expect(typeof c1).assertEqual("string")
      expect(typeof g1).assertEqual("string")
      const c2:string = '' + '' + 'CDE'
      const g2:string = '' + '' + 'CDE'
      expect(typeof c2).assertEqual("string")
      expect(typeof g2).assertEqual("string")
      const c3:string = `a = ${aa1}` + '' + "CDE"
      const g3:string = `a = ${aa1}` + '' + "CDE"
      expect(typeof c3).assertEqual("string")
      expect(typeof g3).assertEqual("string")
      const c4:Comparable<String> = "X"
      const g4:Comparable<String> = "X"
      expect(typeof c4).assertEqual("string")
      expect(typeof g4).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4400
     * @tc.name      testExpressionsType0044
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:boolean = true
      const g1:boolean = true
      expect(typeof c1).assertEqual("boolean")
      expect(typeof g1).assertEqual("boolean")
      const c2:boolean = false
      const g2:boolean = false
      expect(typeof c2).assertEqual("boolean")
      expect(typeof g2).assertEqual("boolean")
      const c3:Comparable<Boolean> = new Boolean()
      const g3:Comparable<Boolean> = new Boolean()
      expect(typeof c3).assertEqual("boolean")
      expect(typeof g3).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4500
     * @tc.name      testExpressionsType0045
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:bigint = 123456789012345678901234567890n
      const g1:bigint = 123456789012345678901234567890n
      expect(typeof c1).assertEqual("bigint")
      expect(typeof g1).assertEqual("bigint")
      const c2:bigint = 999999999999999999999999999999n
      const g2:bigint = 999999999999999999999999999999n
      expect(typeof c2).assertEqual("bigint")
      expect(typeof g2).assertEqual("bigint")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4600
     * @tc.name      testExpressionsType0046
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:AI1 = {}
      const g1:AI1 = {}
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:I1 = new AI1()
      const g2:I1 = new AI1()
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
      const c3:[number, string] = [1.0, "ABC"]
      const g3:[number, string] = [1.0, "ABC"]
      expect(typeof c3).assertEqual("object")
      expect(typeof g3).assertEqual("object")
      const c4:[AI1, I1] = [new AI1(), new AI1()]
      const g4:[AI1, I1] = [new AI1(), new AI1()]
      expect(typeof c4).assertEqual("object")
      expect(typeof g4).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4700
     * @tc.name      testExpressionsType0047
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Numeric = 3.14
      const g1:Numeric = 3.14
      expect(typeof c1).assertEqual("number")
      expect(typeof g1).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4800
     * @tc.name      testExpressionsType0048
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:number[] = [Number.MIN_VALUE]
      const g1:number[] = [Number.MIN_VALUE]
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:number[] = [Number.MAX_VALUE]
      const g2:number[] = [Number.MAX_VALUE]
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_4900
     * @tc.name      testExpressionsType0049
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:byte[] = [Byte.MIN_VALUE]
      const g1:byte[] = [Byte.MIN_VALUE]
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:short[] = [Short.MIN_VALUE]
      const g2:short[] = [Short.MIN_VALUE]
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
      const c3:int[] = [Int.MAX_VALUE]
      const g3:int[] = [Int.MAX_VALUE]
      expect(typeof c3).assertEqual("object")
      expect(typeof g3).assertEqual("object")
      const c4:long[] = [Long.MIN_VALUE]
      const g4:long[] = [Long.MIN_VALUE]
      expect(typeof c4).assertEqual("object")
      expect(typeof g4).assertEqual("object")
      const c5:float[] = [Float.MIN_VALUE]
      const g5:float[] = [Float.MIN_VALUE]
      expect(typeof c5).assertEqual("object")
      expect(typeof g5).assertEqual("object")
      const c6:double[] = [Double.MIN_VALUE]
      const g6:double[] = [Double.MIN_VALUE]
      expect(typeof c6).assertEqual("object")
      expect(typeof g6).assertEqual("object")
      const c7:char[] = [Char.MIN_VALUE as char]
      const g7:char[] = [Char.MIN_VALUE as char]
      expect(typeof c7).assertEqual("object")
      expect(typeof g7).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5000
     * @tc.name      testExpressionsType0050
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:A2[] = [new A2]
      const g1:A2[] = [new A2]
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:I2[] = [new A3]
      const g2:I2[] = [new A3]
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
      const c3:Comparable<Float>[] = [3.14f]
      const g3:Comparable<Float>[] = [3.14f]
      expect(typeof c3).assertEqual("object")
      expect(typeof g3).assertEqual("object")
      const c4:[number, string][] = [[1.0, "ABC"], [2.0, "DEF"]]
      const g4:[number, string][] = [[1.0, "ABC"], [2.0, "DEF"]]
      expect(typeof c4).assertEqual("object")
      expect(typeof g4).assertEqual("object")
      const c5:[A2, I2][] = [[new A2(), new A3()]]
      const g5:[A2, I2][] = [[new A2(), new A3()]]
      expect(typeof c5).assertEqual("object")
      expect(typeof g5).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5100
     * @tc.name      testExpressionsType0051
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Floating[] = [3.14f]
      const g1:Floating[] = [3.14f]
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:Integral[] = [42]
      const g2:Integral[] = [42]
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
      const c3:Numeric[] = [3.14]
      const g3:Numeric[] = [3.14]
      expect(typeof c3).assertEqual("object")
      expect(typeof g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5200
     * @tc.name      testExpressionsType0052
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:F1 = fooo1
      const g1:F1 = fooo1
      expect(typeof c1).assertEqual("function")
      expect(typeof g1).assertEqual("function")
      const c2:((p: int) => int) = fooo1
      const g2:((p: int) => int) = fooo1
      expect(typeof c2).assertEqual("function")
      expect(typeof g2).assertEqual("function")
      const c3:F1 = ff1
      const g3:F1 = ff1
      expect(typeof c3).assertEqual("function")
      expect(typeof g3).assertEqual("function")
      const c4:((p: int) => int) = ff1
      const g4:((p: int) => int) = ff1
      expect(typeof c4).assertEqual("function")
      expect(typeof g4).assertEqual("function")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5300
     * @tc.name      testExpressionsType0053
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:undefined = undefined
      const g1:undefined = undefined
      expect(typeof c1).assertEqual("undefined")
      expect(typeof g1).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5400
     * @tc.name      testExpressionsType0054
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:null = null
      const g1:null = null
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5500
     * @tc.name      testExpressionsType0055
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:A2|null = new A2()
      const g1:A2|null = new A2()
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:A2|null = null
      const g2:A2|null = null
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
      const c3:I2|null = new A3()
      const g3:I2|null = new A3()
      expect(typeof c3).assertEqual("object")
      expect(typeof g3).assertEqual("object")
      const c4:I2|null = null
      const g4:I2|null = null
      expect(typeof c4).assertEqual("object")
      expect(typeof g4).assertEqual("object")
      const c5:A2[]|null = [new A2()]
      const g5:A2[]|null = [new A2()]
      expect(typeof c5).assertEqual("object")
      expect(typeof g5).assertEqual("object")
      const c6:A2[]|null = null
      const g6:A2[]|null = null
      expect(typeof c6).assertEqual("object")
      expect(typeof g6).assertEqual("object")
      const c7:I2[]|null = [new A3()]
      const g7:I2[]|null = [new A3()]
      expect(typeof c7).assertEqual("object")
      expect(typeof g7).assertEqual("object")
      const c8:I2[]|null = null
      const g8:I2[]|null = null
      expect(typeof c8).assertEqual("object")
      expect(typeof g8).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5600
     * @tc.name      testExpressionsType0056
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Color1 = Color1.Red
      const g1:Color1 = Color1.Red
      expect(typeof c1).assertEqual("int")
      expect(typeof g1).assertEqual("int")
      const c2:Size1 = Size1.XL
      const g2:Size1 = Size1.XL
      expect(typeof c2).assertEqual("int")
      expect(typeof g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5700
     * @tc.name      testExpressionsType0057
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Color2 = Color2.Blue
      const g1:Color2 = Color2.Blue
      expect(typeof c1).assertEqual("string")
      expect(typeof g1).assertEqual("string")
      const c2:Size2 = Size2.L
      const g2:Size2 = Size2.L
      expect(typeof c2).assertEqual("string")
      expect(typeof g2).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5800
     * @tc.name      testExpressionsType0058
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:number|string|boolean = false
      const g1:number|string|boolean = false
      expect(typeof c1).assertEqual("boolean")
      expect(typeof g1).assertEqual("boolean")
      const c2:number|boolean = true
      const g2:number|boolean = true
      expect(typeof c2).assertEqual("boolean")
      expect(typeof g2).assertEqual("boolean")
      const c3:boolean|never|long = true
      const g3:boolean|never|long = true
      expect(typeof c3).assertEqual("boolean")
      expect(typeof g3).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_5900
     * @tc.name      testExpressionsType0059
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:number|string|boolean = "false"
      const g1:number|string|boolean = "false"
      expect(typeof c1).assertEqual("string")
      expect(typeof g1).assertEqual("string")
      const c2:number|string = "3.14"
      const g2:number|string = "3.14"
      expect(typeof c2).assertEqual("string")
      expect(typeof g2).assertEqual("string")
      const c3:boolean|never|long|string = "1234567890"
      const g3:boolean|never|long|string = "1234567890"
      expect(typeof c3).assertEqual("string")
      expect(typeof g3).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6000
     * @tc.name      testExpressionsType0060
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:A2|B2|C2 = new A2()
      const g1:A2|B2|C2 = new A2()
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:B2|never|undefined|A2 = new A2()
      const g2:B2|never|undefined|A2 = new A2()
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6100
     * @tc.name      testExpressionsType0061
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:CC1<A2> = new CC1<A2>(new A2())
      const g1:CC1<A2> = new CC1<A2>(new A2())
      expect(typeof c1).assertEqual("object")
      expect(typeof g1).assertEqual("object")
      const c2:CC1<B1> = new CC1<B1>(new B1())
      const g2:CC1<B1> = new CC1<B1>(new B1())
      expect(typeof c2).assertEqual("object")
      expect(typeof g2).assertEqual("object")
      const c3:CC1<I2> = new CC1<I2>(new B3())
      const g3:CC1<I2> = new CC1<I2>(new B3())
      expect(typeof c3).assertEqual("object")
      expect(typeof g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6200
     * @tc.name      testExpressionsType0062
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Comparable<Double> = new Double()
      const g1:Comparable<Double> = new Double()
      expect(typeof c1).assertEqual("number")
      expect(typeof g1).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6300
     * @tc.name      testExpressionsType0063
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:byte = Byte.MIN_VALUE
      const g1:byte = Byte.MIN_VALUE
      expect(typeof c1).assertEqual("byte")
      expect(typeof g1).assertEqual("byte")
      const c2:byte = Byte.MAX_VALUE
      const g2:byte = Byte.MAX_VALUE
      expect(typeof c2).assertEqual("byte")
      expect(typeof g2).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6400
     * @tc.name      testExpressionsType0064
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:short = Short.MIN_VALUE
      const g1:short = Short.MIN_VALUE
      expect(typeof c1).assertEqual("short")
      expect(typeof g1).assertEqual("short")
      const c2:short = Short.MAX_VALUE
      const g2:short = Short.MAX_VALUE
      expect(typeof c2).assertEqual("short")
      expect(typeof g2).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6500
     * @tc.name      testExpressionsType0065
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:int = Int.MIN_VALUE
      const g1:int = Int.MIN_VALUE
      expect(typeof c1).assertEqual("int")
      expect(typeof g1).assertEqual("int")
      const c2:int = Int.MAX_VALUE
      const g2:int = Int.MAX_VALUE
      expect(typeof c2).assertEqual("int")
      expect(typeof g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6600
     * @tc.name      testExpressionsType0066
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:long = Long.MIN_VALUE
      const g1:long = Long.MIN_VALUE
      expect(typeof c1).assertEqual("long")
      expect(typeof g1).assertEqual("long")
      const c2:long = Long.MAX_VALUE
      const g2:long = Long.MAX_VALUE
      expect(typeof c2).assertEqual("long")
      expect(typeof g2).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6700
     * @tc.name      testExpressionsType0067
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:float = Float.MIN_VALUE
      const g1:float = Float.MIN_VALUE
      expect(typeof c1).assertEqual("float")
      expect(typeof g1).assertEqual("float")
      const c2:float = Float.MAX_VALUE
      const g2:float = Float.MAX_VALUE
      expect(typeof c2).assertEqual("float")
      expect(typeof g2).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6800
     * @tc.name      testExpressionsType0068
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:char = Char.MIN_VALUE as char
      const g1:char = Char.MIN_VALUE as char
      expect(typeof c1).assertEqual("char")
      expect(typeof g1).assertEqual("char")
      const c2:char = Char.MAX_VALUE as char
      const g2:char = Char.MAX_VALUE as char
      expect(typeof c2).assertEqual("char")
      expect(typeof g2).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_6900
     * @tc.name      testExpressionsType0069
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Comparable<Float> = new Float()
      const g1:Comparable<Float> = new Float()
      expect(typeof c1).assertEqual("float")
      expect(typeof g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7000
     * @tc.name      testExpressionsType0070
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1:Comparable<Byte> = new Byte()
      const g1:Comparable<Byte> = new Byte()
      expect(typeof c1).assertEqual("byte")
      expect(typeof g1).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7100
     * @tc.name      testExpressionsType0071
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: Comparable<Short> = new Short()
      expect(typeof c1).assertEqual("short")
      expect(typeof g1).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7200
     * @tc.name      testExpressionsType0072
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: Comparable<Int> = new Int()
      expect(typeof c1).assertEqual("int")
      expect(typeof g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7300
     * @tc.name      testExpressionsType0073
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: Comparable<Long> = new Long()
      expect(typeof c1).assertEqual("long")
      expect(typeof g3).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7400
     * @tc.name      testExpressionsType0074
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: Comparable<Char> = new Char()
      expect(typeof c1).assertEqual("char")
      expect(typeof g4).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7500
     * @tc.name      testExpressionsType0075
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: Floating = 3.14f
      expect(typeof c1).assertEqual("float")
      expect(typeof g5).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7600
     * @tc.name      testExpressionsType0076
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const c1: Integral = 42
      expect(typeof c1).assertEqual("int")
      expect(typeof g6).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7700
     * @tc.name      testExpressionsType0077
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_0_foo1(Number.MIN_VALUE)).assertEqual("number")
      expect(tof_func_0_foo2(Number.MAX_VALUE)).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7800
     * @tc.name      testExpressionsType0078
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_1_foo1(Double.MIN_VALUE)).assertEqual("number")
      expect(tof_func_1_foo2(Double.MAX_VALUE)).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_7900
     * @tc.name      testExpressionsType0079
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_2_foo1("ABC")).assertEqual("string")
      expect(tof_func_2_foo2('' + '' + 'CDE')).assertEqual("string")
      expect(tof_func_2_foo3(`a = ${aa1}` + '' + "CDE")).assertEqual("string")
      expect(tof_func_2_foo4("X")).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8000
     * @tc.name      testExpressionsType0080
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_3_foo1(true)).assertEqual("boolean")
      expect(tof_func_3_foo2(false)).assertEqual("boolean")
      expect(tof_func_3_foo3(new Boolean())).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8100
     * @tc.name      testExpressionsType0081
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_4_foo1(123456789012345678901234567890n)).assertEqual("bigint")
      expect(tof_func_4_foo2(999999999999999999999999999999n)).assertEqual("bigint")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8200
     * @tc.name      testExpressionsType0082
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_5_foo1({})).assertEqual("object")
      expect(tof_func_5_foo2(new AA1())).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8300
     * @tc.name      testExpressionsType0083
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_6_foo1(3.14)).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8400
     * @tc.name      testExpressionsType0084
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_7_foo1([Number.MIN_VALUE])).assertEqual("object")
      expect(tof_func_7_foo2([Number.MAX_VALUE])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8500
     * @tc.name      testExpressionsType0085
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_8_foo1([Byte.MIN_VALUE])).assertEqual("object")
      expect(tof_func_8_foo2([Short.MIN_VALUE])).assertEqual("object")
      expect(tof_func_8_foo3([Int.MAX_VALUE])).assertEqual("object")
      expect(tof_func_8_foo4([Long.MIN_VALUE])).assertEqual("object")
      expect(tof_func_8_foo5([Float.MIN_VALUE])).assertEqual("object")
      expect(tof_func_8_foo6([Double.MIN_VALUE])).assertEqual("object")
      expect(tof_func_8_foo7([Char.MIN_VALUE as char])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8600
     * @tc.name      testExpressionsType0086
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_9_foo1([new AA1()])).assertEqual("object")
      expect(tof_func_9_foo2([new AA1()])).assertEqual("object")
      expect(tof_func_9_foo3([3.14f])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8700
     * @tc.name      testExpressionsType0087
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_10_foo1([3.14f])).assertEqual("object")
      expect(tof_func_10_foo2([42])).assertEqual("object")
      expect(tof_func_10_foo3([3.14])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8800
     * @tc.name      testExpressionsType0088
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_11_foo1(tof_func_11_original_foo)).assertEqual("function")
      expect(tof_func_11_foo2(tof_func_11_original_foo)).assertEqual("function")
      expect(tof_func_11_foo3(ff1)).assertEqual("function")
      expect(tof_func_11_foo4(ff1)).assertEqual("function")
      expect(tof_func_11_foo5(() => { console.log(1) })).assertEqual("function")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_8900
     * @tc.name      testExpressionsType0089
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_12_foo1(undefined)).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9000
     * @tc.name      testExpressionsType0090
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_13_foo1(null)).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9100
     * @tc.name      testExpressionsType0091
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_14_foo1(new A2())).assertEqual("object")
      expect(tof_func_14_foo2(null)).assertEqual("object")
      expect(tof_func_14_foo3(new A5())).assertEqual("object")
      expect(tof_func_14_foo4(null)).assertEqual("object")
      expect(tof_func_14_foo5([new A2()])).assertEqual("object")
      expect(tof_func_14_foo6(null)).assertEqual("object")
      expect(tof_func_14_foo7([new A5()])).assertEqual("object")
      expect(tof_func_14_foo8(null)).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9200
     * @tc.name      testExpressionsType0092
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_15_foo1(Color1.Red)).assertEqual("int")
      expect(tof_func_15_foo2(Size1.XL)).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9300
     * @tc.name      testExpressionsType0093
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_16_foo1(Color2.Blue)).assertEqual("string")
      expect(tof_func_16_foo2(Size2.L)).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9400
     * @tc.name      testExpressionsType0094
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_17_foo1(false)).assertEqual("boolean")
      expect(tof_func_17_foo2(true)).assertEqual("boolean")
      expect(tof_func_17_foo3(true)).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9500
     * @tc.name      testExpressionsType0095
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_18_foo1("false")).assertEqual("string")
      expect(tof_func_18_foo2("3.14")).assertEqual("string")
      expect(tof_func_18_foo3("1234567890")).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9600
     * @tc.name      testExpressionsType0096
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_19_foo1(new A3())).assertEqual("object")
      expect(tof_func_19_foo2(new A3())).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9700
     * @tc.name      testExpressionsType0097
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_20_foo1(new CC1<A2>(new A2()))).assertEqual("object")
      expect(tof_func_20_foo2(new CC1<B1>(new B1()))).assertEqual("object")
      expect(tof_func_20_foo3(new CC1<I3>(new BB3()))).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9800
     * @tc.name      testExpressionsType0098
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_21_foo1(new Double())).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TEST_9900
     * @tc.name      testExpressionsType0099
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_22_foo1(Byte.MIN_VALUE)).assertEqual("byte")
      expect(tof_func_22_foo2(Byte.MAX_VALUE)).assertEqual("byte")
    });
  });
}