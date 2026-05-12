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

function foo_F916(): long {
    let res = A_F917.v
    A_F917.v += 1
    return res
  }
  class A_F917 {
    static v: long = 5
    field: long = foo_F917()
  }

function foo_F917(): int {
    let res = A_F918.v
    A_F918.v += 1
    return res
  }
  class A_F918 {
    static v: int = 5
    field: int = int(foo_F918())
  }

function foo_F918(): byte {
    let res = A_F919.v
    A_F919.v += 1
    return res
  }
  class A_F919 {
    static v: byte = 5
    field: byte = byte(foo_F919())
  }

function foo_F919(): short {
    let res = A_F920.v
    A_F920.v += 1
    return res
  }
  class A_F920 {
    static v: short = 5
    field: short = short(foo_F920())
  }

function foo_F920(): double {
    let res = A_F921.v
    A_F921.v += 1
    return res
  }
  class A_F921 {
    static v: double = 5
    field: double = foo_F921()
  }

function foo_F921(): number {
    let res = A_F922.v
    A_F922.v += 1
    return res
  }
  class A_F922 {
    static v: number = 5
    field: number = foo_F922()
  }

function foo_F922(): float {
    let res = A_F923.v
    A_F923.v += 1.0f
    return res
  }
  class A_F923 {
    static v: float = 5.0f
    field: float = foo_F923()
  }

function foo_F923(): bigint {
    let res = A_F924.v
    A_F924.v += 1n
    return res
  }
  class A_F924 {
    static v: bigint = 5n
    field: bigint = bigint(foo_F924())
  }

function foo_F924(): string {
    let res = A_F925.v
    A_F925.v += "n"
    return res
  }
  class A_F925 {
    static v: string = "v"
    field: string = string(foo_F925())
  }

function foo_F925(): int {
    let res = A_F926.v
    A_F926.v += 1
    return res
  }
  class A_F926 {
    static v: int = 5
    field: Object = foo_F926()
  }

function foo_F926(): int {
    let res = A_F927.v
    A_F927.v += 1
    return res
  }
  class A_F927 {
    static v: int = 5
    field: Object | null = foo_F927()
  }

function foo_F927(): int {
    let res = A_F928.v
    A_F928.v += 1
    return res
  }
  class A_F928 {
    static v: int = 5
    field: Object | undefined = foo_F928()
  }

function foo_F928(): int {
    let res = A_F929.v
    A_F929.v += 1
    return res
  }
  class A_F929 {
    static v: int = 5
    field: Object | undefined | null = foo_F929()
  }

