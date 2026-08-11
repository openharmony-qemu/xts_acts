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
    super(message);
    this.name = "CustomError";
  }
}

/** Distinguish rejection reasons without asserting Error.message / Error.name. */
class TaggedError extends Error {
  public readonly tag: string;
  constructor(tag: string) {
    super(tag);
    this.tag = tag;
  }
}

interface PersonInfo {
  name: string;
  age: number;
}

class ThrowThenable<T> implements PromiseLike<T> {
  then<U, E>(onFulfilled: ((p1: T) => U | PromiseLike<U>), onRejected: (((p1: Error) => E | PromiseLike<E>)) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    throw new Error("thenable error");
  }
}

/** A pure thenable (non-Promise PromiseLike) that resolves with a fixed value. */
class ResolvedThenable<T> implements PromiseLike<T> {
  private value: T;
  constructor(value: T) {
    this.value = value;
  }
  then<U, E>(onFulfilled: ((p1: T) => U | PromiseLike<U>), onRejected: (((p1: Error) => E | PromiseLike<E>)) | undefined): PromiseLike<Awaited<U> | Awaited<E>> {
    return Promise.resolve(onFulfilled(this.value)) as PromiseLike<Awaited<U> | Awaited<E>>;
  }
}

export default function BuiltinsPromiseAllFirstTest(): void {
  describe('BuiltinsPromiseAllFirstTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Required by XTS describe completeness; no suite-level preset for this suite.
    })
    beforeEach((): void => {
      // Required by XTS describe completeness; no per-case preset for this suite.
    })
    afterEach((): void => {
      // Required by XTS describe completeness; no per-case cleanup for this suite.
    })
    afterAll((): void => {
      // Required by XTS describe completeness; no suite-level cleanup for this suite.
    })

    /**
     * @tc.name   PromiseAllFirstTest0100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0100
     * @tc.desc   Verify Promise.all with empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<number>([]);
      expect(result.length).assertEqual(0);
      expect(result).assertDeepEquals([] as number[]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0200
     * @tc.desc   Verify Promise.all with single element array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promise: Promise<number> = Promise.resolve<number>(42);
      const result = await Promise.all<number>([promise]);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0300
     * @tc.desc   Verify Promise.all with multiple elements array (10 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [];
      for (let i = 0; i < 10; i++) {
        promises.push(Promise.resolve(i * 1.0));
      }
      const result = await Promise.all<number>(promises);
      expect(result.length).assertEqual(10);
      expect(result[0]).assertEqual(0);
      expect(result[5]).assertEqual(5);
      expect(result[9]).assertEqual(9);
      expect(result).assertDeepEquals([0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as number[]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0400
     * @tc.desc   Verify Promise.all with all Promise objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve<number>(1),
        Promise.resolve<number>(2),
        Promise.resolve<number>(3)
      ];
      const result = await Promise.all<number>(promises);
      expect(result).assertDeepEquals([1.0, 2.0, 3.0]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0500
     * @tc.desc   Verify Promise.all with all plain values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const values: number[] = [10, 20, 30];
      const result = await Promise.all<number>(values);
      expect(result).assertDeepEquals([10.0, 20.0, 30.0]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0600
     * @tc.desc   Verify Promise.all with mixed values (Promise and plain values)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const mixed: (Promise<string> | string)[] = [Promise.resolve("a"), "b", Promise.resolve("c")];
      const result = await Promise.all<string>(mixed);
      expect(result).assertDeepEquals(["a", "b", "c"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0700
     * @tc.desc   Verify Promise.all with null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const values: (number | null)[] = [1.0, null, 3.0];
      const result = await Promise.all<number | null>(values);
      expect(result.length).assertEqual(3);
      expect(result).assertDeepEquals([1.0, null, 3.0]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0800
     * @tc.desc   Verify Promise.all with string type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string>[] = [
        Promise.resolve("hello"),
        Promise.resolve("world"),
        Promise.resolve("test")
      ];
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["hello", "world", "test"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest0900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_0900
     * @tc.desc   Verify Promise.all with number type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<int> | int)[] = [
        Promise.resolve(100),
        Promise.resolve(200),
        300
      ];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([100, 200, 300]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1000
     * @tc.desc   Verify Promise.all with boolean type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<boolean>[] = [
        Promise.resolve(true),
        Promise.resolve(false),
        Promise.resolve(true)
      ];
      const result = await Promise.all<boolean>(promises);
      expect(result).assertDeepEquals([true, false, true]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1100
     * @tc.desc   Verify Promise.all with object type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const obj1: PersonInfo = { name: "Alice", age: 30 };
      const obj2: PersonInfo = { name: "Bob", age: 25 };
      const promises: (Promise<PersonInfo> | PersonInfo)[] = [
        Promise.resolve(obj1),
        obj2
      ];
      const result = await Promise.all<PersonInfo>(promises);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual("Alice");
      expect(result[1].name).assertEqual("Bob");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1200
     * @tc.desc   Verify Promise.all with array type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<int[]> | int[])[] = [
        Promise.resolve([1, 2, 3]),
        Promise.resolve([4, 5, 6]),
        [7, 8, 9]
      ];
      const result = await Promise.all<int[]>(promises);
      expect(result.length).assertEqual(3);
      expect(result).assertDeepEquals([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1300
     * @tc.desc   Verify Promise.all with union type string | number
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<string | int> | string | int)[] = [
        Promise.resolve("hello"),
        Promise.resolve(42),
        "world",
        100
      ];
      const result = await Promise.all<string | int>(promises);
      expect(result).assertDeepEquals(["hello", 42, "world", 100]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1400
     * @tc.desc   Verify Promise.all with null type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<null>[] = [
        Promise.resolve<null>(null),
        Promise.resolve<null>(null)
      ];
      const result = await Promise.all<null>(promises);
      expect(result).assertDeepEquals([null, null]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1500
     * @tc.desc   Verify Promise.all with undefined type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<undefined>[] = [
        Promise.resolve<undefined>(undefined),
        Promise.resolve<undefined>(undefined)
      ];
      const result = await Promise.all<undefined>(promises);
      expect(result).assertDeepEquals([undefined, undefined]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1600
     * @tc.desc   Verify Promise.all with PromiseLike (thenable) objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable1: PromiseLike<string> = new ResolvedThenable<string>("then1");
      const thenable2: PromiseLike<string> = new ResolvedThenable<string>("then2");
      const promises: PromiseLike<string>[] = [thenable1, thenable2];
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["then1", "then2"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1700
     * @tc.desc   Verify Promise.all with void type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<void>[] = [
        Promise.resolve<void>(undefined),
        Promise.resolve<void>(undefined)
      ];
      const result = await Promise.all<void>(promises);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(undefined);
      expect(result[1]).assertEqual(undefined);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1800
     * @tc.desc   Verify Promise.all with never type (empty array)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<never>([]);
      expect(result.length).assertEqual(0);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest1900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_1900
     * @tc.desc   Verify Promise.all with large array (100 elements)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const count: int = 100;
      const promises: Promise<number>[] = [];
      for (let i = 0; i < count; i++) {
        promises.push(Promise.resolve(i * 1.0));
      }
      const result = await Promise.all<number>(promises);
      expect(result.length).assertEqual(count);
      expect(result[0]).assertEqual(0);
      expect(result[count - 1]).assertEqual(count - 1);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2000
     * @tc.desc   Verify Promise.all with very long strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const longStr: string = "a".repeat(10000);
      const promises: (Promise<string> | string)[] = [
        Promise.resolve(longStr),
        longStr
      ];
      const result = await Promise.all<string>(promises);
      expect(result[0].length).assertEqual(10000);
      expect(result[1].length).assertEqual(10000);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2100
     * @tc.desc   Verify Promise.all with Unicode strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<string> | string)[] = [
        Promise.resolve("你好世界"),
        Promise.resolve("🎉🎊🎈"),
        "日本語"
      ];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("你好世界");
      expect(result[1]).assertEqual("🎉🎊🎈");
      expect(result[2]).assertEqual("日本語");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2200
     * @tc.desc   Verify Promise.all with zero-width space strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const zeroWidthStr: string = "test\u200B\u200B\u200Bstring";
      const promises: Promise<string>[] = [Promise.resolve(zeroWidthStr)];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual(zeroWidthStr);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2300
     * @tc.desc   Verify Promise.all with XSS strings
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const xssStr: string = "<script>alert('xss')</script>";
      const promises: Promise<string>[] = [Promise.resolve(xssStr)];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual(xssStr);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2400
     * @tc.desc   Verify Promise.all with special numeric values (0, -0, NaN, Infinity)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve(0.0),
        Promise.resolve(-0.0),
        Promise.resolve(NaN),
        Promise.resolve(Infinity),
        Promise.resolve(-Infinity)
      ];
      const result = await Promise.all<number>(promises);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(0);
      expect(1.0 / result[1]).assertEqual(-Infinity);
      expect(Number.isNaN(result[2])).assertTrue();
      expect(result[3]).assertEqual(Infinity);
      expect(result[4]).assertEqual(-Infinity);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2500
     * @tc.desc   Verify Promise.all with max/min numeric values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve(Number.MAX_VALUE),
        Promise.resolve(Number.MIN_VALUE),
        Promise.resolve(-Number.MAX_VALUE)
      ];
      const result = await Promise.all<number>(promises);
      expect(result[0]).assertEqual(Number.MAX_VALUE);
      expect(result[1]).assertEqual(Number.MIN_VALUE);
      expect(result[2]).assertEqual(-Number.MAX_VALUE);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2600
     * @tc.desc   Verify Promise.all with null elements in union type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<string | null> | string | null)[] = [
        Promise.resolve("a"),
        null as string | null,
        Promise.resolve(null)
      ];
      const result = await Promise.all<string | null>(promises);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual(null);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2700
     * @tc.desc   Verify Promise.all rejects with native Error (not BusinessError) when one Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve(1.0),
        Promise.reject<number>(new TaggedError("rejection")),
        Promise.resolve(3.0)
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("rejection");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2800
     * @tc.desc   Verify Promise.all returns first rejection reason
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      // Only the first Promise rejects immediately; the second rejects later, so
      // Promise.all deterministically propagates the first rejection reason.
      const promises: Promise<number>[] = [
        Promise.reject<number>(new TaggedError("first")),
        new Promise<number>((_resolve: (value: number) => void, reject: (reason: Error) => void) => {
          setTimeout(() => { reject(new TaggedError("second")); }, 100);
        }),
        Promise.resolve(3.0)
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("first");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest2900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_2900
     * @tc.desc   Verify Promise.all with thenable that throws exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      // Pure thenable (not Promise): then() throws to exercise Promise.all thenable path.
      const thenable: PromiseLike<number> = new ThrowThenable<number>();
      const promises: PromiseLike<number>[] = [thenable, Promise.resolve(2.0)];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3000
     * @tc.desc   Verify Promise.all with thenable that rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<number> = new Promise<number>((_resolve: (value: number) => void, reject: (reason: Error) => void) => {
        reject(new Error("thenable reject"));
      });
      const promises: PromiseLike<number>[] = [thenable, Promise.resolve(2.0)];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3100
     * @tc.desc   Verify Promise.all returns results in order when all resolved
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string>[] = [
        Promise.resolve("first"),
        Promise.resolve("second"),
        Promise.resolve("third")
      ];
      const result = await Promise.all<string>(promises);
      expect(result).assertDeepEquals(["first", "second", "third"]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3200
     * @tc.desc   Verify Promise.all with mixed Promise and plain values success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<int> | int)[] = [
        Promise.resolve(1),
        2,
        Promise.resolve(3),
        4
      ];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3, 4]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3300
     * @tc.desc   Verify Promise.all preserves input order for already-fulfilled Promises
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      // Avoid setTimeout jitter: order is defined by Promise.all input index.
      const promises: Promise<int>[] = [
        Promise.resolve<int>(1),
        Promise.resolve<int>(2),
        Promise.resolve<int>(3)
      ];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3400
     * @tc.desc   Verify Promise.all empty array returns a new fulfilled array instance each call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const first: number[] = await Promise.all<number>([]);
      const second: number[] = await Promise.all<number>([]);
      expect(Array.isArray(first)).assertTrue();
      expect(first.length).assertEqual(0);
      expect(first).assertDeepEquals([] as number[]);
      // Differentiated from 0100: each call must yield a distinct array instance.
      expect(first === second).assertFalse();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3500
     * @tc.desc   Verify Promise.all returns array with null values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string | null>[] = [
        Promise.resolve("a"),
        Promise.resolve(null),
        Promise.resolve("c")
      ];
      const result = await Promise.all<string | null>(promises);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual("c");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3600
     * @tc.desc   Verify Promise.all returns array with undefined values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string | undefined>[] = [
        Promise.resolve("a"),
        Promise.resolve(undefined),
        Promise.resolve("c")
      ];
      const result = await Promise.all<string | undefined>(promises);
      expect(result[0]).assertEqual("a");
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual("c");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3700
     * @tc.desc   Verify Promise.all returns array with empty objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const obj1: PersonInfo = { name: "", age: 0 };
      const obj2: PersonInfo = { name: "test", age: 0 };
      const promises: Promise<PersonInfo>[] = [
        Promise.resolve(obj1),
        Promise.resolve(obj2)
      ];
      const result = await Promise.all<PersonInfo>(promises);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual("");
      expect(result[1].name).assertEqual("test");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3800
     * @tc.desc   Verify Promise.all returns array with empty arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<int[]>[] = [
        Promise.resolve([] as int[]),
        Promise.resolve([1, 2, 3])
      ];
      const result = await Promise.all<int[]>(promises);
      expect(result.length).assertEqual(2);
      expect(result).assertDeepEquals([[] as int[], [1, 2, 3]]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest3900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_3900
     * @tc.desc   Verify Promise.all returns array with falsy values (0, false, "")
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: (Promise<number> | Promise<boolean> | Promise<string>)[] = [
        Promise.resolve(0.0),
        Promise.resolve(false),
        Promise.resolve("")
      ];
      const result = await Promise.all<number | boolean | string>(promises);
      expect(result.length).assertEqual(3);
      expect(result).assertDeepEquals([0, false, ""] as (number | boolean | string)[]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4000
     * @tc.desc   Verify Promise.all result is awaitable and values match inputs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [Promise.resolve(1.0), Promise.resolve(2.0)];
      const resultPromise: Promise<number[]> = Promise.all<number>(promises);
      const result = await resultPromise;
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1.0);
      expect(result[1]).assertEqual(2.0);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4100
     * @tc.desc   Verify Promise.all with nested Promise (Awaited type extraction)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<string>[] = [
        Promise.resolve(Promise.resolve("nested"))
      ];
      const result = await Promise.all<string>(promises);
      expect(result[0]).assertEqual("nested");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4200
     * @tc.desc   Verify Promise.all result array immutability and traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve(1.0),
        Promise.resolve(2.0),
        Promise.resolve(3.0)
      ];
      const result = await Promise.all<number>(promises);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(3);
      const sum: number = result.reduce((a: number, b: number) => a + b, 0.0);
      expect(sum).assertEqual(6);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4300
     * @tc.desc   Verify Promise.all with large array (100 elements) return
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const count: int = 100;
      const promises: Promise<number>[] = [];
      for (let i = 0; i < count; i++) {
        promises.push(Promise.resolve(i * 2.0));
      }
      const result = await Promise.all<number>(promises);
      expect(Array.isArray(result)).assertTrue();
      expect(result.length).assertEqual(count);
      expect(result[0]).assertEqual(0);
      expect(result[50]).assertEqual(100);
      expect(result[count - 1]).assertEqual((count - 1) * 2);
      // Differentiated from 1900: verify even-multiplier sequence via reduce sum 0+2+...+198.
      const sum: number = result.reduce((a: number, b: number) => a + b, 0.0);
      expect(sum).assertEqual(9900);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4400
     * @tc.desc   Verify Promise.all with nested Promise returns resolved value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const innerPromise: Promise<string> = Promise.resolve("inner");
      const outerPromise: Promise<string> = Promise.resolve(innerPromise);
      const result = await Promise.all<string>([outerPromise]);
      expect(result[0]).assertEqual("inner");
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4500
     * @tc.desc   Verify Promise.all rejects when first Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.reject<number>(new TaggedError("first reject")),
        Promise.resolve(2.0),
        Promise.resolve(3.0)
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("first reject");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4600
     * @tc.desc   Verify Promise.all rejects when middle Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve(1.0),
        Promise.reject<number>(new TaggedError("middle reject")),
        Promise.resolve(3.0)
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("middle reject");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4700
     * @tc.desc   Verify Promise.all rejects when last Promise rejects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [
        Promise.resolve(1.0),
        Promise.resolve(2.0),
        Promise.reject<number>(new TaggedError("last reject"))
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("last reject");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4800
     * @tc.desc   Verify Promise.all with multiple rejections returns first
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      // Only the first Promise rejects immediately; the others reject later, so
      // Promise.all deterministically propagates the first rejection reason.
      const promises: Promise<number>[] = [
        Promise.reject<number>(new TaggedError("error1")),
        new Promise<number>((_resolve: (value: number) => void, reject: (reason: Error) => void) => {
          setTimeout(() => { reject(new TaggedError("error2")); }, 100);
        }),
        new Promise<number>((_resolve: (value: number) => void, reject: (reason: Error) => void) => {
          setTimeout(() => { reject(new TaggedError("error3")); }, 200);
        })
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("error1");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest4900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_4900
     * @tc.desc   Verify Promise.all with async rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let rejectAsync: (reason: Error) => void = (_reason: Error): void => {}
      const promises: Promise<number | void>[] = [
        new Promise<number | void>((_resolve: (value: number | void) => void, reject: (reason: Error) => void) => {
          rejectAsync = reject
        }),
        Promise.resolve(2.0)
      ];
      const allPromise = Promise.all<number | void>(promises)
      rejectAsync(new TaggedError("async reject"))
      try {
        await allPromise;
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("async reject");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5000
     * @tc.desc   Verify Promise.all with fast reject vs slow resolve race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      // Pending resolve never settles; all must reject on the fast TaggedError.
      const promises: Promise<number>[] = [
        Promise.reject<number>(new TaggedError("fast reject")),
        new Promise<number>((_resolve: (value: number) => void) => {})
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("fast reject");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5100
     * @tc.desc   Verify Promise.all with Error instance rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [Promise.reject<number>(new TaggedError("standard error"))];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("standard error");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5200
     * @tc.desc   Verify Promise.all with TypeError rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [Promise.reject<number>(new TypeError("type error"))];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TypeError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5300
     * @tc.desc   Verify Promise.all with RangeError rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const promises: Promise<number>[] = [Promise.reject<number>(new RangeError("range error"))];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof RangeError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5400
     * @tc.desc   Verify Promise.all with custom Error rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const customErr: CustomError = new CustomError("custom error");
      const promises: Promise<number>[] = [Promise.reject<number>(customErr)];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof CustomError).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5500
     * @tc.desc   Verify Promise.all rejects with TaggedError carrying expected tag
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      // ArkTS types Promise reject reason as Error; distinguish via TaggedError.tag (not Error.message).
      const promises: Promise<string>[] = [Promise.reject<string>(new TaggedError("string rejection"))];
      try {
        await Promise.all<string>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("string rejection");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5600
     * @tc.desc   Verify Promise.all with thenable that throws sync exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const thenable: PromiseLike<number> = new Promise<number>(() => {
        throw new Error("sync error in thenable");
      });
      const promises: PromiseLike<number>[] = [thenable];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5700
     * @tc.desc   Verify Promise.all with thenable that rejects asynchronously
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let rejectThenable: (reason: Error) => void = (_reason: Error): void => {};
      const thenable: PromiseLike<number> = new Promise<number>((_resolve: (value: number) => void, reject: (reason: Error) => void) => {
        rejectThenable = reject;
      });
      const promises: PromiseLike<number>[] = [thenable];
      const allPromise = Promise.all<number>(promises);
      rejectThenable(new Error("async reject in thenable"));
      try {
        await allPromise;
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5800
     * @tc.desc   Verify Promise.all in try-catch block success case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let result: int[] | undefined;
      try {
        result = await Promise.all<int>([Promise.resolve(1), Promise.resolve(2)]);
      } catch (error) {
        expect().assertFail();
      }
      if (result !== undefined) {
        expect(result).assertDeepEquals([1, 2]);
      } else {
        expect().assertFail();
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest5900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_5900
     * @tc.desc   Verify Promise.all in try-catch block catch case
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      try {
        await Promise.all<number>([Promise.reject(new TaggedError("test"))]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("test");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6000
     * @tc.desc   Verify Promise.all with finally block execution
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyExecuted: boolean = false;
      try {
        await Promise.all<number>([Promise.resolve(1.0)]);
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();

      finallyExecuted = false;
      try {
        await Promise.all<number>([Promise.reject(new Error("test"))]);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6100
     * @tc.desc   Verify Promise.all with await success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const testAwait: () => Promise<void> = async (): Promise<void> => {
        const result = await Promise.all<string>([
          Promise.resolve("a"),
          Promise.resolve("b")
        ]);
        expect(result).assertDeepEquals(["a", "b"]);
      };
      await testAwait();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6200
     * @tc.desc   Verify Promise.all with await catch rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('PromiseAllFirstTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      const testAwaitReject: () => Promise<void> = async (): Promise<void> => {
        try {
          await Promise.all<number>([Promise.reject(new Error("test"))]);
          expect().assertFail();
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      };
      await testAwaitReject();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6300
     * @tc.desc   Verify Promise.all with then chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let result: int[] = [];
      await Promise.all<int>([Promise.resolve(1), Promise.resolve(2)])
        .then((values: int[]) => {
          result = values;
        });
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6400
     * @tc.desc   Verify Promise.all with catch chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let caught: boolean = false;
      await Promise.all<number>([Promise.reject(new Error("test"))])
        .catch((error: Error) => {
          caught = true;
          expect(error instanceof Error).assertTrue();
        });
      expect(caught).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6500
     * @tc.desc   Verify Promise.all with then-catch chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let thenExecuted: boolean = false;
      let caught: boolean = false;
      await Promise.all<number>([Promise.reject(new Error("test"))])
        .then((values: number[]) => {
          thenExecuted = true;
        })
        .catch((error: Error) => {
          caught = true;
          expect(error instanceof Error).assertTrue();
        });
      expect(thenExecuted).assertFalse();
      expect(caught).assertTrue();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6600
     * @tc.desc   Verify Promise.all with finally chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let finallyCount = 0;
      await Promise.all<number>([Promise.resolve(1.0)])
        .finally(() => {
          finallyCount++;
        });
      expect(finallyCount).assertEqual(1);

      await Promise.all<number>([Promise.reject(new Error("test"))])
        .catch((error: Error) => {
          expect(error instanceof Error).assertTrue();
        })
        .finally(() => {
          finallyCount++;
        });
      expect(finallyCount).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6700
     * @tc.desc   Verify Promise.all with chain returning new Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('PromiseAllFirstTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<number>([Promise.resolve(1.0), Promise.resolve(2.0)])
        .then<number[]>((values: number[]) => values.map((v: number) => v * 2))
        .then<number>((doubled: number[]) => doubled.reduce((a: number, b: number) => a + b, 0.0));
      expect(result).assertEqual(6);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6800
     * @tc.desc   Verify Promise.all combined with Promise.race
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const allResult = await Promise.all<int>([
        Promise.resolve(1),
        Promise.resolve(2)
      ]);
      // Prefer settled Promises over setTimeout to avoid timer flakiness on race.
      const raceResult = await Promise.race<int>([
        Promise.resolve(10),
        Promise.resolve(20)
      ]);
      expect(allResult).assertDeepEquals([1, 2]);
      expect(raceResult).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest6900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_6900
     * @tc.desc   Verify Promise.all waits for slowest Promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      // Manual resolve of the slow middle Promise: all() must wait without setTimeout.
      let resolveSlow: (value: int) => void = (_value: int): void => {}
      const slow: Promise<int> = new Promise<int>((resolve: (value: int) => void) => {
        resolveSlow = resolve
      })
      const allPromise = Promise.all<int>([Promise.resolve(1), slow, Promise.resolve(3)])
      let settled: boolean = false;
      allPromise.then((_: int[]): void => { settled = true });
      await Promise.resolve();
      expect(settled).assertFalse();
      resolveSlow(2);
      const result = await allPromise;
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7000
     * @tc.desc   Verify Promise.all rejection interrupts immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      // Immediate reject vs never-settling resolve: all rejects without timer dependency.
      const promises: Promise<number>[] = [
        Promise.reject<number>(new TaggedError("test")),
        new Promise<number>((_resolve: (value: number) => void) => {})
      ];
      try {
        await Promise.all<number>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof TaggedError).assertTrue();
        expect((error as TaggedError).tag).assertEqual("test");
      }
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7100
     * @tc.desc   Verify Promise.all with shared counter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let counter = 0;
      const promises: Promise<number>[] = [];
      for (let i = 0; i < 10; i++) {
        promises.push(new Promise<number>((resolve: (value: number) => void) => {
          counter++;
          resolve(counter);
        }));
      }
      const result = await Promise.all<number>(promises);
      expect(counter).assertEqual(10);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7200
     * @tc.desc   Verify Promise.all with shared array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const sharedArray: number[] = [];
      const promises: Promise<number>[] = [];
      for (let i = 0; i < 5; i++) {
        promises.push(new Promise<number>((resolve: (value: number) => void) => {
          sharedArray.push(i);
          resolve(i);
        }));
      }
      const result = await Promise.all<number>(promises);
      expect(sharedArray.length).assertEqual(5);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7300
     * @tc.desc   Verify Promise.all nested inside Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const innerPromises: Promise<int[]>[] = [
        Promise.resolve([1, 2]),
        Promise.resolve([3, 4])
      ];
      const innerResult = await Promise.all<int[]>(innerPromises);
      const flattened = innerResult.flat();
      expect(flattened).assertDeepEquals([1, 2, 3, 4]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7400
     * @tc.desc   Verify Promise.all returning Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const promiseOfAll = Promise.resolve(Promise.all([Promise.resolve(1), Promise.resolve(2)]));
      const result = await promiseOfAll;
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7500
     * @tc.desc   Verify Promise.all triggered by Timer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const resultPromise = new Promise<int[]>((resolve: (value: int[]) => void) => {
        setTimeout(() => {
          Promise.all<int>([
            Promise.resolve(1),
            Promise.resolve(2)
          ]).then((values: int[]) => {
            resolve(values);
          });
        }, 500);
      });
      const result = await resultPromise;
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7600
     * @tc.desc   Verify Promise.all with Timer delayed Promise elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const promises: Promise<int>[] = [
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => resolve(1), 500)
        }),
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => resolve(2), 500)
        })
      ];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7700
     * @tc.desc   Verify Promise.all sequential chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const order: int[] = [];
      const result1 = await Promise.all<int>([
        Promise.resolve(1).then(v => { order.push(1); return v; })
      ]);
      const result2 = await Promise.all<int>([
        Promise.resolve(2).then(v => { order.push(2); return v; })
      ]);
      const result3 = await Promise.all<int>([
        Promise.resolve(3).then(v => { order.push(3); return v; })
      ]);
      expect(order).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7800
     * @tc.desc   Verify Promise.all parallel composition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const result1 = await Promise.all<int>([Promise.resolve(1), Promise.resolve(2)]);
      const result2 = await Promise.all<int>([Promise.resolve(3), Promise.resolve(4)]);
      const result3 = await Promise.all<int>([Promise.resolve(5), Promise.resolve(6)]);
      expect(result1).assertDeepEquals([1, 2]);
      expect(result2).assertDeepEquals([3, 4]);
      expect(result3).assertDeepEquals([5, 6]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest7900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_7900
     * @tc.desc   Verify Promise.all mixed chain (sequential + parallel)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const order: int[] = [];
      const result1 = await Promise.all<int>([
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => {
            order.push(1);
            resolve(1);
          }, 100)
        })
      ]);
      const combined2 = await Promise.all<int>([
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => {
            order.push(2);
            resolve(2);
          }, 100)
        }),
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => {
            order.push(3);
            resolve(3);
          }, 100)
        })
      ]);
      expect(order).assertDeepEquals([1, 2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8000
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8000
     * @tc.desc   Verify Promise.all conditional chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const result = await Promise.all<int>([Promise.resolve(1), Promise.resolve(2)]);
      let nextResult: int[];
      if (result[0] === 1) {
        nextResult = await Promise.all<int>([Promise.resolve(10), Promise.resolve(20)]);
      } else {
        nextResult = await Promise.all<int>([Promise.resolve(30), Promise.resolve(40)]);
      }
      expect(nextResult).assertDeepEquals([10, 20]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8100
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8100
     * @tc.desc   Verify Promise.all error chain
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let executed = false;
      try {
        await Promise.all<number>([Promise.reject(new Error("test"))]);
        executed = true;
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      expect(executed).assertFalse();
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8200
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8200
     * @tc.desc   Verify Promise.all vs Promise.race competition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const slowPromise = new Promise<int>((resolve: (value: int) => void) => {
        setTimeout(() => resolve(1), 200)
      });
      const fastPromise = new Promise<int>((resolve: (value: int) => void) => {
        setTimeout(() => resolve(2), 100)
      });

      let [allResult, raceResult] = await Promise.all([
        Promise.all([slowPromise, fastPromise]),
        Promise.race([slowPromise, fastPromise])
      ]);
      expect(allResult).assertDeepEquals([1, 2]);
      expect(raceResult).assertEqual(2);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8300
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8300
     * @tc.desc   Verify Promise.all read competition
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const sharedPromise = Promise.resolve(42.0);
      const result1 = await Promise.all<number>([sharedPromise]);
      const result2 = await Promise.all<number>([sharedPromise]);
      const result3 = await Promise.all<number>([sharedPromise]);
      expect(result1[0]).assertEqual(42);
      expect(result2[0]).assertEqual(42);
      expect(result3[0]).assertEqual(42);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8400
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8400
     * @tc.desc   Verify Promise.all does not cancel other Promises after rejection
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const completed: int[] = [];
      const remaining: Promise<int>[] = [
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => {
            completed.push(2);
            resolve(2);
          }, 150)
        }),
        new Promise<int>((resolve: (value: int) => void) => {
          setTimeout(() => {
            completed.push(3);
            resolve(3);
          }, 200)
        })
      ];
      const promises: Promise<int>[] = [
        new Promise<int>((_resolve: (value: int) => void, reject: (reason: Error) => void) => {
          setTimeout(() => {
            reject(new Error("reject"));
          }, 100);
        }),
        remaining[0],
        remaining[1]
      ];
      try {
        await Promise.all<int>(promises);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
      }
      // Wait deterministically for the remaining Promises instead of a fixed sleep.
      await Promise.all<int>(remaining);
      expect(completed).assertDeepEquals([2, 3]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8500
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8500
     * @tc.desc   Verify Promise.all timeout degradation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const allWithTimeout = (promises: Promise<number>[], timeout: int): Promise<number[] | string> => {
          return Promise.race<number[] | string>([
            Promise.all<number>(promises),
            new Promise<number[] | string>((resolve: (value: number[] | string) => void) => {
              setTimeout(() => resolve("timeout"), timeout)
            })
          ]);
        };

      const slowPromise = new Promise<number>((resolve: (value: number) => void) => {
        setTimeout(() => resolve(1.0), 1000)
      });
      const result = await allWithTimeout([slowPromise], 100);
      expect(result as string).assertEqual("timeout");
      expect(await slowPromise).assertEqual(1.0);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8600
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8600
     * @tc.desc   Verify Promise.all retry on failure
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let attemptCount = 0;
      const retryableAll: () => Promise<int[]> = async (): Promise<int[]> => {
        attemptCount++;
        if (attemptCount < 3) {
          return Promise.reject(new Error("attempt " + attemptCount));
        }
        return Promise.all<int>([Promise.resolve(1), Promise.resolve(2)]);
      };

      let result: int[] = [];
      let success = false;
      for (let i = 0; i < 3; i++) {
        try {
          result = await retryableAll();
          success = true;
          break;
        } catch (error) {
          expect(error instanceof Error).assertTrue();
        }
      }
      expect(success).assertTrue();
      expect(result).assertDeepEquals([1, 2]);
      expect(attemptCount).assertEqual(3);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8700
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8700
     * @tc.desc   Verify Promise.all with concurrent event handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      // handleEvent returns its result so Promise.all preserves input order;
      // do not rely on push order from concurrent handlers.
      const handleEvent: (data: int[]) => Promise<int[]> = async (data: int[]): Promise<int[]> => {
        return Promise.all(data.map(v => Promise.resolve(v * 2)));
      };

      const results: int[][] = await Promise.all([
        handleEvent([1, 2]),
        handleEvent([3, 4]),
        handleEvent([5, 6])
      ]);

      expect(results.length).assertEqual(3);
      expect(results[0]).assertDeepEquals([2, 4]);
      expect(results[1]).assertDeepEquals([6, 8]);
      expect(results[2]).assertDeepEquals([10, 12]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8800
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8800
     * @tc.desc   Verify Promise.all with event queue sequential processing
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const order: int[] = [];

      const processQueue: (items: int[]) => Promise<void> = async (items: int[]): Promise<void> => {
        for (let item of items) {
          const result = await Promise.all([Promise.resolve(item)]);
          order.push(result[0]);
        }
      };

      await processQueue([1, 2, 3, 4, 5]);
      expect(order).assertDeepEquals([1, 2, 3, 4, 5]);
      Done();
    })

    /**
     * @tc.name   PromiseAllFirstTest8900
     * @tc.number SUB_COMMONLIBRARY_ETS_UTILS_PROMISE_ALL_FIRST_TEST_8900
     * @tc.desc   Verify Promise.all with three resolved int Promises returns array [1, 2, 3]
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PromiseAllFirstTest8900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      const promises: Promise<int>[] = [
        Promise.resolve(1),
        Promise.resolve(2),
        Promise.resolve(3)
      ];
      const result = await Promise.all<int>(promises);
      expect(result).assertDeepEquals([1, 2, 3]);
      Done();
    })

  })
}
