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
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test'


class Base_F100 {
    field: number = 4
  }
  class A_F100 extends Base_F100 {
  }

class Base_F101 {
    field: float = 4.5f
  }
  class A_F101 extends Base_F101 {
  }

class Base_F102 {
    field: bigint = 4n
  }
  class A_F102 extends Base_F102 {
  }

class Base_F103 {
    field: string = "abc"
  }
  class A_F103 extends Base_F103 {
  }

class Base_F104 {
    field: char = c'a'
  }
  class A_F104 extends Base_F104 {
  }

class Base_F105 {
    field: boolean = false
  }
  class A_F105 extends Base_F105 {
  }

class Base_F106 {
    field: Object = 4
  }
  class A_F106 extends Base_F106 {
  }

class Base_F107 {
    field: Object | undefined = undefined
  }
  class A_F107 extends Base_F107 {
  }

class Base_F108 {
    field: Object | undefined | null = 4
  }
  class A_F108 extends Base_F108 {
  }

class Base_F110 {
    field: long = 4
  }
  class B_F110 extends Base_F110 {
  }
  class A_F110 extends B_F110 {
  }

class Base_F111 {
    field: int = 4
  }
  class B_F111 extends Base_F111 {
  }
  class A_F111 extends B_F111 {
  }

class Base_F112 {
    field: byte = 4
  }
  class B_F112 extends Base_F112 {
  }
  class A_F112 extends B_F112 {
  }

class Base_F113 {
    field: short = 4
  }
  class B_F113 extends Base_F113 {
  }
  class A_F113 extends B_F113 {
  }

class Base_F114 {
    field: double = 4
  }
  class B_F114 extends Base_F114 {
  }
  class A_F114 extends B_F114 {
  }

class Base_F115 {
    field: number = 4
  }
  class B_F115 extends Base_F115 {
  }
  class A_F115 extends B_F115 {
  }

class Base_F116 {
    field: float = 4.5f
  }
  class B_F116 extends Base_F116 {
  }
  class A_F116 extends B_F116 {
  }

class Base_F117 {
    field: bigint = 4n
  }
  class B_F117 extends Base_F117 {
  }
  class A_F117 extends B_F117 {
  }

class Base_F118 {
    field: string = "abc"
  }
  class B_F118 extends Base_F118 {
  }
  class A_F118 extends B_F118 {
  }

class Base_F119 {
    field: char = c'a'
  }
  class B_F119 extends Base_F119 {
  }
  class A_F119 extends B_F119 {
  }

class Base_F120 {
    field: boolean = false
  }
  class B_F120 extends Base_F120 {
  }
  class A_F120 extends B_F120 {
  }

class Base_F121 {
    field: Object = 4
  }
  class B_F121 extends Base_F121 {
  }
  class A_F121 extends B_F121 {
  }

class Base_F122 {
    field: Object | undefined = undefined
  }
  class B_F122 extends Base_F122 {
  }
  class A_F122 extends B_F122 {
  }

class Base_F123 {
    field: Object | undefined | null = 4
  }
  class B_F123 extends Base_F123 {
  }
  class A_F123 extends B_F123 {
  }

class Base_F125 {
    field: long = 4
  }
  class A_F125 extends Base_F125 {
  }

class Base_F126 {
    field: int = 4
  }
  class A_F126 extends Base_F126 {
  }

class Base_F127 {
    field: byte = 4
  }
  class A_F127 extends Base_F127 {
  }

class Base_F128 {
    field: short = 4
  }
  class A_F128 extends Base_F128 {
  }

class Base_F129 {
    field: double = 4
  }
  class A_F129 extends Base_F129 {
  }

class Base_F130 {
    field: number = 4
  }
  class A_F130 extends Base_F130 {
  }

class Base_F131 {
    field: float = 4.5f
  }
  class A_F131 extends Base_F131 {
  }

class Base_F132 {
    field: bigint = 4n
  }
  class A_F132 extends Base_F132 {
  }

class Base_F133 {
    field: string = "abc"
  }
  class A_F133 extends Base_F133 {
  }

class Base_F134 {
    field: char = c'a'
  }
  class A_F134 extends Base_F134 {
  }

class Base_F135 {
    field: boolean = false
  }
  class A_F135 extends Base_F135 {
  }

class Base_F136 {
    field: Object = 4
  }
  class A_F136 extends Base_F136 {
  }

class Base_F137 {
    field: Object | undefined = undefined
  }
  class A_F137 extends Base_F137 {
  }

class Base_F138 {
    field: Object | undefined | null = 4
  }
  class A_F138 extends Base_F138 {
  }

class Base_F140 {
    field: long = 4
  }
  class B_F140 extends Base_F140 {
  }
  class A_F140 extends B_F140 {
  }

