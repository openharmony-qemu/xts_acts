'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { Foo } from '../ets/Index';

export default function TcAsyncTest(): void {
  describe("TcAsyncTest", (): void => {
    try {
      loadLibrary("entry");
    } catch (e) {
      console.log('loadFailed', e.message);
      expect(false).assertTrue();
    }

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0100
     * @tc.name testTcAsync0001
     * @tc.desc Verify that a synchronous native heavy task returns the expected result.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncHeavyTask(42);
      expect(result).assertEqual(84);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0200
     * @tc.name testTcAsync0002
     * @tc.desc Verify that a native task status result can indicate failure.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncHeavyTaskStatus(-1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0400
     * @tc.name testTcAsync0004
     * @tc.desc Verify that repeated native compute calls return independent correct results.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      for (let i = 0; i < 10; i++) {
        let result = cls.test_AsyncCompute(i);
        expect(result).assertEqual(i * 3);
      }
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0500
     * @tc.name testTcAsync0005
     * @tc.desc Verify that a void native save operation completes and stores data.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_AsyncSaveData('async-data');
      expect(cls.test_AsyncCheckSaveData('async-data')).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0600
     * @tc.name testTcAsync0006
     * @tc.desc Verify that a native string task returns true for a non-empty string.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncStringTask('ok');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0700
     * @tc.name testTcAsync0007
     * @tc.desc Verify that a long-running native task eventually returns the expected result.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncLongRunningTask(10);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0800
     * @tc.name testTcAsync0008
     * @tc.desc Verify that a native-created Promise object can be returned.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_AsyncWorkLegacy(9);
      expect(promise !== null).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_0900
     * @tc.name testTcAsync0009
     * @tc.desc Verify that a rejected native Promise object can be created.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_AsyncWorkThrowWithoutCatch();
      expect(promise !== null).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1000
     * @tc.name testTcAsync0010
     * @tc.desc Verify that repeated native counter increments update the counter.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      cls.test_AsyncResetRaceCounter();
      for (let i = 0; i < 100; i++) {
        cls.test_AsyncRaceIncrement();
      }
      let counter = cls.test_AsyncGetRaceCounter();
      expect(counter).assertEqual(100);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1100
     * @tc.name testTcAsync0011
     * @tc.desc Verify that native double parameters and return values are handled correctly.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncDoubleTask(3.14);
      expect(Math.abs(result - 6.28) < 0.000001).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1200
     * @tc.name testTcAsync0012
     * @tc.desc Verify repeated short native tasks return correct results.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      for (let i = 0; i < 1000; i++) {
        let result = cls.test_AsyncShortTask(i);
        expect(result).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1300
     * @tc.name testTcAsync0013
     * @tc.desc Verify that repeated native calls return unique IDs.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let first = cls.test_AsyncGetUniqueId();
      let second = cls.test_AsyncGetUniqueId();
      expect(second > first).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1400
     * @tc.name testTcAsync0014
     * @tc.desc Verify that native code can store a callback reference and invoke it later.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let valueFromCallback = 0;
      let stored = cls.test_AsyncStoreCallback((value: int): void => {
        valueFromCallback = value;
      });
      let triggered = cls.test_AsyncTriggerStoredCallback(77);
      expect(stored).assertTrue();
      expect(triggered).assertTrue();
      expect(valueFromCallback).assertEqual(77);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1500
     * @tc.name testTcAsync0015
     * @tc.desc Verify that a rejected native Promise can be created for the no-catch warning scenario.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_AsyncThrowInCompleteNoCatch();
      expect(promise !== null).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1600
     * @tc.name testTcAsync0016
     * @tc.desc Verify that a rejected native Promise object can be returned for catch handling.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_AsyncThrowInCompleteWithCatch();
      expect(promise !== null).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1700
     * @tc.name testTcAsync0017
     * @tc.desc Verify a native synchronous heavy task returns the expected result.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncHeavyTaskSync(21);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_1900
     * @tc.name testTcAsync0019
     * @tc.desc Verify that a cancelable long native task returns the expected result when executed synchronously.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncCancelableLongTask(5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_2000
     * @tc.name testTcAsync0020
     * @tc.desc Verify native Fibonacci computation and serial aggregation.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let result = cls.test_AsyncFibonacci(10);
      expect(result).assertEqual(55);
      let serial = cls.test_AsyncSerialFibonacci(10, 10);
      expect(serial).assertEqual(550);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_2100
     * @tc.name testTcAsync0021
     * @tc.desc Verify legacy Promise creation and synchronous comparison function can both be invoked.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_AsyncWorkLegacyLoop(1);
      let recommended = cls.test_AsyncTaskpoolCompare(1);
      expect(promise !== null).assertTrue();
      expect(recommended).assertEqual(2);
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_2200
     * @tc.name testTcAsync0022
     * @tc.desc Verify that a native rejected Promise can be returned for execute failure handling.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      let promise = cls.test_AsyncWorkExecuteThrow();
      expect(promise !== null).assertTrue();
    });

    /**
     * @tc.number SUB_TC_ASYNC_TEST_2300
     * @tc.name testTcAsync0023
     * @tc.desc Verify that a native task protected by a global mutex returns correct values.
     * @tc.size MEDIUM
     * @tc.type FUNCTION
     * @tc.level LEVEL0
     */
    it("testTcAsync0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let cls = new Foo();
      expect(cls.test_AsyncLockedTask(1)).assertEqual(2);
      expect(cls.test_AsyncLockedTask(2)).assertEqual(4);
      expect(cls.test_AsyncLockedTask(3)).assertEqual(6);
      expect(cls.test_AsyncLockedTask(4)).assertEqual(8);
    });
  });
}
