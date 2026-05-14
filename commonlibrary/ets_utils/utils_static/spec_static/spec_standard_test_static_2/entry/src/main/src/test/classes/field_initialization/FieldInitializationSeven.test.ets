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


namespace ns {
    export class Base_F707 {
      protected v: long = 4
    }
    export class A_F707 extends Base_F707 {
      field: long
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F708 {
      protected v: int = 4
    }
    export class A_F708 extends Base_F708 {
      field: int
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F709 {
      protected v: byte = 4
    }
    export class A_F709 extends Base_F709 {
      field: byte
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F710 {
      protected v: short = 4
    }
    export class A_F710 extends Base_F710 {
      field: short
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F711 {
      protected v: double = 4
    }
    export class A_F711 extends Base_F711 {
      field: double
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F712 {
      protected v: number = 4
    }
    export class A_F712 extends Base_F712 {
      field: number
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F713 {
      protected v: float = 4.5f
    }
    export class A_F713 extends Base_F713 {
      field: float
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F714 {
      protected v: bigint = 4n
    }
    export class A_F714 extends Base_F714 {
      field: bigint
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F715 {
      protected v: string = "abc"
    }
    export class A_F715 extends Base_F715 {
      field: string
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F716 {
      protected v: char = c'a'
    }
    export class A_F716 extends Base_F716 {
      field: char
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F717 {
      protected v: boolean = false
    }
    export class A_F717 extends Base_F717 {
      field: boolean
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F718 {
      protected v: Object = 4
    }
    export class A_F718 extends Base_F718 {
      field: Object
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class Base_F719 {
      protected v: Object | undefined | null = 4
    }
    export class A_F719 extends Base_F719 {
      field: Object | undefined | null
      constructor () {
        super()
        this.field = this.v
      }
    }
  }

namespace ns {
    export class A_F721 {
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
  }

namespace ns {
    export class A_F722 {
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
  }

namespace ns {
    export class A_F723 {
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
  }

namespace ns {
    export class A_F724 {
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
  }

namespace ns {
    export class A_F725 {
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
  }

namespace ns {
    export class A_F726 {
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
  }

namespace ns {
    export class A_F727 {
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
  }

namespace ns {
    export class A_F728 {
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
  }

namespace ns {
    export class A_F729 {
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
  }

namespace ns {
    export class A_F730 {
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
  }

namespace ns {
    export class A_F731 {
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
  }

namespace ns {
    export class A_F732 {
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
  }

namespace ns {
    export class A_F733 {
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
  }

namespace ns {
    export class A_F749 {
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
  }

namespace ns {
    export class A_F750 {
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
  }

namespace ns {
    export class A_F751 {
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
  }

namespace ns {
    export class A_F752 {
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
  }

namespace ns {
    export class A_F753 {
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
  }

namespace ns {
    export class A_F754 {
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
  }

namespace ns {
    export class A_F755 {
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
  }

namespace ns {
    export class A_F756 {
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
  }

namespace ns {
    export class A_F757 {
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
  }

namespace ns {
    export class A_F758 {
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
  }

namespace ns {
    export class A_F759 {
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
  }

namespace ns {
    export class A_F760 {
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
  }

namespace ns {
    export class A_F761 {
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
  }

namespace ns {
    export class A_F763 {
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
  }

namespace ns {
    export class A_F764 {
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
  }

namespace ns {
    export class A_F765 {
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
  }

namespace ns {
    export class A_F766 {
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
  }

namespace ns {
    export class A_F767 {
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
  }

namespace ns {
    export class A_F768 {
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
  }

namespace ns {
    export class A_F769 {
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
  }

namespace ns {
    export class A_F770 {
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
  }

namespace ns {
    export class A_F771 {
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
  }

namespace ns {
    export class A_F772 {
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
  }

namespace ns {
    export class A_F773 {
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
  }

namespace ns {
    export class A_F774 {
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
  }

namespace ns {
    export class A_F775 {
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
  }

class A_F791 {
    static field: long
  }

class A_F792 {
    static field: int
  }

export default function FieldInitializationSevenTest(): void {
  describe("FieldInitializationSevenTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_SEVEN_0100
     * @tc.name      testFieldInitSeven0001
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F707 = new ns.A_F707()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0200
     * @tc.name      testFieldInitSeven0002
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F708 = new ns.A_F708()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0300
     * @tc.name      testFieldInitSeven0003
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F709 = new ns.A_F709()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0400
     * @tc.name      testFieldInitSeven0004
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F710 = new ns.A_F710()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0500
     * @tc.name      testFieldInitSeven0005
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F711 = new ns.A_F711()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0600
     * @tc.name      testFieldInitSeven0006
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F712 = new ns.A_F712()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0700
     * @tc.name      testFieldInitSeven0007
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F713 = new ns.A_F713()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0800
     * @tc.name      testFieldInitSeven0008
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F714 = new ns.A_F714()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_0900
     * @tc.name      testFieldInitSeven0009
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F715 = new ns.A_F715()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1000
     * @tc.name      testFieldInitSeven0010
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F716 = new ns.A_F716()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1100
     * @tc.name      testFieldInitSeven0011
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F717 = new ns.A_F717()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1200
     * @tc.name      testFieldInitSeven0012
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F718 = new ns.A_F718()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1300
     * @tc.name      testFieldInitSeven0013
     * @tc.desc      Checking for initialization from constructor with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: ns.A_F719 = new ns.A_F719()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1400
     * @tc.name      testFieldInitSeven0014
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F721()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1500
     * @tc.name      testFieldInitSeven0015
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F722()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1600
     * @tc.name      testFieldInitSeven0016
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F723()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1700
     * @tc.name      testFieldInitSeven0017
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F724()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1800
     * @tc.name      testFieldInitSeven0018
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F725()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_1900
     * @tc.name      testFieldInitSeven0019
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F726()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2000
     * @tc.name      testFieldInitSeven0020
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F727()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2100
     * @tc.name      testFieldInitSeven0021
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F728()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2200
     * @tc.name      testFieldInitSeven0022
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F729()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2300
     * @tc.name      testFieldInitSeven0023
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F731()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2400
     * @tc.name      testFieldInitSeven0024
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F732()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2500
     * @tc.name      testFieldInitSeven0025
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F733()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2600
     * @tc.name      testFieldInitSeven0026
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F749()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2700
     * @tc.name      testFieldInitSeven0027
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F750()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2800
     * @tc.name      testFieldInitSeven0028
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F751()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_2900
     * @tc.name      testFieldInitSeven0029
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F752()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3000
     * @tc.name      testFieldInitSeven0030
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F753()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3100
     * @tc.name      testFieldInitSeven0031
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F754()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3200
     * @tc.name      testFieldInitSeven0032
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F755()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3300
     * @tc.name      testFieldInitSeven0033
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F756()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3400
     * @tc.name      testFieldInitSeven0034
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F757()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3500
     * @tc.name      testFieldInitSeven0035
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F759()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3600
     * @tc.name      testFieldInitSeven0036
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F760()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3700
     * @tc.name      testFieldInitSeven0037
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F761()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3800
     * @tc.name      testFieldInitSeven0038
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F763()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_3900
     * @tc.name      testFieldInitSeven0039
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F764()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4000
     * @tc.name      testFieldInitSeven0040
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F765()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4100
     * @tc.name      testFieldInitSeven0041
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F766()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4200
     * @tc.name      testFieldInitSeven0042
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F767()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4300
     * @tc.name      testFieldInitSeven0043
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F768()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4400
     * @tc.name      testFieldInitSeven0044
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F769()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4500
     * @tc.name      testFieldInitSeven0045
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F770()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4600
     * @tc.name      testFieldInitSeven0046
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F771()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4700
     * @tc.name      testFieldInitSeven0047
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F773()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4800
     * @tc.name      testFieldInitSeven0048
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F774()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_4900
     * @tc.name      testFieldInitSeven0049
     * @tc.desc      Checking for getter and setter with namespace usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new ns.A_F775()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })


    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_5000
     * @tc.name      testFieldInitSeven0050
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F791.field instanceof long).assertTrue()
      expect(A_F791.field).assertEqual(0)
          A_F791.field = 5
      expect(A_F791.field instanceof long).assertTrue()
      expect(A_F791.field).assertEqual(5)
          A_F791.field = 0
      expect(A_F791.field instanceof long).assertTrue()
      expect(A_F791.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_SEVEN_5100
     * @tc.name      testFieldInitSeven0051
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitSeven0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F792.field instanceof int).assertTrue()
      expect(A_F792.field).assertEqual(0)
          A_F792.field = 5
      expect(A_F792.field instanceof int).assertTrue()
      expect(A_F792.field).assertEqual(5)
          A_F792.field = 0
      expect(A_F792.field instanceof int).assertTrue()
      expect(A_F792.field).assertEqual(0)
    })
  })
}
