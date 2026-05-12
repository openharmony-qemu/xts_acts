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

class A_F892 {
    static field: number = 4
    foo: (a: number) => void = (a: number): void => {
      A_F892.field = a
    }
  }

class A_F893 {
    static field: float = 4.5f
    foo: (a: float) => void = (a: float): void => {
      A_F893.field = a
    }
  }

class A_F894 {
    static field: bigint = 4n
    foo: (a: bigint) => void = (a: bigint): void => {
      A_F894.field = a
    }
  }

class A_F895 {
    static field: string = "abc"
    foo: (a: string) => void = (a: string): void => {
      A_F895.field = a
    }
  }

class A_F896 {
    static field: char = c'a'
    foo: (a: char) => void = (a: char): void => {
      A_F896.field = a
    }
  }

class A_F897 {
    static field: boolean = false
    foo: (a: boolean) => void = (a: boolean): void => {
      A_F897.field = a
    }
  }

class A_F898 {
    static field: Object = 4
    foo: (a: Object) => void = (a: Object): void => {
      A_F898.field = a
    }
  }

class A_F899 {
    static field: Object | undefined = undefined
    foo: (a: Object | undefined) => void = (a: Object | undefined): void => {
      A_F899.field = a
    }
  }

class A_F900 {
    static field: Object | undefined | null = 4
    foo: (a: Object | undefined | null) => void = (a: Object | undefined | null): void => {
      A_F900.field = a
    }
  }

class A_F901 {
    static field: Any = 4
    foo: (a: Any) => void = (a: Any): void => {
      A_F901.field = a
    }
  }

class A_F902 {
    static field: long = 4
    constructor () {
      A_F902.field = 5
    }
  }

class A_F903 {
    static field: int = 4
    constructor () {
      A_F903.field = 5
    }
  }

class A_F904 {
    static field: byte = 4
    constructor () {
      A_F904.field = 5
    }
  }

class A_F905 {
    static field: short = 4
    constructor () {
      A_F905.field = 5
    }
  }

class A_F906 {
    static field: double = 4
    constructor () {
      A_F906.field = 7.3
    }
  }

class A_F907 {
    static field: number = 4
    constructor () {
      A_F907.field = 5
    }
  }

class A_F908 {
    static field: float = 4.5f
    constructor () {
      A_F908.field = 7.3f
    }
  }

class A_F909 {
    static field: bigint = 4n
    constructor () {
      A_F909.field = 5n
    }
  }

class A_F910 {
    static field: string = "abc"
    constructor () {
      A_F910.field = "efg"
    }
  }

class A_F911 {
    static field: char = c'a'
    constructor () {
      A_F911.field = c'b'
    }
  }

class A_F912 {
    static field: boolean = false
    constructor () {
      A_F912.field = true
    }
  }

class A_F913 {
    static field: Object = 4
    constructor () {
      A_F913.field = 5
    }
  }

class A_F914 {
    static field: Object | undefined = undefined
    constructor () {
      A_F914.field = 5
    }
  }

class A_F915 {
    static field: Object | undefined | null = 4
    constructor () {
      A_F915.field = 5
    }
  }

class A_F916 {
    static field: Any = 4
    constructor () {
      A_F916.field = 5
    }
  }

function foo(): long {
    let res = A_F917.v
    A_F917.v += 1
    return res
  }
  class A_F917 {
    static v: long = 5
    field: long = foo()
  }

function foo(): int {
    let res = A_F918.v
    A_F918.v += 1
    return res
  }
  class A_F918 {
    static v: int = 5
    field: int = foo()
  }

function foo(): byte {
    let res = A_F919.v
    A_F919.v += 1
    return res
  }
  class A_F919 {
    static v: byte = 5
    field: byte = foo()
  }

function foo(): short {
    let res = A_F920.v
    A_F920.v += 1
    return res
  }
  class A_F920 {
    static v: short = 5
    field: short = foo()
  }

function foo(): double {
    let res = A_F921.v
    A_F921.v += 1
    return res
  }
  class A_F921 {
    static v: double = 5
    field: double = foo()
  }

function foo(): number {
    let res = A_F922.v
    A_F922.v += 1
    return res
  }
  class A_F922 {
    static v: number = 5
    field: number = foo()
  }

