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

interface NestedDataLevel3 {
  value: string;
}
interface NestedDataLevel2 {
  level3: NestedDataLevel3;
}
interface NestedDataLevel1 {
  level2: NestedDataLevel2;
}
interface NestedData {
  level1: NestedDataLevel1;
}
interface DataItem {
  id: number;
  name: string;
}
interface SharedState {
  value: number;
}
interface InvalidObj {
  invalid: boolean;
}

class TaggedError extends Error {
  readonly tag: string;
  constructor(tag: string) {
    super(tag);
    this.tag = tag;
  }
}

class ThrowThenable<T> implements PromiseLike<T> {
  private reason: TaggedError;
  constructor(reason: TaggedError) {
    this.reason = reason;
  }
  then<U, E>(onFulfilled: ((p1: T) => U | PromiseLike<U>), onRejected: (((p1: Error) => E | PromiseLike<E>)) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    throw this.reason;
  }
}
class SharedCounter {
  count: number = 0;

  getCount(): number {
    return this.count;
  }

  increment(): void {
    this.count++;
  }
}
class ErrorIterable<T> implements Iterable<T> {
  private reason: TaggedError;
  constructor(reason: TaggedError) {
    this.reason = reason;
  }
  [Symbol.iterator](): Iterator<T> {
    throw this.reason;
  }
}
class ErrorIterable2 implements Iterable<Promise<string>> {
  private reason: TaggedError;
  constructor(reason: TaggedError) {
    this.reason = reason;
  }
  [Symbol.iterator](): Iterator<Promise<string>> {
    throw this.reason;
  }
}
class IteratorErrorIterable implements Iterable<never> {
  private reason: TaggedError;
  constructor(reason: TaggedError) {
    this.reason = reason;
  }
  [Symbol.iterator](): Iterator<never> {
    throw this.reason;
  }
}
class PromisePairIterable implements Iterable<Promise<int>> {
  private values: Promise<int>[] = [Promise.resolve<int>(1), Promise.resolve<int>(2)]
  $_iterator(): IterableIterator<Promise<int>> {
    return this.values.$_iterator()
  }
}

