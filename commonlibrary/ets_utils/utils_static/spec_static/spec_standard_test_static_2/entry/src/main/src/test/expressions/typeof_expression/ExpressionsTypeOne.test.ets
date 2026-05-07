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

export default function ExpressionsTypePart(): void {
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
     * @tc.number    SUB_EXPRESSIONS_TYPE_10000
     * @tc.name      testExpressionsType0100
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_23_foo1(Short.MIN_VALUE)).assertEqual("short")
      expect(tof_func_23_foo2(Short.MAX_VALUE)).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10100
     * @tc.name      testExpressionsType0101
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_24_foo1(Int.MIN_VALUE)).assertEqual("int")
      expect(tof_func_24_foo2(Int.MAX_VALUE)).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10200
     * @tc.name      testExpressionsType0102
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_25_foo1(Long.MIN_VALUE)).assertEqual("long")
      expect(tof_func_25_foo2(Long.MAX_VALUE)).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10300
     * @tc.name      testExpressionsType0103
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_26_foo1(Float.MIN_VALUE)).assertEqual("float")
      expect(tof_func_26_foo2(Float.MAX_VALUE)).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10400
     * @tc.name      testExpressionsType0104
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_27_foo1(Char.MIN_VALUE as char)).assertEqual("char")
      expect(tof_func_27_foo2(Char.MAX_VALUE as char)).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10500
     * @tc.name      testExpressionsType0105
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_28_foo1(new Float())).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10600
     * @tc.name      testExpressionsType0106
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_29_foo1(new Byte())).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10700
     * @tc.name      testExpressionsType0107
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_30_foo1(new Short())).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10800
     * @tc.name      testExpressionsType0108
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_31_foo1(new Int())).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_10900
     * @tc.name      testExpressionsType0109
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_32_foo1(new Long())).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11000
     * @tc.name      testExpressionsType0110
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_33_foo1(new Char())).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11100
     * @tc.name      testExpressionsType0111
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_34_foo1(3.14f)).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11200
     * @tc.name      testExpressionsType0112
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(tof_func_35_foo1(42)).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11300
     * @tc.name      testExpressionsType0113
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_0_Z1(Number.MIN_VALUE).meth(Number.MIN_VALUE)).assertEqual("number")
      expect(new tof_meth_0_Z2(Number.MAX_VALUE).meth(Number.MAX_VALUE)).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11400
     * @tc.name      testExpressionsType0114
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_1_Z1(Double.MIN_VALUE).meth(Double.MIN_VALUE)).assertEqual("number")
      expect(new tof_meth_1_Z2(Double.MAX_VALUE).meth(Double.MAX_VALUE)).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11500
     * @tc.name      testExpressionsType0115
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_2_Z1("ABC").meth("ABC")).assertEqual("string")
      expect(new tof_meth_2_Z2('' + '' + 'CDE').meth('' + '' + 'CDE')).assertEqual("string")
      expect(new tof_meth_2_Z3(`a = ${tof_meth_2_a}` + '' + "CDE").meth(`a = ${tof_meth_2_a}` + '' + "CDE")).assertEqual("string")
      expect(new tof_meth_2_Z4(new String("ABC")).meth(new String("ABC"))).assertEqual("string")
      expect(new tof_meth_2_Z5(new String('' + '' + 'CDE')).meth(new String('' + '' + 'CDE'))).assertEqual("string")
      expect(new tof_meth_2_Z6(new String(`a = ${tof_meth_2_a}` + '' + "CDE")).meth(new String(`a = ${tof_meth_2_a}` + '' + "CDE"))).assertEqual("string")
      expect(new tof_meth_2_Z7("X").meth("X")).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11600
     * @tc.name      testExpressionsType0116
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_3_Z1(true).meth(true)).assertEqual("boolean")
      expect(new tof_meth_3_Z2(false).meth(false)).assertEqual("boolean")
      expect(new tof_meth_3_Z3(new Boolean()).meth(new Boolean())).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11700
     * @tc.name      testExpressionsType0117
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_4_Z1(123456789012345678901234567890n).meth(123456789012345678901234567890n)).assertEqual("bigint")
      expect(new tof_meth_4_Z2(999999999999999999999999999999n).meth(999999999999999999999999999999n)).assertEqual("bigint")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11800
     * @tc.name      testExpressionsType0118
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_5_Z1({}).meth({})).assertEqual("object")
      expect(new tof_meth_5_Z2(new tof_meth_5_A()).meth(new tof_meth_5_A())).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_11900
     * @tc.name      testExpressionsType0119
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_6_Z1(3.14).meth(3.14)).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12000
     * @tc.name      testExpressionsType0120
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_7_Z1([Number.MIN_VALUE]).meth([Number.MIN_VALUE])).assertEqual("object")
      expect(new tof_meth_7_Z2([Number.MAX_VALUE]).meth([Number.MAX_VALUE])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12100
     * @tc.name      testExpressionsType0121
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_8_Z1([Byte.MIN_VALUE]).meth([Byte.MIN_VALUE])).assertEqual("object")
      expect(new tof_meth_8_Z2([Short.MIN_VALUE]).meth([Short.MIN_VALUE])).assertEqual("object")
      expect(new tof_meth_8_Z3([Int.MAX_VALUE]).meth([Int.MAX_VALUE])).assertEqual("object")
      expect(new tof_meth_8_Z4([Long.MIN_VALUE]).meth([Long.MIN_VALUE])).assertEqual("object")
      expect(new tof_meth_8_Z5([Float.MIN_VALUE]).meth([Float.MIN_VALUE])).assertEqual("object")
      expect(new tof_meth_8_Z6([Double.MIN_VALUE]).meth([Double.MIN_VALUE])).assertEqual("object")
      expect(new tof_meth_8_Z7([c'a', c'b', c'c']).meth([c'a', c'b', c'c'])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12200
     * @tc.name      testExpressionsType0122
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_9_Z1([new tof_meth_9_A]).meth([new tof_meth_9_A])).assertEqual("object")
      expect(new tof_meth_9_Z2([new tof_meth_9_A]).meth([new tof_meth_9_A])).assertEqual("object")
      expect(new tof_meth_9_Z3([3.14f]).meth([3.14f])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12300
     * @tc.name      testExpressionsType0123
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_10_Z1([3.14f]).meth([3.14f])).assertEqual("object")
      expect(new tof_meth_10_Z2([42]).meth([42])).assertEqual("object")
      expect(new tof_meth_10_Z3([3.14]).meth([3.14])).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12400
     * @tc.name      testExpressionsType0124
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_11_Z1(tof_meth_11_foo).meth(tof_meth_11_foo)).assertEqual("function")
      expect(new tof_meth_11_Z2(tof_meth_11_foo).meth(tof_meth_11_foo)).assertEqual("function")
      expect(new tof_meth_11_Z3(tof_meth_11_f).meth(tof_meth_11_f)).assertEqual("function")
      expect(new tof_meth_11_Z4(tof_meth_11_f).meth(tof_meth_11_f)).assertEqual("function")
      expect(new tof_meth_11_Z5(() => { console.log(1) }).meth(() => { console.log(1) })).assertEqual("function")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12500
     * @tc.name      testExpressionsType0125
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_12_Z1(undefined).meth(undefined)).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12600
     * @tc.name      testExpressionsType0126
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_13_Z1(null).meth(null)).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12700
     * @tc.name      testExpressionsType0127
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_14_Z1(new tof_meth_14_A()).meth(new tof_meth_14_A())).assertEqual("object")
      expect(new tof_meth_14_Z2(null).meth(null)).assertEqual("object")
      expect(new tof_meth_14_Z3(new tof_meth_14_A()).meth(new tof_meth_14_A())).assertEqual("object")
      expect(new tof_meth_14_Z4(null).meth(null)).assertEqual("object")
      expect(new tof_meth_14_Z5([new tof_meth_14_A()]).meth([new tof_meth_14_A()])).assertEqual("object")
      expect(new tof_meth_14_Z6(null).meth(null)).assertEqual("object")
      expect(new tof_meth_14_Z7([new tof_meth_14_A()]).meth([new tof_meth_14_A()])).assertEqual("object")
      expect(new tof_meth_14_Z8(null).meth(null)).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12800
     * @tc.name      testExpressionsType0128
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_15_Z1(tof_meth_15_Color.Red).meth(tof_meth_15_Color.Red)).assertEqual("int")
      expect(new tof_meth_15_Z2(tof_meth_15_Size.XL).meth(tof_meth_15_Size.XL)).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_12900
     * @tc.name      testExpressionsType0129
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_16_Z1(tof_meth_16_Color.Blue).meth(tof_meth_16_Color.Blue)).assertEqual("string")
      expect(new tof_meth_16_Z2(tof_meth_16_Size.L).meth(tof_meth_16_Size.L)).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13000
     * @tc.name      testExpressionsType0130
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_17_Z1(false).meth(false)).assertEqual("boolean")
      expect(new tof_meth_17_Z2(true).meth(true)).assertEqual("boolean")
      expect(new tof_meth_17_Z3(true).meth(true)).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13100
     * @tc.name      testExpressionsType0131
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_18_Z1("false").meth("false")).assertEqual("string")
      expect(new tof_meth_18_Z2("3.14").meth("3.14")).assertEqual("string")
      expect(new tof_meth_18_Z3("1234567890").meth("1234567890")).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13200
     * @tc.name      testExpressionsType0132
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_19_Z1(new tof_meth_19_A()).meth(new tof_meth_19_A())).assertEqual("object")
      expect(new tof_meth_19_Z2(new tof_meth_19_A()).meth(new tof_meth_19_A())).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13300
     * @tc.name      testExpressionsType0133
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_20_Z1(new tof_meth_20_C<tof_meth_20_A>(new tof_meth_20_A())).meth(new tof_meth_20_C<tof_meth_20_A>(new tof_meth_20_A()))).assertEqual("object")
      expect(new tof_meth_20_Z2(new tof_meth_20_C<tof_meth_20_B>(new tof_meth_20_B())).meth(new tof_meth_20_C<tof_meth_20_B>(new tof_meth_20_B()))).assertEqual("object")
      expect(new tof_meth_20_Z3(new tof_meth_20_C<tof_meth_20_I>(new tof_meth_20_B())).meth(new tof_meth_20_C<tof_meth_20_I>(new tof_meth_20_B()))).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13400
     * @tc.name      testExpressionsType0134
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_21_Z1(new Double()).meth(new Double())).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13500
     * @tc.name      testExpressionsType0135
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_22_Z1(Byte.MIN_VALUE).meth(Byte.MIN_VALUE)).assertEqual("byte")
      expect(new tof_meth_22_Z2(Byte.MAX_VALUE).meth(Byte.MAX_VALUE)).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13600
     * @tc.name      testExpressionsType0136
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_23_Z1(Short.MIN_VALUE).meth(Short.MIN_VALUE)).assertEqual("short")
      expect(new tof_meth_23_Z2(Short.MAX_VALUE).meth(Short.MAX_VALUE)).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13700
     * @tc.name      testExpressionsType0137
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_24_Z1(Int.MIN_VALUE).meth(Int.MIN_VALUE)).assertEqual("int")
      expect(new tof_meth_24_Z2(Int.MAX_VALUE).meth(Int.MAX_VALUE)).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13800
     * @tc.name      testExpressionsType0138
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_25_Z1(Long.MIN_VALUE).meth(Long.MIN_VALUE)).assertEqual("long")
      expect(new tof_meth_25_Z2(Long.MAX_VALUE).meth(Long.MAX_VALUE)).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_13900
     * @tc.name      testExpressionsType0139
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_26_Z1(Float.MIN_VALUE).meth(Float.MIN_VALUE)).assertEqual("float")
      expect(new tof_meth_26_Z2(Float.MAX_VALUE).meth(Float.MAX_VALUE)).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14000
     * @tc.name      testExpressionsType0140
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_27_Z1(Char.MIN_VALUE as char).meth(Char.MIN_VALUE as char)).assertEqual("char")
      expect(new tof_meth_27_Z2(Char.MAX_VALUE as char).meth(Char.MAX_VALUE as char)).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14100
     * @tc.name      testExpressionsType0141
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_28_Z1(new Float()).meth(new Float())).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14200
     * @tc.name      testExpressionsType0142
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_29_Z1(new Byte()).meth(new Byte())).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14300
     * @tc.name      testExpressionsType0143
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_30_Z1(new Short()).meth(new Short())).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14400
     * @tc.name      testExpressionsType0144
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_31_Z1(new Int()).meth(new Int())).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14500
     * @tc.name      testExpressionsType0145
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_32_Z1(new Long()).meth(new Long())).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14600
     * @tc.name      testExpressionsType0146
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_33_Z1(new Char()).meth(new Char())).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14700
     * @tc.name      testExpressionsType0147
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_34_Z1(3.14f).meth(3.14f)).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14800
     * @tc.name      testExpressionsType0148
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new tof_meth_35_Z1(42).meth(42)).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_14900
     * @tc.name      testExpressionsType0149
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_0_Z1 = { fld: Number.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("number")
      let z2: tof_obj_0_Z2 = { fld: Number.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15000
     * @tc.name      testExpressionsType0150
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_1_Z1 = { fld: Double.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("number")
      let z2: tof_obj_1_Z2 = { fld: Double.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15100
     * @tc.name      testExpressionsType0151
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_2_Z1 = { fld: "ABC" }
      expect(typeof z1.fld).assertEqual("string")
      let z2: tof_obj_2_Z2 = { fld: '' + '' + 'CDE' }
      expect(typeof z2.fld).assertEqual("string")
      let z3: tof_obj_2_Z3 = { fld: `a = ${tof_obj_2_a}` + '' + "CDE" }
      expect(typeof z3.fld).assertEqual("string")
      let z4: tof_obj_2_Z4 = { fld: "X" }
      expect(typeof z4.fld).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15200
     * @tc.name      testExpressionsType0152
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_3_Z1 = { fld: true }
      expect(typeof z1.fld).assertEqual("boolean")
      let z2: tof_obj_3_Z2 = { fld: false }
      expect(typeof z2.fld).assertEqual("boolean")
      let z3: tof_obj_3_Z3 = { fld: new Boolean() }
      expect(typeof z3.fld).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15300
     * @tc.name      testExpressionsType0153
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_4_Z1 = { fld: 123456789012345678901234567890n }
      expect(typeof z1.fld).assertEqual("bigint")
      let z2: tof_obj_4_Z2 = { fld: 999999999999999999999999999999n }
      expect(typeof z2.fld).assertEqual("bigint")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15400
     * @tc.name      testExpressionsType0154
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_5_Z1 = { fld: {} }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_5_Z2 = { fld: new tof_obj_5_A() }
      expect(typeof z2.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15500
     * @tc.name      testExpressionsType0155
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_6_Z1 = { fld: 3.14 }
      expect(typeof z1.fld).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15600
     * @tc.name      testExpressionsType0156
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_7_Z1 = { fld: [Number.MIN_VALUE] }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_7_Z2 = { fld: [Number.MAX_VALUE] }
      expect(typeof z2.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15700
     * @tc.name      testExpressionsType0157
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_8_Z1 = { fld: [Byte.MIN_VALUE] }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_8_Z2 = { fld: [Short.MIN_VALUE] }
      expect(typeof z2.fld).assertEqual("object")
      let z3: tof_obj_8_Z3 = { fld: [Int.MAX_VALUE] }
      expect(typeof z3.fld).assertEqual("object")
      let z4: tof_obj_8_Z4 = { fld: [Long.MIN_VALUE] }
      expect(typeof z4.fld).assertEqual("object")
      let z5: tof_obj_8_Z5 = { fld: [Float.MIN_VALUE] }
      expect(typeof z5.fld).assertEqual("object")
      let z6: tof_obj_8_Z6 = { fld: [Double.MIN_VALUE] }
      expect(typeof z6.fld).assertEqual("object")
      let z7: tof_obj_8_Z7 = { fld: [Char.MIN_VALUE as char] }
      expect(typeof z7.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15800
     * @tc.name      testExpressionsType0158
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_9_Z1 = { fld: [new tof_obj_9_A] }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_9_Z2 = { fld: [new tof_obj_9_A] }
      expect(typeof z2.fld).assertEqual("object")
      let z3: tof_obj_9_Z3 = { fld: [3.14f] }
      expect(typeof z3.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_15900
     * @tc.name      testExpressionsType0159
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_10_Z1 = { fld: [3.14f] }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_10_Z2 = { fld: [42] }
      expect(typeof z2.fld).assertEqual("object")
      let z3: tof_obj_10_Z3 = { fld: [3.14] }
      expect(typeof z3.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16000
     * @tc.name      testExpressionsType0160
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_11_Z1 = { fld: tof_obj_11_foo }
      expect(typeof z1.fld).assertEqual("function")
      let z2: tof_obj_11_Z2 = { fld: tof_obj_11_foo }
      expect(typeof z2.fld).assertEqual("function")
      let z3: tof_obj_11_Z3 = { fld: tof_obj_11_f }
      expect(typeof z3.fld).assertEqual("function")
      let z4: tof_obj_11_Z4 = { fld: tof_obj_11_f }
      expect(typeof z4.fld).assertEqual("function")
      let z5: tof_obj_11_Z5 = { fld: () => { console.log(1) } }
      expect(typeof z5.fld).assertEqual("function")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16100
     * @tc.name      testExpressionsType0161
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_12_Z1 = { fld: undefined }
      expect(typeof z1.fld).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16200
     * @tc.name      testExpressionsType0162
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_13_Z1 = { fld: null }
      expect(typeof z1.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16300
     * @tc.name      testExpressionsType0163
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_14_Z1 = { fld: new tof_obj_14_A() }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_14_Z2 = { fld: null }
      expect(typeof z2.fld).assertEqual("object")
      let z3: tof_obj_14_Z3 = { fld: new tof_obj_14_A() }
      expect(typeof z3.fld).assertEqual("object")
      let z4: tof_obj_14_Z4 = { fld: null }
      expect(typeof z4.fld).assertEqual("object")
      let z5: tof_obj_14_Z5 = { fld: [new tof_obj_14_A()] }
      expect(typeof z5.fld).assertEqual("object")
      let z6: tof_obj_14_Z6 = { fld: null }
      expect(typeof z6.fld).assertEqual("object")
      let z7: tof_obj_14_Z7 = { fld: [new tof_obj_14_A()] }
      expect(typeof z7.fld).assertEqual("object")
      let z8: tof_obj_14_Z8 = { fld: null }
      expect(typeof z8.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16400
     * @tc.name      testExpressionsType0164
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_15_Z1 = { fld: tof_obj_15_Color.Red }
      expect(typeof z1.fld).assertEqual("int")
      let z2: tof_obj_15_Z2 = { fld: tof_obj_15_Size.XL }
      expect(typeof z2.fld).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16500
     * @tc.name      testExpressionsType0165
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_16_Z1 = { fld: tof_obj_16_Color.Blue }
      expect(typeof z1.fld).assertEqual("string")
      let z2: tof_obj_16_Z2 = { fld: tof_obj_16_Size.L }
      expect(typeof z2.fld).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16600
     * @tc.name      testExpressionsType0166
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_17_Z1 = { fld: false }
      expect(typeof z1.fld).assertEqual("boolean")
      let z2: tof_obj_17_Z2 = { fld: true }
      expect(typeof z2.fld).assertEqual("boolean")
      let z3: tof_obj_17_Z3 = { fld: true }
      expect(typeof z3.fld).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16700
     * @tc.name      testExpressionsType0167
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_18_Z1 = { fld: "false" }
      expect(typeof z1.fld).assertEqual("string")
      let z2: tof_obj_18_Z2 = { fld: "3.14" }
      expect(typeof z2.fld).assertEqual("string")
      let z3: tof_obj_18_Z3 = { fld: "1234567890" }
      expect(typeof z3.fld).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16800
     * @tc.name      testExpressionsType0168
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_19_Z1 = { fld: new tof_obj_19_A() }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_19_Z2 = { fld: new tof_obj_19_A() }
      expect(typeof z2.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_16900
     * @tc.name      testExpressionsType0169
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_20_Z1 = { fld: new tof_obj_20_C<tof_obj_20_A>(new tof_obj_20_A()) }
      expect(typeof z1.fld).assertEqual("object")
      let z2: tof_obj_20_Z2 = { fld: new tof_obj_20_C<tof_obj_20_B>(new tof_obj_20_B()) }
      expect(typeof z2.fld).assertEqual("object")
      let z3: tof_obj_20_Z3 = { fld: new tof_obj_20_C<tof_obj_20_I>(new tof_obj_20_B()) }
      expect(typeof z3.fld).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17000
     * @tc.name      testExpressionsType0170
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_21_Z1 = { fld: new Double() }
      expect(typeof z1.fld).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17100
     * @tc.name      testExpressionsType0171
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_22_Z1 = { fld: Byte.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("byte")
      let z2: tof_obj_22_Z2 = { fld: Byte.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17200
     * @tc.name      testExpressionsType0172
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_23_Z1 = { fld: Short.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("short")
      let z2: tof_obj_23_Z2 = { fld: Short.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17300
     * @tc.name      testExpressionsType0173
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_24_Z1 = { fld: Int.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("int")
      let z2: tof_obj_24_Z2 = { fld: Int.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17400
     * @tc.name      testExpressionsType0174
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_25_Z1 = { fld: Long.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("long")
      let z2: tof_obj_25_Z2 = { fld: Long.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17500
     * @tc.name      testExpressionsType0175
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_26_Z1 = { fld: Float.MIN_VALUE }
      expect(typeof z1.fld).assertEqual("float")
      let z2: tof_obj_26_Z2 = { fld: Float.MAX_VALUE }
      expect(typeof z2.fld).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17600
     * @tc.name      testExpressionsType0176
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_27_Z1 = { fld: Char.MIN_VALUE as char }
      expect(typeof z1.fld).assertEqual("char")
      let z2: tof_obj_27_Z2 = { fld: Char.MAX_VALUE as char }
      expect(typeof z2.fld).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17700
     * @tc.name      testExpressionsType0177
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_28_Z1 = { fld: new Float() }
      expect(typeof z1.fld).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17800
     * @tc.name      testExpressionsType0178
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_29_Z1 = { fld: new Byte() }
      expect(typeof z1.fld).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_17900
     * @tc.name      testExpressionsType0179
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_30_Z1 = { fld: new Short() }
      expect(typeof z1.fld).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18000
     * @tc.name      testExpressionsType0180
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_31_Z1 = { fld: new Int() }
      expect(typeof z1.fld).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18100
     * @tc.name      testExpressionsType0181
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_32_Z1 = { fld: new Long() }
      expect(typeof z1.fld).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18200
     * @tc.name      testExpressionsType0182
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_33_Z1 = { fld: new Char() }
      expect(typeof z1.fld).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18300
     * @tc.name      testExpressionsType0183
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_34_Z1 = { fld: 3.14f }
      expect(typeof z1.fld).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18400
     * @tc.name      testExpressionsType0184
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1: tof_obj_35_Z1 = { fld: 42 }
      expect(typeof z1.fld).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18500
     * @tc.name      testExpressionsType0185
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:number = Number.MIN_VALUE
      expect(typeof v1).assertEqual("number")
      expect(typeof tof_vars_0_g1).assertEqual("number")
      let v2:number = Number.MAX_VALUE
      expect(typeof v2).assertEqual("number")
      expect(typeof tof_vars_0_g2).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18600
     * @tc.name      testExpressionsType0186
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:double = Double.MIN_VALUE
      expect(typeof v1).assertEqual("number")
      expect(typeof tof_vars_1_g1).assertEqual("number")
      let v2:double = Double.MAX_VALUE
      expect(typeof v2).assertEqual("number")
      expect(typeof tof_vars_1_g2).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18700
     * @tc.name      testExpressionsType0187
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:string = "ABC"
      expect(typeof v1).assertEqual("string")
      expect(typeof tof_vars_2_g1).assertEqual("string")
      let v2:string = '' + '' + 'CDE'
      expect(typeof v2).assertEqual("string")
      expect(typeof tof_vars_2_g2).assertEqual("string")
      let v3:string = `a = ${tof_vars_2_a}` + '' + "CDE"
      expect(typeof v3).assertEqual("string")
      expect(typeof tof_vars_2_g3).assertEqual("string")
      let v4:Comparable<String> = "X"
      expect(typeof v4).assertEqual("string")
      expect(typeof tof_vars_2_g4).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18800
     * @tc.name      testExpressionsType0188
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:boolean = true
      expect(typeof v1).assertEqual("boolean")
      expect(typeof tof_vars_3_g1).assertEqual("boolean")
      let v2:boolean = false
      expect(typeof v2).assertEqual("boolean")
      expect(typeof tof_vars_3_g2).assertEqual("boolean")
      let v3:Comparable<Boolean> = new Boolean()
      expect(typeof v3).assertEqual("boolean")
      expect(typeof tof_vars_3_g3).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_18900
     * @tc.name      testExpressionsType0189
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:bigint = 123456789012345678901234567890n
      expect(typeof v1).assertEqual("bigint")
      expect(typeof tof_vars_4_g1).assertEqual("bigint")
      let v2:bigint = 999999999999999999999999999999n
      expect(typeof v2).assertEqual("bigint")
      expect(typeof tof_vars_4_g2).assertEqual("bigint")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19000
     * @tc.name      testExpressionsType0190
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_5_A = {}
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_5_g1).assertEqual("object")
      let v2:tof_vars_5_I = new tof_vars_5_A()
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_5_g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19100
     * @tc.name      testExpressionsType0191
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Numeric = 3.14
      expect(typeof v1).assertEqual("number")
      expect(typeof tof_vars_6_g1).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19200
     * @tc.name      testExpressionsType0192
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:number[] = [Number.MIN_VALUE]
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_7_g1).assertEqual("object")
      let v2:number[] = [Number.MAX_VALUE]
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_7_g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19300
     * @tc.name      testExpressionsType0193
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte[] = [Byte.MIN_VALUE]
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_8_g1).assertEqual("object")
      let v2:short[] = [Short.MIN_VALUE]
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_8_g2).assertEqual("object")
      let v3:int[] = [Int.MAX_VALUE]
      expect(typeof v3).assertEqual("object")
      expect(typeof tof_vars_8_g3).assertEqual("object")
      let v4:long[] = [Long.MIN_VALUE]
      expect(typeof v4).assertEqual("object")
      expect(typeof tof_vars_8_g4).assertEqual("object")
      let v5:float[] = [Float.MIN_VALUE]
      expect(typeof v5).assertEqual("object")
      expect(typeof tof_vars_8_g5).assertEqual("object")
      let v6:double[] = [Double.MIN_VALUE]
      expect(typeof v6).assertEqual("object")
      expect(typeof tof_vars_8_g6).assertEqual("object")
      let v7:char[] = [Char.MIN_VALUE as char]
      expect(typeof v7).assertEqual("object")
      expect(typeof tof_vars_8_g7).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19400
     * @tc.name      testExpressionsType0194
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_9_A[] = [new tof_vars_9_A]
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_9_g1).assertEqual("object")
      let v2:tof_vars_9_I[] = [new tof_vars_9_A]
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_9_g2).assertEqual("object")
      let v3:Comparable<Float>[] = [3.14f]
      expect(typeof v3).assertEqual("object")
      expect(typeof tof_vars_9_g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19500
     * @tc.name      testExpressionsType0195
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:Floating[] = [3.14f]
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_10_g1).assertEqual("object")
      let v2:Integral[] = [42]
      expect(typeof v2).assertEqual("object")
      expect(typeof tof_vars_10_g2).assertEqual("object")
      let v3:Numeric[] = [3.14]
      expect(typeof v3).assertEqual("object")
      expect(typeof tof_vars_10_g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19600
     * @tc.name      testExpressionsType0196
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:tof_vars_11_F = tof_vars_11_foo
      expect(typeof v1).assertEqual("function")
      expect(typeof tof_vars_11_g1).assertEqual("function")
      let v2:((p: int) => int) = tof_vars_11_foo
      expect(typeof v2).assertEqual("function")
      expect(typeof tof_vars_11_g2).assertEqual("function")
      let v3:tof_vars_11_F = tof_vars_11_f
      expect(typeof v3).assertEqual("function")
      expect(typeof tof_vars_11_g3).assertEqual("function")
      let v4:((p: int) => int) = tof_vars_11_f
      expect(typeof v4).assertEqual("function")
      expect(typeof tof_vars_11_g4).assertEqual("function")
      let v5:(() => void) = () => { console.log(1) }
      expect(typeof v5).assertEqual("function")
      expect(typeof tof_vars_11_g5).assertEqual("function")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19700
     * @tc.name      testExpressionsType0197
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:undefined = undefined
      expect(typeof v1).assertEqual("undefined")
      expect(typeof tof_vars_12_g1).assertEqual("undefined")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_19800
     * @tc.name      testExpressionsType0198
     * @tc.desc      Any typeof expression is of type string. The typeof expression values of the
     *               types below are predefined, and the expressions require no evaluation. Chapter 3.0
     *               states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsType0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:null = null
      expect(typeof v1).assertEqual("object")
      expect(typeof tof_vars_13_g1).assertEqual("object")
    });

  });
}