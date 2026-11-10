'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import Utils from '../../../ets/MainAbility/common/Utils'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'

const SLEEP_TIME = 1000

export default function CalendarPickerFirstDayOfWeekTest() {
  describe('CalendarPickerFirstDayOfWeekTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeekTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/calendarPicker/firstDayOfWeek',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('CalendarPickerFirstDayOfWeekTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'CalendarPickerFirstDayOfWeek') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeekTest replaceUrl error: ' + err);
        expect().assertFail();
      }
      console.info("CalendarPickerFirstDayOfWeekTest beforeEach end");
    })

    afterEach(async () => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('CalendarPickerFirstDayOfWeekTest sleep err: ' + JSON.stringify(err));
      }
      console.info("CalendarPickerFirstDayOfWeekTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0100
     * @tc.name CalendarPickerFirstDayOfWeek_local_0100
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.LOCAL test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_local_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_local_0100 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker001');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_local_0100 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_local_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0200
     * @tc.name CalendarPickerFirstDayOfWeek_mon_0200
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.MON test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_mon_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_mon_0200 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker002');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_mon_0200 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.MON');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_mon_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0300
     * @tc.name CalendarPickerFirstDayOfWeek_tue_0300
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.TUE test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_tue_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_tue_0300 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker003');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_tue_0300 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.TUE');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_tue_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0400
     * @tc.name CalendarPickerFirstDayOfWeek_wed_0400
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.WED test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_wed_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_wed_0400 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker004');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_wed_0400 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.WED');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_wed_0400 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0500
     * @tc.name CalendarPickerFirstDayOfWeek_thu_0500
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.THU test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_thu_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_thu_0500 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker005');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_thu_0500 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.THU');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_thu_0500 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0600
     * @tc.name CalendarPickerFirstDayOfWeek_fri_0600
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.FRI test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_fri_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_fri_0600 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker006');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_fri_0600 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.FRI');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_fri_0600 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0700
     * @tc.name CalendarPickerFirstDayOfWeek_sat_0700
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.SAT test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_sat_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_sat_0700 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker007');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_sat_0700 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SAT');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_sat_0700 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_0800
     * @tc.name CalendarPickerFirstDayOfWeek_sun_0800
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with CalendarFirstDayOfWeek.SUN test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_sun_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_sun_0800 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker008');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_sun_0800 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.SUN');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_sun_0800 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_ACE_ENGINE_CALENDAR_PICKER_FIRST_DAY_OF_WEEK_STATIC_1100
     * @tc.name CalendarPickerFirstDayOfWeek_undefined_1100
     * @tc.desc Verify CalendarPicker firstDayOfWeek property with undefined value test.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('CalendarPickerFirstDayOfWeek_undefined_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CalendarPickerFirstDayOfWeek_undefined_1100 START')
      try {
        let strJson = inspector.getInspectorByKey('calendarPicker011');
        let obj = JSON.parseJsonElement(strJson);
        let firstDayOfWeek: string = obj.getElement('$attrs').getString('firstDayOfWeek');
        console.info('CalendarPickerFirstDayOfWeek_undefined_1100 firstDayOfWeek: ' + firstDayOfWeek);
        expect(firstDayOfWeek).assertEqual('CalendarFirstDayOfWeek.LOCAL');
        done();
      } catch (err) {
        console.error('CalendarPickerFirstDayOfWeek_undefined_1100 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
