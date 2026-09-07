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

import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router'
import CommonFunc from '../../../ets/MainAbility/common/Common'
import Utils from '../../../ets/MainAbility/common/Utils'
import { Driver, ON } from '@ohos.UiTest'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'

const SLEEP_TIME = 1000

export default function DatePickerComponentDisplayModeTest() {
  describe('DatePickerComponentDisplayModeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentDisplayModeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentDisplayMode',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerComponentDisplayModeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePickerComponentDisplayMode') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentDisplayModeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
      console.info("DatePickerComponentDisplayModeTest beforeEach end");
    })

    afterEach(async () => {
      try {
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.info('DatePickerComponentDisplayModeTest sleep err: ' + JSON.stringify(err));
      }
      console.info("DatePickerComponentDisplayModeTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_DISPLAYMODE_0100
     * @tc.name DatePickerComponentDisplayMode_default_0100
     * @tc.desc Verify DatePickerComponent default displayMode text content contains 'displayMode: 0'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentDisplayMode_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDisplayMode_default_0100 START')
      try {
        let strJson = inspector.getInspectorByKey('text_displayMode_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('displayMode: 0');
        done();
      } catch (err) {
        console.error('DatePickerComponentDisplayMode_default_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_DISPLAYMODE_0200
     * @tc.name DatePickerComponentDisplayMode_time_0200
     * @tc.desc Verify DatePickerComponent displayMode changes to TIME after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentDisplayMode_time_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDisplayMode_time_0200 START')
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('button_displayMode_time'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('text_displayMode_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('displayMode: 1');
        done()
      } catch (err) {
        console.error('DatePickerComponentDisplayMode_time_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_DISPLAYMODE_0300
     * @tc.name DatePickerComponentDisplayMode_dateTime_0300
     * @tc.desc Verify DatePickerComponent displayMode changes to DATE_TIME after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentDisplayMode_dateTime_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentDisplayMode_dateTime_0300 START')
      try {
        let driver = Driver.create();
        let button = await driver.findComponent(ON.id('button_displayMode_dateTime'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('text_displayMode_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('displayMode: 2');
        done()
      } catch (err) {
        console.error('DatePickerComponentDisplayMode_dateTime_0300 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