class Base_F141 {
    field: int = 4
  }
  class B_F141 extends Base_F141 {
  }
  class A_F141 extends B_F141 {
  }

class Base_F142 {
    field: byte = 4
  }
  class B_F142 extends Base_F142 {
  }
  class A_F142 extends B_F142 {
  }

class Base_F143 {
    field: short = 4
  }
  class B_F143 extends Base_F143 {
  }
  class A_F143 extends B_F143 {
  }

class Base_F144 {
    field: double = 4
  }
  class B_F144 extends Base_F144 {
  }
  class A_F144 extends B_F144 {
  }

class Base_F145 {
    field: number = 4
  }
  class B_F145 extends Base_F145 {
  }
  class A_F145 extends B_F145 {
  }

class Base_F146 {
    field: float = 4.5f
  }
  class B_F146 extends Base_F146 {
  }
  class A_F146 extends B_F146 {
  }

class Base_F147 {
    field: bigint = 4n
  }
  class B_F147 extends Base_F147 {
  }
  class A_F147 extends B_F147 {
  }

class Base_F148 {
    field: string = "abc"
  }
  class B_F148 extends Base_F148 {
  }
  class A_F148 extends B_F148 {
  }

class Base_F149 {
    field: char = c'a'
  }
  class B_F149 extends Base_F149 {
  }
  class A_F149 extends B_F149 {
  }

class Base_F150 {
    field: boolean = false
  }
  class B_F150 extends Base_F150 {
  }
  class A_F150 extends B_F150 {
  }

class Base_F151 {
    field: Object = 4
  }
  class B_F151 extends Base_F151 {
  }
  class A_F151 extends B_F151 {
  }

class Base_F152 {
    field: Object | undefined = undefined
  }
  class B_F152 extends Base_F152 {
  }
  class A_F152 extends B_F152 {
  }

class Base_F153 {
    field: Object | undefined | null = 4
  }
  class B_F153 extends Base_F153 {
  }
  class A_F153 extends B_F153 {
  }

class A_F155 {
    private _field: long = 4
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
  }

class A_F156 {
    private _field: int = 4
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
  }

class A_F157 {
    private _field: byte = 4
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
  }

class A_F158 {
    private _field: short = 4
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
  }

class A_F159 {
    private _field: double = 4
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
  }

class A_F160 {
    private _field: number = 4
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
  }

class A_F161 {
    private _field: float = 4.5f
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
  }

class A_F162 {
    private _field: bigint = 4n
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
  }

class A_F163 {
    private _field: string = "abc"
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
  }

class A_F164 {
    private _field: char = c'a'
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
  }

class A_F165 {
    private _field: boolean = false
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
  }

class A_F166 {
    private _field: Object = 4
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
  }

class A_F167 {
    private _field: Object | undefined = undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
  }

class A_F168 {
    private _field: Object | undefined | null = 4
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
  }

class A_F170 {
    protected _field: long = 4
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
  }

class A_F171 {
    protected _field: int = 4
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
  }

class A_F172 {
    protected _field: byte = 4
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
  }

class A_F173 {
    protected _field: short = 4
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
  }

class A_F174 {
    protected _field: double = 4
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
  }

class A_F175 {
    protected _field: number = 4
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
  }

class A_F176 {
    protected _field: float = 4.5f
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
  }

class A_F177 {
    protected _field: bigint = 4n
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
  }

class A_F178 {
    protected _field: string = "abc"
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
  }

class A_F179 {
    protected _field: char = c'a'
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
  }

class A_F180 {
    protected _field: boolean = false
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
  }

class A_F181 {
    protected _field: Object = 4
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
  }

class A_F182 {
    protected _field: Object | undefined = undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
  }

class A_F183 {
    protected _field: Object | undefined | null = 4
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
  }

class A_F185 {
    _field: long = 4
    get field(): long {
      return this._field
    }
    set field(a: long) {
      this._field = a
    }
  }

class A_F186 {
    _field: int = 4
    get field(): int {
      return this._field
    }
    set field(a: int) {
      this._field = a
    }
  }

class A_F187 {
    _field: byte = 4
    get field(): byte {
      return this._field
    }
    set field(a: byte) {
      this._field = a
    }
  }

class A_F188 {
    _field: short = 4
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
  }

class A_F189 {
    _field: double = 4
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
  }

class A_F190 {
    _field: number = 4
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
  }

class A_F191 {
    _field: float = 4.5f
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
  }

class A_F192 {
    _field: bigint = 4n
    get field(): bigint {
      return this._field
    }
    set field(a: bigint) {
      this._field = a
    }
  }

class A_F193 {
    _field: string = "abc"
    get field(): string {
      return this._field
    }
    set field(a: string) {
      this._field = a
    }
  }

