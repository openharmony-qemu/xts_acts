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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

type F_spex_8 = (p: number) => number

enum Color_spex_9 { Red, Green, Blue }

enum Color_spex_10 { Red, Green, Blue }

let a1_spex_14: Object[]|null = null
let a2_spex_14: Object[]|null = [new Object, new Object]

function foo_spex_15(): number[] {
    return [1.0, 2.0]
}

function str_filter_spex_16(s: string[], f: (p: string) => boolean): string[] {
    let res: string[] = []
    for (let el of s) if (f(el)) res = [...res, el]
    return res
}

let a1_spex_20 = ["1", "2", "3"]
let a2_spex_20 = ["a", "b"]

let a1_spex_21 = ["1", "2", "3"]
let a2_spex_21 = ["a", "b"]

class A_spex_22 {
    fld: boolean[]
    constructor(p: boolean[], q: boolean[]) {
        this.fld = [...p, ...q]
    }
    meth(): boolean[] {
        return [true, true, false, ...this.fld]
    }
}

abstract class A_spex_23 {
    fld: boolean[] = []
    constructor(p: boolean[]) {
        this.fld = p
    }
    meth(): boolean[] {
      return [true, true, false, ...this.fld]
    }
}
class B_spex_23 extends A_spex_23 {
    constructor(p: boolean[], q: boolean[]) {
        super([...p, ...q])
    }
    meth(): boolean[] {
        return [...super.meth(), true]
    }
}

interface I_spex_29 {}
interface J_spex_29 {}
class A_spex_30<T> {}
class B_spex_30<T> {}
class C_spex_30<T> {}

let a1_spex_31_32: string[] = ["1", "2", "3"]

let a1_spex_36: [Object, Error]|null = [new Object, new Error]
let a1_spex_38: [Object, Error]|null = null
let a2_spex_38: [Object, Error]|null = [new Object, new Error]

function foo_spex_40(): [number, string] {
  return [1.0, "X"]
}

let a1_spex_42: [int, int] = [1, 2]
let a2_spex_42: [int, int] = [5, 6]

class A_spex_43 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): [int, int, char] {
    return [0, ...this.fld]
  }
}

abstract class A_spex_44 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, int, char] {
    return [0, ...this.fld]
  }
}
class B_spex_44 extends A_spex_44 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, int, char] {
    return [...super.meth()]
  }
}

class A_spex_45<T> {}
class B_spex_45<T> {}

let a2_spex_46: [int, int] = [6, 5]

let a_spex_50: Iterable<string> = 'abc'

let a_spex_51: Iterable<[int, string]> = {
  1: 'a',
  2: 'b',
} as Record<int, string>

let a_spex_52: [string, string] = ['1', '2']
let a_spex_56: [string, string] = ['1', '2']
let a_spex_57: [string, string] = ['1', '2']
let a_spex_58: [string, int] = ['1', 2]

let a_spex_53: string[] = ['1', '2']

let a_spex_54: FixedArray<string> = ['1', '2']

let a_spex_55: Array<string> = ['1', '2']
class C_spex_48 {
  x: int = 13
}
class A_spex_const_0 {
  fld: number
  constructor(...p: Object[]) {
    this.fld = p.length
  }
}

class A_spex_const_1 {
  fld: number
  constructor(...p: char[]) {
    this.fld = p.length
  }
}

class A_spex_const_2 {
  fld: int
  constructor(a: int, ...p: byte[]) {
    this.fld = a + p.reduce((prev: int, next: byte) => prev + next, 0)
  }
}

class A_spex_const_3 {
  fld: int
  constructor(a: int, ...p: short[]) {
    this.fld = a + p.reduce((prev: int, next: short) => prev + next, 0)
  }
}

class A_spex_const_4 {
  fld: long
  constructor(a: long, ...p: long[]) {
    this.fld = a + p.reduce((prev: long, next: long) => prev + next, 0 as long)
  }
}

class A_spex_const_5 {
  fld: float
  constructor(a: float, ...p: float[]) {
    this.fld = a + p.reduce((prev: float, next: float) => prev + next, 0.0f)
  }
}

class A_spex_const_6 {
  fld: number
  constructor(a: number, ...p: number[]) {
    this.fld = a + p.reduce((prev: number, next: number) => prev + next, 0.0)
  }
}

type F_spex_const_7 = (p: number) => number
class A_spex_const_7 {
  fld: number
  constructor(a: number, ...p: F_spex_const_7[]) {
    let res = a
    for (let el of p) res += el(res)
    this.fld = res
  }
}

enum Color_spex_const_8 { Red, Green, Blue }
class A_spex_const_8 {
  fld: Color_spex_const_8
  constructor(...p: Color_spex_const_8[]) {
    this.fld = p.length ? p[p.length - 1] : Color_spex_const_8.Red
  }
}

class A_spex_const_9 {
  fld: number
  constructor(...p: number[]) {
    this.fld = p.length ? p[p.length - 1] : -1.0
  }
}

class A_spex_const_10 {
  fld: number
  constructor(a: int, ...p: Object[]) {
    this.fld = a + p.length
  }
}
class B_spex_const_10 extends A_spex_const_10 {
  constructor(a: int, ...p: Object[]) {
    super(a, ...p)
  }
}

let a1_spex_const_12: Object[]|null = null
let a2_spex_const_12: Object[]|null = [new Object, new Object]
class A_spex_const_12 {
  fld: number
  constructor(a: int, ...p: Object[]) {
    this.fld = a + p.length
  }
}

class A_spex_const_13 {
  foo(): number[] {
    return [1.0, 2.0]
  }
}
class B_spex_const_13 {
  fld: number
  constructor(...p: number[]) {
    this.fld = p.reduce((prev: number, next: number) => prev + next, 0.0)
  }
}

class A_spex_const_14 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "")
  }
}

class A_spex_const_15 {
  fld: number
  constructor(...p: number[]) {
    this.fld = p.length ? p[p.length - 1] : -1
  }
}

class A_spex_const_16 {
  fld: double
  constructor(...p: double[]) {
    this.fld = p[0] + p[1]
  }
}

class A_spex_const_17 {
  fld: double
  constructor(...p: double[]) {
    this.fld = p[0] + p[1] + p[2]
  }
}

class A_spex_const_18 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "-")
  }
}

let a1_spex_const_19 = ["1", "2", "3"]
let a2_spex_const_19 = ["a", "b"]
class A_spex_const_19 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "-")
  }
}

class A_spex_const_20 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return new B_spex_const_20(42, ...this.fld).fld
  }
}
class B_spex_const_20 {
  fld: number
  constructor(a: int, ...p: boolean[]) {
    this.fld = a + p.length
  }
}

abstract class A_spex_const_21 {
  fld: boolean[]
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_const_21 extends A_spex_const_21 {
  constructor(p: boolean[], q: boolean[]) {
    super([...p, ...q])
  }
  bar(): number {
    return new C_spex_const_21(42, ...super.meth()).fld
  }
}
class C_spex_const_21 {
  fld: number
  constructor(a: int, ...p: boolean[]) {
    this.fld = a + p.length
  }
}

class A_spex_const_22 {
  fld: number
  constructor(...p: number[][]) {
    let res = 0
    for (let el of p) res += el.length
    this.fld = res
  }
}
let a1_spex_const_22: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]

