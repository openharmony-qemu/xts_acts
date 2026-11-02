'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeEach, it, expect, Level, Size, TestType, afterEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function AccessibilitySelectedTypeTest() {
  describe('AccessibilitySelectedTypeTest', () => {

    beforeEach(async () => {
      console.info('AccessibilitySelectedTypeTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/AccessibilitySelectedTypeTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get AccessibilitySelectedTypeTest state pages:' + JSON.stringify(pages));
        if (!('AccessibilitySelectedTypeTest' == pages.name)) {
          console.info('get AccessibilitySelectedTypeTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push AccessibilitySelectedTypeTest page error:' + err);
      }
      console.info('AccessibilitySelectedTypeTest beforeEach end');
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100
     * @tc.number SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100
     * @tc.desc   add advancedComponents xts 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
     console.info('[SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      
      let strJson1 = inspector.getInspectorByKey('text');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info('[SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100] obj1.$attrs.content is: ' + obj1.getElement('$attrs').getString('content'));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('0');
      let btn1 = await driver.findComponent(ON.id('btn'));
      await btn1!.click()
      await CommonFunc.sleep(1000);
      let strJson2 = inspector.getInspectorByKey('text');
      let obj2 = JSON.parseJsonElement(strJson2);
      console.info('[SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100] obj2.$attrs.content is: ' + obj2.getElement('$attrs').getString('content'));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('1');
      await btn1!.click()
      await CommonFunc.sleep(1000);
      let strJson3 = inspector.getInspectorByKey('text');
      let obj3 = JSON.parseJsonElement(strJson3);
      console.info('[SUB_ARKUI_API_AccessibilitySelectedTypeTest_static_0100] obj3.$attrs.content is: ' + obj3.getElement('$attrs').getString('content'));
      expect(obj3.getElement('$attrs').getString('content')).assertEqual('2');
      done();
    });
  })
}