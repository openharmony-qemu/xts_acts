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

class Base_F364 {
  _field!: long
  get field(): long {
    return this._field
  }
}
class A_F364 extends Base_F364 {
  constructor (...args: Any[]) {
    super()
    this._field = 5
  }
}

class Base_F365 {
  _field!: int
  get field(): int {
    return this._field
  }
}
class A_F365 extends Base_F365 {
  constructor (...args: Any[]) {
    super()
    this._field = 5
  }
}

class Base_F366 {
  _field!: double
  get field(): double {
    return this._field
  }
}
class A_F366 extends Base_F366 {
  constructor (...args: Any[]) {
    super()
    this._field = 7.3
  }
}

class Base_F367 {
  _field!: string
  get field(): string {
    return this._field
  }
}
class A_F367 extends Base_F367 {
  constructor (...args: Any[]) {
    super()
    this._field = "abc"
  }
}

class Base_F368 {
  _field!: Object
  get field(): Object {
    return this._field
  }
}
class A_F368 extends Base_F368 {
  constructor (...args: Any[]) {
    super()
    this._field = 5
  }
}

class Base_F369 {
  protected _field!: long
  get field(): long {
    return this._field
  }
}
class A_F369 extends Base_F369 {
  constructor (...args: Any[]) {
    super()
    this._field = 5
  }
}

class Base_F370 {
  protected _field!: int
  get field(): int {
    return this._field
  }
}
class A_F370 extends Base_F370 {
  constructor (...args: Any[]) {
    super()
    this._field = 5
  }
}

class Base_F371 {
  protected _field!: double
  get field(): double {
    return this._field
  }
}
class A_F371 extends Base_F371 {
  constructor (...args: Any[]) {
    super()
    this._field = 7.3
  }
}

class Base_F372 {
  protected _field!: string
  get field(): string {
    return this._field
  }
}
class A_F372 extends Base_F372 {
  constructor (...args: Any[]) {
    super()
    this._field = "abc"
  }
}