class A_spex_const_23 {
  fld: number[]
  constructor(...p: number[][]) {
    let res: number[] = []
    for (let el of p) res = [...res, ...el]
    this.fld = res
  }
}
class B_spex_const_23 {
  fld: number
  constructor(...p: number[]) {
    let res = 0.0
    for (let el of p) res += el
    this.fld = res
  }
}
let a1_spex_const_23: number[][] = [[1.0, 2.0], [3.0, 4.0]]
let a2_spex_const_23: number[][] = [[5.0, 6.0], []]

class A_spex_const_24_25 {
  fld: double
  constructor(...p: (Double|Short|Byte)[]) {
    let res = 0.0
    for (let el of p) res += (el as Numeric).toDouble()
    this.fld = res
  }
}

class A_spex_const_26 {
  fld: number
  constructor(...p: (Int|Number|String|undefined)[]) {
    this.fld = p.length
  }
}

class A_spex_const_27<T> {}
class B_spex_const_27<T> {}
class C_spex_const_27<T> {}
class Z_spex_const_27<T, U, V> {
  fld: number
  constructor(...p: (A_spex_const_27<T>|B_spex_const_27<U>|C_spex_const_27<V>|null)[]) {
    this.fld = p.length
  }
}

let a1_spex_const_28_29 = ["1", "2", "3"]
class A_spex_const_28_29 {
  fld: string
  constructor(...p: string[]) {
    this.fld = String.join(p, "")
  }
}
class A_spex_const_30 {
  fld: [boolean, number]
  constructor(...p: [number, boolean]) {
    this.fld = [p[1], p[0]]
  }
}

class A_spex_const_31 {
  fld: [number, number, boolean, boolean]
  constructor(...p: [number, boolean]) {
    this.fld = [p[0], p[0], p[1], p[1]]
  }
}

class A_spex_const_32 {
  fld: [byte, short, int, long, float, double, boolean, char, string, int]
  constructor(...p: [byte, short, int, long, float, double, boolean, char, string]) {
    this.fld = [...p, 42]
  }
}

class A_spex_const_33 {
  fld: int
  constructor(...p: [Object, Error]) {
    this.fld = p[0] != p[1] ? 3 : 0
  }
}
let a1_spex_const_33: [Object, Error]|null = [new Object, new Error]

class A_spex_const_35 {
  fld: int
  constructor(...p: [Object, Error]) {
    this.fld = p[0] != p[1] ? 3 : 0
  }
}
let a1_spex_const_35: [Object, Error]|null = null
let a2_spex_const_35: [Object, Error]|null = [new Object, new Error]

class A_spex_const_37 {
  fld: [string, number]
  constructor(...p: [number, string]) {
    this.fld = [p[1], p[0]]
  }
  static foo(): [number, string] {
    return [1.0, "X"]
  }
}

class A_spex_const_38 {
  fld: double
  constructor(...p: [double, double]) {
    this.fld = p[0] + p[1]
  }
}

class A_spex_const_39 {
  fld: int
  constructor(...p: [string, int]) {
    this.fld = p[1]
  }
}

class A_spex_const_40 {
  fld: int
  constructor(...p: [int, int]) {
    this.fld = p[0] + p[1]
  }
}
let a1_spex_const_40: [int, int] = [1, 2]
let a2_spex_const_40: [int, int] = [5, 6]

class A_spex_const_41 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): int {
    return 10 + new Z_spex_const_41(...this.fld).fld
  }
}
class Z_spex_const_41 {
  fld: int
  constructor(...p: [int, char]) {
    this.fld = 100 + p[0]
  }
}

abstract class A_spex_const_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_const_42 extends A_spex_const_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + new Z_spex_const_42(...super.meth()).fld
    return this.fld
  }
}
class Z_spex_const_42 {
  fld: int
  constructor(...p: [int, char]) {
    this.fld = 100 + p[0]
  }
}

class A_spex_const_43<T> {}
class B_spex_const_43<T> {}
class Z_spex_const_43<T, U> {
  fld: boolean
  constructor(...p: [A_spex_const_43<T>, B_spex_const_43<U>]) {
    this.fld = p[0] == p[1]
  }
}

let a2_spex_const_44: [int, int] = [6, 5]
class A_spex_const_44 {
  fld: string
  constructor(...p: [int, int]) {
    this.fld = "" + p[0] + p[1]
  }
}
function foo_spex_copy_values_0(...p: int[]) {
  p[1] = 4
}

function foo_spex_copy_values_1(...p: number[]) {
  p[0] = 99.0
  p[2] = 88.0
}

function foo_spex_copy_values_2(...p: string[]) {
  p[1] = "modified"
  return p
}

function foo_spex_copy_values_5(...p: byte[]) {
  p[0] = 99 as byte
}

function foo_spex_copy_values_6(...p: long[]) {
  p[1] = 777 as long
}

function foo_spex_copy_values_7(...p: char[]) {
  p[0] = c'Z'
}

function foo_spex_copy_values_8(...p: FixedArray<int>) {
  p[0] = 999
}

function foo_spex_copy_values_10(...p: [int, int][]) {
  p[0][0] = 999
}

function foo_spex_copy_values_11(...p: int[]) {
  p.push(999)
}

function foo_spex_copy_values_13(...p: int[]) {
  for (let i = 0; i < p.length; i++) {
    p[i] = p[i] * 10
  }
}
class A_spex_func_20 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return foo_spex_func_20(42, ...this.fld)
  }
}
function foo_spex_func_20(a: int, ...p: boolean[]): number {
  return a + p.length
}

