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

export default function CustomEnvWatch(): void {
  describe('CustomEnvWatchTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvWatch',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvWatch state pages:' + JSON.stringify(pages));
        if (!('CustomEnvWatch' == pages.name)) {
          console.info('get CustomEnvWatch state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvWatch page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvWatch after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvWatch_0100
     * @tc.number SUB_ARKUI_CustomEnvWatch_0100
     * @tc.desc   test @CustomEnv and @Watch decorator combination - verify initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvWatch_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvWatch_0100] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify initial state - Index message shows initial defaultMessage value
        let strJson = inspector.getInspectorByKey('customenvWatch_003');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvWatch_0100] content is: ' + content);
        expect(content).assertEqual('Index message is : the nearest WithEnv');
      } catch (err) {
        console.error("SUB_ARKUI_CustomEnvWatch_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvWatch_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CustomEnvWatch_0200
     * @tc.number SUB_ARKUI_CustomEnvWatch_0200
     * @tc.desc   test @CustomEnv and @Watch decorator - verify Watch callback triggers on value change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CustomEnvWatch_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CustomEnvWatch_0200] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the change button to trigger state update
        let btn = await driver.findComponent(ON.id('customenvWatch_001'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // Verify the Child component's message has been updated via @CustomEnv and @Watch
        let strJson = inspector.getInspectorByKey('customenvWatch_002');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CustomEnvWatch_0200] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CustomEnvWatch_0200] content is: ' + content);

        // After clicking, the defaultMessage changes to 'Hello World', which triggers @Watch in Child
        // The Child message should reflect this change
        expect(content).assertEqual('Child message is :Hello World;num1:3');
      } catch (err){
        console.error("SUB_ARKUI_CustomEnvWatch_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CustomEnvWatch_0200] END')
      done();
    });

  })
}
