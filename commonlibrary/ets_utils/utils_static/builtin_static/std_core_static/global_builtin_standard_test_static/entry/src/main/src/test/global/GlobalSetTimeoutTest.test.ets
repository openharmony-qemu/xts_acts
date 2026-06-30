'use static'
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

let namedCallbackCount: int = 0;
let asyncCallbackCount: int = 0;

class TimeoutArgObject {
  key: string;

  constructor(key: string) {
    this.key = key;
  }
}

function namedCallback(): void {
  namedCallbackCount++;
}

async function asyncCallbackFn(): Promise<void> {
  asyncCallbackCount++;
}

export default function GlobalSetTimeoutTest(): void {
  describe('GlobalSetTimeoutTest', () => {
    beforeAll(() => {
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0100
     * @tc.name testSetTimeout001
     * @tc.desc overload1: setTimeout(func) with 1 function parameter executes callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      let id = setTimeout(() => {
        executed = true;
      });
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0200
     * @tc.name testSetTimeout002
     * @tc.desc overload2: setTimeout(func, delayMs) with 2 parameters creates timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      let id = setTimeout(() => {
        executed = true;
      }, 20);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0300
     * @tc.name testSetTimeout003
     * @tc.desc overload2: setTimeout(func, delayMs, ...args) with 3 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: string = "";
      let id = setTimeout((a: string): void => {
        received = a;
      }, 20, "arg1");
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertEqual("arg1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0400
     * @tc.name testSetTimeout004
     * @tc.desc overload2: setTimeout(func, delayMs, ...args) with multiple extra args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      let id = setTimeout((a: string, b: int, c: double): void => {
        received = a === "arg1" && b === 2 && c === 3.0;
      }, 20, "arg1", 2, 3.0);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0500
     * @tc.name testSetTimeout005
     * @tc.desc overload3: setTimeout(msg) registers a string message timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id = setTimeout("hello");
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0600
     * @tc.name testSetTimeout006
     * @tc.desc overload3: setTimeout(msg, delayMs) registers a delayed string message timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id = setTimeout("timeout message", 1000);
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0700
     * @tc.name testSetTimeout007
     * @tc.desc Verify setTimeout(func, delayMs) returns a valid timer ID that can be cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setTimeout(() => {
      }, 100);
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0800
     * @tc.name testSetTimeout008
     * @tc.desc setTimeout with normal named function as func
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let beforeCount: int = namedCallbackCount;
      let id = setTimeout(namedCallback, 20);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(namedCallbackCount > beforeCount).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_0900
     * @tc.name testSetTimeout009
     * @tc.desc setTimeout with parameterized function and args via ...args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      let id = setTimeout((name: string, age: int): void => {
        received = name === "Alice" && age === 30;
      }, 20, "Alice", 30);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1000
     * @tc.name testSetTimeout010
     * @tc.desc setTimeout with async function as func
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let beforeCount: int = asyncCallbackCount;
      let id = setTimeout(asyncCallbackFn, 20);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(asyncCallbackCount > beforeCount).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1100
     * @tc.name testSetTimeout011
     * @tc.desc Verify setTimeout with Int.MIN_VALUE delay returns a valid timer ID that can be cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setTimeout(() => {
      }, Int.MIN_VALUE);
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1200
     * @tc.name testSetTimeout012
     * @tc.desc Verify setTimeout with parsed Infinity converted delay returns a valid timer ID that can be cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setTimeout(() => {
      }, Double.toInt(parseFloat("Infinity")));
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1300
     * @tc.name testSetTimeout013
     * @tc.desc setTimeout with delayMs=0 executes callback after async wait
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      let id = setTimeout(() => {
        executed = true;
      }, 0);
      expect(id > 0).assertTrue();
      await Utils.msSleep(30);
      clearTimeout(id);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1400
     * @tc.name testSetTimeout014
     * @tc.desc setTimeout with delayMs=40 can be cancelled before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      let id = setTimeout(() => {
        executed = true;
      }, 40);
      expect(id > 0).assertTrue();
      clearTimeout(id);
      await Utils.msSleep(100);
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1500
     * @tc.name testSetTimeout015
     * @tc.desc setTimeout with handler and single number arg via ...args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: int = 0;
      let id = setTimeout((n: int): void => {
        received = n;
      }, 20, 42);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1600
     * @tc.name testSetTimeout016
     * @tc.desc setTimeout with handler and multiple different type args via ...args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      let id = setTimeout((a: int, b: string, c: double): void => {
        received = a === 1 && b === "two" && c === 3.0;
      }, 20, 1, "two", 3.0);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1700
     * @tc.name testSetTimeout017
     * @tc.desc setTimeout with handler and object arg via ...args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let argObj: TimeoutArgObject = new TimeoutArgObject("value");
      let received: boolean = false;
      let id = setTimeout((obj: TimeoutArgObject): void => {
        received = obj.key === "value";
      }, 20, argObj);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1800
     * @tc.name testSetTimeout018
     * @tc.desc setTimeout with handler and null arg via ...args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      let id = setTimeout((v: Object | null): void => {
        received = v === null;
      }, 20, null);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_1900
     * @tc.name testSetTimeout019
     * @tc.desc setTimeout with handler and undefined arg via ...args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: boolean = false;
      let id = setTimeout((v: string | undefined): void => {
        received = v === undefined;
      }, 20, undefined);
      expect(id > 0).assertTrue();
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2000
     * @tc.name testSetTimeout020
     * @tc.desc multiple setTimeout calls return different IDs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id1 = setTimeout(() => {
      }, 100);
      let id2 = setTimeout(() => {
      }, 100);
      let id3 = setTimeout(() => {
      }, 100);
      expect(id1 !== id2).assertTrue();
      expect(id2 !== id3).assertTrue();
      expect(id1 !== id3).assertTrue();
      clearTimeout(id1);
      clearTimeout(id2);
      clearTimeout(id3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2100
     * @tc.name testSetTimeout021
     * @tc.desc large number of setTimeout calls produce unique IDs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let ids: int[] = [];
      for (let i: int = 0; i < 100; i++) {
        ids.push(setTimeout(() => {
        }, 10000));
      }
      let uniqueIds: Set<int> = new Set<int>();
      for (let i: int = 0; i < ids.length; i++) {
        uniqueIds.add(ids[i]);
      }
      expect(uniqueIds.size).assertEqual(100);
      for (let j: int = 0; j < ids.length; j++) {
        clearTimeout(ids[j]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2200
     * @tc.name testSetTimeout022
     * @tc.desc Verify clearTimeout immediately cancels callback with int argument before execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let received: int = 0;
      let id: int = setTimeout((value: int): void => {
        received = value;
      }, 40, 22);
      clearTimeout(id);
      await Utils.msSleep(100);
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2300
     * @tc.name testSetTimeout023
     * @tc.desc Verify setTimeout accepts string message with null delay and returns clearable timer ID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setTimeout("timeout generated delayed 23", null);
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2400
     * @tc.name testSetTimeout024
     * @tc.desc Verify clearTimeout cancels delayed callback before marker update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = marker + 25;
      }, 40);
      clearTimeout(id);
      await Utils.msSleep(120);
      expect(marker).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2500
     * @tc.name testSetTimeout025
     * @tc.desc Verify setTimeout callback receives negative int boundary argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let received: int = 0;
      let id: int = setTimeout((value: int): void => {
        received = value;
      }, 20, -2147483648);
      await Utils.msSleep(80);
      clearTimeout(id);
      expect(received).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2600
     * @tc.name testSetTimeout026
     * @tc.desc Verify setTimeout callback accepts boolean argument for case 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let expected: boolean = true;
      let received: boolean = false;
      let executed: boolean = false;
      let id: int = setTimeout((value: boolean): void => {
        received = value; executed = true;
      }, 128, expected);
      await Utils.msSleep(188);
      clearTimeout(id);
      expect(executed).assertTrue();
      expect(received).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2700
     * @tc.name testSetTimeout027
     * @tc.desc Verify setTimeout accepts null delay for callback case 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = 29;
      }, null);
      await Utils.msSleep(40);
      clearTimeout(id);
      expect(marker).assertEqual(29);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2800
     * @tc.name testSetTimeout028
     * @tc.desc Verify setTimeout executes short-delay callback and stores marker case 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = 28;
      }, 5);
      await Utils.msSleep(45);
      clearTimeout(id);
      expect(marker).assertEqual(28);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_2900
     * @tc.name testSetTimeout029
     * @tc.desc Verify setTimeout passes two int arguments and callback sums them case 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let received: int = 0;
      let id: int = setTimeout((left: int, right: int): void => {
        received = left + right;
      }, 5, 30, 100);
      expect(id > 0).assertTrue();
      await Utils.msSleep(45);
      clearTimeout(id);
      expect(received).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_3000
     * @tc.name testSetTimeout030
     * @tc.desc Verify setTimeout handles two independent callbacks case 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let first: int = 0;
      let second: int = 0;
      let firstId: int = setTimeout((): void => {
        first = 31;
      }, 5);
      let secondId: int = setTimeout((): void => {
        second = 32;
      }, 15);
      expect(firstId > 0).assertTrue();
      expect(secondId > 0).assertTrue();
      await Utils.msSleep(65);
      clearTimeout(firstId);
      clearTimeout(secondId);
      expect(first).assertEqual(31);
      expect(second).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_3100
     * @tc.name testSetTimeout031
     * @tc.desc Verify setTimeout string overload returns clearable ID case 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setTimeout("timeout message 33", 100);
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_3200
     * @tc.name testSetTimeout032
     * @tc.desc Verify setTimeout callback accepts undefined delay case 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = 34;
      }, undefined);
      await Utils.msSleep(40);
      clearTimeout(id);
      expect(marker).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_3300
     * @tc.name testSetTimeout033
     * @tc.desc Verify setTimeout passes string and boolean arguments case 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let valueText: string = "";
      let valueFlag: boolean = false;
      let id: int = setTimeout((text: string, flag: boolean): void => {
        valueText = text; valueFlag = flag;
      }, 5, "flag36", true);
      await Utils.msSleep(45);
      clearTimeout(id);
      expect(valueText).assertEqual("flag36");
      expect(valueFlag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_SET_TIMEOUT_3400
     * @tc.name testSetTimeout034
     * @tc.desc Verify setTimeout zero delay callback executes once case 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSetTimeout034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = marker + 1;
      }, 0);
      await Utils.msSleep(40);
      clearTimeout(id);
      expect(marker).assertEqual(1);
    });



  });
}