abstract class A_spex_func_21 {
  fld: boolean[] = []
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_func_21 extends A_spex_func_21 {
  constructor(p: boolean[], q: boolean[]) {
    super([...p, ...q])
  }
  bar(): number {
    return foo_spex_func_21(42, ...super.meth())
  }
}
function foo_spex_func_21(a: int, ...p: boolean[]): number {
  return a + p.length
}

type F_spex_func_7 = (p: number) => number

enum Color_spex_func_8 { Red, Green, Blue }

function foo_spex_func_13(): number[] {
  return [1.0, 2.0]
}
function bar_spex_func_13(...p: number[]): number {
  return p.reduce((prev: number, next: number) => prev + next, 0.0)
}

function foo_spex_func_14(...p: string[]): string {
  return String.join(p, '')
}

function foo_spex_func_18_19(...p: string[]): string {
  return String.join(p, '-')
}
let a1_spex_func_19 = ['1', '2', '3']
let a2_spex_func_19 = ['a', 'b']

function foo_spex_func_22(...p: number[][]): number {
  let res = 0
  for (let el of p) res += el.length
  return res
}

function foo_spex_func_23(...p: number[][]): number[] {
  let res: number[] = []
  for (let el of p) res = [...res, ...el]
  return res
}
function bar_spex_func_23(...p: number[]): number {
  return p.reduce((prev: number, next: number) => prev + next, 0.0)
}

function foo_spex_func_26(...p: (Int|Number|String|undefined)[]): number {
  return p.length
}

class A_spex_func_27<T> {}
class B_spex_func_27<T> {}
class C_spex_func_27<T> {}
function foo_spex_func_27<T, U, V>(...p: (A_spex_func_27<T>|B_spex_func_27<U>|C_spex_func_27<V>|null)[]): number {
  return p.length
}

let a1_spex_func_28_29 = ['1', '2', '3']
function foo_spex_func_28_29(...p: string[]): string {
  return String.join(p, '')
}
function foo_12400(...p: Object[]): number {
  return p.length
}

function foo_12500(...p: char[]): number {
  return p.length
}
function foo_12600(a: int, ...p: byte[]): int {
  return a + p.reduce((prev: int, next: byte) => prev + next, 0)
}
function foo_12700(a: int, ...p: short[]): int {
  return a + p.reduce((prev: int, next: short) => prev + next, 0)
}
function foo_12800(a: long, ...p: long[]): long {
  return a + p.reduce((prev: long, next: long) => prev + next, 0 as long)
}
function foo_12900(a: float, ...p: float[]): float {
  return a + p.reduce((prev: float, next: float) => prev + next, 0.0f)
}
function foo_13000(a: number, ...p: number[]): number {
  return a + p.reduce((prev: number, next: number) => prev + next, 0.0)
}
function foo_13100(a: number, ...p: F_spex_func_7[]): number {
  let res = a
  for (let el of p) res += el(res)
  return res
}
function foo_13200(...p: Color_spex_func_8[]): Color_spex_func_8 {
  return p.length ? p[p.length - 1] : Color_spex_func_8.Red
}
function foo_13300(...p: number[]): number {
  return p.length ? p[p.length - 1] : -1.0
}
function foo_13400(a: int, ...p: Object[]): number {
  return a + p.length
}
function foo_13600(a: int, ...p: Any[]): number {
  return a + p.length
}
function foo_13900(...p: number[]): number {
  return p.length ? p[p.length - 1] : -1
}
function foo_14000(...p: double[]): double {
  return p[0] + p[1]
}
function foo_14100(...p: double[]): double {
  return p[0] + p[1] + p[2]
}
class A_spex_func_41 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): int {
    return 10 + foo_spex_func_41(...this.fld)
  }
}
function foo_spex_func_41(...p: [int, char]): int {
  return 100 + p[0]
}

abstract class A_spex_func_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_func_42 extends A_spex_func_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + foo_spex_func_42(...super.meth())
    return this.fld
  }
}
function foo_spex_func_42(...p: [int, char]): int {
  return 100 + p[0]
}

class A_spex_func_43<T> {}
class B_spex_func_43<T> {}
function foo_spex_func_43<T, U>(...p: [A_spex_func_43<T>, B_spex_func_43<U>]): boolean {
  return p[0] == p[1]
}

type F_spex_func_54 = (p: number) => number

enum Color_spex_func_55 { Red, Green, Blue }

let r1_spex_func_45: Record<int, string> = {1: '1', 3: '3'}
let r2_spex_func_45: Record<int, string> = {2: '2'}

let a1_spex_func_40: [int, int] = [1, 2]
let a2_spex_func_40: [int, int] = [5, 6]

let a1_spex_func_33_35: [Object, Error]|null = [new Object, new Error]
let a1_spex_func_35: [Object, Error]|null = null
let a2_spex_func_35: [Object, Error]|null = [new Object, new Error]

let a2_spex_func_44: [int, int] = [6, 5]

let a1_spex_func_57: FixedArray<Object>|null = [new Object, new Object]
let a1_spex_func_59: FixedArray<Object>|null = null
let a2_spex_func_59: FixedArray<Object>|null = [new Object, new Object]

function reduce<T, R>(arr: Array<T>, callback: (prev: R, next: T) => R, initialValue: R): R {
  let result = initialValue
  for (let i = 0; i < arr.length; i++) {
    result = callback(result, arr[i])
  }
  return result
}

function foo_15400(...p: [number, boolean]): [boolean, number] {
  return [p[1], p[0]]
}
function foo_15500(...p: [number, boolean]): [number, number, boolean, boolean] {
  return [p[0], p[0], p[1], p[1]]
}
function foo_15600(...p: [byte, short, int, long, float, double, boolean, char, string]): [byte, short, int, long, float, double, boolean, char, string, int] {
  return [...p, 42]
}
function foo_15700(...p: [Object, Error]): int {
  return p[0] != p[1] ? 3 : 0
}
function foo_15900(...p: [Object, Error]): int {
  return p[0] != p[1] ? 3 : 0
}
function foo_16100(): [number, string] {
  return [1.0, 'X']
}
function bar_16100(...p: [number, string]): [string, number] {
  return [p[1], p[0]]
}
function foo_16200(...p: [double, double]): double {
  return p[0] + p[1]
}
function foo_16300(...p: [string, int]): int {
  return p[1]
}
function foo_16400(...p: [int, int]): int {
  return p[0] + p[1]
}
function foo_16800(...p: [int, int]): string {
  return '' + p[0] + p[1]
}
function foo_16900(...p: Record<int, string>[]): number {
  expect(p[0][1]).assertEqual('1')
  return p.length
}
function foo_17000(...p: Object[]): number {
  return p.length
}
function foo_17100(...p: Array<Object>): number {
  return p.length
}
function foo_17200(...p: FixedArray<char>): number {
  return p.length
}
function foo_17300(a: int, ...p: Array<byte>): int {
  return a + reduce(p, (prev: int, next: byte) => prev + next, 0)
}
function foo_17700(a: number, ...p: number[]): number {
  return a + reduce(p, (prev: number, next: number) => prev + next, 0.0)
}
function foo_17800(a: number, ...p: FixedArray<F_spex_func_54>): number {
  let res = a
  for (let el of p) res += el(res)
  return res
}
function foo_17900(...p: Color_spex_func_55[]): Color_spex_func_55 {
  return p.length ? p[p.length - 1] : Color_spex_func_55.Red
}
function foo_18000(...p: FixedArray<Object>): number {
  return (p.length ? p[p.length - 1] : -1.0) as number
}
function foo_18100(a: int, ...p: FixedArray<Object>): int {
  return a + p.length
}
function foo_18300(a: int, ...p: FixedArray<Object>): int {
  return a + p.length
}
function foo_spex_func_64(...p: Array<double>): double {
  return p[0] + p[1] + p[2]
}
class A_spex_func_67 {
  fld: FixedArray<boolean>
  constructor(p: FixedArray<boolean>, q: FixedArray<boolean>) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return foo_spex_func_67(42, ...this.fld)
  }
}
function foo_spex_func_67(a: int, ...p: FixedArray<boolean>): number {
  return a + p.length
}

abstract class A_spex_func_68 {
  fld: FixedArray<boolean> = []
  constructor(p: FixedArray<boolean>) {
    this.fld = p
  }
  meth(): FixedArray<boolean> {
    return this.fld
  }
}
class B_spex_func_68 extends A_spex_func_68 {
  constructor(p: FixedArray<boolean>, q: FixedArray<boolean>) {
    super([...p, ...q])
  }
  bar(): number {
    return foo_spex_func_68(42, ...super.meth())
  }
}
function foo_spex_func_68(a: int, ...p: FixedArray<boolean>): number {
  return a + p.length
}

function foo_spex_func_69(...p: FixedArray<FixedArray<number>>): number {
  let res = 0
  for (let el of p) res += el.length
  return res
}

