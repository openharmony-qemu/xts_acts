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

class A_F199 {
    _field: Any = 4
    get field(): Any {
      return this._field
    }
    set field(a: Any) {
      this._field = a
    }
  }

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

class A_F211 {
    field: Promise<Object>
    async foo(): Promise<Object> {
      let v: Object = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F212 {
    field: Promise<Object | undefined>
    async foo(): Promise<Object | undefined> {
      let v: Object | undefined = undefined
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F213 {
    field: Promise<Object | undefined | null>
    async foo(): Promise<Object | undefined | null> {
      let v: Object | undefined | null = 5
      return v
    }
    constructor() {
      this.field = this.foo()
    }
  }

class A_F214 {
    field: Promise<Any>
    async foo(): Promise<Any> {
      let v: Any = 5
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

class A_F226 {
    field: Promise<Object> = new Promise<Object>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<Object> {
      let v: Object = 5
      return v
    }
  }

class A_F227 {
    field: Promise<Object | undefined> = new Promise<Object | undefined>(
      (resolve, reject) => {resolve(undefined)}
    )
    async foo(): Promise<Object | undefined> {
      let v: Object | undefined = 5
      return v
    }
  }

class A_F228 {
    field: Promise<Object | undefined | null> = new Promise<Object | undefined | null>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<Object | undefined | null> {
      let v: Object | undefined | null = 5
      return v
    }
  }

class A_F229 {
    field: Promise<Any> = new Promise<Any>(
      (resolve, reject) => {resolve(4)}
    )
    async foo(): Promise<Any> {
      let v: Any = 5
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

class A_F244 {
    field: Any = 4
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

class A_F259 {
    field: Any = 4
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

class A_F274 {
    field: Any = 4
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

class A_F289 {
    field: Any = 4
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

export default function FieldInitializationTestTwo(): void {
  describe("FieldInitializationTestTwo", () => {
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
     * @tc.number    SUB_FIELD_INIT_TEST_0199
     * @tc.name      testFieldInit0199
     * @tc.desc      Checking for changing field by setter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F199 = new A_F199()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0200
     * @tc.name      testFieldInit0200
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F200 = new A_F200()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof long).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0201
     * @tc.name      testFieldInit0201
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F201 = new A_F201()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof int).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0202
     * @tc.name      testFieldInit0202
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F202 = new A_F202()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof byte).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0203
     * @tc.name      testFieldInit0203
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F203 = new A_F203()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof short).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0204
     * @tc.name      testFieldInit0204
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F204 = new A_F204()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof double).assertTrue()
      expect(res).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0205
     * @tc.name      testFieldInit0205
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F205 = new A_F205()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof number).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0206
     * @tc.name      testFieldInit0206
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F206 = new A_F206()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof float).assertTrue()
      expect(res).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0207
     * @tc.name      testFieldInit0207
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F207 = new A_F207()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof bigint).assertTrue()
      expect(res).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0208
     * @tc.name      testFieldInit0208
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F208 = new A_F208()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof string).assertTrue()
      expect(res).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0209
     * @tc.name      testFieldInit0209
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F209 = new A_F209()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof char).assertTrue()
      expect(res).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0210
     * @tc.name      testFieldInit0210
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F210 = new A_F210()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof boolean).assertTrue()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0211
     * @tc.name      testFieldInit0211
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F211 = new A_F211()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Object).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0212
     * @tc.name      testFieldInit0212
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F212 = new A_F212()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Object | undefined).assertTrue()
      expect(res).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0213
     * @tc.name      testFieldInit0213
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F213 = new A_F213()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Object | undefined | null).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0214
     * @tc.name      testFieldInit0214
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F214 = new A_F214()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Any).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0215
     * @tc.name      testFieldInit0215
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F215 = new A_F215()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof long).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof long).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0216
     * @tc.name      testFieldInit0216
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F216 = new A_F216()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof int).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof int).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0217
     * @tc.name      testFieldInit0217
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F217 = new A_F217()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof byte).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof byte).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0218
     * @tc.name      testFieldInit0218
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F218 = new A_F218()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof short).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof short).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0219
     * @tc.name      testFieldInit0219
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F219 = new A_F219()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof double).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof double).assertTrue()
      expect(res).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0220
     * @tc.name      testFieldInit0220
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F220 = new A_F220()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof number).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof number).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0221
     * @tc.name      testFieldInit0221
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F221 = new A_F221()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof float).assertTrue()
      expect(res).assertEqual(4.5f)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof float).assertTrue()
      expect(res).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0222
     * @tc.name      testFieldInit0222
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F222 = new A_F222()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof bigint).assertTrue()
      expect(res).assertEqual(4n)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof bigint).assertTrue()
      expect(res).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0223
     * @tc.name      testFieldInit0223
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F223 = new A_F223()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof string).assertTrue()
      expect(res).assertEqual("abc")
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof string).assertTrue()
      expect(res).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0224
     * @tc.name      testFieldInit0224
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F224 = new A_F224()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof char).assertTrue()
      expect(res).assertEqual(c'a')
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof char).assertTrue()
      expect(res).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0225
     * @tc.name      testFieldInit0225
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F225 = new A_F225()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof boolean).assertTrue()
      expect(res).assertEqual(false)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof boolean).assertTrue()
      expect(res).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0226
     * @tc.name      testFieldInit0226
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F226 = new A_F226()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Object).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof Object).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0227
     * @tc.name      testFieldInit0227
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F227 = new A_F227()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Object | undefined).assertTrue()
      expect(res).assertEqual(undefined)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof Object | undefined).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0228
     * @tc.name      testFieldInit0228
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F228 = new A_F228()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Object | undefined | null).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof Object | undefined | null).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0229
     * @tc.name      testFieldInit0229
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F229 = new A_F229()
      expect(a.field instanceof Promise).assertTrue()
          let res = waitForCompletion(() => a.field)
      expect(res instanceof Any).assertTrue()
      expect(res).assertEqual(4)
      a.field = a.foo()
      expect(a.field instanceof Promise).assertTrue()
          res = waitForCompletion(() => a.field)
      expect(res instanceof Any).assertTrue()
      expect(res).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0230
     * @tc.name      testFieldInit0230
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F230 = new A_F230()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0231
     * @tc.name      testFieldInit0231
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F231 = new A_F231()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0232
     * @tc.name      testFieldInit0232
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F232 = new A_F232()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0233
     * @tc.name      testFieldInit0233
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F233 = new A_F233()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0234
     * @tc.name      testFieldInit0234
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F234 = new A_F234()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0235
     * @tc.name      testFieldInit0235
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F235 = new A_F235()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0236
     * @tc.name      testFieldInit0236
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F236 = new A_F236()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          waitForCompletion(a.foo)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0237
     * @tc.name      testFieldInit0237
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F237 = new A_F237()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          waitForCompletion(a.foo)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0238
     * @tc.name      testFieldInit0238
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F238 = new A_F238()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          waitForCompletion(a.foo)
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0239
     * @tc.name      testFieldInit0239
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F239 = new A_F239()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          waitForCompletion(a.foo)
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0240
     * @tc.name      testFieldInit0240
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F240 = new A_F240()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          waitForCompletion(a.foo)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0241
     * @tc.name      testFieldInit0241
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F241 = new A_F241()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0242
     * @tc.name      testFieldInit0242
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F242 = new A_F242()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
          waitForCompletion(a.foo)
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0243
     * @tc.name      testFieldInit0243
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F243 = new A_F243()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0244
     * @tc.name      testFieldInit0244
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F244 = new A_F244()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0245
     * @tc.name      testFieldInit0245
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F245 = new A_F245()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): long => a.field))
      expect(res instanceof long).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0246
     * @tc.name      testFieldInit0246
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F246 = new A_F246()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): int => a.field))
      expect(res instanceof int).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0247
     * @tc.name      testFieldInit0247
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F247 = new A_F247()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): byte => a.field))
      expect(res instanceof byte).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0248
     * @tc.name      testFieldInit0248
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F248 = new A_F248()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): short => a.field))
      expect(res instanceof short).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0249
     * @tc.name      testFieldInit0249
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F249 = new A_F249()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): double => a.field))
      expect(res instanceof double).assertTrue()
      expect(res).assertEqual(7.3)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0250
     * @tc.name      testFieldInit0250
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F250 = new A_F250()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): number => a.field))
      expect(res instanceof number).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0251
     * @tc.name      testFieldInit0251
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F251 = new A_F251()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          let res = waitForCompletion(() => a.foo().then((): float => a.field))
      expect(res instanceof float).assertTrue()
      expect(res).assertEqual(7.3f)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0252
     * @tc.name      testFieldInit0252
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F252 = new A_F252()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          let res = waitForCompletion(() => a.foo().then((): bigint => a.field))
      expect(res instanceof bigint).assertTrue()
      expect(res).assertEqual(5n)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0253
     * @tc.name      testFieldInit0253
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F253 = new A_F253()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          let res = waitForCompletion(() => a.foo().then((): string => a.field))
      expect(res instanceof string).assertTrue()
      expect(res).assertEqual("efg")
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0254
     * @tc.name      testFieldInit0254
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F254 = new A_F254()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          let res = waitForCompletion(() => a.foo().then((): char => a.field))
      expect(res instanceof char).assertTrue()
      expect(res).assertEqual(c'b')
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0255
     * @tc.name      testFieldInit0255
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F255 = new A_F255()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          let res = waitForCompletion(() => a.foo().then((): boolean => a.field))
      expect(res instanceof boolean).assertTrue()
      expect(res).assertEqual(true)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0256
     * @tc.name      testFieldInit0256
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F256 = new A_F256()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): Object => a.field))
      expect(res instanceof Object).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0257
     * @tc.name      testFieldInit0257
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F257 = new A_F257()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
          let res = waitForCompletion(() => a.foo().then((): Object | undefined => a.field))
      expect(res instanceof Object | undefined).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0258
     * @tc.name      testFieldInit0258
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F258 = new A_F258()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): Object | undefined | null => a.field))
      expect(res instanceof Object | undefined | null).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0259
     * @tc.name      testFieldInit0259
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F259 = new A_F259()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): Any => a.field))
      expect(res instanceof Any).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0260
     * @tc.name      testFieldInit0260
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F260 = new A_F260()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0261
     * @tc.name      testFieldInit0261
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F261 = new A_F261()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0262
     * @tc.name      testFieldInit0262
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F262 = new A_F262()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0263
     * @tc.name      testFieldInit0263
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0263", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F263 = new A_F263()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0264
     * @tc.name      testFieldInit0264
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0264", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F264 = new A_F264()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0265
     * @tc.name      testFieldInit0265
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0265", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F265 = new A_F265()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0266
     * @tc.name      testFieldInit0266
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0266", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F266 = new A_F266()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          waitForCompletion(a.foo)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0267
     * @tc.name      testFieldInit0267
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0267", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F267 = new A_F267()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          waitForCompletion(a.foo)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0268
     * @tc.name      testFieldInit0268
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0268", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F268 = new A_F268()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          waitForCompletion(a.foo)
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0269
     * @tc.name      testFieldInit0269
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0269", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F269 = new A_F269()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          waitForCompletion(a.foo)
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0270
     * @tc.name      testFieldInit0270
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0270", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F270 = new A_F270()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          waitForCompletion(a.foo)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0271
     * @tc.name      testFieldInit0271
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0271", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F271 = new A_F271()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0272
     * @tc.name      testFieldInit0272
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0272", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F272 = new A_F272()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
          waitForCompletion(a.foo)
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0273
     * @tc.name      testFieldInit0273
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0273", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F273 = new A_F273()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0274
     * @tc.name      testFieldInit0274
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0274", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F274 = new A_F274()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
          waitForCompletion(a.foo)
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0275
     * @tc.name      testFieldInit0275
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0275", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F275 = new A_F275()
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): long => a.field))
      expect(res instanceof long).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0276
     * @tc.name      testFieldInit0276
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0276", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F276 = new A_F276()
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): int => a.field))
      expect(res instanceof int).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0277
     * @tc.name      testFieldInit0277
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0277", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F277 = new A_F277()
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): byte => a.field))
      expect(res instanceof byte).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0278
     * @tc.name      testFieldInit0278
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0278", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F278 = new A_F278()
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): short => a.field))
      expect(res instanceof short).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0279
     * @tc.name      testFieldInit0279
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0279", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F279 = new A_F279()
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): double => a.field))
      expect(res instanceof double).assertTrue()
      expect(res).assertEqual(7.3)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0280
     * @tc.name      testFieldInit0280
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0280", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F280 = new A_F280()
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): number => a.field))
      expect(res instanceof number).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0281
     * @tc.name      testFieldInit0281
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0281", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F281 = new A_F281()
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
          let res = waitForCompletion(() => a.foo().then((): float => a.field))
      expect(res instanceof float).assertTrue()
      expect(res).assertEqual(7.3f)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0282
     * @tc.name      testFieldInit0282
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0282", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F282 = new A_F282()
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
          let res = waitForCompletion(() => a.foo().then((): bigint => a.field))
      expect(res instanceof bigint).assertTrue()
      expect(res).assertEqual(5n)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0283
     * @tc.name      testFieldInit0283
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0283", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F283 = new A_F283()
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("abc")
          let res = waitForCompletion(() => a.foo().then((): string => a.field))
      expect(res instanceof string).assertTrue()
      expect(res).assertEqual("efg")
      expect(a.field instanceof string).assertTrue()
      expect(a.field).assertEqual("efg")
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0284
     * @tc.name      testFieldInit0284
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0284", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F284 = new A_F284()
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'a')
          let res = waitForCompletion(() => a.foo().then((): char => a.field))
      expect(res instanceof char).assertTrue()
      expect(res).assertEqual(c'b')
      expect(a.field instanceof char).assertTrue()
      expect(a.field).assertEqual(c'b')
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0285
     * @tc.name      testFieldInit0285
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0285", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F285 = new A_F285()
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(false)
          let res = waitForCompletion(() => a.foo().then((): boolean => a.field))
      expect(res instanceof boolean).assertTrue()
      expect(res).assertEqual(true)
      expect(a.field instanceof boolean).assertTrue()
      expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0286
     * @tc.name      testFieldInit0286
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0286", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F286 = new A_F286()
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): Object => a.field))
      expect(res instanceof Object).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Object).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0287
     * @tc.name      testFieldInit0287
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0287", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F287 = new A_F287()
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(undefined)
          let res = waitForCompletion(() => a.foo().then((): Object | undefined => a.field))
      expect(res instanceof Object | undefined).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Object | undefined).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0288
     * @tc.name      testFieldInit0288
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0288", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F288 = new A_F288()
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): Object | undefined | null => a.field))
      expect(res instanceof Object | undefined | null).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Object | undefined | null).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0289
     * @tc.name      testFieldInit0289
     * @tc.desc      Checking for changing the value with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0289", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F289 = new A_F289()
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(4)
          let res = waitForCompletion(() => a.foo().then((): Any => a.field))
      expect(res instanceof Any).assertTrue()
      expect(res).assertEqual(5)
      expect(a.field instanceof Any).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0290
     * @tc.name      testFieldInit0290
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0290", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F290<long> = new A_F290<long>(4)
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof long).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0291
     * @tc.name      testFieldInit0291
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0291", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F291<int> = new A_F291<int>(4)
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof int).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0292
     * @tc.name      testFieldInit0292
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0292", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F292<byte> = new A_F292<byte>(4)
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof byte).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0293
     * @tc.name      testFieldInit0293
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0293", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F293<short> = new A_F293<short>(4)
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof short).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0294
     * @tc.name      testFieldInit0294
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0294", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F294<double> = new A_F294<double>(4)
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 7.3
      expect(a.field instanceof double).assertTrue()
      expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0295
     * @tc.name      testFieldInit0295
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0295", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F295<number> = new A_F295<number>(4)
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(4)
      a.field = 5
      expect(a.field instanceof number).assertTrue()
      expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0296
     * @tc.name      testFieldInit0296
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0296", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F296<float> = new A_F296<float>(4.5f)
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(4.5f)
      a.field = 7.3f
      expect(a.field instanceof float).assertTrue()
      expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELD_INIT_TEST_0297
     * @tc.name      testFieldInit0297
     * @tc.desc      Checking for changing the value from outside of generic class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldInit0297", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F297<bigint> = new A_F297<bigint>(4n)
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(4n)
      a.field = 5n
      expect(a.field instanceof bigint).assertTrue()
      expect(a.field).assertEqual(5n)
    })
  })
}