class A_F194 {
    _field: char = c'a'
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
  }

class A_F195 {
    _field: boolean = false
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
  }

class A_F196 {
    _field: Object = 4
    get field(): Object {
      return this._field
    }
    set field(a: Object) {
      this._field = a
    }
  }

class A_F197 {
    _field: Object | undefined = undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
  }

class A_F198 {
    _field: Object | undefined | null = 4
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
  }

export default function FieldInitializationOneTest(): void {
  describe("FieldInitializationOneTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_ONE_0100
     * @tc.name      testFieldInitOne0001
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F100 = new A_F100()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0200
     * @tc.name      testFieldInitOne0002
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F101 = new A_F101()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0300
     * @tc.name      testFieldInitOne0003
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F102 = new A_F102()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0400
     * @tc.name      testFieldInitOne0004
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F103 = new A_F103()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0500
     * @tc.name      testFieldInitOne0005
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F104 = new A_F104()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0600
     * @tc.name      testFieldInitOne0006
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F105 = new A_F105()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0700
     * @tc.name      testFieldInitOne0007
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F106 = new A_F106()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0800
     * @tc.name      testFieldInitOne0008
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F107 = new A_F107()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_0900
     * @tc.name      testFieldInitOne0009
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F108 = new A_F108()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1000
     * @tc.name      testFieldInitOne0010
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F110 = new A_F110()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1100
     * @tc.name      testFieldInitOne0011
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F111 = new A_F111()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1200
     * @tc.name      testFieldInitOne0012
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F112 = new A_F112()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1300
     * @tc.name      testFieldInitOne0013
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F113 = new A_F113()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1400
     * @tc.name      testFieldInitOne0014
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F114 = new A_F114()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1500
     * @tc.name      testFieldInitOne0015
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F115 = new A_F115()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1600
     * @tc.name      testFieldInitOne0016
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F116 = new A_F116()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1700
     * @tc.name      testFieldInitOne0017
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F117 = new A_F117()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1800
     * @tc.name      testFieldInitOne0018
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F118 = new A_F118()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_1900
     * @tc.name      testFieldInitOne0019
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F119 = new A_F119()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2000
     * @tc.name      testFieldInitOne0020
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F120 = new A_F120()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2100
     * @tc.name      testFieldInitOne0021
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F121 = new A_F121()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2200
     * @tc.name      testFieldInitOne0022
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F122 = new A_F122()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2300
     * @tc.name      testFieldInitOne0023
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F123 = new A_F123()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2400
     * @tc.name      testFieldInitOne0024
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F125 = new A_F125()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2500
     * @tc.name      testFieldInitOne0025
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F126 = new A_F126()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2600
     * @tc.name      testFieldInitOne0026
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F127 = new A_F127()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2700
     * @tc.name      testFieldInitOne0027
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F128 = new A_F128()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2800
     * @tc.name      testFieldInitOne0028
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F129 = new A_F129()
          const lambda = () => {
        a.field = 7.3
          }
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_2900
     * @tc.name      testFieldInitOne0029
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F130 = new A_F130()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3000
     * @tc.name      testFieldInitOne0030
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F131 = new A_F131()
          const lambda = () => {
        a.field = 7.3f
          }
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          lambda()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3100
     * @tc.name      testFieldInitOne0031
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F132 = new A_F132()
          const lambda = () => {
        a.field = 5n
          }
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          lambda()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3200
     * @tc.name      testFieldInitOne0032
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F133 = new A_F133()
          const lambda = () => {
        a.field = "efg"
          }
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          lambda()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3300
     * @tc.name      testFieldInitOne0033
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F134 = new A_F134()
          const lambda = () => {
        a.field = c'b'
          }
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          lambda()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3400
     * @tc.name      testFieldInitOne0034
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F135 = new A_F135()
          const lambda = () => {
        a.field = true
          }
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          lambda()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3500
     * @tc.name      testFieldInitOne0035
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F136 = new A_F136()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3600
     * @tc.name      testFieldInitOne0036
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F137 = new A_F137()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
          lambda()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3700
     * @tc.name      testFieldInitOne0037
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F138 = new A_F138()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3800
     * @tc.name      testFieldInitOne0038
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F140 = new A_F140()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_3900
     * @tc.name      testFieldInitOne0039
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F141 = new A_F141()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4000
     * @tc.name      testFieldInitOne0040
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F142 = new A_F142()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4100
     * @tc.name      testFieldInitOne0041
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F143 = new A_F143()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4200
     * @tc.name      testFieldInitOne0042
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F144 = new A_F144()
          const lambda = () => {
        a.field = 7.3
          }
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4300
     * @tc.name      testFieldInitOne0043
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F145 = new A_F145()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4400
     * @tc.name      testFieldInitOne0044
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F146 = new A_F146()
          const lambda = () => {
        a.field = 7.3f
          }
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          lambda()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4500
     * @tc.name      testFieldInitOne0045
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F147 = new A_F147()
          const lambda = () => {
        a.field = 5n
          }
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          lambda()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4600
     * @tc.name      testFieldInitOne0046
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F148 = new A_F148()
          const lambda = () => {
        a.field = "efg"
          }
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          lambda()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4700
     * @tc.name      testFieldInitOne0047
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F149 = new A_F149()
          const lambda = () => {
        a.field = c'b'
          }
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          lambda()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4800
     * @tc.name      testFieldInitOne0048
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F150 = new A_F150()
          const lambda = () => {
        a.field = true
          }
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          lambda()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_4900
     * @tc.name      testFieldInitOne0049
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F151 = new A_F151()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5000
     * @tc.name      testFieldInitOne0050
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F152 = new A_F152()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
          lambda()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5100
     * @tc.name      testFieldInitOne0051
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F153 = new A_F153()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5200
     * @tc.name      testFieldInitOne0052
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F155 = new A_F155()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5300
     * @tc.name      testFieldInitOne0053
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F156 = new A_F156()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5400
     * @tc.name      testFieldInitOne0054
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F157 = new A_F157()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5500
     * @tc.name      testFieldInitOne0055
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F158 = new A_F158()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5600
     * @tc.name      testFieldInitOne0056
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F159 = new A_F159()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5700
     * @tc.name      testFieldInitOne0057
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F160 = new A_F160()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5800
     * @tc.name      testFieldInitOne0058
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F161 = new A_F161()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_5900
     * @tc.name      testFieldInitOne0059
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F162 = new A_F162()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6000
     * @tc.name      testFieldInitOne0060
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F163 = new A_F163()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6100
     * @tc.name      testFieldInitOne0061
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F164 = new A_F164()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6200
     * @tc.name      testFieldInitOne0062
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F165 = new A_F165()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6300
     * @tc.name      testFieldInitOne0063
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F166 = new A_F166()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6400
     * @tc.name      testFieldInitOne0064
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F167 = new A_F167()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6500
     * @tc.name      testFieldInitOne0065
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F168 = new A_F168()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6600
     * @tc.name      testFieldInitOne0066
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F170 = new A_F170()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6700
     * @tc.name      testFieldInitOne0067
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F171 = new A_F171()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6800
     * @tc.name      testFieldInitOne0068
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F172 = new A_F172()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_6900
     * @tc.name      testFieldInitOne0069
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F173 = new A_F173()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7000
     * @tc.name      testFieldInitOne0070
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F174 = new A_F174()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7100
     * @tc.name      testFieldInitOne0071
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F175 = new A_F175()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7200
     * @tc.name      testFieldInitOne0072
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F176 = new A_F176()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7300
     * @tc.name      testFieldInitOne0073
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F177 = new A_F177()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7400
     * @tc.name      testFieldInitOne0074
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F178 = new A_F178()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7500
     * @tc.name      testFieldInitOne0075
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F179 = new A_F179()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7600
     * @tc.name      testFieldInitOne0076
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F180 = new A_F180()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7700
     * @tc.name      testFieldInitOne0077
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F181 = new A_F181()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7800
     * @tc.name      testFieldInitOne0078
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F182 = new A_F182()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_7900
     * @tc.name      testFieldInitOne0079
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F183 = new A_F183()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8000
     * @tc.name      testFieldInitOne0080
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F185 = new A_F185()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8100
     * @tc.name      testFieldInitOne0081
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F186 = new A_F186()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8200
     * @tc.name      testFieldInitOne0082
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F187 = new A_F187()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8300
     * @tc.name      testFieldInitOne0083
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F188 = new A_F188()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8400
     * @tc.name      testFieldInitOne0084
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F189 = new A_F189()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8500
     * @tc.name      testFieldInitOne0085
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F190 = new A_F190()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8600
     * @tc.name      testFieldInitOne0086
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F191 = new A_F191()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8700
     * @tc.name      testFieldInitOne0087
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F192 = new A_F192()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8800
     * @tc.name      testFieldInitOne0088
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F193 = new A_F193()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_8900
     * @tc.name      testFieldInitOne0089
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F194 = new A_F194()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_9000
     * @tc.name      testFieldInitOne0090
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F195 = new A_F195()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_9100
     * @tc.name      testFieldInitOne0091
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F196 = new A_F196()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_9200
     * @tc.name      testFieldInitOne0092
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F197 = new A_F197()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_ONE_9300
     * @tc.name      testFieldInitOne0093
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitOne0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F198 = new A_F198()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
