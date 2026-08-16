'use static';
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

import { describe, it, expect, TestType, Level, Size } from '../../../hypium/index';

interface ResultType {
  id: number;
  name: string;
}

interface ResultObj {
  id: number;
}

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError";
  }
}

export default function AsyncLockLockAsyncFirstOverloadTest(): void {
  describe('AsyncLockLockAsyncFirstOverloadTest', (): void => {

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0100
     * @tc.desc    Verify lockAsync requires callback parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncFirstOverload0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let p1: Promise<void> = lock.lockAsync<void>(() => {
        try {
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(executed).assertFalse();
      await p1;
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0200
     * @tc.desc    Verify lockAsync with normal function callback returning number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<number> = lock.lockAsync<number>(() => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: number = await pResult;
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0300
     * @tc.desc    Verify lockAsync with arrow function callback returning string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "test";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0400
     * @tc.desc    Verify lockAsync with async function callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<number> = lock.lockAsync<number>(async () => {
        try {
          return await Promise.resolve(42.0);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: number = await pResult;
      expect(result).assertEqual(42.0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0500
     * @tc.desc    Verify lockAsync with callback returning Promise
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return Promise.resolve("async_result");
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result).assertEqual("async_result");

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0600
     * @tc.desc    Verify lockAsync with void callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed: boolean = false;
      await lock.lockAsync<void>(() => {
        executed = true;
      });
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0700
     * @tc.desc    Verify lockAsync with callback returning null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<string | null> = lock.lockAsync<string | null>(() => {
        try {
          return null;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: string | null = await pResult;
      expect(result).assertNull();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0800
     * @tc.desc    Verify lockAsync with callback returning undefined
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<string | undefined> = lock.lockAsync<string | undefined>(() => {
        try {
          return undefined;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: string | undefined = await pResult;
      expect(result).assertUndefined();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload0900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_0900
     * @tc.desc    Verify lockAsync with empty callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pCheck: Promise<void> = lock.lockAsync<void>(() => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      await expect(pCheck).assertPromiseIsResolved();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload0900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1000
     * @tc.desc    Verify lockAsync with callback throwing exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      try {
        await lock.lockAsync<void>(() => {
          throw new Error("callback error");
        });
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }
      // Verify the lock is released after the callback exception
      // and can be acquired again.
      let reacquired: boolean = false;
      await lock.lockAsync<void>(() => {
        reacquired = true;
      });
      expect(reacquired).assertTrue();
      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1100
     * @tc.desc    Verify lockAsync with callback returning complex object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<ResultType> = lock.lockAsync<ResultType>(() => {
        try {
          return ({ id: 1, name: "test" });
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: ResultType = await pResult;
      expect(result.id).assertEqual(1);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1200
     * @tc.desc    Verify lockAsync with callback returning array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number[] = await lock.lockAsync<number[]>(() => {
        try {
          return [1, 2, 3];
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result.length).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1300
     * @tc.desc    Verify lockAsync returns Promise
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let p: Promise<void> = lock.lockAsync<void>(() => {
        try {
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      await p;
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1400
     * @tc.desc    Verify await returns callback result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "result";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result).assertEqual("result");

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1500
     * @tc.desc    Verify Promise resolved successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let p: Promise<number> = lock.lockAsync<number>(() => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: number = await p;
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1600
     * @tc.desc    Verify lock is released after callback execution
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let state = lock.query();
      expect(state.held.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1700
     * @tc.desc    Verify callback returning empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number[] = await lock.lockAsync<number[]>(() => {
        try {
          return [];
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1800
     * @tc.desc    Verify callback returning empty object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<object> = lock.lockAsync<object>(() => {
        try {
          return ({});
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: object = await pResult;
      expect(result).not().assertNull();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload1900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_1900
     * @tc.desc    Verify generic T type correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pNumResult: Promise<number> = lock.lockAsync<number>(() => {
        try {
          return 1;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let numResult: number = await pNumResult;
      let pStrResult: Promise<string> = lock.lockAsync<string>(() => {
        try {
          return "s";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let strResult: string = await pStrResult;
      expect(typeof numResult).assertEqual("number");
      expect(typeof strResult).assertEqual("string");

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2000
     * @tc.desc    Verify returned Promise resolves and callback executes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let count = 0;
      let p: Promise<void> = lock.lockAsync<void>(() => {
        try {
          count++;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      await p;
      expect(count).assertEqual(1);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2100
     * @tc.desc    Verify callback returning number MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(() => {
        try {
          return Number.MAX_VALUE;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result).assertEqual(Number.MAX_VALUE);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2200
     * @tc.desc    Verify callback returning very long string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result = await lock.lockAsync<string>(() => {
        try {
          return "a".repeat(10000);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(result.length).assertEqual(10000);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2300
     * @tc.desc    Verify callback returning large array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<number[]> = lock.lockAsync<number[]>(() => {
        try {
          let arr: number[] = [];
          for (let i = 0; i < 1000; i++) arr.push(i);
          return arr;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: number[] = await pResult;
      expect(result.length).assertEqual(1000);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2400
     * @tc.desc    Verify callback throwing Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      try {
        await lock.lockAsync<void>(() => {
          throw new Error("callback error");
        });
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2500
     * @tc.desc    Verify callback throwing custom Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      try {
        await lock.lockAsync<void>(() => {
          throw new CustomError("custom error");
        });
        expect().assertFail();
      } catch (error) {
        expect(error instanceof CustomError).assertTrue();
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2600
     * @tc.desc    Verify Promise rejected when callback throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let p: Promise<void> = lock.lockAsync<void>(() => {
        try {
          throw new Error("reject");
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      try {
        await p;
        expect().assertFail();
      } catch (error) {
        expect(error).not().assertNull();
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2700
     * @tc.desc    Verify async callback returning rejected Promise
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      try {
        let pLock: Promise<number> = lock.lockAsync<number>(async () => {
          try {
            return await Promise.reject(new Error("async reject"));
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await pLock;
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2800
     * @tc.desc    Verify using catch to handle rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      try {
        await lock.lockAsync<void>(() => {
          throw new Error("catch test");
        });
        expect().assertFail();
      } catch (error) {
        expect(error).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload2900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_2900
     * @tc.desc    Verify try block in callback executes normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(() => {
        try {
          return 100;
        } catch (e) {
          return -1;
        }
      });
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload2900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3000
     * @tc.desc    Verify exception thrown in try block enters catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(async (): Promise<number> => {
        try {
          return await Promise.reject(new Error("inner"));
          return 100;
        } catch (e) {
          return -1;
        }
      });
      expect(result).assertEqual(-1);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3100
     * @tc.desc    Verify finally block always executes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let executed: boolean = false;
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        try {
          return;
        } finally {
          executed = true;
        }
      });
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3200
     * @tc.desc    Verify await lockAsync returns normal result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let test: () => Promise<string> = async (): Promise<string> => {
        let pResult: Promise<string> = lock.lockAsync<string>(() => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let result: string = await pResult;
        return result;
      };
      let r = await test();
      expect(r).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3300
     * @tc.desc    Verify await lockAsync with rejected Promise
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let test: () => Promise<void> = async (): Promise<void> => {
        try {
          await lock.lockAsync<void>(() => {
            throw new Error("fail");
          });
          expect().assertFail();
        } catch (e) {
          expect(e).not().assertNull();
        }
      };
      await test();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3400
     * @tc.desc    Verify Promise then chaining
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      try {
        let lock = new AsyncLock();
        let p: Promise<string> = lock.lockAsync<string>(() => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        p.then((result: string): void => {
          expect(result).assertEqual("test");
          done();
        }).catch((error): void => {
          console.error(`testAsyncLockLockAsyncFirstOverload3400 failed: ${error}`);
          expect(false).assertFail();
          done();
        });
      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3400 failed");
        expect(false).assertFail();
        done();
      }
    })

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3500
     * @tc.desc    Verify multiple lockAsync requests all execute
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let order: number[] = [];
      let lock = new AsyncLock();
      await Promise.all([
        lock.lockAsync<void>(() => {
          try {
            order.push(1);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }),
        lock.lockAsync<void>(() => {
          try {
            order.push(2);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }),
        lock.lockAsync<void>(() => {
          try {
            order.push(3);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        })
      ]);
      expect(order.length).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3600
     * @tc.desc    Verify lockAsync with generic type string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<string> = lock.lockAsync<string>(() => {
        try {
          return "test";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: string = await pResult;
      expect(typeof result).assertEqual("string");

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3700
     * @tc.desc    Verify lockAsync with generic type boolean
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<boolean> = lock.lockAsync<boolean>(() => {
        try {
          return true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: boolean = await pResult;
      expect(result).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3800
     * @tc.desc    Verify lockAsync with generic type array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<number[]> = lock.lockAsync<number[]>(() => {
        try {
          return [1, 2, 3];
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: number[] = await pResult;
      expect(Array.isArray(result)).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload3900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_3900
     * @tc.desc    Verify lockAsync with generic type object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<ResultObj> = lock.lockAsync<ResultObj>(() => {
        try {
          return ({ id: 1 });
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: ResultObj = await pResult;
      expect(result.id).assertEqual(1);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload3900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4000
     * @tc.desc    Verify lockAsync with generic type union
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pStrResult: Promise<string | number> = lock.lockAsync<string | number>(() => {
        try {
          return "text";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let strResult: string | number = await pStrResult;
      let pNumResult: Promise<string | number> = lock.lockAsync<string | number>(() => {
        try {
          return 42;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let numResult: string | number = await pNumResult;
      expect(typeof strResult).assertEqual("string");
      expect(typeof numResult).assertEqual("number");
      expect(strResult).assertEqual("text");
      expect(numResult).assertEqual(42);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4100
     * @tc.desc    Verify lockAsync with generic type null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<null> = lock.lockAsync<null>(() => {
        try {
          return null;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      let result: null = await pResult;
      expect(result).assertNull();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4200
     * @tc.desc    Verify lockAsync auto acquires lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
      });

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4300
     * @tc.desc    Verify first overload uses exclusive lock by default
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseFirst: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        let p1: Promise<void> = lock.lockAsync<void>(async (): Promise<void> => {
          try {
            startedResolve();
            await new Promise<void>((resolve): void => {
              releaseFirst = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await startedPromise;
        let secondStarted = false;
        let p2: Promise<void> = lock.lockAsync<void>((): void => {
          try {
            secondStarted = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        let state = lock.query();
        expect(state.pending.length).assertEqual(1);
        expect(secondStarted).assertFalse();
        releaseFirst();
        await p1;
        await p2;
        expect(secondStarted).assertTrue();
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4300 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4400
     * @tc.desc    Verify callback executes after lock acquisition
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let callbackExecuted: boolean = false;
      await lock.lockAsync<void>(() => {
        callbackExecuted = true;
      });
      expect(callbackExecuted).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4500
     * @tc.desc    Verify callback execution context ID is correct
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = AsyncLock.request("ctxTest_4500");
      await lock.lockAsync<void>(() => {
        try {
          let state = lock.query();
          expect(state.held.length).assertLarger(0);
          expect(state.held[0].contextId).assertLarger(0);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4600
     * @tc.desc    Verify lockAsync callback executes normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      await lock.lockAsync<void>(() => {
        try {
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      });
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4700
     * @tc.desc    Verify performance with many lockAsync calls
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let count = 0;
      for (let i: number = 0; i < 100; i++) {
        let pLock: Promise<void> = lock.lockAsync<void>(() => {
          try {
            count++;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await pLock;
      }
      expect(count).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4800
     * @tc.desc    Verify multiple concurrent lockAsync requests
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let promises: Promise<number>[] = [
        lock.lockAsync<number>(() => {
          try {
            return 1;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }),
        lock.lockAsync<number>(() => {
          try {
            return 2;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }),
        lock.lockAsync<number>(() => {
          try {
            return 3;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        })
      ];
      let results: number[] = await Promise.all(promises);
      expect(results.length).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload4900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_4900
     * @tc.desc    Verify lockAsync returned Promise can use finally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let finallyExecuted = false;
        let p: Promise<void> = lock.lockAsync<void>(() => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        try {
          await p;
        } finally {
          finallyExecuted = true;
        }

        expect(finallyExecuted).assertTrue();
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload4900 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload5000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_5000
     * @tc.desc    Verify lock is released after async callback completes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncFirstOverload5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseCallback: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        let p: Promise<void> = lock.lockAsync<void>(async (): Promise<void> => {
          try {
            startedResolve();
            await new Promise<void>((resolve): void => {
              releaseCallback = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        });
        await startedPromise;
        let stateDuring = lock.query();
        expect(stateDuring.held.length).assertEqual(1);
        releaseCallback();
        await p;
        let stateAfter = lock.query();
        expect(stateAfter.held.length).assertEqual(0);
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload5000 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncFirstOverload5100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_FIRST_OVERLOAD_TEST_5100
     * @tc.desc    Verify bulk execution with async callback completes correctly
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncFirstOverload5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let count = 0;
        for (let i: number = 0; i < 100; i++) {
          let pLock: Promise<number> = lock.lockAsync<number>(async (): Promise<number> => {
            try {
              count++;
              return 1;
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          });
          await pLock;
        }
        expect(count).assertEqual(100);
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncFirstOverload5100 failed");
        expect(false).assertFail();
        done();
      }
    });
  })
}
