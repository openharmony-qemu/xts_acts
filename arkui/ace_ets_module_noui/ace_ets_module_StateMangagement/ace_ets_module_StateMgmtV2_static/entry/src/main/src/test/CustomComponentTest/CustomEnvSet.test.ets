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
import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import { AppStorage } from '@ohos.arkui.stateManagement';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { Driver, ON } from '@kit.TestKit';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function CustomEnvSet(): void {
  describe('CustomEnvSetTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvSet',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvSet state pages:' + JSON.stringify(pages));
        if (!('CustomEnvSet' == pages.name)) {
          console.info('get CustomEnvSet state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvSet page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvSet after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_SET_0100
     * @tc.number SUB_ARKUI_CUSTOMENV_SET_0100
     * @tc.desc   test @CustomEnv decorator with Set type - verify initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_SET_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0100] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify initial state - Set contains apple and banana
        let strJson = inspector.getInspectorByKey('customEnvSet_001');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0100] content is: ' + content);
        expect(content).assertEqual('apple');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_SET_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_SET_0200
     * @tc.number SUB_ARKUI_CUSTOMENV_SET_0200
     * @tc.desc   test @CustomEnv Set - verify add operation adds new element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_SET_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0200] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the Add element button to add cherry
        let btn = await driver.findComponent(ON.id('customEnvSet_002'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // Verify the Set now contains cherry
        let strJson = inspector.getInspectorByKey('customEnvSet_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0200] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0200] content is: ' + content);

        expect(content).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_CUSTOMENV_SET_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_SET_0300
     * @tc.number SUB_ARKUI_CUSTOMENV_SET_0300
     * @tc.desc   test @CustomEnv Set - verify delete operation removes element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_SET_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0300] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the Delete element apple button
        let btn = await driver.findComponent(ON.id('customEnvSet_003'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // Verify the apple element has been deleted
        let strJson = inspector.getInspectorByKey('customEnvSet_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0300] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0300] content is: ' + content);

        expect(content).assertEqual('banana');
      } catch (err){
        console.error("SUB_ARKUI_CUSTOMENV_SET_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0300] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_SET_0400
     * @tc.number SUB_ARKUI_CUSTOMENV_SET_0400
     * @tc.desc   test @CustomEnv Set - verify clear operation empties set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_SET_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0400] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the Clear set button
        let btn = await driver.findComponent(ON.id('customEnvSet_004'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // Verify the Set is now empty (ForEach renders nothing)
        let strJson = inspector.getInspectorByKey('customEnvSet_004');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0400] strJson is: ' + strJson);

        // After clear, the Text component should not contain apple or banana
        let label = obj.getElement('$attrs').getString('label');
        console.info('[SUB_ARKUI_CUSTOMENV_SET_0400] label is: ' + label);
        expect(label).assertEqual('Clear set');
      } catch (err){
        console.error("SUB_ARKUI_CUSTOMENV_SET_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_SET_0400] END')
      done();
    });

  })
}