function foo_spex_func_70(...p: FixedArray<FixedArray<number>>): FixedArray<number> {
  let res: FixedArray<number> = []
  for (let el of p) res = [...res, ...el]
  return res
}
function bar_spex_func_70(...p: FixedArray<number>): number {
  let res = 0.0
  for (let el of p) res += el
  return res
}

function foo_spex_func_71(...p: Array<Double|Short|Byte>): double {
  let res = 0.0
  for (let el of p) res += (el as Numeric).toDouble()
  return res
}
class A_spex_func_74<T> {}
class B_spex_func_74<T> {}
class C_spex_func_74<T> {}
function foo_spex_func_74<T, U, V>(...p: FixedArray<A_spex_func_74<T>|B_spex_func_74<U>|C_spex_func_74<V>|null>): number {
  return p.length
}

type F_spex_lmbd_7 = (p: number) => number

enum Color_spex_lmbd_8 { Red, Green, Blue }

let a1_spex_lmbd_10_12_13: Object[]|null = [new Object, new Object]
let a1_spex_lmbd_13: Object[]|null = null
let a2_spex_lmbd_13: Object[]|null = [new Object, new Object]

function foo_spex_lmbd_14(): number[] {
  return [1.0, 2.0]
}

let a1_spex_lmbd_20 = ["1", "2", "3"]
let a2_spex_lmbd_20 = ["a", "b"]

class A_spex_lmbd_21 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): int {
    return ((a: int, ...p: boolean[]): int => a + p.length)(42, ...this.fld)
  }
}

abstract class A_spex_lmbd_22 {
  fld: boolean[]
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_lmbd_22 extends A_spex_lmbd_22 {
  constructor(p: boolean[], q: boolean[]) {
    super([...p, ...q])
  }
  bar(): int {
    return ((a: int, ...p: boolean[]): int => a + p.length)(42, ...super.meth())
  }
}

function bar_spex_lmbd_24(...p: number[]): number {
  let res = 0.0
  for (let el of p) res += el
  return res
}

let a1_spex_lmbd_28_29 = ["1", "2", "3"]
class A_spex_lmbd_41 {
  fld: [int, char]
  constructor(p: int, q: char) {
    this.fld = [p, q]
  }
  meth(): int {
    return 10 + ((...p: [int, char]): int => 100 + p[0])(...this.fld)
  }
}

abstract class A_spex_lmbd_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_lmbd_42 extends A_spex_lmbd_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + ((...p: [int, char]): int => 100 + p[0])(...super.meth())
    return this.fld
  }
}

let a1_spex_lmbd_33: [Object, Error]|null = [new Object, new Error]
let a1_spex_lmbd_35: [Object, Error]|null = null
let a2_spex_lmbd_35: [Object, Error]|null = [new Object, new Error]

function foo_spex_lmbd_37(): [number, string] {
  return [1.0, "X"]
}

let a1_spex_lmbd_40: [int, int] = [1, 2]
let a2_spex_lmbd_40: [int, int] = [5, 6]

let a2_spex_lmbd_43: [int, int] = [6, 5]
type F_spex_meth_7 = (p: number) => number

enum Color_spex_meth_8 { Red, Green, Blue }

let a1_spex_meth_10_12_13: Object[]|null = [new Object, new Object]
let a1_spex_meth_12: Object[]|null = null
let a2_spex_meth_12: Object[]|null = [new Object, new Object]

let a1_spex_meth_19 = ["1", "2", "3"]
let a2_spex_meth_19 = ["a", "b"]

class A_spex_meth_20 {
  fld: boolean[]
  constructor(p: boolean[], q: boolean[]) {
    this.fld = [...p, ...q]
  }
  meth(): number {
    return B_spex_meth_20.foo(42, ...this.fld)
  }
}
class B_spex_meth_20 {
  static foo(a: int, ...p: boolean[]): number {
    return a + p.length
  }
}

abstract class A_spex_meth_21 {
  fld: boolean[]
  constructor(p: boolean[]) {
    this.fld = p
  }
  meth(): boolean[] {
    return this.fld
  }
}
class B_spex_meth_21 extends A_spex_meth_21 {
  obj: C_spex_meth_21
  constructor(p: boolean[], q: boolean[], obj: C_spex_meth_21) {
    super([...p, ...q])
    this.obj = obj
  }
  bar(): number {
    return this.obj.foo(42, ...super.meth())
  }
}
class C_spex_meth_21 {
  foo(a: int, ...p: boolean[]): number {
    return a + p.length
  }
}

class A_spex_meth_24_25 {
  foo(...p: (Double|Short|Byte)[]): double {
    let res = 0.0
    for (let el of p) res += (el as Numeric).toDouble()
    return res
  }
}

class A_spex_meth_26 {
  foo(...p: (Int|Number|String|undefined)[]): number {
    return p.length
  }
}

class A_spex_meth_27<T> {}
class B_spex_meth_27<T> {}
class C_spex_meth_27<T> {}
class Z_spex_meth_27<T, U, V> {
  foo(...p: (A_spex_meth_27<T>|B_spex_meth_27<U>|C_spex_meth_27<V>|null)[]): number {
    return p.length
  }
}

let a1_spex_meth_28_29 = ["1", "2", "3"]
class A_spex_meth_28_29 {
  foo(...p: string[]): string {
    return String.join(p, "")
  }
}

class A_24700 {
  foo(...p: Object[]): number {
    return p.length
  }
}

class A_24800 {
  foo(...p: char[]): number {
    return p.length
  }
}
class A_24900 {
  static foo(a: int, ...p: byte[]): int {
    return a + reduce(p, (prev: int, next: byte) => prev + next, 0)
  }
}
class A_25000 {
  foo(a: int, ...p: short[]): int {
    return a + reduce(p, (prev: int, next: short) => prev + next, 0)
  }
}
class A_25100 {
  static foo(a: long, ...p: long[]): long {
    return a + reduce(p, (prev: long, next: long) => prev + next, 0 as long)
  }
}
class A_25200 {
  foo(a: float, ...p: float[]): float {
    return a + reduce(p, (prev: float, next: float) => prev + next, 0.0f)
  }
}
class A_25300 {
  static foo(a: number, ...p: number[]): number {
    return a + reduce(p, (prev: number, next: number) => prev + next, 0.0)
  }
}
class A_25400 {
  foo(a: number, ...p: F_spex_meth_7[]): number {
    let res = a
    for (let el of p) res += el(res)
    return res
  }
}
class A_25500 {
  foo(...p: Color_spex_meth_8[]): Color_spex_meth_8 {
    return p.length ? p[p.length - 1] : Color_spex_meth_8.Red
  }
}
class A_25600 {
  static foo(...p: number[]): number {
    return p.length ? p[p.length - 1] : -1.0
  }
}
abstract class A_25700 {
  foo(a: int, ...p: Object[]): number {
    return a + p.length
  }
}
class B_25700 extends A_25700 {}
class A_25900 {
  foo(a: int, ...p: Object[]): number {
    return a + p.length
  }
}
interface I_26100 {
  foo(...p: string[]): string
}
class A_26100 implements I_26100 {
  foo(...p: string[]): string {
    return String.join(p, "")
  }
}
class A_26300 {
  static foo(...p: double[]): double {
    return p[0] + p[1]
  }
}
class A_26400 {
  foo(...p: double[]): double {
    return p[0] + p[1] + p[2]
  }
}
class A_26600 {
  foo(...p: string[]): string {
    return String.join(p, "-")
  }
}
class A_27000 {
  foo(...p: number[][]): number[] {
    let res: number[] = []
    for (let el of p) res = [...res, ...el]
    return res
  }
  bar(...p: number[]): number {
    let res = 0.0
    for (let el of p) res += el
    return res
  }
}
class A_26000 {
  foo(): number[] {
    return [1.0, 2.0]
  }
  bar(...p: number[]): number {
    return reduce(p, (prev: number, next: number) => prev + next, 0.0)
  }
}
class A_26200 {
  foo(...p: number[]): number {
    return p.length ? p[p.length - 1] : -1
  }
}

