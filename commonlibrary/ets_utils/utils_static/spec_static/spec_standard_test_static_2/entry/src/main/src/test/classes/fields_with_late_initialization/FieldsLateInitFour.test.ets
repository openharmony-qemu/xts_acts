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

class A_F397 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor (arg: int = 5) {
    this._field = arg
  }
}

class A_F398 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor (arg: double = 7.3) {
    this._field = arg
  }
}

class A_F399 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor (arg: string = "abc") {
    this._field = arg
  }
}

class A_F400 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor (arg: Object = 5) {
    this._field = arg
  }
}

class A_F401 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor (arg: long = 5) {
    this._field = arg
  }
}

class A_F402 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor (arg: int = 5) {
    this._field = arg
  }
}

class A_F403 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor (arg: double = 7.3) {
    this._field = arg
  }
}

class A_F404 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor (arg: string = "abc") {
    this._field = arg
  }
}

class A_F405 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor (arg: Object = 5) {
    this._field = arg
  }
}

class A_F416 {
  private _field!: long
  get field(): long {
    return this._field
  }
  set field(a: long) {
    this._field = a + 1
  }
}

class A_F417 {
  private _field!: int
  get field(): int {
    return this._field
  }
  set field(a: int) {
    this._field = a + 1
  }
}

class A_F418 {
  private _field!: double
  get field(): double {
    return this._field
  }
  set field(a: double) {
    this._field = a + 1
  }
}

class A_F419 {
  private _field!: bigint
  get field(): bigint {
    return this._field
  }
  set field(a: bigint) {
    this._field = a + 1n
  }
}

class A_F420 {
  private _field!: string
  get field(): string {
    return this._field
  }
  set field(a: string) {
    this._field = a + "c"
  }
}

class A_F421 {
  field!: long
}

class A_F422 {
  field!: int
}

class A_F423 {
  field!: byte
}

class A_F424 {
  field!: short
}

class A_F425 {
  field!: double
}

class A_F426 {
  field!: number
}

class A_F427 {
  field!: float
}

class A_F428 {
  field!: bigint
}

class A_F429 {
  field!: string
}

class A_F430 {
  field!: char
}

class A_F431 {
  field!: boolean
}

class A_F432 {
  field!: Object
}

class C_F433 {}
class A_F433 {
  field!: C_F433
}

