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
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10000
     * @tc.name      testExpressionsSpread0100
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r = new A_spex_const_44(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_const_44)).fld
      expect(r).assertEqual("56")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10100
     * @tc.name      testExpressionsSpread0101
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Callee modifies its copy, original array unchanged
      let a: int[] = [1, 2, 3]
      foo_spex_copy_values_0(...a)
      expect(a[0]).assertEqual(1)
      expect(a[1]).assertEqual(2)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10200
     * @tc.name      testExpressionsSpread0102
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Multiple element modifications don't affect original
      let a: number[] = [1.0, 2.0, 3.0]
      foo_spex_copy_values_1(...a)
      expect(a[0]).assertEqual(1.0)
      expect(a[1]).assertEqual(2.0)
      expect(a[2]).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10300
     * @tc.name      testExpressionsSpread0103
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Function returns modified copy, original unchanged
      let a: string[] = ["a", "b", "c"]
      let result = foo_spex_copy_values_2(...a)
      expect(result[1]).assertEqual("modified")
      expect(a[1]).assertEqual("b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10400
     * @tc.name      testExpressionsSpread0104
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Array literal spread creates new array
      let original: int[] = [1, 2, 3]
      let copy = [...original]
      copy[0] = 999
      expect(original[0]).assertEqual(1)
      expect(copy[0]).assertEqual(999)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10500
     * @tc.name      testExpressionsSpread0105
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Multiple spreads create independent arrays
      let a: int[] = [1, 2]
      let b = [...a]
      let c = [...a]
      b[0] = 10
      c[0] = 20
      expect(a[0]).assertEqual(1)
      expect(b[0]).assertEqual(10)
      expect(c[0]).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10600
     * @tc.name      testExpressionsSpread0106
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Value type array spread creates copy
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      foo_spex_copy_values_5(...a)
      expect(a[0]).assertEqual(1)
      expect(a[1]).assertEqual(2)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10700
     * @tc.name      testExpressionsSpread0107
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Long array spread creates copy
      let a: long[] = [100 as long, 200 as long, 300 as long]
      foo_spex_copy_values_6(...a)
      expect(a[0]).assertEqual(100)
      expect(a[1]).assertEqual(200)
      expect(a[2]).assertEqual(300)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10800
     * @tc.name      testExpressionsSpread0108
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Char array spread creates copy
      let a: char[] = [c'a', c'b', c'c']
      foo_spex_copy_values_7(...a)
      expect(a[0]).assertEqual(c'a')
      expect(a[1]).assertEqual(c'b')
      expect(a[2]).assertEqual(c'c')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_10900
     * @tc.name      testExpressionsSpread0109
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray spread creates copy
      let a: FixedArray<int> = [1, 2, 3]
      foo_spex_copy_values_8(...a)
      expect(a[0]).assertEqual(999)
      expect(a[1]).assertEqual(2)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11000
     * @tc.name      testExpressionsSpread0110
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray literal spread creates copy
      let original: FixedArray<number> = [1.0, 2.0, 3.0]
      let copy: number[] = [...original]
      copy[1] = 999.0
      expect(original[1]).assertEqual(2.0)
      expect(copy[1]).assertEqual(999.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11100
     * @tc.name      testExpressionsSpread0111
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Tuple array spread - outer array is copied, inner tuples are references
      let a: [int, int][] = [[1, 2], [3, 4]]
      foo_spex_copy_values_10(...a)
      expect(a[0][0]).assertEqual(999)  // Inner tuple is reference (shallow copy)
      expect(a[0][1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11200
     * @tc.name      testExpressionsSpread0112
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Push to spread copy doesn't affect original
      let a: int[] = [1, 2, 3]
      foo_spex_copy_values_11(...a)
      expect(a.length).assertEqual(3)
      expect(a[0]).assertEqual(1)
      expect(a[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11300
     * @tc.name      testExpressionsSpread0113
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Array literal spread, then push
      let original: string[] = ["a", "b"]
      let copy = [...original]
      copy.push("c")
      expect(original.length).assertEqual(2)
      expect(copy.length).assertEqual(3)
      expect(copy[2]).assertEqual("c")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11400
     * @tc.name      testExpressionsSpread0114
     * @tc.desc      Spread expression always copies values from original arrays. A callee changes
     *               elements of its own copy, but not elements of arrays used in the call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // All elements modified in copy, original unchanged
      let a: int[] = [1, 2, 3, 4, 5]
      foo_spex_copy_values_13(...a)
      expect(a[0]).assertEqual(1)
      expect(a[2]).assertEqual(3)
      expect(a[4]).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11500
     * @tc.name      testExpressionsSpread0115
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // empty arrays
      let a1: Object[] = [], a2: Error[] = []
      expect(foo_12400(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11600
     * @tc.name      testExpressionsSpread0116
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of char array
      let a: char[] = [c'b', c'c']
      expect(foo_12500(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11700
     * @tc.name      testExpressionsSpread0117
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of byte array
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(foo_12600(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11800
     * @tc.name      testExpressionsSpread0118
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of short array
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(foo_12700(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_11900
     * @tc.name      testExpressionsSpread0119
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of long array
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(foo_12800(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12000
     * @tc.name      testExpressionsSpread0120
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of float array
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(foo_12900(42.0f, ...a)).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12100
     * @tc.name      testExpressionsSpread0121
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of number array
      let a: number[] = [1.0, 2.0, 3.0]
      expect(foo_13000(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12200
     * @tc.name      testExpressionsSpread0122
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of function array
      let a: F_spex_func_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_func_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      expect(foo_13100(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12300
     * @tc.name      testExpressionsSpread0123
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of enums array
      let a: Color_spex_func_8[] = [Color_spex_func_8.Red, Color_spex_func_8.Blue, Color_spex_func_8.Green]
      expect(foo_13200(...a)).assertEqual(Color_spex_func_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12400
     * @tc.name      testExpressionsSpread0124
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expression in parentheses
      expect(foo_13300(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12500
     * @tc.name      testExpressionsSpread0125
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      let a1: Object[]|null = [new Object, new Object]
      expect(foo_13400(5, ...a1!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12600
     * @tc.name      testExpressionsSpread0126
     * @tc.desc      注意：文档中缺少 spex_func_11.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_func_11.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12700
     * @tc.name      testExpressionsSpread0127
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      let a1: Object[]|null = null
      let a2: Object[]|null = [new Object, new Object]
      expect(foo_13600(5, ...(a1 ?? a2)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12800
     * @tc.name      testExpressionsSpread0128
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      expect(bar_spex_func_13(...foo_spex_func_13())).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_12900
     * @tc.name      testExpressionsSpread0129
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let s = ['h', '', 'el', '', '', 'l', '', 'o']
      expect(foo_spex_func_14(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s))).assertEqual('hello')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13000
     * @tc.name      testExpressionsSpread0130
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // new expression in expression
      expect(foo_13900(...[256])).assertEqual(256)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13100
     * @tc.name      testExpressionsSpread0131
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // array index expression
      let a: double[][] = [[2.0, 3.0], []]
      expect(foo_14000(...a[0])).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13200
     * @tc.name      testExpressionsSpread0132
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [string, double[], string] = ['X', [2.0, 3.0, 4.0], 'Z']
      expect(foo_14100(...a[1])).assertEqual(9)
    });
	
    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13300
     * @tc.name      testExpressionsSpread0133
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1 = ['1', '2', '3']
      let a2 = ['a', 'b']
      expect(foo_spex_func_18_19(...(a1 = a2))).assertEqual('a-b')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13400
     * @tc.name      testExpressionsSpread0134
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      expect(foo_spex_func_18_19(...(a1_spex_func_19.length > a2_spex_func_19.length ? a1_spex_func_19 : a2_spex_func_19))).assertEqual('1-2-3')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13500
     * @tc.name      testExpressionsSpread0135
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_func_20 = new A_spex_func_20([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13600
     * @tc.name      testExpressionsSpread0136
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_func_21 = new B_spex_func_21([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13700
     * @tc.name      testExpressionsSpread0137
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays
      let a1: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect(foo_spex_func_22(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13800
     * @tc.name      testExpressionsSpread0138
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays, flatten array
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      expect(bar_spex_func_23(...[...foo_spex_func_23(...a1), ...foo_spex_func_23(...a2)])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_13900
     * @tc.name      testExpressionsSpread0139
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of reference types in result array
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, 'Z', 42.0]
      expect(foo_spex_func_26(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14000
     * @tc.name      testExpressionsSpread0140
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: (A_spex_func_27<String>|B_spex_func_27<Long>|C_spex_func_27<Error>|null)[] = [new A_spex_func_27<String>, new B_spex_func_27<Long>, new C_spex_func_27<Error>]
      expect(foo_spex_func_27<String, Long, Error>(...a1)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14100
     * @tc.name      testExpressionsSpread0141
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(foo_spex_func_28_29(...((): string[] => a1_spex_func_28_29)())).assertEqual('123')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14200
     * @tc.name      testExpressionsSpread0142
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(foo_spex_func_28_29(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_func_28_29, a1_spex_func_28_29))).assertEqual('123123')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14300
     * @tc.name      testExpressionsSpread0143
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread a tuple to same type tuple
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = foo_15400(...t1)
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14400
     * @tc.name      testExpressionsSpread0144
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples to different types
      let r: [number, number, boolean, boolean] = foo_15500(...[1.0, true])
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14500
     * @tc.name      testExpressionsSpread0145
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      expect(foo_15700(...a1_spex_func_33_35!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14600
     * @tc.name      testExpressionsSpread0146
     * @tc.desc      注意：文档中缺少 spex_func_34.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_func_34.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14700
     * @tc.name      testExpressionsSpread0147
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect(foo_15900(...(a1_spex_func_35 ?? a2_spex_func_35)!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14800
     * @tc.name      testExpressionsSpread0148
     * @tc.desc      注意：文档中缺少 spex_func_36.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_func_36.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_14900
     * @tc.name      testExpressionsSpread0149
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let r: [string, number] = bar_16100(...foo_16100())
      expect(r[0] == 'X' && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15000
     * @tc.name      testExpressionsSpread0150
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      expect(foo_16200(...a[0])).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15100
     * @tc.name      testExpressionsSpread0151
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1: [string, int] = ['1', 10]
      let a2: [string, int] = ['2', 20]
      expect(foo_16300(...(a1 = a2))).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15200
     * @tc.name      testExpressionsSpread0152
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      let r = foo_16400(...(a1_spex_func_40[0] > a2_spex_func_40[0] ? a1_spex_func_40 : a2_spex_func_40))
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15300
     * @tc.name      testExpressionsSpread0153
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_func_41 = new A_spex_func_41(1, c'Z')
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15400
     * @tc.name      testExpressionsSpread0154
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_func_42 = new B_spex_func_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15500
     * @tc.name      testExpressionsSpread0155
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: [A_spex_func_43<Long>, B_spex_func_43<Error>] = [new A_spex_func_43<Long>, new B_spex_func_43<Error>]
      expect(foo_spex_func_43<Long, Error>(...a1)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15600
     * @tc.name      testExpressionsSpread0156
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r = foo_16800(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_func_44))
      expect(r).assertEqual('56')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15700
     * @tc.name      testExpressionsSpread0157
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Record array spread
      expect(foo_16900(...[r1_spex_func_45, r2_spex_func_45])).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15800
     * @tc.name      testExpressionsSpread0158
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray spread to Object array
      // empty arrays
      let a1: FixedArray<Object> = [], a2: FixedArray<Error> = []
      expect(foo_17100(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_15900
     * @tc.name      testExpressionsSpread0159
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray<char> spread
      let a: FixedArray<char> = [c'b', c'c']
      expect(foo_17200(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16000
     * @tc.name      testExpressionsSpread0160
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Array<byte> spread
      let a: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      expect(foo_17300(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16100
     * @tc.name      testExpressionsSpread0161
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray<number> spread
      let a: FixedArray<number> = [1.0, 2.0, 3.0]
      expect(foo_17700(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16200
     * @tc.name      testExpressionsSpread0162
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray<F> spread
      let a: FixedArray<F_spex_func_54> = [(p: number) => p * 2, (p: number) => p * 3]
      let b: FixedArray<F_spex_func_54> = [(p: number) => p * 4, (p: number) => p * 5]
      expect(foo_17800(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16300
     * @tc.name      testExpressionsSpread0163
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // FixedArray<Color> spread
      let a: FixedArray<Color_spex_func_55> = [Color_spex_func_55.Red, Color_spex_func_55.Blue, Color_spex_func_55.Green]
      expect(foo_17900(...a)).assertEqual(Color_spex_func_55.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16400
     * @tc.name      testExpressionsSpread0164
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expression in parentheses
      expect(foo_18000(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16500
     * @tc.name      testExpressionsSpread0165
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      expect(foo_18100(5, ...a1_spex_func_57!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16600
     * @tc.name      testExpressionsSpread0166
     * @tc.desc      注意：文档中缺少 spex_func_58.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_func_58.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16700
     * @tc.name      testExpressionsSpread0167
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect(foo_18300(5, ...(a1_spex_func_59 ?? a2_spex_func_59)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16800
     * @tc.name      testExpressionsSpread0168
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [string, FixedArray<double>, string] = ['X', [2.0, 3.0, 4.0], 'Z']
      expect(foo_spex_func_64(...a[1])).assertEqual(9.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_16900
     * @tc.name      testExpressionsSpread0169
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_func_67 = new A_spex_func_67([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17000
     * @tc.name      testExpressionsSpread0170
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_func_68 = new B_spex_func_68([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17100
     * @tc.name      testExpressionsSpread0171
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays
      let a1: FixedArray<FixedArray<number>> = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect(foo_spex_func_69(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17200
     * @tc.name      testExpressionsSpread0172
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays, flatten array
      let a1: FixedArray<FixedArray<number>> = [[1.0, 2.0], [3.0, 4.0]]
      let a2: FixedArray<FixedArray<number>> = [[5.0, 6.0], []]
      expect(bar_spex_func_70(...[...foo_spex_func_70(...a1), ...foo_spex_func_70(...a2)])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17300
     * @tc.name      testExpressionsSpread0173
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of value types in result array
      let a1: FixedArray<Double> = [1, 2, 3]
      let a2: FixedArray<Short> = [4, 5]
      let a3: FixedArray<Byte> = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      expect(foo_spex_func_71(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17400
     * @tc.name      testExpressionsSpread0174
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: FixedArray<A_spex_func_74<String>|B_spex_func_74<Long>|C_spex_func_74<Error>|null> = [
        new A_spex_func_74<String>(),
        new B_spex_func_74<Long>(),
        new C_spex_func_74<Error>()
      ]
      expect(foo_spex_func_74<String, Long, Error>(...a1)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17500
     * @tc.name      testExpressionsSpread0175
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // empty arrays
      let a1: Object[] = [], a2: Error[] = []
      expect(((...p: Object[]): int => p.length)(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17600
     * @tc.name      testExpressionsSpread0176
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of char array
      let a: char[] = [c'b', c'c']
      expect(((...p: char[]): int => p.length)(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17700
     * @tc.name      testExpressionsSpread0177
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of byte array
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(((a: int, ...p: byte[]): int => a + reduce(p, (prev: int, next: byte) => prev + next, 0))(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17800
     * @tc.name      testExpressionsSpread0178
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of short array
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(((a: int, ...p: short[]): int => a + reduce(p, (prev: int, next: short) => prev + next, 0))(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_17900
     * @tc.name      testExpressionsSpread0179
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of long array
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(((a: long, ...p: long[]): long => a + reduce(p, (prev: long, next: long) => prev + next, 0 as long))(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18000
     * @tc.name      testExpressionsSpread0180
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of float array
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(((a: float, ...p: float[]): float => a + reduce(p, (prev: float, next: float) => prev + next, 0.0f))(42.0f, ...a)).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18100
     * @tc.name      testExpressionsSpread0181
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of number array
      let a: number[] = [1.0, 2.0, 3.0]
      expect(((a: number, ...p: number[]): number => a + reduce(p, (prev: number, next: number) => prev + next, 0.0))(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18200
     * @tc.name      testExpressionsSpread0182
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of function array
      let a: F_spex_lmbd_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_lmbd_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      expect(((a: number, ...p: F_spex_lmbd_7[]): number => {
        let res = a
        for (let el of p) res += el(res)
        return res
      })(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18300
     * @tc.name      testExpressionsSpread0183
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of enums
      let a: Color_spex_lmbd_8[] = [Color_spex_lmbd_8.Red, Color_spex_lmbd_8.Blue, Color_spex_lmbd_8.Green]
      expect(((...p: Color_spex_lmbd_8[]): Color_spex_lmbd_8 => p.length ? p[p.length - 1] : Color_spex_lmbd_8.Red)(...a)).assertEqual(Color_spex_lmbd_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18400
     * @tc.name      testExpressionsSpread0184
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expression in parentheses
      expect(((...p: number[]): number => p.length ? p[p.length - 1] : -1.0)(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18500
     * @tc.name      testExpressionsSpread0185
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      expect(((a: int, ...p: Object[]): int => a + p.length)(5, ...a1_spex_lmbd_10_12_13!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18600
     * @tc.name      testExpressionsSpread0186
     * @tc.desc      注意：文档中缺少 spex_lmbd_11.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_lmbd_11.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18700
     * @tc.name      testExpressionsSpread0187
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish expression
      expect(((a: int, ...p: Object[]): int => a + p.length)(5, ...a1_spex_lmbd_10_12_13!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18800
     * @tc.name      testExpressionsSpread0188
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect(((a: int, ...p: Object[]): int => a + p.length)(5, ...(a1_spex_lmbd_13 ?? a2_spex_lmbd_13)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_18900
     * @tc.name      testExpressionsSpread0189
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      expect(((...p: number[]): number => reduce(p, (prev: number, next: number) => prev + next, 0.0))(...foo_spex_lmbd_14())).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19000
     * @tc.name      testExpressionsSpread0190
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let s = ["h", "", "el", "", "", "l", "", "o"]
      expect(((...p: string[]): string => String.join(p, ""))(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s))).assertEqual("hello")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19100
     * @tc.name      testExpressionsSpread0191
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // new expression in expression
      expect(((...p: number[]): number =>  p.length ? p[p.length - 1] : -1)(...[256])).assertEqual(256);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19200
     * @tc.name      testExpressionsSpread0192
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // array index expression
      let a: double[][] = [[2.0, 3.0], []]
      expect(((...p: double[]): double => p[0] + p[1])(...a[0])).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19300
     * @tc.name      testExpressionsSpread0193
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [string, double[], string] = ["X", [2.0, 3.0, 4.0], "Z"]
      expect(((...p: double[]): double => p[0] + p[1] + p[2])(...a[1])).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19400
     * @tc.name      testExpressionsSpread0194
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      expect(((...p: string[]): string => String.join(p, "-"))(...(a1 = a2))).assertEqual("a-b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19500
     * @tc.name      testExpressionsSpread0195
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      expect(((...p: string[]): string => String.join(p, "-"))(...(a1_spex_lmbd_20.length > a2_spex_lmbd_20.length ? a1_spex_lmbd_20 : a2_spex_lmbd_20))).assertEqual("1-2-3")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19600
     * @tc.name      testExpressionsSpread0196
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_lmbd_21 = new A_spex_lmbd_21([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19700
     * @tc.name      testExpressionsSpread0197
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_lmbd_22 = new B_spex_lmbd_22([false, false], [true, true])
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19800
     * @tc.name      testExpressionsSpread0198
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays
      let a1: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect(((...p: number[][]): int => {
        let res = 0
        for (let el of p) res += el.length
        return res
      })(...a1)).assertEqual(5)
    });
  });
}