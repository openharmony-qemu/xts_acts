'use static';
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

class C_F298 {
  field: char
  constructor() {
    this.field = c'\u2028'
  }
}

class D_F298 extends C_F298 {
  override field: char = c'x'
}

class Derived_F298 extends D_F298 {
  field: char
  constructor() {
    super()
    this.field = c'y'
  }
}

function get_field(a: C_F298): char {
  return a.field
}

function set_field(a: C_F298, value: char) {
  a.field = value
}

class C_F299 {
  field: boolean
  constructor() {
    this.field = false
  }
}

class D_F299 extends C_F299 {
  override field: boolean = true
}

class Derived_F299 extends D_F299 {
  field: boolean
  constructor() {
    super()
    this.field = false
  }
}

function get_field(a: C_F299): boolean {
  return a.field
}

function set_field(a: C_F299, value: boolean) {
  a.field = value
}

class Base_F301 {
  field: Object = 5
}

class A_F301 extends Base_F301 {
  override field: Object = "abc"
}

class B_F301 extends A_F301 {
  override field: Object = 7
}

function get_field(a: Base_F301): Object {
  return a.field
}

function set_field(a: Base_F301, value: Object) {
  a.field = value
}

class Base_F302 {
  field: number = 3
}

class A_F302 extends Base_F302 {
  override field: number = 6.7
}

class B_F302 extends A_F302 {
  override field: number = 13
}

function get_field(a: Base_F302): number {
  return a.field
}

function set_field(a: Base_F302, value: number) {
  a.field = value
}

class Base_F303 {
  field: double = 3.4
}

class A_F303 extends Base_F303 {
  override field: double = 5.0
}

class B_F303 extends A_F303 {
  override field: double = 15
}

function get_field(a: Base_F303): double {
  return a.field
}

function set_field(a: Base_F303, value: double) {
  a.field = value
}

class Base_F304 {
  field: float = 6.7f
}

class A_F304 extends Base_F304 {
  override field: float = 7.3f
}

class B_F304 extends A_F304 {
  override field: float = 9.8f
}

function get_field(a: Base_F304): float {
  return a.field
}

function set_field(a: Base_F304, value: float) {
  a.field = value
}

class Base_F305 {
  field: long = 9223372036854775807
}

class A_F305 extends Base_F305 {
  override field: long = 78945
}

class B_F305 extends A_F305 {
  override field: long = 357
}

function get_field(a: Base_F305): long {
  return a.field
}

function set_field(a: Base_F305, value: long) {
  a.field = value
}

class Base_F306 {
  field: int = 123
}

class A_F306 extends Base_F306 {
  override field: int = 321
}

class B_F306 extends A_F306 {
  override field: int = 321321
}

function get_field(a: Base_F306): int {
  return a.field
}

function set_field(a: Base_F306, value: int) {
  a.field = value
}

class Base_F307 {
  field: short = 325
}

class A_F307 extends Base_F307 {
  override field: short = 253
}

class B_F307 extends A_F307 {
  override field: short = 536
}

function get_field(a: Base_F307): short {
  return a.field
}

function set_field(a: Base_F307, value: short) {
  a.field = value
}

class Base_F308 {
  field: byte = 127
}

class A_F308 extends Base_F308 {
  override field: byte = 78
}

class B_F308 extends A_F308 {
  override field: byte = 15
}

function get_field(a: Base_F308): byte {
  return a.field
}

function set_field(a: Base_F308, value: byte) {
  a.field = value
}

class Base_F309 {
  field: string = "abc"
}

class A_F309 extends Base_F309 {
  override field: string = "efg"
}

class B_F309 extends A_F309 {
  override field: string = "ijk"
}

function get_field(a: Base_F309): string {
  return a.field
}

function set_field(a: Base_F309, value: string) {
  a.field = value
}

class Base_F310 {
  field: bigint = 12345678901234567890n
}

class A_F310 extends Base_F310 {
  override field: bigint = 555642n
}

class B_F310 extends A_F310 {
  override field: bigint = 123n
}

function get_field(a: Base_F310): bigint {
  return a.field
}

function set_field(a: Base_F310, value: bigint) {
  a.field = value
}

class Base_F311 {
  field: char = c'\u2028'
}

class A_F311 extends Base_F311 {
  override field: char = c'x'
}

class B_F311 extends A_F311 {
  override field: char = c'y'
}

function get_field(a: Base_F311): char {
  return a.field
}

function set_field(a: Base_F311, value: char) {
  a.field = value
}

class Base_F312 {
  field: boolean = false
}

class A_F312 extends Base_F312 {
  override field: boolean = true
}

class B_F312 extends A_F312 {
  override field: boolean = false
}

function get_field(a: Base_F312): boolean {
  return a.field
}

function set_field(a: Base_F312, value: boolean) {
  a.field = value
}

class Base_F314 {
  field: Object = 5
}

class A_F314 extends Base_F314 {
}

class B_F314 extends A_F314 {
  override field: Object = "abc"
}

function get_field(a: Base_F314): Object {
  return a.field
}

function set_field(a: Base_F314, value: Object) {
  a.field = value
}

class Base_F315 {
  field: number = 3
}

class A_F315 extends Base_F315 {
}

class B_F315 extends A_F315 {
  override field: number = 6.7
}

function get_field(a: Base_F315): number {
  return a.field
}

function set_field(a: Base_F315, value: number) {
  a.field = value
}

class Base_F316 {
  field: double = 3.4
}

class A_F316 extends Base_F316 {
}

