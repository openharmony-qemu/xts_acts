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
import { Driver, ON, Component, Rect } from '@ohos.UiTest'
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'

const SLEEP_TIME = 1000

export default function DatePickerComponentOnChangeTest() {
  describe('DatePickerComponentOnChangeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentOnChangeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentOnChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('DatePickerComponentOnChangeTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'DatePickerComponentOnChange') {
          routerInstance.replaceUrl(options)
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentOnChangeTest replaceUrl error: ' + err);
        expect().assertFail();
      }
      console.info("DatePickerComponentOnChangeTest beforeEach end");
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("DatePickerComponentOnChangeTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_ONCHANGE_0100
     * @tc.name DatePickerComponentOnChange_trigger_0100
     * @tc.desc Verify DatePickerComponent onChange callback triggered after swipe
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentOnChange_trigger_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentOnChange_trigger_0100 START')
      try {
        let driver = await Driver.create();
        let strJson = inspector.getInspectorByKey('text_onChange_triggered');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('onChangeTriggered: false');

        let datePickerComp = await driver.findComponent(ON.id('datePickerComponent_onChange'));
        let bounds = await (datePickerComp?.getBounds() as Promise<Rect>);
        let centerX = Math.round(bounds.left + (bounds.right - bounds.left) / 2).toInt();
        let centerY = Math.round(bounds.top + (bounds.bottom - bounds.top) / 2).toInt();
        await driver.swipe(centerX, centerY, centerX, centerY + 50, 600);
        await CommonFunc.sleep(SLEEP_TIME);

        let strJson1 = inspector.getInspectorByKey('text_onChange_triggered');
        let obj1 = JSON.parseJsonElement(strJson1);
        let content1 = obj1.getElement('$attrs').getString('content');
        expect(content1).assertContain('onChangeTriggered: true');
        done();
      } catch (err) {
        console.error('DatePickerComponentOnChange_trigger_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
