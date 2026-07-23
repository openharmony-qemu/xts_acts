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

class A_F001 {
  field!: long
  constructor () {
    this.field = 5
  }
}

class A_F002 {
  field!: int
  constructor () {
    this.field = 5
  }
}

class A_F003 {
  field!: byte
  constructor () {
    this.field = 5
  }
}

class A_F004 {
  field!: short
  constructor () {
    this.field = 5
  }
}

class A_F005 {
  field!: double
  constructor () {
    this.field = 7.3
  }
}

class A_F006 {
  field!: number
  constructor () {
    this.field = 5
  }
}

class A_F007 {
  field!: float
  constructor () {
    this.field = 7.3f
  }
}

class A_F008 {
  field!: bigint
  constructor () {
    this.field = 5n
  }
}

class A_F009 {
  field!: string
  constructor () {
    this.field = "abc"
  }
}

class A_F010 {
  field!: char
  constructor () {
    this.field = c'a'
  }
}

class A_F011 {
  field!: boolean
  constructor () {
    this.field = false
  }
}

class A_F012 {
  field!: Object
  constructor () {
    this.field = 5
  }
}

class A_F013 {
  field!: long
  constructor (arg: long = 5) {
    this.field = arg
  }
}

class A_F014 {
  field!: int
  constructor (arg: int = 5) {
    this.field = arg
  }
}

class A_F015 {
  field!: byte
  constructor (arg: byte = 5) {
    this.field = arg
  }
}

class A_F016 {
  field!: short
  constructor (arg: short = 5) {
    this.field = arg
  }
}

class A_F017 {
  field!: double
  constructor (arg: double = 7.3) {
    this.field = arg
  }
}

class A_F018 {
  field!: number
  constructor (arg: int = 5) {
    this.field = arg
  }
}

class A_F019 {
  field!: float
  constructor (arg: float = 7.3f) {
    this.field = arg
  }
}

class A_F020 {
  field!: bigint
  constructor (arg: bigint = 5n) {
    this.field = arg
  }
}

class A_F021 {
  field!: string
  constructor (arg: string = "abc") {
    this.field = arg
  }
}

class A_F022 {
  field!: char
  constructor (arg: char = c'a') {
    this.field = arg
  }
}

class A_F023 {
  field!: boolean
  constructor (arg: boolean = false) {
    this.field = arg
  }
}

class A_F024 {
  field!: Object
  constructor (arg: Object = 5) {
    this.field = arg
  }
}

class Base_F037 {
  private _v!: long
  get v(): long {
    this._v = 5
    return this._v
  }
}
class A_F037 extends Base_F037 {
  field: long = super.v
}

class Base_F038 {
  private _v!: int
  get v(): int {
    this._v = 5
    return this._v
  }
}
class A_F038 extends Base_F038 {
  field: int = super.v
}

class Base_F039 {
  private _v!: byte
  get v(): byte {
    this._v = 5
    return this._v
  }
}
class A_F039 extends Base_F039 {
  field: byte = super.v
}

class Base_F040 {
  private _v!: short
  get v(): short {
    this._v = 5
    return this._v
  }
}
class A_F040 extends Base_F040 {
  field: short = super.v
}

class Base_F041 {
  private _v!: double
  get v(): double {
    this._v = 7.3
    return this._v
  }
}
class A_F041 extends Base_F041 {
  field: double = super.v
}

class Base_F042 {
  private _v!: number
  get v(): number {
    this._v = 5
    return this._v
  }
}
class A_F042 extends Base_F042 {
  field: number = super.v
}

class Base_F043 {
  private _v!: float
  get v(): float {
    this._v = 7.3f
    return this._v
  }
}
class A_F043 extends Base_F043 {
  field: float = super.v
}

class Base_F044 {
  private _v!: bigint
  get v(): bigint {
    this._v = 5n
    return this._v
  }
}
class A_F044 extends Base_F044 {
  field: bigint = super.v
}

class Base_F045 {
  private _v!: string
  get v(): string {
    this._v = "abc"
    return this._v
  }
}
class A_F045 extends Base_F045 {
  field: string = super.v
}

class Base_F046 {
  private _v!: char
  get v(): char {
    this._v = c'a'
    return this._v
  }
}
class A_F046 extends Base_F046 {
  field: char = super.v
}

