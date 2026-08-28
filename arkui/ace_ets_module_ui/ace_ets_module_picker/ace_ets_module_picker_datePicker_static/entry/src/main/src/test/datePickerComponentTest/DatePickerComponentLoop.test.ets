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

export default function DatePickerComponentLoopTest() {
  describe('DatePickerComponentLoopTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentLoopTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentLoop',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerComponentLoopTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePickerComponentLoop') {
          routerInstance.replaceUrl(options);
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentLoopTest replaceUrl error: ' + err);
        expect().assertFail();
      }
      console.info("DatePickerComponentLoopTest beforeEach end");
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("DatePickerComponentLoopTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LOOP_0100
     * @tc.name DatePickerComponentLoop_default_0100
     * @tc.desc Verify DatePickerComponent default loop text content contains 'loop: true'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentLoop_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentLoop_default_0100 START')
      try {
        let strJson = inspector.getInspectorByKey('text_loop_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('loop: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentLoop_default_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_LOOP_0200
     * @tc.name DatePickerComponentLoop_false_0200
     * @tc.desc Verify DatePickerComponent loop changes to false after clicking button
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentLoop_false_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentLoop_false_0200 START')
      try {
        let driver = await Driver.create();
        let button = await driver.findComponent(ON.id('button_loop_false'));
        await (button?.click() as Promise<void>);
        await CommonFunc.sleep(SLEEP_TIME);
        let strJson = inspector.getInspectorByKey('text_loop_value');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('loop: false');
        done();
      } catch (err) {
        console.error('DatePickerComponentLoop_false_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
