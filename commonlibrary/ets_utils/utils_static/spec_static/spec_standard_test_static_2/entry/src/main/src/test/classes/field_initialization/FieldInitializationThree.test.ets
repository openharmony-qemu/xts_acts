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


class A_F298<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F299<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F300<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F301<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F302<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F303<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F304<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F305 {
    field: long
  }

class A_F306 {
    field: int
  }

class A_F307 {
    field: byte
  }

class A_F308 {
    field: short
  }

class A_F309 {
    field: double
  }

class A_F310 {
    field: number
  }

class A_F311 {
    field: float
  }

class A_F312 {
    field: char
  }

class A_F313 {
    field: boolean
  }

class A_F314 {
    field: Object | undefined
  }

class A_F315 {
    field: Object | undefined | null
  }

class A_F317 {
    field: long = 4
  }

class A_F318 {
    field: int = 4
  }

class A_F319 {
    field: byte = 4
  }

class A_F320 {
    field: short = 4
  }

class A_F321 {
    field: double = 4
  }

class A_F322 {
    field: number = 4
  }

class A_F323 {
    field: float = 4.5f
  }

class A_F324 {
    field: bigint = 4n
  }

class A_F325 {
    field: string = "abc"
  }

class A_F326 {
    field: char = c'a'
  }

class A_F327 {
    field: boolean = false
  }

class A_F328 {
    field: Object = 4
  }

class A_F329 {
    field: Object | undefined = undefined
  }

class A_F330 {
    field: Object | undefined | null = 4
  }

function foo_F331(): long {
    return 4
  }
  class A_F332 {
    field: long = foo_F331()
  }

function foo_F332(): int {
    return 4
  }
  class A_F333 {
    field: int = foo_F332()
  }

function foo_F333(): byte {
    return 4
  }
  class A_F334 {
    field: byte = foo_F333()
  }

function foo_F334(): short {
    return 4
  }
  class A_F335 {
    field: short = foo_F334()
  }

function foo_F335(): double {
    return 4
  }
  class A_F336 {
    field: double = foo_F335()
  }

function foo_F336(): number {
    return 4
  }
  class A_F337 {
    field: number = foo_F336()
  }

function foo_F337(): float {
    return 4.5f
  }
  class A_F338 {
    field: float = foo_F337()
  }

function foo_F338(): bigint {
    return 4n
  }
  class A_F339 {
    field: bigint = foo_F338()
  }

function foo_F339(): string {
    return "abc"
  }
  class A_F340 {
    field: string = foo_F339()
  }

function foo_F340(): char {
    return c'a'
  }
  class A_F341 {
    field: char = foo_F340()
  }

function foo_F341(): boolean {
    return false
  }
  class A_F342 {
    field: boolean = foo_F341()
  }

function foo_F342(): Object {
    return 4
  }
  class A_F343 {
    field: Object = foo_F342()
  }

function foo_F343(): Object | undefined {
    return undefined
  }
  class A_F344 {
    field: Object | undefined = foo_F343()
  }

function foo_F344(): Object | undefined | null {
    return 4
  }
  class A_F345 {
    field: Object | undefined | null = foo_F344()
  }
class C_F347 {data: int = 0}
  class A_F347 {
    field: C_F347 = {data: 4}
  }

class C_F348 {data: int = 0}
  function foo_F347(): C_F348 {
    return {data: 4}
  }
  class A_F348 {
    field: C_F348 = foo_F347()
  }

class A_F349 {
    field: long
    constructor () {
      this.field = 4
    }
  }

class A_F350 {
    field: int
    constructor () {
      this.field = 4
    }
  }

class A_F351 {
    field: byte
    constructor () {
      this.field = 4
    }
  }

class A_F352 {
    field: short
    constructor () {
      this.field = 4
    }
  }

class A_F353 {
    field: double
    constructor () {
      this.field = 4
    }
  }

class A_F354 {
    field: number
    constructor () {
      this.field = 4
    }
  }

class A_F355 {
    field: float
    constructor () {
      this.field = 4.5f
    }
  }

class A_F356 {
    field: bigint
    constructor () {
      this.field = 4n
    }
  }

class A_F357 {
    field: string
    constructor () {
      this.field = "abc"
    }
  }

class A_F358 {
    field: char
    constructor () {
      this.field = c'a'
    }
  }

class A_F359 {
    field: boolean
    constructor () {
      this.field = false
    }
  }

class A_F360 {
    field: Object
    constructor () {
      this.field = 4
    }
  }

class A_F361 {
    field: Object | undefined
    constructor () {
      this.field = undefined
    }
  }

class A_F362 {
    field: Object | undefined | null
    constructor () {
      this.field = 4
    }
  }

