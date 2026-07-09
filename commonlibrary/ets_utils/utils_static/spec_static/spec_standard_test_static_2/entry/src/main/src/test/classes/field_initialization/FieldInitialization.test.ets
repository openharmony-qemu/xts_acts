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


class A_F001 {
    field: long = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F002 {
    field: int = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F003 {
    field: byte = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F004 {
    field: short = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F005 {
    field: double = 4
    foo(): void {
      this.field = 7.3
    }
  }

class A_F006 {
    field: number = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F007 {
    field: float = 4.5f
    foo(): void {
      this.field = 7.3f
    }
  }

class A_F008 {
    field: bigint = 4n
    foo(): void {
      this.field = 5n
    }
  }

class A_F009 {
    field: string = "abc"
    foo(): void {
      this.field = "efg"
    }
  }

class A_F010 {
    field: char = c'a'
    foo(): void {
      this.field = c'b'
    }
  }

class A_F011 {
    field: boolean = false
    foo(): void {
      this.field = true
    }
  }

class A_F012 {
    field: Object = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F013 {
    field: Object | undefined = undefined
    foo(): void {
      this.field = 5
    }
  }

class A_F014 {
    field: Object | undefined | null = 4
    foo(): void {
      this.field = 5
    }
  }

class A_F016 {
    field: long = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F017 {
    field: int = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F018 {
    field: byte = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F019 {
    field: short = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F020 {
    field: double = 4
    foo: () => void = (): void => {
      this.field = 7.3
    }
  }

class A_F021 {
    field: number = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F022 {
    field: float = 4.5f
    foo: () => void = (): void => {
      this.field = 7.3f
    }
  }

class A_F023 {
    field: bigint = 4n
    foo: () => void = (): void => {
      this.field = 5n
    }
  }

class A_F024 {
    field: string = "abc"
    foo: () => void = (): void => {
      this.field = "efg"
    }
  }

class A_F025 {
    field: char = c'a'
    foo: () => void = (): void => {
      this.field = c'b'
    }
  }

class A_F026 {
    field: boolean = false
    foo: () => void = (): void => {
      this.field = true
    }
  }

class A_F027 {
    field: Object = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F028 {
    field: Object | undefined = undefined
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F029 {
    field: Object | undefined | null = 4
    foo: () => void = (): void => {
      this.field = 5
    }
  }

class A_F031 {
    field: long = 4
  }

class A_F032 {
    field: int = 4
  }

class A_F033 {
    field: byte = 4
  }

class A_F034 {
    field: short = 4
  }

class A_F035 {
    field: double = 4
  }

class A_F036 {
    field: number = 4
  }

class A_F037 {
    field: float = 4.5f
  }

class A_F038 {
    field: bigint = 4n
  }

class A_F039 {
    field: string = "abc"
  }

class A_F040 {
    field: char = c'a'
  }

class A_F041 {
    field: boolean = false
  }

class A_F042 {
    field: Object = 4
  }

class A_F043 {
    field: Object | undefined = undefined
  }

class A_F044 {
    field: Object | undefined | null = 4
  }

class A_F046 {
    field: long = 4
  }

class A_F047 {
    field: int = 4
  }

class A_F048 {
    field: byte = 4
  }

class A_F049 {
    field: short = 4
  }

class A_F050 {
    field: double = 4
  }

class A_F051 {
    field: number = 4
  }

class A_F052 {
    field: float = 4.5f
  }

class A_F053 {
    field: bigint = 4n
  }

class A_F054 {
    field: string = "abc"
  }

class A_F055 {
    field: char = c'a'
  }

class A_F056 {
    field: boolean = false
  }

class A_F057 {
    field: Object = 4
  }

class A_F058 {
    field: Object | undefined = undefined
  }

class A_F059 {
    field: Object | undefined | null = 4
  }

class A_F061 {
    field: long = 4
  }
  function foo_F061(a: A_F061): void {
    a.field = 5
  }

class A_F062 {
    field: int = 4
  }
  function foo_F062(a: A_F062): void {
    a.field = 5
  }

class A_F063 {
    field: byte = 4
  }
  function foo_F063(a: A_F063): void {
    a.field = 5
  }

class A_F064 {
    field: short = 4
  }
  function foo_F064(a: A_F064): void {
    a.field = 5
  }

class A_F065 {
    field: double = 4
  }
  function foo_F065(a: A_F065): void {
    a.field = 7.3
  }

class A_F066 {
    field: number = 4
  }
  function foo_F066(a: A_F066): void {
    a.field = 5
  }

class A_F067 {
    field: float = 4.5f
  }
  function foo_F067(a: A_F067): void {
    a.field = 7.3f
  }

class A_F068 {
    field: bigint = 4n
  }
  function foo_F068(a: A_F068): void {
    a.field = 5n
  }

class A_F069 {
    field: string = "abc"
  }
  function foo_F069(a: A_F069): void {
    a.field = "efg"
  }

class A_F070 {
    field: char = c'a'
  }
  function foo_F070(a: A_F070): void {
    a.field = c'b'
  }

class A_F071 {
    field: boolean = false
  }
  function foo_F071(a: A_F071): void {
    a.field = true
  }

class A_F072 {
    field: Object = 4
  }
  function foo_F072(a: A_F072): void {
    a.field = 5
  }

class A_F073 {
    field: Object | undefined = undefined
  }
  function foo_F073(a: A_F073): void {
    a.field = 5
  }

class A_F074 {
    field: Object | undefined | null = 4
  }
  function foo_F074(a: A_F074): void {
    a.field = 5
  }

class A_F076 {
    field: long = 4
  }
  function foo_F076(fb: () => void): void {
    fb()
  }

class A_F077 {
    field: int = 4
  }
  function foo_F077(fb: () => void): void {
    fb()
  }

class A_F078 {
    field: byte = 4
  }
  function foo_F078(fb: () => void): void {
    fb()
  }

class A_F079 {
    field: short = 4
  }
  function foo_F079(fb: () => void): void {
    fb()
  }

class A_F080 {
    field: double = 4
  }
  function foo_F080(fb: () => void): void {
    fb()
  }

class A_F081 {
    field: number = 4
  }
  function foo_F081(fb: () => void): void {
    fb()
  }

class A_F082 {
    field: float = 4.5f
  }
  function foo_F082(fb: () => void): void {
    fb()
  }

class A_F083 {
    field: bigint = 4n
  }
  function foo_F083(fb: () => void): void {
    fb()
  }

class A_F084 {
    field: string = "abc"
  }
  function foo_F084(fb: () => void): void {
    fb()
  }

class A_F085 {
    field: char = c'a'
  }
  function foo_F085(fb: () => void): void {
    fb()
  }

class A_F086 {
    field: boolean = false
  }
  function foo_F086(fb: () => void): void {
    fb()
  }

class A_F087 {
    field: Object = 4
  }
  function foo_F087(fb: () => void): void {
    fb()
  }

class A_F088 {
    field: Object | undefined = undefined
  }
  function foo_F088(fb: () => void): void {
    fb()
  }

class A_F089 {
    field: Object | undefined | null = 4
  }
  function foo_F089(fb: () => void): void {
    fb()
  }
  function foo_F090(fb: () => void): void {
    fb()
  }

class Animal_F091 {
    name: string = ""
  }
  class Dog_F091 extends Animal_F091 {
    constructor () {
      super()
      this.name = "dog"
    }
  }
  class Cat_F091 extends Animal_F091 {
    constructor () {
      super()
      this.name = "cat"
    }
  }
  class C_F091 {
    field: Animal_F091 = new Animal_F091()
  }

class A_F092 {
    v: int
    constructor(v: int = 0) {
      this.v = v
    }
  }
  class B_F092 extends A_F092 {
    constructor(v: int = 0) {
      super(-v)
    }
    field(): int {
      return 13
    }
  }
  type HandlerBInt_F092 = (a: B_F092, b: int) => A_F092
  type HandlerAInt_F092 = (a: A_F092, b: int) => B_F092
  const handlerAInt: HandlerAInt_F092 = (a: A_F092, b: int): B_F092 => {
    if (a instanceof B_F092){
      return new B_F092(a.field() + b)
    } else {
      return new B_F092(b)
    }
  }
  type HandlerA_F092 = (a: A_F092) => A_F092
  const handlerA: HandlerA_F092 = (a: A_F092): A_F092 => {
    if (a instanceof B_F092){
      return new A_F092(a.field())
    } else {
      return new A_F092
    }
  }
  type HandlerNothing_F092 = () => B_F092
  const handlerNothing: HandlerNothing_F092 = (): B_F092 => {
    return new B_F092(567)
  }
  class C_F092 {
    field: HandlerBInt_F092 = handlerNothing
  }

class Animal_F093 {
  }
  class Dog_F093 extends Animal_F093 {
    field: number = 5
  }
  function foo_F092(a: Animal_F093) {
    if (a instanceof Dog_F093) {
      a.field = 3
    }
  }

class Animal_F094 {
  }
  class Dog_F094 extends Animal_F094 {
    field: number = 5
  }
  function foo_F092_2(a: Animal_F094) {
    (a as Dog_F094).field = 3
  }

class Base_F095 {
    field: long = 4
  }
  class A_F095 extends Base_F095 {
  }

class Base_F096 {
    field: int = 4
  }
  class A_F096 extends Base_F096 {
  }

class Base_F097 {
    field: byte = 4
  }
  class A_F097 extends Base_F097 {
  }

class Base_F098 {
    field: short = 4
  }
  class A_F098 extends Base_F098 {
  }

class Base_F099 {
    field: double = 4
  }
  class A_F099 extends Base_F099 {
  }

export default function FieldInitializationTest(): void {
  describe("FieldInitializationTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0100
     * @tc.name      testFieldInit0001
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F001 = new A_F001()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0200
     * @tc.name      testFieldInit0002
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F002 = new A_F002()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0300
     * @tc.name      testFieldInit0003
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F003 = new A_F003()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0400
     * @tc.name      testFieldInit0004
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F004 = new A_F004()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0500
     * @tc.name      testFieldInit0005
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F005 = new A_F005()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0600
     * @tc.name      testFieldInit0006
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F006 = new A_F006()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0700
     * @tc.name      testFieldInit0007
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F007 = new A_F007()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.foo()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0800
     * @tc.name      testFieldInit0008
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F008 = new A_F008()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.foo()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0900
     * @tc.name      testFieldInit0009
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F009 = new A_F009()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.foo()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1000
     * @tc.name      testFieldInit0010
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F010 = new A_F010()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.foo()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1100
     * @tc.name      testFieldInit0011
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F011 = new A_F011()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.foo()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1200
     * @tc.name      testFieldInit0012
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F012 = new A_F012()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1300
     * @tc.name      testFieldInit0013
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F013 = new A_F013()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1400
     * @tc.name      testFieldInit0014
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F014 = new A_F014()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1500
     * @tc.name      testFieldInit0015
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F016 = new A_F016()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1600
     * @tc.name      testFieldInit0016
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F017 = new A_F017()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1700
     * @tc.name      testFieldInit0017
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F018 = new A_F018()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1800
     * @tc.name      testFieldInit0018
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F019 = new A_F019()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_1900
     * @tc.name      testFieldInit0019
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F020 = new A_F020()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2000
     * @tc.name      testFieldInit0020
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F021 = new A_F021()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2100
     * @tc.name      testFieldInit0021
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F022 = new A_F022()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.foo()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2200
     * @tc.name      testFieldInit0022
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F023 = new A_F023()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.foo()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2300
     * @tc.name      testFieldInit0023
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F024 = new A_F024()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.foo()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2400
     * @tc.name      testFieldInit0024
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F025 = new A_F025()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.foo()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2500
     * @tc.name      testFieldInit0025
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F026 = new A_F026()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.foo()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2600
     * @tc.name      testFieldInit0026
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F027 = new A_F027()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2700
     * @tc.name      testFieldInit0027
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F028 = new A_F028()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2800
     * @tc.name      testFieldInit0028
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F029 = new A_F029()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_2900
     * @tc.name      testFieldInit0029
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F031 = new A_F031()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3000
     * @tc.name      testFieldInit0030
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F032 = new A_F032()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3100
     * @tc.name      testFieldInit0031
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F033 = new A_F033()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3200
     * @tc.name      testFieldInit0032
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F034 = new A_F034()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3300
     * @tc.name      testFieldInit0033
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F035 = new A_F035()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3400
     * @tc.name      testFieldInit0034
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F036 = new A_F036()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3500
     * @tc.name      testFieldInit0035
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F037 = new A_F037()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3600
     * @tc.name      testFieldInit0036
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F038 = new A_F038()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3700
     * @tc.name      testFieldInit0037
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F039 = new A_F039()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
      a.field = "efg"
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3800
     * @tc.name      testFieldInit0038
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F040 = new A_F040()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
      a.field = c'b'
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_3900
     * @tc.name      testFieldInit0039
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F041 = new A_F041()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
      a.field = true
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_4000
     * @tc.name      testFieldInit0040
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F042 = new A_F042()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_4100
     * @tc.name      testFieldInit0041
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F043 = new A_F043()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_4200
     * @tc.name      testFieldInit0042
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F044 = new A_F044()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_4300
     * @tc.name      testFieldInit0043
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F046 = new A_F046()
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
     * @tc.number    SUB_FIELD_INIT_TEST_4400
     * @tc.name      testFieldInit0044
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F047 = new A_F047()
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
     * @tc.number    SUB_FIELD_INIT_TEST_4500
     * @tc.name      testFieldInit0045
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F048 = new A_F048()
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
     * @tc.number    SUB_FIELD_INIT_TEST_4600
     * @tc.name      testFieldInit0046
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F049 = new A_F049()
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
     * @tc.number    SUB_FIELD_INIT_TEST_4700
     * @tc.name      testFieldInit0047
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F050 = new A_F050()
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
     * @tc.number    SUB_FIELD_INIT_TEST_4800
     * @tc.name      testFieldInit0048
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F051 = new A_F051()
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
     * @tc.number    SUB_FIELD_INIT_TEST_4900
     * @tc.name      testFieldInit0049
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F052 = new A_F052()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5000
     * @tc.name      testFieldInit0050
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F053 = new A_F053()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5100
     * @tc.name      testFieldInit0051
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F054 = new A_F054()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5200
     * @tc.name      testFieldInit0052
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F055 = new A_F055()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5300
     * @tc.name      testFieldInit0053
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F056 = new A_F056()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5400
     * @tc.name      testFieldInit0054
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F057 = new A_F057()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5500
     * @tc.name      testFieldInit0055
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F058 = new A_F058()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5600
     * @tc.name      testFieldInit0056
     * @tc.desc      Checking for changing the value from outside of class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F059 = new A_F059()
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
     * @tc.number    SUB_FIELD_INIT_TEST_5700
     * @tc.name      testFieldInit0057
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F061 = new A_F061()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F061(a)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_5800
     * @tc.name      testFieldInit0058
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F062 = new A_F062()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F062(a)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_5900
     * @tc.name      testFieldInit0059
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F063 = new A_F063()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F063(a)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6000
     * @tc.name      testFieldInit0060
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F064 = new A_F064()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F064(a)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6100
     * @tc.name      testFieldInit0061
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F065 = new A_F065()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F065(a)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6200
     * @tc.name      testFieldInit0062
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F066 = new A_F066()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F066(a)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6300
     * @tc.name      testFieldInit0063
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F067 = new A_F067()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          foo_F067(a)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6400
     * @tc.name      testFieldInit0064
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F068 = new A_F068()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          foo_F068(a)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6500
     * @tc.name      testFieldInit0065
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F069 = new A_F069()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          foo_F069(a)
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6600
     * @tc.name      testFieldInit0066
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F070 = new A_F070()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          foo_F070(a)
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6700
     * @tc.name      testFieldInit0067
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F071 = new A_F071()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          foo_F071(a)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6800
     * @tc.name      testFieldInit0068
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F072 = new A_F072()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F072(a)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_6900
     * @tc.name      testFieldInit0069
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F073 = new A_F073()
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
          foo_F073(a)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7000
     * @tc.name      testFieldInit0070
     * @tc.desc      Checking for changing the value from function call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F074 = new A_F074()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F074(a)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7100
     * @tc.name      testFieldInit0071
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F076 = new A_F076()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F076(lambda)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7200
     * @tc.name      testFieldInit0072
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F077 = new A_F077()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F077(lambda)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7300
     * @tc.name      testFieldInit0073
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F078 = new A_F078()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F078(lambda)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7400
     * @tc.name      testFieldInit0074
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F079 = new A_F079()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F079(lambda)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7500
     * @tc.name      testFieldInit0075
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F080 = new A_F080()
          const lambda = () => {
        a.field = 7.3
          }
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F080(lambda)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7600
     * @tc.name      testFieldInit0076
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F081 = new A_F081()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F081(lambda)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7700
     * @tc.name      testFieldInit0077
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F082 = new A_F082()
          const lambda = () => {
        a.field = 7.3f
          }
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          foo_F082(lambda)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7800
     * @tc.name      testFieldInit0078
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F083 = new A_F083()
          const lambda = () => {
        a.field = 5n
          }
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          foo_F083(lambda)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_7900
     * @tc.name      testFieldInit0079
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F084 = new A_F084()
          const lambda = () => {
        a.field = "efg"
          }
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          foo_F084(lambda)
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8000
     * @tc.name      testFieldInit0080
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F085 = new A_F085()
          const lambda = () => {
        a.field = c'b'
          }
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          foo_F085(lambda)
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8100
     * @tc.name      testFieldInit0081
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F086 = new A_F086()
          const lambda = () => {
        a.field = true
          }
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          foo_F086(lambda)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8200
     * @tc.name      testFieldInit0082
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F087 = new A_F087()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F087(lambda)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8300
     * @tc.name      testFieldInit0083
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F088 = new A_F088()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertFalse()
      expect(a.field).assertEqual(undefined)
          foo_F088(lambda)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8400
     * @tc.name      testFieldInit0084
     * @tc.desc      Checking for changing the value from function call with object captured by lambda.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F089 = new A_F089()
          const lambda = () => {
        a.field = 5
          }
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          foo_F089(lambda)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8500
     * @tc.name      testFieldInit0085
     * @tc.desc      Checking for changing the value from outside of class with different covariant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F091 = new C_F091()
          let d: C_F091 = new C_F091()
          let c: C_F091 = new C_F091()
          d.field = new Dog_F091()
          c.field = new Cat_F091()
      expect(a.field instanceof Animal_F091).assertTrue()
      expect(a.field.name).assertEqual("")
      expect(d.field instanceof Dog_F091).assertTrue()
      expect(d.field.name).assertEqual("dog")
      expect(c.field instanceof Cat_F091).assertTrue()
      expect(c.field.name).assertEqual("cat")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8600
     * @tc.name      testFieldInit0086
     * @tc.desc      Checking for changing the value from outside of class with different covariant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: C_F092 = new C_F092()
          let b: C_F092 = new C_F092()
          let c: C_F092 = new C_F092()
          b.field = handlerA
          c.field = handlerAInt
      expect(a.field instanceof HandlerNothing_F092).assertTrue()
      expect(a.field(new B_F092, 7).v).assertEqual(-567)
      expect(b.field instanceof HandlerA_F092).assertTrue()
      expect(b.field(new B_F092, 7).v).assertEqual(13)
      expect(c.field instanceof HandlerAInt_F092).assertTrue()
      expect(c.field(new B_F092, 7).v).assertEqual(-20)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8700
     * @tc.name      testFieldInit0087
     * @tc.desc      Checking for changing the value from outside of class with smart type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Animal_F093 = new Dog_F093()
      expect(a instanceof Dog_F093).assertTrue()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
          foo_F092(a)
      expect(a instanceof Dog_F093).assertTrue()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8800
     * @tc.name      testFieldInit0088
     * @tc.desc      Checking for changing the value from outside of class with smart type usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Animal_F094 = new Dog_F094()
      expect(a instanceof Dog_F094).assertTrue()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
          foo_F092_2(a)
      expect(a instanceof Dog_F094).assertTrue()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_8900
     * @tc.name      testFieldInit0089
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F095 = new A_F095()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_9000
     * @tc.name      testFieldInit0090
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F096 = new A_F096()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_9100
     * @tc.name      testFieldInit0091
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F097 = new A_F097()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_9200
     * @tc.name      testFieldInit0092
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F098 = new A_F098()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_9300
     * @tc.name      testFieldInit0093
     * @tc.desc      Checking for changing the value from outside of class with subtype usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F099 = new A_F099()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })
  })
}
