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
import Utils from '../../Util.test.ets'


class A_F200 {
    field: Promise<long>
    async foo(): Promise<long> {
      let v: long = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F201 {
    field: Promise<int>
    async foo(): Promise<int> {
      let v: int = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F202 {
    field: Promise<byte>
    async foo(): Promise<byte> {
      let v: byte = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F203 {
    field: Promise<short>
    async foo(): Promise<short> {
      let v: short = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F204 {
    field: Promise<double>
    async foo(): Promise<double> {
      let v: double = 7.3
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F205 {
    field: Promise<number>
    async foo(): Promise<number> {
      let v: number = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F206 {
    field: Promise<float>
    async foo(): Promise<float> {
      let v: float = 7.3f
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F207 {
    field: Promise<bigint>
    async foo(): Promise<bigint> {
      let v: bigint = 5n
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F208 {
    field: Promise<string>
    async foo(): Promise<string> {
      let v: string = "abc"
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F209 {
    field: Promise<char>
    async foo(): Promise<char> {
      let v: char = c'a'
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F210 {
    field: Promise<boolean>
    async foo(): Promise<boolean> {
      let v: boolean = true
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }
class A_F215 {
    field: Promise<long> = new Promise<long>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<long> {
      let v: long = 5
      return v
    }
  }

class A_F216 {
    field: Promise<int> = new Promise<int>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<int> {
      let v: int = 5
      return v
    }
  }

class A_F217 {
    field: Promise<byte> = new Promise<byte>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<byte> {
      let v: byte = 5
      return v
    }
  }

class A_F218 {
    field: Promise<short> = new Promise<short>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<short> {
      let v: short = 5
      return v
    }
  }

class A_F219 {
    field: Promise<double> = new Promise<double>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<double> {
      let v: double = 7.3
      return v
    }
  }

class A_F220 {
    field: Promise<number> = new Promise<number>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<number> {
      let v: number = 5
      return v
    }
  }

class A_F221 {
    field: Promise<float> = new Promise<float>(
      (resolve, reject) => {resolve(4.5f)}
    )
    async foo(): Promise<float> {
      let v: float = 7.3f
      return v
    }
  }

class A_F222 {
    field: Promise<bigint> = new Promise<bigint>(
      (resolve, reject) => {resolve(4n)}
    )
    async foo(): Promise<bigint> {
      let v: bigint = 5n
      return v
    }
  }

class A_F223 {
    field: Promise<string> = new Promise<string>(
      (resolve, reject) => {resolve("abc")}
    )
    async foo(): Promise<string> {
      let v: string = "efg"
      return v
    }
  }

class A_F224 {
    field: Promise<char> = new Promise<char>(
      (resolve, reject) => {resolve(c'a')}
    )
    async foo(): Promise<char> {
      let v: char = c'b'
      return v
    }
  }

class A_F225 {
    field: Promise<boolean> = new Promise<boolean>(
      (resolve, reject) => {resolve(false)}
    )
    async foo(): Promise<boolean> {
      let v: boolean = true
      return v
    }
  }
class A_F230 {
    field: long = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F231 {
    field: int = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F232 {
    field: byte = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F233 {
    field: short = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F234 {
    field: double = 4
    async foo(): Promise<void> {
      this.field = 7.3
    }
  }

class A_F235 {
    field: number = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F236 {
    field: float = 4.5f
    async foo(): Promise<void> {
      this.field = 7.3f
    }
  }

class A_F237 {
    field: bigint = 4n
    async foo(): Promise<void> {
      this.field = 5n
    }
  }

class A_F238 {
    field: string = "abc"
    async foo(): Promise<void> {
      this.field = "efg"
    }
  }

class A_F239 {
    field: char = c'a'
    async foo(): Promise<void> {
      this.field = c'b'
    }
  }

class A_F240 {
    field: boolean = false
    async foo(): Promise<void> {
      this.field = true
    }
  }

class A_F241 {
    field: Object = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F242 {
    field: Object | undefined = undefined
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F243 {
    field: Object | undefined | null = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F245 {
    field: long = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F246 {
    field: int = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F247 {
    field: byte = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F248 {
    field: short = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F249 {
    field: double = 4
    async foo(): Promise<void> {
      this.field = 7.3
    }
  }

class A_F250 {
    field: number = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F251 {
    field: float = 4.5f
    async foo(): Promise<void> {
      this.field = 7.3f
    }
  }

class A_F252 {
    field: bigint = 4n
    async foo(): Promise<void> {
      this.field = 5n
    }
  }

class A_F253 {
    field: string = "abc"
    async foo(): Promise<void> {
      this.field = "efg"
    }
  }

class A_F254 {
    field: char = c'a'
    async foo(): Promise<void> {
      this.field = c'b'
    }
  }

class A_F255 {
    field: boolean = false
    async foo(): Promise<void> {
      this.field = true
    }
  }

class A_F256 {
    field: Object = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F257 {
    field: Object | undefined = undefined
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F258 {
    field: Object | undefined | null = 4
    async foo(): Promise<void> {
      this.field = 5
    }
  }

class A_F260 {
    field: long = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F261 {
    field: int = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F262 {
    field: byte = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F263 {
    field: short = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F264 {
    field: double = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 7.3
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F265 {
    field: number = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F266 {
    field: float = 4.5f
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 7.3f
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F267 {
    field: bigint = 4n
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5n
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F268 {
    field: string = "abc"
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = "efg"
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F269 {
    field: char = c'a'
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = c'b'
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F270 {
    field: boolean = false
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = true
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F271 {
    field: Object = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F272 {
    field: Object | undefined = undefined
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F273 {
    field: Object | undefined | null = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F275 {
    field: long = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F276 {
    field: int = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F277 {
    field: byte = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F278 {
    field: short = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F279 {
    field: double = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 7.3
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F280 {
    field: number = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F281 {
    field: float = 4.5f
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 7.3f
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F282 {
    field: bigint = 4n
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5n
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F283 {
    field: string = "abc"
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = "efg"
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F284 {
    field: char = c'a'
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = c'b'
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F285 {
    field: boolean = false
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = true
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F286 {
    field: Object = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F287 {
    field: Object | undefined = undefined
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F288 {
    field: Object | undefined | null = 4
    async foo(): Promise<void> {
      return new Promise<void> (
        (resolve) => {
          setTimeout(() => {
            this.field = 5
            resolve(undefined)
          }, 1)
        }
      )
    }
  }

class A_F290<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F291<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F292<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F293<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F294<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F295<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F296<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

class A_F297<T> {
    field: T
    constructor(a: T) {
       this.field = a
    }
  }

export default function FieldInitializationTwoTest(): void {
  describe("FieldInitializationTwoTest", () => {
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
     * @tc.number    SUB_FIELD_INIT_TWO_0100
     * @tc.name      testFieldInitTwo0001
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F256 = new A_F256()
      expect(a.field).assertEqual(4)
          let res: Object = a.foo().then((): Object => a.field)
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0200
     * @tc.name      testFieldInitTwo0002
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F258 = new A_F258()
      expect(a.field).assertEqual(4)
          let res: Object = a.foo().then((): Object | undefined | null => a.field)
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0300
     * @tc.name      testFieldInitTwo0003
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F260 = new A_F260()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0400
     * @tc.name      testFieldInitTwo0004
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F261 = new A_F261()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0500
     * @tc.name      testFieldInitTwo0005
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F262 = new A_F262()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0600
     * @tc.name      testFieldInitTwo0006
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F263 = new A_F263()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0700
     * @tc.name      testFieldInitTwo0007
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F264 = new A_F264()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0800
     * @tc.name      testFieldInitTwo0008
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F265 = new A_F265()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_0900
     * @tc.name      testFieldInitTwo0009
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F266 = new A_F266()
      expect(a.field).assertEqual(4.5f)
          a.foo()
      expect(a.field).assertEqual(4.5f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1000
     * @tc.name      testFieldInitTwo0010
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F267 = new A_F267()
      expect(a.field).assertEqual(4n)
          a.foo()
      expect(a.field).assertEqual(4n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1100
     * @tc.name      testFieldInitTwo0011
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F268 = new A_F268()
      expect(a.field).assertEqual("abc")
          a.foo()
      expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1200
     * @tc.name      testFieldInitTwo0012
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F269 = new A_F269()
      expect(a.field).assertEqual(c'a')
          a.foo()
      expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1300
     * @tc.name      testFieldInitTwo0013
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F270 = new A_F270()
      expect(a.field).assertEqual(false)
          a.foo()
      expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1400
     * @tc.name      testFieldInitTwo0014
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F271 = new A_F271()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1500
     * @tc.name      testFieldInitTwo0015
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F273 = new A_F273()
      expect(a.field).assertEqual(4)
          a.foo()
      expect(a.field).assertEqual(4)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1600
     * @tc.name      testFieldInitTwo0016
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F290<long> = new A_F290<long>(4)
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1700
     * @tc.name      testFieldInitTwo0017
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F291<int> = new A_F291<int>(4)
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1800
     * @tc.name      testFieldInitTwo0018
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F292<byte> = new A_F292<byte>(4)
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_1900
     * @tc.name      testFieldInitTwo0019
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F293<short> = new A_F293<short>(4)
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_2000
     * @tc.name      testFieldInitTwo0020
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F294<double> = new A_F294<double>(4)
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_2100
     * @tc.name      testFieldInitTwo0021
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F295<number> = new A_F295<number>(4)
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_2200
     * @tc.name      testFieldInitTwo0022
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F296<float> = new A_F296<float>(4.5f)
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TWO_2300
     * @tc.name      testFieldInitTwo0023
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInitTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F297<bigint> = new A_F297<bigint>(4n)
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field).assertEqual(5n)
    })
  })
}
