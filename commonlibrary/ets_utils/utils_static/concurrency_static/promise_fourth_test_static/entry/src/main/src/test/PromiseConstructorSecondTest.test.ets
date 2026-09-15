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

class Animal {
  name: string = "animal"
}

class Dog extends Animal {
  breed: string = "dog"
}

interface Result {
  code: number
  message: string
}

interface Response {
  status: number
  data: string
}

interface User {
  id: number
  name: string
}

class CustomPromiseLike<T> implements PromiseLike<T> {
  value: T
  constructor(value: T) { this.value = value }
  then<U, E>(onFulfilled: ((value: T) => U | PromiseLike<U>), onRejected?: ((reason: Error) => E | PromiseLike<E>)): PromiseLike<Awaited<U> | Awaited<E>> {
    if (onFulfilled) { onFulfilled(this.value) }
    return Promise.resolve<T>(this.value) as PromiseLike<Awaited<U> | Awaited<E>>
  }
}

class MyClass {
  value: number = 42
  createPromise(): Promise<number> {
    return new Promise<number>((resolve, reject) => {
      resolve(this.value)
    })
  }
}

export default function BuiltinsPromiseConstructorSecondTest(): void {
  describe('BuiltinsPromiseConstructorSecondTest', (): void => {
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
     * @tc.name   PromiseConstructorSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0100
     * @tc.desc   Verify nested Promise resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        let inner = new Promise<number>((innerResolve) => {
          innerResolve(42)
        })
        inner.then((value) => {
          resolve(value * 2)
        })
      })
      let value = await promise
      expect(value).assertEqual(84)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0200
     * @tc.desc   Verify setTimeout async reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        setTimeout(() => {
          reject(new Error("Async rejection"))
        }, 100)
      })
      let caught: boolean = false
      await promise.catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0300
     * @tc.desc   Verify async operation failure reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        setTimeout(() => {
          let success = false
          if (!success) {
            reject(new Error("Operation failed"))
          } else {
            resolve("success")
          }
        }, 100)
      })
      let caught: boolean = false
      await promise.catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0400
     * @tc.desc   Verify then chain after constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(10)
      })
      let result = await promise
        .then((value) => value + 5)
        .then((value) => value * 2)
      expect(result).assertEqual(30)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0500
     * @tc.desc   Verify catch chain after constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        reject(new Error("Initial error"))
      })
      let result = await promise
        .catch((error) => {
          return "recovered value"
        })
      expect(result).assertEqual("recovered value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0600
     * @tc.desc   Verify finally chain after constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let finallyCalled = false
      let promise = new Promise<string>((resolve, reject) => {
        resolve("success")
      })
      await promise.finally(() => {
        finallyCalled = true
      })
      expect(finallyCalled).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0700
     * @tc.desc   Verify multiple Promise parallel execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        let promise = new Promise<number>((resolve) => {
          resolve(i)
        })
        promises.push(promise)
      }
      let values = await Promise.all(promises)
      expect(values.length).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0800
     * @tc.desc   Verify Promise.all combination
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = new Promise<number>((resolve) => resolve(1))
      let p2 = new Promise<number>((resolve) => resolve(2))
      let p3 = new Promise<number>((resolve) => resolve(3))
      let values = await Promise.all([p1, p2, p3])
      expect(values[0]).assertEqual(1)
      expect(values[1]).assertEqual(2)
      expect(values[2]).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_0900
     * @tc.desc   Verify Promise.race competition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let p1 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("first"), 100)
      })
      let p2 = new Promise<string>((resolve) => {
        setTimeout(() => resolve("second"), 150)
      })
      let value = await Promise.race([p1, p2])
      expect(value).assertEqual("first")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1000
     * @tc.desc   Verify catch continues chain after error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        reject(new Error("Initial error"))
      })
      let result = await promise.catch((error) => {
        return "recovered value"
      })
      expect(result).assertEqual("recovered value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1100
     * @tc.desc   Verify multi-level nested error propagation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let level3 = new Promise<void>((resolve, reject) => {
        reject(new Error("Level 3 error"))
      })
      let level2 = new Promise<void>((resolve, reject) => {
        level3.catch((error) => {
          reject(new Error("Level 2: " + error.message))
        })
      })
      let caught: boolean = false
      await level2.catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1200
     * @tc.desc   Verify Promise<void> resolve with undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        resolve(undefined)
      })
      let resolved = false
      await promise.then(() => {
        resolved = true
      })
      expect(resolved).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1300
     * @tc.desc   Verify Promise<void> reject normally
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        reject(new Error("Void promise error"))
      })
      let caught: boolean = false
      await promise.catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1400
     * @tc.desc   Verify Promise<void> then callback has no parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let callbackExecuted = false
      let promise = new Promise<void>((resolve, reject) => {
        resolve(undefined)
      })
      await promise.then(() => {
        callbackExecuted = true
      })
      expect(callbackExecuted).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1500
     * @tc.desc   Verify resolve with Promise object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let innerPromise = Promise.resolve<string>("inner value")
      let promise = new Promise<string>((resolve, reject) => {
        resolve(innerPromise)
      })
      let value = await promise
      expect(value).assertEqual("inner value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1600
     * @tc.desc   Verify resolve with thenable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenable = new CustomPromiseLike<string>("thenable value")
      let promise = new Promise<string>((resolve, reject) => {
        resolve(thenable)
      })
      let value = await promise
      expect(value).assertEqual("thenable value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1700
     * @tc.desc   Verify resolve with rejected Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let innerPromise = Promise.reject<string>(new Error("Inner rejection"))
      let promise = new Promise<string>((resolve, reject) => {
        resolve(innerPromise)
      })
      let caught: boolean = false
      await promise.catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1800
     * @tc.desc   Verify callback executes synchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let executed = false
      let promise = new Promise<void>((resolve, reject) => {
        executed = true
        resolve(undefined)
      })
      expect(executed).assertTrue()
      await promise
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_1900
     * @tc.desc   Verify callback contains async operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        setTimeout(() => {
          resolve("async result")
        }, 100)
      })
      let value = await promise
      expect(value).assertEqual("async result")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2000
     * @tc.desc   Verify callback with empty function body stays pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let settled = false
      let promise = new Promise<void>(() => {})
      await Promise.race([
        promise.then(() => { settled = true }),
        new Promise<void>((resolve) => { setTimeout(() => resolve(undefined), 100) })
      ])
      expect(settled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2100
     * @tc.desc   Verify callback without resolve/reject stays pending
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let settled = false
      let promise = new Promise<void>((resolve, reject) => {

      })
      await Promise.race([
        promise.then(() => { settled = true }),
        new Promise<void>((resolve) => { setTimeout(() => resolve(undefined), 100) })
      ])
      expect(settled).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2200
     * @tc.desc   Verify executor resolve settles promise with resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let value = await promise
      expect(value).assertEqual(100)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2300
     * @tc.desc   Verify callback using this with arrow function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let obj = new MyClass()
      let value = await obj.createPromise()
      expect(value).assertEqual(42)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2400
     * @tc.desc   Verify callback throw error causes rejected state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve, reject) => {
        throw new Error("Executor threw error")
      })
      let caught: boolean = false
      await promise.catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2500
     * @tc.desc   Verify shared variable counting in Promise callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let totalTasks = 3
      let results: number[] = []
      let p1 = new Promise<number>((resolve) => resolve(1))
      let p2 = new Promise<number>((resolve) => resolve(2))
      let p3 = new Promise<number>((resolve) => resolve(3))
      let waitPromise = new Promise<void>((resolve) => {
        let check = () => {
          if (completedCount === totalTasks) resolve(undefined)
        }
        p1.then((v) => { results.push(v); completedCount++; check() })
        p2.then((v) => { results.push(v); completedCount++; check() })
        p3.then((v) => { results.push(v); completedCount++; check() })
      })
      await waitPromise
      expect(results.length).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2600
     * @tc.desc   Verify counter wait replaces timer wait
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let completedCount = 0
      let totalTasks = 5
      let promises: Promise<void>[] = []
      for (let i = 0; i < totalTasks; i++) {
        let p = new Promise<void>((resolve) => {
          completedCount++
          resolve(undefined)
        })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(completedCount).assertEqual(totalTasks)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2700
     * @tc.desc   Verify two executors resolving independently complete via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let firstResolved = false
      let secondResolved = false
      let p1 = new Promise<void>((resolve) => {
        firstResolved = true
        resolve(undefined)
      })
      let p2 = new Promise<void>((resolve) => {
        secondResolved = true
        resolve(undefined)
      })
      await Promise.all([p1, p2])
      expect(firstResolved && secondResolved).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2800
     * @tc.desc   Verify Promise timeout scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        setTimeout(() => resolve("done"), 100)
      })
      let result = await Promise.race([
        promise,
        new Promise<string>((resolve) => { setTimeout(() => resolve("timeout"), 200) })
      ])
      expect(result).assertEqual("done")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_2900
     * @tc.desc   Verify Promise.all with all resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        let promise = new Promise<number>((resolve) => {
          resolve(i)
        })
        promises.push(promise)
      }
      let values = await Promise.all(promises)
      expect(values.length).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3000
     * @tc.desc   Verify Promise.all with one rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promises: Promise<number>[] = [
        new Promise<number>((resolve) => resolve(1)),
        new Promise<number>((resolve, reject) => reject(new Error("fail"))),
        new Promise<number>((resolve) => resolve(3))
      ]
      let caught: boolean = false
      await Promise.all(promises).catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3100
     * @tc.desc   Verify clearTimeout cancels pending resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let resolved = false
      let promise = new Promise<void>((resolve, reject) => {
        let timerId = setTimeout(() => {
          resolve(undefined)
          resolved = true
        }, 200)
        clearTimeout(timerId)
      })
      await Promise.race([
        promise.then(() => { resolved = true }),
        new Promise<void>((resolve) => { setTimeout(() => resolve(undefined), 300) })
      ])
      expect(resolved).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3200
     * @tc.desc   Verify clearTimeout cancels pending reject
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let rejected = false
      let promise = new Promise<void>((resolve, reject) => {
        let timerId = setTimeout(() => {
          reject(new Error("Should not happen"))
          rejected = true
        }, 200)
        clearTimeout(timerId)
      })
      await Promise.race([
        promise.catch(() => { rejected = true }),
        new Promise<void>((resolve) => { setTimeout(() => resolve(undefined), 300) })
      ])
      expect(rejected).assertFalse()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3300
     * @tc.desc   Verify explicit generic type parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseConstructorSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let promise: Promise<number> = new Promise<number>((resolve, reject) => {
        resolve(100)
      })
      let value = await promise
      expect((value instanceof number)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3400
     * @tc.desc   Verify generic type inference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string>((resolve, reject) => {
        resolve("inferred string")
      })
      let value = await promise
      expect((value instanceof string)).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3500
     * @tc.desc   Verify generic type with constraint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<Result>((resolve, reject) => {
        let r: Result = { code: 200, message: "success" }
        resolve(r)
      })
      let value = await promise
      expect(value.code).assertEqual(200)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3600
     * @tc.desc   Verify Promise with union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string|number>((resolve, reject) => {
        resolve("string value")
      })
      let value = await promise
      expect(value instanceof string).assertTrue()
      expect(value).assertEqual("string value")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3700
     * @tc.desc   Verify subtype assignment compatibility
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let dogPromise = new Promise<Dog>((resolve) => {
        resolve(new Dog())
      })
      let animalPromise: Promise<Animal> = dogPromise
      let value = await animalPromise
      expect(value instanceof Animal).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3800
     * @tc.desc   Verify Promise covariance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let getAnimalPromise: () => Promise<Animal> = (): Promise<Animal> => {
        return new Promise<Dog>((resolve) => {
          resolve(new Dog());
        });
      };
      let value = await getAnimalPromise()
      expect(value instanceof Animal).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_3900
     * @tc.desc   Verify instanceof type guard in then callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<string|number>((resolve) => {
        resolve("value")
      })
      let result = ""
      await promise.then((value) => {
        if ((value instanceof string)) {
          result = "string"
        } else {
          result = "number"
        }
      })
      expect(result).assertEqual("string")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4000
     * @tc.desc   Verify instanceof type guard in catch callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let promise = new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
        reject(new CustomError("custom error"))
      })
      await promise.catch((error: Error) => {
        expect(error instanceof CustomError).assertTrue()
      })
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4100
     * @tc.desc   Verify simulated successful network request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let mockFetch: () => Promise<Response> = (): Promise<Response> => {
        return new Promise<Response>((resolve, reject) => {
          resolve({ status: 200, data: "success data" });
        });
      };
      let response = await mockFetch()
      expect(response.status).assertEqual(200)
      expect(response.data).assertEqual("success data")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4200
     * @tc.desc   Verify simulated failed network request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let mockFetchError: () => Promise<string> = (): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          reject(new Error("Network error"));
        });
      };
      let caught: boolean = false
      await mockFetchError().catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4300
     * @tc.desc   Verify simulated timeout network request
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let fetchWithTimeout = (): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          setTimeout(() => {
            reject(new Error("Request timeout"));
          }, 100);
        });
      };
      let caught: boolean = false
      await fetchWithTimeout().catch((error) => {
        caught = true
      })
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4400
     * @tc.desc   Verify simulated file read
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let readFile: (path: string) => Promise<string> = (path: string): Promise<string> => {
        return new Promise<string>((resolve, reject) => {
          if (path.endsWith(".txt")) {
            resolve("file content");
          } else {
            reject(new Error("Unsupported file type"));
          }
        });
      };
      let content = await readFile("test.txt")
      expect(content).assertEqual("file content")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4500
     * @tc.desc   Verify simulated file write
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let writeFile: (path: string, content: string) => Promise<void> =
        (path: string, content: string): Promise<void> => {
          return new Promise<void>((resolve, reject) => {
            resolve(undefined);
          });
        };
      let written = false
      await writeFile("test.txt", "hello").then(() => {
        written = true
      })
      expect(written).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4600
     * @tc.desc   Verify simulated database query
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let queryUser: (id: number) => Promise<User> = (id: number): Promise<User> => {
        return new Promise<User>((resolve, reject) => {
          if (id > 0) {
            resolve({ id: id, name: "User" + id });
          } else {
            reject(new Error("Invalid user id"));
          }
        });
      };
      let user = await queryUser(1)
      expect(user.id).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4700
     * @tc.desc   Verify simulated database transaction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let transaction: (success: boolean) => Promise<void> = (success: boolean): Promise<void> => {
        return new Promise<void>((resolve, reject) => {
          if (success) {
            resolve(undefined);
          } else {
            reject(new Error("Transaction failed"));
          }
        });
      };
      let success = false
      await transaction(true).then(() => {
        success = true
      })
      expect(success).assertTrue()
      await transaction(false).catch((error) => {
        expect(error instanceof Error).assertTrue();
        return "caught";
      })
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4800
     * @tc.desc   Verify Promise.then callback nested new Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result = await Promise.resolve(10).then<number>((v) => {
        return new Promise<number>((resolve, reject) => {
          resolve(v + 5)
        })
      })
      expect(result).assertEqual(15)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_4900
     * @tc.desc   Verify 3 concurrent Promise tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 3; i++) {
        let p = new Promise<void>((resolve, reject) => {
          counter++
          resolve(undefined)
        })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(counter).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5000
     * @tc.desc   Verify 5 concurrent Promise tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 5; i++) {
        let p = new Promise<void>((resolve, reject) => {
          counter++
          resolve(undefined)
        })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(counter).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5100
     * @tc.desc   Verify 10 concurrent Promise tasks with counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let counter = 0
      let promises: Promise<void>[] = []
      for (let i = 0; i < 10; i++) {
        let p = new Promise<void>((resolve, reject) => {
          counter++
          resolve(undefined)
        })
        promises.push(p)
      }
      await Promise.all(promises)
      expect(counter).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5200
     * @tc.desc   Verify three Promise executors complete via Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = 0
      let p1 = new Promise<void>((resolve) => {
        processedCount++
        resolve(undefined)
      })
      let p2 = new Promise<void>((resolve) => {
        processedCount++
        resolve(undefined)
      })
      let p3 = new Promise<void>((resolve) => {
        processedCount++
        resolve(undefined)
      })
      await Promise.all([p1, p2, p3])
      expect(processedCount).assertEqual(3)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5300
     * @tc.desc   Verify then callback shared variable counting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseConstructorSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let sharedValue = 0
      let promises: Promise<void>[] = [
        new Promise<number>((r) => r(10)).then((v) => { sharedValue += v }),
        new Promise<number>((r) => r(20)).then((v) => { sharedValue += v }),
        new Promise<number>((r) => r(30)).then((v) => { sharedValue += v })
      ]
      await Promise.all(promises)
      expect(sharedValue).assertEqual(60)
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5400
     * @tc.desc   Verify Promise constructor then chain maps and prefixes value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await new Promise<string>((resolve) => resolve("hello"))
        .then((value) => value.toUpperCase())
        .then((value) => "processed: " + value)
      expect(result).assertEqual("processed: HELLO")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5500
     * @tc.desc   Verify Promise.catch recovers from rejection with returned value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result = await Promise.reject<string>(new Error("handler error"))
        .catch((error) => {
          return "recovered: test"
        })
      expect(result).assertEqual("recovered: test")
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5600
     * @tc.desc   Verify EAWorker.run callback nested Promise.then
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('testWorker')
      eaWorker.start()
      try {

        let job = eaWorker.run<int>(() => {
          return 42
        })
        let baseValue = job.Await()

        let result = await new Promise<number>((resolve: (value: number) => void) => { resolve(baseValue) })
          .then<number>((value: number) => value + 8)
          .then<number>((value: number) => value * 2)
        expect(result).assertEqual(100)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5700
     * @tc.desc   Verify EAWorker.run callback nested Promise.catch recovery
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('testWorker')
      eaWorker.start()
      try {

        let job = eaWorker.run<int>(() => {
          return 100
        })
        let workerResult = job.Await()

        let result = await Promise.reject<number>(new Error("eaWorker error"))
          .catch<number>((error: Error) => {
            return workerResult
          })
        expect(result).assertEqual(100)
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5800
     * @tc.desc   Verify EAWorker.run result resolves through wrapped Promise and then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('testWorker')
      eaWorker.start()
      try {
        let cleanupExecuted = false

        let job = eaWorker.run<int>(() => {
          return 42
        })
        let baseValue = job.Await()

        let result = await new Promise<number>((resolve: (value: number) => void) => { resolve(baseValue) })
          .then<number>((v: number) => { cleanupExecuted = true; return v })
        expect(result).assertEqual(42)
        expect(cleanupExecuted).assertTrue()
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_5900
     * @tc.desc   Verify EAWorker.run message resolves through Promise.then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgWorker')
      eaWorker.start()
      try {

        let job = eaWorker.run<string>((msg: string): string => {
          return msg
        }, "hello")
        let baseValue = job.Await()

        let result = await new Promise<string>((resolve: (value: string) => void) => { resolve(baseValue) })
          .then<string>((value: string) => value.toUpperCase())
          .then<string>((value: string) => "processed: " + value)
        expect(result).assertEqual("processed: HELLO")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_6000
     * @tc.desc   Verify EAWorker.run recovery value used in Promise.catch
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('msgWorker')
      eaWorker.start()
      try {

        let job = eaWorker.run<string>((msg: string): string => {
          return "recovered: " + msg
        }, "test")
        let workerResult = job.Await()

        let result = await Promise.reject<string>(new Error("handler error"))
          .catch<string>((error: Error) => workerResult)
        expect(result).assertEqual("recovered: test")
      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_6100
     * @tc.desc   Verify EAWorker.run computes int result with multiplier argument
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let eaWorker = new EAWorker('constructorWorker')
      eaWorker.start()
      try {

        let job = eaWorker.run<int>((data: int): int => {
          return data * 3
        }, 10)

        let result = job.Await()
        expect(result).assertEqual(30)

      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

    /**
     * @tc.name   PromiseConstructorSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_CONSTRUCTOR_SECOND_TEST_6200
     * @tc.desc   Verify EAWorker.run sums three int message arguments
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseConstructorSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let processedCount = new AtomicInt(0)
      let eaWorker = new EAWorker('msgConstructorWorker')
      eaWorker.start()
      try {

        let job = eaWorker.run<int>((a: int, b: int, c: int): int => {
          return a + b + c
        }, 1, 2, 3)
        let workerResult = job.Await()
        processedCount.fetchAdd(workerResult)
        expect(processedCount.load()).assertEqual(6)

      } finally {
        eaWorker.join().Await()
      }
      Done();
    })

  })
}
