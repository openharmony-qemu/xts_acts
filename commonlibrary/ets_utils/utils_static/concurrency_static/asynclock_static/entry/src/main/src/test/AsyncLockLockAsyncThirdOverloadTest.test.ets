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

export default function AsyncLockLockAsyncThirdOverloadTest(): void {
  describe('AsyncLockLockAsyncThirdOverloadTest', (): void => {
    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0100
     * @tc.desc    Verify lockAsync Third overload requires callback, mode and options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      let executed = false;
      const lockAsyncCallback1 = (): void => {
          try {
            executed = true;
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
      await lock.lockAsync<void, void>(
        lockAsyncCallback1,
        AsyncLockMode.EXCLUSIVE,
        options
      );
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0200
     * @tc.desc    Verify must pass callback, mode and options three parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      const lockAsyncCallback2 = (): void => {};
      let p: Promise<void> = lock.lockAsync<void, void>(
        lockAsyncCallback2, AsyncLockMode.EXCLUSIVE, options);
      expect(p instanceof Promise).assertTrue();
      await p;

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0300
     * @tc.desc    Verify callback parameter passes normal function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      const lockAsyncCallback3 = (): number => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result = await lock.lockAsync<number, number>(
        lockAsyncCallback3, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0400
     * @tc.desc    Verify callback parameter passes arrow function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      const lockAsyncCallback4 = (): string => {
        try {
          return "test";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result = await lock.lockAsync<string, string>(
        lockAsyncCallback4, AsyncLockMode.SHARED, options);
      expect(result).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0500
     * @tc.desc    Verify callback parameter passes async function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<int>();
      const lockAsyncCallback5 = async (): Promise<int> => {
        try {
          return await Promise.resolve(42);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: int = await lock.lockAsync<int, int>(
        lockAsyncCallback5, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(42);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0600
     * @tc.desc    Verify callback returns void
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();

      const lockAsyncCallback6 = (): void => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: void = await lock.lockAsync<void, void>(
        lockAsyncCallback6, AsyncLockMode.EXCLUSIVE, options);

      expect(result).assertUndefined();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0600 failed");
        expect(false).assertFail();
      }
      done();
    })

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0700
     * @tc.desc    Verify callback returns null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      const lockAsyncCallback7 = (): string | null => {
        try {
          return null;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: string | null = await lock.lockAsync<string | null, string>(
        lockAsyncCallback7, AsyncLockMode.SHARED, options);
      expect(result).assertNull();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0800
     * @tc.desc    Verify mode parameter passes SHARED
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let heldMode: AsyncLockMode | undefined = undefined;

      const lockAsyncCallback8 = (): void => {
        let state = lock.query();
        if (state.held.length > 0) {
          heldMode = state.held[0].mode;
        }
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback8, AsyncLockMode.SHARED, options);
      expect(heldMode).assertEqual(AsyncLockMode.SHARED);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0900
     * @tc.desc    Verify mode parameter passes EXCLUSIVE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let exclusiveModeAccepted = false;
      const lockAsyncCallback9 = (): void => {
        let state = lock.query();
        if (state.held.length > 0) {
          exclusiveModeAccepted = (state.held[0].mode === AsyncLockMode.EXCLUSIVE);
        }
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback9, AsyncLockMode.EXCLUSIVE, options);
      expect(exclusiveModeAccepted).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload0900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1000
     * @tc.desc    Verify AsyncLockMode SHARED and EXCLUSIVE are distinct values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(AsyncLockMode.SHARED !== AsyncLockMode.EXCLUSIVE).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1100
     * @tc.desc    Verify options parameter passes default constructed AsyncLockOptions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let executed = false;

      const lockAsyncCallback10 = (): void => {
        executed = true;
        let state = lock.query();
        expect(state.held.length > 0).assertTrue();
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback10, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1200
     * @tc.desc    Verify options sets timeout property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      const lockAsyncCallback11 = (): void => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let p = lock.lockAsync<void, void>(
        lockAsyncCallback11, AsyncLockMode.EXCLUSIVE, options);
      expect(p instanceof Promise).assertTrue();
      await p;

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1300
     * @tc.desc    Verify options sets isAvailable property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      let executed = false;
      const lockAsyncCallback12 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback12, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1400
     * @tc.desc    Verify options sets signal property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      let executed = false;
      const lockAsyncCallback13 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, string>(
        lockAsyncCallback13, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1500
     * @tc.desc    Verify options uses parameterized constructor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>(false, s, 3000);
      expect(options.isAvailable).assertEqual(false);
      expect(options.signal).assertEqual(s);
      expect(options.timeout).assertEqual(3000);
      const lockAsyncCallback14 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, string>(
        lockAsyncCallback14, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1600
     * @tc.desc    Verify timeout=0 means no timeout limit
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 0;
      const lockAsyncCallback15 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback15, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1700
     * @tc.desc    Verify timeout=1 means 1ms timeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 1;
      const lockAsyncCallback16 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback16, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1800
     * @tc.desc    Verify timeout sets large value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 60000;
      const lockAsyncCallback17 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback17, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1900
     * @tc.desc    Verify isAvailable=false means blocking wait
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.isAvailable = false;
      const lockAsyncCallback18 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback18, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload1900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2000
     * @tc.desc    Verify signal=null means no cancellation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.signal = null;
      expect(options.signal).assertNull();
      const lockAsyncCallback19 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback19, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2100
     * @tc.desc    Verify await returns callback result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      const lockAsyncCallback20 = (): string => {
        try {
          return "result";
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: string = await lock.lockAsync<string, string>(
        lockAsyncCallback20, AsyncLockMode.SHARED, options);
      expect(result).assertEqual("result");

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2200
     * @tc.desc    Verify lock is automatically released after callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      const lockAsyncCallback21 = (): void => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback21, AsyncLockMode.EXCLUSIVE, options);
      let state = lock.query();
      expect(state.held.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2300
     * @tc.desc    Verify callback returns empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number[]>();
      const lockAsyncCallback22 = (): number[] => {
        try {
          return [];
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: number[] = await lock.lockAsync<number[], number[]>(
        lockAsyncCallback22, AsyncLockMode.EXCLUSIVE, options);
      expect(result.length).assertEqual(0);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2400
     * @tc.desc    Verify generic T and U types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      const lockAsyncCallback23 = (): number => {
        try {
          return 1;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result = await lock.lockAsync<number, string>(
        lockAsyncCallback23, AsyncLockMode.EXCLUSIVE, options);
      expect(typeof result).assertEqual("number");

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2500
     * @tc.desc    Verify callback returns number max value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      const lockAsyncCallback24 = (): number => {
        try {
          return Number.MAX_VALUE;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result = await lock.lockAsync<number, number>(
        lockAsyncCallback24, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(Number.MAX_VALUE);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2500 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2600
     * @tc.desc    Verify callback throws Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let errorCaught = false;
      try {
        const lockAsyncCallback25 = (): void => {
          throw new Error("callback error");
        };
        await lock.lockAsync<void, void>(
          lockAsyncCallback25, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error.message).assertEqual("callback error");
      }
      expect(errorCaught).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2600 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2700
     * @tc.desc    Verify callback throws custom Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {

      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let errorCaught = false;
      try {
        const lockAsyncCallback26 = (): void => {
          throw new CustomError("custom error");
        };
        await lock.lockAsync<void, void>(
          lockAsyncCallback26, AsyncLockMode.SHARED, options);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error.message).assertEqual("custom error");
      }
      expect(errorCaught).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2800
     * @tc.desc    Verify callback throws exception causes rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      const lockAsyncCallback27 = (): Promise<void> => Promise.reject(new Error("reject"));
      let p = lock.lockAsync<void, void>(
        lockAsyncCallback27, AsyncLockMode.EXCLUSIVE, options);
      let errorCaught = false;
      try {
        await p;
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error.message).assertEqual("reject");
      }
      expect(errorCaught).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2900
     * @tc.desc    Verify isAvailable=true lock can be acquired immediately
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      let executed = false;

      const lockAsyncCallback28 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback28, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload2900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3000
     * @tc.desc    Verify non-blocking mode does not wait
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let releaseFirst: () => void = () => {};
      let firstStartedResolve: () => void = () => {};
      let firstStartedPromise: Promise<void> = new Promise<void>((resolve): void => {
        firstStartedResolve = (): void => { resolve(undefined); };
      });
      const lockAsyncCallback29 = async (): Promise<void> => {
        firstStartedResolve();
        try {
          await new Promise<void>((resolve): void => {
            releaseFirst = (): void => { resolve(undefined); };
          });
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let p1: Promise<void> = lock.lockAsync<void>(
        lockAsyncCallback29, AsyncLockMode.EXCLUSIVE);
      try {
        await firstStartedPromise;
      } catch (error) {
        console.error(`callback failed: ${error}`);
        throw error;
      }
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      let errorCaught = false;
      try {
        const lockAsyncCallback30 = (): void => {};
        await lock.lockAsync<void, void>(
          lockAsyncCallback30, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
      }
      expect(errorCaught).assertTrue();
      releaseFirst();
      await p1;

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3100
     * @tc.desc    Verify isAvailable=false blocks waiting for lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.isAvailable = false;

      let executed = false;
      let executionOrder: number[] = [];

      const lockAsyncCallback31 = (): void => {
        try {
          executionOrder.push(1);
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let p1: Promise<void> = lock.lockAsync<void, void>(
        lockAsyncCallback31, AsyncLockMode.EXCLUSIVE, options);

      const lockAsyncCallback32 = (): void => {
        try {
          executionOrder.push(2);
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let p2: Promise<void> = lock.lockAsync<void, void>(
        lockAsyncCallback32, AsyncLockMode.EXCLUSIVE, options);

      await p1;
      await p2;

      expect(executed).assertTrue();
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3200
     * @tc.desc    Verify timeout>0 enables timeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      let executed = false;
      const lockAsyncCallback33 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback33, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3300
     * @tc.desc    Verify acquire lock before timeout succeeds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 2000;

      let executed = false;
      const lockAsyncCallback34 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, void>(
        lockAsyncCallback34, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3400
     * @tc.desc    Verify signal.aborted=false request continues
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      let executed = false;
      const lockAsyncCallback35 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, string>(
        lockAsyncCallback35, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3500
     * @tc.desc    Verify signal.aborted=true request cancelled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let s: AbortSignal<string> = { aborted: true, reason: "User cancelled" };
        let options = new AsyncLockOptions<string>();
        options.signal = s;
        let rejected = false;
        try {
          const lockAsyncCallback36 = (): void => {};
          await lock.lockAsync<void, string>(
            lockAsyncCallback36, AsyncLockMode.EXCLUSIVE, options);
          expect().assertFail();
        } catch (error) {
          rejected = true;
          expect(error instanceof Error).assertTrue();
          expect(error.message).assertEqual("User cancelled");
        }
        expect(rejected).assertTrue();
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3500 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3600
     * @tc.desc    Verify reason passed to rejection error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let s: AbortSignal<string> = { aborted: true, reason: "User cancelled" };
        let options = new AsyncLockOptions<string>();
        options.signal = s;
        let rejected = false;
        try {
          const lockAsyncCallback37 = (): void => {
            try {
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          };
          await lock.lockAsync<void, string>(
            lockAsyncCallback37, AsyncLockMode.EXCLUSIVE, options);
          expect().assertFail();
        } catch (error) {
          rejected = true;
          expect(error instanceof Error).assertTrue();
          expect(error.message).assertEqual("User cancelled");
        }
        expect(rejected).assertTrue();
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3600 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3700
     * @tc.desc    Verify T and U use same type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      const lockAsyncCallback38 = (): number => {
        try {
          return 100;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: number = await lock.lockAsync<number, number>(
        lockAsyncCallback38, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(100);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3700 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3800
     * @tc.desc    Verify T and U use different types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      const lockAsyncCallback39 = (): number => {
        try {
          return 42;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: number = await lock.lockAsync<number, string>(
        lockAsyncCallback39, AsyncLockMode.EXCLUSIVE, options);
      expect(typeof result).assertEqual("number");

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3800 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3900
     * @tc.desc    Verify T is void U is other type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();

      let executed = false;
      const lockAsyncCallback40 = (): void => {
        try {
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let result: void = await lock.lockAsync<void, string>(
        lockAsyncCallback40, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();
      expect(result).assertUndefined();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload3900 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4000
     * @tc.desc    Verify signal.aborted=false executes callback normally
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;

      let executed = false;
      const lockAsyncCallback41 = (): void => {
        try {
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      await lock.lockAsync<void, string>(
        lockAsyncCallback41, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4000 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4100
     * @tc.desc    Verify await lockAsync with options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let test: () => Promise<string> = async (): Promise<string> => {
        const lockAsyncCallback42 = (): string => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        try {
          return await lock.lockAsync<string, string>(
            lockAsyncCallback42, AsyncLockMode.EXCLUSIVE, options);
        } catch (error) {
          console.error(`testAsyncLockLockAsyncThirdOverload4100 helper failed: ${error}`);
          throw error;
        }
      };
      let r = await test();
      expect(r).assertEqual("test");

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4200
     * @tc.desc    Verify then chain call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: () => void): void => {
      try {
        let lock = new AsyncLock();
        let options = new AsyncLockOptions<string>();
        const lockAsyncCallback43 = (): string => {
          try {
            return "test";
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p: Promise<string> = lock.lockAsync<string, string>(
          lockAsyncCallback43, AsyncLockMode.SHARED, options);
        p.then((result: string): void => {
          expect(result).assertEqual("test");
          done();
        }).catch((error): void => {
          console.error(`testAsyncLockLockAsyncThirdOverload4200 failed: ${error}`);
          expect(false).assertFail();
          done();
        });
      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4200 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4300
     * @tc.desc    Verify lockAsync rejection is handled via catch
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let errorCaught = false;
      try {
        const lockAsyncCallback44 = (): Promise<void> => Promise.reject(new Error("catch"));
        await lock.lockAsync<void, void>(
          lockAsyncCallback44, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        errorCaught = true;
        expect(error.message).assertEqual("catch");
      }
      expect(errorCaught).assertTrue();

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4400
     * @tc.desc    Verify multiple concurrent lockAsync with options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncThirdOverload4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let counterLock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let executedCount = 0;

      const lockAsyncCallback45 = async (): Promise<void> => {
          try {
            const lockAsyncCallback46 = (): void => {
              try {
                executedCount++;
              } catch (error) {
                console.error(`callback failed: ${error}`);
                throw error;
              }
            };
            await counterLock.lockAsync<void, void>(
              lockAsyncCallback46, AsyncLockMode.EXCLUSIVE, options);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
      const lockAsyncCallback47 = async (): Promise<void> => {
          try {
            const lockAsyncCallback48 = (): void => {
              try {
                executedCount++;
              } catch (error) {
                console.error(`callback failed: ${error}`);
                throw error;
              }
            };
            await counterLock.lockAsync<void, void>(
              lockAsyncCallback48, AsyncLockMode.EXCLUSIVE, options);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
      const lockAsyncCallback49 = async (): Promise<void> => {
          try {
            const lockAsyncCallback50 = (): void => {
              try {
                executedCount++;
              } catch (error) {
                console.error(`callback failed: ${error}`);
                throw error;
              }
            };
            await counterLock.lockAsync<void, void>(
              lockAsyncCallback50, AsyncLockMode.EXCLUSIVE, options);
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
      await Promise.all([
        lock.lockAsync<void, void>(
          lockAsyncCallback45, AsyncLockMode.SHARED, options),
        lock.lockAsync<void, void>(
          lockAsyncCallback47, AsyncLockMode.SHARED, options),
        lock.lockAsync<void, void>(
          lockAsyncCallback49, AsyncLockMode.SHARED, options)
      ]);

      expect(executedCount).assertEqual(3);

      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4400 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4500
     * @tc.desc    Verify Promise is rejected when waiting exceeds timeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseFirst: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        const lockAsyncCallback51 = async (): Promise<void> => {
          startedResolve();
          try {
            await new Promise<void>((resolve): void => {
              releaseFirst = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback51, AsyncLockMode.EXCLUSIVE);
        await startedPromise;
        let options = new AsyncLockOptions<void>();
        options.timeout = 300;
        let errorCaught = false;
        try {
          const lockAsyncCallback52 = (): void => {
            try {
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          };
          await lock.lockAsync<void, void>(
            lockAsyncCallback52, AsyncLockMode.EXCLUSIVE, options);
          expect().assertFail();
        } catch (error) {
          errorCaught = true;
        }
        expect(errorCaught).assertTrue();
        releaseFirst();
        await p1;
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4500 failed");
        expect(false).assertFail();
        done();
      }
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4600
     * @tc.desc    Verify setting aborted=true during waiting cancels the request
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        let lock = new AsyncLock();
        let releaseFirst: () => void = () => {};
        let startedResolve: () => void = () => {};
        let startedPromise: Promise<void> = new Promise<void>((resolve): void => {
          startedResolve = (): void => { resolve(undefined); };
        });
        const lockAsyncCallback53 = async (): Promise<void> => {
          try {
            startedResolve();
            await new Promise<void>((resolve): void => {
              releaseFirst = (): void => { resolve(undefined); };
            });
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p1: Promise<void> = lock.lockAsync<void>(
          lockAsyncCallback53, AsyncLockMode.EXCLUSIVE);
        await startedPromise;
        let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
        let options = new AsyncLockOptions<string>();
        options.signal = s;
        const lockAsyncCallback54 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
        let p: Promise<void> = lock.lockAsync<void, string>(
          lockAsyncCallback54, AsyncLockMode.EXCLUSIVE, options);
        s.aborted = true;
        releaseFirst();
        await p1;
        let rejected = false;
        try {
          await p;
          expect().assertFail();
        } catch (error) {
          rejected = true;
          expect(error instanceof Error).assertTrue();
          expect(error.message).assertEqual("Aborted");
        }
        expect(rejected).assertTrue();
        done();
      } catch (error) {
        console.error("testAsyncLockLockAsyncThirdOverload4600 failed");
        expect(false).assertFail();
        done();
      }
    });

  });
}