class Base_F047 {
  private _v!: boolean
  get v(): boolean {
    this._v = false
    return this._v
  }
}
class A_F047 extends Base_F047 {
  field: boolean = super.v
}

class Base_F048 {
  private _v!: Object
  get v(): Object {
    this._v = 5
    return this._v
  }
}
class A_F048 extends Base_F048 {
  field: Object = super.v
}

class C_F049 {data!: int}
class Base_F049 {
  private _v!: C_F049
  get v(): C_F049 {
    this._v = {data: 5}
    return this._v
  }
}
class A_F049 extends Base_F049 {
  field: C_F049 = super.v
}

class C_F050 {data!: int}
class A_F050 {
  field!: C_F050
  constructor () {
    this.field = {data: 5}
  }
}

class C_F051 {data!: int}
class A_F051 {
  field!: C_F051
  constructor (arg: C_F051 = {data: 5}) {
    this.field = arg
  }
}

class A_F053 {
  field!: long
}

class A_F054 {
  field!: int
}

class A_F055 {
  field!: byte
}

class A_F056 {
  field!: short
}

class A_F057 {
  field!: double
}

class A_F058 {
  field!: number
}

class A_F059 {
  field!: float
}

class A_F060 {
  field!: bigint
}

class A_F061 {
  field!: string
}

class A_F062 {
  field!: char
}

class A_F063 {
  field!: boolean
}

class A_F064 {
  field!: Object
}

class C_F065 {data!: int}
class A_F065 {
  field!: C_F065
}

class A_F066 {
  field!: long
  foo(): void {
    this.field = 5
  }
}

class A_F067 {
  field!: int
  foo(): void {
    this.field = 5
  }
}

class A_F068 {
  field!: byte
  foo(): void {
    this.field = 5
  }
}

class A_F069 {
  field!: short
  foo(): void {
    this.field = 5
  }
}

class A_F070 {
  field!: double
  foo(): void {
    this.field = 7.3
  }
}

class A_F071 {
  field!: number
  foo(): void {
    this.field = 5
  }
}

class A_F072 {
  field!: float
  foo(): void {
    this.field = 7.3f
  }
}

class A_F073 {
  field!: bigint
  foo(): void {
    this.field = 5n
  }
}

class A_F074 {
  field!: string
  foo(): void {
    this.field = "abc"
  }
}

class A_F075 {
  field!: char
  foo(): void {
    this.field = c'a'
  }
}

class A_F076 {
  field!: boolean
  foo(): void {
    this.field = false
  }
}

class A_F077 {
  field!: Object
  foo(): void {
    this.field = 5
  }
}

class A_F078 {
  field!: long
  foo: () => void = (): void => {
    this.field = 5
  }
}

class A_F079 {
  field!: int
  foo: () => void = (): void => {
    this.field = 5
  }
}

class A_F080 {
  field!: byte
  foo: () => void = (): void => {
    this.field = 5
  }
}

class A_F081 {
  field!: short
  foo: () => void = (): void => {
    this.field = 5
  }
}

class A_F082 {
  field!: double
  foo: () => void = (): void => {
    this.field = 7.3
  }
}

class A_F083 {
  field!: number
  foo: () => void = (): void => {
    this.field = 5
  }
}

class A_F084 {
  field!: float
  foo: () => void = (): void => {
    this.field = 7.3f
  }
}

class A_F085 {
  field!: bigint
  foo: () => void = (): void => {
    this.field = 5n
  }
}

class A_F086 {
  field!: string
  foo: () => void = (): void => {
    this.field = "abc"
  }
}

class A_F087 {
  field!: char
  foo: () => void = (): void => {
    this.field = c'a'
  }
}

class A_F088 {
  field!: boolean
  foo: () => void = (): void => {
    this.field = false
  }
}

class A_F089 {
  field!: Object
  foo: () => void = (): void => {
    this.field = 5
  }
}

class C_F090 {data!: int}
class A_F090 {
  field!: C_F090
  foo(): void {
    this.field = {data: 5}
  }
}

class C_F091 {data!: int}
class A_F091 {
  field!: C_F091
  foo: () => void = (): void => {
    this.field = {data: 5}
  }
}

class A_F092 {
  field!: long
}

class A_F093 {
  field!: int
}

class A_F094 {
  field!: byte
}

class A_F095 {
  field!: short
}

class A_F096 {
  field!: double
}

