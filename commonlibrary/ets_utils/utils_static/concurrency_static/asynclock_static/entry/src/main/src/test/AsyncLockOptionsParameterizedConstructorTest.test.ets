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

export default function AsyncLockOptionsParameterizedConstructorTest(): void {
  describe('AsyncLockOptionsParameterizedConstructorTest', (): void => {

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify maximum parameter count boundary
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 3000);
      expect(options instanceof AsyncLockOptions).assertTrue();
      expect(options.timeout).assertEqual(3000);
      expect(options.signal).not().assertNull();
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify constructor accepts null signal for different generic types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options1 = new AsyncLockOptions<string>(false, null, 1000);
      let options2 = new AsyncLockOptions<number>(false, null, 2000);
      expect(options1.signal === null).assertTrue();
      expect(options2.signal === null).assertTrue();
      expect(options1.timeout).assertEqual(1000);
      expect(options2.timeout).assertEqual(2000);
      expect(options1.isAvailable).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify constructor with signal.aborted true stores aborted state
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: true, reason: "Already aborted" };
      let options = new AsyncLockOptions<string>(false, s, 3000);
      expect(options.signal !== null).assertTrue();
      expect(options.signal?.aborted).assertTrue();
      expect(options.signal?.reason).assertEqual("Already aborted");
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify constructor stores various signal reason values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s1: AbortSignal<string> = { aborted: false, reason: "string reason" };
      let options1 = new AsyncLockOptions<string>(false, s1, 3000);
      let s2: AbortSignal<number> = { aborted: false, reason: 123 };
      let options2 = new AsyncLockOptions<number>(false, s2, 3000);
      let s3: AbortSignal<LockData> = { aborted: false, reason: { id: 1 } };
      let options3 = new AsyncLockOptions<LockData>(false, s3, 3000);
      expect(options1.signal?.reason).assertEqual("string reason");
      expect(options2.signal?.reason).assertEqual(123);
      let sig3: AbortSignal<LockData> | null = options3.signal;
      expect(sig3 !== null).assertTrue();
      if (sig3 !== null) {
        expect(sig3.reason.id).assertEqual(1);
      }
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify constructor stores timeout 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 0);
      expect(options.timeout).assertEqual(0);
      expect(options.signal !== null).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify constructor accepts timeout 1 as minimal positive value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 1);
      expect(options.timeout).assertEqual(1);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify constructor accepts large timeout value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 60000);
      expect(options.timeout).assertEqual(60000);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0800
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify constructor accepts int maximum timeout value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 2147483647);
      expect(options.timeout).assertEqual(2147483647);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0900
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify constructor stores negative timeout value as-is
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, -1);
      expect(options.timeout).assertEqual(-1);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1000
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify full default combination isAvailable false signal null timeout 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>(false, null, 0);
      expect(options.isAvailable).assertFalse();
      expect(options.signal === null).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify combination isAvailable true signal null timeout large value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let options = new AsyncLockOptions<string>(true, null, 60000);
      expect(options.isAvailable).assertTrue();
      expect(options.signal === null).assertTrue();
      expect(options.timeout).assertEqual(60000);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify combination isAvailable false signal object timeout 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 0);
      expect(options.isAvailable).assertFalse();
      expect(options.signal !== null).assertTrue();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify parameterized constructed options usable for lockAsync
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsParameterizedConstructor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
          let lock = new AsyncLock();
          let s: AbortSignal<string> = { aborted: false, reason: "test" };
          let options = new AsyncLockOptions<string>(true, s, 1000);
          let executed = false;
          await lock.lockAsync<void, string>(
            () => {
            try {
              executed = true;
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          }, AsyncLockMode.EXCLUSIVE, options);
          expect(executed).assertTrue();
          done();
        } catch (error) {
          console.error("testAsyncLockOptionsParameterizedConstructor1300 failed");
          expect(false).assertFail();
          done();
        }
      });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1400
     * @tc.desc    Verify creating many parameterized instances keeps stability
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let optionsArray: AsyncLockOptions<string>[] = [];
      for (let i = 0; i < 100; i++) {
        optionsArray.push(new AsyncLockOptions<string>(false, s, i));
      }
      expect(optionsArray.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1500
     * @tc.desc    Verify parameterized constructor with number generic type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<number> = { aborted: false, reason: 123 };
      let options = new AsyncLockOptions<number>(false, s, 1000);
      expect(options.signal !== null).assertTrue();
      expect(options.signal?.reason).assertEqual(123);
      expect(options.timeout).assertEqual(1000);
      expect(options.isAvailable).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1600
     * @tc.desc    Verify parameterized constructor with void generic type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<void> = { aborted: false, reason: undefined };
      let options = new AsyncLockOptions<void>(false, s, 1000);
      expect(options.signal !== null).assertTrue();
      expect(options.signal?.aborted).assertFalse();
      expect(options.timeout).assertEqual(1000);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1700
     * @tc.desc    Verify parameterized constructor with boolean generic type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<boolean> = { aborted: false, reason: true };
      let options = new AsyncLockOptions<boolean>(false, s, 1000);
      expect(options.signal !== null).assertTrue();
      expect(options.signal?.reason).assertEqual(true);
      expect(options.timeout).assertEqual(1000);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1800
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1800
     * @tc.desc    Verify parameterized constructor with custom object generic type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<LockData> = { aborted: false, reason: { id: 1 } };
      let options = new AsyncLockOptions<LockData>(false, s, 1000);
      let sig: AbortSignal<LockData> | null = options.signal;
      expect(sig !== null).assertTrue();
      if (sig !== null) {
        expect(sig.reason.id).assertEqual(1);
      }
      expect(options.timeout).assertEqual(1000);
    });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor1900
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_1900
     * @tc.desc    Verify isAvailable true rejects immediately when lock unavailable
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<void>(true, null, 0);
          let firstLock: Promise<void> = lock.lockAsync<void>(
            () => {
            try {
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          }, AsyncLockMode.EXCLUSIVE);
          let rejected = false;
          try {
            await lock.lockAsync<void, void>(
              () => {
            }, AsyncLockMode.EXCLUSIVE, options);
          } catch (error) {
            rejected = true;
          }
          expect(rejected).assertTrue();
          await firstLock;
          done();
        } catch (error) {
          console.error("testAsyncLockOptionsParameterizedConstructor1900 failed");
          expect(false).assertFail();
          done();
        }
      });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor2000
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_2000
     * @tc.desc    Verify isAvailable false blocks waiting until lock released
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<void>(false, null, 0);
          let executed = false;
          let executionOrder: number[] = [];
          let p1: Promise<void> = lock.lockAsync<void>(
            () => {
            try {
              executionOrder.push(1);
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          }, AsyncLockMode.EXCLUSIVE);
          let p2: Promise<void> = lock.lockAsync<void, void>(
            () => {
            try {
              executionOrder.push(2);
              executed = true;
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          }, AsyncLockMode.EXCLUSIVE, options);
          await p1;
          await p2;
          expect(executed).assertTrue();
          expect(executionOrder[0]).assertEqual(1);
          expect(executionOrder[1]).assertEqual(2);
          done();
        } catch (error) {
          console.error("testAsyncLockOptionsParameterizedConstructor2000 failed");
          expect(false).assertFail();
          done();
        }
      });

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor2100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_2100
     * @tc.desc    Verify timeout greater than zero rejects waiting request on timeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        try {
          let lock = new AsyncLock();
          let options = new AsyncLockOptions<void>(false, null, 100);
          let holder: Promise<void> = lock.lockAsync<void>(
            (): Promise<void> => {
            try {
              return sleep(500);
            } catch (error) {
              console.error(`callback failed: ${error}`);
              throw error;
            }
          });
          let rejected = false;
          try {
            await lock.lockAsync<void, void>(
              () => {
              try {
              } catch (error) {
                console.error(`callback failed: ${error}`);
                throw error;
              }
            }, AsyncLockMode.EXCLUSIVE, options);
          } catch (error) {
            rejected = true;
          }
          expect(rejected).assertTrue();
          await holder;
          done();
        } catch (error) {
          console.error("testAsyncLockOptionsParameterizedConstructor2100 failed");
          expect(false).assertFail();
          done();
        }
      });

  });
}
