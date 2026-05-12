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

class Base_F109 {
    field: Any = 4
  }
  class A_F109 extends Base_F109 {
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

class Base_F124 {
    field: Any = 4
  }
  class B_F124 extends Base_F124 {
  }
  class A_F124 extends B_F124 {
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

class Base_F139 {
    field: Any = 4
  }
  class A_F139 extends Base_F139 {
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

class Base_F154 {
    field: Any = 4
  }
  class B_F154 extends Base_F154 {
  }
  class A_F154 extends B_F154 {
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

class A_F169 {
    private _field: Any = 4
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
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

class A_F184 {
    protected _field: Any = 4
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
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

export default function FieldInitializationTestOne(): void {
  describe("FieldInitializationTestOne", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0100
     * @tc.name      testFieldInit0100
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F100 = new A_F100()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0101
     * @tc.name      testFieldInit0101
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F101 = new A_F101()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0102
     * @tc.name      testFieldInit0102
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F102 = new A_F102()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0103
     * @tc.name      testFieldInit0103
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F103 = new A_F103()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0104
     * @tc.name      testFieldInit0104
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F104 = new A_F104()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0105
     * @tc.name      testFieldInit0105
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F105 = new A_F105()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0106
     * @tc.name      testFieldInit0106
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F106 = new A_F106()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0107
     * @tc.name      testFieldInit0107
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F107 = new A_F107()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0108
     * @tc.name      testFieldInit0108
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F108 = new A_F108()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0109
     * @tc.name      testFieldInit0109
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F109 = new A_F109()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0110
     * @tc.name      testFieldInit0110
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F110 = new A_F110()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0111
     * @tc.name      testFieldInit0111
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F111 = new A_F111()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0112
     * @tc.name      testFieldInit0112
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F112 = new A_F112()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0113
     * @tc.name      testFieldInit0113
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F113 = new A_F113()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0114
     * @tc.name      testFieldInit0114
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F114 = new A_F114()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0115
     * @tc.name      testFieldInit0115
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F115 = new A_F115()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0116
     * @tc.name      testFieldInit0116
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F116 = new A_F116()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0117
     * @tc.name      testFieldInit0117
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F117 = new A_F117()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0118
     * @tc.name      testFieldInit0118
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F118 = new A_F118()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0119
     * @tc.name      testFieldInit0119
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F119 = new A_F119()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0120
     * @tc.name      testFieldInit0120
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F120 = new A_F120()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0121
     * @tc.name      testFieldInit0121
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F121 = new A_F121()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0122
     * @tc.name      testFieldInit0122
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F122 = new A_F122()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0123
     * @tc.name      testFieldInit0123
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F123 = new A_F123()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0124
     * @tc.name      testFieldInit0124
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F124 = new A_F124()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0125
     * @tc.name      testFieldInit0125
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0126
     * @tc.name      testFieldInit0126
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0127
     * @tc.name      testFieldInit0127
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0128
     * @tc.name      testFieldInit0128
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0129
     * @tc.name      testFieldInit0129
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0130
     * @tc.name      testFieldInit0130
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0131
     * @tc.name      testFieldInit0131
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0132
     * @tc.name      testFieldInit0132
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0133
     * @tc.name      testFieldInit0133
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0134
     * @tc.name      testFieldInit0134
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0135
     * @tc.name      testFieldInit0135
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0136
     * @tc.name      testFieldInit0136
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0137
     * @tc.name      testFieldInit0137
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F137 = new A_F137()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
          lambda()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0138
     * @tc.name      testFieldInit0138
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F138 = new A_F138()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0139
     * @tc.name      testFieldInit0139
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F139 = new A_F139()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0140
     * @tc.name      testFieldInit0140
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0141
     * @tc.name      testFieldInit0141
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0142
     * @tc.name      testFieldInit0142
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0143
     * @tc.name      testFieldInit0143
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0144
     * @tc.name      testFieldInit0144
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0145
     * @tc.name      testFieldInit0145
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0146
     * @tc.name      testFieldInit0146
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0147
     * @tc.name      testFieldInit0147
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0148
     * @tc.name      testFieldInit0148
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0149
     * @tc.name      testFieldInit0149
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0150
     * @tc.name      testFieldInit0150
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0151
     * @tc.name      testFieldInit0151
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0152
     * @tc.name      testFieldInit0152
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F152 = new A_F152()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
          lambda()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0153
     * @tc.name      testFieldInit0153
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F153 = new A_F153()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0154
     * @tc.name      testFieldInit0154
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F154 = new A_F154()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
          lambda()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0155
     * @tc.name      testFieldInit0155
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F155 = new A_F155()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0156
     * @tc.name      testFieldInit0156
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F156 = new A_F156()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0157
     * @tc.name      testFieldInit0157
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F157 = new A_F157()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0158
     * @tc.name      testFieldInit0158
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F158 = new A_F158()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0159
     * @tc.name      testFieldInit0159
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F159 = new A_F159()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0160
     * @tc.name      testFieldInit0160
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F160 = new A_F160()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0161
     * @tc.name      testFieldInit0161
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F161 = new A_F161()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0162
     * @tc.name      testFieldInit0162
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F162 = new A_F162()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0163
     * @tc.name      testFieldInit0163
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F163 = new A_F163()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0164
     * @tc.name      testFieldInit0164
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F164 = new A_F164()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0165
     * @tc.name      testFieldInit0165
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F165 = new A_F165()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0166
     * @tc.name      testFieldInit0166
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F166 = new A_F166()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0167
     * @tc.name      testFieldInit0167
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F167 = new A_F167()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0168
     * @tc.name      testFieldInit0168
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F168 = new A_F168()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0169
     * @tc.name      testFieldInit0169
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F169 = new A_F169()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0170
     * @tc.name      testFieldInit0170
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F170 = new A_F170()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0171
     * @tc.name      testFieldInit0171
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F171 = new A_F171()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0172
     * @tc.name      testFieldInit0172
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F172 = new A_F172()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0173
     * @tc.name      testFieldInit0173
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F173 = new A_F173()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0174
     * @tc.name      testFieldInit0174
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F174 = new A_F174()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0175
     * @tc.name      testFieldInit0175
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F175 = new A_F175()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0176
     * @tc.name      testFieldInit0176
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F176 = new A_F176()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0177
     * @tc.name      testFieldInit0177
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F177 = new A_F177()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0178
     * @tc.name      testFieldInit0178
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F178 = new A_F178()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0179
     * @tc.name      testFieldInit0179
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F179 = new A_F179()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0180
     * @tc.name      testFieldInit0180
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F180 = new A_F180()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0181
     * @tc.name      testFieldInit0181
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F181 = new A_F181()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0182
     * @tc.name      testFieldInit0182
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F182 = new A_F182()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0183
     * @tc.name      testFieldInit0183
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F183 = new A_F183()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0184
     * @tc.name      testFieldInit0184
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F184 = new A_F184()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0185
     * @tc.name      testFieldInit0185
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F185 = new A_F185()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0186
     * @tc.name      testFieldInit0186
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F186 = new A_F186()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0187
     * @tc.name      testFieldInit0187
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F187 = new A_F187()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0188
     * @tc.name      testFieldInit0188
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F188 = new A_F188()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0189
     * @tc.name      testFieldInit0189
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F189 = new A_F189()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0190
     * @tc.name      testFieldInit0190
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F190 = new A_F190()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0191
     * @tc.name      testFieldInit0191
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F191 = new A_F191()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0192
     * @tc.name      testFieldInit0192
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F192 = new A_F192()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0193
     * @tc.name      testFieldInit0193
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F193 = new A_F193()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0194
     * @tc.name      testFieldInit0194
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F194 = new A_F194()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0195
     * @tc.name      testFieldInit0195
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F195 = new A_F195()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0196
     * @tc.name      testFieldInit0196
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F196 = new A_F196()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0197
     * @tc.name      testFieldInit0197
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F197 = new A_F197()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0198
     * @tc.name      testFieldInit0198
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F198 = new A_F198()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })
  })
}
