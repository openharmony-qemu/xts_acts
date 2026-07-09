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
} from "@ohos/hypium-binary/src/main/indexStatic";
import Utils from '../../Util.test'


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

function foo_F916(): long {
    let res = A_F917.v
    A_F917.v += 1
    return res
  }
  class A_F917 {
    static v: long = 5
    field: long = foo_F916()
  }

function foo_F917(): int {
    let res = A_F918.v
    A_F918.v += 1
    return res
  }
  class A_F918 {
    static v: int = 5
    field: int = foo_F917()
  }

function foo_F918(): byte {
    let res = A_F919.v
    A_F919.v += 1
    return res
  }
  class A_F919 {
    static v: byte = 5
    field: byte = foo_F918()
  }

function foo_F919(): short {
    let res = A_F920.v
    A_F920.v += 1
    return res
  }
  class A_F920 {
    static v: short = 5
    field: short = foo_F919()
  }

function foo_F920(): double {
    let res = A_F921.v
    A_F921.v += 1
    return res
  }
  class A_F921 {
    static v: double = 5
    field: double = foo_F920()
  }

function foo_F921(): number {
    let res = A_F922.v
    A_F922.v += 1
    return res
  }
  class A_F922 {
    static v: number = 5
    field: number = foo_F921()
  }

function foo_F922(): float {
    let res = A_F923.v
    A_F923.v += 1.0f
    return res
  }
  class A_F923 {
    static v: float = 5.0f
    field: float = foo_F922()
  }

function foo_F923(): bigint {
    let res = A_F924.v
    A_F924.v += 1n
    return res
  }
  class A_F924 {
    static v: bigint = 5n
    field: bigint = foo_F923()
  }

function foo_F924(): string {
    let res = A_F925.v
    A_F925.v += "n"
    return res
  }
  class A_F925 {
    static v: string = "v"
    field: string = foo_F924()
  }

function foo_F925(): int {
    let res = A_F926.v
    A_F926.v += 1
    return res
  }
  class A_F926 {
    static v: int = 5
    field: Object = foo_F925()
  }

function foo_F926(): int {
    let res = A_F927.v
    A_F927.v += 1
    return res
  }
  class A_F927 {
    static v: int = 5
    field: Object | null = foo_F926()
  }

function foo_F927(): int {
    let res = A_F928.v
    A_F928.v += 1
    return res
  }
  class A_F928 {
    static v: int = 5
    field: Object | undefined = foo_F927()
  }

