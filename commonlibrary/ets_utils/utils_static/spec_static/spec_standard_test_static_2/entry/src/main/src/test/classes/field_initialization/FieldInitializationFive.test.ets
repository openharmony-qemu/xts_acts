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

class Base_F496 {
    protected _field: short
    get field(): short {
      return this._field
    }
    set field(a: short) {
      this._field = a
    }
  }
  class A_F496 extends Base_F496 {
    constructor () {
      super()
      this._field = 4
    }
  }

class Base_F497 {
    protected _field: double
    get field(): double {
      return this._field
    }
    set field(a: double) {
      this._field = a
    }
  }
  class A_F497 extends Base_F497 {
    constructor () {
      super()
      this._field = 4
    }
  }

class Base_F498 {
    protected _field: number
    get field(): number {
      return this._field
    }
    set field(a: number) {
      this._field = a
    }
  }
  class A_F498 extends Base_F498 {
    constructor () {
      super()
      this._field = 4
    }
  }

class Base_F499 {
    protected _field: float
    get field(): float {
      return this._field
    }
    set field(a: float) {
      this._field = a
    }
  }
  class A_F499 extends Base_F499 {
    constructor () {
      super()
      this._field = 4.5f
    }
  }

class Base_F500 {
    protected _field: char
    get field(): char {
      return this._field
    }
    set field(a: char) {
      this._field = a
    }
  }
  class A_F500 extends Base_F500 {
    constructor () {
      super()
      this._field = c'a'
    }
  }

class Base_F501 {
    protected _field: boolean
    get field(): boolean {
      return this._field
    }
    set field(a: boolean) {
      this._field = a
    }
  }
  class A_F501 extends Base_F501 {
    constructor () {
      super()
      this._field = false
    }
  }

class Base_F502 {
    protected _field: Object | undefined
    get field(): Object | undefined {
      return this._field
    }
    set field(a: Object | undefined) {
      this._field = a
    }
  }
  class A_F502 extends Base_F502 {
    constructor () {
      super()
      this._field = undefined
    }
  }

class Base_F503 {
    protected _field: Object | undefined | null
    get field(): Object | undefined | null {
      return this._field
    }
    set field(a: Object | undefined | null) {
      this._field = a
    }
  }
  class A_F503 extends Base_F503 {
    constructor () {
      super()
      this._field = 4
    }
  }