function foo(): float {
    let res = A_F923.v
    A_F923.v += 1.0f
    return res
  }
  class A_F923 {
    static v: float = 5.0f
    field: float = foo()
  }

function foo(): bigint {
    let res = A_F924.v
    A_F924.v += 1n
    return res
  }
  class A_F924 {
    static v: bigint = 5n
    field: bigint = foo()
  }

function foo(): string {
    let res = A_F925.v
    A_F925.v += "n"
    return res
  }
  class A_F925 {
    static v: string = "v"
    field: string = foo()
  }

function foo(): int {
    let res = A_F926.v
    A_F926.v += 1
    return res
  }
  class A_F926 {
    static v: int = 5
    field: Object = foo()
  }

function foo(): int {
    let res = A_F927.v
    A_F927.v += 1
    return res
  }
  class A_F927 {
    static v: int = 5
    field: Object | null = foo()
  }

function foo(): int {
    let res = A_F928.v
    A_F928.v += 1
    return res
  }
  class A_F928 {
    static v: int = 5
    field: Object | undefined = foo()
  }

function foo(): int {
    let res = A_F929.v
    A_F929.v += 1
    return res
  }
  class A_F929 {
    static v: int = 5
    field: Object | undefined | null = foo()
  }

function foo(): int {
    let res = A_F930.v
    A_F930.v += 1
    return res
  }
  class A_F930 {
    static v: int = 5
    field: Any = foo()
  }

class A_F931 {
    static v: long = 5
    field: long
    constructor () {
      this.field = A_F931.v
      A_F931.v += 1
    }
  }

class A_F932 {
    static v: int = 5
    field: int
    constructor () {
      this.field = A_F932.v
      A_F932.v += 1
    }
  }

class A_F933 {
    static v: byte = 5
    field: byte
    constructor () {
      this.field = A_F933.v
      A_F933.v += 1
    }
  }

class A_F934 {
    static v: short = 5
    field: short
    constructor () {
      this.field = A_F934.v
      A_F934.v += 1
    }
  }

class A_F935 {
    static v: double = 5
    field: double
    constructor () {
      this.field = A_F935.v
      A_F935.v += 1
    }
  }

class A_F936 {
    static v: number = 5
    field: number
    constructor () {
      this.field = A_F936.v
      A_F936.v += 1
    }
  }

class A_F937 {
    static v: float = 5.0f
    field: float
    constructor () {
      this.field = A_F937.v
      A_F937.v += 1.0f
    }
  }

class A_F938 {
    static v: bigint = 5n
    field: bigint
    constructor () {
      this.field = A_F938.v
      A_F938.v += 1n
    }
  }

class A_F939 {
    static v: string = "v"
    field: string
    constructor () {
      this.field = A_F939.v
      A_F939.v += "n"
    }
  }

class A_F940 {
    static v: int = 5
    field: Object
    constructor () {
      this.field = A_F940.v
      A_F940.v += 1
    }
  }

class A_F941 {
    static v: int = 5
    field: Object | null
    constructor () {
      this.field = A_F941.v
      A_F941.v += 1
    }
  }

class A_F942 {
    static v: int = 5
    field: Object | undefined
    constructor () {
      this.field = A_F942.v
      A_F942.v += 1
    }
  }

class A_F943 {
    static v: int = 5
    field: Object | undefined | null
    constructor () {
      this.field = A_F943.v
      A_F943.v += 1
    }
  }

class A_F944 {
    static v: int = 5
    field: Any
    constructor () {
      this.field = A_F944.v
      A_F944.v += 1
    }
  }

class A_F945 {
    static v: long = 5
    field: long = 5
    constructor () {
      this.field = A_F945.v
      A_F945.v += 1
    }
  }

class A_F946 {
    static v: int = 5
    field: int = 5
    constructor () {
      this.field = A_F946.v
      A_F946.v += 1
    }
  }

class A_F947 {
    static v: byte = 5
    field: byte = 5
    constructor () {
      this.field = A_F947.v
      A_F947.v += 1
    }
  }

class A_F948 {
    static v: short = 5
    field: short = 5
    constructor () {
      this.field = A_F948.v
      A_F948.v += 1
    }
  }

class A_F949 {
    static v: double = 5
    field: double = 5
    constructor () {
      this.field = A_F949.v
      A_F949.v += 1
    }
  }

