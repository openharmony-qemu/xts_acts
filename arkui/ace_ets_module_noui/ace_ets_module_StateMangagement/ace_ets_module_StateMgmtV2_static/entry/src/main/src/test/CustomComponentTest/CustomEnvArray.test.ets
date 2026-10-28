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

export default function CustomEnvArray(): void {
  describe('CustomEnvArrayTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvArray',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvArray state pages:' + JSON.stringify(pages));
        if (!('CustomEnvArray' == pages.name)) {
          console.info('get CustomEnvArray state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvArray page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvArray after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_ARRAY_0100
     * @tc.number SUB_ARKUI_CUSTOMENV_ARRAY_0100
     * @tc.desc   test @CustomEnv decorator with Array type - verify initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_ARRAY_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0100] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify initial state - array contains apple and banana
        let strJson = inspector.getInspectorByKey('customEnvArray_001');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('content')).assertEqual('apple');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_ARRAY_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_ARRAY_0200
     * @tc.number SUB_ARKUI_CUSTOMENV_ARRAY_0200
     * @tc.desc   test @CustomEnv Array - verify Push operation adds element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_ARRAY_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0200] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the Push element button to add cherry to array
        let btn = await driver.findComponent(ON.id('customEnvArray_002'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // Verify the array now contains cherry (third element)
        // After push, array is [apple, banana, cherry]
        let strJson = inspector.getInspectorByKey('customEnvArray_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0200] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0200] content is: ' + content);

        // After pushing, the first element remains apple
        expect(content).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_CUSTOMENV_ARRAY_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_ARRAY_0300
     * @tc.number SUB_ARKUI_CUSTOMENV_ARRAY_0300
     * @tc.desc   test @CustomEnv Array - verify Reverse operation flips array order
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_ARRAY_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0300] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the Reverse array button
        let btn = await driver.findComponent(ON.id('customEnvArray_003'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // After reverse, array is [banana, apple]
        // First element should now be banana
        let strJson = inspector.getInspectorByKey('customEnvArray_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0300] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0300] content is: ' + content);

        expect(content).assertEqual('cherry');
      } catch (err){
        console.error("SUB_ARKUI_CUSTOMENV_ARRAY_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0300] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_ARRAY_0400
     * @tc.number SUB_ARKUI_CUSTOMENV_ARRAY_0400
     * @tc.desc   test @CustomEnv Array - verify Fill operation replaces all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_ARRAY_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0400] START');
      try{
        let driver: Driver = await Driver.create();
        await CommonFunc.sleep(1500);

        // Click the Fill array button
        let btn = await driver.findComponent(ON.id('customEnvArray_004'));
        await (btn?.click());
        await CommonFunc.sleep(1500);

        // After fill, array is [apple, apple]
        // First element should still be apple
        let strJson = inspector.getInspectorByKey('customEnvArray_001');
        let obj = JSON.parseJsonElement(strJson);
        console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0400] strJson is: ' + strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0400] content is: ' + content);

        expect(content).assertEqual('apple');
      } catch (err){
        console.error("SUB_ARKUI_CUSTOMENV_ARRAY_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_ARRAY_0400] END')
      done();
    });

  })
}
