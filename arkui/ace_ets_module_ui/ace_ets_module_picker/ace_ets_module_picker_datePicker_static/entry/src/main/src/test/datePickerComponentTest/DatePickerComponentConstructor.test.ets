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
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext'
import { AppStorage } from '@ohos.arkui.stateManagement'

const SLEEP_TIME = 1000

export default function DatePickerComponentConstructorTest() {
  describe('DatePickerComponentConstructorTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info('DatePickerComponentConstructorTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/datePickerComponent/DatePickerComponentConstructor',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router
        routerInstance.clear()
        let pages = routerInstance.getState()
        if (pages.name !== 'DatePickerComponentConstructor') {
          routerInstance.replaceUrl(options)
        }
        await CommonFunc.sleep(SLEEP_TIME);
      } catch (err) {
        console.error('DatePickerComponentConstructorTest replaceUrl error: ' + err)
        expect().assertFail();
      }
      console.info("DatePickerComponentConstructorTest beforeEach end");
    })

    afterEach(async () => {
      await CommonFunc.sleep(SLEEP_TIME);
      console.info("DatePickerComponentConstructorTest after each called");
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_CONSTRUCTOR_0100
     * @tc.name DatePickerComponentConstructor_default_created_0100
     * @tc.desc Verify default created DatePickerComponent text content contains 'DatePickerComponent_default_created'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentConstructor_default_created_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentConstructor_default_created_0100 START')
      try {
        let strJson = inspector.getInspectorByKey('text_default_created');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('DatePickerComponent_default_created');
        done();
      } catch (err) {
        console.error('DatePickerComponentConstructor_default_created_0100 error: ' + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number SUB_ARKUI_DATEPICKERCOMPONENT_CONSTRUCTOR_0200
     * @tc.name DatePickerComponentConstructor_explicit_created_0200
     * @tc.desc Verify explicit created DatePickerComponent text content contains 'DatePickerComponent_explicit_created'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('DatePickerComponentConstructor_explicit_created_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('DatePickerComponentConstructor_explicit_created_0200 START')
      try {
        let strJson = inspector.getInspectorByKey('text_explicit_created');
        let obj = JSON.parseJsonElement(strJson);
        let content: string = obj.getElement('$attrs').getString('content');
        expect(content).assertContain('DatePickerComponent_explicit_created');
        done();
      } catch (err) {
        console.error('DatePickerComponentConstructor_explicit_created_0200 error: ' + err);
        expect().assertFail();
        done();
      }
    })
  })
}
