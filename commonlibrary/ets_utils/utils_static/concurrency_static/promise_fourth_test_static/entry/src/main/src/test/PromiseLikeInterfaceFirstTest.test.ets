'use static'
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';

class CustomError extends Error {
  constructor(message: string) {
    super(message)
    this.name = "CustomError"
  }
}

interface Result { id: number; name: string }
interface User { id: number; name: string }
interface User2 { id: number; name: string }

export default function BuiltinsPromiseLikeInterfaceFirstTest(): void {
  describe('BuiltinsPromiseLikeInterfaceFirstTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach((): void => {

      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Required by XTS describe completeness; no per-case cleanup for this suite.
    })
    afterAll((): void => {
      // Required by XTS describe completeness; no suite-level cleanup for this suite.
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0100
     * @tc.desc   Only pass onFulfilled parameter, onRejected omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((value: string) => {
        return value + " world"
      })
      let val = await result
      expect(val).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0200
     * @tc.desc   Pass both onFulfilled and onRejected parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then(
        (value: string) => value + " world",
        (error: Error) => { expect(error instanceof Error).assertTrue(); return "caught" }
      )
      let val = await result
      expect(val).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0300
     * @tc.desc   onFulfilled uses regular function declaration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("test")
      let handleFulfilled: (value: string) => string = (value: string): string => {
        return value.toUpperCase();
      };
      let result = promiseLike.then(handleFulfilled)
      let val = await result
      expect(val).assertEqual("TEST")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0400
     * @tc.desc   onFulfilled uses arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(100)
      let result = promiseLike.then((value: number) => value * 2)
      let val = await result
      expect(val).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0500
     * @tc.desc   onFulfilled uses async function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let asyncHandler: (value: string) => Promise<string> = async (value: string): Promise<string> => {
        return value + " async";
      };
      let result = promiseLike.then(asyncHandler)
      let val = await result
      expect(val).assertEqual("hello async")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0600
     * @tc.desc   onFulfilled returns normal value U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(10)
      let result = promiseLike.then((value: number) => value + 5)
      let val = await result
      expect(val).assertEqual(15)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0700
     * @tc.desc   onFulfilled returns PromiseLike<U>
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((value: string) => {
        return Promise.resolve<string>(value + " world")
      })
      let val = await result
      expect(val).assertEqual("hello world")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0800
     * @tc.desc   onFulfilled returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("test")
      let result = promiseLike.then((_value: string) => null)
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_0900
     * @tc.desc   onFulfilled returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("test")
      let result = promiseLike.then((_value: string) => undefined)
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1000
     * @tc.desc   onFulfilled has no explicit return value (void)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("test")
      let result = promiseLike.then((_value: string) => {
        return
      })
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1100
     * @tc.desc   onFulfilled returns object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promiseLike: PromiseLike<number> = Promise.resolve<number>(1)
      let result = promiseLike.then((value: number): Result => {
        return { id: value, name: "test" }
      })
      let val = await result
      expect(val.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1200
     * @tc.desc   onFulfilled returns array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(5)
      let result = promiseLike.then((value: number): number[] => {
        return [value]
      })
      let val = await result
      expect(val.length).assertEqual(1)
      expect(val[0]).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1300
     * @tc.desc   onFulfilled returns union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(10)
      let result = promiseLike.then((value: number): string | number => {
        return value > 5 ? "big" : value
      })
      let val = await result
      expect(val).assertEqual("big")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1400
     * @tc.desc   onFulfilled receives normal resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((value: string) => {
        expect(value).assertEqual("hello")
        return value
      })
      let val = await result
      expect(val).assertEqual("hello")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1500
     * @tc.desc   value is empty string ""
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("")
      let result = promiseLike.then((value: string) => {
        expect(value).assertEqual("")
        return value
      })
      let val = await result
      expect(val).assertEqual("")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1600
     * @tc.desc   value is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string | null> = Promise.resolve<string | null>(null)
      let result = promiseLike.then((value: string | null) => {
        expect(value).assertNull()
        return value
      })
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1700
     * @tc.desc   value is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string | undefined> = Promise.resolve<string | undefined>(undefined)
      let result = promiseLike.then((value: string | undefined) => {
        expect(value).assertUndefined()
        return value
      })
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1800
     * @tc.desc   value is number 100 literal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(100)
      let result = promiseLike.then((value: number) => {
        expect(value).assertEqual(100)
        return value
      })
      let val = await result
      expect(val).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_1900
     * @tc.desc   value is Number.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(Number.MAX_VALUE)
      let result = promiseLike.then((value: number) => {
        expect(value).assertEqual(Number.MAX_VALUE)
        return value
      })
      let val = await result
      expect(val).assertEqual(Number.MAX_VALUE)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2000
     * @tc.desc   value is zero number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(0)
      let result = promiseLike.then((value: number) => {
        expect(value).assertEqual(0)
        return value
      })
      let val = await result
      expect(val).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2100
     * @tc.desc   value is negative number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(-1)
      let result = promiseLike.then((value: number) => {
        expect(value).assertEqual(-1)
        return value
      })
      let val = await result
      expect(val).assertEqual(-1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2200
     * @tc.desc   value is boolean true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<boolean> = Promise.resolve<boolean>(true)
      let result = promiseLike.then((value: boolean) => {
        expect(value).assertTrue()
        return value
      })
      let val = await result
      expect(val).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2300
     * @tc.desc   value is boolean false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<boolean> = Promise.resolve<boolean>(false)
      let result = promiseLike.then((value: boolean) => {
        expect(value).assertFalse()
        return value
      })
      let val = await result
      expect(val).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2400
     * @tc.desc   value is User object with fields
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let user: User = { id: 1, name: "test" }
      let promiseLike: PromiseLike<User> = Promise.resolve<User>(user)
      let result = promiseLike.then((value: User) => {
        expect(value.id).assertEqual(1)
        expect(value.name).assertEqual("test")
        return value
      })
      let val = await result
      expect(val.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2500
     * @tc.desc   value is number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number[]> = Promise.resolve<number[]>([1, 2, 3])
      let result = promiseLike.then((value: number[]) => {
        expect(value.length).assertEqual(3)
        return value
      })
      let val = await result
      expect(val.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2600
     * @tc.desc   onRejected returns recovered string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("test error"))
      let handleRejected: (error: Error) => string = (error: Error): string => {
        return "recovered";
      };
      let result = promiseLike.then((value: string) => value)
        .catch(handleRejected)
      let val = await result
      expect(val).assertContain("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2700
     * @tc.desc   onRejected returns fallback number -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.reject<number>(new Error("error"))
      let result = promiseLike.then((value: number) => value)
        .catch((_error: Error) => -1)
      let val = await result
      expect(val).assertEqual(-1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2800
     * @tc.desc   onRejected async handler returns recovered string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("test"))
      let asyncErrorHandler: (error: Error) => Promise<string> = async (error: Error): Promise<string> => {
        return "async recovered";
      };
      let result = promiseLike.then((value: string) => value)
        .catch(asyncErrorHandler)
      let val = await result
      expect(val).assertContain("async recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_2900
     * @tc.desc   onRejected returns resolved Promise recovery value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("test"))
      let result = promiseLike.then((value: string) => value)
        .catch((error: Error) => {
          expect(error instanceof Error).assertTrue()
          return Promise.resolve<string>("recovered")
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3000
     * @tc.desc   onRejected returns null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("error"))
      let result = promiseLike.then((value: string) => value)
        .catch((_error: Error) => null)
      let val = await result
      expect(val).assertNull()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3100
     * @tc.desc   onRejected returns undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("error"))
      let result = promiseLike.then((value: string) => value)
        .catch((_error: Error) => undefined)
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3200
     * @tc.desc   Verify PromiseLike catch with void return yields undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("error"))
      let result = promiseLike.then((value: string) => value)
        .catch((_error: Error) => {
          return
        })
      let val = await result
      expect(val).assertUndefined()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3300
     * @tc.desc   Verify PromiseLike catch recovers rejected Error to string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseLikeInterfaceFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let error = new Error("test error")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(error)
      let result = promiseLike.then((value: string) => value)
        .catch((err: Error) => {
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3400
     * @tc.desc   onRejected recovers from CustomError rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let customError = new CustomError("custom error")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(customError)
      let result = promiseLike.then((value: string) => value)
        .catch((err: Error) => {
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3500
     * @tc.desc   onRejected verifies TypeError instance and returns fallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let typeError = new TypeError("type error")
      let promiseLike: PromiseLike<number> = Promise.reject<number>(typeError)
      let result = promiseLike.then((value: number) => value)
        .catch((err: Error) => {
          expect(err instanceof TypeError).assertTrue()
          return -1
        })
      let val = await result
      expect(val).assertEqual(-1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3600
     * @tc.desc   onRejected recovers from special-character Error message
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("错误:测试<script>alert(1)</script>")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(error)
      let result = promiseLike.then((value: string) => value)
        .catch((err: Error) => {
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3700
     * @tc.desc   onRejected recovers from empty-message Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(error)
      let result = promiseLike.then((value: string) => value)
        .catch((err: Error) => {
          expect(err instanceof Error).assertTrue()
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3800
     * @tc.desc   onRejected recovers from Error and returns string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let error = new Error("test")
      let promiseLike: PromiseLike<string> = Promise.reject<string>(error)
      let result = promiseLike.then((value: string) => value)
        .catch((err: Error) => {
          expect(err instanceof Error).assertTrue()
          return "recovered"
        })
      let val = await result
      expect(val).assertEqual("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_3900
     * @tc.desc   onFulfilled throws exception internally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("hello")
      let result = promiseLike.then((value: string) => {
        throw new Error("error in onFulfilled")
      })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_4000
     * @tc.desc   onRejected throws exception internally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("original error"))
      let result = promiseLike.then((value: string) => value)
        .catch((error: Error) => {
          expect(error instanceof Error).assertTrue()
          throw new Error("error in onRejected")
        })
      let caught: boolean = false
      try {
        await result
        expect().assertFail()
      } catch (error) {
        caught = true
        expect(error instanceof Error).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_4100
     * @tc.desc   then maps string to number with explicit generic U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.resolve<string>("123")
      let result = promiseLike.then<number>((value: string) => parseInt(value))
      let val = await result
      expect(val).assertEqual(123)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_4200
     * @tc.desc   Explicitly specify generic U type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<string> = Promise.reject<string>(new Error("error"))
      let result = promiseLike.then<string>((value: string) => value)
        .catch((error: Error) => { expect(error instanceof Error).assertTrue(); return "recovered" })
      let val = await result
      expect(val).assertContain("recovered")
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_4300
     * @tc.desc   then maps number to User2 object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      let promiseLike: PromiseLike<number> = Promise.resolve<number>(1)
      let result = promiseLike.then<User2>((value: number) => ({ id: value, name: "test" }))
      let val = await result
      expect(val.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseLikeInterfaceFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_LIKE_INTERFACE_FIRST_TEST_4400
     * @tc.desc   then maps value to single-element number array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseLikeInterfaceFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promiseLike: PromiseLike<number> = Promise.resolve<number>(5)
      let result = promiseLike.then<number[]>((value: number): number[] => [value])
      let val = await result
      expect(val.length).assertEqual(1)
      Done();
    })
  })
}
