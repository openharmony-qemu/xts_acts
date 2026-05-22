'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

export default function ImmersiveOptionsApplyShadowTest(): void {
  describe('ImmersiveOptionsApplyShadowTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.dialog.popup.static", "EntryAbility");
    });

    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/uimaterial/ImmersiveOptionsApplyShadow',
      };
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("[ImmersiveOptionsApplyShadowTest] get state pages: " + JSON.stringify(pages));
        if (!("ImmersiveOptionsApplyShadow" == pages.name)) {
          console.info("[ImmersiveOptionsApplyShadowTest] page name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("[ImmersiveOptionsApplyShadowTest] push page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(500);
      console.info("[ImmersiveOptionsApplyShadowTest] after each called");
    });

    /**
     * @tc.name   ImmersiveOptionsApplyShadowTest_0100
     * @tc.number SUB_ARKUI_API_ImmersiveOptionsApplyShadowTest_0100
     * @tc.desc   To test ImmersiveOptions.applyShadow with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ImmersiveOptionsApplyShadowTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ImmersiveOptionsApplyShadowTest_0100 START');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let strJson = inspector.getInspectorByKey('undefined');
      console.info('ImmersiveOptionsApplyShadowTest_0100 strJson: ' + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getElement('systemMaterial').getElement('material').getString('type')).assertEqual('MaterialType.IMMERSIVE');

      console.info('ImmersiveOptionsApplyShadowTest_0100 END');
      done();
    });
  });
}