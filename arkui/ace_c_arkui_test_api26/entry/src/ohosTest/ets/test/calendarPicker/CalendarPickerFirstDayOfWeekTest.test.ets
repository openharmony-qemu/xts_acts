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

import { beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeFunc from 'libnativefunc.so'

export default function CalendarPickerFirstDayOfWeekTest() {

  describe('CalendarPickerFirstDayOfWeekTest', () => {

    beforeEach(async (done: Function) => {
      await Utils.sleep(100);
      done();
    });

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek001
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0100
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.LOCAL(0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek001', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek001()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek002
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0200
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.MON(1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek002', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek002()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek003
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0300
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.TUE(2)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek003', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek003()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek004
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0400
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.WED(3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek004', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek004()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek005
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0500
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.THU(4)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek005', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek005()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek006
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0600
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.FRI(5)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek006', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek006()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek007
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0700
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.SAT(6)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek007', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek007()).assertEqual(0)
      done()
    })

    /**
     * @tc.name   testCalendarPickerFirstDayOfWeek008
     * @tc.number SUB_ARKUI_CALENDARPICKER_FIRSTDAYOFWEEK_TEST_0800
     * @tc.desc   Test NODE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK with CalendarFirstDayOfWeek.SUN(7)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCalendarPickerFirstDayOfWeek008', Level.LEVEL1, async (done: Function) => {
      expect(nativeFunc.testCalendarPickerFirstDayOfWeek008()).assertEqual(0)
      done()
    })
  })
}
