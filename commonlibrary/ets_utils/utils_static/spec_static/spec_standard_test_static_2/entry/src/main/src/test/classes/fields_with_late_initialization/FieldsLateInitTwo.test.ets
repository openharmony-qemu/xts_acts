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
  field!: int
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

class A_F200 {
  field!: byte
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

class A_F201 {
  field!: short
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

class A_F202 {
  field!: double
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

class A_F203 {
  field!: number
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

class A_F204 {
  field!: float
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

class A_F205 {
  field!: bigint
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

class A_F206 {
  field!: string
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = "abc"
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class A_F207 {
  field!: char
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = c'a'
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class A_F208 {
  field!: boolean
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = false
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class A_F209 {
  field!: Object
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

class A_F210 {
  field!: long
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

class A_F211 {
  field!: int
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

class A_F212 {
  field!: byte
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

class A_F213 {
  field!: short
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

class A_F214 {
  field!: double
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

class A_F215 {
  field!: number
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

class A_F216 {
  field!: float
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

class A_F217 {
  field!: bigint
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

class A_F218 {
  field!: string
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = "abc"
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class A_F219 {
  field!: char
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = c'a'
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class A_F220 {
  field!: boolean
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = false
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class A_F221 {
  field!: Object
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

class C_F222 {data!: int}
        class A_F222 {
  field!: C_F222
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = {data: 5}
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class C_F223 {data!: int}
        class A_F223 {
  field!: C_F223
  async foo(): Promise<void> {
    return new Promise<void> (
      (resolve) => {
        setTimeout(() => {
          this.field = {data: 5}
          resolve(undefined)
        }, 1)
      }
    )
  }
}

class Base_F224 {
  field: long = 0
}
class A_F224 extends Base_F224 {
  override field: long = 0
}

class Base_F225 {
  field: int = 0
}
class A_F225 extends Base_F225 {
  override field: int = 0
}

class Base_F226 {
  field: byte = 0
}
class A_F226 extends Base_F226 {
  override field: byte = 0
}

class Base_F227 {
  field: short = 0
}
class A_F227 extends Base_F227 {
  override field: short = 0
}

class Base_F228 {
  field: double = 0
}
class A_F228 extends Base_F228 {
  override field: double = 0
}

class Base_F229 {
  field: number = 0
}
class A_F229 extends Base_F229 {
  override field: number = 0
}

class Base_F230 {
  field: float = 0
}
class A_F230 extends Base_F230 {
  override field: float = 0
}

class Base_F231 {
  field: bigint = 0n
}
class A_F231 extends Base_F231 {
  override field: bigint = 0n
}

class Base_F232 {
  field: string = ""
}
class A_F232 extends Base_F232 {
  override field: string = ""
}

class Base_F233 {
  field: char = c'\0'
}
class A_F233 extends Base_F233 {
  override field: char = c'\0'
}

class Base_F234 {
  field: boolean = false
}
class A_F234 extends Base_F234 {
  override field: boolean = false
}

class Base_F235 {
  field: Object = 0
}
class A_F235 extends Base_F235 {
  override field: Object = 0
}

class Base_F236 {
  field!: long
}
class A_F236 extends Base_F236 {
  override field: long = 0
}

class Base_F237 {
  field!: int
}
class A_F237 extends Base_F237 {
  override field: int = 0
}

class Base_F238 {
  field!: byte
}
class A_F238 extends Base_F238 {
  override field: byte = 0
}

class Base_F239 {
  field!: short
}
class A_F239 extends Base_F239 {
  override field: short = 0
}

class Base_F240 {
  field!: double
}
class A_F240 extends Base_F240 {
  override field: double = 0
}

class Base_F241 {
  field!: number
}
class A_F241 extends Base_F241 {
  override field: number = 0
}

class Base_F242 {
  field!: float
}
class A_F242 extends Base_F242 {
  override field: float = 0
}

class Base_F243 {
  field!: bigint
}
class A_F243 extends Base_F243 {
  override field: bigint = 0n
}

class Base_F244 {
  field!: string
}
class A_F244 extends Base_F244 {
  override field: string = ""
}

class Base_F245 {
  field!: char
}
class A_F245 extends Base_F245 {
  override field: char = c'\0'
}

class Base_F246 {
  field!: boolean
}
class A_F246 extends Base_F246 {
  override field: boolean = false
}

class Base_F247 {
  field!: Object
}
class A_F247 extends Base_F247 {
  override field: Object = 0
}

class Base_F248 {
  field: long = 0
}
class A_F248 extends Base_F248 {
  override field: long = 0
}

class Base_F249 {
  field: int = 0
}
class A_F249 extends Base_F249 {
  override field: int = 0
}

class Base_F250 {
  field: byte = 0
}
class A_F250 extends Base_F250 {
  override field: byte = 0
}

class Base_F251 {
  field: short = 0
}
class A_F251 extends Base_F251 {
  override field: short = 0
}

class Base_F252 {
  field: double = 0
}
class A_F252 extends Base_F252 {
  override field: double = 0
}

class Base_F253 {
  field: number = 0
}
class A_F253 extends Base_F253 {
  override field: number = 0
}

class Base_F254 {
  field: float = 0
}
class A_F254 extends Base_F254 {
  override field: float = 0
}

class Base_F255 {
  field: bigint = 0n
}
class A_F255 extends Base_F255 {
  override field: bigint = 0n
}

class Base_F256 {
  field: string = ""
}
class A_F256 extends Base_F256 {
  override field: string = ""
}

class Base_F257 {
  field: char = c'\0'
}
class A_F257 extends Base_F257 {
  override field: char = c'\0'
}

class Base_F258 {
  field: boolean = false
}
class A_F258 extends Base_F258 {
  override field: boolean = false
}

class Base_F259 {
  field: Object = 0
}
class A_F259 extends Base_F259 {
  override field: Object = 0
}

class Base_F260 {
  field!: long
}
class A_F260 extends Base_F260 {
  override field: long = 0
}

class Base_F261 {
  field!: int
}
class A_F261 extends Base_F261 {
  override field: int = 0
}

class Base_F262 {
  field!: byte
}
class A_F262 extends Base_F262 {
  override field: byte = 0
}

class Base_F263 {
  field!: short
}
class A_F263 extends Base_F263 {
  override field: short = 0
}

class Base_F264 {
  field!: double
}
class A_F264 extends Base_F264 {
  override field: double = 0
}

class Base_F265 {
  field!: number
}
class A_F265 extends Base_F265 {
  override field: number = 0
}

class Base_F266 {
  field!: float
}
class A_F266 extends Base_F266 {
  override field: float = 0
}

class Base_F267 {
  field!: bigint
}
class A_F267 extends Base_F267 {
  override field: bigint = 0n
}

class Base_F268 {
  field!: string
}
class A_F268 extends Base_F268 {
  override field: string = ""
}

class Base_F269 {
  field!: char
}
class A_F269 extends Base_F269 {
  override field: char = c'\0'
}

class Base_F270 {
  field!: boolean
}
class A_F270 extends Base_F270 {
  override field: boolean = false
}

class Base_F271 {
  field!: Object
}
class A_F271 extends Base_F271 {
  override field: Object = 0
}

class Base_F272 {
  field!: long
}
class A_F272 extends Base_F272 {
  override field: long = 3
}

class Base_F273 {
  field!: int
}
class A_F273 extends Base_F273 {
  override field: int = 3
}

class Base_F274 {
  field!: byte
}
class A_F274 extends Base_F274 {
  override field: byte = 3
}

class Base_F275 {
  field!: short
}
class A_F275 extends Base_F275 {
  override field: short = 3
}

class Base_F276 {
  field!: double
}
class A_F276 extends Base_F276 {
  override field: double = 3
}

class Base_F277 {
  field!: number
}
class A_F277 extends Base_F277 {
  override field: number = 3
}

class Base_F278 {
  field!: float
}
class A_F278 extends Base_F278 {
  override field: float = 3
}

class Base_F279 {
  field!: bigint
}
class A_F279 extends Base_F279 {
  override field: bigint = 3n
}

class Base_F280 {
  field!: string
}
class A_F280 extends Base_F280 {
  override field: string = "ab"
}

class Base_F281 {
  field!: char
}
class A_F281 extends Base_F281 {
  override field: char = c'b'
}

class Base_F282 {
  field!: boolean
}
class A_F282 extends Base_F282 {
  override field: boolean = false
}

class Base_F283 {
  field!: Object
}
class A_F283 extends Base_F283 {
  override field: Object = 3
}

class Base_F284 {
  field!: long
}
class A_F284 extends Base_F284 {
  override field: long = 3
}

class Base_F285 {
  field!: int
}
class A_F285 extends Base_F285 {
  override field: int = 3
}

class Base_F286 {
  field!: byte
}
class A_F286 extends Base_F286 {
  override field: byte = 3
}

class Base_F287 {
  field!: short
}
class A_F287 extends Base_F287 {
  override field: short = 3
}

class Base_F288 {
  field!: double
}
class A_F288 extends Base_F288 {
  override field: double = 3
}

class Base_F289 {
  field!: number
}
class A_F289 extends Base_F289 {
  override field: number = 3
}

class Base_F290 {
  field!: float
}
class A_F290 extends Base_F290 {
  override field: float = 3
}

class Base_F291 {
  field!: bigint
}
class A_F291 extends Base_F291 {
  override field: bigint = 3n
}

class Base_F292 {
  field!: string
}
class A_F292 extends Base_F292 {
  override field: string = "ab"
}

class Base_F293 {
  field!: char
}
class A_F293 extends Base_F293 {
  override field: char = c'b'
}

class Base_F294 {
  field!: boolean
}
class A_F294 extends Base_F294 {
  override field: boolean = false
}

class Base_F295 {
  field!: Object
}
class A_F295 extends Base_F295 {
  override field: Object = 3
}

class Base_F296 {
  field: long = 5
}
class A_F296 extends Base_F296 {
  override field: long = 5
}

class Base_F297 {
  field: int = 5
}
class A_F297 extends Base_F297 {
  override field: int = 5
}

export default function FieldsLateInitTestTwo(): void {
  describe("FieldsLateInitTestTwo", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0199
     * @tc.name      testFieldsLateInit0199
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F199 = new A_F199()
        waitForCompletion(a.foo)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0200
     * @tc.name      testFieldsLateInit0200
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F200 = new A_F200()
        waitForCompletion(a.foo)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0201
     * @tc.name      testFieldsLateInit0201
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F201 = new A_F201()
        waitForCompletion(a.foo)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0202
     * @tc.name      testFieldsLateInit0202
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F202 = new A_F202()
        waitForCompletion(a.foo)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0203
     * @tc.name      testFieldsLateInit0203
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F203 = new A_F203()
        waitForCompletion(a.foo)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0204
     * @tc.name      testFieldsLateInit0204
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F204 = new A_F204()
        waitForCompletion(a.foo)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0205
     * @tc.name      testFieldsLateInit0205
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F205 = new A_F205()
        waitForCompletion(a.foo)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0206
     * @tc.name      testFieldsLateInit0206
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F206 = new A_F206()
        waitForCompletion(a.foo)
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0207
     * @tc.name      testFieldsLateInit0207
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F207 = new A_F207()
        waitForCompletion(a.foo)
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0208
     * @tc.name      testFieldsLateInit0208
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F208 = new A_F208()
        waitForCompletion(a.foo)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0209
     * @tc.name      testFieldsLateInit0209
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F209 = new A_F209()
        waitForCompletion(a.foo)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0210
     * @tc.name      testFieldsLateInit0210
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F210 = new A_F210()
        let res = waitForCompletion(async () => a.foo().then((): long => a.field))
        expect(res instanceof long).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0211
     * @tc.name      testFieldsLateInit0211
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F211 = new A_F211()
        let res = waitForCompletion(async () => a.foo().then((): int => a.field))
        expect(res instanceof int).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0212
     * @tc.name      testFieldsLateInit0212
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F212 = new A_F212()
        let res = waitForCompletion(async () => a.foo().then((): byte => a.field))
        expect(res instanceof byte).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0213
     * @tc.name      testFieldsLateInit0213
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F213 = new A_F213()
        let res = waitForCompletion(async () => a.foo().then((): short => a.field))
        expect(res instanceof short).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0214
     * @tc.name      testFieldsLateInit0214
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F214 = new A_F214()
        let res = waitForCompletion(async () => a.foo().then((): double => a.field))
        expect(res instanceof double).assertTrue()
        expect(res).assertEqual(7.3)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0215
     * @tc.name      testFieldsLateInit0215
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F215 = new A_F215()
        let res = waitForCompletion(async () => a.foo().then((): number => a.field))
        expect(res instanceof number).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0216
     * @tc.name      testFieldsLateInit0216
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F216 = new A_F216()
        let res = waitForCompletion(async () => a.foo().then((): float => a.field))
        expect(res instanceof float).assertTrue()
        expect(res).assertEqual(7.3f)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0217
     * @tc.name      testFieldsLateInit0217
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F217 = new A_F217()
        let res = waitForCompletion(async () => a.foo().then((): bigint => a.field))
        expect(res instanceof bigint).assertTrue()
        expect(res).assertEqual(5n)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0218
     * @tc.name      testFieldsLateInit0218
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F218 = new A_F218()
        let res = waitForCompletion(async () => a.foo().then((): string => a.field))
        expect(res instanceof string).assertTrue()
        expect(res).assertEqual("abc")
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0219
     * @tc.name      testFieldsLateInit0219
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F219 = new A_F219()
        let res = waitForCompletion(async () => a.foo().then((): char => a.field))
        expect(res instanceof char).assertTrue()
        expect(res).assertEqual(c'a')
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0220
     * @tc.name      testFieldsLateInit0220
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F220 = new A_F220()
        let res = waitForCompletion(async () => a.foo().then((): boolean => a.field))
        expect(res instanceof boolean).assertTrue()
        expect(res).assertEqual(false)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0221
     * @tc.name      testFieldsLateInit0221
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F221 = new A_F221()
        let res = waitForCompletion(async () => a.foo().then((): Object => a.field))
        expect(res instanceof Object).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0222
     * @tc.name      testFieldsLateInit0222
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F222 = new A_F222()
        waitForCompletion(a.foo)
        expect(a.field instanceof C_F222).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0223
     * @tc.name      testFieldsLateInit0223
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F223 = new A_F223()
        let res = waitForCompletion(async () => a.foo().then((): C_F223 => a.field))
        expect(res instanceof C_F223).assertTrue()
        expect(res.data instanceof int).assertTrue()
        expect(res.data).assertEqual(5)
        expect(a.field instanceof C_F223).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0224
     * @tc.name      testFieldsLateInit0224
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F224 = new A_F224()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0225
     * @tc.name      testFieldsLateInit0225
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F225 = new A_F225()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0226
     * @tc.name      testFieldsLateInit0226
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F226 = new A_F226()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0227
     * @tc.name      testFieldsLateInit0227
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F227 = new A_F227()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0228
     * @tc.name      testFieldsLateInit0228
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F228 = new A_F228()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0229
     * @tc.name      testFieldsLateInit0229
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0229", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F229 = new A_F229()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0230
     * @tc.name      testFieldsLateInit0230
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0230", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F230 = new A_F230()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0231
     * @tc.name      testFieldsLateInit0231
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0231", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F231 = new A_F231()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0232
     * @tc.name      testFieldsLateInit0232
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0232", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F232 = new A_F232()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0233
     * @tc.name      testFieldsLateInit0233
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0233", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F233 = new A_F233()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0234
     * @tc.name      testFieldsLateInit0234
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0234", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F234 = new A_F234()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0235
     * @tc.name      testFieldsLateInit0235
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0235", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F235 = new A_F235()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0236
     * @tc.name      testFieldsLateInit0236
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0236", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F236 = new A_F236()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0237
     * @tc.name      testFieldsLateInit0237
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0237", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F237 = new A_F237()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0238
     * @tc.name      testFieldsLateInit0238
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0238", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F238 = new A_F238()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0239
     * @tc.name      testFieldsLateInit0239
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0239", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F239 = new A_F239()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0240
     * @tc.name      testFieldsLateInit0240
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0240", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F240 = new A_F240()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0241
     * @tc.name      testFieldsLateInit0241
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0241", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F241 = new A_F241()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0242
     * @tc.name      testFieldsLateInit0242
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0242", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F242 = new A_F242()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0243
     * @tc.name      testFieldsLateInit0243
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0243", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F243 = new A_F243()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0244
     * @tc.name      testFieldsLateInit0244
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0244", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F244 = new A_F244()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0245
     * @tc.name      testFieldsLateInit0245
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0245", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F245 = new A_F245()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0246
     * @tc.name      testFieldsLateInit0246
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0246", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F246 = new A_F246()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0247
     * @tc.name      testFieldsLateInit0247
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0247", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F247 = new A_F247()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0248
     * @tc.name      testFieldsLateInit0248
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0248", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F248 = new A_F248()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0249
     * @tc.name      testFieldsLateInit0249
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0249", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F249 = new A_F249()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0250
     * @tc.name      testFieldsLateInit0250
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0250", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F250 = new A_F250()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0251
     * @tc.name      testFieldsLateInit0251
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0251", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F251 = new A_F251()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0252
     * @tc.name      testFieldsLateInit0252
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0252", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F252 = new A_F252()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0253
     * @tc.name      testFieldsLateInit0253
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0253", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F253 = new A_F253()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0254
     * @tc.name      testFieldsLateInit0254
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0254", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F254 = new A_F254()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0255
     * @tc.name      testFieldsLateInit0255
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0255", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F255 = new A_F255()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0256
     * @tc.name      testFieldsLateInit0256
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0256", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F256 = new A_F256()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0257
     * @tc.name      testFieldsLateInit0257
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0257", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F257 = new A_F257()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0258
     * @tc.name      testFieldsLateInit0258
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0258", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F258 = new A_F258()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0259
     * @tc.name      testFieldsLateInit0259
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0259", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F259 = new A_F259()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0260
     * @tc.name      testFieldsLateInit0260
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0260", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F260 = new A_F260()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0261
     * @tc.name      testFieldsLateInit0261
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0261", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F261 = new A_F261()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0262
     * @tc.name      testFieldsLateInit0262
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0262", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F262 = new A_F262()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })
