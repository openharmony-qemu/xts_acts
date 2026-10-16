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

export default function GlobalClearIntervalTest(): void {
  describe('GlobalClearIntervalTest', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0100
     * @tc.name testClearInterval001
     * @tc.desc Verify clearInterval(timerId) with 1 parameter cancels callback timer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 20);
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0200
     * @tc.name testClearInterval002
     * @tc.desc Verify clearInterval with invalid and nonexistent timer IDs does not cancel an active interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 20);
      clearInterval(0);
      clearInterval(-1);
      clearInterval(99999);
      clearInterval(Int.MAX_VALUE);
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0300
     * @tc.name testClearInterval003
     * @tc.desc Verify clearInterval clears interval with long delay before callback fires
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, Int.MAX_VALUE);
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0400
     * @tc.name testClearInterval004
     * @tc.desc Verify clearInterval clears another valid interval ID returned from string interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const timerId: int = setInterval("another interval message", 1000);
      expect(timerId > 0).assertTrue();
      clearInterval(timerId);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0500
     * @tc.name testClearInterval005
     * @tc.desc Verify clearInterval() does not cancel an active interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 20);
      clearInterval();
      await Utils.msSleep(80);
      clearInterval(timerId);
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0600
     * @tc.name testClearInterval006
     * @tc.desc Verify clearing the same timer ID 3 times consecutively cancels interval callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      const timerId: int = setInterval(() => {
        count++;
      }, 20);
      clearInterval(timerId);
      clearInterval(timerId);
      clearInterval(timerId);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0700
     * @tc.name testClearInterval007
     * @tc.desc Verify calling clearInterval twice keeps delayed interval callback cancelled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count = count + 1;
      }, 209);
      clearInterval(id);
      clearInterval(id);
      await Utils.msSleep(240);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0800
     * @tc.name testClearInterval008
     * @tc.desc Verify clearInterval ignores positive non-timer ID and cancels a valid interval
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count++;
      }, 20);
      clearInterval(20010);
      await Utils.msSleep(80);
      expect(count > 0).assertTrue();
      clearInterval(id);
      let countAfterClear: int = count;
      await Utils.msSleep(80);
      expect(count).assertEqual(countAfterClear);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_0900
     * @tc.name testClearInterval009
     * @tc.desc Verify clearInterval accepts null before clearing valid interval ID
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count++;
      }, 20);
      clearInterval(null);
      await Utils.msSleep(80);
      clearInterval(id);
      expect(id > 0).assertTrue();
      expect(count > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_1000
     * @tc.name testClearInterval010
     * @tc.desc Verify clearInterval ignores negative non-timer ID before clearing case 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setInterval((): void => {
      }, 512);
      clearInterval(-12);
      clearInterval(id);
      expect(id > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_1100
     * @tc.name testClearInterval011
     * @tc.desc Verify clearInterval cancels long-delay callback interval case 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count++;
      }, 514);
      clearInterval(id);
      await Utils.msSleep(80);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_1200
     * @tc.name testClearInterval012
     * @tc.desc Verify clearInterval cancellation behavior case 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let first: int = 0;
      let second: int = 0;
      let firstId: int = setInterval((): void => {
        first++;
      }, 20);
      let secondId: int = setInterval((): void => {
        second++;
      }, 20);
      clearInterval(firstId);
      await Utils.msSleep(80);
      clearInterval(secondId);
      expect(first).assertEqual(0);
      expect(second > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_1300
     * @tc.name testClearInterval013
     * @tc.desc Verify clearInterval can be called twice for string interval case 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let id: int = setInterval("clear interval message 18", 200);
      expect(id > 0).assertTrue();
      clearInterval(id);
      clearInterval(id);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_CLEAR_INTERVAL_1400
     * @tc.name testClearInterval014
     * @tc.desc Verify clearInterval cancellation behavior case 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClearInterval014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      let count: int = 0;
      let id: int = setInterval((): void => {
        count++;
      }, 20);
      await Utils.msSleep(80);
      clearInterval(id);
      let stopped: int = count;
      await Utils.msSleep(70);
      expect(count).assertEqual(stopped);
    });
  });
}
