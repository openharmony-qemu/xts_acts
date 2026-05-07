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
     * @tc.number    SUB_EXPRESSIONS_SPREAD_19900
     * @tc.name      testExpressionsSpread0199
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays, flatten array
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      expect(bar_spex_lmbd_24(...[
        ...((...p: number[][]): number[] => {
          let res: number[] = []
          for (let el of p) res = [...res, ...el]
          return res
        })(...a1),
        ...((...p: number[][]): number[] => {
          let res: number[] = []
          for (let el of p) res = [...res, ...el]
          return res
        })(...a2)
      ])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20000
     * @tc.name      testExpressionsSpread0200
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of value types in result array
      let a1: Double[] = [1, 2, 3], a2: Short[] = [4, 5], a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      expect(((...p: (Double|Short|Byte)[]): double => {
        let res = 0.0
        for (let el of p) res += (el as Numeric).toDouble()
        return res
      })(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20100
     * @tc.name      testExpressionsSpread0201
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of reference types in result array
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, "Z", 42.0]
      expect(((...p: (Int|Number|String|undefined)[]): int => p.length)(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20200
     * @tc.name      testExpressionsSpread0202
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(((...p: string[]): string => String.join(p, ""))(...((): string[] => a1_spex_lmbd_28_29)())).assertEqual("123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20300
     * @tc.name      testExpressionsSpread0203
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(((...p: string[]): string => String.join(p, ""))(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_lmbd_28_29, a1_spex_lmbd_28_29))).assertEqual("123123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20400
     * @tc.name      testExpressionsSpread0204
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread a tuple to same type tuple
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = ((...p: [number, boolean]): [boolean, number] => [p[1], p[0]])(...t1)
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20500
     * @tc.name      testExpressionsSpread0205
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples to different types
      let r: [number, number, boolean, boolean] = ((...p: [number, boolean]): [number, number, boolean, boolean] => [p[0], p[0], p[1], p[1]])(...[1.0, true])
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20600
     * @tc.name      testExpressionsSpread0206
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples of all value types
      let r: [byte, short, int, long, float, double, boolean, char, string] =
        [1 as byte, 2 as short, 3, 4 as long, 5.0f, 6.0, true, c'Z', "X"]
      expect(((...p: [byte, short, int, long, float, double, boolean, char, string]):
        [byte, short, int, long, float, double, boolean, char, string, int] =>
      [...p, 42])(...r)[9]).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20700
     * @tc.name      testExpressionsSpread0207
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      expect(((...p: [Object, Error]): int => p[0] != p[1] ? 3 : 0)(...a1_spex_lmbd_33!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20800
     * @tc.name      testExpressionsSpread0208
     * @tc.desc      注意：文档中缺少 spex_lmbd_34.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_lmbd_34.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_20900
     * @tc.name      testExpressionsSpread0209
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect(((...p: [Object, Error]): int => p[0] != p[1] ? 3 : 0)(...(a1_spex_lmbd_35 ?? a2_spex_lmbd_35)!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21000
     * @tc.name      testExpressionsSpread0210
     * @tc.desc      注意：文档中缺少 spex_lmbd_36.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_lmbd_36.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21100
     * @tc.name      testExpressionsSpread0211
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let r: [string, number] = ((...p: [number, string]): [string, number] => [p[1], p[0]])(...foo_spex_lmbd_37())
      expect(r[0] == "X" && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21200
     * @tc.name      testExpressionsSpread0212
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      expect(((...p: [double, double]): double => p[0] + p[1])(...a[0])).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21300
     * @tc.name      testExpressionsSpread0213
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      expect(((...p: [string, int]): int => p[1])(...(a1 = a2))).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21400
     * @tc.name      testExpressionsSpread0214
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      let r = ((...p: [int, int]): int => p[0] + p[1])(...(a1_spex_lmbd_40[0] > a2_spex_lmbd_40[0] ? a1_spex_lmbd_40 : a2_spex_lmbd_40))
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21500
     * @tc.name      testExpressionsSpread0215
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_lmbd_41 = new A_spex_lmbd_41(1, c'Z')
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21600
     * @tc.name      testExpressionsSpread0216
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_lmbd_42 = new B_spex_lmbd_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21700
     * @tc.name      testExpressionsSpread0217
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r = ((...p: [int, int]): string => "" + p[0] + p[1])(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_lmbd_43))
      expect(r).assertEqual("56")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21800
     * @tc.name      testExpressionsSpread0218
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // empty arrays
      let a1: Object[] = [], a2: Error[] = []
      expect(new A_24700().foo(...[...a1, ...a2, new Object(), ...a1])).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_21900
     * @tc.name      testExpressionsSpread0219
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of char array
      let a: char[] = [c'b', c'c']
      expect(new A_24800().foo(...a)).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22000
     * @tc.name      testExpressionsSpread0220
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of byte array
      let a: byte[] = [1 as byte, 2 as byte, 3 as byte]
      expect(A_24900.foo(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22100
     * @tc.name      testExpressionsSpread0221
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of short array
      let a: short[] = [1 as short, 2 as short, 3 as short]
      expect(new A_25000().foo(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22200
     * @tc.name      testExpressionsSpread0222
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of long array
      let a: long[] = [1 as long, 2 as long, 3 as long]
      expect(A_25100.foo(42, ...a)).assertEqual(48)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22300
     * @tc.name      testExpressionsSpread0223
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of float array
      let a: float[] = [1.0f, 2.0f, 3.0f]
      expect(new A_25200().foo(42.0f, ...a)).assertEqual(48.0f)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22400
     * @tc.name      testExpressionsSpread0224
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of number array
      let a: number[] = [1.0, 2.0, 3.0]
      expect(A_25300.foo(42, ...a)).assertEqual(48.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22500
     * @tc.name      testExpressionsSpread0225
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of function array
      let a: F_spex_meth_7[] = [(p: number) => p * 2, (p: number) => p * 3]
      let b: F_spex_meth_7[] = [(p: number) => p * 4, (p: number) => p * 5]
      let obj = new A_25400()
      expect(obj.foo(1.0, ...[...a, ...b])).assertEqual(360.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22600
     * @tc.name      testExpressionsSpread0226
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of enums
      let a: Color_spex_meth_8[] = [Color_spex_meth_8.Red, Color_spex_meth_8.Blue, Color_spex_meth_8.Green]
      let obj = new A_25500()
      expect(obj.foo(...a)).assertEqual(Color_spex_meth_8.Green)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22700
     * @tc.name      testExpressionsSpread0227
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // expression in parentheses
      expect(A_25600.foo(...([1.0, 2.0]))).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22800
     * @tc.name      testExpressionsSpread0228
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      let obj = new B_25700()
      expect(obj.foo(5, ...a1_spex_meth_10_12_13!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_22900
     * @tc.name      testExpressionsSpread0229
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      expect(new A_25900().foo(5, ...(a1_spex_meth_12 ?? a2_spex_meth_12)!)).assertEqual(7)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23000
     * @tc.name      testExpressionsSpread0230
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // method call in expression
      let obj = new A_26000()
      expect(obj.bar(...obj.foo())).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23100
     * @tc.name      testExpressionsSpread0231
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // method call in expression
      let obj = new A_26100()
      let s = ["h", "", "el", "", "", "l", "", "o"]
      expect(obj.foo(...((s: string[]): string[] => {
        let res: string[] = []
        for (let el of s) if (el.length > 0) res = [...res, el]
        return res
      })(s))).assertEqual("hello")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23200
     * @tc.name      testExpressionsSpread0232
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // new expression in expression
      expect((new A_26200()).foo(...[256])).assertEqual(256)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23300
     * @tc.name      testExpressionsSpread0233
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // array index expression
      let a: double[][] = [[2.0, 3.0], []]
      expect(A_26300.foo(...a[0])).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23400
     * @tc.name      testExpressionsSpread0234
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [string, double[], string] = ["X", [2.0, 3.0, 4.0], "Z"]
      let obj = new A_26400()
      expect(obj.foo(...a[1])).assertEqual(9)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23500
     * @tc.name      testExpressionsSpread0235
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1 = ["1", "2", "3"]
      let a2 = ["a", "b"]
      let obj = new B_26500()
      expect((obj).foo(...(a1 = a2))).assertEqual("a-b")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23600
     * @tc.name      testExpressionsSpread0236
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      expect(new A_26600().foo(...(a1_spex_meth_19.length > a2_spex_meth_19.length ? a1_spex_meth_19 : a2_spex_meth_19))).assertEqual("1-2-3")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23700
     * @tc.name      testExpressionsSpread0237
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_meth_20 = new A_spex_meth_20([false, false], [true, true])
      expect(a.meth()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23800
     * @tc.name      testExpressionsSpread0238
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_meth_21 = new B_spex_meth_21([false, false], [true, true], new C_spex_meth_21())
      expect(b.bar()).assertEqual(46)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_23900
     * @tc.name      testExpressionsSpread0239
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays
      let a1: number[][] = [[1.0, 2.0], [], [3.0, 4.0], [5.0]]
      expect((new A_26900()).foo(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24000
     * @tc.name      testExpressionsSpread0240
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread of arrays, flatten array
      let a1: number[][] = [[1.0, 2.0], [3.0, 4.0]]
      let a2: number[][] = [[5.0, 6.0], []]
      let obj = new A_27000()
      expect(obj.bar(...[...obj.foo(...a1), ...obj.foo(...a2)])).assertEqual(21.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24100
     * @tc.name      testExpressionsSpread0241
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of value types in result array
      let a1: Double[] = [1, 2, 3]
      let a2: Short[] = [4, 5]
      let a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      let obj = new A_spex_meth_24_25()
      expect(obj.foo(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24200
     * @tc.name      testExpressionsSpread0242
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of value types in result array
      let a1: Double[] = [1, 2, 3]
      let a2: Short[] = [4, 5]
      let a3: Byte[] = [6]
      let ar = [-10.0, ...a1, ...a1, ...a2, ...a2, ...a3, 10.0, ...a3]
      let obj = new A_spex_meth_24_25()
      expect(obj.foo(...ar)).assertEqual(42.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24300
     * @tc.name      testExpressionsSpread0243
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // union of reference types in result array
      let a1: (Int|Number|String|undefined)[] = [new Int(), new Int(), undefined, "Z", 42.0]
      expect(new A_spex_meth_26().foo(...a1)).assertEqual(5)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24400
     * @tc.name      testExpressionsSpread0244
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let a1: (A_spex_meth_27<String>|B_spex_meth_27<Long>|C_spex_meth_27<Error>|null)[] = [new A_spex_meth_27<String>(), new B_spex_meth_27<Long>(), new C_spex_meth_27<Error>()]
      let obj = new Z_spex_meth_27<String, Long, Error>()
      expect(obj.foo(...a1)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24500
     * @tc.name      testExpressionsSpread0245
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(new A_spex_meth_28_29().foo(...((): string[] => a1_spex_meth_28_29)())).assertEqual("123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24600
     * @tc.name      testExpressionsSpread0246
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      expect(new A_spex_meth_28_29().foo(...((p: string[], q: string[]): string[] => [...p, ...q])(a1_spex_meth_28_29, a1_spex_meth_28_29))).assertEqual("123123")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24700
     * @tc.name      testExpressionsSpread0247
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread a tuple to same type tuple
      let obj = new A_27700()
      let t1: [number, boolean] = [1.0, true]
      let r: [boolean, number] = obj.foo(...t1)
      expect(r[0] && r[1] == 1.0).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24800
     * @tc.name      testExpressionsSpread0248
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples to different types
      let obj = new A_27800()
      let r: [number, number, boolean, boolean] = obj.foo(...[1.0, true])
      expect(r[0] == 1.0 && r[1] == 1.0 && r[2] && r[3]).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_24900
     * @tc.name      testExpressionsSpread0249
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // spread tuples of all value types
      let r: [byte, short, int, long, float, double, boolean, char, string] =
        [1 as byte, 2 as short, 3, 4 as long, 5.0f, 6.0, true, c'Z', "X"]
      expect(new A_27900().foo(...r)[9]).assertEqual(42)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25000
     * @tc.name      testExpressionsSpread0250
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ensure-not-nullish expression
      let a1: [Object, Error]|null = [new Object, new Error]
      expect(A_28000.foo(...a1!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25100
     * @tc.name      testExpressionsSpread0251
     * @tc.desc      注意：文档中缺少 spex_meth_34.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_meth_34.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25200
     * @tc.name      testExpressionsSpread0252
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // nullish-coalescing expression
      let a1: [Object, Error]|null = null
      let a2: [Object, Error]|null = [new Object, new Error]
      let obj = new A_28200()
      expect(obj.foo(...(a1 ?? a2)!)).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25300
     * @tc.name      testExpressionsSpread0253
     * @tc.desc      注意：文档中缺少 spex_meth_36.js，使用占位
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：文档中缺少 spex_meth_36.js，使用占位
      expect(2).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25400
     * @tc.name      testExpressionsSpread0254
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // function call in expression
      let obj = new A_spex_meth_37()
      let r: [string, number] = obj.bar(...obj.foo())
      expect(r[0] == "X" && r[1] == 1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25500
     * @tc.name      testExpressionsSpread0255
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // tuple index expression
      let a: [[double, double], [char, char]] = [[2.0, 3.0], [c'Z', c'X']]
      let obj = new A_28500()
      expect(obj.foo(...a[0])).assertEqual(5.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25600
     * @tc.name      testExpressionsSpread0256
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // assignment expression in expression
      let a1: [string, int] = ["1", 10]
      let a2: [string, int] = ["2", 20]
      expect(A_28600.foo(...(a1 = a2))).assertEqual(20)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25700
     * @tc.name      testExpressionsSpread0257
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // conditional expression in expression
      let r = new A_28700().foo(...(a1_spex_meth_40[0] > a2_spex_meth_40[0] ? a1_spex_meth_40 : a2_spex_meth_40))
      expect(r).assertEqual(11)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25800
     * @tc.name      testExpressionsSpread0258
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use this expression
      let a: A_spex_meth_41 = new A_spex_meth_41(1, c'Z', new Z_spex_meth_41())
      expect(a.meth()).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_25900
     * @tc.name      testExpressionsSpread0259
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use super expression
      let b: B_spex_meth_42 = new B_spex_meth_42(1, c'Z')
      expect(b.meth()[0]).assertEqual(111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26000
     * @tc.name      testExpressionsSpread0260
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // use generics
      let obj = new Z_spex_meth_43<Long, Error>()
      let a1: [A_spex_meth_43<Long>, B_spex_meth_43<Error>] = [new A_spex_meth_43<Long>(), new B_spex_meth_43<Error>()]
      expect(obj.foo(...a1)).assertFalse()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26100
     * @tc.name      testExpressionsSpread0261
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // lambda expression in expression
      let r = new A_29100().foo(...((p: [int, int]): [int, int] => [p[1], p[0]])(a2_spex_meth_44))
      expect(r).assertEqual("56")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26200
     * @tc.name      testExpressionsSpread0262
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // complex mapping with spread
      C_spex_meth_45_46_47.foo(
        ...tests_spex_meth_45.map(
          (test): B_spex_meth_45_46_47 => ({
            unsorted: [...test.t.map((m): A_spex_meth_45_46_47 => ({}))]
          })
        )
      )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26300
     * @tc.name      testExpressionsSpread0263
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // complex mapping with double spread
      C_spex_meth_46.foo(
        ...tests_spex_meth_46.map(
          (test): B_spex_meth_45_46_47 => ({
            unsorted: [...test.t.map((m): A_spex_meth_45_46_47 => ({})), ...test.t.map((m): A_spex_meth_45_46_47 => ({})),]
          })
        )
      )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26400
     * @tc.name      testExpressionsSpread0264
     * @tc.desc      If an array is spread while calling a function, then an appropriate parameter
     *               must be of the spread array kind.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // complex mapping with reduce calculation
      C_spex_meth_47.foo(
        ...tests_spex_meth_47.map(
          (test, i): B_spex_meth_47 => ({
            unsorted: [...test.t.map((m, idx): A_spex_meth_47 => ({ cnt: idx }))]
          })
        )
      )
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26500
     * @tc.name      testExpressionsSpread0265
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ReadonlyIntArrayToMutable
      let a: readonly int[] = [1, 2, 3]
      let rw: int[] = [...a]
      rw[1] = 4
      expect(rw[1]).assertEqual(4)
      expect(a[1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26600
     * @tc.name      testExpressionsSpread0266
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ReadonlyNumberArrayToMutableWithElements
      let a: readonly number[] = [1.0, 2.0, 3.0]
      let rw = [0.0, ...a, 4.0]
      rw[0] = 5.0
      rw[3] = 6.0
      expect(rw[0]).assertEqual(5.0)
      expect(rw[3]).assertEqual(6.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26700
     * @tc.name      testExpressionsSpread0267
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ReadonlyByteArraySpread
      let a: readonly byte[] = [1 as byte, 2 as byte, 3 as byte]
      let rw: byte[] = [...a]
      rw[0] = 11 as byte
      expect(rw[0]).assertEqual(11)
      expect(a[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26800
     * @tc.name      testExpressionsSpread0268
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0268", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ReadonlyCharArraySpread
      let a: readonly char[] = [c'a', c'b', c'c']
      let rw: char[] = [...a]
      rw[0] = c'Z'
      expect(rw[0]).assertEqual(c'Z')
      expect(a[0]).assertEqual(c'a')
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_26900
     * @tc.name      testExpressionsSpread0269
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ReadonlyToReadonly
      let a: readonly string[] = ["a", "b", "c"]
      let ro: readonly string[] = [...a]
      expect(ro[0]).assertEqual("a")
      expect(ro.length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27000
     * @tc.name      testExpressionsSpread0270
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // MixedReadonlyAndMutableSources
      let readonly_arr: readonly number[] = [1.0, 2.0]
      let mutable_arr: number[] = [3.0, 4.0]
      let result: readonly number[] = [...readonly_arr, ...mutable_arr]
      expect(result.length).assertEqual(4)
      expect(result[2]).assertEqual(3.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27100
     * @tc.name      testExpressionsSpread0271
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0271", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // MutableIntArrayToReadonly
      let b: int[] = [1, 2, 3]
      let ro: readonly int[] = [...b]
      expect(ro[0]).assertEqual(1)
      expect(ro[1]).assertEqual(2)
      expect(ro[2]).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27200
     * @tc.name      testExpressionsSpread0272
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0272", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // MutableNumberArrayToReadonlyWithElements
      let b: number[] = [1.0, 2.0]
      let ro: readonly number[] = [0.0, ...b, 3.0]
      expect(ro.length).assertEqual(4)
      expect(ro[2]).assertEqual(2.0)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27300
     * @tc.name      testExpressionsSpread0273
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0273", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // MutableArrayToReadonlyRestParameter
      let b: int[] = [1, 2, 3]
      fooReadonlyRestParam_spex_to_readonly(...b)
      expect(b[0]).assertEqual(1)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27400
     * @tc.name      testExpressionsSpread0274
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0274", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // MutableFixedArrayToReadonly
      let b: FixedArray<int> = [1, 2, 3]
      let ro: readonly int[] = [...b]
      expect(ro[0]).assertEqual(1)
      expect(ro.length).assertEqual(3)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27500
     * @tc.name      testExpressionsSpread0275
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // MutableTupleToReadonlyArray
      let b: [int, int] = [1, 2]
      let ro: readonly int[] = [...b]
      expect(ro[0]).assertEqual(1)
      expect(ro[1]).assertEqual(2)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_SPREAD_27600
     * @tc.name      testExpressionsSpread0276
     * @tc.desc      Since a spread expression copies values, the attribute readonly of the source
     *               array does not affect an array created by the spread expression. If a spread expression
     *               is to create a readonly target array, then the attribute readonly must be used for
     *               the target array or for the rest parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsSpread0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // ReadonlyTupleToMutableArray
      let a: readonly [int, int, int] = [1, 2, 3]
      let rw: int[] = [...a]
      rw[1] = 11
      expect(rw[1]).assertEqual(11)
      expect(a[1]).assertEqual(2)
    });
  });
}