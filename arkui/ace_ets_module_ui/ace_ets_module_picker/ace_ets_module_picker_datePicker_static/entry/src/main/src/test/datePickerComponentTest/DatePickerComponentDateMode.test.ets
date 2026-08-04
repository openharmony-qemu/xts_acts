'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium/index'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import Utils from '../../../ets/MainAbility/common/Utils'
import { Driver, ON, Component } from '@ohos.UiTest'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'
import { UtilsTest } from '../Util.test'

const SLEEP_TIME = 1000

export default function DatePickerComponentDateModeTest() {
  describe('DatePickerComponentDateModeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('DatePickerComponentDateModeTest beforeAll start')
      await UtilsTest.startAbility('com.arkui.ace.picker.datePicker.static', 'EntryAbility')
    })

    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentDateModeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentDateMode',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerComponentDateModeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePickerComponentDateMode') {
          routerInstance.replaceUrl(options)
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentDateModeTest replaceUrl error: ' + err)
        expect().assertFail();
      }
      console.info("DatePickerComponentDateModeTest beforeEach end");
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("DatePickerComponentDateModeTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_DATEMODE_0100
     * @tc.name DatePickerComponentDateMode_default_0100
     * @tc.desc Verify DatePickerComponent default dateMode text content contains 'dateMode: 0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentDateMode_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateMode_default_0100 START');
      try {
        let strJson = inspector.getInspectorByKey('text_dateMode_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('dateMode: 0');
        done();
      } catch (err) {
        console.error('DatePickerComponentDateMode_default_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_DATEMODE_0200
     * @tc.name DatePickerComponentDateMode_yearAndMonth_0200
     * @tc.desc Verify DatePickerComponent dateMode changes to YEAR_AND_MONTH after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentDateMode_yearAndMonth_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateMode_yearAndMonth_0200 START')
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('button_dateMode_yearAndMonth'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('text_dateMode_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('dateMode: 1');
        done();
      } catch (err) {
        console.error('DatePickerComponentDateMode_yearAndMonth_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_DATEMODE_0300
     * @tc.name DatePickerComponentDateMode_monthAndDay_0300
     * @tc.desc Verify DatePickerComponent dateMode changes to MONTH_AND_DAY after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentDateMode_monthAndDay_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDateMode_monthAndDay_0300 START')
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('button_dateMode_monthAndDay'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('text_dateMode_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('dateMode: 2');
        done();
      } catch (err) {
        console.error('DatePickerComponentDateMode_monthAndDay_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
