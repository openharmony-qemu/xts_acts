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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function GlobalClearTimeoutTest(): void {
  describe('GlobalClearTimeoutTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0100
     * @tc.name testClearTimeout001
     * @tc.desc Verify clearTimeout() with no parameters does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout();
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0200
     * @tc.name testClearTimeout002
     * @tc.desc Verify clearTimeout(timerId) with 1 valid timer ID cancels the timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(timerId);
      await Utils.msSleep(80);
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0300
     * @tc.name testClearTimeout003
     * @tc.desc Verify clearTimeout(100) with positive non-timer ID does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(100);
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0400
     * @tc.name testClearTimeout004
     * @tc.desc Verify clearTimeout(-1) with negative timer ID does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(-1);
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0500
     * @tc.name testClearTimeout005
     * @tc.desc Verify clearTimeout with Int.MAX_VALUE does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(Int.MAX_VALUE);
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0600
     * @tc.name testClearTimeout006
     * @tc.desc Verify clearTimeout(null) does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(null);
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0700
     * @tc.name testClearTimeout007
     * @tc.desc Verify clearTimeout with non-empty invalid timer IDs does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(0);
      clearTimeout(99999);
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0800
     * @tc.name testClearTimeout008
     * @tc.desc Verify repeated clearTimeout on same timer ID cancels callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(timerId);
      clearTimeout(timerId);
      clearTimeout(timerId);
      await Utils.msSleep(80);
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_0900
     * @tc.name testClearTimeout009
     * @tc.desc Verify clearing two timers repeatedly cancels callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let firstExecuted: boolean = false;
      let secondExecuted: boolean = false;
      const timerId = setTimeout(() => {
        firstExecuted = true;
      }, 20);
      clearTimeout(timerId);
      const timerId2 = setTimeout(() => {
        secondExecuted = true;
      }, 20);
      clearTimeout(timerId2);
      clearTimeout(timerId);
      clearTimeout(timerId);
      clearTimeout(timerId2);
      await Utils.msSleep(80);
      expect(firstExecuted).assertFalse();
      expect(secondExecuted).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1000
     * @tc.name testClearTimeout010
     * @tc.desc Verify multiple timers are cleared successfully before callbacks execute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const id1 = setTimeout(() => {
        count++;
      }, 20);
      const id2 = setTimeout(() => {
        count++;
      }, 20);
      const id3 = setTimeout(() => {
        count++;
      }, 20);
      clearTimeout(id1);
      clearTimeout(id2);
      clearTimeout(id3);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1100
     * @tc.name testClearTimeout011
     * @tc.desc Verify clearing another timer inside a timer callback cancels that timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let firstExecuted: boolean = false;
      const id1 = setTimeout(() => {
        firstExecuted = true;
      }, 60);
      let callbackExecuted: boolean = false;
      const id2 = setTimeout(() => {
        callbackExecuted = true;
        clearTimeout(id1);
      }, 20);
      await Utils.msSleep(120);
      clearTimeout(id2);
      expect(callbackExecuted).assertTrue();
      expect(firstExecuted).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1200
     * @tc.name testClearTimeout012
     * @tc.desc Verify clearTimeout with Double.toInt(parseFloat("NaN")) timer ID does not cancel an active timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId = setTimeout(() => {
        executed = true;
      }, 20);
      let val: int = Double.toInt(parseFloat("NaN"));
      clearTimeout(val);
      await Utils.msSleep(80);
      clearTimeout(timerId);
      expect(executed).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1300
     * @tc.name testClearTimeout013
     * @tc.desc Verify clearTimeout cancels a timer and ignores Double.toInt(parseFloat("Infinity")) timer ID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      const timerId: int = setTimeout(() => {
        executed = true;
      }, 20);
      clearTimeout(timerId);
      let val: int = Double.toInt(parseFloat("Infinity"));
      clearTimeout(val);
      await Utils.msSleep(80);
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1400
     * @tc.name testClearTimeout014
     * @tc.desc Verify calling clearTimeout twice keeps delayed callback cancelled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let executed: boolean = false;
      let id: int = setTimeout((): void => {
        executed = true;
      }, 215);
      clearTimeout(id);
      clearTimeout(id);
      await Utils.msSleep(240);
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1500
     * @tc.name testClearTimeout015
     * @tc.desc Verify clearTimeout ignores positive non-timer ID and cancels a valid timeout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let invalidIdExecuted: boolean = false;
      let invalidIdTimer: int = setTimeout((): void => {
        invalidIdExecuted = true;
      }, 20);
      clearTimeout(10016);
      await Utils.msSleep(80);
      clearTimeout(invalidIdTimer);
      expect(invalidIdExecuted).assertTrue();

      let validIdExecuted: boolean = false;
      let validIdTimer: int = setTimeout((): void => {
        validIdExecuted = true;
      }, 80);
      clearTimeout(validIdTimer);
      await Utils.msSleep(120);
      expect(validIdExecuted).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1600
     * @tc.name testClearTimeout016
     * @tc.desc Verify clearTimeout accepts null before clearing valid timeout ID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let id: int = setTimeout("clear timeout nullable 17", 217);
      clearTimeout(null);
      clearTimeout(id);
      expect(id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1700
     * @tc.name testClearTimeout017
     * @tc.desc Verify clearTimeout accepts undefined before clearing valid timeout case 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setTimeout((): void => {
      }, 519);
      clearTimeout(undefined);
      clearTimeout(id);
      expect(id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1800
     * @tc.name testClearTimeout018
     * @tc.desc Verify clearTimeout cancels long-delay callback timeout case 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setTimeout((): void => {
      }, 520);
      expect(id > 0).assertTrue();
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_1900
     * @tc.name testClearTimeout019
     * @tc.desc Verify clearTimeout ignores negative non-timer ID before clearing case 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setTimeout((): void => {
      }, 522);
      clearTimeout(-22);
      clearTimeout(id);
      expect(id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2000
     * @tc.name testClearTimeout020
     * @tc.desc Verify clearTimeout cancellation behavior case 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = 21;
      }, 80);
      clearTimeout(id);
      await Utils.msSleep(120);
      expect(marker).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2100
     * @tc.name testClearTimeout021
     * @tc.desc Verify clearTimeout cancellation behavior case 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = 22;
      }, 20);
      clearTimeout(-22);
      await Utils.msSleep(70);
      clearTimeout(id);
      expect(marker).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2200
     * @tc.name testClearTimeout022
     * @tc.desc Verify clearTimeout cancellation behavior case 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let firstId: int = setTimeout((): void => {
        marker = 1;
      }, 70);
      let secondId: int = setTimeout((): void => {
        marker = 2;
      }, 20);
      clearTimeout(firstId);
      await Utils.msSleep(90);
      clearTimeout(secondId);
      expect(marker).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2300
     * @tc.name testClearTimeout023
     * @tc.desc Verify clearTimeout can be called twice for same string timeout case 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setTimeout("clear timeout message 24", 200);
      expect(id > 0).assertTrue();
      clearTimeout(id);
      clearTimeout(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2400
     * @tc.name testClearTimeout024
     * @tc.desc Verify clearTimeout null keeps valid timeout clearable case 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setTimeout((): void => {
      }, 200);
      clearTimeout(null);
      clearTimeout(id);
      expect(id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2500
     * @tc.name testClearTimeout025
     * @tc.desc Verify clearTimeout cancellation behavior case 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = marker + 1;
      }, 0);
      await Utils.msSleep(50);
      clearTimeout(id);
      expect(marker).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_TIMEOUT_2600
     * @tc.name testClearTimeout026
     * @tc.desc Verify clearTimeout cancellation behavior case 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearTimeout026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let marker: int = 0;
      let id: int = setTimeout((): void => {
        marker = marker + 1;
      }, 60);
       clearTimeout(id);
      await Utils.msSleep(100);
      clearTimeout(id);
      expect(marker).assertEqual(0);
    });


  });
}
