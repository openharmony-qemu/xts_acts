'use static'
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
} from "../../../../../hypium/index";
import Utils from '../../Util.test'

class Base_F298 {
  field: byte = 5
}
class A_F298 extends Base_F298 {
  override field: byte = 5
}

class Base_F299 {
  field: short = 5
}
class A_F299 extends Base_F299 {
  override field: short = 5
}

class Base_F300 {
  field: double = 7.3
}
class A_F300 extends Base_F300 {
  override field: double = 7.3
}

class Base_F301 {
  field: number = 5
}
class A_F301 extends Base_F301 {
  override field: number = 5
}

class Base_F302 {
  field: float = 7.3f
}
class A_F302 extends Base_F302 {
  override field: float = 7.3f
}

class Base_F303 {
  field: bigint = 5n
}
class A_F303 extends Base_F303 {
  override field: bigint = 5n
}

class Base_F304 {
  field: string = "abc"
}
class A_F304 extends Base_F304 {
  override field: string = "abc"
}

class Base_F305 {
  field: char = c'a'
}
class A_F305 extends Base_F305 {
  override field: char = c'a'
}

class Base_F306 {
  field: boolean = false
}
class A_F306 extends Base_F306 {
  override field: boolean = false
}

class Base_F307 {
  field: Object = 5
}
class A_F307 extends Base_F307 {
  override field: Object = 5
}

class Base_F308 {
  field: long = 5
}
class A_F308 extends Base_F308 {
  override field: long = 5
}

class Base_F309 {
  field: int = 5
}
class A_F309 extends Base_F309 {
  override field: int = 5
}

class Base_F310 {
  field: byte = 5
}
class A_F310 extends Base_F310 {
  override field: byte = 5
}

class Base_F311 {
  field: short = 5
}
class A_F311 extends Base_F311 {
  override field: short = 5
}

class Base_F312 {
  field: double = 7.3
}
class A_F312 extends Base_F312 {
  override field: double = 7.3
}

class Base_F313 {
  field: number = 5
}
class A_F313 extends Base_F313 {
  override field: number = 5
}

class Base_F314 {
  field: float = 7.3f
}
class A_F314 extends Base_F314 {
  override field: float = 7.3f
}

class Base_F315 {
  field: bigint = 5n
}
class A_F315 extends Base_F315 {
  override field: bigint = 5n
}

class Base_F316 {
  field: string = "abc"
}
class A_F316 extends Base_F316 {
  override field: string = "abc"
}

class Base_F317 {
  field: char = c'a'
}
class A_F317 extends Base_F317 {
  override field: char = c'a'
}

class Base_F318 {
  field: boolean = false
}
class A_F318 extends Base_F318 {
  override field: boolean = false
}

class Base_F319 {
  field: Object = 5
}
class A_F319 extends Base_F319 {
  override field: Object = 5
}

interface I_F320 {
  field: long
}
class A_F320 implements I_F320 {
  field!: long
}

interface I_F321 {
  field: int
}
class A_F321 implements I_F321 {
  field!: int
}

interface I_F322 {
  field: byte
}
class A_F322 implements I_F322 {
  field!: byte
}

interface I_F323 {
  field: short
}
class A_F323 implements I_F323 {
  field!: short
}

interface I_F324 {
  field: double
}
class A_F324 implements I_F324 {
  field!: double
}

interface I_F325 {
  field: number
}
class A_F325 implements I_F325 {
  field!: number
}

interface I_F326 {
  field: float
}
class A_F326 implements I_F326 {
  field!: float
}

interface I_F327 {
  field: bigint
}
class A_F327 implements I_F327 {
  field!: bigint
}

interface I_F328 {
  field: string
}
class A_F328 implements I_F328 {
  field!: string
}

interface I_F329 {
  field: char
}
class A_F329 implements I_F329 {
  field!: char
}

interface I_F330 {
  field: boolean
}
class A_F330 implements I_F330 {
  field!: boolean
}

interface I_F331 {
  field: Object
}
class A_F331 implements I_F331 {
  field!: Object
}

interface I_F332 {
  field: long
}
class A_F332 implements I_F332 {
  field!: long
}

interface I_F333 {
  field: int
}
class A_F333 implements I_F333 {
  field!: int
}

