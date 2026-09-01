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
import { sleep } from './utils/utils';

interface LockData {
  id: number;
}

export default function AsyncLockOptionsConstructorTest(): void {
  describe('AsyncLockOptionsConstructorTest', (): void => {

    /**
     * @tc.name    testAsyncLockOptionsConstructor0100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify no-argument constructor creates AsyncLockOptions instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options instanceof AsyncLockOptions).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify created instance can be used for lockAsync
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let executed = false;

      const lockAsyncCallback1 = (): void => {
        executed = true;
      };
      await lock.lockAsync<void, string>(
        lockAsyncCallback1, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockOptionsConstructor0200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify isAvailable default value is false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options.isAvailable).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify signal default value is null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options.signal === null).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify timeout default value is 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify creating many instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let optionsArray: AsyncLockOptions<string>[] = [];
      for (let i = 0; i < 100; i++) {
        optionsArray.push(new AsyncLockOptions<string>());
      }
      expect(optionsArray.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify different generic types have same default values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options1 = new AsyncLockOptions<string>();
      let options2 = new AsyncLockOptions<number>();
      expect(options1.isAvailable).assertEqual(options2.isAvailable);
      expect(options1.signal === null).assertTrue();
      expect(options2.signal === null).assertTrue();
      expect(options1.timeout).assertEqual(options2.timeout);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0800
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify generic affects signal type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      options.signal = s;
      expect(options.signal).not().assertNull();
      expect(options.signal?.aborted).assertFalse();
      expect(options.signal?.reason).assertEqual("test");
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0900
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify no-arg constructor is suitable for flexible config
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      let needNonBlocking = true;
      let needTimeout = true;
      if (needNonBlocking) {
        options.isAvailable = true;
      }
      if (needTimeout) {
        options.timeout = 1000;
      }
      expect(options.isAvailable).assertTrue();
    })

    /**
     * @tc.name    testAsyncLockOptionsConstructor1000
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify Parameterized constructors are suitable for scenarios where known fixed values need to be configured.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 3000);

      expect(options.isAvailable).assertFalse();
      expect(options.signal).not().assertNull();
      expect(options.signal?.reason).assertEqual("test");
      expect(options.timeout).assertEqual(3000);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify set properties then use for lockAsync
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      options.isAvailable = true;
      options.timeout = 1000;
      let executed = false;

      const lockAsyncCallback2 = (): void => {
        try {
          executed = true;
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      await lock.lockAsync<void, string>(
        lockAsyncCallback2, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

      } catch (error) {
        console.error("testAsyncLockOptionsConstructor1100 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify multiple locks use same options instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      const lockAsyncCallback3 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
      const lockAsyncCallback4 = (): void => {
          try {
          } catch (error) {
            console.error(`callback failed: ${error}`);
            throw error;
          }
        };
      await expect(Promise.all([
        lock.lockAsync<void, void>(
          lockAsyncCallback3, AsyncLockMode.SHARED, options),
        lock.lockAsync<void, void>(
          lockAsyncCallback4, AsyncLockMode.SHARED, options)
      ])).assertPromiseIsResolved();

      } catch (error) {
        console.error("testAsyncLockOptionsConstructor1200 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify set AbortSignal then use
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      const lockAsyncCallback5 = (): void => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let pCheck: Promise<void> = lock.lockAsync<void, string>(
        lockAsyncCallback5, AsyncLockMode.EXCLUSIVE, options);
      await expect(pCheck).assertPromiseIsResolved();

      } catch (error) {
        console.error("testAsyncLockOptionsConstructor1300 failed");
        expect(false).assertFail();
      }
      done();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1400
     * @tc.desc    Verify aborted signal causes lockAsync to reject
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
      let lock = new AsyncLock();
      // A signal that is already aborted must cause lockAsync to reject.
      let s: AbortSignal<string> = { aborted: true, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      let rejected = false;
      const lockAsyncCallback6 = (): void => {
        try {
        } catch (error) {
          console.error(`callback failed: ${error}`);
          throw error;
        }
      };
      let pReject: Promise<void> = lock.lockAsync<void, string>(
        lockAsyncCallback6, AsyncLockMode.EXCLUSIVE, options);
      try {
        await pReject;
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
      } catch (error) {
        console.error("testAsyncLockOptionsConstructor1400 failed");
        expect(false).assertFail();
      }
      done();
    });


    /**
     * @tc.name    testAsyncLockOptionsConstructor1500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1500
     * @tc.desc    Verify no-arg constructor with manual settings matches parameterized constructor properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options1 = new AsyncLockOptions<string>();
      options1.isAvailable = true;
      options1.signal = s;
      options1.timeout = 1000;

      let options2 = new AsyncLockOptions<string>(true, s, 1000);
      expect(options1.isAvailable).assertEqual(options2.isAvailable);
      expect(options1.timeout).assertEqual(options2.timeout);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1600
     * @tc.desc    Verify AsyncLockOptions<boolean> no-arg construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<boolean>();
      expect(options.isAvailable).assertFalse();
      expect(options.signal === null).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1700
     * @tc.desc    Verify AsyncLockOptions<LockData> no-arg construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<LockData>();
      expect(options.isAvailable).assertFalse();
      expect(options.signal === null).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1800
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1800
     * @tc.desc    Verify AsyncLockOptions<number[]> no-arg construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<number[]>();
      expect(options.isAvailable).assertFalse();
      expect(options.signal === null).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1900
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1900
     * @tc.desc    Verify AsyncLockOptions<string | number> no-arg construction
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string | number>();
      expect(options.isAvailable).assertFalse();
      expect(options.signal === null).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2000
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2000
     * @tc.desc    Verify instance contains isAvailable signal and timeout properties
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      expect(typeof options.isAvailable).assertEqual("boolean");
      expect(options.signal === null).assertTrue();
      expect(typeof options.timeout).assertEqual("int");
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2100
     * @tc.desc    Verify dynamically setting signal.aborted true cancels waiting request
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let lock = new AsyncLock();
          let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
          let options = new AsyncLockOptions<string>();
          options.signal = s;
          const lockAsyncCallback7 = (): Promise<void> => {
            try {
              return sleep(300);
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          };
          let holder: Promise<void> = lock.lockAsync<void>(
            lockAsyncCallback7);
          const lockAsyncCallback8 = (): void => {
            try {
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          };
          let p: Promise<void> = lock.lockAsync<void, string>(
            lockAsyncCallback8, AsyncLockMode.EXCLUSIVE, options);
          let abortAfterDelay: Promise<void> = (async (): Promise<void> => {
            try {
              await sleep(100);
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
            s.aborted = true;
          })();
          let rejected = false;
          try {
            await p;
          } catch (error) {
            rejected = true;
          }
          await abortAfterDelay;
          expect(rejected).assertTrue();
          await holder;
          done();
        } catch (error) {
          console.error("testAsyncLockOptionsConstructor2100 failed");
          expect(false).assertFail();
          done();
        }
      });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2200
     * @tc.desc    Verify explicitly setting isAvailable to false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      options.isAvailable = true;
      options.isAvailable = false;
      expect(options.isAvailable).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2300
     * @tc.desc    Verify setting isAvailable multiple times keeps latest value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      options.isAvailable = true;
      options.isAvailable = false;
      options.isAvailable = true;
      expect(options.isAvailable).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2400
     * @tc.desc    Verify setting signal to null after assigning object
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      options.signal = null;
      expect(options.signal === null).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2500
     * @tc.desc    Verify setting signal.aborted property to true
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      options.signal!.aborted = true;
      expect(options.signal!.aborted).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2600
     * @tc.desc    Verify setting signal.reason property to new value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      options.signal!.reason = "New reason";
      expect(options.signal!.reason).assertEqual("New reason");
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2700
     * @tc.desc    Verify setting timeout to 0 stores 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      options.timeout = 1000;
      options.timeout = 0;
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2800
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2800
     * @tc.desc    Verify setting timeout to large integer value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      options.timeout = 60000;
      expect(options.timeout).assertEqual(60000);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor2900
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_2900
     * @tc.desc    Verify setting timeout to 1 minimal positive value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      options.timeout = 1;
      expect(options.timeout).assertEqual(1);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor3000
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_3000
     * @tc.desc    Verify setting timeout to negative value stored as-is
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      options.timeout = -1;
      expect(options.timeout).assertEqual(-1);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor3100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_3100
     * @tc.desc    Verify setting timeout to int maximum boundary value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      options.timeout = 2147483647;
      expect(options.timeout).assertEqual(2147483647);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor3200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_3200
     * @tc.desc    Verify AsyncLockOptions<number> signal accepts AbortSignal<number>
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<number>();
      let s: AbortSignal<number> = { aborted: false, reason: 123 };
      options.signal = s;
      expect(options.signal !== null).assertTrue();
      expect(options.signal?.reason).assertEqual(123);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor3300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_3300
     * @tc.desc    Verify AsyncLockOptions<void> signal accepts AbortSignal<void>
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<void>();
      let s: AbortSignal<void> = { aborted: false, reason: undefined };
      options.signal = s;
      expect(options.signal !== null).assertTrue();
      expect(options.signal?.aborted).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor3400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_3400
     * @tc.desc    Verify AsyncLockOptions<LockData> signal accepts AbortSignal<LockData>
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<LockData>();
      let s: AbortSignal<LockData> = { aborted: false, reason: { id: 1 } };
      options.signal = s;
      let sig: AbortSignal<LockData> | null = options.signal;
      expect(sig !== null).assertTrue();
      if (sig !== null) {
        expect(sig.reason.id).assertEqual(1);
      }
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor3500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_3500
     * @tc.desc    Verify setting partial properties keeps unset property default
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>();
      options.isAvailable = true;
      options.timeout = 1000;
      expect(options.isAvailable).assertTrue();
      expect(options.timeout).assertEqual(1000);
      expect(options.signal === null).assertTrue();
    });

  })
}
