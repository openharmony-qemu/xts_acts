'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
export enum EN1 { a, b, c }
export enum ES1 { a = "a", b = "b", c = "c" }
export interface I1 {}
export class C1 implements I1 {}

export function c() {}

export const array1 = [ "a", "b", "c" ]
export const array2 = [ 1, 2, 3, 4 ]
export let a1: int = 4
export let b1: int = 0
export function foo1(): string|int { return a1 > b1 ? a1/b1 : "" }
export function foo2(flag: boolean) { if (flag) { throw new Error() }; return flag }
export class A1<T> { f: T; m() { return typeof this.f }; constructor(p: T) { this.f = p } }
export class A2 {}
export class B1 {}

export function f1(o: Object) { return typeof o }
export function f2(o: A2|B1) { return typeof o }

export class AI1 implements I1 {}
export let aa1 = 42
export type F1 = (p: int) => int
export function fooo1(p: int): int {
  return p + p
}
export let ff1: F1 = (p: int): int => { return p * p }
export enum Color1 { Red, Green, Blue }
export enum Size1 { S, M, L, XL }
export enum Color2 { Red = "red", Green = "green", Blue = "blue" }
export enum Size2 { S = "small", M = "mid", L = "large", XL = "extra-large" }
export class CC1<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
export class B2 {}
export class C2 {}
export interface I2 {}
export class A3 implements I2 {}
export class B3 extends A3 {}
export const g1: Comparable<Short> = new Short()
export const g2: Comparable<Int> = new Int()
export const g3: Comparable<Long> = new Long()
export const g4: Comparable<Char> = new Char()
export const g5: Floating = 3.14f
export const g6: Integral = 42

export interface I3 {}
export class AA1 implements I1 {}
export class A4 implements I3 {}
export class A5 implements I3 {}
export class BB3 extends A4 {}

export class CC2 {}
export type FF1 = (p: int) => int

export function tof_func_0_foo1(p: number): string { return typeof p }
export function tof_func_0_foo2(p: number): string { return typeof p }

export function tof_func_1_foo1(p: double): string { return typeof p }
export function tof_func_1_foo2(p: double): string { return typeof p }

export function tof_func_2_foo1(p: string): string { return typeof p }
export function tof_func_2_foo2(p: string): string { return typeof p }
export function tof_func_2_foo3(p: string): string { return typeof p }
export function tof_func_2_foo4(p: Comparable<String>): string { return typeof p }

export function tof_func_3_foo1(p: boolean): string { return typeof p }
export function tof_func_3_foo2(p: boolean): string { return typeof p }
export function tof_func_3_foo3(p: Comparable<Boolean>): string { return typeof p }

export function tof_func_4_foo1(p: bigint): string { return typeof p }
export function tof_func_4_foo2(p: bigint): string { return typeof p }

export function tof_func_5_foo1(p: AA1): string { return typeof p }
export function tof_func_5_foo2(p: I1): string { return typeof p }

export function tof_func_6_foo1(p: Numeric): string { return typeof p }

export function tof_func_7_foo1(p: number[]): string { return typeof p }
export function tof_func_7_foo2(p: number[]): string { return typeof p }

export function tof_func_8_foo1(p: byte[]): string { return typeof p }
export function tof_func_8_foo2(p: short[]): string { return typeof p }
export function tof_func_8_foo3(p: int[]): string { return typeof p }
export function tof_func_8_foo4(p: long[]): string { return typeof p }
export function tof_func_8_foo5(p: float[]): string { return typeof p }
export function tof_func_8_foo6(p: double[]): string { return typeof p }
export function tof_func_8_foo7(p: char[]): string { return typeof p }

export function tof_func_9_foo1(p: AA1[]): string { return typeof p }
export function tof_func_9_foo2(p: I1[]): string { return typeof p }
export function tof_func_9_foo3(p: Comparable<Float>[]): string { return typeof p }