export default function BuiltinsPromiseAllSecondTest(): void {
  describe('BuiltinsPromiseAllSecondTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {

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
     * @tc.name   PromiseAllSecondTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0100
     * @tc.desc   Verify Promise.all with all null array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: null[] = [null, null, null];
      const result = await Promise.all<null>(promises);
      expect(result).assertDeepEquals([null, null, null]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0200
     * @tc.desc   Verify Promise.all with string | null | undefined union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<string | null | undefined> | string | null | undefined)[] = [
        Promise.resolve("a"),
        Promise.resolve(null),
        Promise.resolve(undefined),
        "b",
        null,
        undefined
      ];
      const result = await Promise.all<string | null | undefined>(promises);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual(undefined);
      expect(result[3]).assertEqual("b");
      expect(result[4]).assertEqual(null);
      expect(result[5]).assertEqual(undefined);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0300
     * @tc.desc   Verify Promise.all with thenable that returns Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<string> = Promise.resolve<string>("nested promise");
      const promises: PromiseLike<string>[] = [thenable];
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["nested promise"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0400
     * @tc.desc   Verify Promise.all with Awaited type and union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string | int>[] = [
        Promise.resolve("hello"),
        Promise.resolve(42)
      ];
      const result = await Promise.all<string | int>(promises);
      expect(typeof result[0]).assertEqual("string");
       expect(typeof result[1]).assertEqual("int");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0500
     * @tc.desc   Verify Promise.all with an array of mixed int and Promise values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const fixedArray: (Promise<int> | int)[] = [
        Promise.resolve(1),
        2,
        Promise.resolve(3)
      ];
      const result = await Promise.all<int>(fixedArray);
      expect(result.length).assertEqual(3);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0600
     * @tc.desc   Verify Promise.all awaits promise whose timer is cancelled by clearTimeout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      // The timer callback is cancelled by clearTimeout before it can fire; the
      // promise is resolved manually and awaited through Promise.all.
      let executed = false;
      let resolvePromise: (value: number) => void = (_v: number) => {};
      const timerId = setTimeout(() => {
        executed = true;
        resolvePromise(1);
        return;
      }, 1000);

      const promise = new Promise<number>((resolve: (value: number) => void) => {
        resolvePromise = resolve;
      });

      clearTimeout(timerId);
      resolvePromise(5);
      const result = await Promise.all<number>([promise]);
      expect(result).assertDeepEquals([5.0]);
      expect(executed).assertFalse();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0700
     * @tc.desc   Verify Promise.all with 3 concurrent tasks increments shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 3; i++) {
        promises.push(Promise.resolve<void>(undefined).then<void>(() => {
          counter++;
        }));
      }

      await Promise.all<void>(promises)
      expect(counter).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   PromiseAllSecondTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0800
     * @tc.desc   Verify Promise.all with 5 concurrent tasks increments shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 5; i++) {
        promises.push(Promise.resolve<void>(undefined).then<void>(() => {
          counter++;
        }));
      }

      await Promise.all<void>(promises)
      expect(counter).assertEqual(5)
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_0900
     * @tc.desc   Verify Promise.all with 10 concurrent tasks increments shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve<void>(undefined).then<void>(() => {
          counter++;
        }));
      }

      await Promise.all<void>(promises)
      expect(counter).assertEqual(10)
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1000
     * @tc.desc   Verify Promise.all preserves the rejected Error identity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const reason = new TaggedError("partial-error");
      let caught: boolean = false
      try {
        await Promise.all([Promise.reject(reason)]);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1100
     * @tc.desc   Verify Promise.all with timer interval >= 100ms
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const promise1 = new Promise<string>((resolve: (value: string) => void) => { setTimeout(() => resolve("first"), 100); });
      const promise2 = new Promise<string>((resolve: (value: string) => void) => { setTimeout(() => resolve("second"), 100); });

      const result = await Promise.all([promise1, promise2]);
      expect(result).assertDeepEquals(["first", "second"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1200
     * @tc.desc   Verify Promise.all with undefined array element handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<int | undefined> | undefined)[] = [
        Promise.resolve(1),
        undefined,
        Promise.resolve(3)
      ];
      const result = await Promise.all<int | undefined>(promises);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1300
     * @tc.desc   Verify Promise.all with null array element handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<string | null> | null)[] = [
        Promise.resolve("a"),
        null,
        Promise.resolve("c")
      ];
      const result = await Promise.all<string | null>(promises);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual("c");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1400
     * @tc.desc   Verify Promise.all with deeply nested Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const nestedPromise: Promise<string> = Promise.resolve("nested");
      const promises: Promise<string>[] = [nestedPromise];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("nested");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1500
     * @tc.desc   Verify Promise.all with deeply nested Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const level1 = await Promise.all([
        Promise.all([Promise.resolve(1), Promise.resolve(2)]),
        Promise.all([Promise.resolve(3), Promise.resolve(4)])
      ]);
      expect(level1[0]).assertDeepEquals([1, 2]);
      expect(level1[1]).assertDeepEquals([3, 4]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1600
     * @tc.desc   Verify Promise.all with 100 elements array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const count = 100;
      const promises: Promise<int>[] = [];
      for (let i = 0; i < count; i++) { promises.push(Promise.resolve(i)); }
      const result = await Promise.all<int>(promises);
      expect(result.length).assertEqual(count);
      expect(result[0]).assertEqual(0);
      expect(result[count - 1]).assertEqual(count - 1);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1700
     * @tc.desc   Verify Promise.all with single element return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<int>([Promise.resolve(42)]);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1800
     * @tc.desc   Verify Promise.all with mixed completion order maintaining result order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const promises: Promise<int>[] = [
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => resolve(1), 300);
        }),
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => resolve(2), 100);
        }),
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => resolve(3), 200);
        })
      ];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_1900
     * @tc.desc   Verify Promise.all with thenable interface implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<string> = Promise.resolve<string>("thenable result");
      const promises: PromiseLike<string>[] = [thenable, Promise.resolve("promise result")];
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["thenable result", "promise result"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2000
     * @tc.desc   Verify Promise.all with void type array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = [
        Promise.resolve<void>(undefined),
        Promise.resolve<void>(undefined)
      ];
      const result = await Promise.all<void>(promises);
      expect(result.length).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2100
     * @tc.desc   Verify Promise.all with never type empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<never>([]);
      expect(result.length).assertEqual(0);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2200
     * @tc.desc   Verify Promise.all with zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(0)];
      const result = await Promise.all<int>(promises);
      expect(result[0]).assertEqual(0);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2300
     * @tc.desc   Verify Promise.all with negative Infinity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(-Infinity)];
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(-Infinity);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2400
     * @tc.desc   Verify Promise.all with NaN value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(NaN)];
      const result = await Promise.all<number>(promises);
      expect(Number.isNaN(result[0])).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2500
     * @tc.desc   Verify Promise.all with max safe integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(Number.MAX_SAFE_INTEGER)];
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(Number.MAX_SAFE_INTEGER);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2600
     * @tc.desc   Verify Promise.all with min safe integer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(Number.MIN_SAFE_INTEGER)];
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(Number.MIN_SAFE_INTEGER);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2700
     * @tc.desc   Verify Promise.all with empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve("")];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2800
     * @tc.desc   Verify Promise.all with false boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(false)];
      const result = await Promise.all<boolean>(promises);
      expect(result[0]).assertFalse();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_2900
     * @tc.desc   Verify Promise.all with true boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = [Promise.resolve(true)];
      const result = await Promise.all<boolean>(promises);
      expect(result[0]).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3000
     * @tc.desc   Verify Promise.all with empty object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const obj: Record<string, number> = {};
      const promises: Promise<Record<string, number>>[] = [Promise.resolve<Record<string, number>>(obj)];
      const result = await Promise.all<Record<string, number>>(promises);
      expect(result[0]).assertDeepEquals(obj);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3100
     * @tc.desc   Verify Promise.all with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number[]>[] = [Promise.resolve<number[]>([])];
      const result = await Promise.all<number[]>(promises);
      expect(result[0]).assertDeepEquals([] as number[]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3200
     * @tc.desc   Verify Promise.all with two elements array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<int>[] = [Promise.resolve(1), Promise.resolve(2)];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3300
     * @tc.desc   Verify Promise.all with three elements array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<int>[] = [Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3400
     * @tc.desc   Verify Promise.all with mixed thenable and Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<string> = Promise.resolve<string>("thenable");
      const promises: PromiseLike<string>[] = [thenable, Promise.resolve("promise")];
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["thenable", "promise"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3500
     * @tc.desc   Verify Promise.all with mixed types including null and undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<string | null | undefined> | string | null | undefined)[] = [
        Promise.resolve("hello"),
        null,
        Promise.resolve(undefined),
        "world"
      ];
      const result = await Promise.all<string | null | undefined>(promises);
      expect(result[0]).assertEqual("hello");
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual(undefined);
      expect(result[3]).assertEqual("world");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3600
     * @tc.desc   Verify Promise.all with deeply nested Promise.resolve
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const deeplyNested = Promise.resolve("deep");
      const promises: Promise<string>[] = [deeplyNested];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("deep");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3700
     * @tc.desc   Verify Promise.all with concurrent execution of 100 promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllSecondTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const count = 100;
      const promises: Promise<number>[] = [];
      for (let i = 0; i < count; i++) {
        promises.push(Promise.resolve<number>(i * 2));
      }
      const result = await Promise.all<number>(promises);
      expect(result.length).assertEqual(count);
      expect(result[0]).assertEqual(0);
      expect(result[count - 1]).assertEqual((count - 1) * 2);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3800
     * @tc.desc   Verify Promise.all comprehensive test with mixed types and scenarios
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string | int | boolean | null | undefined>[] = [
        Promise.resolve("string"),
        Promise.resolve(42),
        Promise.resolve(true),
        Promise.resolve<null>(null),
        Promise.resolve<undefined>(undefined)
      ];
      const result = await Promise.all<string | int | boolean | null | undefined>(promises);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("string");
      expect(result[1]).assertEqual(42);
      expect(result[2]).assertTrue();
      expect(result[3]).assertEqual(null);
      expect(result[4]).assertEqual(undefined);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_3900
     * @tc.desc   Verify Promise.all accepts a Set of promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("test"));
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("test");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4000
     * @tc.desc   Verify Promise.all with null parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.all<never>(null as never[]);
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4100
     * @tc.desc   Verify Promise.all with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false
      try {
        await Promise.all<never>(undefined as never[]);
      } catch (error) {
        caught = true
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4200
     * @tc.desc   Verify Promise.all with Set as Iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("one"));
      promises.add(Promise.resolve<string>("two"));
      promises.add(Promise.resolve<string>("three"));
      const result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4300
     * @tc.desc   Verify Promise.all with custom Iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new PromisePairIterable();
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4400
     * @tc.desc   Verify Promise.all with Map values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promiseMap = new Map<string, Promise<int>>();
      promiseMap.set("a", Promise.resolve<int>(1));
      promiseMap.set("b", Promise.resolve<int>(2));
      const result = await Promise.all<int>(promiseMap.values());
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4500
     * @tc.desc   Verify Promise.all with empty Iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const emptySet = new Set<Promise<string>>();
      const result = await Promise.all<string>(emptySet);
      expect(result).assertDeepEquals([] as string[]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4600
     * @tc.desc   Verify Promise.all with already resolved Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<int>>();
      promises.add(Promise.resolve<int>(1));
      promises.add(Promise.resolve<int>(2));
      promises.add(Promise.resolve<int>(3));
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4700
     * @tc.desc   Verify Promise.all with pending Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("one"), 100);
      }));
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("two"), 200);
      }));
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["one", "two"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4800
     * @tc.desc   Verify Promise.all with mixed Promise and PromiseLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<string> = Promise.resolve<string>("promiseLike");
      const promises: PromiseLike<string>[] = [Promise.resolve("promise"), thenable];
      const result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_4900
     * @tc.desc   Verify Promise.all with mixed Promise and plain values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<int | Promise<int>>();
      promises.add(1);
      promises.add(Promise.resolve<int>(2));
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5000
     * @tc.desc   Verify Promise.all rejects when passed a non-Iterable object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const nonIterable: InvalidObj = { invalid: true };
      let caught: boolean = false;
      try {
        await Promise.all<never>(nonIterable as never[]);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5100
     * @tc.desc   Verify Promise.all with iterator throwing error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const reason = new TaggedError("iterator-error");
      const errorIterable = new ErrorIterable<Promise<string>>(reason);
      let caught: boolean = false
      try {
        await Promise.all<string>(errorIterable);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5200
     * @tc.desc   Verify Promise.all with iterator returning non-PromiseLike
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const invalidIterable: InvalidObj[] = [{ invalid: true }, { invalid: true }];
      const result = await Promise.all<InvalidObj>(invalidIterable);
      expect(result.length).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5300
     * @tc.desc   Verify Promise.all with string type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("hello"));
      promises.add(Promise.resolve<string>("world"));
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["hello", "world"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5400
     * @tc.desc   Verify Promise.all with number type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<int>>();
      promises.add(Promise.resolve<int>(100));
      promises.add(Promise.resolve<int>(200));
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([100, 200]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5500
     * @tc.desc   Verify Promise.all with object type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      const promises = new Set<Promise<DataItem>>();
      promises.add(Promise.resolve<DataItem>({ id: 1, name: "item1" }));
      promises.add(Promise.resolve<DataItem>({ id: 2, name: "item2" }));
      const result = await Promise.all<DataItem>(promises);
      expect(result.length).assertEqual(2);
      expect(result[0].id).assertEqual(1);
      expect(result[0].name).assertEqual("item1");
      expect(result[1].name).assertEqual("item2");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5600
     * @tc.desc   Verify Promise.all with array type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<int[]>>();
      promises.add(Promise.resolve<int[]>([1, 2, 3]));
      promises.add(Promise.resolve<int[]>([4, 5, 6]));
      const result = await Promise.all<int[]>(promises);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertDeepEquals([1, 2, 3]);
      expect(result[1]).assertDeepEquals([4, 5, 6]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5700
     * @tc.desc   Verify Promise.all with union type U
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string | int>>();
      promises.add(Promise.resolve<string | int>("text"));
      promises.add(Promise.resolve<string | int>(123));
      const result = await Promise.all<string | int>(promises);
      expect(result).assertDeepEquals(["text", 123]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5800
     * @tc.desc   Verify Promise.all resolves all Promises successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("one"));
      promises.add(Promise.resolve<string>("two"));
      promises.add(Promise.resolve<string>("three"));
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["one", "two", "three"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_5900
     * @tc.desc   Verify Promise.all with single Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<int>>();
      promises.add(Promise.resolve<int>(42));
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([42]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6000
     * @tc.desc   Verify Promise.all with large number of Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<number>>();
      for (let i = 0; i < 100; i++) {
        promises.add(Promise.resolve<number>(i));
      }
      const result = await Promise.all<number>(promises);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[99]).assertEqual(99);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6100
     * @tc.desc   Verify Promise.all maintains order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("first"));
      promises.add(Promise.resolve<string>("second"));
      promises.add(Promise.resolve<string>("third"));
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("first");
      expect(result[1]).assertEqual("second");
      expect(result[2]).assertEqual("third");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6200
     * @tc.desc   Verify Promise.all maintains order with async resolution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<number>>();
      promises.add(new Promise<number>((resolve: (value: number) => void) => {
        setTimeout(() => resolve(1), 300);
      }));
      promises.add(new Promise<number>((resolve: (value: number) => void) => {
        setTimeout(() => resolve(2), 100);
      }));
      promises.add(new Promise<number>((resolve: (value: number) => void) => {
        setTimeout(() => resolve(3), 200);
      }));
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6300
     * @tc.desc   Verify Promise.all with empty Iterable returns empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const emptySet = new Set<Promise<string>>();
      const result = await Promise.all<string>(emptySet);
      expect(result).assertDeepEquals([] as string[]);
      expect(result.length).assertEqual(0);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6400
     * @tc.desc   Verify Promise.all with Promise resolving to null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string | null>>();
      promises.add(Promise.resolve<string | null>(null));
      promises.add(Promise.resolve<string | null>("value"));
      const result = await Promise.all<string | null>(promises);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual("value");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6500
     * @tc.desc   Verify Promise.all with Promise resolving to undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<number | undefined>>();
      promises.add(Promise.resolve<number | undefined>(undefined));
      promises.add(Promise.resolve<number | undefined>(100));
      const result = await Promise.all<number | undefined>(promises);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(100);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6600
     * @tc.desc   Verify Promise.all with Promise resolving to empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>(""));
      promises.add(Promise.resolve<string>("text"));
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual("text");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6700
     * @tc.desc   Verify Promise.all with Promise resolving to zero
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<number>>();
      promises.add(Promise.resolve<number>(0));
      promises.add(Promise.resolve<number>(100));
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(100);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6800
     * @tc.desc   Verify Promise.all returns Promise type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("test"));
      const result = Promise.all<string>(promises);
      const allResult = await result
      expect(allResult.length).assertEqual(1)
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_6900
     * @tc.desc   Verify Promise.all preserves Set iteration order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("a"));
      promises.add(Promise.resolve<string>("b"));
      const result = await Promise.all<string>(promises);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual("b");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7000
     * @tc.desc   Verify Promise.all with Awaited type unwrapping
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<number> = Promise.resolve<number>(42);
      const promises: PromiseLike<number>[] = [thenable];
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(42);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7100
     * @tc.desc   Verify Promise.all with deeply nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<NestedData>>();
      promises.add(Promise.resolve<NestedData>({
        level1: {
          level2: {
            level3: {
              value: "deep"
            }
          }
        }
      }));
      const result = await Promise.all<NestedData>(promises);
      expect(result[0].level1.level2.level3.value).assertEqual("deep");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7200
     * @tc.desc   Verify Promise.all rejects when one Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      const reason = new TaggedError("single-rejection");
      promises.add(Promise.resolve<string>("success"));
      promises.add(Promise.reject<string>(reason));
      promises.add(Promise.resolve<string>("another"));
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7300
     * @tc.desc   Verify Promise.all uses first rejection reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      const firstReason = new TaggedError("first-rejection");
      const secondReason = new TaggedError("second-rejection");
      promises.add(Promise.reject<string>(firstReason));
      promises.add(Promise.reject<string>(secondReason));
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
      } catch (error) {
        caught = true
        expect(error === firstReason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7400
     * @tc.desc   Verify Promise.all ignores subsequent rejections
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      const immediateReason = new TaggedError("immediate-rejection");
      const laterReason = new TaggedError("later-rejection");
      const rejectLater = new Promise<string>((_, reject) => {
        setTimeout(() => reject(laterReason), 100);
      });
      promises.add(Promise.reject<string>(immediateReason));
      promises.add(rejectLater);
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
      } catch (error) {
        caught = true
        expect(error === immediateReason).assertTrue()
      }
      expect(caught).assertTrue()
      let laterCaught: boolean = false;
      try {
        await rejectLater;
      } catch (error) {
        laterCaught = true;
        expect(error === laterReason).assertTrue();
      }
      expect(laterCaught).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7500
     * @tc.desc   Verify Promise.all handles async Promise rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      const reason = new TaggedError("async-rejection");
      promises.add(new Promise<string>((_, reject) => {
        setTimeout(() => reject(reason), 100);
      }));
      promises.add(Promise.resolve<string>("success"));
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7600
     * @tc.desc   Verify Promise.all handles iterator next error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      const reason = new TaggedError("iterator-next-error");
      const errorIterable = new ErrorIterable2(reason);
      let caught: boolean = false
      try {
        await Promise.all<string>(errorIterable);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7700
     * @tc.desc   Verify Promise.all handles Symbol.iterator error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const reason = new TaggedError("symbol-iterator-error");
      const invalidIterable = new IteratorErrorIterable(reason);
      let caught: boolean = false
      try {
        await Promise.all<never>(invalidIterable);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7800
     * @tc.desc   Verify Promise.all with an empty iterable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<never>([]);
      expect(result.length).assertEqual(0)
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_7900
     * @tc.desc   Verify Promise.all handles PromiseLike then error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const reason = new TaggedError("then-error");
      const thenable = new ThrowThenable<string>(reason);
      const promises: PromiseLike<string>[] = [thenable];
      let caught: boolean = false
      try {
        await Promise.all<string>(promises);
      } catch (error) {
        caught = true
        expect(error === reason).assertTrue()
      }
      expect(caught).assertTrue()
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8000
     * @tc.desc   Verify Promise.all is called as static method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string>[] = [Promise.resolve("test")];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("test");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8100
     * @tc.desc   Verify Promise.all with explicit generic type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<number>>();
      promises.add(Promise.resolve<number>(100));
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(100);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8200
     * @tc.desc   Verify Promise.all with then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<int>>();
      promises.add(Promise.resolve<int>(1));
      promises.add(Promise.resolve<int>(2));
      const result = await Promise.all<int>(promises)
        .then((values) => {
          expect(values).assertDeepEquals([1, 2])
          return values.map(v => v * 2)
        })
        .then((values) => {
          expect(values).assertDeepEquals([2, 4])
          return values.filter(v => v > 1)
        });
      expect(result).assertDeepEquals([2, 4]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8300
     * @tc.desc   Verify Promise.all with catch chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      const reason = new TaggedError("catch-chain-error");
      promises.add(Promise.reject<string>(reason));
      let caught = false;
      try {
        await Promise.all<string>(promises);
      } catch (error) {
        caught = true;
        expect(error === reason).assertTrue();
      }
      expect(caught).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8400
     * @tc.desc   Verify Promise.all with finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(Promise.resolve<string>("test"));
      let finallyCalled = false;
      await Promise.all<string>(promises)
        .finally(() => {
          finallyCalled = true;
        });
      expect(finallyCalled).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8500
     * @tc.desc   Verify Promise.all with await resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const test: () => Promise<void> = async (): Promise<void> => {
        const promises = new Set<Promise<string>>();
        promises.add(Promise.resolve<string>("a"));
        promises.add(Promise.resolve<string>("b"));
        const result = await Promise.all<string>(promises);
        expect(result).assertDeepEquals(["a", "b"]);
      };
      await test();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8600
     * @tc.desc   Verify Promise.all with await rejected
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllSecondTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const test: () => Promise<void> = async (): Promise<void> => {
        const promises = new Set<Promise<string>>();
        const reason = new TaggedError("await-rejected");
        promises.add(Promise.reject<string>(reason));
        let caught: boolean = false
        try {
          await Promise.all<string>(promises);
        } catch (error) {
          caught = true
          expect(error === reason).assertTrue()
        }
        expect(caught).assertTrue()
      };
      await test();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8700
     * @tc.desc   Verify Promise.all combined with Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises1 = new Set<Promise<int>>();
      promises1.add(Promise.resolve<int>(1));
      promises1.add(Promise.resolve<int>(2));
      const promises2 = [
        Promise.resolve<int>(10),
        Promise.resolve<int>(20)
      ];
      let [allResult, raceResult] = await Promise.all([
        Promise.all<int>(promises1),
        Promise.race(promises2)
      ]);
      expect(allResult).assertDeepEquals([1, 2]);
      expect(raceResult).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8800
     * @tc.desc   Verify multiple Promise.all concurrent execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const set1 = new Set<Promise<int>>();
      set1.add(Promise.resolve<int>(1));
      const set2 = new Set<Promise<string>>();
      set2.add(Promise.resolve<string>("a"));
      let [result1, result2] = await Promise.all([
        Promise.all<int>(set1),
        Promise.all<string>(set2)
      ]);
      expect(result1).assertDeepEquals([1]);
      expect(result2).assertDeepEquals(["a"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest8900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_8900
     * @tc.desc   Verify Promise.all with mixed fast and slow Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises = new Set<Promise<string>>();
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("slow"), 500);
      }));
      promises.add(Promise.resolve<string>("fast"));
      promises.add(new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("medium"), 200);
      }));
      const result = await Promise.all<string>(promises);

      expect(result.length).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest9000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_9000
     * @tc.desc   Verify Promise.all with shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest9000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const counter = new SharedCounter();
      const promises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        counter.increment();
        promises.push(Promise.resolve<void>(undefined));
      }

      await Promise.all<void>(promises);
      expect(counter.getCount()).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest9100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_9100
     * @tc.desc   Verify Promise.all with shared state validation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest9100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {

      const state: SharedState = { value: 100 };
      const promises = new Set<Promise<number>>();
      for (let i = 0; i < 5; i++) {
        promises.add(new Promise<number>((resolve: (value: number) => void) => {
          setTimeout(() => resolve(state.value), 100);
        }));
      }
      const result = await Promise.all<number>(promises);
      expect(result.every(v => v === 100)).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest9200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_9200
     * @tc.desc   Verify two-level Promise.all nesting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest9200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const innerPromises = new Set<Promise<int>>();
      innerPromises.add(Promise.resolve<int>(1));
      innerPromises.add(Promise.resolve<int>(2));
      const outerPromises = new Set<Promise<int[]>>();
      outerPromises.add(Promise.all<int>(innerPromises));
      const result = await Promise.all<int[]>(outerPromises);
      expect(result[0]).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest9300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_9300
     * @tc.desc   Verify three-level async nesting
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest9300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const level1: () => Promise<string[]> = async (): Promise<string[]> => {
        const promises = new Set<Promise<string>>();
        promises.add(Promise.resolve<string>("a"));
        promises.add(Promise.resolve<string>("b"));
        return await Promise.all<string>(promises);
      };

      const level2: () => Promise<string> = async (): Promise<string> => {
        const result = await level1();
        return result.join(",");
      };

      const level3: () => Promise<string> = async (): Promise<string> => {
        const result = await level2();
        return result.toUpperCase();
      };
      const finalResult = await level3();
      expect(finalResult).assertEqual("A,B");
      Done();
    })

    /**
     * @tc.name   PromiseAllSecondTest9400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_SECOND_TEST_9400
     * @tc.desc   Verify Timer triggering Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllSecondTest9400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const result = await new Promise<string[]>((resolve: (value: string[]) => void) => {
        setTimeout(() => {
          const promises = new Set<Promise<string>>();
          promises.add(Promise.resolve<string>("one"));
          promises.add(Promise.resolve<string>("two"));
          Promise.all<string>(promises).then<void>((r: string[]) => resolve(r));
          return;
        }, 500);
      });
      expect(result).assertDeepEquals(["one", "two"]);
      Done();
    })

  })
}