class A_F950 {
    static v: number = 5
    field: number = 5
    constructor () {
      this.field = A_F950.v
      A_F950.v += 1
    }
  }

class A_F951 {
    static v: float = 5.0f
    field: float = 5.0f
    constructor () {
      this.field = A_F951.v
      A_F951.v += 1.0f
    }
  }

class A_F952 {
    static v: bigint = 5n
    field: bigint = 5n
    constructor () {
      this.field = A_F952.v
      A_F952.v += 1n
    }
  }

class A_F953 {
    static v: string = "v"
    field: string = "v"
    constructor () {
      this.field = A_F953.v
      A_F953.v += "n"
    }
  }

class A_F954 {
    static v: int = 5
    field: Object = 5
    constructor () {
      this.field = A_F954.v
      A_F954.v += 1
    }
  }

class A_F955 {
    static v: int = 5
    field: Object | null = 5
    constructor () {
      this.field = A_F955.v
      A_F955.v += 1
    }
  }

class A_F956 {
    static v: int = 5
    field: Object | undefined = 5
    constructor () {
      this.field = A_F956.v
      A_F956.v += 1
    }
  }

class A_F957 {
    static v: int = 5
    field: Object | undefined | null = 5
    constructor () {
      this.field = A_F957.v
      A_F957.v += 1
    }
  }

class A_F958 {
    static v: int = 5
    field: Any = 5
    constructor () {
      this.field = A_F958.v
      A_F958.v += 1
    }
  }

class A_F959 {
    static field: long
  }

class A_F960 {
    static field: int
  }

class A_F961 {
    static field: byte
  }

class A_F962 {
    static field: short
  }

class A_F963 {
    static field: double
  }

class A_F964 {
    static field: number
  }

class A_F965 {
    static field: float
  }

class A_F966 {
    static field: char
  }

class A_F967 {
    static field: boolean
  }

class A_F968 {
    static field: Object | undefined
  }

class A_F969 {
    static field: Object | undefined | null
  }

class A_F970 {
    static field: Any
  }

class A_F971 {
    static field: long = 4
  }

class A_F972 {
    static field: int = 4
  }

class A_F973 {
    static field: byte = 4
  }

class A_F974 {
    static field: short = 4
  }

class A_F975 {
    static field: double = 4
  }

class A_F976 {
    static field: number = 4
  }

class A_F977 {
    static field: float = 4.5f
  }

class A_F978 {
    static field: bigint = 4n
  }

class A_F979 {
    static field: string = "abc"
  }

class A_F980 {
    static field: char = c'a'
  }

class A_F981 {
    static field: boolean = false
  }

class A_F982 {
    static field: Object = 4
  }

class A_F983 {
    static field: Object | undefined = undefined
  }

class A_F984 {
    static field: Object | undefined | null = 4
  }

class A_F985 {
    static field: Any = 4
  }

class A_F986 {
    static v: long = 4
    static field: long = A_F986.v
  }

class A_F987 {
    static v: int = 4
    static field: int = A_F987.v
  }

class A_F988 {
    static v: byte = 4
    static field: byte = A_F988.v
  }

class A_F989 {
    static v: short = 4
    static field: short = A_F989.v
  }

class A_F990 {
    static v: double = 4
    static field: double = A_F990.v
  }