export function tof_func_10_foo1(p: Floating[]): string { return typeof p }
export function tof_func_10_foo2(p: Integral[]): string { return typeof p }
export function tof_func_10_foo3(p: Numeric[]): string { return typeof p }

export function tof_func_11_foo1(p: FF1): string { return typeof p }
export function tof_func_11_foo2(p: ((p: int) => int)): string { return typeof p }
export function tof_func_11_foo3(p: FF1): string { return typeof p }
export function tof_func_11_foo4(p: ((p: int) => int)): string { return typeof p }
export function tof_func_11_foo5(p: (() => void)): string { return typeof p }

export function tof_func_12_foo1(p: undefined): string { return typeof p }

export function tof_func_13_foo1(p: null): string { return typeof p }

export function tof_func_14_foo1(p: A2|null): string { return typeof p }
export function tof_func_14_foo2(p: A2|null): string { return typeof p }
export function tof_func_14_foo3(p: I3|null): string { return typeof p }
export function tof_func_14_foo4(p: I3|null): string { return typeof p }
export function tof_func_14_foo5(p: A2[]|null): string { return typeof p }
export function tof_func_14_foo6(p: A2[]|null): string { return typeof p }
export function tof_func_14_foo7(p: I3[]|null): string { return typeof p }
export function tof_func_14_foo8(p: I3[]|null): string { return typeof p }

export function tof_func_15_foo1(p: Color1): string { return typeof p }
export function tof_func_15_foo2(p: Size1): string { return typeof p }

export function tof_func_16_foo1(p: Color2): string { return typeof p }
export function tof_func_16_foo2(p: Size2): string { return typeof p }

export function tof_func_17_foo1(p: number|string|boolean): string { return typeof p }
export function tof_func_17_foo2(p: number|boolean): string { return typeof p }
export function tof_func_17_foo3(p: boolean|never|long): string { return typeof p }

export function tof_func_18_foo1(p: number|string|boolean): string { return typeof p }
export function tof_func_18_foo2(p: number|string): string { return typeof p }
export function tof_func_18_foo3(p: boolean|never|long|string): string { return typeof p }

export function tof_func_19_foo1(p: A3|B2|CC2): string { return typeof p }
export function tof_func_19_foo2(p: B2|never|undefined|A3): string { return typeof p }

export function tof_func_20_foo1(p: CC1<A2>): string { return typeof p }
export function tof_func_20_foo2(p: CC1<B1>): string { return typeof p }
export function tof_func_20_foo3(p: CC1<I3>): string { return typeof p }

export function tof_func_21_foo1(p: Comparable<Double>): string { return typeof p }

export function tof_func_22_foo1(p: byte): string { return typeof p }
export function tof_func_22_foo2(p: byte): string { return typeof p }

export function tof_func_23_foo1(p: short): string { return typeof p }
export function tof_func_23_foo2(p: short): string { return typeof p }

export function tof_func_24_foo1(p: int): string { return typeof p }
export function tof_func_24_foo2(p: int): string { return typeof p }

export function tof_func_25_foo1(p: long): string { return typeof p }
export function tof_func_25_foo2(p: long): string { return typeof p }

export function tof_func_26_foo1(p: float): string { return typeof p }
export function tof_func_26_foo2(p: float): string { return typeof p }

export function tof_func_27_foo1(p: char): string { return typeof p }
export function tof_func_27_foo2(p: char): string { return typeof p }

export function tof_func_28_foo1(p: Comparable<Float>): string { return typeof p }

export function tof_func_29_foo1(p: Comparable<Byte>): string { return typeof p }

export function tof_func_30_foo1(p: Comparable<Short>): string { return typeof p }

export function tof_func_31_foo1(p: Comparable<Int>): string { return typeof p }

export function tof_func_32_foo1(p: Comparable<Long>): string { return typeof p }

export function tof_func_33_foo1(p: Comparable<Char>): string { return typeof p }

export function tof_func_34_foo1(p: Floating): string { return typeof p }

export function tof_func_35_foo1(p: Integral): string { return typeof p }

export function tof_func_11_original_foo(p: int): int { return p + p }