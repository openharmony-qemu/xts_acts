'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

let tickHandlerCount: int = 0;

function tickHandler(): void {
  tickHandlerCount++;
}

export default function GlobalSetIntervalTest(): void {
  describe('GlobalSetIntervalTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0100
     * @tc.name testSetInterval001
     * @tc.desc Verify setInterval(func, delayMs) with 2 parameters creates timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 20);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0200
     * @tc.name testSetInterval002
     * @tc.desc Verify setInterval with func, delayMs and args passes parameters correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      const timerId: int = setInterval((a: int, b: string): void => {
        received = a === 42 && b === "hello";
      }, 20, 42, "hello");
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0300
     * @tc.name testSetInterval003
     * @tc.desc Verify setInterval with multiple args passes all parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      const timerId: int = setInterval((a: int, b: string, c: boolean): void => {
        received = a === 1 && b === "test" && c;
      }, 20, 1, "test", true);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0400
     * @tc.name testSetInterval004
     * @tc.desc Verify setInterval(msg) registers string message interval and returns ID when log capture is unavailable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timerId: int = setInterval("interval message");
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0500
     * @tc.name testSetInterval005
     * @tc.desc Verify setInterval with delayMs=0 repeatedly executes callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 0);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0600
     * @tc.name testSetInterval006
     * @tc.desc Verify setInterval with normal named function as func parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let beforeCount: int = tickHandlerCount;
      const timerId: int = setInterval(tickHandler, 20);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(tickHandlerCount > beforeCount).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0700
     * @tc.name testSetInterval007
     * @tc.desc Verify setInterval with function that receives parameters via args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      const timerId: int = setInterval((name: string, age: int): void => {
        received = name === "world" && age === 25;
      }, 20, "world", 25);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0800
     * @tc.name testSetInterval008
     * @tc.desc Verify setInterval with empty string message registers interval and returns ID when log capture is unavailable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timerId: int = setInterval("", 1000);
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_0900
     * @tc.name testSetInterval009
     * @tc.desc Verify setInterval with negative delayMs still executes callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, -1);
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1000
     * @tc.name testSetInterval010
     * @tc.desc Verify setInterval with delayMs=int max value can be cancelled before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 2147483647);
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1100
     * @tc.name testSetInterval011
     * @tc.desc Verify setInterval with delayMs=null repeatedly executes callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, null);
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1200
     * @tc.name testSetInterval012
     * @tc.desc Verify setInterval with delayMs=undefined can be cleared before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, undefined);
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1300
     * @tc.name testSetInterval013
     * @tc.desc Verify setInterval return value assignable to int variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = 0;
      id = setInterval(() => {
      }, 500);
      expect(id > 0).assertTrue();
      clearInterval(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1400
     * @tc.name testSetInterval014
     * @tc.desc Verify setInterval can be cleared safely before callback fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 1000);
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1500
     * @tc.name testSetInterval015
     * @tc.desc Verify setInterval with number args passed to callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sum: int = 0;
      const timerId: int = setInterval((a: int, b: int): void => {
        sum = a + b;
      }, 20, 10, 20);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1600
     * @tc.name testSetInterval016
     * @tc.desc Verify setInterval with string args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: string = "";
      const timerId: int = setInterval((s: string): void => {
        received = s;
      }, 20, "hello");
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(received).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1700
     * @tc.name testSetInterval017
     * @tc.desc Verify setInterval with boolean args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      const timerId: int = setInterval((flag: boolean): void => {
        received = flag;
      }, 20, true);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1800
     * @tc.name testSetInterval018
     * @tc.desc Verify setInterval with Int.MIN_VALUE delay still schedules callback execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, Int.MIN_VALUE);
      expect(timerId > 0).assertTrue();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_1900
     * @tc.name testSetInterval019
     * @tc.desc Verify setInterval with parsed Infinity converted delay can be cleared before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, Double.toInt(parseFloat("Infinity")));
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2000
     * @tc.name testSetInterval020
     * @tc.desc Verify setInterval with parsed NaN converted delay can be cleared before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, Double.toInt(parseFloat("NaN")));
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2100
     * @tc.name testSetInterval021
     * @tc.desc Verify multiple setInterval calls return unique IDs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ids: int[] = [];
      for (let i: int = 0; i < 5; i++) {
        ids.push(setInterval(() => {}, 10000));
      }
      let allPositive: boolean = true;
      let allUnique: boolean = true;
      for (let i: int = 0; i < ids.length; i++) {
        if (ids[i] <= 0) {
          allPositive = false;
        }
        for (let j: int = i + 1; j < ids.length; j++) {
          if (ids[i] === ids[j]) {
            allUnique = false;
          }
        }
      }
      expect(allPositive).assertTrue();
      expect(allUnique).assertTrue();
      for (let i: int = 0; i < ids.length; i++) {
        clearInterval(ids[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2200
     * @tc.name testSetInterval022
     * @tc.desc Verify clearInterval immediately cancels callback with int argument before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: int = 0;
      let id: int = setInterval((value: int): void => {
        received = value;
      }, 40, 26);
      expect(id > 0).assertTrue();
      clearInterval(id);
      await Utils.msSleep(100);
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2300
     * @tc.name testSetInterval023
     * @tc.desc Verify setInterval accepts string message with null delay and returns clearable timer ID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setInterval("interval generated delayed 27", null);
      expect(id > 0).assertTrue();
      clearInterval(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2400
     * @tc.name testSetInterval024
     * @tc.desc Verify setInterval accepts string message with numeric delay and returns clearable timer ID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setInterval("interval generated message 28", 228);
      expect(id > 0).assertTrue();
      clearInterval(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2500
     * @tc.name testSetInterval025
     * @tc.desc Verify clearInterval cancels delayed interval callback before marker update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let marker: int = 0;
      let id: int = setInterval((): void => {
        marker = marker + 29;
      }, 229);
      expect(id > 0).assertTrue();
      clearInterval(id);
      await Utils.msSleep(260);
      expect(marker).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2600
     * @tc.name testSetInterval026
     * @tc.desc Verify setInterval callback overload returns clearable timer ID for delay 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setInterval((): void => {
      }, 131);
      expect(id > 0).assertTrue();
      clearInterval(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2700
     * @tc.name testSetInterval027
     * @tc.desc Verify setInterval callback accepts string argument for case 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let received: string = "";
      let tickCount: int = 0;
      let id: int = setInterval((value: string): void => {
        received = value; tickCount++;
      }, 132, "arg32");
      expect(id > 0).assertTrue();
      await Utils.msSleep(192);
      clearInterval(id);
      expect(tickCount > 0).assertTrue();
      expect(received).assertEqual("arg32");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2800
     * @tc.name testSetInterval028
     * @tc.desc Verify setInterval callback accepts int argument for case 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let received: int = -1;
      let tickCount: int = 0;
      let id: int = setInterval((value: int): void => {
        received = value; tickCount++;
      }, 133, 33);
      expect(id > 0).assertTrue();
      await Utils.msSleep(193);
      clearInterval(id);
      expect(tickCount > 0).assertTrue();
      expect(received).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_2900
     * @tc.name testSetInterval029
     * @tc.desc Verify setInterval callback accepts boolean argument for case 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let expected: boolean = true;
      let received: boolean = false;
      let tickCount: int = 0;
      let id: int = setInterval((value: boolean): void => {
        received = value; tickCount++;
      }, 134, expected);
      expect(id > 0).assertTrue();
      await Utils.msSleep(194);
      clearInterval(id);
      expect(tickCount > 0).assertTrue();
      expect(received).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_3000
     * @tc.name testSetInterval030
     * @tc.desc Verify setInterval accepts null delay for callback case 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setInterval((): void => {
      }, null);
      expect(id > 0).assertTrue();
      clearInterval(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_3100
     * @tc.name testSetInterval031
     * @tc.desc Verify setInterval timer behavior case 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let total: int = 0;
      let id: int = setInterval((value: int): void => {
        total = total + value;
      }, 20, 2);
      expect(id > 0).assertTrue();
      await Utils.msSleep(90);
      clearInterval(id);
      expect(total >= 4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_3200
     * @tc.name testSetInterval032
     * @tc.desc Verify setInterval timer behavior case 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count++;
      }, 30);
      await Utils.msSleep(95);
      clearInterval(id);
      let stopped: int = count;
      await Utils.msSleep(70);
      expect(count).assertEqual(stopped);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_3300
     * @tc.name testSetInterval033
     * @tc.desc Verify setInterval timer behavior case 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count++;
      }, undefined);
      expect(id > 0).assertTrue();
      await Utils.msSleep(50);
      clearInterval(id);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_3400
     * @tc.name testSetInterval034
     * @tc.desc Verify setInterval timer behavior case 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let text: string = "";
      let flag: boolean = false;
      let count: int = 0;
      let id: int = setInterval((value: string, ok: boolean): void => {
        text = value; flag = ok; count++;
      }, 20, "both40", true);
      await Utils.msSleep(90);
      clearInterval(id);
      expect(count >= 2).assertTrue();
      expect(text).assertEqual("both40");
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_INTERVAL_3500
     * @tc.name testSetInterval035
     * @tc.desc Verify setInterval timer behavior case 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetInterval035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let first: int = 0;
      let second: int = 0;
      let firstId: int = setInterval((): void => {
        first++;
      }, 20);
      let secondId: int = setInterval((): void => {
        second++;
      }, 25);
      await Utils.msSleep(90);
      clearInterval(firstId);
      clearInterval(secondId);
      expect(first > 0).assertTrue();
      expect(second > 0).assertTrue();
    });
  });
}