export default function FieldInitializationTestNine(): void {
  describe("FieldInitializationTestNine", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0892
     * @tc.name      testFieldInit0892
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0892", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F892.field instanceof number).assertTrue()
      expect(A_F892.field).assertEqual(4)
          let a: A_F892 = new A_F892()
      a.foo(5)
      expect(A_F892.field instanceof number).assertTrue()
      expect(A_F892.field).assertEqual(5)
      a.foo(4)
      expect(A_F892.field instanceof number).assertTrue()
      expect(A_F892.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0893
     * @tc.name      testFieldInit0893
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0893", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F893.field instanceof float).assertTrue()
      expect(A_F893.field).assertEqual(4.5f)
          let a: A_F893 = new A_F893()
      a.foo(7.3f)
      expect(A_F893.field instanceof float).assertTrue()
      expect(A_F893.field).assertEqual(7.3f)
      a.foo(4.5f)
      expect(A_F893.field instanceof float).assertTrue()
      expect(A_F893.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0894
     * @tc.name      testFieldInit0894
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0894", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F894.field instanceof bigint).assertTrue()
      expect(A_F894.field).assertEqual(4n)
          let a: A_F894 = new A_F894()
      a.foo(5n)
      expect(A_F894.field instanceof bigint).assertTrue()
      expect(A_F894.field).assertEqual(5n)
      a.foo(4n)
      expect(A_F894.field instanceof bigint).assertTrue()
      expect(A_F894.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0895
     * @tc.name      testFieldInit0895
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0895", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F895.field instanceof string).assertTrue()
      expect(A_F895.field).assertEqual("abc")
          let a: A_F895 = new A_F895()
      a.foo("efg")
      expect(A_F895.field instanceof string).assertTrue()
      expect(A_F895.field).assertEqual("efg")
      a.foo("abc")
      expect(A_F895.field instanceof string).assertTrue()
      expect(A_F895.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0896
     * @tc.name      testFieldInit0896
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0896", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F896.field instanceof char).assertTrue()
      expect(A_F896.field).assertEqual(c'a')
          let a: A_F896 = new A_F896()
      a.foo(c'b')
      expect(A_F896.field instanceof char).assertTrue()
      expect(A_F896.field).assertEqual(c'b')
      a.foo(c'a')
      expect(A_F896.field instanceof char).assertTrue()
      expect(A_F896.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0897
     * @tc.name      testFieldInit0897
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0897", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F897.field instanceof boolean).assertTrue()
      expect(A_F897.field).assertEqual(false)
          let a: A_F897 = new A_F897()
      a.foo(true)
      expect(A_F897.field instanceof boolean).assertTrue()
      expect(A_F897.field).assertEqual(true)
      a.foo(false)
      expect(A_F897.field instanceof boolean).assertTrue()
      expect(A_F897.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0898
     * @tc.name      testFieldInit0898
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0898", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F898.field instanceof Object).assertTrue()
      expect(A_F898.field).assertEqual(4)
          let a: A_F898 = new A_F898()
      a.foo(5)
      expect(A_F898.field instanceof Object).assertTrue()
      expect(A_F898.field).assertEqual(5)
      a.foo(4)
      expect(A_F898.field instanceof Object).assertTrue()
      expect(A_F898.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0899
     * @tc.name      testFieldInit0899
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0899", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F899.field instanceof Object | undefined).assertTrue()
      expect(A_F899.field).assertEqual(undefined)
          let a: A_F899 = new A_F899()
      a.foo(5)
      expect(A_F899.field instanceof Object | undefined).assertTrue()
      expect(A_F899.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F899.field instanceof Object | undefined).assertTrue()
      expect(A_F899.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0900
     * @tc.name      testFieldInit0900
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F900.field instanceof Object | undefined | null).assertTrue()
      expect(A_F900.field).assertEqual(4)
          let a: A_F900 = new A_F900()
      a.foo(5)
      expect(A_F900.field instanceof Object | undefined | null).assertTrue()
      expect(A_F900.field).assertEqual(5)
      a.foo(4)
      expect(A_F900.field instanceof Object | undefined | null).assertTrue()
      expect(A_F900.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0901
     * @tc.name      testFieldInit0901
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0901", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F901.field instanceof Any).assertTrue()
      expect(A_F901.field).assertEqual(4)
          let a: A_F901 = new A_F901()
      a.foo(5)
      expect(A_F901.field instanceof Any).assertTrue()
      expect(A_F901.field).assertEqual(5)
      a.foo(4)
      expect(A_F901.field instanceof Any).assertTrue()
      expect(A_F901.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0902
     * @tc.name      testFieldInit0902
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0902", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F902.field instanceof long).assertTrue()
      expect(A_F902.field).assertEqual(4)
          let a: A_F902 = new A_F902()
      expect(A_F902.field instanceof long).assertTrue()
      expect(A_F902.field).assertEqual(5)
          A_F902.field = 4
      expect(A_F902.field instanceof long).assertTrue()
      expect(A_F902.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0903
     * @tc.name      testFieldInit0903
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0903", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F903.field instanceof int).assertTrue()
      expect(A_F903.field).assertEqual(4)
          let a: A_F903 = new A_F903()
      expect(A_F903.field instanceof int).assertTrue()
      expect(A_F903.field).assertEqual(5)
          A_F903.field = 4
      expect(A_F903.field instanceof int).assertTrue()
      expect(A_F903.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0904
     * @tc.name      testFieldInit0904
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0904", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F904.field instanceof byte).assertTrue()
      expect(A_F904.field).assertEqual(4)
          let a: A_F904 = new A_F904()
      expect(A_F904.field instanceof byte).assertTrue()
      expect(A_F904.field).assertEqual(5)
          A_F904.field = 4
      expect(A_F904.field instanceof byte).assertTrue()
      expect(A_F904.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0905
     * @tc.name      testFieldInit0905
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0905", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F905.field instanceof short).assertTrue()
      expect(A_F905.field).assertEqual(4)
          let a: A_F905 = new A_F905()
      expect(A_F905.field instanceof short).assertTrue()
      expect(A_F905.field).assertEqual(5)
          A_F905.field = 4
      expect(A_F905.field instanceof short).assertTrue()
      expect(A_F905.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0906
     * @tc.name      testFieldInit0906
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0906", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F906.field instanceof double).assertTrue()
      expect(A_F906.field).assertEqual(4)
          let a: A_F906 = new A_F906()
      expect(A_F906.field instanceof double).assertTrue()
      expect(A_F906.field).assertEqual(7.3)
          A_F906.field = 4
      expect(A_F906.field instanceof double).assertTrue()
      expect(A_F906.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0907
     * @tc.name      testFieldInit0907
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0907", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F907.field instanceof number).assertTrue()
      expect(A_F907.field).assertEqual(4)
          let a: A_F907 = new A_F907()
      expect(A_F907.field instanceof number).assertTrue()
      expect(A_F907.field).assertEqual(5)
          A_F907.field = 4
      expect(A_F907.field instanceof number).assertTrue()
      expect(A_F907.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0908
     * @tc.name      testFieldInit0908
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0908", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F908.field instanceof float).assertTrue()
      expect(A_F908.field).assertEqual(4.5f)
          let a: A_F908 = new A_F908()
      expect(A_F908.field instanceof float).assertTrue()
      expect(A_F908.field).assertEqual(7.3f)
          A_F908.field = 4.5f
      expect(A_F908.field instanceof float).assertTrue()
      expect(A_F908.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0909
     * @tc.name      testFieldInit0909
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0909", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F909.field instanceof bigint).assertTrue()
      expect(A_F909.field).assertEqual(4n)
          let a: A_F909 = new A_F909()
      expect(A_F909.field instanceof bigint).assertTrue()
      expect(A_F909.field).assertEqual(5n)
          A_F909.field = 4n
      expect(A_F909.field instanceof bigint).assertTrue()
      expect(A_F909.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0910
     * @tc.name      testFieldInit0910
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0910", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F910.field instanceof string).assertTrue()
      expect(A_F910.field).assertEqual("abc")
          let a: A_F910 = new A_F910()
      expect(A_F910.field instanceof string).assertTrue()
      expect(A_F910.field).assertEqual("efg")
          A_F910.field = "abc"
      expect(A_F910.field instanceof string).assertTrue()
      expect(A_F910.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0911
     * @tc.name      testFieldInit0911
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0911", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F911.field instanceof char).assertTrue()
      expect(A_F911.field).assertEqual(c'a')
          let a: A_F911 = new A_F911()
      expect(A_F911.field instanceof char).assertTrue()
      expect(A_F911.field).assertEqual(c'b')
          A_F911.field = c'a'
      expect(A_F911.field instanceof char).assertTrue()
      expect(A_F911.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0912
     * @tc.name      testFieldInit0912
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0912", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F912.field instanceof boolean).assertTrue()
      expect(A_F912.field).assertEqual(false)
          let a: A_F912 = new A_F912()
      expect(A_F912.field instanceof boolean).assertTrue()
      expect(A_F912.field).assertEqual(true)
          A_F912.field = false
      expect(A_F912.field instanceof boolean).assertTrue()
      expect(A_F912.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0913
     * @tc.name      testFieldInit0913
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0913", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F913.field instanceof Object).assertTrue()
      expect(A_F913.field).assertEqual(4)
          let a: A_F913 = new A_F913()
      expect(A_F913.field instanceof Object).assertTrue()
      expect(A_F913.field).assertEqual(5)
          A_F913.field = 4
      expect(A_F913.field instanceof Object).assertTrue()
      expect(A_F913.field).assertEqual(4)
    })