class A_F364 {
    field: long
    constructor (arg: long = 4) {
      this.field = arg
    }
  }

class A_F365 {
    field: int
    constructor (arg: int = 4) {
      this.field = arg
    }
  }

class A_F366 {
    field: byte
    constructor (arg: byte = 4) {
      this.field = arg
    }
  }

class A_F367 {
    field: short
    constructor (arg: short = 4) {
      this.field = arg
    }
  }

class A_F368 {
    field: double
    constructor (arg: double = 4) {
      this.field = arg
    }
  }

class A_F369 {
    field: number
    constructor (arg: int = 4) {
      this.field = arg
    }
  }

class A_F370 {
    field: float
    constructor (arg: float = 4.5f) {
      this.field = arg
    }
  }

class A_F371 {
    field: bigint
    constructor (arg: bigint = 4n) {
      this.field = arg
    }
  }

class A_F372 {
    field: string
    constructor (arg: string = "abc") {
      this.field = arg
    }
  }

class A_F373 {
    field: char
    constructor (arg: char = c'a') {
      this.field = arg
    }
  }

class A_F374 {
    field: boolean
    constructor (arg: boolean = false) {
      this.field = arg
    }
  }

class A_F375 {
    field: Object
    constructor (arg: Object = 4) {
      this.field = arg
    }
  }

class A_F376 {
    field: Object | undefined
    constructor (arg: Object | undefined = undefined) {
      this.field = arg
    }
  }

class A_F377 {
    field: Object | undefined | null
    constructor (arg: Object | undefined | null = 4) {
      this.field = arg
    }
  }

