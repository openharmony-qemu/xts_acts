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
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0200
     * @tc.desc    Verify minimum parameter count for constructor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<void>();
      expect(options instanceof AsyncLockOptions).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0300
     * @tc.desc    Verify create AsyncLockOptions instance successfully
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options).not().assertNull();
      expect(options instanceof AsyncLockOptions).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0400
     * @tc.desc    Verify created instance can be used for lockAsync
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let executed = false;

      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0500
     * @tc.desc    Verify isAvailable default value is false
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options.isAvailable).assertFalse();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0600
     * @tc.desc    Verify signal default value is null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options.signal === null).assertTrue();
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0700
     * @tc.desc    Verify timeout default value is 0
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      expect(options.timeout).assertEqual(0);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0800
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0800
     * @tc.desc    Verify creating many instances
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let optionsArray: AsyncLockOptions<string>[] = [];
      for (let i = 0; i < 100; i++) {
        optionsArray.push(new AsyncLockOptions<string>());
      }
      expect(optionsArray.length).assertEqual(100);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor0900
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_0900
     * @tc.desc    Verify different generic types have same default values
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options1 = new AsyncLockOptions<string>();
      let options2 = new AsyncLockOptions<number>();
      expect(options1.isAvailable).assertEqual(options2.isAvailable);
      expect(options1.signal === null).assertTrue();
      expect(options2.signal === null).assertTrue();
      expect(options1.timeout).assertEqual(options2.timeout);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1000
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1000
     * @tc.desc    Verify generic affects signal type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      options.signal = s;
      expect(options.signal).not().assertNull();
      expect(options.signal?.aborted).assertFalse();
      expect(options.signal?.reason).assertEqual("test");
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1100
     * @tc.desc    Verify no-arg constructor is suitable for flexible config
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let options = new AsyncLockOptions<string>();
      let needNonBlocking = true;
      let needTimeout = true;
      if (needNonBlocking) {
        options.isAvailable = true;
      }
      if (needTimeout) {
        options.timeout = 1000;
      }
      expect(options).not().assertNull();
    })

    /**
     * @tc.name    testAsyncLockOptionsConstructor1200
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1200
     * @tc.desc    Verify Parameterized constructors are suitable for scenarios where known fixed values need to be configured.
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 3000);

      expect(options.isAvailable).assertFalse();
      expect(options.signal).not().assertNull();
      expect(options.signal?.reason).assertEqual("test");
      expect(options.timeout).assertEqual(3000);
    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1300
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1300
     * @tc.desc    Verify set properties then use for lockAsync
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockOptionsConstructor1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      options.isAvailable = true;
      options.timeout = 1000;
      let executed = false;

      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1400
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1400
     * @tc.desc    Verify multiple locks use same options instance
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      await expect(Promise.all([
        lock.lockAsync<void, void>(() => {}, AsyncLockMode.SHARED, options),
        lock.lockAsync<void, void>(() => {}, AsyncLockMode.SHARED, options)
      ])).assertPromiseIsResolved();

    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1500
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1500
     * @tc.desc    Verify set AbortSignal then use
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      await expect(lock.lockAsync<void, string>(() => {}, AsyncLockMode.EXCLUSIVE, options)).assertPromiseIsResolved();

    });

    /**
     * @tc.name    testAsyncLockOptionsConstructor1600
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1600
     * @tc.desc    Verify aborted signal causes lockAsync to reject
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      // A signal that is already aborted must cause lockAsync to reject.
      let s: AbortSignal<string> = { aborted: true, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      let rejected = false;
      try {
        await lock.lockAsync<void, string>(() => {}, AsyncLockMode.EXCLUSIVE, options);
      } catch (error) {
        rejected = true;
      }
      expect(rejected).assertTrue();
    });


    /**
     * @tc.name    testAsyncLockOptionsConstructor1700
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_CONSTRUCTOR_TEST_1700
     * @tc.desc    Verify no-arg constructor after manual settings equivalent to parameterized
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsConstructor1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options1 = new AsyncLockOptions<string>();
      options1.isAvailable = true;
      options1.signal = s;
      options1.timeout = 1000;

      let options2 = new AsyncLockOptions<string>(true, s, 1000);
      expect(options1.isAvailable).assertEqual(options2.isAvailable);
      expect(options1.timeout).assertEqual(options2.timeout);
    });

  })
}