interface I_F334 {
  field: byte
}
class A_F334 implements I_F334 {
  field!: byte
}

interface I_F335 {
  field: short
}
class A_F335 implements I_F335 {
  field!: short
}

interface I_F336 {
  field: double
}
class A_F336 implements I_F336 {
  field!: double
}

interface I_F337 {
  field: number
}
class A_F337 implements I_F337 {
  field!: number
}

interface I_F338 {
  field: float
}
class A_F338 implements I_F338 {
  field!: float
}

interface I_F339 {
  field: bigint
}
class A_F339 implements I_F339 {
  field!: bigint
}

interface I_F340 {
  field: string
}
class A_F340 implements I_F340 {
  field!: string
}

interface I_F341 {
  field: char
}
class A_F341 implements I_F341 {
  field!: char
}

interface I_F342 {
  field: boolean
}
class A_F342 implements I_F342 {
  field!: boolean
}

interface I_F343 {
  field: Object
}
class A_F343 implements I_F343 {
  field!: Object
}

class Base_F344 {
  _field!: long
  get field(): long {
    return this._field
  }
}
class A_F344 extends Base_F344 {
  constructor () {
    super()
    this._field = 5
  }
}

class Base_F345 {
  _field!: int
  get field(): int {
    return this._field
  }
}
class A_F345 extends Base_F345 {
  constructor () {
    super()
    this._field = 5
  }
}

class Base_F346 {
  _field!: double
  get field(): double {
    return this._field
  }
}
class A_F346 extends Base_F346 {
  constructor () {
    super()
    this._field = 7.3
  }
}

class Base_F347 {
  _field!: string
  get field(): string {
    return this._field
  }
}
class A_F347 extends Base_F347 {
  constructor () {
    super()
    this._field = "abc"
  }
}

class Base_F348 {
  _field!: Object
  get field(): Object {
    return this._field
  }
}
class A_F348 extends Base_F348 {
  constructor () {
    super()
    this._field = 5
  }
}

class Base_F349 {
  protected _field!: long
  get field(): long {
    return this._field
  }
}
class A_F349 extends Base_F349 {
  constructor () {
    super()
    this._field = 5
  }
}

class Base_F350 {
  protected _field!: int
  get field(): int {
    return this._field
  }
}
class A_F350 extends Base_F350 {
  constructor () {
    super()
    this._field = 5
  }
}

class Base_F351 {
  protected _field!: double
  get field(): double {
    return this._field
  }
}
class A_F351 extends Base_F351 {
  constructor () {
    super()
    this._field = 7.3
  }
}

class Base_F352 {
  protected _field!: string
  get field(): string {
    return this._field
  }
}
class A_F352 extends Base_F352 {
  constructor () {
    super()
    this._field = "abc"
  }
}

class Base_F353 {
  protected _field!: Object
  get field(): Object {
    return this._field
  }
}
class A_F353 extends Base_F353 {
  constructor () {
    super()
    this._field = 5
  }
}

class Base_F354 {
  _field!: long
  get field(): long {
    return this._field
  }
}
class A_F354 extends Base_F354 {
  constructor (arg: long = 5) {
    super()
    this._field = arg
  }
}

class Base_F355 {
  _field!: int
  get field(): int {
    return this._field
  }
}
class A_F355 extends Base_F355 {
  constructor (arg: int = 5) {
    super()
    this._field = arg
  }
}

class Base_F356 {
  _field!: double
  get field(): double {
    return this._field
  }
}
class A_F356 extends Base_F356 {
  constructor (arg: double = 7.3) {
    super()
    this._field = arg
  }
}

class Base_F357 {
  _field!: string
  get field(): string {
    return this._field
  }
}
class A_F357 extends Base_F357 {
  constructor (arg: string = "abc") {
    super()
    this._field = arg
  }
}

class Base_F358 {
  _field!: Object
  get field(): Object {
    return this._field
  }
}
class A_F358 extends Base_F358 {
  constructor (arg: Object = 5) {
    super()
    this._field = arg
  }
}

class Base_F359 {
  protected _field!: long
  get field(): long {
    return this._field
  }
}
class A_F359 extends Base_F359 {
  constructor (arg: long = 5) {
    super()
    this._field = arg
  }
}

class Base_F360 {
  protected _field!: int
  get field(): int {
    return this._field
  }
}
class A_F360 extends Base_F360 {
  constructor (arg: int = 5) {
    super()
    this._field = arg
  }
}

class Base_F361 {
  protected _field!: double
  get field(): double {
    return this._field
  }
}
class A_F361 extends Base_F361 {
  constructor (arg: double = 7.3) {
    super()
    this._field = arg
  }
}

class Base_F362 {
  protected _field!: string
  get field(): string {
    return this._field
  }
}
class A_F362 extends Base_F362 {
  constructor (arg: string = "abc") {
    super()
    this._field = arg
  }
}

class Base_F363 {
  protected _field!: Object
  get field(): Object {
    return this._field
  }
}
class A_F363 extends Base_F363 {
  constructor (arg: Object = 5) {
    super()
    this._field = arg
  }
}

class Base_F374 {
  field!: long
}
class A_F374 extends Base_F374 {
}

class Base_F375 {
  field!: int
}
class A_F375 extends Base_F375 {
}

class Base_F376 {
  field!: byte
}
class A_F376 extends Base_F376 {
}

class Base_F377 {
  field!: short
}
class A_F377 extends Base_F377 {
}

class Base_F378 {
  field!: double
}
class A_F378 extends Base_F378 {
}

class Base_F379 {
  field!: number
}
class A_F379 extends Base_F379 {
}

class Base_F380 {
  field!: float
}
class A_F380 extends Base_F380 {
}

class Base_F381 {
  field!: bigint
}
class A_F381 extends Base_F381 {
}

class Base_F382 {
  field!: string
}
class A_F382 extends Base_F382 {
}

class Base_F383 {
  field!: char
}
class A_F383 extends Base_F383 {
}

class Base_F384 {
  field!: boolean
}
class A_F384 extends Base_F384 {
}

class Base_F385 {
  field!: Object
}
class A_F385 extends Base_F385 {
}

class A_F386 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor () {
    this._field = 5
  }
}

class A_F387 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor () {
    this._field = 5
  }
}

class A_F388 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor () {
    this._field = 7.3
  }
}

class A_F389 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor () {
    this._field = "abc"
  }
}

class A_F390 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor () {
    this._field = 5
  }
}

class A_F391 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor () {
    this._field = 5
  }
}

class A_F392 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor () {
    this._field = 5
  }
}

class A_F393 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor () {
    this._field = 7.3
  }
}

class A_F394 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor () {
    this._field = "abc"
  }
}

class A_F395 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor () {
    this._field = 5
  }
}

class A_F396 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor (arg: long = 5) {
    this._field = arg
  }
}