class B_F316 extends A_F316 {
  override field: double = 5.0
}

function get_field(a: Base_F316): double {
  return a.field
}

function set_field(a: Base_F316, value: double) {
  a.field = value
}

class Base_F317 {
  field: float = 6.7f
}

class A_F317 extends Base_F317 {
}

class B_F317 extends A_F317 {
  override field: float = 7.3f
}

function get_field(a: Base_F317): float {
  return a.field
}

function set_field(a: Base_F317, value: float) {
  a.field = value
}

class Base_F318 {
  field: long = 9223372036854775807
}

class A_F318 extends Base_F318 {
}

class B_F318 extends A_F318 {
  override field: long = 78945
}

function get_field(a: Base_F318): long {
  return a.field
}

function set_field(a: Base_F318, value: long) {
  a.field = value
}

class Base_F319 {
  field: int = 123
}

class A_F319 extends Base_F319 {
}

class B_F319 extends A_F319 {
  override field: int = 321
}

function get_field(a: Base_F319): int {
  return a.field
}

function set_field(a: Base_F319, value: int) {
  a.field = value
}

class Base_F320 {
  field: short = 325
}

class A_F320 extends Base_F320 {
}

class B_F320 extends A_F320 {
  override field: short = 253
}

function get_field(a: Base_F320): short {
  return a.field
}

function set_field(a: Base_F320, value: short) {
  a.field = value
}

class Base_F321 {
  field: byte = 127
}

class A_F321 extends Base_F321 {
}

class B_F321 extends A_F321 {
  override field: byte = 78
}

function get_field(a: Base_F321): byte {
  return a.field
}

function set_field(a: Base_F321, value: byte) {
  a.field = value
}

class Base_F322 {
  field: string = "abc"
}

class A_F322 extends Base_F322 {
}

class B_F322 extends A_F322 {
  override field: string = "defg"
}

function get_field(a: Base_F322): string {
  return a.field
}

function set_field(a: Base_F322, value: string) {
  a.field = value
}

class Base_F323 {
  field: bigint = 12345678901234567890n
}

class A_F323 extends Base_F323 {
}

class B_F323 extends A_F323 {
  override field: bigint = 5556423623465n
}

function get_field(a: Base_F323): bigint {
  return a.field
}

function set_field(a: Base_F323, value: bigint) {
  a.field = value
}

class Base_F324 {
  field: char = c'\u2028'
}

class A_F324 extends Base_F324 {
}

class B_F324 extends A_F324 {
  override field: char = c'z'
}

function get_field(a: Base_F324): char {
  return a.field
}

function set_field(a: Base_F324, value: char) {
  a.field = value
}

class Base_F325 {
  field: boolean = false
}

class A_F325 extends Base_F325 {
}

class B_F325 extends A_F325 {
  override field: boolean = true
}

function get_field(a: Base_F325): boolean {
  return a.field
}

function set_field(a: Base_F325, value: boolean) {
  a.field = value
}

class Base_F327 {
  field: Object = 5
}

class A_F327 extends Base_F327 {
  override field: Object = "abc"
}

function get_field(a: Base_F327): Object {
  return a.field
}

function set_field(a: Base_F327, value: Object) {
  a.field = value
}

class Base_F328 {
  field: number = 3
}

class A_F328 extends Base_F328 {
  override field: number = 6.7
}

function get_field(a: Base_F328): number {
  return a.field
}

function set_field(a: Base_F328, value: number) {
  a.field = value
}

class Base_F329 {
  field: double = 3.4
}

class A_F329 extends Base_F329 {
  override field: double = 5.0
}

function get_field(a: Base_F329): double {
  return a.field
}

function set_field(a: Base_F329, value: double) {
  a.field = value
}

class Base_F330 {
  field: float = 6.7f
}

class A_F330 extends Base_F330 {
  override field: float = 7.3f
}

function get_field(a: Base_F330): float {
  return a.field
}

function set_field(a: Base_F330, value: float) {
  a.field = value
}

class Base_F331 {
  field: long = 9223372036854775807
}

class A_F331 extends Base_F331 {
  override field: long = 78945
}

function get_field(a: Base_F331): long {
  return a.field
}

function set_field(a: Base_F331, value: long) {
  a.field = value
}

class Base_F332 {
  field: int = 123
}

class A_F332 extends Base_F332 {
  override field: int = 321
}

function get_field(a: Base_F332): int {
  return a.field
}

function set_field(a: Base_F332, value: int) {
  a.field = value
}

class Base_F333 {
  field: short = 325
}

class A_F333 extends Base_F333 {
  override field: short = 253
}

function get_field(a: Base_F333): short {
  return a.field
}

function set_field(a: Base_F333, value: short) {
  a.field = value
}

class Base_F334 {
  field: byte = 127
}

class A_F334 extends Base_F334 {
  override field: byte = 78
}

function get_field(a: Base_F334): byte {
  return a.field
}

function set_field(a: Base_F334, value: byte) {
  a.field = value
}

class Base_F335 {
  field: string = "abc"
}

class A_F335 extends Base_F335 {
  override field: string = "defg"
}

function get_field(a: Base_F335): string {
  return a.field
}

function set_field(a: Base_F335, value: string) {
  a.field = value
}

class Base_F336 {
  field: bigint = 12345678901234567890n
}

class A_F336 extends Base_F336 {
  override field: bigint = 5556423623465n
}

function get_field(a: Base_F336): bigint {
  return a.field
}

function set_field(a: Base_F336, value: bigint) {
  a.field = value
}

