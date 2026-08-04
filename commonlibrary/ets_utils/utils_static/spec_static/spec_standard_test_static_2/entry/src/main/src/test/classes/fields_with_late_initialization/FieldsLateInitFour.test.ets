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

class A_F397 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor (arg: int = 5) {
    this._field = arg
  }
}

class A_F398 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor (arg: double = 7.3) {
    this._field = arg
  }
}

class A_F399 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor (arg: string = "abc") {
    this._field = arg
  }
}

class A_F400 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor (arg: Object = 5) {
    this._field = arg
  }
}

class A_F401 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor (arg: long = 5) {
    this._field = arg
  }
}

class A_F402 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor (arg: int = 5) {
    this._field = arg
  }
}

class A_F403 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor (arg: double = 7.3) {
    this._field = arg
  }
}

class A_F404 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor (arg: string = "abc") {
    this._field = arg
  }
}

class A_F405 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor (arg: Object = 5) {
    this._field = arg
  }
}

class A_F416 {
  private _field!: long
  get field(): long {
    return this._field
  }
  set field(a: long) {
    this._field = a + 1
  }
}

class A_F417 {
  private _field!: int
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a + 1
  }
}

class A_F418 {
  private _field!: double
  get field(): double {
    return this._field
  }
  set field(a: double) {
    this._field = a + 1
  }
}

class A_F419 {
  private _field!: bigint
  get field(): bigint {
    return this._field
  }
  set field(a: bigint) {
    this._field = a + 1n
  }
}

class A_F420 {
  private _field!: string
  get field(): string {
    return this._field
  }
  set field(a: string) {
    this._field = a + "c"
  }
}

export default function FieldsLateInitFourTest(): void {
  describe("FieldsLateInitFourTest", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0100
     * @tc.name      testFieldsLateInitFour0001
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F397 = new A_F397()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0200
     * @tc.name      testFieldsLateInitFour0002
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F398 = new A_F398()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0300
     * @tc.name      testFieldsLateInitFour0003
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F399 = new A_F399()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0400
     * @tc.name      testFieldsLateInitFour0004
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F400 = new A_F400()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0500
     * @tc.name      testFieldsLateInitFour0005
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F401 = new A_F401()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0600
     * @tc.name      testFieldsLateInitFour0006
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F402 = new A_F402()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0700
     * @tc.name      testFieldsLateInitFour0007
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F403 = new A_F403()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0800
     * @tc.name      testFieldsLateInitFour0008
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F404 = new A_F404()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0900
     * @tc.name      testFieldsLateInitFour0009
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F405 = new A_F405()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1000
     * @tc.name      testFieldsLateInitFour0010
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F416 = new A_F416()
        a.field = 4
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1100
     * @tc.name      testFieldsLateInitFour0011
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F417 = new A_F417()
        a.field = 4
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1200
     * @tc.name      testFieldsLateInitFour0012
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F418 = new A_F418()
        a.field = 4
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1300
     * @tc.name      testFieldsLateInitFour0013
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F419 = new A_F419()
        a.field = 4n
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1400
     * @tc.name      testFieldsLateInitFour0014
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F420 = new A_F420()
        a.field = "ab"
        expect(a.field).assertEqual("abc")
    })

  })
}
