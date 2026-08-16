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

class CustomError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "CustomError";
  }
}

interface GeneratedObjectLiteralInterface_1 {
  value: number;
}

interface GeneratedObjectLiteralInterface_2 {
  value: number;
}

interface ResultObj {
  id: number;
}

export default function AsyncLockLockAsyncSecondOverloadTest(): void {
  describe('AsyncLockLockAsyncSecondOverloadTest', (): void => {

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0100
     * @tc.desc    Verify lockAsync with callback and EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      }, AsyncLockMode.EXCLUSIVE);
      await p1
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0200
     * @tc.desc    Verify normal function callback with EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(() => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0300
     * @tc.desc    Verify arrow function callback with SHARED mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "test";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      expect(result).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0400
     * @tc.desc    Verify void callback with EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      await lock.lockAsync<void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0500
     * @tc.desc    Verify callback returning null with SHARED mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<string | null> = lock.lockAsync<string | null>(() => {
        try {
          return null;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      let result: string | null = await pResult;
      expect(result).assertNull();

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0600
     * @tc.desc    Verify SHARED mode parameter
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;

      await lock.lockAsync<void>(() => {
        executed = true;
      }, AsyncLockMode.SHARED);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0700
     * @tc.desc    Verify callback with SHARED mode combination
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "shared_result";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      expect(result).assertEqual("shared_result");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0800
     * @tc.desc    Verify callback with EXCLUSIVE mode combination
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "exclusive_result";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(result).assertEqual("exclusive_result");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload0900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_0900
     * @tc.desc    Verify returns Promise<T>
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      }, AsyncLockMode.EXCLUSIVE);
      await p;
      expect(executed).assertTrue();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload0900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1000
     * @tc.desc    Verify await returns callback result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "result";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      expect(result).assertEqual("result");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1100
     * @tc.desc    Verify successful return in SHARED mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(() => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1200
     * @tc.desc    Verify successful return in EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(() => {
        try {
          return 200;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(result).assertEqual(200);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1300
     * @tc.desc    Verify lock auto releases after callback completes
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      let state = lock.query();
      expect(state.held.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1400
     * @tc.desc    Verify void callback executes in SHARED mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
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
      }, AsyncLockMode.SHARED);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1500
     * @tc.desc    Verify void callback executes in EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let count = 0;
      let pLock: Promise<void> = lock.lockAsync<void>(() => { count++; }, AsyncLockMode.EXCLUSIVE);
      await pLock;
      expect(count).assertEqual(1);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1600
     * @tc.desc    Verify returns empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number[] = await lock.lockAsync<number[]>(() => {
        try {
          return [];
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(result.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1700
     * @tc.desc    Verify return value type is Promise
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let p: Promise<number> = lock.lockAsync<number>(() => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      let result = await p;
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1800
     * @tc.desc    Verify generic T type correctness
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pNumResult: Promise<number> = lock.lockAsync<number>(() => {
        try {
          return 1;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      let numResult: number = await pNumResult;
      let pStrResult: Promise<string> = lock.lockAsync<string>(() => {
        try {
          return "s";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      let strResult: string = await pStrResult;
      expect(typeof numResult).assertEqual("number");
      expect(typeof strResult).assertEqual("string");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload1900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_1900
     * @tc.desc    Verify returns MAX_VALUE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: number = await lock.lockAsync<number>(() => {
        try {
          return Number.MAX_VALUE;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(result).assertEqual(Number.MAX_VALUE);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2000
     * @tc.desc    Verify returns very long string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let result: string = await lock.lockAsync<string>(() => {
        try {
          return "a".repeat(10000);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      expect(result.length).assertEqual(10000);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2100
     * @tc.desc    Verify callback throwing Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      try {
        await lock.lockAsync<void>(() => {
          throw new Error("callback error");
        }, AsyncLockMode.EXCLUSIVE);
        expect().assertFail();
      } catch (error) {
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2200
     * @tc.desc    Verify callback throwing custom Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {

      let lock = new AsyncLock();
      try {
        await lock.lockAsync<void>(() => {
          throw new CustomError("custom error");
        }, AsyncLockMode.SHARED);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof CustomError).assertTrue();
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2300
     * @tc.desc    Verify Promise rejected when callback throws exception
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let p: Promise<void> = lock.lockAsync<void>((): Promise<void> => Promise.reject(new Error("reject")), AsyncLockMode.EXCLUSIVE);
      try {
        await p;
        expect().assertFail();
      } catch (error) {
        expect(error).not().assertNull();
        expect(error.message).not().assertNull();
      }

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2400
     * @tc.desc    Verify using catch to handle rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        await lock.lockAsync<void>(() => {
          throw new Error("catch test");
        }, AsyncLockMode.SHARED);
        expect().assertFail();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2400 failed");
        expect(error).not().assertNull();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2500
     * @tc.desc    Verify multiple SHARED locks can execute concurrently
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseFirst: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        let firstFinished = false;
        let p1: Promise<void> = lock.lockAsync<void>(async (): Promise<void> => {
          startedResolve();
          try {
            await new Promise<void>((resolve): void => {
              releaseFirst = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
          firstFinished = true;
        }, AsyncLockMode.SHARED);
        await startedPromise;
        let secondFinished = false;
        let p2: Promise<void> = lock.lockAsync<void>((): void => {
          try {
            secondFinished = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        await p2;
        expect(secondFinished).assertTrue();
        expect(firstFinished).assertFalse();
        releaseFirst();
        await p1;
        expect(firstFinished).assertTrue();
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2500 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2600
     * @tc.desc    Verify SHARED lock for shared reading
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let data: GeneratedObjectLiteralInterface_1 = { value: 100 };
      let results: number[] = await Promise.all([
        lock.lockAsync<number>(() => {
          try {
            return data.value;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED),
        lock.lockAsync<number>(() => {
          try {
            return data.value;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED)
      ]);
      expect(results[0]).assertEqual(100);
      expect(results[1]).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2700
     * @tc.desc    Verify EXCLUSIVE lock executes requests sequentially
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let order: int[] = [];
      await lock.lockAsync<void>(() => {
        try {
          order.push(1);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      await lock.lockAsync<void>(() => {
        try {
          order.push(2);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(order).assertDeepEquals([1, 2]);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2800
     * @tc.desc    Verify EXCLUSIVE lock for write scenarios
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let data: GeneratedObjectLiteralInterface_2 = { value: 0 };
      await lock.lockAsync<void>(() => {
        try {
          data.value = 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      expect(data.value).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload2900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_2900
     * @tc.desc    Verify await lockAsync in SHARED mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let test: () => Promise<string> = async (): Promise<string> => {
        return await lock.lockAsync<string>(() => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
      };
      let r = await test();
      expect(r).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload2900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3000
     * @tc.desc    Verify await lockAsync in EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let test: () => Promise<string> = async (): Promise<string> => {
        return await lock.lockAsync<string>(() => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
      };
      let r: string = await test();
      expect(r).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3100
     * @tc.desc    Verify then chaining
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (done: () => void): void => {
      try {
        let lock = new AsyncLock();
        let p: Promise<string> = lock.lockAsync<string>(() => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        p.then((result: string): void => {
          expect(result).assertEqual("test");
          done();
        }).catch((error): void => {
          console.error(`testAsyncLockLockAsyncSecondOverload3100 failed: ${error}`);
          expect(false).assertFail();
          done();
        });
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3100 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3200
     * @tc.desc    Verify catch chaining
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        await lock.lockAsync<void>(() => {
          throw new Error("catch");
        }, AsyncLockMode.EXCLUSIVE);
        expect().assertFail();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3200 failed");
        expect(error).not().assertNull();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3300
     * @tc.desc    Verify multiple concurrent SHARED locks
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
        }, AsyncLockMode.SHARED),
        lock.lockAsync<number>(() => {
          try {
            return 2;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED),
        lock.lockAsync<number>(() => {
          try {
            return 3;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED)
      ];
      let results: number[] = await Promise.all(promises);
      expect(results.length).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3400
     * @tc.desc    Verify multiple concurrent EXCLUSIVE locks queue
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let order: number[] = [];

      await Promise.all([
        lock.lockAsync<void>(() => {
          try {
            order.push(1);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE),
        lock.lockAsync<void>(() => {
          try {
            order.push(2);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE),
        lock.lockAsync<void>(() => {
          try {
            order.push(3);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE)
      ]);

      expect(order[0]).assertEqual(1);
      expect(order[1]).assertEqual(2);
      expect(order[2]).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3500
     * @tc.desc    Verify lockAsync with generic type number
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<number> = lock.lockAsync<number>(() => {
        try {
          return 123;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      let result: number = await pResult;
      expect(typeof result).assertEqual("number");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3600
     * @tc.desc    Verify lockAsync with generic type string
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<string> = lock.lockAsync<string>(() => {
        try {
          return "test";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      let result: string = await pResult;
      expect(typeof result).assertEqual("string");

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3700
     * @tc.desc    Verify lockAsync with generic type array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<number[]> = lock.lockAsync<number[]>(() => {
        try {
          return [1, 2, 3];
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);
      let result: number[] = await pResult;
      expect(result.length).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3800
     * @tc.desc    Verify lockAsync with generic type object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let pResult: Promise<ResultObj> = lock.lockAsync<ResultObj>(() => {
        try {
          return ({ id: 1 });
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);
      let result: ResultObj = await pResult;
      expect(result.id).assertEqual(1);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload3900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_3900
     * @tc.desc    Verify SHARED lock held state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        let state = lock.query();
        expect(state.held.length).assertLarger(0);
      }, AsyncLockMode.SHARED);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload3900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4000
     * @tc.desc    Verify multiple SHARED locks state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();

      let promise1: Promise<number> = lock.lockAsync<number>(() => {
        try {
          let state = lock.query();
          return state.held.length;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);

      let promise2: Promise<void> = lock.lockAsync<void>(() => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.SHARED);

      let results = await Promise.all([promise1, promise2]);
      let heldCount = results[0];

      expect(heldCount).assertLarger(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4100
     * @tc.desc    Verify EXCLUSIVE lock held state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      await lock.lockAsync<void>(() => {
        try {
          let state = lock.query();
          expect(state.held.length).assertEqual(1);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      }, AsyncLockMode.EXCLUSIVE);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4200
     * @tc.desc    Verify multiple SHARED lock requests all execute
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let count = 0;
      await Promise.all([
        lock.lockAsync<void>(() => {
          try {
            count++;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED),
        lock.lockAsync<void>(() => {
          try {
            count++;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED),
        lock.lockAsync<void>(() => {
          try {
            count++;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED)
      ]);
      expect(count).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4300
     * @tc.desc    Verify EXCLUSIVE mode sequential execution
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let count = 0;
      for (let i: number = 0; i < 10; i++) {
        let pLock: Promise<void> = lock.lockAsync<void>(() => {
          try {
            count++;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        await pLock;
      }
      expect(count).assertEqual(10);

      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4400
     * @tc.desc    Verify callback parameter passes async function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let result: string = await lock.lockAsync<string>(async (): Promise<string> => {
          try {
            return await Promise.resolve("async_exclusive");
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        expect(result).assertEqual("async_exclusive");
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4400 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4500
     * @tc.desc    Verify AsyncLockMode enum values SHARED is 1 and EXCLUSIVE is 2
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(AsyncLockMode.SHARED).assertEqual(1);
      expect(AsyncLockMode.EXCLUSIVE).assertEqual(2);
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4600
     * @tc.desc    Verify async callback combined with SHARED mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let result: string = await lock.lockAsync<string>(async (): Promise<string> => {
          try {
            return await Promise.resolve("async_shared");
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        expect(result).assertEqual("async_shared");
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4600 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4700
     * @tc.desc    Verify async callback combined with EXCLUSIVE mode
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncSecondOverload4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let pResult: Promise<string> = lock.lockAsync<string>(async (): Promise<string> => {
          try {
            return await Promise.resolve("async_exclusive_mode");
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        let result: string = await pResult;
        expect(result).assertEqual("async_exclusive_mode");
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4700 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4800
     * @tc.desc    Verify SHARED and EXCLUSIVE locks mixed usage
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseShared0: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        let shared1Done = false;
        let exclusiveStarted = false;
        let pShared0: Promise<void> = lock.lockAsync<void>(async (): Promise<void> => {
          try {
            startedResolve();
            await new Promise<void>((resolve): void => {
              releaseShared0 = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        await startedPromise;
        let pShared1: Promise<void> = lock.lockAsync<void>((): void => {
          try {
            shared1Done = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        await pShared1;
        expect(shared1Done).assertTrue();
        let pExclusive: Promise<void> = lock.lockAsync<void>((): void => {
          try {
            exclusiveStarted = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        expect(exclusiveStarted).assertFalse();
        releaseShared0();
        await pExclusive;
        expect(exclusiveStarted).assertTrue();
        await pShared0;
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4800 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload4900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_4900
     * @tc.desc    Verify EXCLUSIVE lock blocks subsequent SHARED lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseExclusive: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        let sharedDone = false;
        let pExclusive: Promise<void> = lock.lockAsync<void>(async (): Promise<void> => {
          try {
            startedResolve();
            await new Promise<void>((resolve): void => {
              releaseExclusive = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        await startedPromise;
        let pShared: Promise<void> = lock.lockAsync<void>((): void => {
          try {
            sharedDone = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.SHARED);
        let state = lock.query();
        expect(state.pending.length).assertLarger(0);
        expect(sharedDone).assertFalse();
        releaseExclusive();
        await pShared;
        expect(sharedDone).assertTrue();
        await pExclusive;
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload4900 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncSecondOverload5000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_SECOND_OVERLOAD_TEST_5000
     * @tc.desc    Verify pending contains waiting info when EXCLUSIVE lock is waiting
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncSecondOverload5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
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
        }, AsyncLockMode.EXCLUSIVE);
        await startedPromise;
        let p2: Promise<void> = lock.lockAsync<void>((): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        }, AsyncLockMode.EXCLUSIVE);
        let state = lock.query();
        expect(state.pending.length).assertEqual(1);
        expect(state.pending[0].mode).assertEqual(AsyncLockMode.EXCLUSIVE);
        releaseFirst();
        await p1;
        await p2;
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncSecondOverload5000 failed");
        expect(false).assertFail();
        done();
      }
    });
  })
}