class Base_F337 {
  field: char = c'\u2028'
}

class A_F337 extends Base_F337 {
  override field: char = c'z'
}

function get_field(a: Base_F337): char {
  return a.field
}

function set_field(a: Base_F337, value: char) {
  a.field = value
}

class Base_F338 {
  field: boolean = false
}

class A_F338 extends Base_F338 {
  override field: boolean = true
}

function get_field(a: Base_F338): boolean {
  return a.field
}

function set_field(a: Base_F338, value: boolean) {
  a.field = value
}

class Base_F340 {
  readonly field: Object = 5
}

class A_F340 extends Base_F340 {
  readonly field: Object = "abc"
}

function get_field(a: Base_F340): Object {
  return a.field
}

class Base_F341 {
  readonly field: number = 3
}

class A_F341 extends Base_F341 {
  readonly field: number = 6.7
}

function get_field(a: Base_F341): number {
  return a.field
}

class Base_F342 {
  readonly field: double = 3.4
}

class A_F342 extends Base_F342 {
  readonly field: double = 5.0
}

function get_field(a: Base_F342): double {
  return a.field
}

class Base_F343 {
  readonly field: float = 6.7f
}

class A_F343 extends Base_F343 {
  readonly field: float = 7.3f
}

function get_field(a: Base_F343): float {
  return a.field
}

class Base_F344 {
  readonly field: long = 9223372036854775807
}

class A_F344 extends Base_F344 {
  readonly field: long = 78945
}

function get_field(a: Base_F344): long {
  return a.field
}

class Base_F345 {
  readonly field: int = 123
}

class A_F345 extends Base_F345 {
  readonly field: int = 321
}

function get_field(a: Base_F345): int {
  return a.field
}

class Base_F346 {
  readonly field: short = 325
}

class A_F346 extends Base_F346 {
  readonly field: short = 253
}

function get_field(a: Base_F346): short {
  return a.field
}

class Base_F347 {
  readonly field: byte = 127
}

class A_F347 extends Base_F347 {
  readonly field: byte = 78
}

function get_field(a: Base_F347): byte {
  return a.field
}

class Base_F348 {
  readonly field: string = "abc"
}

class A_F348 extends Base_F348 {
  readonly field: string = "defg"
}

function get_field(a: Base_F348): string {
  return a.field
}

class Base_F349 {
  readonly field: bigint = 12345678901234567890n
}

class A_F349 extends Base_F349 {
  readonly field: bigint = 5556423623465n
}

function get_field(a: Base_F349): bigint {
  return a.field
}

class Base_F350 {
  readonly field: char = c'\u2028'
}

class A_F350 extends Base_F350 {
  readonly field: char = c'z'
}

function get_field(a: Base_F350): char {
  return a.field
}

class Base_F351 {
  readonly field: boolean = false
}

class A_F351 extends Base_F351 {
  readonly field: boolean = true
}

function get_field(a: Base_F351): boolean {
  return a.field
}

class Base_F353 {
  field: Object = 5
}

class A_F353 extends Base_F353 {
  field: Object = 5
}

function get_field(a: Base_F353): Object {
  return a.field
}

function set_field(a: Base_F353, value: Object) {
  a.field = value
}

class Base_F354 {
  field: number = 3
}

class A_F354 extends Base_F354 {
  field: number = 3
}

function get_field(a: Base_F354): number {
  return a.field
}

function set_field(a: Base_F354, value: number) {
  a.field = value
}

class Base_F355 {
  field: double = 3.4
}

class A_F355 extends Base_F355 {
  field: double = 3.4
}

function get_field(a: Base_F355): double {
  return a.field
}

function set_field(a: Base_F355, value: double) {
  a.field = value
}

class Base_F356 {
  field: float = 6.7f
}

class A_F356 extends Base_F356 {
  field: float = 6.7f
}

function get_field(a: Base_F356): float {
  return a.field
}

function set_field(a: Base_F356, value: float) {
  a.field = value
}

class Base_F357 {
  field: long = 9223372036854775807
}

class A_F357 extends Base_F357 {
  field: long = 9223372036854775807
}

function get_field(a: Base_F357): long {
  return a.field
}

function set_field(a: Base_F357, value: long) {
  a.field = value
}

class Base_F358 {
  field: int = 123
}

class A_F358 extends Base_F358 {
  field: int = 123
}

function get_field(a: Base_F358): int {
  return a.field
}

function set_field(a: Base_F358, value: int) {
  a.field = value
}

class Base_F359 {
  field: short = 325
}

class A_F359 extends Base_F359 {
  field: short = 325
}

function get_field(a: Base_F359): short {
  return a.field
}

function set_field(a: Base_F359, value: short) {
  a.field = value
}

class Base_F360 {
  field: byte = 127
}

class A_F360 extends Base_F360 {
  field: byte = 127
}

function get_field(a: Base_F360): byte {
  return a.field
}

function set_field(a: Base_F360, value: byte) {
  a.field = value
}

class Base_F361 {
  field: string = "abc"
}

class A_F361 extends Base_F361 {
  field: string = "abc"
}

function get_field(a: Base_F361): string {
  return a.field
}

function set_field(a: Base_F361, value: string) {
  a.field = value
}

class Base_F362 {
  field: bigint = 12345678901234567890n
}

class A_F362 extends Base_F362 {
  field: bigint = 12345678901234567890n
}

function get_field(a: Base_F362): bigint {
  return a.field
}

function set_field(a: Base_F362, value: bigint) {
  a.field = value
}