class Base_F394 {
    protected v: long = 4
  }
  class A_F394 extends Base_F394 {
    field: long
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F395 {
    protected v: int = 4
  }
  class A_F395 extends Base_F395 {
    field: int
    constructor () {
      super()
      this.field = this.v
    }
  }

class Base_F396 {
    protected v: byte = 4
  }
  class A_F396 extends Base_F396 {
    field: byte
    constructor () {
      super()
      this.field = this.v
    }
  }

export default function FieldInitializationThreeTest(): void {
  describe("FieldInitializationThreeTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_THREE_0100
     * @tc.name      testFieldInitThree0001
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F298<string> = new A_F298<string>("abc")
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0200
     * @tc.name      testFieldInitThree0002
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F299<char> = new A_F299<char>(c'a')
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0300
     * @tc.name      testFieldInitThree0003
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F300<boolean> = new A_F300<boolean>(false)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0400
     * @tc.name      testFieldInitThree0004
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F301<Object> = new A_F301<Object>(4)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0500
     * @tc.name      testFieldInitThree0005
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F302<Object | undefined> = new A_F302<Object | undefined>(undefined)
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0600
     * @tc.name      testFieldInitThree0006
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F303<Object | undefined | null> = new A_F303<Object | undefined | null>(4)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })



    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0700
     * @tc.name      testFieldInitThree0007
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F305 = new A_F305()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0800
     * @tc.name      testFieldInitThree0008
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F306 = new A_F306()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_0900
     * @tc.name      testFieldInitThree0009
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F307 = new A_F307()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1000
     * @tc.name      testFieldInitThree0010
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F308 = new A_F308()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1100
     * @tc.name      testFieldInitThree0011
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F309 = new A_F309()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(0)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1200
     * @tc.name      testFieldInitThree0012
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F310 = new A_F310()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(0)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1300
     * @tc.name      testFieldInitThree0013
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F311 = new A_F311()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(0.0f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1400
     * @tc.name      testFieldInitThree0014
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F312 = new A_F312()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'\u0000')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1500
     * @tc.name      testFieldInitThree0015
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F313 = new A_F313()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1600
     * @tc.name      testFieldInitThree0016
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F314 = new A_F314()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1700
     * @tc.name      testFieldInitThree0017
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F315 = new A_F315()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1800
     * @tc.name      testFieldInitThree0018
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F317 = new A_F317()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_1900
     * @tc.name      testFieldInitThree0019
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F318 = new A_F318()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2000
     * @tc.name      testFieldInitThree0020
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F319 = new A_F319()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2100
     * @tc.name      testFieldInitThree0021
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F320 = new A_F320()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2200
     * @tc.name      testFieldInitThree0022
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F321 = new A_F321()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2300
     * @tc.name      testFieldInitThree0023
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F322 = new A_F322()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2400
     * @tc.name      testFieldInitThree0024
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F323 = new A_F323()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2500
     * @tc.name      testFieldInitThree0025
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F324 = new A_F324()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2600
     * @tc.name      testFieldInitThree0026
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F325 = new A_F325()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2700
     * @tc.name      testFieldInitThree0027
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F326 = new A_F326()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2800
     * @tc.name      testFieldInitThree0028
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F327 = new A_F327()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_2900
     * @tc.name      testFieldInitThree0029
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F328 = new A_F328()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3000
     * @tc.name      testFieldInitThree0030
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F329 = new A_F329()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3100
     * @tc.name      testFieldInitThree0031
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F330 = new A_F330()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3200
     * @tc.name      testFieldInitThree0032
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F332 = new A_F332()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3300
     * @tc.name      testFieldInitThree0033
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F333 = new A_F333()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3400
     * @tc.name      testFieldInitThree0034
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F334 = new A_F334()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3500
     * @tc.name      testFieldInitThree0035
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F335 = new A_F335()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3600
     * @tc.name      testFieldInitThree0036
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F336 = new A_F336()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3700
     * @tc.name      testFieldInitThree0037
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F337 = new A_F337()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3800
     * @tc.name      testFieldInitThree0038
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F338 = new A_F338()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_3900
     * @tc.name      testFieldInitThree0039
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F339 = new A_F339()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4000
     * @tc.name      testFieldInitThree0040
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F340 = new A_F340()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4100
     * @tc.name      testFieldInitThree0041
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F341 = new A_F341()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4200
     * @tc.name      testFieldInitThree0042
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F342 = new A_F342()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4300
     * @tc.name      testFieldInitThree0043
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F343 = new A_F343()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4400
     * @tc.name      testFieldInitThree0044
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F344 = new A_F344()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4500
     * @tc.name      testFieldInitThree0045
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F345 = new A_F345()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4600
     * @tc.name      testFieldInitThree0046
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F347 = new A_F347()
      expect(a.field instanceof C_F347).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F347).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4700
     * @tc.name      testFieldInitThree0047
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F348 = new A_F348()
      expect(a.field instanceof C_F348).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      a.field = {data: 5}
      expect(a.field instanceof C_F348).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4800
     * @tc.name      testFieldInitThree0048
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F349 = new A_F349()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_4900
     * @tc.name      testFieldInitThree0049
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F350 = new A_F350()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5000
     * @tc.name      testFieldInitThree0050
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F351 = new A_F351()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5100
     * @tc.name      testFieldInitThree0051
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F352 = new A_F352()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5200
     * @tc.name      testFieldInitThree0052
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F353 = new A_F353()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5300
     * @tc.name      testFieldInitThree0053
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F354 = new A_F354()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5400
     * @tc.name      testFieldInitThree0054
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F355 = new A_F355()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5500
     * @tc.name      testFieldInitThree0055
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F356 = new A_F356()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5600
     * @tc.name      testFieldInitThree0056
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F357 = new A_F357()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5700
     * @tc.name      testFieldInitThree0057
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F358 = new A_F358()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5800
     * @tc.name      testFieldInitThree0058
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F359 = new A_F359()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_5900
     * @tc.name      testFieldInitThree0059
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F360 = new A_F360()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6000
     * @tc.name      testFieldInitThree0060
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F361 = new A_F361()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6100
     * @tc.name      testFieldInitThree0061
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F362 = new A_F362()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6200
     * @tc.name      testFieldInitThree0062
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F364 = new A_F364()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6300
     * @tc.name      testFieldInitThree0063
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F365 = new A_F365()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6400
     * @tc.name      testFieldInitThree0064
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F366 = new A_F366()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6500
     * @tc.name      testFieldInitThree0065
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F367 = new A_F367()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6600
     * @tc.name      testFieldInitThree0066
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F368 = new A_F368()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6700
     * @tc.name      testFieldInitThree0067
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F369 = new A_F369()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6800
     * @tc.name      testFieldInitThree0068
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F370 = new A_F370()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_6900
     * @tc.name      testFieldInitThree0069
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F371 = new A_F371()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7000
     * @tc.name      testFieldInitThree0070
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F372 = new A_F372()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7100
     * @tc.name      testFieldInitThree0071
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F373 = new A_F373()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7200
     * @tc.name      testFieldInitThree0072
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F374 = new A_F374()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7300
     * @tc.name      testFieldInitThree0073
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F375 = new A_F375()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7400
     * @tc.name      testFieldInitThree0074
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F376 = new A_F376()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7500
     * @tc.name      testFieldInitThree0075
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F377 = new A_F377()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7600
     * @tc.name      testFieldInitThree0076
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F394 = new A_F394()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7700
     * @tc.name      testFieldInitThree0077
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F395 = new A_F395()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_THREE_7800
     * @tc.name      testFieldInitThree0078
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitThree0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F396 = new A_F396()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
