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

class A_F406 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 5
  }
}

class A_F407 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 5
  }
}

class A_F408 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 7.3
  }
}

class A_F409 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = "abc"
  }
}

class A_F410 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 5
  }
}

class A_F411 {
  private _field!: long
  get field(): long {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 5
  }
}

class A_F412 {
  private _field!: int
  get field(): int {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 5
  }
}

class A_F413 {
  private _field!: double
  get field(): double {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 7.3
  }
}

class A_F414 {
  private _field!: string
  get field(): string {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = "abc"
  }
}

class A_F415 {
  private _field!: Object
  get field(): Object {
    return this._field
  }
  constructor (...args: Any[]) {
    this._field = 5
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

export default function FieldsLateInitTestFour(): void {
  describe("FieldsLateInitTestFour", () => {
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
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0397
     * @tc.name      testFieldsLateInit0397
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0397", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F397 = new A_F397()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0398
     * @tc.name      testFieldsLateInit0398
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0398", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F398 = new A_F398()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0399
     * @tc.name      testFieldsLateInit0399
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0399", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F399 = new A_F399()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0400
     * @tc.name      testFieldsLateInit0400
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F400 = new A_F400()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0401
     * @tc.name      testFieldsLateInit0401
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0401", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F401 = new A_F401()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0402
     * @tc.name      testFieldsLateInit0402
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0402", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F402 = new A_F402()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0403
     * @tc.name      testFieldsLateInit0403
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0403", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F403 = new A_F403()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0404
     * @tc.name      testFieldsLateInit0404
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0404", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F404 = new A_F404()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0405
     * @tc.name      testFieldsLateInit0405
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0405", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F405 = new A_F405()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0406
     * @tc.name      testFieldsLateInit0406
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0406", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F406 = new A_F406()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0407
     * @tc.name      testFieldsLateInit0407
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0407", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F407 = new A_F407()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0408
     * @tc.name      testFieldsLateInit0408
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0408", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F408 = new A_F408()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0409
     * @tc.name      testFieldsLateInit0409
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0409", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F409 = new A_F409()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0410
     * @tc.name      testFieldsLateInit0410
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F410 = new A_F410()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0411
     * @tc.name      testFieldsLateInit0411
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0411", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F411 = new A_F411()
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0412
     * @tc.name      testFieldsLateInit0412
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0412", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F412 = new A_F412()
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0413
     * @tc.name      testFieldsLateInit0413
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0413", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F413 = new A_F413()
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(7.3)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0414
     * @tc.name      testFieldsLateInit0414
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0414", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F414 = new A_F414()
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0415
     * @tc.name      testFieldsLateInit0415
     * @tc.desc      Checking for initialization from constructor with private access modifier.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0415", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F415 = new A_F415()
        expect(a.field instanceof Object).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0416
     * @tc.name      testFieldsLateInit0416
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0416", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F416 = new A_F416()
        a.field = 4
        expect(a.field instanceof long).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0417
     * @tc.name      testFieldsLateInit0417
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0417", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F417 = new A_F417()
        a.field = 4
        expect(a.field instanceof int).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0418
     * @tc.name      testFieldsLateInit0418
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0418", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F418 = new A_F418()
        a.field = 4
        expect(a.field instanceof double).assertTrue()
        expect(a.field).assertEqual(5)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0419
     * @tc.name      testFieldsLateInit0419
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0419", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F419 = new A_F419()
        a.field = 4n
        expect(a.field instanceof bigint).assertTrue()
        expect(a.field).assertEqual(5n)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0420
     * @tc.name      testFieldsLateInit0420
     * @tc.desc      Checking for initialization from outside of constructor with private access
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0420", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F420 = new A_F420()
        a.field = "ab"
        expect(a.field instanceof string).assertTrue()
        expect(a.field).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0421
     * @tc.name      testFieldsLateInit0421
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0421", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F421 = new A_F421()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof long).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0422
     * @tc.name      testFieldsLateInit0422
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0422", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F422 = new A_F422()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof int).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0423
     * @tc.name      testFieldsLateInit0423
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0423", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F423 = new A_F423()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof byte).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0424
     * @tc.name      testFieldsLateInit0424
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0424", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F424 = new A_F424()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof short).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0425
     * @tc.name      testFieldsLateInit0425
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0425", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F425 = new A_F425()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof double).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0426
     * @tc.name      testFieldsLateInit0426
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0426", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F426 = new A_F426()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof number).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0427
     * @tc.name      testFieldsLateInit0427
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0427", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F427 = new A_F427()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof float).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0428
     * @tc.name      testFieldsLateInit0428
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0428", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F428 = new A_F428()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof bigint).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0429
     * @tc.name      testFieldsLateInit0429
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0429", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F429 = new A_F429()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof string).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0430
     * @tc.name      testFieldsLateInit0430
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0430", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F430 = new A_F430()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof char).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0431
     * @tc.name      testFieldsLateInit0431
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0431", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F431 = new A_F431()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof boolean).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0432
     * @tc.name      testFieldsLateInit0432
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0432", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F432 = new A_F432()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof Object).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0433
     * @tc.name      testFieldsLateInit0433
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0433", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F433 = new A_F433()
        let expectedError = (e: Error): boolean => {
            return (e instanceof Error)
        }
        arktest.expectThrow(() => {
      expect(a.field instanceof C_F433).assertTrue()
        }, expectedError)
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0434
     * @tc.name      testFieldsLateInit0434
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0434", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F434 = new A_F434()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0435
     * @tc.name      testFieldsLateInit0435
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0435", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F435 = new A_F435()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0436
     * @tc.name      testFieldsLateInit0436
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0436", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F436 = new A_F436()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0437
     * @tc.name      testFieldsLateInit0437
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0437", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F437 = new A_F437()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0438
     * @tc.name      testFieldsLateInit0438
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0438", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F438 = new A_F438()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0439
     * @tc.name      testFieldsLateInit0439
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0439", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F439 = new A_F439()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0440
     * @tc.name      testFieldsLateInit0440
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0440", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F440 = new A_F440()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0441
     * @tc.name      testFieldsLateInit0441
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0441", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F441 = new A_F441()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0442
     * @tc.name      testFieldsLateInit0442
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0442", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F442 = new A_F442()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0443
     * @tc.name      testFieldsLateInit0443
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0443", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F443 = new A_F443()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0444
     * @tc.name      testFieldsLateInit0444
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0444", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F444 = new A_F444()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0445
     * @tc.name      testFieldsLateInit0445
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0445", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F445 = new A_F445()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })

    /**
     * @tc.number    SUB_FIELDS_LATE_INIT_TEST_0446
     * @tc.name      testFieldsLateInit0446
     * @tc.desc      As all other fields, a field with late initialization must be initialized before
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFieldsLateInit0446", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: A_F446 = new A_F446()
        expect(a.res).assertFalse()
        waitForCompletion(a.foo)
        expect(a.res).assertTrue()
    })
  })
}