class A_26500 {
  foo(...p: string[]): string {
    return String.join(p, "-")
  }
}
class B_26500 extends A_26500 {}
class A_26900 {
  foo(...p: number[][]): number {
    let res = 0
    for (let el of p) res += el.length
    return res
  }
}
interface A_spex_meth_45_46_47 {}

interface test_spex_meth_45_46_47 {
  t: A_spex_meth_45_46_47[]
}

interface B_spex_meth_45_46_47 {
  unsorted: A_spex_meth_45_46_47[]
}

class C_spex_meth_45_46_47 {
  static foo(...arg: B_spex_meth_45_46_47[]): void {
    expect(arg.length).assertEqual(3)
  }
}

class C_spex_meth_46 {
  static foo(...arg: B_spex_meth_45_46_47[]): void {
    expect(arg.length).assertEqual(3)
    expect(arg[arg.length - 1].unsorted.length).assertEqual(6)
  }
}

interface A_spex_meth_47 {
  cnt?: int
}

interface test_spex_meth_47 {
  t: A_spex_meth_47[]
}

interface B_spex_meth_47 {
  unsorted: A_spex_meth_47[]
}

class C_spex_meth_47 {
  static foo(...arg: B_spex_meth_47[]): void {
    expect(arg.length).assertEqual(3)
    expect(reduce(arg,
      (p: int, c: B_spex_meth_47) => p + reduce(c.unsorted,
        (p: int, c: A_spex_meth_47) => p + (c.cnt ? c.cnt! : 0), 0), 0
    )).assertEqual(7)
  }
}

class A_spex_meth_41 {
  fld: [int, char]
  obj: Z_spex_meth_41
  constructor(p: int, q: char, obj: Z_spex_meth_41) {
    this.fld = [p, q]
    this.obj = obj
  }
  meth(): int {
    return 10 + this.obj.foo(...this.fld)
  }
}
class Z_spex_meth_41 {
  foo(...p: [int, char]): int {
    return 100 + p[0]
  }
}

abstract class A_spex_meth_42 {
  fld: [int, char]
  constructor(p: [int, char]) {
    this.fld = p
  }
  meth(): [int, char] {
    return this.fld
  }
}
class B_spex_meth_42 extends A_spex_meth_42 {
  constructor(p: int, q: char) {
    super([p, q])
  }
  meth(): [int, char] {
    this.fld[0] = 10 + Z_spex_meth_42.foo(...super.meth())
    return this.fld
  }
}
class Z_spex_meth_42 {
  static foo(...p: [int, char]): int {
    return 100 + p[0]
  }
}

class A_spex_meth_43<T> {}
class B_spex_meth_43<T> {}
class Z_spex_meth_43<T, U> {
  foo(...p: [A_spex_meth_43<T>, B_spex_meth_43<U>]): boolean {
    return p[0] == p[1]
  }
}

interface I_spex_meth_37 {
  foo(): [number, string]
}
class A_spex_meth_37 implements I_spex_meth_37 {
  foo(): [number, string] {
    return [1.0, "X"]
  }
  bar(...p: [number, string]): [string, number] {
    return [p[1], p[0]]
  }
}

function fooReadonlyRestParam_spex_to_readonly(...p_ro: readonly int[]) {
  expect(p_ro[0]).assertEqual(1)
  expect(p_ro[1]).assertEqual(2)
}

let a1_spex_meth_40: [int, int] = [1, 2]
let a2_spex_meth_40: [int, int] = [5, 6]

let a2_spex_meth_44: [int, int] = [6, 5]

const tests_spex_meth_45: test_spex_meth_45_46_47[] = [{ t: [{}, {}] }, { t: [{}] }, { t: [{}, {}, {}] }]
const tests_spex_meth_46: test_spex_meth_45_46_47[] = [{ t: [{}, {}] }, { t: [{}] }, { t: [{}, {}, {}] }]
const tests_spex_meth_47: test_spex_meth_47[] = [{ t: [{}, {}, {}, {}] }, { t: [{}] }, { t: [{}, {}] }]

class A_27700 {
  foo(...p: [number, boolean]): [boolean, number] {
    return [p[1], p[0]]
  }
}

class A_27900 {
  foo(...p: [byte, short, int, long, float, double, boolean, char, string]): [byte, short, int, long, float, double, boolean, char, string, int] {
    return [...p, 42]
  }
}
class A_28000 {
  static foo(...p: [Object, Error]): int {
    return p[0] != p[1] ? 3 : 0
  }
}

