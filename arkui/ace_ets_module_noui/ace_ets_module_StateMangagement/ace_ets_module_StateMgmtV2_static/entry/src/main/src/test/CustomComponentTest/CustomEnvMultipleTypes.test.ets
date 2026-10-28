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

export default function CustomEnvMultipleTypes(): void {
  describe('CustomEnvMultipleTypesTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvMultipleTypes',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvMultipleTypes state pages:' + JSON.stringify(pages));
        if (!('CustomEnvMultipleTypes' == pages.name)) {
          console.info('get CustomEnvMultipleTypes state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvMultipleTypes page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvMultipleTypes after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100
     * @tc.number SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100
     * @tc.desc   test @CustomEnv supports string type - verify initial value and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100] START');
      await CommonFunc.sleep(1500);
      try {
        // Verify string type variable - type should be 'string'
        let strJson = inspector.getInspectorByKey('customEnvMultipleTypes_001');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100] content is: ' + content);
        expect(content).assertEqual('customStrVarName type is string');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200
     * @tc.number SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200
     * @tc.desc   test @CustomEnv supports number type - verify initial value and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200] START');
      await CommonFunc.sleep(1500);
      try {
        // Verify number type variable - type should be 'number'
        let strJson = inspector.getInspectorByKey('customEnvMultipleTypes_002');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200] content is: ' + content);
        expect(content).assertEqual('customNumVarName type is number');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0200] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300
     * @tc.number SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300
     * @tc.desc   test @CustomEnv supports boolean type - verify initial value and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300] START');
      await CommonFunc.sleep(1500);
      try {
        // Verify boolean type variable - type should be 'boolean'
        let strJson = inspector.getInspectorByKey('customEnvMultipleTypes_003');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300] content is: ' + content);
        expect(content).assertEqual('customBoolVarName type is boolean');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0300] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400
     * @tc.number SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400
     * @tc.desc   test @CustomEnv supports object type (class) - verify initial value and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400] START');
      await CommonFunc.sleep(1500);
      try {
        // Verify object type variable - type should be 'object'
        let strJson = inspector.getInspectorByKey('customEnvMultipleTypes_004');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400] content is: ' + content);
        expect(content).assertEqual('customObjVarName type is object');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_MULTIPLETYPES_0400] END')
      done();
    });

  })
}