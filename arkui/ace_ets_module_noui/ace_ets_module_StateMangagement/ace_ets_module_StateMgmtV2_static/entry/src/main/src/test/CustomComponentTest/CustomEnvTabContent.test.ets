'use static';
/**
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
import { describe, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CustomEnvTabContent(): void {
  describe('CustomEnvTabContentTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvTabContent',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvTabContent state pages:' + JSON.stringify(pages));
        if (!('CustomEnvTabContent' == pages.name)) {
          console.info('get CustomEnvTabContent state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvTabContent page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvTabContent after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvTabContent_0100
     * @tc.number SUB_ARKUI_CustomEnvTabContent_0100
     * @tc.desc   test @CustomEnv and @Monitor decorator combination in Tabs - verify initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvTabContent_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvTabContent_0100] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify initial state - FreezeChild component shows initial message and index value
        // Initial: message=0 (from @Local), index=0 (first tab)
        let strJson = inspector.getInspectorByKey('customEnvTabContent_002');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('content')).assertEqual('message0, index: 0');
      } catch (err) {
        console.error("SUB_ARKUI_CustomEnvTabContent_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvTabContent_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvTabContent_0200
     * @tc.number SUB_ARKUI_CustomEnvTabContent_0200
     * @tc.desc   test @CustomEnv and @Monitor decorator in Tabs - verify message update triggers Monitor callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvTabContent_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvTabContent_0200] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the change button to trigger state update
        let btn = await driver.findComponent(ON.id('customEnvTabContent_001'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // Verify the FreezeChild component's message has been updated via @CustomEnv
        // After clicking, the message increments from 0 to 1, which triggers @Monitor in FreezeChild
        let strJson = inspector.getInspectorByKey('customEnvTabContent_002');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CustomEnvTabContent_0200] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvTabContent_0200] content is: ' + content);

        // After clicking, the message increments to 1
        expect(content).assertEqual('message1, index: 0');
      } catch (err){
        console.error("SUB_ARKUI_CustomEnvTabContent_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvTabContent_0200] END')
      done();
    });

  })
}
