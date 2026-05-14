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


function waitForCompletion<T>(fn: () => T): T {
  return fn()
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

export default function FieldsLateInitTwoTest(): void {
  describe("FieldsLateInitTwoTest", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0100
     * @tc.name      testFieldsLateInitTwo0001
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F199 = new A_F199()
        waitForCompletion(a.foo)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0200
     * @tc.name      testFieldsLateInitTwo0002
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F200 = new A_F200()
        waitForCompletion(a.foo)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0300
     * @tc.name      testFieldsLateInitTwo0003
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F201 = new A_F201()
        waitForCompletion(a.foo)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0400
     * @tc.name      testFieldsLateInitTwo0004
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F202 = new A_F202()
        waitForCompletion(a.foo)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0500
     * @tc.name      testFieldsLateInitTwo0005
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F203 = new A_F203()
        waitForCompletion(a.foo)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0600
     * @tc.name      testFieldsLateInitTwo0006
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F204 = new A_F204()
        waitForCompletion(a.foo)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0700
     * @tc.name      testFieldsLateInitTwo0007
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F205 = new A_F205()
        waitForCompletion(a.foo)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0800
     * @tc.name      testFieldsLateInitTwo0008
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F206 = new A_F206()
        waitForCompletion(a.foo)
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_0900
     * @tc.name      testFieldsLateInitTwo0009
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F207 = new A_F207()
        waitForCompletion(a.foo)
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1000
     * @tc.name      testFieldsLateInitTwo0010
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F208 = new A_F208()
        waitForCompletion(a.foo)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1100
     * @tc.name      testFieldsLateInitTwo0011
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F209 = new A_F209()
        waitForCompletion(a.foo)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1200
     * @tc.name      testFieldsLateInitTwo0012
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F210 = new A_F210()
        let res = waitForCompletion(() => a.foo().then((): long => a.field))
        expect(res instanceof long).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1300
     * @tc.name      testFieldsLateInitTwo0013
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F211 = new A_F211()
        let res = waitForCompletion(() => a.foo().then((): int => a.field))
        expect(res instanceof int).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1400
     * @tc.name      testFieldsLateInitTwo0014
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F212 = new A_F212()
        let res = waitForCompletion(() => a.foo().then((): byte => a.field))
        expect(res instanceof byte).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1500
     * @tc.name      testFieldsLateInitTwo0015
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F213 = new A_F213()
        let res = waitForCompletion(() => a.foo().then((): short => a.field))
        expect(res instanceof short).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1600
     * @tc.name      testFieldsLateInitTwo0016
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F214 = new A_F214()
        let res = waitForCompletion(() => a.foo().then((): double => a.field))
        expect(res instanceof double).assertTrue()
        expect(res).assertEqual(7.3)
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1700
     * @tc.name      testFieldsLateInitTwo0017
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F215 = new A_F215()
        let res = waitForCompletion(() => a.foo().then((): number => a.field))
        expect(res instanceof number).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1800
     * @tc.name      testFieldsLateInitTwo0018
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F216 = new A_F216()
        let res = waitForCompletion(() => a.foo().then((): float => a.field))
        expect(res instanceof float).assertTrue()
        expect(res).assertEqual(7.3f)
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_1900
     * @tc.name      testFieldsLateInitTwo0019
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F217 = new A_F217()
        let res = waitForCompletion(() => a.foo().then((): bigint => a.field))
        expect(res instanceof bigint).assertTrue()
        expect(res).assertEqual(5n)
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2000
     * @tc.name      testFieldsLateInitTwo0020
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F218 = new A_F218()
        let res = waitForCompletion(() => a.foo().then((): string => a.field))
        expect(res instanceof string).assertTrue()
        expect(res).assertEqual("abc")
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2100
     * @tc.name      testFieldsLateInitTwo0021
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F219 = new A_F219()
        let res = waitForCompletion(() => a.foo().then((): char => a.field))
        expect(res instanceof char).assertTrue()
        expect(res).assertEqual(c'a')
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2200
     * @tc.name      testFieldsLateInitTwo0022
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F220 = new A_F220()
        let res = waitForCompletion(() => a.foo().then((): boolean => a.field))
        expect(res instanceof boolean).assertTrue()
        expect(res).assertEqual(false)
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2300
     * @tc.name      testFieldsLateInitTwo0023
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F221 = new A_F221()
        let res = waitForCompletion(() => a.foo().then((): Object => a.field))
        expect(res instanceof Object).assertTrue()
        expect(res).assertEqual(5)
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2400
     * @tc.name      testFieldsLateInitTwo0024
     * @tc.desc      Checking for initialization with asynchronous API usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F222 = new A_F222()
        waitForCompletion(a.foo)
        expect(a.field instanceof C_F222).assertTrue()
        expect(a.field.data instanceof int).assertTrue()
        expect(a.field.data).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2500
     * @tc.name      testFieldsLateInitTwo0025
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F224 = new A_F224()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2600
     * @tc.name      testFieldsLateInitTwo0026
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F225 = new A_F225()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2700
     * @tc.name      testFieldsLateInitTwo0027
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F226 = new A_F226()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2800
     * @tc.name      testFieldsLateInitTwo0028
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F227 = new A_F227()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_2900
     * @tc.name      testFieldsLateInitTwo0029
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F228 = new A_F228()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3000
     * @tc.name      testFieldsLateInitTwo0030
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F229 = new A_F229()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3100
     * @tc.name      testFieldsLateInitTwo0031
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F230 = new A_F230()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3200
     * @tc.name      testFieldsLateInitTwo0032
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F231 = new A_F231()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3300
     * @tc.name      testFieldsLateInitTwo0033
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F232 = new A_F232()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3400
     * @tc.name      testFieldsLateInitTwo0034
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F233 = new A_F233()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3500
     * @tc.name      testFieldsLateInitTwo0035
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F234 = new A_F234()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3600
     * @tc.name      testFieldsLateInitTwo0036
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F235 = new A_F235()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3700
     * @tc.name      testFieldsLateInitTwo0037
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F236 = new A_F236()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3800
     * @tc.name      testFieldsLateInitTwo0038
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F237 = new A_F237()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_3900
     * @tc.name      testFieldsLateInitTwo0039
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F238 = new A_F238()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4000
     * @tc.name      testFieldsLateInitTwo0040
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F239 = new A_F239()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4100
     * @tc.name      testFieldsLateInitTwo0041
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F240 = new A_F240()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4200
     * @tc.name      testFieldsLateInitTwo0042
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F241 = new A_F241()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4300
     * @tc.name      testFieldsLateInitTwo0043
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F242 = new A_F242()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4400
     * @tc.name      testFieldsLateInitTwo0044
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F243 = new A_F243()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4500
     * @tc.name      testFieldsLateInitTwo0045
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F244 = new A_F244()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4600
     * @tc.name      testFieldsLateInitTwo0046
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F245 = new A_F245()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4700
     * @tc.name      testFieldsLateInitTwo0047
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F246 = new A_F246()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4800
     * @tc.name      testFieldsLateInitTwo0048
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F247 = new A_F247()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_4900
     * @tc.name      testFieldsLateInitTwo0049
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F248 = new A_F248()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5000
     * @tc.name      testFieldsLateInitTwo0050
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F249 = new A_F249()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5100
     * @tc.name      testFieldsLateInitTwo0051
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F250 = new A_F250()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5200
     * @tc.name      testFieldsLateInitTwo0052
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F251 = new A_F251()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5300
     * @tc.name      testFieldsLateInitTwo0053
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F252 = new A_F252()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5400
     * @tc.name      testFieldsLateInitTwo0054
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F253 = new A_F253()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5500
     * @tc.name      testFieldsLateInitTwo0055
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F254 = new A_F254()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5600
     * @tc.name      testFieldsLateInitTwo0056
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F255 = new A_F255()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5700
     * @tc.name      testFieldsLateInitTwo0057
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F256 = new A_F256()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5800
     * @tc.name      testFieldsLateInitTwo0058
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F257 = new A_F257()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_5900
     * @tc.name      testFieldsLateInitTwo0059
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F258 = new A_F258()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6000
     * @tc.name      testFieldsLateInitTwo0060
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F259 = new A_F259()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6100
     * @tc.name      testFieldsLateInitTwo0061
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F260 = new A_F260()
        a.field = 5
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6200
     * @tc.name      testFieldsLateInitTwo0062
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F261 = new A_F261()
        a.field = 5
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6300
     * @tc.name      testFieldsLateInitTwo0063
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F262 = new A_F262()
        a.field = 5
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6400
     * @tc.name      testFieldsLateInitTwo0064
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F263 = new A_F263()
        a.field = 5
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6500
     * @tc.name      testFieldsLateInitTwo0065
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F264 = new A_F264()
        a.field = 7.3
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6600
     * @tc.name      testFieldsLateInitTwo0066
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F265 = new A_F265()
        a.field = 5
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6700
     * @tc.name      testFieldsLateInitTwo0067
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F266 = new A_F266()
        a.field = 7.3f
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6800
     * @tc.name      testFieldsLateInitTwo0068
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F267 = new A_F267()
        a.field = 5n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_6900
     * @tc.name      testFieldsLateInitTwo0069
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F268 = new A_F268()
        a.field = "abc"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7000
     * @tc.name      testFieldsLateInitTwo0070
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F269 = new A_F269()
        a.field = c'a'
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7100
     * @tc.name      testFieldsLateInitTwo0071
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F270 = new A_F270()
        a.field = true
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7200
     * @tc.name      testFieldsLateInitTwo0072
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F271 = new A_F271()
        a.field = 5
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7300
     * @tc.name      testFieldsLateInitTwo0073
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F272 = new A_F272()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7400
     * @tc.name      testFieldsLateInitTwo0074
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F273 = new A_F273()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7500
     * @tc.name      testFieldsLateInitTwo0075
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F274 = new A_F274()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7600
     * @tc.name      testFieldsLateInitTwo0076
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F275 = new A_F275()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7700
     * @tc.name      testFieldsLateInitTwo0077
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F276 = new A_F276()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 7.3
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7800
     * @tc.name      testFieldsLateInitTwo0078
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F277 = new A_F277()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_7900
     * @tc.name      testFieldsLateInitTwo0079
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F278 = new A_F278()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 7.3f
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8000
     * @tc.name      testFieldsLateInitTwo0080
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F279 = new A_F279()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(3n)
        a.field = 5n
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8100
     * @tc.name      testFieldsLateInitTwo0081
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F280 = new A_F280()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("ab")
        a.field = "abc"
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8200
     * @tc.name      testFieldsLateInitTwo0082
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F281 = new A_F281()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'b')
        a.field = c'a'
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8300
     * @tc.name      testFieldsLateInitTwo0083
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F282 = new A_F282()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
        a.field = true
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8400
     * @tc.name      testFieldsLateInitTwo0084
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F283 = new A_F283()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8500
     * @tc.name      testFieldsLateInitTwo0085
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F284 = new A_F284()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8600
     * @tc.name      testFieldsLateInitTwo0086
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F285 = new A_F285()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8700
     * @tc.name      testFieldsLateInitTwo0087
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F286 = new A_F286()
        expect(a.field instanceof byte).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8800
     * @tc.name      testFieldsLateInitTwo0088
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F287 = new A_F287()
        expect(a.field instanceof short).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_8900
     * @tc.name      testFieldsLateInitTwo0089
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F288 = new A_F288()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 7.3
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9000
     * @tc.name      testFieldsLateInitTwo0090
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F289 = new A_F289()
        expect(a.field instanceof number).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9100
     * @tc.name      testFieldsLateInitTwo0091
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F290 = new A_F290()
        expect(a.field instanceof float).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 7.3f
        expect(a.field).assertEqual(7.3f)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9200
     * @tc.name      testFieldsLateInitTwo0092
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F291 = new A_F291()
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(3n)
        a.field = 5n
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9300
     * @tc.name      testFieldsLateInitTwo0093
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F292 = new A_F292()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("ab")
        a.field = "abc"
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9400
     * @tc.name      testFieldsLateInitTwo0094
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F293 = new A_F293()
        expect(a.field instanceof char).assertTrue()
        expect(a.field).assertEqual(c'b')
        a.field = c'a'
        expect(a.field).assertEqual(c'a')
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9500
     * @tc.name      testFieldsLateInitTwo0095
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F294 = new A_F294()
        expect(a.field instanceof boolean).assertTrue()
        expect(a.field).assertEqual(false)
        a.field = true
        expect(a.field).assertEqual(true)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9600
     * @tc.name      testFieldsLateInitTwo0096
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Base_F295 = new A_F295()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(3)
        a.field = 5
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9700
     * @tc.name      testFieldsLateInitTwo0097
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F296 = new A_F296()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TWO_9800
     * @tc.name      testFieldsLateInitTwo0098
     * @tc.desc      Checking for initialization with overriding usage.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitTwo0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F297 = new A_F297()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })
  })
}