export default function FieldsLateInitThreeTest(): void {
  describe("FieldsLateInitThreeTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
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
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0100
     * @tc.name      testFieldsLateInitThree0001
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F298 = new A_F298()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0200
     * @tc.name      testFieldsLateInitThree0002
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F299 = new A_F299()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0300
     * @tc.name      testFieldsLateInitThree0003
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F300 = new A_F300()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0400
     * @tc.name      testFieldsLateInitThree0004
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F301 = new A_F301()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0500
     * @tc.name      testFieldsLateInitThree0005
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F302 = new A_F302()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0600
     * @tc.name      testFieldsLateInitThree0006
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F303 = new A_F303()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0700
     * @tc.name      testFieldsLateInitThree0007
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F304 = new A_F304()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0800
     * @tc.name      testFieldsLateInitThree0008
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F305 = new A_F305()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_0900
     * @tc.name      testFieldsLateInitThree0009
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F306 = new A_F306()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1000
     * @tc.name      testFieldsLateInitThree0010
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F307 = new A_F307()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1100
     * @tc.name      testFieldsLateInitThree0011
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F308 = new A_F308()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1200
     * @tc.name      testFieldsLateInitThree0012
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F309 = new A_F309()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1300
     * @tc.name      testFieldsLateInitThree0013
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F310 = new A_F310()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1400
     * @tc.name      testFieldsLateInitThree0014
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F311 = new A_F311()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1500
     * @tc.name      testFieldsLateInitThree0015
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F312 = new A_F312()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1600
     * @tc.name      testFieldsLateInitThree0016
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F313 = new A_F313()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1700
     * @tc.name      testFieldsLateInitThree0017
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F314 = new A_F314()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1800
     * @tc.name      testFieldsLateInitThree0018
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F315 = new A_F315()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_1900
     * @tc.name      testFieldsLateInitThree0019
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F316 = new A_F316()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2000
     * @tc.name      testFieldsLateInitThree0020
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F317 = new A_F317()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2100
     * @tc.name      testFieldsLateInitThree0021
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F318 = new A_F318()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2200
     * @tc.name      testFieldsLateInitThree0022
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F319 = new A_F319()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2300
     * @tc.name      testFieldsLateInitThree0023
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F320 = new A_F320()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2400
     * @tc.name      testFieldsLateInitThree0024
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F321 = new A_F321()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2500
     * @tc.name      testFieldsLateInitThree0025
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F322 = new A_F322()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2600
     * @tc.name      testFieldsLateInitThree0026
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F323 = new A_F323()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2700
     * @tc.name      testFieldsLateInitThree0027
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F324 = new A_F324()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2800
     * @tc.name      testFieldsLateInitThree0028
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F325 = new A_F325()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_2900
     * @tc.name      testFieldsLateInitThree0029
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F326 = new A_F326()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3000
     * @tc.name      testFieldsLateInitThree0030
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F327 = new A_F327()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3100
     * @tc.name      testFieldsLateInitThree0031
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F328 = new A_F328()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3200
     * @tc.name      testFieldsLateInitThree0032
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F329 = new A_F329()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3300
     * @tc.name      testFieldsLateInitThree0033
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F330 = new A_F330()
        a.field = false
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3400
     * @tc.name      testFieldsLateInitThree0034
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F331 = new A_F331()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3500
     * @tc.name      testFieldsLateInitThree0035
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F332 = new A_F332()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3600
     * @tc.name      testFieldsLateInitThree0036
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F333 = new A_F333()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3700
     * @tc.name      testFieldsLateInitThree0037
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F334 = new A_F334()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3800
     * @tc.name      testFieldsLateInitThree0038
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F335 = new A_F335()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_3900
     * @tc.name      testFieldsLateInitThree0039
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F336 = new A_F336()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4000
     * @tc.name      testFieldsLateInitThree0040
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F337 = new A_F337()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4100
     * @tc.name      testFieldsLateInitThree0041
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F338 = new A_F338()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4200
     * @tc.name      testFieldsLateInitThree0042
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F339 = new A_F339()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4300
     * @tc.name      testFieldsLateInitThree0043
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F340 = new A_F340()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4400
     * @tc.name      testFieldsLateInitThree0044
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F341 = new A_F341()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4500
     * @tc.name      testFieldsLateInitThree0045
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F342 = new A_F342()
        a.field = false
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4600
     * @tc.name      testFieldsLateInitThree0046
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F343 = new A_F343()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4700
     * @tc.name      testFieldsLateInitThree0047
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F344 = new A_F344()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F344 = new A_F344()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4800
     * @tc.name      testFieldsLateInitThree0048
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F345 = new A_F345()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F345 = new A_F345()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_4900
     * @tc.name      testFieldsLateInitThree0049
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F346 = new A_F346()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F346 = new A_F346()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5000
     * @tc.name      testFieldsLateInitThree0050
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F347 = new A_F347()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F347 = new A_F347()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5100
     * @tc.name      testFieldsLateInitThree0051
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F348 = new A_F348()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F348 = new A_F348()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5200
     * @tc.name      testFieldsLateInitThree0052
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F349 = new A_F349()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F349 = new A_F349()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5300
     * @tc.name      testFieldsLateInitThree0053
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F350 = new A_F350()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F350 = new A_F350()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5400
     * @tc.name      testFieldsLateInitThree0054
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F351 = new A_F351()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F351 = new A_F351()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5500
     * @tc.name      testFieldsLateInitThree0055
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F352 = new A_F352()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F352 = new A_F352()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5600
     * @tc.name      testFieldsLateInitThree0056
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F353 = new A_F353()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F353 = new A_F353()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5700
     * @tc.name      testFieldsLateInitThree0057
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F354 = new A_F354()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F354 = new A_F354()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5800
     * @tc.name      testFieldsLateInitThree0058
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F355 = new A_F355()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F355 = new A_F355()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_5900
     * @tc.name      testFieldsLateInitThree0059
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F356 = new A_F356()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F356 = new A_F356()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6000
     * @tc.name      testFieldsLateInitThree0060
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F357 = new A_F357()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F357 = new A_F357()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6100
     * @tc.name      testFieldsLateInitThree0061
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F358 = new A_F358()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F358 = new A_F358()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6200
     * @tc.name      testFieldsLateInitThree0062
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F359 = new A_F359()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F359 = new A_F359()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6300
     * @tc.name      testFieldsLateInitThree0063
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F360 = new A_F360()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F360 = new A_F360()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6400
     * @tc.name      testFieldsLateInitThree0064
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F361 = new A_F361()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F361 = new A_F361()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6500
     * @tc.name      testFieldsLateInitThree0065
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F362 = new A_F362()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F362 = new A_F362()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6600
     * @tc.name      testFieldsLateInitThree0066
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F363 = new A_F363()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F363 = new A_F363()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6700
     * @tc.name      testFieldsLateInitThree0067
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F374 = new A_F374()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F374 = new A_F374()
        b.field = 5
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6800
     * @tc.name      testFieldsLateInitThree0068
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F375 = new A_F375()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F375 = new A_F375()
        b.field = 5
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_6900
     * @tc.name      testFieldsLateInitThree0069
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F376 = new A_F376()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F376 = new A_F376()
        b.field = 5
        expect(b.field instanceof byte).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7000
     * @tc.name      testFieldsLateInitThree0070
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F377 = new A_F377()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F377 = new A_F377()
        b.field = 5
        expect(b.field instanceof short).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7100
     * @tc.name      testFieldsLateInitThree0071
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F378 = new A_F378()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F378 = new A_F378()
        b.field = 7.3
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7200
     * @tc.name      testFieldsLateInitThree0072
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F379 = new A_F379()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F379 = new A_F379()
        b.field = 5
        expect(b.field instanceof number).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7300
     * @tc.name      testFieldsLateInitThree0073
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F380 = new A_F380()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
        let b: Base_F380 = new A_F380()
        b.field = 7.3f
        expect(b.field instanceof float).assertTrue()
        expect(b.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7400
     * @tc.name      testFieldsLateInitThree0074
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F381 = new A_F381()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
        let b: Base_F381 = new A_F381()
        b.field = 5n
        expect(b.field instanceof bigint).assertTrue()
        expect(b.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7500
     * @tc.name      testFieldsLateInitThree0075
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F382 = new A_F382()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F382 = new A_F382()
        b.field = "abc"
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7600
     * @tc.name      testFieldsLateInitThree0076
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F383 = new A_F383()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
        let b: Base_F383 = new A_F383()
        b.field = c'a'
        expect(b.field instanceof char).assertTrue()
        expect(b.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7700
     * @tc.name      testFieldsLateInitThree0077
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F384 = new A_F384()
        a.field = false
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
        let b: Base_F384 = new A_F384()
        b.field = false
        expect(b.field instanceof boolean).assertTrue()
        expect(b.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7800
     * @tc.name      testFieldsLateInitThree0078
     * @tc.desc      Checking for initialization from outside of constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F385 = new A_F385()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F385 = new A_F385()
        b.field = 5
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_7900
     * @tc.name      testFieldsLateInitThree0079
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F386 = new A_F386()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8000
     * @tc.name      testFieldsLateInitThree0080
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F387 = new A_F387()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8100
     * @tc.name      testFieldsLateInitThree0081
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F388 = new A_F388()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8200
     * @tc.name      testFieldsLateInitThree0082
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F389 = new A_F389()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8300
     * @tc.name      testFieldsLateInitThree0083
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F390 = new A_F390()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8400
     * @tc.name      testFieldsLateInitThree0084
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F391 = new A_F391()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8500
     * @tc.name      testFieldsLateInitThree0085
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F392 = new A_F392()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8600
     * @tc.name      testFieldsLateInitThree0086
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F393 = new A_F393()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8700
     * @tc.name      testFieldsLateInitThree0087
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F394 = new A_F394()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8800
     * @tc.name      testFieldsLateInitThree0088
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F395 = new A_F395()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_THREE_8900
     * @tc.name      testFieldsLateInitThree0089
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitThree0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F396 = new A_F396()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })
  })
}
