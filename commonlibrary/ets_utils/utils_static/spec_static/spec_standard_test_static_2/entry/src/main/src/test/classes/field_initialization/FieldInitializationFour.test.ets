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

export default function FieldInitializationFourTest(): void {
  describe("FieldInitializationFourTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_0100
     * @tc.name      testFieldInitFour0001
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F397 = new A_F397()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0200
     * @tc.name      testFieldInitFour0002
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F398 = new A_F398()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0300
     * @tc.name      testFieldInitFour0003
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F399 = new A_F399()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0400
     * @tc.name      testFieldInitFour0004
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F400 = new A_F400()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0500
     * @tc.name      testFieldInitFour0005
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F401 = new A_F401()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0600
     * @tc.name      testFieldInitFour0006
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F402 = new A_F402()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0700
     * @tc.name      testFieldInitFour0007
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F403 = new A_F403()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0800
     * @tc.name      testFieldInitFour0008
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F404 = new A_F404()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_0900
     * @tc.name      testFieldInitFour0009
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F405 = new A_F405()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1000
     * @tc.name      testFieldInitFour0010
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F406 = new A_F406()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1100
     * @tc.name      testFieldInitFour0011
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F407 = new A_F407()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1200
     * @tc.name      testFieldInitFour0012
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F409 = new A_F409()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1300
     * @tc.name      testFieldInitFour0013
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F410 = new A_F410()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1400
     * @tc.name      testFieldInitFour0014
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F411 = new A_F411()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1500
     * @tc.name      testFieldInitFour0015
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F412 = new A_F412()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1600
     * @tc.name      testFieldInitFour0016
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F413 = new A_F413()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1700
     * @tc.name      testFieldInitFour0017
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F414 = new A_F414()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1800
     * @tc.name      testFieldInitFour0018
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F415 = new A_F415()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_1900
     * @tc.name      testFieldInitFour0019
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F416 = new A_F416()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2000
     * @tc.name      testFieldInitFour0020
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F417 = new A_F417()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2100
     * @tc.name      testFieldInitFour0021
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F418 = new A_F418()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2200
     * @tc.name      testFieldInitFour0022
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F419 = new A_F419()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2300
     * @tc.name      testFieldInitFour0023
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F420 = new A_F420()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2400
     * @tc.name      testFieldInitFour0024
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F421 = new A_F421()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2500
     * @tc.name      testFieldInitFour0025
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F422 = new A_F422()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2600
     * @tc.name      testFieldInitFour0026
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F424 = new A_F424()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2700
     * @tc.name      testFieldInitFour0027
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F425 = new A_F425()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2800
     * @tc.name      testFieldInitFour0028
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F426 = new A_F426()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_2900
     * @tc.name      testFieldInitFour0029
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F427 = new A_F427()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3000
     * @tc.name      testFieldInitFour0030
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F428 = new A_F428()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3100
     * @tc.name      testFieldInitFour0031
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F429 = new A_F429()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3200
     * @tc.name      testFieldInitFour0032
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F430 = new A_F430()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3300
     * @tc.name      testFieldInitFour0033
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F431 = new A_F431()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3400
     * @tc.name      testFieldInitFour0034
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F432 = new A_F432()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3500
     * @tc.name      testFieldInitFour0035
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F433 = new A_F433()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3600
     * @tc.name      testFieldInitFour0036
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F434 = new A_F434()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3700
     * @tc.name      testFieldInitFour0037
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F435 = new A_F435()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3800
     * @tc.name      testFieldInitFour0038
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F436 = new A_F436()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_3900
     * @tc.name      testFieldInitFour0039
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F437 = new A_F437()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4000
     * @tc.name      testFieldInitFour0040
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F439 = new A_F439()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4100
     * @tc.name      testFieldInitFour0041
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F440 = new A_F440()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4200
     * @tc.name      testFieldInitFour0042
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F441 = new A_F441()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4300
     * @tc.name      testFieldInitFour0043
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F442 = new A_F442()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4400
     * @tc.name      testFieldInitFour0044
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F443 = new A_F443()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4500
     * @tc.name      testFieldInitFour0045
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F444 = new A_F444()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4600
     * @tc.name      testFieldInitFour0046
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F445 = new A_F445()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4700
     * @tc.name      testFieldInitFour0047
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F446 = new A_F446()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4800
     * @tc.name      testFieldInitFour0048
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F447 = new A_F447()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_4900
     * @tc.name      testFieldInitFour0049
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F448 = new A_F448()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5000
     * @tc.name      testFieldInitFour0050
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F449 = new A_F449()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5100
     * @tc.name      testFieldInitFour0051
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F450 = new A_F450()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5200
     * @tc.name      testFieldInitFour0052
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F451 = new A_F451()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5300
     * @tc.name      testFieldInitFour0053
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F452 = new A_F452()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5400
     * @tc.name      testFieldInitFour0054
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F454 = new A_F454()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5500
     * @tc.name      testFieldInitFour0055
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F455 = new A_F455()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5600
     * @tc.name      testFieldInitFour0056
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F456 = new A_F456()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5700
     * @tc.name      testFieldInitFour0057
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F457 = new A_F457()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5800
     * @tc.name      testFieldInitFour0058
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F458 = new A_F458()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_5900
     * @tc.name      testFieldInitFour0059
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F459 = new A_F459()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6000
     * @tc.name      testFieldInitFour0060
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F460 = new A_F460()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6100
     * @tc.name      testFieldInitFour0061
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F461 = new A_F461()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6200
     * @tc.name      testFieldInitFour0062
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F462 = new A_F462()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6300
     * @tc.name      testFieldInitFour0063
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F463 = new A_F463()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6400
     * @tc.name      testFieldInitFour0064
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F464 = new A_F464()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6500
     * @tc.name      testFieldInitFour0065
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F465 = new A_F465()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6600
     * @tc.name      testFieldInitFour0066
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F466 = new A_F466()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6700
     * @tc.name      testFieldInitFour0067
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F467 = new A_F467()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_6800
     * @tc.name      testFieldInitFour0068
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_6900
     * @tc.name      testFieldInitFour0069
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_7000
     * @tc.name      testFieldInitFour0070
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_7100
     * @tc.name      testFieldInitFour0071
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_7200
     * @tc.name      testFieldInitFour0072
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_7300
     * @tc.name      testFieldInitFour0073
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_7400
     * @tc.name      testFieldInitFour0074
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_FOUR_7500
     * @tc.name      testFieldInitFour0075
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F493 = new A_F493()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_7600
     * @tc.name      testFieldInitFour0076
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F494 = new A_F494()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FOUR_7700
     * @tc.name      testFieldInitFour0077
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFour0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F495 = new A_F495()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