class A_F434 {
  field!: long
  res: boolean = false
  async foo(): Promise<long> {
    return new Promise<long> (
      (resolve: (p: long) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: long = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F435 {
  field!: int
  res: boolean = false
  async foo(): Promise<int> {
    return new Promise<int> (
      (resolve: (p: int) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: int = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F436 {
  field!: byte
  res: boolean = false
  async foo(): Promise<byte> {
    return new Promise<byte> (
      (resolve: (p: byte) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: byte = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F437 {
  field!: short
  res: boolean = false
  async foo(): Promise<short> {
    return new Promise<short> (
      (resolve: (p: short) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: short = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F438 {
  field!: double
  res: boolean = false
  async foo(): Promise<double> {
    return new Promise<double> (
      (resolve: (p: double) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: double = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F439 {
  field!: number
  res: boolean = false
  async foo(): Promise<number> {
    return new Promise<number> (
      (resolve: (p: number) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: number = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F440 {
  field!: float
  res: boolean = false
  async foo(): Promise<float> {
    return new Promise<float> (
      (resolve: (p: float) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: float = 0.0f
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F441 {
  field!: bigint
  res: boolean = false
  async foo(): Promise<bigint> {
    return new Promise<bigint> (
      (resolve: (p: bigint) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: bigint = 0n
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F442 {
  field!: string
  res: boolean = false
  async foo(): Promise<string> {
    return new Promise<string> (
      (resolve: (p: string) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: string = "abc"
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F443 {
  field!: char
  res: boolean = false
  async foo(): Promise<char> {
    return new Promise<char> (
      (resolve: (p: char) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: char = c'\u0000'
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F444 {
  field!: boolean
  res: boolean = false
  async foo(): Promise<boolean> {
    return new Promise<boolean> (
      (resolve: (p: boolean) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: boolean = false
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class A_F445 {
  field!: Object
  res: boolean = false
  async foo(): Promise<Object> {
    return new Promise<Object> (
      (resolve: (p: Object) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: Object = 0
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

class C_F446 {}
class A_F446 {
  field!: C_F446
  res: boolean = false
  async foo(): Promise<C_F446> {
    return new Promise<C_F446> (
      (resolve: (p: C_F446) => void) => {
        setTimeout(() => {
          let expectedError = (e: Error): boolean => {
            if (e instanceof Error){
              this.res = true
            }
            return (e instanceof Error)
          }
          let v: C_F446 = new C_F446()
          arktest.expectThrow(() => {
            v = this.field
          }, expectedError)
          resolve(v)
        }, 1)
      }
    )
  }
}

export default function FieldsLateInitFourTest(): void {
  describe("FieldsLateInitFourTest", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0100
     * @tc.name      testFieldsLateInitFour0001
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F397 = new A_F397()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0200
     * @tc.name      testFieldsLateInitFour0002
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F398 = new A_F398()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0300
     * @tc.name      testFieldsLateInitFour0003
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F399 = new A_F399()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0400
     * @tc.name      testFieldsLateInitFour0004
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F400 = new A_F400()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0500
     * @tc.name      testFieldsLateInitFour0005
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F401 = new A_F401()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0600
     * @tc.name      testFieldsLateInitFour0006
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F402 = new A_F402()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0700
     * @tc.name      testFieldsLateInitFour0007
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F403 = new A_F403()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0800
     * @tc.name      testFieldsLateInitFour0008
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F404 = new A_F404()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_0900
     * @tc.name      testFieldsLateInitFour0009
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F405 = new A_F405()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1000
     * @tc.name      testFieldsLateInitFour0010
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F416 = new A_F416()
        a.field = 4
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1100
     * @tc.name      testFieldsLateInitFour0011
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F417 = new A_F417()
        a.field = 4
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1200
     * @tc.name      testFieldsLateInitFour0012
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F418 = new A_F418()
        a.field = 4
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1300
     * @tc.name      testFieldsLateInitFour0013
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F419 = new A_F419()
        a.field = 4n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1400
     * @tc.name      testFieldsLateInitFour0014
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F420 = new A_F420()
        a.field = "ab"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1500
     * @tc.name      testFieldsLateInitFour0015
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F421 = new A_F421()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof long).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1600
     * @tc.name      testFieldsLateInitFour0016
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F422 = new A_F422()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof int).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1700
     * @tc.name      testFieldsLateInitFour0017
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F423 = new A_F423()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof byte).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1800
     * @tc.name      testFieldsLateInitFour0018
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F424 = new A_F424()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof short).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_1900
     * @tc.name      testFieldsLateInitFour0019
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F425 = new A_F425()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof double).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2000
     * @tc.name      testFieldsLateInitFour0020
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F426 = new A_F426()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof number).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2100
     * @tc.name      testFieldsLateInitFour0021
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F427 = new A_F427()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof float).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2200
     * @tc.name      testFieldsLateInitFour0022
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F428 = new A_F428()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof bigint).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2300
     * @tc.name      testFieldsLateInitFour0023
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F429 = new A_F429()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof string).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2400
     * @tc.name      testFieldsLateInitFour0024
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F430 = new A_F430()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof char).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2500
     * @tc.name      testFieldsLateInitFour0025
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F431 = new A_F431()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof boolean).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2600
     * @tc.name      testFieldsLateInitFour0026
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F432 = new A_F432()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof Object).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2700
     * @tc.name      testFieldsLateInitFour0027
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F433 = new A_F433()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof C_F433).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2800
     * @tc.name      testFieldsLateInitFour0028
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F434 = new A_F434()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_2900
     * @tc.name      testFieldsLateInitFour0029
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F435 = new A_F435()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3000
     * @tc.name      testFieldsLateInitFour0030
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F436 = new A_F436()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3100
     * @tc.name      testFieldsLateInitFour0031
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F437 = new A_F437()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3200
     * @tc.name      testFieldsLateInitFour0032
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F438 = new A_F438()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3300
     * @tc.name      testFieldsLateInitFour0033
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F439 = new A_F439()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3400
     * @tc.name      testFieldsLateInitFour0034
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F440 = new A_F440()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3500
     * @tc.name      testFieldsLateInitFour0035
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F441 = new A_F441()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3600
     * @tc.name      testFieldsLateInitFour0036
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F442 = new A_F442()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3700
     * @tc.name      testFieldsLateInitFour0037
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F443 = new A_F443()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3800
     * @tc.name      testFieldsLateInitFour0038
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F444 = new A_F444()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_3900
     * @tc.name      testFieldsLateInitFour0039
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F445 = new A_F445()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_FOUR_4000
     * @tc.name      testFieldsLateInitFour0040
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInitFour0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F446 = new A_F446()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertFalse()
    })
  })
}
