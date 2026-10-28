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

export default function CustomEnvNearest(): void {
  describe('CustomEnvNearestTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("==============================");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomComponent/CustomEnvNearest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get CustomEnvNearest state pages:' + JSON.stringify(pages));
        if (!('CustomEnvNearest' == pages.name)) {
          console.info('get CustomEnvNearest state pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push CustomEnvNearest page error:' + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('CustomEnvNearest after each called');
    });

    /**
     * @tc.name   SUB_ARKUI_CUSTOMENV_NEAREST_0100
     * @tc.number SUB_ARKUI_CUSTOMENV_NEAREST_0100
     * @tc.desc   test @CustomEnv follows nearest principle - verify Child gets the nearest WithEnv value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_CUSTOMENV_NEAREST_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_CUSTOMENV_NEAREST_0100] START');
      await CommonFunc.sleep(1500);
      try {
        // Verify Child component gets the nearest WithEnv value ('the nearest WithEnv'),
        // not the outer WithEnv value ('outer WithEnv')
        let strJson = inspector.getInspectorByKey('customEnvNearest_001');
        let obj = JSON.parseJsonElement(strJson);
        let content = obj.getElement('$attrs').getString('content');
        console.info('[SUB_ARKUI_CUSTOMENV_NEAREST_0100] content is: ' + content);
        expect(content).assertEqual('Child: the nearest WithEnv');
      } catch (err) {
        console.error("SUB_ARKUI_CUSTOMENV_NEAREST_0100 error:" + err);
        expect(true).assertEqual(false);
      }
      console.info('[SUB_ARKUI_CUSTOMENV_NEAREST_0100] END')
      done();
    });

  })
}