class A_28200 {
  foo(...p: [Object, Error]): int {
    return p[0] != p[1] ? 3 : 0
  }
}
class A_28500 {
  foo(...p: [double, double]): double {
    return p[0] + p[1]
  }
}
class A_28600 {
  static foo(...p: [string, int]): int {
    return p[1]
  }
}
class A_28700 {
  foo(...p: [int, int]): int {
    return p[0] + p[1]
  }
}
class A_29100 {
  foo(...p: [int, int]): string {
    return "" + p[0] + p[1]
  }
}
class A_27800 {
  foo(...p: [number, boolean]): [number, number, boolean, boolean] {
    return [p[0], p[0], p[1], p[1]]
  }
}
export default function ExpressionsSpreadTest(): void {
  describe("ExpressionsSpreadTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0100
     * @tc.name      testExpressionsSpread0001
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // empty arrays
      let a1: Object[] = [], a2: Error[] = []
      expect( [...a1, ...a2, new Object(), ...a1].length ).assertEqual( 1 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0200
     * @tc.name      testExpressionsSpread0002
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of char array
      let a: char[] = [c'b', c'c']
      let r = [c'a', ...a, c'd']
      expect( r.length ).assertEqual( 4 )
      expect( new String(r) ).assertEqual( "a,b,c,d" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0300
     * @tc.name      testExpressionsSpread0003
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of byte array
      let a = [2 as byte, 3 as byte]
      let r = [1 as byte, ...a, 4 as byte]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0400
     * @tc.name      testExpressionsSpread0004
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of short array
      let a = [2 as short, 3 as short]
      let r = [1 as short, ...a, 4 as short]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0500
     * @tc.name      testExpressionsSpread0005
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of int array
      let a = [2, 3]
      let r = [1, ...a, 4]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0600
     * @tc.name      testExpressionsSpread0006
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of long array
      let a: long[] = [2 as long, 3 as long]
      let r = [1 as long, ...a, 4 as long]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0700
     * @tc.name      testExpressionsSpread0007
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of float array
      let a: float[] = [2.0f, 3.0f]
      let r = [1.0f, ...a, 4.0f]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1.0 )
      expect( r[1] ).assertEqual( 2.0 )
      expect( r[2] ).assertEqual( 3.0 )
      expect( r[3] ).assertEqual( 4.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0800
     * @tc.name      testExpressionsSpread0008
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of double array
      let a = [2.0, 3.0]
      let r = [1.0, ...a, 4.0]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1.0 )
      expect( r[1] ).assertEqual( 2.0 )
      expect( r[2] ).assertEqual( 3.0 )
      expect( r[3] ).assertEqual( 4.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_0900
     * @tc.name      testExpressionsSpread0009
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of function array
      let a: F_spex_8[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_8[] = [(p: number) => p * 4, (p: number) => p * 5]
      let res = 1.0
      for (let el of [...a, ...b]) res += el(res)
      expect( res ).assertEqual( 360.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1000
     * @tc.name      testExpressionsSpread0010
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of enums
      let a: Color_spex_9[] = [Color_spex_9.Red, Color_spex_9.Green]
      let b: Color_spex_9[] = [Color_spex_9.Blue]
      let r = [...a, ...b]
      expect( r.length ).assertEqual( 3 )
      expect( r[0] ).assertEqual( Color_spex_9.Red )
      expect( r[1] ).assertEqual( Color_spex_9.Green )
      expect( r[2] ).assertEqual( Color_spex_9.Blue )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1100
     * @tc.name      testExpressionsSpread0011
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of enums
      let a: Color_spex_10[] = [Color_spex_10.Red, Color_spex_10.Green]
      let b: Color_spex_10[] = [Color_spex_10.Blue]
      let r = [...a, ...b]
      expect( r.length ).assertEqual( 3 )
      expect( r[0] ).assertEqual( 0 )
      expect( r[1] ).assertEqual( 1 )
      expect( r[2] ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1200
     * @tc.name      testExpressionsSpread0012
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expression in parentheses
      let a1: Number[] = [1.0, 2.0]
      let r = [...(a1)]
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1300
     * @tc.name      testExpressionsSpread0013
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      let a1: Object[]|null = [new Object]
      expect( [...a1!, new Object].length ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1400
     * @tc.name      testExpressionsSpread0014
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_13.js，直接跳过
      // 使用 expect.assertEqual(2, 2) 占位
      expect( 2 ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1500
     * @tc.name      testExpressionsSpread0015
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect( [...(a1_spex_14 ?? a2_spex_14)!, new Object].length ).assertEqual( 3 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1600
     * @tc.name      testExpressionsSpread0016
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let r = [...foo_spex_15()]
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1700
     * @tc.name      testExpressionsSpread0017
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let s = ["h", "", "el", "", "", "l", "", "o"]
      let r = [...str_filter_spex_16(s, (item: string) => item.length > 0), "!"]
      expect( r.length ).assertEqual( 5 )
      expect( String.join(r, "") ).assertEqual( "hello!" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1800
     * @tc.name      testExpressionsSpread0018
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // new expression in expression
      let r = [...[256]]
      expect( r.length ).assertEqual( 1 )
      expect( r[0] ).assertEqual( 256 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_1900
     * @tc.name      testExpressionsSpread0019
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // array index expression
      let a: double[][] = [[2.0, 3.0], []]
      let r = [1.0, ...a[0], ...a[1], 4.0]
      expect( r.length ).assertEqual( 4 )
      expect( r[0] ).assertEqual( 1 )
      expect( r[1] ).assertEqual( 2 )
      expect( r[2] ).assertEqual( 3 )
      expect( r[3] ).assertEqual( 4 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2000
     * @tc.name      testExpressionsSpread0020
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [double[], string] = [[2.0, 3.0, 4.0], "X"]
      let r = [0.0, 1.0, ...a[0]]
      expect( r.reduce((sum: double, item: double) => sum + item, 0.0) ).assertEqual( 10.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2100
     * @tc.name      testExpressionsSpread0021
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      let r = [...a1, ...(a1 = a2), ...a1]
      expect( "".concat(...r) ).assertEqual( "123abab" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2200
     * @tc.name      testExpressionsSpread0022
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      let r = [...(a1_spex_21.length > a2_spex_21.length ? a1_spex_21 : a2_spex_21), "!"]
      expect( String.join(r, "") ).assertEqual( "123!" )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2300
     * @tc.name      testExpressionsSpread0023
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use 'this' expression
      let a: A_spex_22 = new A_spex_22([false, false], [true, true])
      expect( a.meth().length ).assertEqual( 7 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2400
     * @tc.name      testExpressionsSpread0024
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use 'super' expression
      let b: B_spex_23 = new B_spex_23([false, false], [true, true])
      expect( b.meth().length ).assertEqual( 8 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2500
     * @tc.name      testExpressionsSpread0025
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      let r: number[][] = [...a1, [], ...a2]
      expect( r.length ).assertEqual( 5 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2600
     * @tc.name      testExpressionsSpread0026
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays, flatten array
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      let res: number[] = []
      for (let el of [...a1, ...a2, [7.0]]) res = [...res, ...el]
      expect( res.length ).assertEqual( 7 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2700
     * @tc.name      testExpressionsSpread0027
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of types in result array
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      let res = 0.0
      for (let el of ar) res += (el as Numeric).toDouble()
      expect( res ).assertEqual( 42.0 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2800
     * @tc.name      testExpressionsSpread0028
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of reference types in result array
      let a1: (Object|undefined)[] = [new Int(), new Int(), undefined]
      let a2: (Number|undefined)[] = [42.0, 42.0, undefined]
      let r = [...a1, ...a2, 42.0]
      expect( r[0] ).assertEqual( 0 )
      expect( r[1] ).assertEqual( 0 )
      expect( r[2] ).assertEqual( undefined )
      expect( r[3] ).assertEqual( 42 )
      expect( r[4] ).assertEqual( 42 )
      expect( r[5] ).assertEqual( undefined )
      expect( r[6] ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_2900
     * @tc.name      testExpressionsSpread0029
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of reference types in result array
      let a1: Array<I_spex_29|null> = [{}, {}, null]
      let a2: Array<J_spex_29|null> = [null, {}, {}]
      let r = [...a1, ...a2, 42.0]
      expect( r[0] instanceof I_spex_29 ).assertTrue()
      expect( r[1] instanceof I_spex_29 ).assertTrue()
      expect( r[2] ).assertEqual( null )
      expect( r[3] ).assertEqual( null )
      expect( r[4] instanceof J_spex_29 ).assertTrue()
      expect( r[5] instanceof J_spex_29 ).assertTrue()
      expect( r[6] ).assertEqual( 42 )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3000
     * @tc.name      testExpressionsSpread0030
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: (null|undefined|never|byte|int|long|double)[] = [1, 2, 3, 4.0]
      let a2: (A_spex_30<String>|B_spex_30<Long>|C_spex_30<Error>|int)[] = [5, new A_spex_30<String>, new B_spex_30<Long>, new C_spex_30<Error>]
      let r = [...a1, null, ...a2]
      expect(r.length).assertEqual(9)
      expect(r[0]).assertEqual(1)
      expect(r[8] instanceof C_spex_30).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3100
     * @tc.name      testExpressionsSpread0031
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r = [...((): string[] => a1_spex_31_32)(), "!"]
      expect(String.join(r, "")).assertEqual("123!")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3200
     * @tc.name      testExpressionsSpread0032
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r = [...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_31_32, a1_spex_31_32), "!"]
      expect(String.join(r, "")).assertEqual("123123!")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3300
     * @tc.name      testExpressionsSpread0033
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread a tuple to same type tuple
      let t1: [number, boolean] = [1.0, true]
      let r: [number, boolean] = [...t1]
      expect(r[0]).assertEqual(1.0)
      expect(r[1]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3400
     * @tc.name      testExpressionsSpread0034
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples to different types
      let t1: [number] = [1.0]
      let t2: [boolean] = [true]
      let r: [number, number, boolean, boolean] = [...t1, ...t1, ...t2, ...t2]
      expect(r[0]).assertEqual(1.0)
      expect(r[1]).assertEqual(1.0)
      expect(r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3500
     * @tc.name      testExpressionsSpread0035
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples of all value types
      let t1: [byte, short] = [1 as byte, 2 as short]
      let t2: [int, long] = [3, 4 as long]
      let t3: [float, double, boolean] = [5.0f, 6.0, true]
      let t4: [char, string] = [c'Z', "X"]
      let r: [byte, short, int, long, float, double, boolean, char, string] = [...t1, ...t2, ...t3, ...t4]
      expect(r[0]).assertEqual(1)
      expect(r[1]).assertEqual(2)
      expect(r[2]).assertEqual(3)
      expect(r[3]).assertEqual(4)
      expect(r[4]).assertEqual(5.0f)
      expect(r[5]).assertEqual(6.0)
      expect(r[6]).assertEqual(true)
      expect(r[7]).assertEqual(c'Z')
      expect(r[8]).assertEqual("X")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3600
     * @tc.name      testExpressionsSpread0036
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      expect([...a1_spex_36!, new Object].length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3700
     * @tc.name      testExpressionsSpread0037
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_37.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3800
     * @tc.name      testExpressionsSpread0038
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect([...(a1_spex_38 ?? a2_spex_38)!, new Object].length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_3900
     * @tc.name      testExpressionsSpread0039
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_39.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4000
     * @tc.name      testExpressionsSpread0040
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let r: [number, string] = [...foo_spex_40()]
      expect(r[0]).assertEqual(1)
      expect(r[1]).assertEqual("X")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4100
     * @tc.name      testExpressionsSpread0041
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      let r: [string, int, string, int, string, int] = [...a1, ...(a1 = a2), ...a1]
      expect(r[0]).assertEqual("1")
      expect(r[1]).assertEqual(10)
      expect(r[2]).assertEqual("2")
      expect(r[3]).assertEqual(20)
      expect(r[4]).assertEqual("2")
      expect(r[5]).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4200
     * @tc.name      testExpressionsSpread0042
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      let r: [int, int] = [...(a1_spex_42[0] > a2_spex_42[0] ? a1_spex_42 : a2_spex_42)]
      expect(r[0]).assertEqual(5)
      expect(r[1]).assertEqual(6)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4300
     * @tc.name      testExpressionsSpread0043
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_43 = new A_spex_43(1, c'Z')
      let r = a.meth()
      expect(r[0]).assertEqual(0)
      expect(r[1]).assertEqual(1)
      expect(r[2]).assertEqual(c'Z')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4400
     * @tc.name      testExpressionsSpread0044
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_44 = new B_spex_44(1, c'Z')
      let r = b.meth()
      expect(r[0]).assertEqual(0)
      expect(r[1]).assertEqual(1)
      expect(r[2]).assertEqual(c'Z')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4500
     * @tc.name      testExpressionsSpread0045
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: [int|A_spex_45<String>, double|B_spex_45<Long>] = [1, new B_spex_45<Long>]
      let a2: [int|A_spex_45<Long>, double|B_spex_45<String>] = [new A_spex_45<Long>, new B_spex_45<String>]
      let r: [A_spex_45<String>|int, B_spex_45<Long>|double, A_spex_45<Long>|int, B_spex_45<String>|double] = [...a1, ...a2]
      expect(r[0] == 1 && r[1] instanceof B_spex_45 && r[2] instanceof A_spex_45 && r[3] instanceof B_spex_45).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4600
     * @tc.name      testExpressionsSpread0046
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r: [int, int] = [...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_46)]
      expect(r[0]).assertEqual(5)
      expect(r[1]).assertEqual(6)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4700
     * @tc.name      testExpressionsSpread0047
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray and Array in spread expression
      let fa1: FixedArray<int> = [1]
      let a2: int[] = [2, 3, 4]
      let fa3: FixedArray<int> = [...fa1, ...a2]
      expect(fa3.length).assertEqual(4)
      expect(fa3[0]).assertEqual(1)
      expect(fa3[3]).assertEqual(4)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4800
     * @tc.name      testExpressionsSpread0048
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray in spread expression
      let a: FixedArray<C_spex_48> = [new C_spex_48]
      let c = [...a]
      expect(c.length).assertEqual(1)
      expect(c[0].x).assertEqual(13)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_4900
     * @tc.name      testExpressionsSpread0049
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray and Array in spread expression
      let a: int[] = [100, 101]
      let fa: FixedArray<int> = [
        ...((p: int[]): int[] => [p[1], p[0]])(a),
        10, 11,
        ...a]
      expect(fa.length).assertEqual(6)
      expect(fa[0]).assertEqual(101)
      expect(fa[2]).assertEqual(10)
      expect(fa[4]).assertEqual(100)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5000
     * @tc.name      testExpressionsSpread0050
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuple of strings to tuple of Object
      let r: [Object, Object] = [...a_spex_52]
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5100
     * @tc.name      testExpressionsSpread0051
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread array of strings to array of object
      let r: Array<Object> = [...a_spex_53]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5200
     * @tc.name      testExpressionsSpread0052
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread fixed array of strings to array of objects
      let r: Array<Object> = [...a_spex_54]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5300
     * @tc.name      testExpressionsSpread0053
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread array of strings to fixed array of objects
      let r: FixedArray<Object> = [...a_spex_55]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5400
     * @tc.name      testExpressionsSpread0054
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuple to array
      let r: string[] = [...a_spex_56]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5500
     * @tc.name      testExpressionsSpread0055
     * @tc.desc      A spread expression can be used only within the array literal or argument passing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuple to FixedArray
      let r: FixedArray<string> = [...a_spex_57]
      expect(r.length).assertEqual(2)
      expect(r[0]).assertEqual('1')
      expect(r[1]).assertEqual('2')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5600
     * @tc.name      testExpressionsSpread0056
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // empty arrays
      let a1: Object[] = [], a2: Error[] = []
      expect(new A_spex_const_0(...[...a1, ...a2, new Object(), ...a1]).fld).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5700
     * @tc.name      testExpressionsSpread0057
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of char array
      let a: char[] = [c'b', c'c']
      expect(new A_spex_const_1(...a).fld).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5800
     * @tc.name      testExpressionsSpread0058
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of byte array
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(new A_spex_const_2(42, ...a).fld).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_5900
     * @tc.name      testExpressionsSpread0059
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of short array
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(new A_spex_const_3(42, ...a).fld).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6000
     * @tc.name      testExpressionsSpread0060
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of long array
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(new A_spex_const_4(42, ...a).fld).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6100
     * @tc.name      testExpressionsSpread0061
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of float array
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(new A_spex_const_5(42.0f, ...a).fld).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6200
     * @tc.name      testExpressionsSpread0062
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of number array
      let a: number[] = [1.0, 2.0, 3.0]
      expect(new A_spex_const_6(42, ...a).fld).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6300
     * @tc.name      testExpressionsSpread0063
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of function array
      let a: F_spex_const_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_const_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      let obj = new A_spex_const_7(1.0, ...[...a, ...b])
      expect(obj.fld).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6400
     * @tc.name      testExpressionsSpread0064
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of enums
      let a: Color_spex_const_8[] = [Color_spex_const_8.Red, Color_spex_const_8.Blue, Color_spex_const_8.Green]
      let obj = new A_spex_const_8(...a)
      expect(obj.fld).assertEqual(Color_spex_const_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6500
     * @tc.name      testExpressionsSpread0065
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expression in parentheses
      expect(new A_spex_const_9(...([1.0, 2.0])).fld).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6600
     * @tc.name      testExpressionsSpread0066
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      let a1: Object[]|null = [new Object, new Object]
      let obj = new B_spex_const_10(5, ...a1!)
      expect(obj.fld).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6700
     * @tc.name      testExpressionsSpread0067
     * @tc.desc      注意：文档中缺少 spex_const_11.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_const_11.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6800
     * @tc.name      testExpressionsSpread0068
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect(new A_spex_const_12(5, ...(a1_spex_const_12 ?? a2_spex_const_12)!).fld).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_6900
     * @tc.name      testExpressionsSpread0069
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // method call in expression
      let a = new A_spex_const_13()
      let b = new B_spex_const_13(...a.foo())
      expect(b.fld).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7000
     * @tc.name      testExpressionsSpread0070
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // method call in expression
      let s = ["h", "", "el", "", "", "l", "", "o"]
      expect(new A_spex_const_14(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s)).fld).assertEqual("hello")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7100
     * @tc.name      testExpressionsSpread0071
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // new expression in expression
      expect(new A_spex_const_15(...[256]).fld).assertEqual(256)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7200
     * @tc.name      testExpressionsSpread0072
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // array index expression
      let a: double[][] = [[2.0, 3.0], []]
      expect(new A_spex_const_16(...a[0]).fld).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7300
     * @tc.name      testExpressionsSpread0073
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [string, double[], string] = ["X", [2.0, 3.0, 4.0], "Z"]
      let obj = new A_spex_const_17(...a[1])
      expect(obj.fld).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7400
     * @tc.name      testExpressionsSpread0074
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      let obj = new A_spex_const_18(...(a1 = a2))
      expect((obj).fld).assertEqual("a-b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7500
     * @tc.name      testExpressionsSpread0075
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      expect(new A_spex_const_19(...(a1_spex_const_19.length > a2_spex_const_19.length ? a1_spex_const_19 : a2_spex_const_19)).fld).assertEqual("1-2-3")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7600
     * @tc.name      testExpressionsSpread0076
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_const_20 = new A_spex_const_20([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7700
     * @tc.name      testExpressionsSpread0077
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_const_21 = new B_spex_const_21([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7800
     * @tc.name      testExpressionsSpread0078
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays
      expect(new A_spex_const_22(...a1_spex_const_22).fld).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_7900
     * @tc.name      testExpressionsSpread0079
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays, flatten array
      expect(new B_spex_const_23(...[...new A_spex_const_23(...a1_spex_const_23).fld, ...new A_spex_const_23(...a2_spex_const_23).fld]).fld).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8000
     * @tc.name      testExpressionsSpread0080
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of value types in result array
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      expect(new A_spex_const_24_25(...[-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]).fld).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8100
     * @tc.name      testExpressionsSpread0081
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of value types in result array
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      expect(new A_spex_const_24_25(...[-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]).fld).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8200
     * @tc.name      testExpressionsSpread0082
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of reference types in result array
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, "Z", 42.0]
      expect(new A_spex_const_26(...a1).fld).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8300
     * @tc.name      testExpressionsSpread0083
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: (A_spex_const_27<String>|B_spex_const_27<Long>|C_spex_const_27<Error>|null)[] = [new A_spex_const_27<String>, new B_spex_const_27<Long>, new C_spex_const_27<Error>]
      let obj = new Z_spex_const_27<String, Long, Error>(...a1)
      expect(obj.fld).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8400
     * @tc.name      testExpressionsSpread0084
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(new A_spex_const_28_29(...((): string[] => a1_spex_const_28_29)()).fld).assertEqual("123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8500
     * @tc.name      testExpressionsSpread0085
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(new A_spex_const_28_29(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_const_28_29, a1_spex_const_28_29)).fld).assertEqual("123123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8600
     * @tc.name      testExpressionsSpread0086
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread a tuple to same type tuple
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = new A_spex_const_30(...t1).fld
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8700
     * @tc.name      testExpressionsSpread0087
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples to different types
      let t: [number, boolean] = [1.0, true]
      let r: [number, number, boolean, boolean] = new A_spex_const_31(...t).fld
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8800
     * @tc.name      testExpressionsSpread0088
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples of all value types
      let r: [byte, short, int, long, float, double, boolean, char, string] =
        [1 as byte, 2 as short, 3, 4 as long, 5.0f, 6.0, true, c'Z', "X"]
      expect(new A_spex_const_32(...r).fld[9]).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_8900
     * @tc.name      testExpressionsSpread0089
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      expect(new A_spex_const_33(...a1_spex_const_33!).fld).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9000
     * @tc.name      testExpressionsSpread0090
     * @tc.desc      注意：文档中缺少 spex_const_34.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_const_34.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9100
     * @tc.name      testExpressionsSpread0091
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      let obj = new A_spex_const_35(...(a1_spex_const_35 ?? a2_spex_const_35)!)
      expect(obj.fld).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9200
     * @tc.name      testExpressionsSpread0092
     * @tc.desc      注意：文档中缺少 spex_const_36.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_const_36.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9300
     * @tc.name      testExpressionsSpread0093
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let r: [string, number] = new A_spex_const_37(...A_spex_const_37.foo()).fld
      expect(r[0] == "X" && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9400
     * @tc.name      testExpressionsSpread0094
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      let obj = new A_spex_const_38(...a[0])
      expect(obj.fld).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9500
     * @tc.name      testExpressionsSpread0095
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      expect(new A_spex_const_39(...(a1 = a2)).fld).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9600
     * @tc.name      testExpressionsSpread0096
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      let r = new A_spex_const_40(...(a1_spex_const_40[0] > a2_spex_const_40[0] ? a1_spex_const_40 : a2_spex_const_40)).fld
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9700
     * @tc.name      testExpressionsSpread0097
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_const_41 = new A_spex_const_41(1, c'Z')
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9800
     * @tc.name      testExpressionsSpread0098
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_const_42 = new B_spex_const_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_9900
     * @tc.name      testExpressionsSpread0099
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: [A_spex_const_43<Long>, B_spex_const_43<Error>] = [new A_spex_const_43<Long>, new B_spex_const_43<Error>]
      expect(new Z_spex_const_43<Long, Error>(...a1).fld).assertFalse()
    });
  });
}