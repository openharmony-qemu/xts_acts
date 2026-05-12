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

class A_F015 {
    field: Any = 4
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

class A_F030 {
    field: Any = 4
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

class A_F045 {
    field: Any = 4
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

class A_F060 {
    field: Any = 4
  }

class A_F061 {
    field: long = 4
  }
  function foo(a: A_F061): void {
    a.field = 5
  }

class A_F062 {
    field: int = 4
  }
  function foo(a: A_F062): void {
    a.field = 5
  }

class A_F063 {
    field: byte = 4
  }
  function foo(a: A_F063): void {
    a.field = 5
  }

class A_F064 {
    field: short = 4
  }
  function foo(a: A_F064): void {
    a.field = 5
  }

class A_F065 {
    field: double = 4
  }
  function foo(a: A_F065): void {
    a.field = 7.3
  }

class A_F066 {
    field: number = 4
  }
  function foo(a: A_F066): void {
    a.field = 5
  }

class A_F067 {
    field: float = 4.5f
  }
  function foo(a: A_F067): void {
    a.field = 7.3f
  }

class A_F068 {
    field: bigint = 4n
  }
  function foo(a: A_F068): void {
    a.field = 5n
  }

class A_F069 {
    field: string = "abc"
  }
  function foo(a: A_F069): void {
    a.field = "efg"
  }

class A_F070 {
    field: char = c'a'
  }
  function foo(a: A_F070): void {
    a.field = c'b'
  }

class A_F071 {
    field: boolean = false
  }
  function foo(a: A_F071): void {
    a.field = true
  }

class A_F072 {
    field: Object = 4
  }
  function foo(a: A_F072): void {
    a.field = 5
  }

class A_F073 {
    field: Object | undefined = undefined
  }
  function foo(a: A_F073): void {
    a.field = 5
  }

class A_F074 {
    field: Object | undefined | null = 4
  }
  function foo(a: A_F074): void {
    a.field = 5
  }

class A_F075 {
    field: Any = 4
  }
  function foo(a: A_F075): void {
    a.field = 5
  }

class A_F076 {
    field: long = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F077 {
    field: int = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F078 {
    field: byte = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F079 {
    field: short = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F080 {
    field: double = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F081 {
    field: number = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F082 {
    field: float = 4.5f
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F083 {
    field: bigint = 4n
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F084 {
    field: string = "abc"
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F085 {
    field: char = c'a'
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F086 {
    field: boolean = false
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F087 {
    field: Object = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F088 {
    field: Object | undefined = undefined
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F089 {
    field: Object | undefined | null = 4
  }
  function foo(fb: () => void): void {
    fb()
  }

class A_F090 {
    field: Any = 4
  }
  function foo(fb: () => void): void {
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
  function foo(a: Animal_F093) {
    if (a instanceof Dog_F093) {
      a.field = 3
    }
  }

class Animal_F094 {
  }
  class Dog_F094 extends Animal_F094 {
    field: number = 5
  }
  function foo(a: Animal_F094) {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0001
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
     * @tc.number    SUB_FIELD_INIT_TEST_0002
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
     * @tc.number    SUB_FIELD_INIT_TEST_0003
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
     * @tc.number    SUB_FIELD_INIT_TEST_0004
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
     * @tc.number    SUB_FIELD_INIT_TEST_0005
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
     * @tc.number    SUB_FIELD_INIT_TEST_0006
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
     * @tc.number    SUB_FIELD_INIT_TEST_0007
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
     * @tc.number    SUB_FIELD_INIT_TEST_0008
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
     * @tc.number    SUB_FIELD_INIT_TEST_0009
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
     * @tc.number    SUB_FIELD_INIT_TEST_0010
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
     * @tc.number    SUB_FIELD_INIT_TEST_0011
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
     * @tc.number    SUB_FIELD_INIT_TEST_0012
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
     * @tc.number    SUB_FIELD_INIT_TEST_0013
     * @tc.name      testFieldInit0013
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F013 = new A_F013()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
      a.foo()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0014
     * @tc.name      testFieldInit0014
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F014 = new A_F014()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0015
     * @tc.name      testFieldInit0015
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F015 = new A_F015()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0016
     * @tc.name      testFieldInit0016
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F016 = new A_F016()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0017
     * @tc.name      testFieldInit0017
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F017 = new A_F017()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0018
     * @tc.name      testFieldInit0018
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F018 = new A_F018()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0019
     * @tc.name      testFieldInit0019
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F019 = new A_F019()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0020
     * @tc.name      testFieldInit0020
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F020 = new A_F020()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0021
     * @tc.name      testFieldInit0021
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F021 = new A_F021()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.foo()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0022
     * @tc.name      testFieldInit0022
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F022 = new A_F022()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.foo()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })
