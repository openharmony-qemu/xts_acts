'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Level, Size } from '../../../hypium/index';
interface OptionalIdResult {
  id?: number;
}

interface IntegerIdResult {
  // ArkTS 1.2 static integer type used to verify callback result preservation.
  id: int;
}
class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError";
  }
}

export default function AsyncLockCallbackTest(): void {
  describe('AsyncLockCallbackTest', (): void => {
    /**
     * @tc.name    testAsyncLockCallback0100
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0100
     * @tc.desc    Verify AsyncLockCallback defined as parameterless function
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = (): int => {
        return 100;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockCallback0200
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0200
     * @tc.desc    Verify AsyncLockCallback has no parameter type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = () => {
        return "test";
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<string>(callback);
      expect(result).assertEqual("test");
    });

    /**
     * @tc.name    testAsyncLockCallback0300
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0300
     * @tc.desc    Verify callback returns synchronous value T
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = () => {
        return "test_result";
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<string>(callback);
      expect(result).assertEqual("test_result");
    });

    /**
     * @tc.name    testAsyncLockCallback0400
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0400
     * @tc.desc    Verify callback returns Promise<T>
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = async ():Promise<int> => {
        return 42;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    testAsyncLockCallback0500
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0500
     * @tc.desc    Verify callback returns null
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = (): string | null => {
        return null;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<string | null>(callback);
      expect(result).assertNull();
    });

    /**
     * @tc.name    testAsyncLockCallback0600
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0600
     * @tc.desc    Verify callback returns undefined
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = (): string | undefined => {
        return undefined;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<string | undefined>(callback);
      expect(result).assertUndefined();
    });

    /**
     * @tc.name    testAsyncLockCallback0700
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0700
     * @tc.desc    Verify callback returns empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = ():int[] => {
        return [];
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int[]>(callback);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockCallback0800
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0800
     * @tc.desc    Verify callback returns empty object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = (): OptionalIdResult => {
        const emptyResult: OptionalIdResult = {};
        return emptyResult;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<OptionalIdResult>(callback);
      expect(result).not().assertNull();
      expect(result.id).assertUndefined();
    });

    /**
     * @tc.name    testAsyncLockCallback0900
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_0900
     * @tc.desc    Verify callback return value type check
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = () => {
        return 100;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      // ArkTS 1.2 static runtime typeof(int) returns "int" (device-validated).
      expect(typeof result).assertEqual("int");
    });

    /**
     * @tc.name    testAsyncLockCallback1000
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1000
     * @tc.desc    Verify generic T type validation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const lock = new AsyncLock();
      const strCallback = () => "test";
      const strResult = await lock.lockAsync<string>(strCallback);
      expect(typeof strResult).assertEqual("string");

      const numCallback = () => 42;
      const numResult = await lock.lockAsync<int>(numCallback);
      // ArkTS 1.2 static runtime typeof(int) returns "int" (device-validated).
      expect(typeof numResult).assertEqual("int");
    });

    /**
     * @tc.name    testAsyncLockCallback1100
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1100
     * @tc.desc    Verify callback returns maximum value boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        return Number.MAX_VALUE;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<number>(callback);
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.name    testAsyncLockCallback1200
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1200
     * @tc.desc    Verify callback returns minimum value boundary
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        return Number.MIN_VALUE;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<number>(callback);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.name    testAsyncLockCallback1300
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1300
     * @tc.desc    Verify callback returns very long string
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        return "a".repeat(10000);
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<string>(callback);
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.name    testAsyncLockCallback1400
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1400
     * @tc.desc    Verify callback throws Error
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        throw new Error("callback error");
      };
      const lock = new AsyncLock();
      try {
        await lock.lockAsync<int>(callback);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).assertEqual("callback error");
      }
    });

    /**
     * @tc.name    testAsyncLockCallback1500
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1500
     * @tc.desc    Verify callback throws custom Error class
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        throw new CustomError("custom callback error");
      };
      const lock = new AsyncLock();
      try {
        await lock.lockAsync<int>(callback);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof CustomError).assertTrue();
        expect(error.message).assertEqual("custom callback error");
      }
    });

    /**
     * @tc.name    testAsyncLockCallback1600
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1600
     * @tc.desc    Verify callback returns rejected Promise
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = async () => {
        return Promise.reject(new Error("async error"));
      };
      const lock = new AsyncLock();
      try {
        await lock.lockAsync<int>(callback);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).assertEqual("async error");
      }
    });

    /**
     * @tc.name    testAsyncLockCallback1700
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1700
     * @tc.desc    Verify async callback throws exception
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = async ():Promise<int> => {
        throw new Error("async throw");
      };
      const lock = new AsyncLock();
      try {
        await lock.lockAsync<int>(callback);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).assertEqual("async throw");
      }
    });

    /**
     * @tc.name    testAsyncLockCallback1800
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1800
     * @tc.desc    Verify try block executes normally in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        try {
          return 100;
        } catch (e) {
          return -1;
        }
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockCallback1900
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_1900
     * @tc.desc    Verify try block throws and enters catch in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        try {
          throw new Error("inner error");
        } catch (_e) {
          return -1;
        }
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    testAsyncLockCallback2000
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2000
     * @tc.desc    Verify finally block always executes in callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      let executed = false;
      const callback = () => {
        try {
          return 100;
        } finally {
          executed = true;
        }
      };
      const lock = new AsyncLock();
      await lock.lockAsync<int>(callback);
      expect(executed).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockCallback2100
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2100
     * @tc.desc    Verify await executes normally in async callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = async () => {
        const value = await Promise.resolve(42);
        return value;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.name    testAsyncLockCallback2200
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2200
     * @tc.desc    Verify await handles error in async callback
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = async () => {
        try {
          await Promise.reject(new Error("reject"));
          return 0;
        } catch (_e) {
          return -1;
        }
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.name    testAsyncLockCallback2300
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2300
     * @tc.desc    Verify async callback returns Promise
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = async () => {
        return "async_result";
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<string>(callback);
      expect(result).assertEqual("async_result");
    });

    /**
     * @tc.name    testAsyncLockCallback2400
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2400
     * @tc.desc    Verify callback returns Promise with then chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = async () => {
        const v = await Promise.resolve(10);
        return v * 2;
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.name    testAsyncLockCallback2500
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2500
     * @tc.desc    Verify callback returns Promise with catch chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      const callback = () => {
        return Promise.reject(new Error("fail"))
          .catch((_e: Error) => 999);
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.name    testAsyncLockCallback2600
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2600
     * @tc.desc    Verify callback returns Promise with finally chain
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockCallback2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (): Promise<void> => {
      let executed = false;
      const callback = () => {
        return Promise.resolve(50)
          .finally(() => { executed = true; });
      };
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(50);
      expect(executed).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockCallback2700
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2700
     * @tc.desc    Verify AsyncLockCallback generic T is number
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = () => 123;
      const lock = new AsyncLock();
      const result = await lock.lockAsync<int>(callback);
      expect(result).assertEqual(123);
    });

    /**
     * @tc.name    testAsyncLockCallback2800
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2800
     * @tc.desc    Verify AsyncLockCallback generic T is boolean
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = () => true;
      const lock = new AsyncLock();
      const result = await lock.lockAsync<boolean>(callback);
      expect(result).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockCallback2900
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_2900
     * @tc.desc    Verify AsyncLockCallback generic T is array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = ():number[] => [1, 2, 3];
      const lock = new AsyncLock();
      const result = await lock.lockAsync<number[]>(callback);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.name    testAsyncLockCallback3000
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_3000
     * @tc.desc    Verify AsyncLockCallback generic T is object
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const callback = ():IntegerIdResult => ({ id: 100 });
      const lock = new AsyncLock();
      const result = await lock.lockAsync<IntegerIdResult>(callback);
      expect(result.id).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockCallback3100
     * @tc.number  SUB_ASYNCLOCK_CALLBACK_TEST_3100
     * @tc.desc    Verify AsyncLockCallback generic T is union type
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockCallback3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async (): Promise<void> => {
      const lock = new AsyncLock();
      const strCallback = () => "text";
      const numCallback = () => 42;
      const strResult = await lock.lockAsync<string | int>(strCallback);
      const numResult = await lock.lockAsync<string | int>(numCallback);
      expect(typeof strResult).assertEqual("string");
      expect(typeof numResult).assertEqual("int");
    });

  });
}