function foo_F929(): int {
    let res = A_F930.v
    A_F930.v += 1
    return res
  }
  class A_F930 {
    static v: int = 5
    field: Any = foo_F930()
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

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0914
     * @tc.name      testFieldInit0914
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0914", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F914.field instanceof Object | undefined).assertTrue()
      expect(A_F914.field).assertEqual(undefined)
          let a: A_F914 = new A_F914()
      expect(A_F914.field instanceof Object | undefined).assertTrue()
      expect(A_F914.field).assertEqual(5)
          A_F914.field = undefined
      expect(A_F914.field instanceof Object | undefined).assertTrue()
      expect(A_F914.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0915
     * @tc.name      testFieldInit0915
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0915", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F915.field instanceof Object | undefined | null).assertTrue()
      expect(A_F915.field).assertEqual(4)
          let a: A_F915 = new A_F915()
      expect(A_F915.field instanceof Object | undefined | null).assertTrue()
      expect(A_F915.field).assertEqual(5)
          A_F915.field = 4
      expect(A_F915.field instanceof Object | undefined | null).assertTrue()
      expect(A_F915.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0916
     * @tc.name      testFieldInit0916
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0916", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F916.field instanceof Any).assertTrue()
      expect(A_F916.field).assertEqual(4)
          let a: A_F916 = new A_F916()
      expect(A_F916.field instanceof Any).assertTrue()
      expect(A_F916.field).assertEqual(5)
          A_F916.field = 4
      expect(A_F916.field instanceof Any).assertTrue()
      expect(A_F916.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0917
     * @tc.name      testFieldInit0917
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0917", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F917.v instanceof long).assertTrue()
        expect(A_F917.v).assertEqual(val)
            let a: A_F917 = new A_F917()
        expect(a.field instanceof long).assertTrue()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F917.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0918
     * @tc.name      testFieldInit0918
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0918", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F918.v instanceof int).assertTrue()
        expect(A_F918.v).assertEqual(val)
            let a: A_F918 = new A_F918()
        expect(a.field instanceof int).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F918.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0919
     * @tc.name      testFieldInit0919
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0919", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F919.v instanceof byte).assertTrue()
        expect(A_F919.v).assertEqual(val)
            let a: A_F919 = new A_F919()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F919.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0920
     * @tc.name      testFieldInit0920
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0920", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F920.v instanceof short).assertTrue()
        expect(A_F920.v).assertEqual(val)
            let a: A_F920 = new A_F920()
        expect(a.field instanceof short).assertTrue()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F920.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0921
     * @tc.name      testFieldInit0921
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0921", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F921.v instanceof double).assertTrue()
        expect(A_F921.v).assertEqual(val)
            let a: A_F921 = new A_F921()
        expect(a.field instanceof double).assertTrue()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F921.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0922
     * @tc.name      testFieldInit0922
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0922", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F922.v instanceof number).assertTrue()
        expect(A_F922.v).assertEqual(val)
            let a: A_F922 = new A_F922()
        expect(a.field instanceof number).assertTrue()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F922.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0923
     * @tc.name      testFieldInit0923
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0923", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
        expect(A_F923.v instanceof float).assertTrue()
        expect(A_F923.v).assertEqual(val)
            let a: A_F923 = new A_F923()
        expect(a.field instanceof float).assertTrue()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          A_F923.v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0924
     * @tc.name      testFieldInit0924
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0924", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
        expect(A_F924.v instanceof bigint).assertTrue()
        expect(A_F924.v).assertEqual(val)
            let a: A_F924 = new A_F924()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          A_F924.v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0925
     * @tc.name      testFieldInit0925
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0925", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
        expect(A_F925.v instanceof string).assertTrue()
        expect(A_F925.v).assertEqual(val)
            let a: A_F925 = new A_F925()
        expect(a.field instanceof string).assertTrue()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          A_F925.v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0926
     * @tc.name      testFieldInit0926
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0926", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F926.v instanceof int).assertTrue()
        expect(A_F926.v).assertEqual(val)
            let a: A_F926 = new A_F926()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F926.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0927
     * @tc.name      testFieldInit0927
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0927", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F927.v instanceof int).assertTrue()
        expect(A_F927.v).assertEqual(val)
            let a: A_F927 = new A_F927()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F927.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0928
     * @tc.name      testFieldInit0928
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0928", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F928.v instanceof int).assertTrue()
        expect(A_F928.v).assertEqual(val)
            let a: A_F928 = new A_F928()
        expect(a.field instanceof Object | undefined).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F928.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0929
     * @tc.name      testFieldInit0929
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0929", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F929.v instanceof int).assertTrue()
        expect(A_F929.v).assertEqual(val)
            let a: A_F929 = new A_F929()
        expect(a.field instanceof Object | undefined | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F929.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0930
     * @tc.name      testFieldInit0930
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0930", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F930.v instanceof int).assertTrue()
        expect(A_F930.v).assertEqual(val)
            let a: A_F930 = new A_F930()
        expect(a.field instanceof Any).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F930.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0931
     * @tc.name      testFieldInit0931
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0931", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F931.v instanceof long).assertTrue()
        expect(A_F931.v).assertEqual(val)
            let a: A_F931 = new A_F931()
        expect(a.field instanceof long).assertTrue()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F931.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0932
     * @tc.name      testFieldInit0932
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0932", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F932.v instanceof int).assertTrue()
        expect(A_F932.v).assertEqual(val)
            let a: A_F932 = new A_F932()
        expect(a.field instanceof int).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F932.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0933
     * @tc.name      testFieldInit0933
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0933", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F933.v instanceof byte).assertTrue()
        expect(A_F933.v).assertEqual(val)
            let a: A_F933 = new A_F933()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F933.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0934
     * @tc.name      testFieldInit0934
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0934", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F934.v instanceof short).assertTrue()
        expect(A_F934.v).assertEqual(val)
            let a: A_F934 = new A_F934()
        expect(a.field instanceof short).assertTrue()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F934.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0935
     * @tc.name      testFieldInit0935
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0935", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F935.v instanceof double).assertTrue()
        expect(A_F935.v).assertEqual(val)
            let a: A_F935 = new A_F935()
        expect(a.field instanceof double).assertTrue()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F935.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0936
     * @tc.name      testFieldInit0936
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0936", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F936.v instanceof number).assertTrue()
        expect(A_F936.v).assertEqual(val)
            let a: A_F936 = new A_F936()
        expect(a.field instanceof number).assertTrue()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F936.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0937
     * @tc.name      testFieldInit0937
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0937", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
        expect(A_F937.v instanceof float).assertTrue()
        expect(A_F937.v).assertEqual(val)
            let a: A_F937 = new A_F937()
        expect(a.field instanceof float).assertTrue()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          A_F937.v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0938
     * @tc.name      testFieldInit0938
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0938", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
        expect(A_F938.v instanceof bigint).assertTrue()
        expect(A_F938.v).assertEqual(val)
            let a: A_F938 = new A_F938()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          A_F938.v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0939
     * @tc.name      testFieldInit0939
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0939", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
        expect(A_F939.v instanceof string).assertTrue()
        expect(A_F939.v).assertEqual(val)
            let a: A_F939 = new A_F939()
        expect(a.field instanceof string).assertTrue()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          A_F939.v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0940
     * @tc.name      testFieldInit0940
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0940", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F940.v instanceof int).assertTrue()
        expect(A_F940.v).assertEqual(val)
            let a: A_F940 = new A_F940()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F940.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0941
     * @tc.name      testFieldInit0941
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0941", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F941.v instanceof int).assertTrue()
        expect(A_F941.v).assertEqual(val)
            let a: A_F941 = new A_F941()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F941.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0942
     * @tc.name      testFieldInit0942
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0942", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F942.v instanceof int).assertTrue()
        expect(A_F942.v).assertEqual(val)
            let a: A_F942 = new A_F942()
        expect(a.field instanceof Object | undefined).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F942.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0943
     * @tc.name      testFieldInit0943
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0943", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F943.v instanceof int).assertTrue()
        expect(A_F943.v).assertEqual(val)
            let a: A_F943 = new A_F943()
        expect(a.field instanceof Object | undefined | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F943.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0944
     * @tc.name      testFieldInit0944
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0944", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F944.v instanceof int).assertTrue()
        expect(A_F944.v).assertEqual(val)
            let a: A_F944 = new A_F944()
        expect(a.field instanceof Any).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F944.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0945
     * @tc.name      testFieldInit0945
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0945", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F945.v instanceof long).assertTrue()
        expect(A_F945.v).assertEqual(val)
            let a: A_F945 = new A_F945()
        expect(a.field instanceof long).assertTrue()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F945.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0946
     * @tc.name      testFieldInit0946
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0946", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F946.v instanceof int).assertTrue()
        expect(A_F946.v).assertEqual(val)
            let a: A_F946 = new A_F946()
        expect(a.field instanceof int).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F946.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0947
     * @tc.name      testFieldInit0947
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0947", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F947.v instanceof byte).assertTrue()
        expect(A_F947.v).assertEqual(val)
            let a: A_F947 = new A_F947()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F947.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0948
     * @tc.name      testFieldInit0948
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0948", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F948.v instanceof short).assertTrue()
        expect(A_F948.v).assertEqual(val)
            let a: A_F948 = new A_F948()
        expect(a.field instanceof short).assertTrue()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F948.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0949
     * @tc.name      testFieldInit0949
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0949", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F949.v instanceof double).assertTrue()
        expect(A_F949.v).assertEqual(val)
            let a: A_F949 = new A_F949()
        expect(a.field instanceof double).assertTrue()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F949.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0950
     * @tc.name      testFieldInit0950
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0950", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F950.v instanceof number).assertTrue()
        expect(A_F950.v).assertEqual(val)
            let a: A_F950 = new A_F950()
        expect(a.field instanceof number).assertTrue()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F950.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0951
     * @tc.name      testFieldInit0951
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0951", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
        expect(A_F951.v instanceof float).assertTrue()
        expect(A_F951.v).assertEqual(val)
            let a: A_F951 = new A_F951()
        expect(a.field instanceof float).assertTrue()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          A_F951.v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0952
     * @tc.name      testFieldInit0952
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0952", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
        expect(A_F952.v instanceof bigint).assertTrue()
        expect(A_F952.v).assertEqual(val)
            let a: A_F952 = new A_F952()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          A_F952.v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0953
     * @tc.name      testFieldInit0953
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0953", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
        expect(A_F953.v instanceof string).assertTrue()
        expect(A_F953.v).assertEqual(val)
            let a: A_F953 = new A_F953()
        expect(a.field instanceof string).assertTrue()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          A_F953.v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0954
     * @tc.name      testFieldInit0954
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0954", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F954.v instanceof int).assertTrue()
        expect(A_F954.v).assertEqual(val)
            let a: A_F954 = new A_F954()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F954.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0955
     * @tc.name      testFieldInit0955
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0955", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F955.v instanceof int).assertTrue()
        expect(A_F955.v).assertEqual(val)
            let a: A_F955 = new A_F955()
        expect(a.field instanceof Object | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F955.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0956
     * @tc.name      testFieldInit0956
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0956", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F956.v instanceof int).assertTrue()
        expect(A_F956.v).assertEqual(val)
            let a: A_F956 = new A_F956()
        expect(a.field instanceof Object | undefined).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F956.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0957
     * @tc.name      testFieldInit0957
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0957", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F957.v instanceof int).assertTrue()
        expect(A_F957.v).assertEqual(val)
            let a: A_F957 = new A_F957()
        expect(a.field instanceof Object | undefined | null).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F957.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0958
     * @tc.name      testFieldInit0958
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0958", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F958.v instanceof int).assertTrue()
        expect(A_F958.v).assertEqual(val)
            let a: A_F958 = new A_F958()
        expect(a.field instanceof Any).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F958.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0959
     * @tc.name      testFieldInit0959
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0959", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F959.field instanceof long).assertTrue()
      expect(A_F959.field).assertEqual(0)
          A_F959.field = 5
      expect(A_F959.field instanceof long).assertTrue()
      expect(A_F959.field).assertEqual(5)
          A_F959.field = 0
      expect(A_F959.field instanceof long).assertTrue()
      expect(A_F959.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0960
     * @tc.name      testFieldInit0960
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0960", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F960.field instanceof int).assertTrue()
      expect(A_F960.field).assertEqual(0)
          A_F960.field = 5
      expect(A_F960.field instanceof int).assertTrue()
      expect(A_F960.field).assertEqual(5)
          A_F960.field = 0
      expect(A_F960.field instanceof int).assertTrue()
      expect(A_F960.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0961
     * @tc.name      testFieldInit0961
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0961", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F961.field instanceof byte).assertTrue()
      expect(A_F961.field).assertEqual(0)
          A_F961.field = 5
      expect(A_F961.field instanceof byte).assertTrue()
      expect(A_F961.field).assertEqual(5)
          A_F961.field = 0
      expect(A_F961.field instanceof byte).assertTrue()
      expect(A_F961.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0962
     * @tc.name      testFieldInit0962
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0962", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F962.field instanceof short).assertTrue()
      expect(A_F962.field).assertEqual(0)
          A_F962.field = 5
      expect(A_F962.field instanceof short).assertTrue()
      expect(A_F962.field).assertEqual(5)
          A_F962.field = 0
      expect(A_F962.field instanceof short).assertTrue()
      expect(A_F962.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0963
     * @tc.name      testFieldInit0963
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0963", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F963.field instanceof double).assertTrue()
      expect(A_F963.field).assertEqual(0)
          A_F963.field = 7.3
      expect(A_F963.field instanceof double).assertTrue()
      expect(A_F963.field).assertEqual(7.3)
          A_F963.field = 0
      expect(A_F963.field instanceof double).assertTrue()
      expect(A_F963.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0964
     * @tc.name      testFieldInit0964
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0964", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F964.field instanceof number).assertTrue()
      expect(A_F964.field).assertEqual(0)
          A_F964.field = 5
      expect(A_F964.field instanceof number).assertTrue()
      expect(A_F964.field).assertEqual(5)
          A_F964.field = 0
      expect(A_F964.field instanceof number).assertTrue()
      expect(A_F964.field).assertEqual(0)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0965
     * @tc.name      testFieldInit0965
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0965", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F965.field instanceof float).assertTrue()
      expect(A_F965.field).assertEqual(0.0f)
          A_F965.field = 7.3f
      expect(A_F965.field instanceof float).assertTrue()
      expect(A_F965.field).assertEqual(7.3f)
          A_F965.field = 0.0f
      expect(A_F965.field instanceof float).assertTrue()
      expect(A_F965.field).assertEqual(0.0f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0966
     * @tc.name      testFieldInit0966
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0966", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F966.field instanceof char).assertTrue()
      expect(A_F966.field).assertEqual(c'\u0000')
          A_F966.field = c'a'
      expect(A_F966.field instanceof char).assertTrue()
      expect(A_F966.field).assertEqual(c'a')
          A_F966.field = c'\u0000'
      expect(A_F966.field instanceof char).assertTrue()
      expect(A_F966.field).assertEqual(c'\u0000')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0967
     * @tc.name      testFieldInit0967
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0967", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F967.field instanceof boolean).assertTrue()
      expect(A_F967.field).assertEqual(false)
          A_F967.field = true
      expect(A_F967.field instanceof boolean).assertTrue()
      expect(A_F967.field).assertEqual(true)
          A_F967.field = false
      expect(A_F967.field instanceof boolean).assertTrue()
      expect(A_F967.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0968
     * @tc.name      testFieldInit0968
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0968", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F968.field instanceof Object | undefined).assertTrue()
      expect(A_F968.field).assertEqual(undefined)
          A_F968.field = 5
      expect(A_F968.field instanceof Object | undefined).assertTrue()
      expect(A_F968.field).assertEqual(5)
          A_F968.field = undefined
      expect(A_F968.field instanceof Object | undefined).assertTrue()
      expect(A_F968.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0969
     * @tc.name      testFieldInit0969
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0969", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F969.field instanceof Object | undefined | null).assertTrue()
      expect(A_F969.field).assertEqual(undefined)
          A_F969.field = 5
      expect(A_F969.field instanceof Object | undefined | null).assertTrue()
      expect(A_F969.field).assertEqual(5)
          A_F969.field = undefined
      expect(A_F969.field instanceof Object | undefined | null).assertTrue()
      expect(A_F969.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0970
     * @tc.name      testFieldInit0970
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0970", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F970.field instanceof Any).assertTrue()
      expect(A_F970.field).assertEqual(undefined)
          A_F970.field = 5
      expect(A_F970.field instanceof Any).assertTrue()
      expect(A_F970.field).assertEqual(5)
          A_F970.field = undefined
      expect(A_F970.field instanceof Any).assertTrue()
      expect(A_F970.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0971
     * @tc.name      testFieldInit0971
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0971", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F971.field instanceof long).assertTrue()
      expect(A_F971.field).assertEqual(4)
          A_F971.field = 5
      expect(A_F971.field instanceof long).assertTrue()
      expect(A_F971.field).assertEqual(5)
          A_F971.field = 4
      expect(A_F971.field instanceof long).assertTrue()
      expect(A_F971.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0972
     * @tc.name      testFieldInit0972
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0972", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F972.field instanceof int).assertTrue()
      expect(A_F972.field).assertEqual(4)
          A_F972.field = 5
      expect(A_F972.field instanceof int).assertTrue()
      expect(A_F972.field).assertEqual(5)
          A_F972.field = 4
      expect(A_F972.field instanceof int).assertTrue()
      expect(A_F972.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0973
     * @tc.name      testFieldInit0973
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0973", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F973.field instanceof byte).assertTrue()
      expect(A_F973.field).assertEqual(4)
          A_F973.field = 5
      expect(A_F973.field instanceof byte).assertTrue()
      expect(A_F973.field).assertEqual(5)
          A_F973.field = 4
      expect(A_F973.field instanceof byte).assertTrue()
      expect(A_F973.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0974
     * @tc.name      testFieldInit0974
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0974", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F974.field instanceof short).assertTrue()
      expect(A_F974.field).assertEqual(4)
          A_F974.field = 5
      expect(A_F974.field instanceof short).assertTrue()
      expect(A_F974.field).assertEqual(5)
          A_F974.field = 4
      expect(A_F974.field instanceof short).assertTrue()
      expect(A_F974.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0975
     * @tc.name      testFieldInit0975
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0975", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F975.field instanceof double).assertTrue()
      expect(A_F975.field).assertEqual(4)
          A_F975.field = 7.3
      expect(A_F975.field instanceof double).assertTrue()
      expect(A_F975.field).assertEqual(7.3)
          A_F975.field = 4
      expect(A_F975.field instanceof double).assertTrue()
      expect(A_F975.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0976
     * @tc.name      testFieldInit0976
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0976", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F976.field instanceof number).assertTrue()
      expect(A_F976.field).assertEqual(4)
          A_F976.field = 5
      expect(A_F976.field instanceof number).assertTrue()
      expect(A_F976.field).assertEqual(5)
          A_F976.field = 4
      expect(A_F976.field instanceof number).assertTrue()
      expect(A_F976.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0977
     * @tc.name      testFieldInit0977
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0977", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F977.field instanceof float).assertTrue()
      expect(A_F977.field).assertEqual(4.5f)
          A_F977.field = 7.3f
      expect(A_F977.field instanceof float).assertTrue()
      expect(A_F977.field).assertEqual(7.3f)
          A_F977.field = 4.5f
      expect(A_F977.field instanceof float).assertTrue()
      expect(A_F977.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0978
     * @tc.name      testFieldInit0978
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0978", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F978.field instanceof bigint).assertTrue()
      expect(A_F978.field).assertEqual(4n)
          A_F978.field = 5n
      expect(A_F978.field instanceof bigint).assertTrue()
      expect(A_F978.field).assertEqual(5n)
          A_F978.field = 4n
      expect(A_F978.field instanceof bigint).assertTrue()
      expect(A_F978.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0979
     * @tc.name      testFieldInit0979
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0979", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F979.field instanceof string).assertTrue()
      expect(A_F979.field).assertEqual("abc")
          A_F979.field = "efg"
      expect(A_F979.field instanceof string).assertTrue()
      expect(A_F979.field).assertEqual("efg")
          A_F979.field = "abc"
      expect(A_F979.field instanceof string).assertTrue()
      expect(A_F979.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0980
     * @tc.name      testFieldInit0980
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0980", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F980.field instanceof char).assertTrue()
      expect(A_F980.field).assertEqual(c'a')
          A_F980.field = c'b'
      expect(A_F980.field instanceof char).assertTrue()
      expect(A_F980.field).assertEqual(c'b')
          A_F980.field = c'a'
      expect(A_F980.field instanceof char).assertTrue()
      expect(A_F980.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0981
     * @tc.name      testFieldInit0981
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0981", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F981.field instanceof boolean).assertTrue()
      expect(A_F981.field).assertEqual(false)
          A_F981.field = true
      expect(A_F981.field instanceof boolean).assertTrue()
      expect(A_F981.field).assertEqual(true)
          A_F981.field = false
      expect(A_F981.field instanceof boolean).assertTrue()
      expect(A_F981.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0982
     * @tc.name      testFieldInit0982
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0982", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F982.field instanceof Object).assertTrue()
      expect(A_F982.field).assertEqual(4)
          A_F982.field = 5
      expect(A_F982.field instanceof Object).assertTrue()
      expect(A_F982.field).assertEqual(5)
          A_F982.field = 4
      expect(A_F982.field instanceof Object).assertTrue()
      expect(A_F982.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0983
     * @tc.name      testFieldInit0983
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0983", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F983.field instanceof Object | undefined).assertTrue()
      expect(A_F983.field).assertEqual(undefined)
          A_F983.field = 5
      expect(A_F983.field instanceof Object | undefined).assertTrue()
      expect(A_F983.field).assertEqual(5)
          A_F983.field = undefined
      expect(A_F983.field instanceof Object | undefined).assertTrue()
      expect(A_F983.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0984
     * @tc.name      testFieldInit0984
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0984", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F984.field instanceof Object | undefined | null).assertTrue()
      expect(A_F984.field).assertEqual(4)
          A_F984.field = 5
      expect(A_F984.field instanceof Object | undefined | null).assertTrue()
      expect(A_F984.field).assertEqual(5)
          A_F984.field = 4
      expect(A_F984.field instanceof Object | undefined | null).assertTrue()
      expect(A_F984.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0985
     * @tc.name      testFieldInit0985
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0985", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F985.field instanceof Any).assertTrue()
      expect(A_F985.field).assertEqual(4)
          A_F985.field = 5
      expect(A_F985.field instanceof Any).assertTrue()
      expect(A_F985.field).assertEqual(5)
          A_F985.field = 4
      expect(A_F985.field instanceof Any).assertTrue()
      expect(A_F985.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0986
     * @tc.name      testFieldInit0986
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0986", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F986.field instanceof long).assertTrue()
      expect(A_F986.field).assertEqual(4)
          A_F986.field = 5
      expect(A_F986.field instanceof long).assertTrue()
      expect(A_F986.field).assertEqual(5)
          A_F986.field = 4
      expect(A_F986.field instanceof long).assertTrue()
      expect(A_F986.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0987
     * @tc.name      testFieldInit0987
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0987", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F987.field instanceof int).assertTrue()
      expect(A_F987.field).assertEqual(4)
          A_F987.field = 5
      expect(A_F987.field instanceof int).assertTrue()
      expect(A_F987.field).assertEqual(5)
          A_F987.field = 4
      expect(A_F987.field instanceof int).assertTrue()
      expect(A_F987.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0988
     * @tc.name      testFieldInit0988
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0988", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F988.field instanceof byte).assertTrue()
      expect(A_F988.field).assertEqual(4)
          A_F988.field = 5
      expect(A_F988.field instanceof byte).assertTrue()
      expect(A_F988.field).assertEqual(5)
          A_F988.field = 4
      expect(A_F988.field instanceof byte).assertTrue()
      expect(A_F988.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0989
     * @tc.name      testFieldInit0989
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0989", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F989.field instanceof short).assertTrue()
      expect(A_F989.field).assertEqual(4)
          A_F989.field = 5
      expect(A_F989.field instanceof short).assertTrue()
      expect(A_F989.field).assertEqual(5)
          A_F989.field = 4
      expect(A_F989.field instanceof short).assertTrue()
      expect(A_F989.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0990
     * @tc.name      testFieldInit0990
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0990", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F990.field instanceof double).assertTrue()
      expect(A_F990.field).assertEqual(4)
          A_F990.field = 7.3
      expect(A_F990.field instanceof double).assertTrue()
      expect(A_F990.field).assertEqual(7.3)
          A_F990.field = 4
      expect(A_F990.field instanceof double).assertTrue()
      expect(A_F990.field).assertEqual(4)
    })
  })
}