function foo_F928(): int {
    let res = A_F929.v
    A_F929.v += 1
    return res
  }
  class A_F929 {
    static v: int = 5
    field: Object | undefined | null = foo_F928()
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

export default function FieldInitializationNineTest(): void {
  describe("FieldInitializationNineTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0100
     * @tc.name      testFieldInitNine0001
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0200
     * @tc.name      testFieldInitNine0002
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0300
     * @tc.name      testFieldInitNine0003
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0400
     * @tc.name      testFieldInitNine0004
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0500
     * @tc.name      testFieldInitNine0005
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0600
     * @tc.name      testFieldInitNine0006
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0700
     * @tc.name      testFieldInitNine0007
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_0800
     * @tc.name      testFieldInitNine0008
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F899.field instanceof Object).assertFalse()
      expect(A_F899.field).assertEqual(undefined)
          let a: A_F899 = new A_F899()
      a.foo(5)
      expect(A_F899.field instanceof Object).assertTrue()
      expect(A_F899.field).assertEqual(5)
      a.foo(undefined)
      expect(A_F899.field instanceof Object).assertFalse()
      expect(A_F899.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_0900
     * @tc.name      testFieldInitNine0009
     * @tc.desc      Checking for changing the value from class method call.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F900.field instanceof Object).assertTrue()
      expect(A_F900.field).assertEqual(4)
          let a: A_F900 = new A_F900()
      a.foo(5)
      expect(A_F900.field instanceof Object).assertTrue()
      expect(A_F900.field).assertEqual(5)
      a.foo(4)
      expect(A_F900.field instanceof Object).assertTrue()
      expect(A_F900.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_1000
     * @tc.name      testFieldInitNine0010
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1100
     * @tc.name      testFieldInitNine0011
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1200
     * @tc.name      testFieldInitNine0012
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1300
     * @tc.name      testFieldInitNine0013
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1400
     * @tc.name      testFieldInitNine0014
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1500
     * @tc.name      testFieldInitNine0015
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1600
     * @tc.name      testFieldInitNine0016
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1700
     * @tc.name      testFieldInitNine0017
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1800
     * @tc.name      testFieldInitNine0018
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_1900
     * @tc.name      testFieldInitNine0019
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_2000
     * @tc.name      testFieldInitNine0020
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_2100
     * @tc.name      testFieldInitNine0021
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_2200
     * @tc.name      testFieldInitNine0022
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F914.field instanceof Object).assertFalse()
      expect(A_F914.field).assertEqual(undefined)
          let a: A_F914 = new A_F914()
      expect(A_F914.field instanceof Object).assertTrue()
      expect(A_F914.field).assertEqual(5)
          A_F914.field = undefined
      expect(A_F914.field instanceof Object).assertFalse()
      expect(A_F914.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2300
     * @tc.name      testFieldInitNine0023
     * @tc.desc      Checking for changing the value from constructor.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F915.field instanceof Object).assertTrue()
      expect(A_F915.field).assertEqual(4)
          let a: A_F915 = new A_F915()
      expect(A_F915.field instanceof Object).assertTrue()
      expect(A_F915.field).assertEqual(5)
          A_F915.field = 4
      expect(A_F915.field instanceof Object).assertTrue()
      expect(A_F915.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2400
     * @tc.name      testFieldInitNine0024
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F917.v instanceof long).assertTrue()
        expect(A_F917.v).assertEqual(val)
            let a: A_F917 = new A_F917()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F917.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2500
     * @tc.name      testFieldInitNine0025
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F918.v instanceof int).assertTrue()
        expect(A_F918.v).assertEqual(val)
            let a: A_F918 = new A_F918()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F918.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2600
     * @tc.name      testFieldInitNine0026
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F919.v instanceof byte).assertTrue()
        expect(A_F919.v).assertEqual(val)
            let a: A_F919 = new A_F919()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F919.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2700
     * @tc.name      testFieldInitNine0027
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F920.v instanceof short).assertTrue()
        expect(A_F920.v).assertEqual(val)
            let a: A_F920 = new A_F920()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F920.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2800
     * @tc.name      testFieldInitNine0028
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F921.v instanceof double).assertTrue()
        expect(A_F921.v).assertEqual(val)
            let a: A_F921 = new A_F921()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F921.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_2900
     * @tc.name      testFieldInitNine0029
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F922.v instanceof number).assertTrue()
        expect(A_F922.v).assertEqual(val)
            let a: A_F922 = new A_F922()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F922.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3000
     * @tc.name      testFieldInitNine0030
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
        expect(A_F923.v instanceof float).assertTrue()
        expect(A_F923.v).assertEqual(val)
            let a: A_F923 = new A_F923()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          A_F923.v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3100
     * @tc.name      testFieldInitNine0031
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
        expect(A_F924.v instanceof bigint).assertTrue()
        expect(A_F924.v).assertEqual(val)
            let a: A_F924 = new A_F924()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          A_F924.v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3200
     * @tc.name      testFieldInitNine0032
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
        expect(A_F925.v instanceof string).assertTrue()
        expect(A_F925.v).assertEqual(val)
            let a: A_F925 = new A_F925()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          A_F925.v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3300
     * @tc.name      testFieldInitNine0033
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_3400
     * @tc.name      testFieldInitNine0034
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_3500
     * @tc.name      testFieldInitNine0035
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F928.v instanceof int).assertTrue()
        expect(A_F928.v).assertEqual(val)
            let a: A_F928 = new A_F928()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F928.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3600
     * @tc.name      testFieldInitNine0036
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F929.v instanceof int).assertTrue()
        expect(A_F929.v).assertEqual(val)
            let a: A_F929 = new A_F929()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F929.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3700
     * @tc.name      testFieldInitNine0037
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F931.v instanceof long).assertTrue()
        expect(A_F931.v).assertEqual(val)
            let a: A_F931 = new A_F931()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F931.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3800
     * @tc.name      testFieldInitNine0038
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F932.v instanceof int).assertTrue()
        expect(A_F932.v).assertEqual(val)
            let a: A_F932 = new A_F932()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F932.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_3900
     * @tc.name      testFieldInitNine0039
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F933.v instanceof byte).assertTrue()
        expect(A_F933.v).assertEqual(val)
            let a: A_F933 = new A_F933()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F933.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4000
     * @tc.name      testFieldInitNine0040
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F934.v instanceof short).assertTrue()
        expect(A_F934.v).assertEqual(val)
            let a: A_F934 = new A_F934()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F934.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4100
     * @tc.name      testFieldInitNine0041
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F935.v instanceof double).assertTrue()
        expect(A_F935.v).assertEqual(val)
            let a: A_F935 = new A_F935()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F935.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4200
     * @tc.name      testFieldInitNine0042
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F936.v instanceof number).assertTrue()
        expect(A_F936.v).assertEqual(val)
            let a: A_F936 = new A_F936()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F936.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4300
     * @tc.name      testFieldInitNine0043
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
        expect(A_F937.v instanceof float).assertTrue()
        expect(A_F937.v).assertEqual(val)
            let a: A_F937 = new A_F937()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          A_F937.v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4400
     * @tc.name      testFieldInitNine0044
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
        expect(A_F938.v instanceof bigint).assertTrue()
        expect(A_F938.v).assertEqual(val)
            let a: A_F938 = new A_F938()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          A_F938.v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4500
     * @tc.name      testFieldInitNine0045
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
        expect(A_F939.v instanceof string).assertTrue()
        expect(A_F939.v).assertEqual(val)
            let a: A_F939 = new A_F939()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          A_F939.v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4600
     * @tc.name      testFieldInitNine0046
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_4700
     * @tc.name      testFieldInitNine0047
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_4800
     * @tc.name      testFieldInitNine0048
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F942.v instanceof int).assertTrue()
        expect(A_F942.v).assertEqual(val)
            let a: A_F942 = new A_F942()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F942.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_4900
     * @tc.name      testFieldInitNine0049
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F943.v instanceof int).assertTrue()
        expect(A_F943.v).assertEqual(val)
            let a: A_F943 = new A_F943()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F943.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5000
     * @tc.name      testFieldInitNine0050
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: long = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F945.v instanceof long).assertTrue()
        expect(A_F945.v).assertEqual(val)
            let a: A_F945 = new A_F945()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F945.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5100
     * @tc.name      testFieldInitNine0051
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F946.v instanceof int).assertTrue()
        expect(A_F946.v).assertEqual(val)
            let a: A_F946 = new A_F946()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F946.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5200
     * @tc.name      testFieldInitNine0052
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: byte = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F947.v instanceof byte).assertTrue()
        expect(A_F947.v).assertEqual(val)
            let a: A_F947 = new A_F947()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F947.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5300
     * @tc.name      testFieldInitNine0053
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F948.v instanceof short).assertTrue()
        expect(A_F948.v).assertEqual(val)
            let a: A_F948 = new A_F948()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F948.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5400
     * @tc.name      testFieldInitNine0054
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: double = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F949.v instanceof double).assertTrue()
        expect(A_F949.v).assertEqual(val)
            let a: A_F949 = new A_F949()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F949.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5500
     * @tc.name      testFieldInitNine0055
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F950.v instanceof number).assertTrue()
        expect(A_F950.v).assertEqual(val)
            let a: A_F950 = new A_F950()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F950.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5600
     * @tc.name      testFieldInitNine0056
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: float = 5.0f
          for (let i: int = 0; i < 5; i++) {
        expect(A_F951.v instanceof float).assertTrue()
        expect(A_F951.v).assertEqual(val)
            let a: A_F951 = new A_F951()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1.0f
          }
          A_F951.v = 5.0f
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5700
     * @tc.name      testFieldInitNine0057
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: bigint = 5n
          for (let i: int = 0; i < 5; i++) {
        expect(A_F952.v instanceof bigint).assertTrue()
        expect(A_F952.v).assertEqual(val)
            let a: A_F952 = new A_F952()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1n
          }
          A_F952.v = 5n
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5800
     * @tc.name      testFieldInitNine0058
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string = "v"
          for (let i: int = 0; i < 5; i++) {
        expect(A_F953.v instanceof string).assertTrue()
        expect(A_F953.v).assertEqual(val)
            let a: A_F953 = new A_F953()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual(val)
            val += "n"
          }
          A_F953.v = "v"
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_5900
     * @tc.name      testFieldInitNine0059
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6000
     * @tc.name      testFieldInitNine0060
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F955.v instanceof int).assertTrue()
        expect(A_F955.v).assertEqual(val)
            let a: A_F955 = new A_F955()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F955.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_6100
     * @tc.name      testFieldInitNine0061
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F956.v instanceof int).assertTrue()
        expect(A_F956.v).assertEqual(val)
            let a: A_F956 = new A_F956()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F956.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_6200
     * @tc.name      testFieldInitNine0062
     * @tc.desc      Checking for changing the static field 'v' value on each instance of the class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5
          for (let i: int = 0; i < 5; i++) {
        expect(A_F957.v instanceof int).assertTrue()
        expect(A_F957.v).assertEqual(val)
            let a: A_F957 = new A_F957()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(val)
            val += 1
          }
          A_F957.v = 5
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_6300
     * @tc.name      testFieldInitNine0063
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6400
     * @tc.name      testFieldInitNine0064
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6500
     * @tc.name      testFieldInitNine0065
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6600
     * @tc.name      testFieldInitNine0066
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6700
     * @tc.name      testFieldInitNine0067
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6800
     * @tc.name      testFieldInitNine0068
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_6900
     * @tc.name      testFieldInitNine0069
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7000
     * @tc.name      testFieldInitNine0070
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7100
     * @tc.name      testFieldInitNine0071
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7200
     * @tc.name      testFieldInitNine0072
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F968.field instanceof Object).assertFalse()
      expect(A_F968.field).assertEqual(undefined)
          A_F968.field = 5
      expect(A_F968.field instanceof Object).assertTrue()
      expect(A_F968.field).assertEqual(5)
          A_F968.field = undefined
      expect(A_F968.field instanceof Object).assertFalse()
      expect(A_F968.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_7300
     * @tc.name      testFieldInitNine0073
     * @tc.desc      Checking for initialization with default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F969.field instanceof Object).assertFalse()
      expect(A_F969.field).assertEqual(undefined)
          A_F969.field = 5
      expect(A_F969.field instanceof Object).assertTrue()
      expect(A_F969.field).assertEqual(5)
          A_F969.field = undefined
      expect(A_F969.field instanceof Object).assertFalse()
      expect(A_F969.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_7400
     * @tc.name      testFieldInitNine0074
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7500
     * @tc.name      testFieldInitNine0075
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7600
     * @tc.name      testFieldInitNine0076
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7700
     * @tc.name      testFieldInitNine0077
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7800
     * @tc.name      testFieldInitNine0078
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_7900
     * @tc.name      testFieldInitNine0079
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8000
     * @tc.name      testFieldInitNine0080
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8100
     * @tc.name      testFieldInitNine0081
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8200
     * @tc.name      testFieldInitNine0082
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8300
     * @tc.name      testFieldInitNine0083
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8400
     * @tc.name      testFieldInitNine0084
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8500
     * @tc.name      testFieldInitNine0085
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8600
     * @tc.name      testFieldInitNine0086
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F983.field instanceof Object).assertFalse()
      expect(A_F983.field).assertEqual(undefined)
          A_F983.field = 5
      expect(A_F983.field instanceof Object).assertTrue()
      expect(A_F983.field).assertEqual(5)
          A_F983.field = undefined
      expect(A_F983.field instanceof Object).assertFalse()
      expect(A_F983.field).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_8700
     * @tc.name      testFieldInitNine0087
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(A_F984.field instanceof Object).assertTrue()
      expect(A_F984.field).assertEqual(4)
          A_F984.field = 5
      expect(A_F984.field instanceof Object).assertTrue()
      expect(A_F984.field).assertEqual(5)
          A_F984.field = 4
      expect(A_F984.field instanceof Object).assertTrue()
      expect(A_F984.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_NINE_8800
     * @tc.name      testFieldInitNine0088
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_8900
     * @tc.name      testFieldInitNine0089
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_9000
     * @tc.name      testFieldInitNine0090
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_9100
     * @tc.name      testFieldInitNine0091
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number    SUB_FIELD_INIT_NINE_9200
     * @tc.name      testFieldInitNine0092
     * @tc.desc      Checking for initialization with field initializer.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitNine0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
