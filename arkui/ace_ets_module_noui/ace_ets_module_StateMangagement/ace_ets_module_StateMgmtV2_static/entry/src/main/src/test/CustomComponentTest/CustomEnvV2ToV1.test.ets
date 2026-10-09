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

export default function CustomEnvV2ToV1(): void {
  describe('CustomEnvV2ToV1Test', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvV2ToV1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvV2ToV1 state pages:' + JSON.stringify(pages));
        if (!('CustomEnvV2ToV1' == pages.name)) {
          console.info('get CustomEnvV2ToV1 state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvV2ToV1 page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvV2ToV1 after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_V2TOV1_0100
     * @tc.number SUB_ARKUI_CUSTOMENV_V2TOV1_0100
     * @tc.desc   test @CustomEnv decorator with V1/V2 mixing - verify parent component initial state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_V2TOV1_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_V2TOV1_0100] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify initial state - Parent component shows 'parent Value'
        let strJson = inspector.getInspectorByKey('customEnvV2ToV1_001');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_V2TOV1_0100] parent content is: ' + content);
        expect(content).assertEqual('Parent Value is :parent Value');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_V2TOV1_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_V2TOV1_0100] END')
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_V2TOV1_0200
     * @tc.number SUB_ARKUI_CUSTOMENV_V2TOV1_0200
     * @tc.desc   test @CustomEnv decorator with V1/V2 mixing - verify child component receives value from V2 parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_V2TOV1_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_V2TOV1_0200] START');
      await CommonFunc.sleep(1500);
      try{
        // Verify child component receives the value from V2 parent via @CustomEnv
        // Child component shows 'Child value is :parent Value'
        let strJson = inspector.getInspectorByKey('customEnvV2ToV1_003');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_V2TOV1_0200] child content is: ' + content);
        expect(content).assertEqual('Child value is :parent Value');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_V2TOV1_0200 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_V2TOV1_0200] END')
      done();
    });

  })
}