class Base_F505 {
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
  class A_F505 extends Base_F505 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F506 {
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
  class A_F506 extends Base_F506 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F507 {
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
  class A_F507 extends Base_F507 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F508 {
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
  class A_F508 extends Base_F508 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F509 {
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
  class A_F509 extends Base_F509 {
    constructor () {
      super()
      this._field = 7.3
    }
  }

class Base_F510 {
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
  class A_F510 extends Base_F510 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F511 {
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
  class A_F511 extends Base_F511 {
    constructor () {
      super()
      this._field = 7.3f
    }
  }

class Base_F512 {
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
  class A_F512 extends Base_F512 {
    constructor () {
      super()
      this._field = 5n
    }
  }

class Base_F513 {
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
  class A_F513 extends Base_F513 {
    constructor () {
      super()
      this._field = "efg"
    }
  }

class Base_F514 {
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
  class A_F514 extends Base_F514 {
    constructor () {
      super()
      this._field = c'b'
    }
  }

class Base_F515 {
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
  class A_F515 extends Base_F515 {
    constructor () {
      super()
      this._field = true
    }
  }

class Base_F516 {
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
  class A_F516 extends Base_F516 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F517 {
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
  class A_F517 extends Base_F517 {
    constructor () {
      super()
      this._field = 5
    }
  }

class Base_F518 {
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
  class A_F518 extends Base_F518 {
    constructor () {
      super()
      this._field = 5
    }
  }

class C_F520 {data: int = 0}
  class Base_F520 {
    protected _field: C_F520
    get field(): C_F520 {
      return this._field
    }
    set field(a: C_F520) {
      this._field = a
    }
    constructor () {
      this._field = {data: 4}
    }
  }
  class A_F520 extends Base_F520 {
    constructor () {
      super()
      this._field = {data: 5}
    }
  }

class A_F521 {
    field: long = 4
    constructor (v: long = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F522 {
    field: int = 4
    constructor (v: int = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F523 {
    field: byte = 4
    constructor (v: byte = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F524 {
    field: short = 4
    constructor (v: short = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F525 {
    field: double = 4
    constructor (v: double = 4) {
      if (v == 7.3) {
        this.field = v
      }
    }
  }

class A_F526 {
    field: number = 4
    constructor (v: int = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F527 {
    field: float = 4.5f
    constructor (v: float = 4.5f) {
      if (v == 7.3f) {
        this.field = v
      }
    }
  }

class A_F528 {
    field: bigint = 4n
    constructor (v: bigint = 4n) {
      if (v == 5n) {
        this.field = v
      }
    }
  }

class A_F529 {
    field: string = "abc"
    constructor (v: string = "abc") {
      if (v == "efg") {
        this.field = v
      }
    }
  }

class A_F530 {
    field: char = c'a'
    constructor (v: char = c'a') {
      if (v == c'b') {
        this.field = v
      }
    }
  }

class A_F531 {
    field: boolean = false
    constructor (v: boolean = false) {
      if (v == true) {
        this.field = v
      }
    }
  }

class A_F532 {
    field: Object = 4
    constructor (v: Object = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F533 {
    field: Object | undefined = undefined
    constructor (v: Object | undefined = undefined) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F534 {
    field: Object | undefined | null = 4
    constructor (v: Object | undefined | null = 4) {
      if (v == 5) {
        this.field = v
      }
    }
  }

class A_F536 {
    field: long = 4
    constructor () {
      this.field = 5
    }
  }

class A_F537 {
    field: int = 4
    constructor () {
      this.field = 5
    }
  }

class A_F538 {
    field: byte = 4
    constructor () {
      this.field = 5
    }
  }

class A_F539 {
    field: short = 4
    constructor () {
      this.field = 5
    }
  }

class A_F540 {
    field: double = 4
    constructor () {
      this.field = 7.3
    }
  }

class A_F541 {
    field: number = 4
    constructor () {
      this.field = 5
    }
  }

class A_F542 {
    field: float = 4.5f
    constructor () {
      this.field = 7.3f
    }
  }

class A_F543 {
    field: bigint = 4n
    constructor () {
      this.field = 5n
    }
  }

class A_F544 {
    field: string = "abc"
    constructor () {
      this.field = "efg"
    }
  }

class A_F545 {
    field: char = c'a'
    constructor () {
      this.field = c'b'
    }
  }

class A_F546 {
    field: boolean = false
    constructor () {
      this.field = true
    }
  }

class A_F547 {
    field: Object = 4
    constructor () {
      this.field = 5
    }
  }

class A_F548 {
    field: Object | undefined = undefined
    constructor () {
      this.field = 5
    }
  }

class A_F549 {
    field: Object | undefined | null = 4
    constructor () {
      this.field = 5
    }
  }

class C_F551 {data: int = 0}
  class A_F551 {
    field: C_F551 = {data: 4}
    constructor () {
      this.field = {data: 5}
    }
  }

class A_F552 {
    field: long
  }

class A_F553 {
    field: int
  }

class A_F554 {
    field: byte
  }

class A_F555 {
    field: short
  }

class A_F556 {
    field: double
  }

class A_F557 {
    field: number
  }

class A_F558 {
    field: float
  }

class A_F559 {
    field: char
  }

class A_F560 {
    field: boolean
  }

class A_F561 {
    field: Object | undefined
  }

class A_F562 {
    field: Object | undefined | null
  }

class A_F564 {
    field: long = 4
  }

class A_F565 {
    field: int = 4
  }

class A_F566 {
    field: byte = 4
  }

class A_F567 {
    field: short = 4
  }

class A_F568 {
    field: double = 4
  }

class A_F569 {
    field: number = 4
  }

class A_F570 {
    field: float = 4.5f
  }

class A_F571 {
    field: bigint = 4n
  }

class A_F572 {
    field: string = "abc"
  }

class A_F573 {
    field: char = c'a'
  }

class A_F574 {
    field: boolean = false
  }

class A_F575 {
    field: Object = 4
  }

class A_F576 {
    field: Object | undefined = undefined
  }

class A_F577 {
    field: Object | undefined | null = 4
  }

class C_F579 {data: int = 0}
  class A_F579 {
    field: C_F579 = {data: 4}
  }

class A_F580 {
    field: long = 4
    constructor () {
      this.field = 4
    }
  }

class A_F581 {
    field: int = 4
    constructor () {
      this.field = 4
    }
  }

class A_F582 {
    field: byte = 4
    constructor () {
      this.field = 4
    }
  }

class A_F583 {
    field: short = 4
    constructor () {
      this.field = 4
    }
  }

class A_F584 {
    field: double = 4
    constructor () {
      this.field = 4
    }
  }

class A_F585 {
    field: number = 4
    constructor () {
      this.field = 4
    }
  }

class A_F586 {
    field: float = 4.5f
    constructor () {
      this.field = 4.5f
    }
  }

class A_F587 {
    field: bigint = 4n
    constructor () {
      this.field = 4n
    }
  }

class A_F588 {
    field: string = "abc"
    constructor () {
      this.field = "abc"
    }
  }

class A_F589 {
    field: char = c'a'
    constructor () {
      this.field = c'a'
    }
  }

class A_F590 {
    field: boolean = false
    constructor () {
      this.field = false
    }
  }

class A_F591 {
    field: Object = 4
    constructor () {
      this.field = 4
    }
  }

class A_F592 {
    field: Object | undefined = undefined
    constructor () {
      this.field = undefined
    }
  }

class A_F593 {
    field: Object | undefined | null = 4
    constructor () {
      this.field = 4
    }
  }

export default function FieldInitializationFiveTest(): void {
  describe("FieldInitializationFiveTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_FIVE_0100
     * @tc.name      testFieldInitFive0001
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F496 = new A_F496()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0200
     * @tc.name      testFieldInitFive0002
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F497 = new A_F497()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0300
     * @tc.name      testFieldInitFive0003
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F498 = new A_F498()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0400
     * @tc.name      testFieldInitFive0004
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F499 = new A_F499()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0500
     * @tc.name      testFieldInitFive0005
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F500 = new A_F500()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0600
     * @tc.name      testFieldInitFive0006
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F501 = new A_F501()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0700
     * @tc.name      testFieldInitFive0007
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F502 = new A_F502()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0800
     * @tc.name      testFieldInitFive0008
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F503 = new A_F503()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_0900
     * @tc.name      testFieldInitFive0009
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F505 = new A_F505()
          let b: Base_F505 = new Base_F505()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof long).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof long).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1000
     * @tc.name      testFieldInitFive0010
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F506 = new A_F506()
          let b: Base_F506 = new Base_F506()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof int).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof int).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1100
     * @tc.name      testFieldInitFive0011
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F507 = new A_F507()
          let b: Base_F507 = new Base_F507()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof byte).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof byte).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1200
     * @tc.name      testFieldInitFive0012
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F508 = new A_F508()
          let b: Base_F508 = new Base_F508()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof short).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof short).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1300
     * @tc.name      testFieldInitFive0013
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F509 = new A_F509()
          let b: Base_F509 = new Base_F509()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      expect(b.field instanceof double).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof double).assertTrue()
      expect(b.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1400
     * @tc.name      testFieldInitFive0014
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F510 = new A_F510()
          let b: Base_F510 = new Base_F510()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof number).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof number).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1500
     * @tc.name      testFieldInitFive0015
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F511 = new A_F511()
          let b: Base_F511 = new Base_F511()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(b.field instanceof float).assertTrue()
      expect(b.field).assertEqual(4.5f)
      a.field = 4.5f
          b.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      expect(b.field instanceof float).assertTrue()
      expect(b.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1600
     * @tc.name      testFieldInitFive0016
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F512 = new A_F512()
          let b: Base_F512 = new Base_F512()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      expect(b.field instanceof bigint).assertTrue()
      expect(b.field).assertEqual(4n)
      a.field = 4n
          b.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      expect(b.field instanceof bigint).assertTrue()
      expect(b.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1700
     * @tc.name      testFieldInitFive0017
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F513 = new A_F513()
          let b: Base_F513 = new Base_F513()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      expect(b.field instanceof string).assertTrue()
      expect(b.field).assertEqual("abc")
      a.field = "abc"
          b.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(b.field instanceof string).assertTrue()
      expect(b.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1800
     * @tc.name      testFieldInitFive0018
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F514 = new A_F514()
          let b: Base_F514 = new Base_F514()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      expect(b.field instanceof char).assertTrue()
      expect(b.field).assertEqual(c'a')
      a.field = c'a'
          b.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      expect(b.field instanceof char).assertTrue()
      expect(b.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_1900
     * @tc.name      testFieldInitFive0019
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F515 = new A_F515()
          let b: Base_F515 = new Base_F515()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(b.field instanceof boolean).assertTrue()
      expect(b.field).assertEqual(false)
      a.field = false
          b.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      expect(b.field instanceof boolean).assertTrue()
      expect(b.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2000
     * @tc.name      testFieldInitFive0020
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F516 = new A_F516()
          let b: Base_F516 = new Base_F516()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2100
     * @tc.name      testFieldInitFive0021
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F517 = new A_F517()
          let b: Base_F517 = new Base_F517()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(undefined)
      a.field = undefined
          b.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2200
     * @tc.name      testFieldInitFive0022
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F518 = new A_F518()
          let b: Base_F518 = new Base_F518()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(4)
      a.field = 4
          b.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2300
     * @tc.name      testFieldInitFive0023
     * @tc.desc      Checking for initialization from constructor with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F520 = new A_F520()
          let b: Base_F520 = new Base_F520()
      expect(a.field instanceof C_F520).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
      expect(b.field instanceof C_F520).assertTrue()
      expect(b.field.data instanceof int).assertTrue()
      expect(b.field.data).assertEqual(4)
      a.field = {data: 4}
          b.field = {data: 5}
      expect(a.field instanceof C_F520).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
      expect(b.field instanceof C_F520).assertTrue()
      expect(b.field.data instanceof int).assertTrue()
      expect(b.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2400
     * @tc.name      testFieldInitFive0024
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F521 = new A_F521()
          let b: A_F521 = new A_F521(5)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof long).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof long).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2500
     * @tc.name      testFieldInitFive0025
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F522 = new A_F522()
          let b: A_F522 = new A_F522(5)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof int).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof int).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2600
     * @tc.name      testFieldInitFive0026
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F523 = new A_F523()
          let b: A_F523 = new A_F523(5)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof byte).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof byte).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2700
     * @tc.name      testFieldInitFive0027
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F524 = new A_F524()
          let b: A_F524 = new A_F524(5)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof short).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof short).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2800
     * @tc.name      testFieldInitFive0028
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F525 = new A_F525()
          let b: A_F525 = new A_F525(7.3)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof double).assertTrue()
      expect(b.field).assertEqual(7.3)
      a.field = 7.3
          b.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      expect(b.field instanceof double).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_2900
     * @tc.name      testFieldInitFive0029
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F526 = new A_F526()
          let b: A_F526 = new A_F526(5)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof number).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof number).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3000
     * @tc.name      testFieldInitFive0030
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F527 = new A_F527()
          let b: A_F527 = new A_F527(7.3f)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      expect(b.field instanceof float).assertTrue()
      expect(b.field).assertEqual(7.3f)
      a.field = 7.3f
          b.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      expect(b.field instanceof float).assertTrue()
      expect(b.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3100
     * @tc.name      testFieldInitFive0031
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F528 = new A_F528()
          let b: A_F528 = new A_F528(5n)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      expect(b.field instanceof bigint).assertTrue()
      expect(b.field).assertEqual(5n)
      a.field = 5n
          b.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      expect(b.field instanceof bigint).assertTrue()
      expect(b.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3200
     * @tc.name      testFieldInitFive0032
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F529 = new A_F529()
          let b: A_F529 = new A_F529("efg")
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      expect(b.field instanceof string).assertTrue()
      expect(b.field).assertEqual("efg")
      a.field = "efg"
          b.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      expect(b.field instanceof string).assertTrue()
      expect(b.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3300
     * @tc.name      testFieldInitFive0033
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F530 = new A_F530()
          let b: A_F530 = new A_F530(c'b')
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      expect(b.field instanceof char).assertTrue()
      expect(b.field).assertEqual(c'b')
      a.field = c'b'
          b.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      expect(b.field instanceof char).assertTrue()
      expect(b.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3400
     * @tc.name      testFieldInitFive0034
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F531 = new A_F531()
          let b: A_F531 = new A_F531(true)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      expect(b.field instanceof boolean).assertTrue()
      expect(b.field).assertEqual(true)
      a.field = true
          b.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      expect(b.field instanceof boolean).assertTrue()
      expect(b.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3500
     * @tc.name      testFieldInitFive0035
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F532 = new A_F532()
          let b: A_F532 = new A_F532(5)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3600
     * @tc.name      testFieldInitFive0036
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F533 = new A_F533()
          let b: A_F533 = new A_F533(5)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = undefined
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3700
     * @tc.name      testFieldInitFive0037
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F534 = new A_F534()
          let b: A_F534 = new A_F534(5)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(5)
      a.field = 5
          b.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      expect(b.field instanceof Object).assertTrue()
      expect(b.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3800
     * @tc.name      testFieldInitFive0038
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F536 = new A_F536()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_3900
     * @tc.name      testFieldInitFive0039
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F537 = new A_F537()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4000
     * @tc.name      testFieldInitFive0040
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F538 = new A_F538()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4100
     * @tc.name      testFieldInitFive0041
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F539 = new A_F539()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4200
     * @tc.name      testFieldInitFive0042
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F540 = new A_F540()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4300
     * @tc.name      testFieldInitFive0043
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F541 = new A_F541()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4400
     * @tc.name      testFieldInitFive0044
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F542 = new A_F542()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4500
     * @tc.name      testFieldInitFive0045
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F543 = new A_F543()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4600
     * @tc.name      testFieldInitFive0046
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F544 = new A_F544()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4700
     * @tc.name      testFieldInitFive0047
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F545 = new A_F545()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4800
     * @tc.name      testFieldInitFive0048
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F546 = new A_F546()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_4900
     * @tc.name      testFieldInitFive0049
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F547 = new A_F547()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5000
     * @tc.name      testFieldInitFive0050
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F548 = new A_F548()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = undefined
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5100
     * @tc.name      testFieldInitFive0051
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F549 = new A_F549()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5200
     * @tc.name      testFieldInitFive0052
     * @tc.desc      Checking for initialization from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F551 = new A_F551()
      expect(a.field instanceof C_F551).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
      a.field = {data: 4}
      expect(a.field instanceof C_F551).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5300
     * @tc.name      testFieldInitFive0053
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F552 = {field: 4}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5400
     * @tc.name      testFieldInitFive0054
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F553 = {field: 4}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5500
     * @tc.name      testFieldInitFive0055
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F554 = {field: 4}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5600
     * @tc.name      testFieldInitFive0056
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F555 = {field: 4}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5700
     * @tc.name      testFieldInitFive0057
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F556 = {field: 4}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5800
     * @tc.name      testFieldInitFive0058
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F557 = {field: 4}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_5900
     * @tc.name      testFieldInitFive0059
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F558 = {field: 4.5f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6000
     * @tc.name      testFieldInitFive0060
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F559 = {field: c'a'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6100
     * @tc.name      testFieldInitFive0061
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F560 = {field: false}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6200
     * @tc.name      testFieldInitFive0062
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F561 = {field: undefined}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6300
     * @tc.name      testFieldInitFive0063
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F562 = {field: 4}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6400
     * @tc.name      testFieldInitFive0064
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F564 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6500
     * @tc.name      testFieldInitFive0065
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F565 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6600
     * @tc.name      testFieldInitFive0066
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F566 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6700
     * @tc.name      testFieldInitFive0067
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F567 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6800
     * @tc.name      testFieldInitFive0068
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F568 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_6900
     * @tc.name      testFieldInitFive0069
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F569 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7000
     * @tc.name      testFieldInitFive0070
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F570 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7100
     * @tc.name      testFieldInitFive0071
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F571 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7200
     * @tc.name      testFieldInitFive0072
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F572 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7300
     * @tc.name      testFieldInitFive0073
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F573 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7400
     * @tc.name      testFieldInitFive0074
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F574 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7500
     * @tc.name      testFieldInitFive0075
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F575 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7600
     * @tc.name      testFieldInitFive0076
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F576 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = undefined
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7700
     * @tc.name      testFieldInitFive0077
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F577 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7800
     * @tc.name      testFieldInitFive0078
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F579 = {field: {data: 5}}
      expect(a.field instanceof C_F579).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(5)
      a.field = {data: 4}
      expect(a.field instanceof C_F579).assertTrue()
      expect(a.field.data instanceof int).assertTrue()
      expect(a.field.data).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_7900
     * @tc.name      testFieldInitFive0079
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F580 = {field: 5}
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8000
     * @tc.name      testFieldInitFive0080
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F581 = {field: 5}
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8100
     * @tc.name      testFieldInitFive0081
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F582 = {field: 5}
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8200
     * @tc.name      testFieldInitFive0082
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F583 = {field: 5}
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8300
     * @tc.name      testFieldInitFive0083
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F584 = {field: 7.3}
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
      a.field = 4
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8400
     * @tc.name      testFieldInitFive0084
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F585 = {field: 5}
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8500
     * @tc.name      testFieldInitFive0085
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F586 = {field: 7.3f}
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
      a.field = 4.5f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8600
     * @tc.name      testFieldInitFive0086
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F587 = {field: 5n}
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
      a.field = 4n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8700
     * @tc.name      testFieldInitFive0087
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F588 = {field: "efg"}
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
      a.field = "abc"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8800
     * @tc.name      testFieldInitFive0088
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F589 = {field: c'b'}
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
      a.field = c'a'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_8900
     * @tc.name      testFieldInitFive0089
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F590 = {field: true}
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
      a.field = false
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_9000
     * @tc.name      testFieldInitFive0090
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F591 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_9100
     * @tc.name      testFieldInitFive0091
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F592 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = undefined
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_FIVE_9200
     * @tc.name      testFieldInitFive0092
     * @tc.desc      Checking for initialization from object literal.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitFive0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F593 = {field: 5}
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
      a.field = 4
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
    })
  })
}