class Base_F373 {
  protected _field!: Object
  get field(): Object {
    return this._field
  }
}
class A_F373 extends Base_F373 {
  constructor (...args: Any[]) {
    super()
    this._field = 5
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

export default function FieldsLateInitTestThree(): void {
  describe("FieldsLateInitTestThree", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0298
     * @tc.name      testFieldsLateInit0298
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0298", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F298 = new A_F298()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0299
     * @tc.name      testFieldsLateInit0299
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0299", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F299 = new A_F299()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0300
     * @tc.name      testFieldsLateInit0300
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F300 = new A_F300()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0301
     * @tc.name      testFieldsLateInit0301
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0301", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F301 = new A_F301()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0302
     * @tc.name      testFieldsLateInit0302
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0302", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F302 = new A_F302()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0303
     * @tc.name      testFieldsLateInit0303
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0303", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F303 = new A_F303()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0304
     * @tc.name      testFieldsLateInit0304
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0304", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F304 = new A_F304()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0305
     * @tc.name      testFieldsLateInit0305
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0305", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F305 = new A_F305()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0306
     * @tc.name      testFieldsLateInit0306
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0306", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F306 = new A_F306()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0307
     * @tc.name      testFieldsLateInit0307
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0307", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F307 = new A_F307()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0308
     * @tc.name      testFieldsLateInit0308
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0308", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F308 = new A_F308()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0309
     * @tc.name      testFieldsLateInit0309
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0309", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F309 = new A_F309()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0310
     * @tc.name      testFieldsLateInit0310
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0310", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F310 = new A_F310()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0311
     * @tc.name      testFieldsLateInit0311
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0311", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F311 = new A_F311()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0312
     * @tc.name      testFieldsLateInit0312
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0312", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F312 = new A_F312()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0313
     * @tc.name      testFieldsLateInit0313
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0313", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F313 = new A_F313()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0314
     * @tc.name      testFieldsLateInit0314
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0314", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F314 = new A_F314()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0315
     * @tc.name      testFieldsLateInit0315
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0315", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F315 = new A_F315()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0316
     * @tc.name      testFieldsLateInit0316
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0316", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F316 = new A_F316()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0317
     * @tc.name      testFieldsLateInit0317
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0317", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F317 = new A_F317()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0318
     * @tc.name      testFieldsLateInit0318
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0318", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F318 = new A_F318()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0319
     * @tc.name      testFieldsLateInit0319
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0319", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F319 = new A_F319()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0320
     * @tc.name      testFieldsLateInit0320
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0320", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F320 = new A_F320()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0321
     * @tc.name      testFieldsLateInit0321
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0321", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F321 = new A_F321()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0322
     * @tc.name      testFieldsLateInit0322
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0322", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F322 = new A_F322()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0323
     * @tc.name      testFieldsLateInit0323
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0323", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F323 = new A_F323()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0324
     * @tc.name      testFieldsLateInit0324
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0324", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F324 = new A_F324()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0325
     * @tc.name      testFieldsLateInit0325
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0325", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F325 = new A_F325()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0326
     * @tc.name      testFieldsLateInit0326
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0326", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F326 = new A_F326()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0327
     * @tc.name      testFieldsLateInit0327
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0327", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F327 = new A_F327()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0328
     * @tc.name      testFieldsLateInit0328
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0328", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F328 = new A_F328()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0329
     * @tc.name      testFieldsLateInit0329
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0329", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F329 = new A_F329()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0330
     * @tc.name      testFieldsLateInit0330
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0330", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F330 = new A_F330()
        a.field = false
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0331
     * @tc.name      testFieldsLateInit0331
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0331", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F331 = new A_F331()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0332
     * @tc.name      testFieldsLateInit0332
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0332", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F332 = new A_F332()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0333
     * @tc.name      testFieldsLateInit0333
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0333", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F333 = new A_F333()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0334
     * @tc.name      testFieldsLateInit0334
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0334", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F334 = new A_F334()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0335
     * @tc.name      testFieldsLateInit0335
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0335", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F335 = new A_F335()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0336
     * @tc.name      testFieldsLateInit0336
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0336", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F336 = new A_F336()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0337
     * @tc.name      testFieldsLateInit0337
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0337", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F337 = new A_F337()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0338
     * @tc.name      testFieldsLateInit0338
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0338", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F338 = new A_F338()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0339
     * @tc.name      testFieldsLateInit0339
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0339", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F339 = new A_F339()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0340
     * @tc.name      testFieldsLateInit0340
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0340", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F340 = new A_F340()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0341
     * @tc.name      testFieldsLateInit0341
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0341", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F341 = new A_F341()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0342
     * @tc.name      testFieldsLateInit0342
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0342", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F342 = new A_F342()
        a.field = false
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0343
     * @tc.name      testFieldsLateInit0343
     * @tc.desc      Checking for initialization with interface usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0343", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: I_F343 = new A_F343()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0344
     * @tc.name      testFieldsLateInit0344
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0344", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F344 = new A_F344()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F344 = new A_F344()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0345
     * @tc.name      testFieldsLateInit0345
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0345", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F345 = new A_F345()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F345 = new A_F345()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0346
     * @tc.name      testFieldsLateInit0346
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0346", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F346 = new A_F346()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F346 = new A_F346()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0347
     * @tc.name      testFieldsLateInit0347
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0347", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F347 = new A_F347()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F347 = new A_F347()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0348
     * @tc.name      testFieldsLateInit0348
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0348", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F348 = new A_F348()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F348 = new A_F348()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0349
     * @tc.name      testFieldsLateInit0349
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0349", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F349 = new A_F349()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F349 = new A_F349()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0350
     * @tc.name      testFieldsLateInit0350
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0350", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F350 = new A_F350()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F350 = new A_F350()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0351
     * @tc.name      testFieldsLateInit0351
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0351", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F351 = new A_F351()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F351 = new A_F351()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0352
     * @tc.name      testFieldsLateInit0352
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0352", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F352 = new A_F352()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F352 = new A_F352()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0353
     * @tc.name      testFieldsLateInit0353
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0353", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F353 = new A_F353()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F353 = new A_F353()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0354
     * @tc.name      testFieldsLateInit0354
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0354", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F354 = new A_F354()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F354 = new A_F354()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0355
     * @tc.name      testFieldsLateInit0355
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0355", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F355 = new A_F355()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F355 = new A_F355()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0356
     * @tc.name      testFieldsLateInit0356
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0356", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F356 = new A_F356()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
        let b: Base_F356 = new A_F356()
        expect(b.field instanceof double).assertTrue()
        expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0357
     * @tc.name      testFieldsLateInit0357
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0357", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F357 = new A_F357()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
        let b: Base_F357 = new A_F357()
        expect(b.field instanceof string).assertTrue()
        expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0358
     * @tc.name      testFieldsLateInit0358
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0358", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F358 = new A_F358()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F358 = new A_F358()
        expect(b.field instanceof Object).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0359
     * @tc.name      testFieldsLateInit0359
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0359", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F359 = new A_F359()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F359 = new A_F359()
        expect(b.field instanceof long).assertTrue()
        expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0360
     * @tc.name      testFieldsLateInit0360
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0360", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F360 = new A_F360()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
        let b: Base_F360 = new A_F360()
        expect(b.field instanceof int).assertTrue()
        expect(b.field).assertEqual(5)
    })