class A_F097 {
  field!: number
}

class A_F098 {
  field!: float
}

class A_F099 {
  field!: bigint
}

export default function FieldsLateInitTest(): void {
  describe("FieldsLateInitTest", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0100
     * @tc.name      testFieldsLateInit0001
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F001 = new A_F001()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0200
     * @tc.name      testFieldsLateInit0002
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F002 = new A_F002()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0300
     * @tc.name      testFieldsLateInit0003
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F003 = new A_F003()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0400
     * @tc.name      testFieldsLateInit0004
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F004 = new A_F004()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0500
     * @tc.name      testFieldsLateInit0005
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F005 = new A_F005()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0600
     * @tc.name      testFieldsLateInit0006
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F006 = new A_F006()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0700
     * @tc.name      testFieldsLateInit0007
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F007 = new A_F007()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0800
     * @tc.name      testFieldsLateInit0008
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F008 = new A_F008()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0900
     * @tc.name      testFieldsLateInit0009
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F009 = new A_F009()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1000
     * @tc.name      testFieldsLateInit0010
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F010 = new A_F010()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1100
     * @tc.name      testFieldsLateInit0011
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F011 = new A_F011()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1200
     * @tc.name      testFieldsLateInit0012
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F012 = new A_F012()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1300
     * @tc.name      testFieldsLateInit0013
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F013 = new A_F013()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1400
     * @tc.name      testFieldsLateInit0014
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F014 = new A_F014()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1500
     * @tc.name      testFieldsLateInit0015
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F015 = new A_F015()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1600
     * @tc.name      testFieldsLateInit0016
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F016 = new A_F016()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1700
     * @tc.name      testFieldsLateInit0017
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F017 = new A_F017()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1800
     * @tc.name      testFieldsLateInit0018
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F018 = new A_F018()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_1900
     * @tc.name      testFieldsLateInit0019
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F019 = new A_F019()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2000
     * @tc.name      testFieldsLateInit0020
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F020 = new A_F020()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2100
     * @tc.name      testFieldsLateInit0021
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F021 = new A_F021()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2200
     * @tc.name      testFieldsLateInit0022
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F022 = new A_F022()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2300
     * @tc.name      testFieldsLateInit0023
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F023 = new A_F023()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2400
     * @tc.name      testFieldsLateInit0024
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F024 = new A_F024()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2500
     * @tc.name      testFieldsLateInit0025
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F037 = new A_F037()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2600
     * @tc.name      testFieldsLateInit0026
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F038 = new A_F038()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2700
     * @tc.name      testFieldsLateInit0027
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F039 = new A_F039()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2800
     * @tc.name      testFieldsLateInit0028
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F040 = new A_F040()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_2900
     * @tc.name      testFieldsLateInit0029
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F041 = new A_F041()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3000
     * @tc.name      testFieldsLateInit0030
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F042 = new A_F042()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3100
     * @tc.name      testFieldsLateInit0031
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F043 = new A_F043()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3200
     * @tc.name      testFieldsLateInit0032
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F044 = new A_F044()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3300
     * @tc.name      testFieldsLateInit0033
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F045 = new A_F045()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3400
     * @tc.name      testFieldsLateInit0034
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F046 = new A_F046()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3500
     * @tc.name      testFieldsLateInit0035
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F047 = new A_F047()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3600
     * @tc.name      testFieldsLateInit0036
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F048 = new A_F048()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3700
     * @tc.name      testFieldsLateInit0037
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F049 = new A_F049()
        expect(a.field instanceof C_F049).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3800
     * @tc.name      testFieldsLateInit0038
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F050 = new A_F050()
        expect(a.field instanceof C_F050).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_3900
     * @tc.name      testFieldsLateInit0039
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F051 = new A_F051()
        expect(a.field instanceof C_F051).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4000
     * @tc.name      testFieldsLateInit0040
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F053 = {field: 5}
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4100
     * @tc.name      testFieldsLateInit0041
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F054 = {field: 5}
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4200
     * @tc.name      testFieldsLateInit0042
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F055 = {field: 5}
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4300
     * @tc.name      testFieldsLateInit0043
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F056 = {field: 5}
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4400
     * @tc.name      testFieldsLateInit0044
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F057 = {field: 7.3}
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4500
     * @tc.name      testFieldsLateInit0045
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F058 = {field: 5}
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4600
     * @tc.name      testFieldsLateInit0046
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F059 = {field: 7.3f}
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4700
     * @tc.name      testFieldsLateInit0047
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F060 = {field: 5n}
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4800
     * @tc.name      testFieldsLateInit0048
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F061 = {field: "abc"}
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_4900
     * @tc.name      testFieldsLateInit0049
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F062 = {field: c'a'}
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5000
     * @tc.name      testFieldsLateInit0050
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F063 = {field: false}
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5100
     * @tc.name      testFieldsLateInit0051
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F064 = {field: 5}
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5200
     * @tc.name      testFieldsLateInit0052
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F065 = {field: {data: 5}}
        expect(a.field instanceof C_F065).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5300
     * @tc.name      testFieldsLateInit0053
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F066 = new A_F066()
        a.foo()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5400
     * @tc.name      testFieldsLateInit0054
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F067 = new A_F067()
        a.foo()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5500
     * @tc.name      testFieldsLateInit0055
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F068 = new A_F068()
        a.foo()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5600
     * @tc.name      testFieldsLateInit0056
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F069 = new A_F069()
        a.foo()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5700
     * @tc.name      testFieldsLateInit0057
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F070 = new A_F070()
        a.foo()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5800
     * @tc.name      testFieldsLateInit0058
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F071 = new A_F071()
        a.foo()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_5900
     * @tc.name      testFieldsLateInit0059
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F072 = new A_F072()
        a.foo()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6000
     * @tc.name      testFieldsLateInit0060
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F073 = new A_F073()
        a.foo()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6100
     * @tc.name      testFieldsLateInit0061
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F074 = new A_F074()
        a.foo()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6200
     * @tc.name      testFieldsLateInit0062
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F075 = new A_F075()
        a.foo()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6300
     * @tc.name      testFieldsLateInit0063
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F076 = new A_F076()
        a.foo()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6400
     * @tc.name      testFieldsLateInit0064
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F077 = new A_F077()
        a.foo()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6500
     * @tc.name      testFieldsLateInit0065
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F078 = new A_F078()
        a.foo()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6600
     * @tc.name      testFieldsLateInit0066
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F079 = new A_F079()
        a.foo()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6700
     * @tc.name      testFieldsLateInit0067
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F080 = new A_F080()
        a.foo()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6800
     * @tc.name      testFieldsLateInit0068
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F081 = new A_F081()
        a.foo()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_6900
     * @tc.name      testFieldsLateInit0069
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F082 = new A_F082()
        a.foo()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7000
     * @tc.name      testFieldsLateInit0070
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F083 = new A_F083()
        a.foo()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7100
     * @tc.name      testFieldsLateInit0071
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F084 = new A_F084()
        a.foo()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7200
     * @tc.name      testFieldsLateInit0072
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F085 = new A_F085()
        a.foo()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7300
     * @tc.name      testFieldsLateInit0073
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F086 = new A_F086()
        a.foo()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7400
     * @tc.name      testFieldsLateInit0074
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F087 = new A_F087()
        a.foo()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7500
     * @tc.name      testFieldsLateInit0075
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F088 = new A_F088()
        a.foo()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7600
     * @tc.name      testFieldsLateInit0076
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F089 = new A_F089()
        a.foo()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7700
     * @tc.name      testFieldsLateInit0077
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F090 = new A_F090()
        a.foo()
        expect(a.field instanceof C_F090).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7800
     * @tc.name      testFieldsLateInit0078
     * @tc.desc      Checking for initialization from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F091 = new A_F091()
        a.foo()
        expect(a.field instanceof C_F091).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_7900
     * @tc.name      testFieldsLateInit0079
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F092 = new A_F092()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8000
     * @tc.name      testFieldsLateInit0080
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F093 = new A_F093()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8100
     * @tc.name      testFieldsLateInit0081
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F094 = new A_F094()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8200
     * @tc.name      testFieldsLateInit0082
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F095 = new A_F095()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8300
     * @tc.name      testFieldsLateInit0083
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F096 = new A_F096()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8400
     * @tc.name      testFieldsLateInit0084
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F097 = new A_F097()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8500
     * @tc.name      testFieldsLateInit0085
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F098 = new A_F098()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_8600
     * @tc.name      testFieldsLateInit0086
     * @tc.desc      Checking for initialization from outside of constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F099 = new A_F099()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })
  })
}
