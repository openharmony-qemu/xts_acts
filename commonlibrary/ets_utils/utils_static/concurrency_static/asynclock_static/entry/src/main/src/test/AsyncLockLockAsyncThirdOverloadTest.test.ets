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
    it('testAsyncLockLockAsyncThirdOverload0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      let executed = false;
      let p: Promise<void> = lock.lockAsync<void, void>(
        () => {
          executed = true;
        },
        AsyncLockMode.EXCLUSIVE,
        options
      );
      await p;
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0200
     * @tc.desc    Verify must pass callback, mode and options three parameters
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let p = lock.lockAsync<void, void>(() => {}, AsyncLockMode.EXCLUSIVE, options);
      expect(p instanceof Promise).assertTrue();
      await p;

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0300
     * @tc.desc    Verify callback parameter passes normal function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      let result = await lock.lockAsync<number, number>(() => {
        return 100;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(100);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0400
     * @tc.desc    Verify callback parameter passes arrow function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let result = await lock.lockAsync<string, string>(() => "test", AsyncLockMode.SHARED, options);
      expect(result).assertEqual("test");

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0500
     * @tc.desc    Verify callback parameter passes async function
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<int>();
      let result = await lock.lockAsync<int, int>(async () => {
        return await Promise.resolve(42);
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(42);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0600
     * @tc.desc    Verify callback returns void
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();

      let result = await lock.lockAsync<void, void>(() => {
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(result).assertUndefined();

    })

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0700
     * @tc.desc    Verify callback returns null
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let result = await lock.lockAsync<string | null, string>(() => null, AsyncLockMode.SHARED, options);
      expect(result).assertNull();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0800
     * @tc.desc    Verify mode parameter passes SHARED
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let heldMode: AsyncLockMode | undefined = undefined;

      await lock.lockAsync<void, void>(() => {
        let state = lock.query();
        if (state.held.length > 0) {
          heldMode = state.held[0].mode;
        }
      }, AsyncLockMode.SHARED, options);
      expect(heldMode).assertEqual(AsyncLockMode.SHARED);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload0900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_0900
     * @tc.desc    Verify mode parameter passes EXCLUSIVE
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let exclusiveModeAccepted = false;
      await lock.lockAsync<void, void>(() => {
        let state = lock.query();
        if (state.held.length > 0) {
          exclusiveModeAccepted = (state.held[0].mode === AsyncLockMode.EXCLUSIVE);
        }
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(exclusiveModeAccepted).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1000
     * @tc.desc    Verify AsyncLockMode enum values are 1 and 2
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(AsyncLockMode.SHARED).assertEqual(1);
      expect(AsyncLockMode.EXCLUSIVE).assertEqual(2);
    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1100
     * @tc.desc    Verify options parameter passes default constructed AsyncLockOptions
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let executed = false;

      await lock.lockAsync<void, void>(() => {
        executed = true;
        let state = lock.query();
        expect(state.held.length > 0).assertTrue();
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1200
     * @tc.desc    Verify options sets timeout property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      let p = lock.lockAsync<void, void>(() => {}, AsyncLockMode.EXCLUSIVE, options);
      expect(p instanceof Promise).assertTrue();
      await p;

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1300
     * @tc.desc    Verify options sets isAvailable property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      let executed = false;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1400
     * @tc.desc    Verify options sets signal property
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      let executed = false;
      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1500
     * @tc.desc    Verify options uses parameterized constructor
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>(false, s, 3000);
      expect(options.isAvailable).assertEqual(false);
      expect(options.signal).assertEqual(s);
      expect(options.timeout).assertEqual(3000);
      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1600
     * @tc.desc    Verify timeout=0 means no timeout limit
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 0;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1700
     * @tc.desc    Verify timeout=1 means 1ms timeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 1;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1800
     * @tc.desc    Verify timeout sets large value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 60000;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload1900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_1900
     * @tc.desc    Verify isAvailable=false means blocking wait
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.isAvailable = false;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2000
     * @tc.desc    Verify signal=null means no cancellation
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.signal = null;
      expect(options.signal).assertNull();
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2100
     * @tc.desc    Verify callback + SHARED + default options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.SHARED, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2200
     * @tc.desc    Verify callback + EXCLUSIVE + timeout options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2300
     * @tc.desc    Verify callback + EXCLUSIVE + isAvailable options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2400
     * @tc.desc    Verify callback + EXCLUSIVE + signal options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2500
     * @tc.desc    Verify callback + EXCLUSIVE + complete options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let executed = false;
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>(true, s, 1000);
      expect(options.isAvailable).assertEqual(true);
      expect(options.signal).assertEqual(s);
      expect(options.timeout).assertEqual(1000);
      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2600
     * @tc.desc    Verify lockAsync returns Promise<T>
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let executed = false;
      let p: Promise<void> = lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);
      await p;
      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2700
     * @tc.desc    Verify await returns callback result
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let result = await lock.lockAsync<string, string>(() => "result", AsyncLockMode.SHARED, options);
      expect(result).assertEqual("result");

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2800
     * @tc.desc    Verify lock is automatically released after callback
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      await lock.lockAsync<void, void>(() => {}, AsyncLockMode.EXCLUSIVE, options);
      let state = lock.query();
      expect(state.held.length).assertEqual(0);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload2900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_2900
     * @tc.desc    Verify callback returns void
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();

      let voidResult: void = await lock.lockAsync<void, void>(() => {
        return;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(voidResult).assertUndefined();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3000
     * @tc.desc    Verify callback returns empty array
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number[]>();
      let result = await lock.lockAsync<number[], number[]>(() => [], AsyncLockMode.EXCLUSIVE, options);
      expect(result.length).assertEqual(0);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3100
     * @tc.desc    Verify return value type is Promise<T>
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      let p = lock.lockAsync<number, number>(() => 100, AsyncLockMode.SHARED, options);
      let result = await p;
      expect(result).assertEqual(100);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3200
     * @tc.desc    Verify generic T and U types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let result = await lock.lockAsync<number, string>(() => 1, AsyncLockMode.EXCLUSIVE, options);
      expect(typeof result).assertEqual("number");

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3300
     * @tc.desc    Verify callback returns number max value
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      let result = await lock.lockAsync<number, number>(() => Number.MAX_VALUE, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(Number.MAX_VALUE);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3400
     * @tc.desc    Verify callback throws Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      try {
        await lock.lockAsync<void, void>(() => {
          throw new Error("callback error");
        }, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3500
     * @tc.desc    Verify callback throws custom Error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {

      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      try {
        await lock.lockAsync<void, void>(() => {
          throw new CustomError("custom error");
        }, AsyncLockMode.SHARED, options);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof CustomError).assertTrue();
        expect(error.message).not().assertNull();
      }

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3600
     * @tc.desc    Verify callback throws exception causes rejection
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let p = lock.lockAsync<void, void>(() => {
        throw new Error("reject");
      }, AsyncLockMode.EXCLUSIVE, options);
      try {
        await p;
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3700
     * @tc.desc    Verify isAvailable=true lock can be acquired immediately
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      let executed = false;

      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3800
     * @tc.desc    Verify non-blocking mode does not wait
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let firstLock = lock.lockAsync<void>(() => {}, AsyncLockMode.EXCLUSIVE);
      let options = new AsyncLockOptions<void>();
      options.isAvailable = true;
      let caught = false;
      try {
        await lock.lockAsync<void, void>(() => {}, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        caught = true;
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }
      expect(caught).assertTrue();
      await firstLock;

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload3900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_3900
     * @tc.desc    Verify isAvailable=false blocks waiting for lock
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.isAvailable = false;

      let executed = false;
      let executionOrder: number[] = [];

      let p1 = lock.lockAsync<void, void>(() => {
        executionOrder.push(1);
      }, AsyncLockMode.EXCLUSIVE, options);

      let p2 = lock.lockAsync<void, void>(() => {
        executionOrder.push(2);
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      await p1;
      await p2;

      expect(executed).assertTrue();
      expect(executionOrder[0]).assertEqual(1);
      expect(executionOrder[1]).assertEqual(2);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4000
     * @tc.desc    Verify timeout>0 enables timeout
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 1000;
      let executed = false;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4100
     * @tc.desc    Verify acquire lock before timeout succeeds
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      options.timeout = 2000;

      let executed = false;
      await lock.lockAsync<void, void>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4200
     * @tc.desc    Verify signal.aborted=false request continues
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      let executed = false;
      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4300
     * @tc.desc    Verify signal.aborted=true request cancelled
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: true, reason: "User cancelled" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      try {
        await lock.lockAsync<void, string>(() => {}, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4400
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4400
     * @tc.desc    Verify reason passed to rejection error
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: true, reason: "User cancelled" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;
      try {
        await lock.lockAsync<void, string>(() => {}, AsyncLockMode.EXCLUSIVE, options);
        expect().assertFail();
      } catch (error) {
        expect(error instanceof Error).assertTrue();
        expect(error.message).not().assertNull();
      }

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4500
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4500
     * @tc.desc    Verify T and U use same type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<number>();
      let result = await lock.lockAsync<number, number>(() => 100, AsyncLockMode.EXCLUSIVE, options);
      expect(result).assertEqual(100);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4600
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4600
     * @tc.desc    Verify T and U use different types
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let result = await lock.lockAsync<number, string>(() => 42, AsyncLockMode.EXCLUSIVE, options);
      expect(typeof result).assertEqual("number");

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4700
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4700
     * @tc.desc    Verify T is void U is other type
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();

      let executed = false;
      let result: void = await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();
      expect(result).assertUndefined();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4800
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4800
     * @tc.desc    Verify U type matches signal.reason
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let s: AbortSignal<string> = { aborted: false, reason: "Aborted" };
      let options = new AsyncLockOptions<string>();
      options.signal = s;

      let executed = false;
      await lock.lockAsync<void, string>(() => {
        executed = true;
      }, AsyncLockMode.EXCLUSIVE, options);

      expect(executed).assertTrue();

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload4900
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_4900
     * @tc.desc    Verify await lockAsync with options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let test: () => Promise<string> = async (): Promise<string> => {
        return await lock.lockAsync<string, string>(() => "test", AsyncLockMode.EXCLUSIVE, options);
      };
      let r = await test();
      expect(r).assertEqual("test");

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload5000
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_5000
     * @tc.desc    Verify then chain call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<string>();
      let result = await lock.lockAsync<string, string>(() => "test", AsyncLockMode.SHARED, options);
      expect(result).assertEqual("test");

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload5100
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_5100
     * @tc.desc    Verify catch chain call
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('testAsyncLockLockAsyncThirdOverload5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      await lock.lockAsync<void, void>(() => {
        throw new Error("catch");
      }, AsyncLockMode.EXCLUSIVE, options).catch((error:Error) => {
        expect(error instanceof Error).assertTrue();
      });

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload5200
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_5200
     * @tc.desc    Verify multiple concurrent lockAsync with options
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL2
     */
    it('testAsyncLockLockAsyncThirdOverload5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let lock = new AsyncLock();
      let counterLock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let executedCount = 0;

      await Promise.all([
        lock.lockAsync<void, void>(async () => {
          await counterLock.lockAsync<void, void>(() => {
            executedCount++;
          }, AsyncLockMode.EXCLUSIVE, options);
        }, AsyncLockMode.SHARED, options),
        lock.lockAsync<void, void>(async () => {
          await counterLock.lockAsync<void, void>(() => {
            executedCount++;
          }, AsyncLockMode.EXCLUSIVE, options);
        }, AsyncLockMode.SHARED, options),
        lock.lockAsync<void, void>(async () => {
          await counterLock.lockAsync<void, void>(() => {
            executedCount++;
          }, AsyncLockMode.EXCLUSIVE, options);
        }, AsyncLockMode.SHARED, options)
      ]);

      expect(executedCount).assertEqual(3);

    });

    /**
     * @tc.name    testAsyncLockLockAsyncThirdOverload5300
     * @tc.number  SUB_ASYNCLOCK_LOCKASYNC_THIRD_OVERLOAD_TEST_5300
     * @tc.desc    Verify lockAsync with options execution speed
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockLockAsyncThirdOverload5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (): Promise<void> => {
      let lock = new AsyncLock();
      let options = new AsyncLockOptions<void>();
      let executed = false;
      await lock.lockAsync<void, void>(() => { executed = true; }, AsyncLockMode.EXCLUSIVE, options);
      expect(executed).assertTrue();

    });

  });
}
