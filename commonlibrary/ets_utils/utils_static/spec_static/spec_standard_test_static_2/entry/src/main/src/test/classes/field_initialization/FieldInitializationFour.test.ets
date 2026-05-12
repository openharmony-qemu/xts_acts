/*
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

class Base_F397 {
    protected v: short = 4
  }
  class A_F397 extends Base_F397 {
    field: short
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F398 {
    protected v: double = 4
  }
  class A_F398 extends Base_F398 {
    field: double
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F399 {
    protected v: number = 4
  }
  class A_F399 extends Base_F399 {
    field: number
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F400 {
    protected v: float = 4.5f
  }
  class A_F400 extends Base_F400 {
    field: float
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F401 {
    protected v: bigint = 4n
  }
  class A_F401 extends Base_F401 {
    field: bigint
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F402 {
    protected v: string = "abc"
  }
  class A_F402 extends Base_F402 {
    field: string
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F403 {
    protected v: char = c'a'
  }
  class A_F403 extends Base_F403 {
    field: char
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F404 {
    protected v: boolean = false
  }
  class A_F404 extends Base_F404 {
    field: boolean
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F405 {
    protected v: Object = 4
  }
  class A_F405 extends Base_F405 {
    field: Object
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F406 {
    protected v: Object | undefined = undefined
  }
  class A_F406 extends Base_F406 {
    field: Object | undefined
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F407 {
    protected v: Object | undefined | null = 4
  }
  class A_F407 extends Base_F407 {
    field: Object | undefined | null
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F408 {
    protected v: Any = 4
  }
  class A_F408 extends Base_F408 {
    field: Any
    constructor () {
      super()
      this.field = this.v
    }
  }

class A_F409 {
    protected _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F410 {
    protected _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F411 {
    protected _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F412 {
    protected _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F413 {
    protected _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F414 {
    protected _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F415 {
    protected _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor () {
      this._field = 4.5f
    }
  }

class A_F416 {
    protected _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor () {
      this._field = 4n
    }
  }

class A_F417 {
    protected _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor () {
      this._field = "abc"
    }
  }

class A_F418 {
    protected _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor () {
      this._field = c'a'
    }
  }

class A_F419 {
    protected _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
    constructor () {
      this._field = false
    }
  }

class A_F420 {
    protected _field: Object
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F421 {
    protected _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
    constructor () {
      this._field = undefined
    }
  }

class A_F422 {
    protected _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F423 {
    protected _field: Any
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class Base_F424 {
    private _v: long = 4
    get v(): long {
      return this._v
    }
  }
  class A_F424 extends Base_F424 {
    field: long
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F425 {
    private _v: int = 4
    get v(): int {
      return this._v
    }
  }
  class A_F425 extends Base_F425 {
    field: int
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F426 {
    private _v: byte = 4
    get v(): byte {
      return this._v
    }
  }
  class A_F426 extends Base_F426 {
    field: byte
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F427 {
    private _v: short = 4
    get v(): short {
      return this._v
    }
  }
  class A_F427 extends Base_F427 {
    field: short
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F428 {
    private _v: double = 4
    get v(): double {
      return this._v
    }
  }
  class A_F428 extends Base_F428 {
    field: double
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F429 {
    private _v: number = 4
    get v(): number {
      return this._v
    }
  }
  class A_F429 extends Base_F429 {
    field: number
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F430 {
    private _v: float = 4.5f
    get v(): float {
      return this._v
    }
  }
  class A_F430 extends Base_F430 {
    field: float
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F431 {
    private _v: bigint = 4n
    get v(): bigint {
      return this._v
    }
  }
  class A_F431 extends Base_F431 {
    field: bigint
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F432 {
    private _v: string = "abc"
    get v(): string {
      return this._v
    }
  }
  class A_F432 extends Base_F432 {
    field: string
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F433 {
    private _v: char = c'a'
    get v(): char {
      return this._v
    }
  }
  class A_F433 extends Base_F433 {
    field: char
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F434 {
    private _v: boolean = false
    get v(): boolean {
      return this._v
    }
  }
  class A_F434 extends Base_F434 {
    field: boolean
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F435 {
    private _v: Object = 4
    get v(): Object {
      return this._v
    }
  }
  class A_F435 extends Base_F435 {
    field: Object
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F436 {
    private _v: Object | undefined = undefined
    get v(): Object | undefined {
      return this._v
    }
  }
  class A_F436 extends Base_F436 {
    field: Object | undefined
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F437 {
    private _v: Object | undefined | null = 4
    get v(): Object | undefined | null {
      return this._v
    }
  }
  class A_F437 extends Base_F437 {
    field: Object | undefined | null
    constructor () {
      super()
      this.field = super.v
    }
  }

class Base_F438 {
    private _v: Any = 4
    get v(): Any {
      return this._v
    }
  }
  class A_F438 extends Base_F438 {
    field: Any
    constructor () {
      super()
      this.field = super.v
    }
  }

class A_F439 {
    private _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F440 {
    private _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F441 {
    private _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F442 {
    private _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F443 {
    private _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F444 {
    private _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F445 {
    private _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor () {
      this._field = 4.5f
    }
  }

class A_F446 {
    private _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor () {
      this._field = 4n
    }
  }

class A_F447 {
    private _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor () {
      this._field = "abc"
    }
  }

class A_F448 {
    private _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor () {
      this._field = c'a'
    }
  }

class A_F449 {
    private _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
    constructor () {
      this._field = false
    }
  }

class A_F450 {
    private _field: Object
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F451 {
    private _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
    constructor () {
      this._field = undefined
    }
  }

class A_F452 {
    private _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F453 {
    private _field: Any
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
    constructor () {
      this._field = 4
    }
  }

class A_F454 {
    private _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor (arg: long = 4) {
      this._field = arg
    }
  }

class A_F455 {
    private _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor (arg: int = 4) {
      this._field = arg
    }
  }

class A_F456 {
    private _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor (arg: byte = 4) {
      this._field = arg
    }
  }

class A_F457 {
    private _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor (arg: short = 4) {
      this._field = arg
    }
  }

class A_F458 {
    private _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor (arg: double = 4) {
      this._field = arg
    }
  }

class A_F459 {
    private _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor (arg: int = 4) {
      this._field = arg
    }
  }

class A_F460 {
    private _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor (arg: float = 4.5f) {
      this._field = arg
    }
  }

class A_F461 {
    private _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor (arg: bigint = 4n) {
      this._field = arg
    }
  }

class A_F462 {
    private _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor (arg: string = "abc") {
      this._field = arg
    }
  }

class A_F463 {
    private _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor (arg: char = c'a') {
      this._field = arg
    }
  }

class A_F464 {
    private _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
    constructor (arg: boolean = false) {
      this._field = arg
    }
  }

class A_F465 {
    private _field: Object
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
    constructor (arg: Object = 4) {
      this._field = arg
    }
  }

class A_F466 {
    private _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
    constructor (arg: Object | undefined = undefined) {
      this._field = arg
    }
  }

class A_F467 {
    private _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
    constructor (arg: Object | undefined | null = 4) {
      this._field = arg
    }
  }

class A_F468 {
    private _field: Any
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
    constructor (arg: Any = 4) {
      this._field = arg
    }
  }

class A_F469 {
    private _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F470 {
    private _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F471 {
    private _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F472 {
    private _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F473 {
    private _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F474 {
    private _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F475 {
    private _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4.5f
    }
  }

class A_F476 {
    private _field: bigint
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4n
    }
  }

class A_F477 {
    private _field: string
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = "abc"
    }
  }

class A_F478 {
    private _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = c'a'
    }
  }

class A_F479 {
    private _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = false
    }
  }

class A_F480 {
    private _field: Object
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F481 {
    private _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = undefined
    }
  }

class A_F482 {
    private _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class A_F483 {
    private _field: Any
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = 4
    }
  }

class C_F484 {data: int = 0}
  class A_F484 {
    field: C_F484
    constructor () {
      this.field = {data: 4}
    }
  }

class C_F485 {data: int = 0}
  class A_F485 {
    field: C_F485
    constructor (arg: C_F485 = {data: 4}) {
      this.field = arg
    }
  }

class C_F486 {data: int = 0}
  class A_F486 {
    field: C_F486
    constructor (...args: Any[]) {
      this.field = {data: 4}
    }
  }

class C_F487 {data: int = 0}
  class Base_F487 {
    protected v: C_F487 = {data: 4}
  }
  class A_F487 extends Base_F487 {
    field: C_F487
    constructor () {
      super()
      this.field = this.v
    }
  }

class C_F488 {data: int = 0}
  class A_F488 {
    protected _field: C_F488
    get field(): C_F488 {
      return this._field
    }
    set field(a: C_F488) {
      this._field = a
    }
    constructor () {
      this._field = {data: 4}
    }
  }

class C_F489 {data: int = 0}
  class Base_F489 {
    private _v: C_F489 = {data: 4}
    get v(): C_F489 {
      return this._v
    }
  }
  class A_F489 extends Base_F489 {
    field: C_F489
    constructor () {
      super()
      this.field = super.v
    }
  }

class C_F490 {data: int = 0}
  class A_F490 {
    private _field: C_F490
    get field(): C_F490 {
      return this._field
    }
    set field(a: C_F490) {
      this._field = a
    }
    constructor () {
      this._field = {data: 4}
    }
  }

class C_F491 {data: int = 0}
  class A_F491 {
    private _field: C_F491
    get field(): C_F491 {
      return this._field
    }
    set field(a: C_F491) {
      this._field = a
    }
    constructor (arg: C_F491 = {data: 4}) {
      this._field = arg
    }
  }

class C_F492 {data: int = 0}
  class A_F492 {
    private _field: C_F492
    get field(): C_F492 {
      return this._field
    }
    set field(a: C_F492) {
      this._field = a
    }
    constructor (...args: Any[]) {
      this._field = {data: 4}
    }
  }

class Base_F493 {
    protected _field: long
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
  }
  class A_F493 extends Base_F493 {
    constructor () {
      super()
      this._field = 4
    }
  }

class Base_F494 {
    protected _field: int
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
  }
  class A_F494 extends Base_F494 {
    constructor () {
      super()
      this._field = 4
    }
  }

class Base_F495 {
    protected _field: byte
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
  }
  class A_F495 extends Base_F495 {
    constructor () {
      super()
      this._field = 4
    }
  }

export default function FieldInitializationTestFour(): void {
  describe("FieldInitializationTestFour", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0397
     * @tc.name      testFieldInit0397
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0397", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F397 = new A_F397()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0398
     * @tc.name      testFieldInit0398
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0398", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F398 = new A_F398()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0399
     * @tc.name      testFieldInit0399
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0399", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F399 = new A_F399()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0400
     * @tc.name      testFieldInit0400
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F400 = new A_F400()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0401
     * @tc.name      testFieldInit0401
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F401 = new A_F401()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0402
     * @tc.name      testFieldInit0402
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F402 = new A_F402()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0403
     * @tc.name      testFieldInit0403
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0403", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F403 = new A_F403()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0404
     * @tc.name      testFieldInit0404
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0404", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F404 = new A_F404()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0405
     * @tc.name      testFieldInit0405
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0405", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F405 = new A_F405()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0406
     * @tc.name      testFieldInit0406
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0406", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F406 = new A_F406()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0407
     * @tc.name      testFieldInit0407
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0407", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F407 = new A_F407()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0408
     * @tc.name      testFieldInit0408
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0408", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F408 = new A_F408()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0409
     * @tc.name      testFieldInit0409
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0409", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F409 = new A_F409()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0410
     * @tc.name      testFieldInit0410
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F410 = new A_F410()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0411
     * @tc.name      testFieldInit0411
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0411", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F411 = new A_F411()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0412
     * @tc.name      testFieldInit0412
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0412", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F412 = new A_F412()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0413
     * @tc.name      testFieldInit0413
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0413", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F413 = new A_F413()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0414
     * @tc.name      testFieldInit0414
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0414", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F414 = new A_F414()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0415
     * @tc.name      testFieldInit0415
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0415", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F415 = new A_F415()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0416
     * @tc.name      testFieldInit0416
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0416", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F416 = new A_F416()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0417
     * @tc.name      testFieldInit0417
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0417", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F417 = new A_F417()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0418
     * @tc.name      testFieldInit0418
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0418", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F418 = new A_F418()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0419
     * @tc.name      testFieldInit0419
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0419", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F419 = new A_F419()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0420
     * @tc.name      testFieldInit0420
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F420 = new A_F420()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0421
     * @tc.name      testFieldInit0421
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0421", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F421 = new A_F421()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0422
     * @tc.name      testFieldInit0422
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0422", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F422 = new A_F422()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0423
     * @tc.name      testFieldInit0423
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0423", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F423 = new A_F423()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0424
     * @tc.name      testFieldInit0424
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0424", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F424 = new A_F424()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0425
     * @tc.name      testFieldInit0425
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0425", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F425 = new A_F425()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0426
     * @tc.name      testFieldInit0426
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0426", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F426 = new A_F426()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0427
     * @tc.name      testFieldInit0427
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0427", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F427 = new A_F427()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0428
     * @tc.name      testFieldInit0428
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0428", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F428 = new A_F428()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0429
     * @tc.name      testFieldInit0429
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0429", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F429 = new A_F429()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0430
     * @tc.name      testFieldInit0430
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F430 = new A_F430()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0431
     * @tc.name      testFieldInit0431
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0431", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F431 = new A_F431()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0432
     * @tc.name      testFieldInit0432
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0432", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F432 = new A_F432()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0433
     * @tc.name      testFieldInit0433
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0433", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F433 = new A_F433()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0434
     * @tc.name      testFieldInit0434
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0434", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F434 = new A_F434()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0435
     * @tc.name      testFieldInit0435
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0435", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F435 = new A_F435()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0436
     * @tc.name      testFieldInit0436
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0436", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F436 = new A_F436()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0437
     * @tc.name      testFieldInit0437
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0437", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F437 = new A_F437()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0438
     * @tc.name      testFieldInit0438
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0438", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F438 = new A_F438()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0439
     * @tc.name      testFieldInit0439
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0439", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F439 = new A_F439()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0440
     * @tc.name      testFieldInit0440
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F440 = new A_F440()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0441
     * @tc.name      testFieldInit0441
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0441", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F441 = new A_F441()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0442
     * @tc.name      testFieldInit0442
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0442", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F442 = new A_F442()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0443
     * @tc.name      testFieldInit0443
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0443", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F443 = new A_F443()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0444
     * @tc.name      testFieldInit0444
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0444", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F444 = new A_F444()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0445
     * @tc.name      testFieldInit0445
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0445", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F445 = new A_F445()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0446
     * @tc.name      testFieldInit0446
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0446", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F446 = new A_F446()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0447
     * @tc.name      testFieldInit0447
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0447", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F447 = new A_F447()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0448
     * @tc.name      testFieldInit0448
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0448", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F448 = new A_F448()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0449
     * @tc.name      testFieldInit0449
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0449", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F449 = new A_F449()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0450
     * @tc.name      testFieldInit0450
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0450", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F450 = new A_F450()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0451
     * @tc.name      testFieldInit0451
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0451", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F451 = new A_F451()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0452
     * @tc.name      testFieldInit0452
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0452", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F452 = new A_F452()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0453
     * @tc.name      testFieldInit0453
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0453", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F453 = new A_F453()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0454
     * @tc.name      testFieldInit0454
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0454", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F454 = new A_F454()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0455
     * @tc.name      testFieldInit0455
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0455", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F455 = new A_F455()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0456
     * @tc.name      testFieldInit0456
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0456", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F456 = new A_F456()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0457
     * @tc.name      testFieldInit0457
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0457", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F457 = new A_F457()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0458
     * @tc.name      testFieldInit0458
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0458", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F458 = new A_F458()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0459
     * @tc.name      testFieldInit0459
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0459", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F459 = new A_F459()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0460
     * @tc.name      testFieldInit0460
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0460", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F460 = new A_F460()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0461
     * @tc.name      testFieldInit0461
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0461", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F461 = new A_F461()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0462
     * @tc.name      testFieldInit0462
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0462", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F462 = new A_F462()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0463
     * @tc.name      testFieldInit0463
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0463", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F463 = new A_F463()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0464
     * @tc.name      testFieldInit0464
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0464", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F464 = new A_F464()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0465
     * @tc.name      testFieldInit0465
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0465", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F465 = new A_F465()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0466
     * @tc.name      testFieldInit0466
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0466", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F466 = new A_F466()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0467
     * @tc.name      testFieldInit0467
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0467", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F467 = new A_F467()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0468
     * @tc.name      testFieldInit0468
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0468", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F468 = new A_F468()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0469
     * @tc.name      testFieldInit0469
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0469", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F469 = new A_F469()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0470
     * @tc.name      testFieldInit0470
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0470", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F470 = new A_F470()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0471
     * @tc.name      testFieldInit0471
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0471", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F471 = new A_F471()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0472
     * @tc.name      testFieldInit0472
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0472", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F472 = new A_F472()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0473
     * @tc.name      testFieldInit0473
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0473", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F473 = new A_F473()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0474
     * @tc.name      testFieldInit0474
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0474", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F474 = new A_F474()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0475
     * @tc.name      testFieldInit0475
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0475", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F475 = new A_F475()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0476
     * @tc.name      testFieldInit0476
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0476", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F476 = new A_F476()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0477
     * @tc.name      testFieldInit0477
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0477", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F477 = new A_F477()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0478
     * @tc.name      testFieldInit0478
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0478", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F478 = new A_F478()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0479
     * @tc.name      testFieldInit0479
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0479", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F479 = new A_F479()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0480
     * @tc.name      testFieldInit0480
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0480", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F480 = new A_F480()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0481
     * @tc.name      testFieldInit0481
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0481", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F481 = new A_F481()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0482
     * @tc.name      testFieldInit0482
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0482", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F482 = new A_F482()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0483
     * @tc.name      testFieldInit0483
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0483", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F483 = new A_F483()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0484
     * @tc.name      testFieldInit0484
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0484", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F484 = new A_F484()
      expect(a.field instanceof C_F484).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F484).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0485
     * @tc.name      testFieldInit0485
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0485", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F485 = new A_F485()
      expect(a.field instanceof C_F485).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F485).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0486
     * @tc.name      testFieldInit0486
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0486", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F486 = new A_F486()
      expect(a.field instanceof C_F486).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F486).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0487
     * @tc.name      testFieldInit0487
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0487", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F487 = new A_F487()
      expect(a.field instanceof C_F487).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F487).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0488
     * @tc.name      testFieldInit0488
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0488", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F488 = new A_F488()
      expect(a.field instanceof C_F488).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F488).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0489
     * @tc.name      testFieldInit0489
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0489", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F489 = new A_F489()
      expect(a.field instanceof C_F489).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F489).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0490
     * @tc.name      testFieldInit0490
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0490", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F490 = new A_F490()
      expect(a.field instanceof C_F490).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F490).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0491
     * @tc.name      testFieldInit0491
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0491", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F491 = new A_F491()
      expect(a.field instanceof C_F491).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F491).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0492
     * @tc.name      testFieldInit0492
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0492", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F492 = new A_F492()
      expect(a.field instanceof C_F492).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F492).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0493
     * @tc.name      testFieldInit0493
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0493", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F493 = new A_F493()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0494
     * @tc.name      testFieldInit0494
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0494", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F494 = new A_F494()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0495
     * @tc.name      testFieldInit0495
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0495", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F495 = new A_F495()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