class Base_F363 {
  field: char = c'\u2028'
}

class A_F363 extends Base_F363 {
  field: char = c'\u2028'
}

function get_field(a: Base_F363): char {
  return a.field
}

function set_field(a: Base_F363, value: char) {
  a.field = value
}

class Base_F364 {
  field: boolean = false
}

class A_F364 extends Base_F364 {
  field: boolean = false
}

function get_field(a: Base_F364): boolean {
  return a.field
}

function set_field(a: Base_F364, value: boolean) {
  a.field = value
}

class Base_F366 {
  static field: Object = 5
}

class A_F366 extends Base_F366 {
  field: Object = "abc"
}

class Base_F367 {
  static field: number = 3
}

class A_F367 extends Base_F367 {
  field: number = 6.7
}

class Base_F368 {
  static field: double = 3.4
}

class A_F368 extends Base_F368 {
  field: double = 5.0
}

class Base_F369 {
  static field: float = 6.7f
}

class A_F369 extends Base_F369 {
  field: float = 7.3f
}

class Base_F370 {
  static field: long = 9223372036854775807
}

class A_F370 extends Base_F370 {
  field: long = 78945
}

class Base_F371 {
  static field: int = 123
}

class A_F371 extends Base_F371 {
  field: int = 321
}

class Base_F372 {
  static field: short = 325
}

class A_F372 extends Base_F372 {
  field: short = 253
}

class Base_F373 {
  static field: byte = 127
}

class A_F373 extends Base_F373 {
  field: byte = 78
}

class Base_F374 {
  static field: string = "abc"
}

class A_F374 extends Base_F374 {
  field: string = "defg"
}

class Base_F375 {
  static field: bigint = 12345678901234567890n
}

class A_F375 extends Base_F375 {
  field: bigint = 5556423623465n
}

class Base_F376 {
  static field: char = c'\u2028'
}

class A_F376 extends Base_F376 {
  field: char = c'z'
}

class Base_F377 {
  static field: boolean = false
}

class A_F377 extends Base_F377 {
  field: boolean = true
}

class Base_F379 {
  static field: Object
  static {
    Base_F379.field = 5
  }
}

class A_F379 extends Base_F379 {
  static field: Object
  static {
    A_F379.field = "abc"
  }
}

class Base_F380 {
  static field: number
  static {
    Base_F380.field = 3
  }
}

class A_F380 extends Base_F380 {
  static field: number
  static {
    A_F380.field = 6.7
  }
}

class Base_F381 {
  static field: double
  static {
    Base_F381.field = 3.4
  }
}

class A_F381 extends Base_F381 {
  static field: double
  static {
    A_F381.field = 5.0
  }
}

class Base_F382 {
  static field: float
  static {
    Base_F382.field = 6.7f
  }
}

class A_F382 extends Base_F382 {
  static field: float
  static {
    A_F382.field = 7.3f
  }
}

class Base_F383 {
  static field: long
  static {
    Base_F383.field = 9223372036854775807
  }
}

class A_F383 extends Base_F383 {
  static field: long
  static {
    A_F383.field = 78945
  }
}

class Base_F384 {
  static field: int
  static {
    Base_F384.field = 123
  }
}

class A_F384 extends Base_F384 {
  static field: int
  static {
    A_F384.field = 321
  }
}

class Base_F385 {
  static field: short
  static {
    Base_F385.field = 325
  }
}

class A_F385 extends Base_F385 {
  static field: short
  static {
    A_F385.field = 253
  }
}

class Base_F386 {
  static field: byte
  static {
    Base_F386.field = 127
  }
}

class A_F386 extends Base_F386 {
  static field: byte
  static {
    A_F386.field = 78
  }
}

class Base_F387 {
  static field: string
  static {
    Base_F387.field = "abc"
  }
}

class A_F387 extends Base_F387 {
  static field: string
  static {
    A_F387.field = "defg"
  }
}

class Base_F388 {
  static field: bigint
  static {
    Base_F388.field = 12345678901234567890n
  }
}

class A_F388 extends Base_F388 {
  static field: bigint
  static {
    A_F388.field = 5556423623465n
  }
}

class Base_F389 {
  static field: char
  static {
    Base_F389.field = c'\u2028'
  }
}

class A_F389 extends Base_F389 {
  static field: char
  static {
    A_F389.field = c'z'
  }
}

class Base_F390 {
  static field: boolean
  static {
    Base_F390.field = false
  }
}

class A_F390 extends Base_F390 {
  static field: boolean
  static {
    A_F390.field = true
  }
}

export default function OverridingFieldsThreeTest(): void {
  describe("OverridingFieldsThreeTest", () => {
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
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0100
     * @tc.name      testOverridingFieldsThree0001
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F298 = new Derived_F298()
        let b: D_F298 = new D_F298()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'y')
      expect(get_field(a)).assertEqual(c'y')
        set_field(a, c'z')
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
      expect(b.field instanceof char).assertTrue()
      expect(b.field).assertEqual(c'x')
      expect(get_field(b)).assertEqual(c'x')
        set_field(b, c'z')
      expect(b.field).assertEqual(c'z')
      expect(get_field(b)).assertEqual(c'z')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0200
     * @tc.name      testOverridingFieldsThree0002
     * @tc.desc      Overriding in first and second derived class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Derived_F299 = new Derived_F299()
        let b: D_F299 = new D_F299()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
        set_field(a, true)
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
      expect(b.field instanceof boolean).assertTrue()
      expect(b.field).assertEqual(true)
      expect(get_field(b)).assertEqual(true)
        set_field(b, true)
      expect(b.field).assertEqual(true)
      expect(get_field(b)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0300
     * @tc.name      testOverridingFieldsThree0003
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F301 = new B_F301()
        let b: A_F301 = new A_F301()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
        set_field(a, 7.8)
      expect(a.field).assertEqual(7.8)
      expect(get_field(a)).assertEqual(7.8)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual("abc")
      expect(get_field(b)).assertEqual("abc")
        set_field(b, 7.8)
      expect(b.field).assertEqual(7.8)
      expect(get_field(b)).assertEqual(7.8)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0400
     * @tc.name      testOverridingFieldsThree0004
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F302 = new B_F302()
        let b: A_F302 = new A_F302()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
        set_field(a, 15.6)
      expect(a.field).assertEqual(15.6)
      expect(get_field(a)).assertEqual(15.6)
      expect(b.field instanceof number).assertTrue()
      expect(b.field).assertEqual(6.7)
      expect(get_field(b)).assertEqual(6.7)
        set_field(b, 15.6)
      expect(b.field).assertEqual(15.6)
      expect(get_field(b)).assertEqual(15.6)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0500
     * @tc.name      testOverridingFieldsThree0005
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F303 = new B_F303()
        let b: A_F303 = new A_F303()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
        set_field(a, 17.3)
      expect(a.field).assertEqual(17.3)
      expect(get_field(a)).assertEqual(17.3)
      expect(b.field instanceof double).assertTrue()
      expect(b.field).assertEqual(5.0)
      expect(get_field(b)).assertEqual(5.0)
        set_field(b, 17.3)
      expect(b.field).assertEqual(17.3)
      expect(get_field(b)).assertEqual(17.3)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0600
     * @tc.name      testOverridingFieldsThree0006
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F304 = new B_F304()
        let b: A_F304 = new A_F304()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
        set_field(a, 3.4f)
      expect(a.field).assertEqual(3.4f)
      expect(get_field(a)).assertEqual(3.4f)
      expect(b.field instanceof float).assertTrue()
      expect(b.field).assertEqual(7.3f)
      expect(get_field(b)).assertEqual(7.3f)
        set_field(b, 3.4f)
      expect(b.field).assertEqual(3.4f)
      expect(get_field(b)).assertEqual(3.4f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0700
     * @tc.name      testOverridingFieldsThree0007
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F305 = new B_F305()
        let b: A_F305 = new A_F305()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(357)
      expect(get_field(a)).assertEqual(357)
        set_field(a, 127)
      expect(a.field).assertEqual(127)
      expect(get_field(a)).assertEqual(127)
      expect(b.field instanceof long).assertTrue()
      expect(b.field).assertEqual(78945)
      expect(get_field(b)).assertEqual(78945)
        set_field(b, 127)
      expect(b.field).assertEqual(127)
      expect(get_field(b)).assertEqual(127)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0800
     * @tc.name      testOverridingFieldsThree0008
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F306 = new B_F306()
        let b: A_F306 = new A_F306()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
        set_field(a, 753)
      expect(a.field).assertEqual(753)
      expect(get_field(a)).assertEqual(753)
      expect(b.field instanceof int).assertTrue()
      expect(b.field).assertEqual(321)
      expect(get_field(b)).assertEqual(321)
        set_field(b, 753)
      expect(b.field).assertEqual(753)
      expect(get_field(b)).assertEqual(753)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_0900
     * @tc.name      testOverridingFieldsThree0009
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F307 = new B_F307()
        let b: A_F307 = new A_F307()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
        set_field(a, 537)
      expect(a.field).assertEqual(537)
      expect(get_field(a)).assertEqual(537)
      expect(b.field instanceof short).assertTrue()
      expect(b.field).assertEqual(253)
      expect(get_field(b)).assertEqual(253)
        set_field(b, 537)
      expect(b.field).assertEqual(537)
      expect(get_field(b)).assertEqual(537)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1000
     * @tc.name      testOverridingFieldsThree0010
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F308 = new B_F308()
        let b: A_F308 = new A_F308()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
        set_field(a, 117)
      expect(a.field).assertEqual(117)
      expect(get_field(a)).assertEqual(117)
      expect(b.field instanceof byte).assertTrue()
      expect(b.field).assertEqual(78)
      expect(get_field(b)).assertEqual(78)
        set_field(b, 117)
      expect(b.field).assertEqual(117)
      expect(get_field(b)).assertEqual(117)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1100
     * @tc.name      testOverridingFieldsThree0011
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F309 = new B_F309()
        let b: A_F309 = new A_F309()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("ijk")
      expect(get_field(a)).assertEqual("ijk")
        set_field(a, "lmn")
      expect(a.field).assertEqual("lmn")
      expect(get_field(a)).assertEqual("lmn")
      expect(b.field instanceof string).assertTrue()
      expect(b.field).assertEqual("efg")
      expect(get_field(b)).assertEqual("efg")
        set_field(b, "lmn")
      expect(b.field).assertEqual("lmn")
      expect(get_field(b)).assertEqual("lmn")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1200
     * @tc.name      testOverridingFieldsThree0012
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F310 = new B_F310()
        let b: A_F310 = new A_F310()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(123n)
      expect(get_field(a)).assertEqual(123n)
        set_field(a, 321n)
      expect(a.field).assertEqual(321n)
      expect(get_field(a)).assertEqual(321n)
      expect(b.field instanceof bigint).assertTrue()
      expect(b.field).assertEqual(555642n)
      expect(get_field(b)).assertEqual(555642n)
        set_field(b, 321n)
      expect(b.field).assertEqual(321n)
      expect(get_field(b)).assertEqual(321n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1300
     * @tc.name      testOverridingFieldsThree0013
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F311 = new B_F311()
        let b: A_F311 = new A_F311()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'y')
      expect(get_field(a)).assertEqual(c'y')
        set_field(a, c'z')
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
      expect(b.field instanceof char).assertTrue()
      expect(b.field).assertEqual(c'x')
      expect(get_field(b)).assertEqual(c'x')
        set_field(b, c'z')
      expect(b.field).assertEqual(c'z')
      expect(get_field(b)).assertEqual(c'z')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1400
     * @tc.name      testOverridingFieldsThree0014
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: B_F312 = new B_F312()
        let b: A_F312 = new A_F312()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
        set_field(a, true)
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
      expect(b.field instanceof boolean).assertTrue()
      expect(b.field).assertEqual(true)
      expect(get_field(b)).assertEqual(true)
        set_field(b, true)
      expect(b.field).assertEqual(true)
      expect(get_field(b)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1500
     * @tc.name      testOverridingFieldsThree0015
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F314 = new B_F314()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
        set_field(a, 7)
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1600
     * @tc.name      testOverridingFieldsThree0016
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F315 = new B_F315()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
        set_field(a, 13)
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1700
     * @tc.name      testOverridingFieldsThree0017
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F316 = new B_F316()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
        set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1800
     * @tc.name      testOverridingFieldsThree0018
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F317 = new B_F317()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
        set_field(a, 9.8f)
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_1900
     * @tc.name      testOverridingFieldsThree0019
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F318 = new B_F318()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
        set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2000
     * @tc.name      testOverridingFieldsThree0020
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F319 = new B_F319()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
        set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2100
     * @tc.name      testOverridingFieldsThree0021
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F320 = new B_F320()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
        set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2200
     * @tc.name      testOverridingFieldsThree0022
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F321 = new B_F321()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
        set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2300
     * @tc.name      testOverridingFieldsThree0023
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F322 = new B_F322()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
        set_field(a, "hijk")
      expect(a.field).assertEqual("hijk")
      expect(get_field(a)).assertEqual("hijk")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2400
     * @tc.name      testOverridingFieldsThree0024
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F323 = new B_F323()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
        set_field(a, 123123n)
      expect(a.field).assertEqual(123123n)
      expect(get_field(a)).assertEqual(123123n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2500
     * @tc.name      testOverridingFieldsThree0025
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F324 = new B_F324()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
        set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2600
     * @tc.name      testOverridingFieldsThree0026
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F325 = new B_F325()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
        set_field(a, false)
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2700
     * @tc.name      testOverridingFieldsThree0027
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F327 = new A_F327()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
        set_field(a, 7)
      expect(a.field).assertEqual(7)
      expect(get_field(a)).assertEqual(7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2800
     * @tc.name      testOverridingFieldsThree0028
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F328 = new A_F328()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
        set_field(a, 13)
      expect(a.field).assertEqual(13)
      expect(get_field(a)).assertEqual(13)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_2900
     * @tc.name      testOverridingFieldsThree0029
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F329 = new A_F329()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
        set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3000
     * @tc.name      testOverridingFieldsThree0030
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F330 = new A_F330()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
        set_field(a, 9.8f)
      expect(a.field).assertEqual(9.8f)
      expect(get_field(a)).assertEqual(9.8f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3100
     * @tc.name      testOverridingFieldsThree0031
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F331 = new A_F331()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
        set_field(a, 9223372036854775000)
      expect(a.field).assertEqual(9223372036854775000)
      expect(get_field(a)).assertEqual(9223372036854775000)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3200
     * @tc.name      testOverridingFieldsThree0032
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F332 = new A_F332()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
        set_field(a, 321321)
      expect(a.field).assertEqual(321321)
      expect(get_field(a)).assertEqual(321321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3300
     * @tc.name      testOverridingFieldsThree0033
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F333 = new A_F333()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
        set_field(a, 536)
      expect(a.field).assertEqual(536)
      expect(get_field(a)).assertEqual(536)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3400
     * @tc.name      testOverridingFieldsThree0034
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F334 = new A_F334()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
        set_field(a, 15)
      expect(a.field).assertEqual(15)
      expect(get_field(a)).assertEqual(15)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3500
     * @tc.name      testOverridingFieldsThree0035
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F335 = new A_F335()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
        set_field(a, "hijk")
      expect(a.field).assertEqual("hijk")
      expect(get_field(a)).assertEqual("hijk")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3600
     * @tc.name      testOverridingFieldsThree0036
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F336 = new A_F336()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
        set_field(a, 123123n)
      expect(a.field).assertEqual(123123n)
      expect(get_field(a)).assertEqual(123123n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3700
     * @tc.name      testOverridingFieldsThree0037
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F337 = new A_F337()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
        set_field(a, c'x')
      expect(a.field).assertEqual(c'x')
      expect(get_field(a)).assertEqual(c'x')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3800
     * @tc.name      testOverridingFieldsThree0038
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F338 = new A_F338()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
        set_field(a, false)
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_3900
     * @tc.name      testOverridingFieldsThree0039
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F340 = new A_F340()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4000
     * @tc.name      testOverridingFieldsThree0040
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F341 = new A_F341()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4100
     * @tc.name      testOverridingFieldsThree0041
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F342 = new A_F342()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4200
     * @tc.name      testOverridingFieldsThree0042
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F343 = new A_F343()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4300
     * @tc.name      testOverridingFieldsThree0043
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F344 = new A_F344()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4400
     * @tc.name      testOverridingFieldsThree0044
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F345 = new A_F345()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4500
     * @tc.name      testOverridingFieldsThree0045
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F346 = new A_F346()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4600
     * @tc.name      testOverridingFieldsThree0046
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F347 = new A_F347()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4700
     * @tc.name      testOverridingFieldsThree0047
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F348 = new A_F348()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4800
     * @tc.name      testOverridingFieldsThree0048
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F349 = new A_F349()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_4900
     * @tc.name      testOverridingFieldsThree0049
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F350 = new A_F350()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5000
     * @tc.name      testOverridingFieldsThree0050
     * @tc.desc      Overriding readonly field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F351 = new A_F351()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5100
     * @tc.name      testOverridingFieldsThree0051
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F353 = new A_F353()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(get_field(a)).assertEqual(5)
        set_field(a, "abc")
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5200
     * @tc.name      testOverridingFieldsThree0052
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F354 = new A_F354()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(3)
      expect(get_field(a)).assertEqual(3)
        set_field(a, 6.7)
      expect(a.field).assertEqual(6.7)
      expect(get_field(a)).assertEqual(6.7)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5300
     * @tc.name      testOverridingFieldsThree0053
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F355 = new A_F355()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(3.4)
      expect(get_field(a)).assertEqual(3.4)
        set_field(a, 5.0)
      expect(a.field).assertEqual(5.0)
      expect(get_field(a)).assertEqual(5.0)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5400
     * @tc.name      testOverridingFieldsThree0054
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F356 = new A_F356()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(6.7f)
      expect(get_field(a)).assertEqual(6.7f)
        set_field(a, 7.3f)
      expect(a.field).assertEqual(7.3f)
      expect(get_field(a)).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5500
     * @tc.name      testOverridingFieldsThree0055
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F357 = new A_F357()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(9223372036854775807)
      expect(get_field(a)).assertEqual(9223372036854775807)
        set_field(a, 78945)
      expect(a.field).assertEqual(78945)
      expect(get_field(a)).assertEqual(78945)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5600
     * @tc.name      testOverridingFieldsThree0056
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F358 = new A_F358()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(123)
      expect(get_field(a)).assertEqual(123)
        set_field(a, 321)
      expect(a.field).assertEqual(321)
      expect(get_field(a)).assertEqual(321)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5700
     * @tc.name      testOverridingFieldsThree0057
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F359 = new A_F359()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(325)
      expect(get_field(a)).assertEqual(325)
        set_field(a, 253)
      expect(a.field).assertEqual(253)
      expect(get_field(a)).assertEqual(253)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5800
     * @tc.name      testOverridingFieldsThree0058
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F360 = new A_F360()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(127)
      expect(get_field(a)).assertEqual(127)
        set_field(a, 78)
      expect(a.field).assertEqual(78)
      expect(get_field(a)).assertEqual(78)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_5900
     * @tc.name      testOverridingFieldsThree0059
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F361 = new A_F361()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(get_field(a)).assertEqual("abc")
        set_field(a, "defg")
      expect(a.field).assertEqual("defg")
      expect(get_field(a)).assertEqual("defg")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6000
     * @tc.name      testOverridingFieldsThree0060
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F362 = new A_F362()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(12345678901234567890n)
      expect(get_field(a)).assertEqual(12345678901234567890n)
        set_field(a, 5556423623465n)
      expect(a.field).assertEqual(5556423623465n)
      expect(get_field(a)).assertEqual(5556423623465n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6100
     * @tc.name      testOverridingFieldsThree0061
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F363 = new A_F363()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'\u2028')
      expect(get_field(a)).assertEqual(c'\u2028')
        set_field(a, c'z')
      expect(a.field).assertEqual(c'z')
      expect(get_field(a)).assertEqual(c'z')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6200
     * @tc.name      testOverridingFieldsThree0062
     * @tc.desc      When extending a class, an instance field declared in a superclass can be overridden
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F364 = new A_F364()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      expect(get_field(a)).assertEqual(false)
        set_field(a, true)
      expect(a.field).assertEqual(true)
      expect(get_field(a)).assertEqual(true)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6300
     * @tc.name      testOverridingFieldsThree0063
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F366 = new A_F366()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual("abc")

      expect(Base_F366.field instanceof Object).assertTrue()
      expect(Base_F366.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6400
     * @tc.name      testOverridingFieldsThree0064
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F367 = new A_F367()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(6.7)

      expect(Base_F367.field instanceof number).assertTrue()
      expect(Base_F367.field).assertEqual(3)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6500
     * @tc.name      testOverridingFieldsThree0065
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F368 = new A_F368()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(5.0)

      expect(Base_F368.field instanceof double).assertTrue()
      expect(Base_F368.field).assertEqual(3.4)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6600
     * @tc.name      testOverridingFieldsThree0066
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F369 = new A_F369()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)

      expect(Base_F369.field instanceof float).assertTrue()
      expect(Base_F369.field).assertEqual(6.7f)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6700
     * @tc.name      testOverridingFieldsThree0067
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F370 = new A_F370()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(78945)

      expect(Base_F370.field instanceof long).assertTrue()
      expect(Base_F370.field).assertEqual(9223372036854775807)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6800
     * @tc.name      testOverridingFieldsThree0068
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F371 = new A_F371()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(321)

      expect(Base_F371.field instanceof int).assertTrue()
      expect(Base_F371.field).assertEqual(123)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_6900
     * @tc.name      testOverridingFieldsThree0069
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F372 = new A_F372()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(253)

      expect(Base_F372.field instanceof short).assertTrue()
      expect(Base_F372.field).assertEqual(325)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7000
     * @tc.name      testOverridingFieldsThree0070
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F373 = new A_F373()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(78)

      expect(Base_F373.field instanceof byte).assertTrue()
      expect(Base_F373.field).assertEqual(127)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7100
     * @tc.name      testOverridingFieldsThree0071
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F374 = new A_F374()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("defg")

      expect(Base_F374.field instanceof string).assertTrue()
      expect(Base_F374.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7200
     * @tc.name      testOverridingFieldsThree0072
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F375 = new A_F375()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5556423623465n)

      expect(Base_F375.field instanceof bigint).assertTrue()
      expect(Base_F375.field).assertEqual(12345678901234567890n)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7300
     * @tc.name      testOverridingFieldsThree0073
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F376 = new A_F376()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'z')

      expect(Base_F376.field instanceof char).assertTrue()
      expect(Base_F376.field).assertEqual(c'\u2028')
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7400
     * @tc.name      testOverridingFieldsThree0074
     * @tc.desc      Checking instance field declaration in derived class with same name and same
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F377 = new A_F377()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)

      expect(Base_F377.field instanceof boolean).assertTrue()
      expect(Base_F377.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7500
     * @tc.name      testOverridingFieldsThree0075
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F379 = new A_F379()
        expect(A_F379.field instanceof Object).assertTrue()
          expect(A_F379.field).assertEqual("abc")
          expect(Base_F379.field instanceof Object).assertTrue()
          expect(Base_F379.field).assertEqual(5)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7600
     * @tc.name      testOverridingFieldsThree0076
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F380 = new A_F380()
        expect(A_F380.field instanceof number).assertTrue()
          expect(A_F380.field).assertEqual(6.7)
          expect(Base_F380.field instanceof number).assertTrue()
          expect(Base_F380.field).assertEqual(3)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7700
     * @tc.name      testOverridingFieldsThree0077
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F381 = new A_F381()
        expect(A_F381.field instanceof double).assertTrue()
          expect(A_F381.field).assertEqual(5.0)
          expect(Base_F381.field instanceof double).assertTrue()
          expect(Base_F381.field).assertEqual(3.4)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7800
     * @tc.name      testOverridingFieldsThree0078
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F382 = new A_F382()
        expect(A_F382.field instanceof float).assertTrue()
          expect(A_F382.field).assertEqual(7.3f)
          expect(Base_F382.field instanceof float).assertTrue()
          expect(Base_F382.field).assertEqual(6.7f)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_7900
     * @tc.name      testOverridingFieldsThree0079
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F383 = new A_F383()
        expect(A_F383.field instanceof long).assertTrue()
          expect(A_F383.field).assertEqual(78945)
          expect(Base_F383.field instanceof long).assertTrue()
          expect(Base_F383.field).assertEqual(9223372036854775807)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8000
     * @tc.name      testOverridingFieldsThree0080
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F384 = new A_F384()
        expect(A_F384.field instanceof int).assertTrue()
          expect(A_F384.field).assertEqual(321)
          expect(Base_F384.field instanceof int).assertTrue()
          expect(Base_F384.field).assertEqual(123)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8100
     * @tc.name      testOverridingFieldsThree0081
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F385 = new A_F385()
        expect(A_F385.field instanceof short).assertTrue()
          expect(A_F385.field).assertEqual(253)
          expect(Base_F385.field instanceof short).assertTrue()
          expect(Base_F385.field).assertEqual(325)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8200
     * @tc.name      testOverridingFieldsThree0082
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F386 = new A_F386()
        expect(A_F386.field instanceof byte).assertTrue()
          expect(A_F386.field).assertEqual(78)
          expect(Base_F386.field instanceof byte).assertTrue()
          expect(Base_F386.field).assertEqual(127)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8300
     * @tc.name      testOverridingFieldsThree0083
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F387 = new A_F387()
        expect(A_F387.field instanceof string).assertTrue()
          expect(A_F387.field).assertEqual("defg")
          expect(Base_F387.field instanceof string).assertTrue()
          expect(Base_F387.field).assertEqual("abc")

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8400
     * @tc.name      testOverridingFieldsThree0084
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F388 = new A_F388()
        expect(A_F388.field instanceof bigint).assertTrue()
          expect(A_F388.field).assertEqual(5556423623465n)
          expect(Base_F388.field instanceof bigint).assertTrue()
          expect(Base_F388.field).assertEqual(12345678901234567890n)

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8500
     * @tc.name      testOverridingFieldsThree0085
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F389 = new A_F389()
        expect(A_F389.field instanceof char).assertTrue()
          expect(A_F389.field).assertEqual(c'z')
          expect(Base_F389.field instanceof char).assertTrue()
          expect(Base_F389.field).assertEqual(c'\u2028')

    })

    /**
     * @tc.number    SUB_OVERRIDING_FIELDS_THREE_8600
     * @tc.name      testOverridingFieldsThree0086
     * @tc.desc      Checking static field declaration in derived class with same name and same type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testOverridingFieldsThree0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F390 = new A_F390()
        expect(A_F390.field instanceof boolean).assertTrue()
          expect(A_F390.field).assertEqual(true)
          expect(Base_F390.field instanceof boolean).assertTrue()
          expect(Base_F390.field).assertEqual(false)

    })
  })
}
