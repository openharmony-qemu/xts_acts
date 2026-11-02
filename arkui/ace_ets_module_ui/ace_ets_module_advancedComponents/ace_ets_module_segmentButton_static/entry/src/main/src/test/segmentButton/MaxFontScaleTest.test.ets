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

import { describe, beforeEach, it, expect, Level, Size, afterEach, TestType } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
export default function MaxFontScaleTest() {
  describe('MaxFontScaleTest', () => {

    beforeEach(async () => {
      console.info('MaxFontScaleTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/segmentButton/MaxFontScaleTest',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get MaxFontScaleTest state pages:' + JSON.stringify(pages));
        if (!('MaxFontScaleTest' == pages.name)) {
          console.info('get MaxFontScaleTest pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push MaxFontScaleTest page error:' + err); 
      }
      console.info('MaxFontScaleTest beforeEach end');
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_MaxFontScaleTest_static_0100
     * @tc.number SUB_ARKUI_API_MaxFontScaleTest_static_0100
     * @tc.desc   add advancedComponents xts 
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_ARKUI_API_MaxFontScaleTest_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
     console.info('[SUB_ARKUI_API_MaxFontScaleTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let text = inspector.getInspectorByKey('text');
      console.info("[SUB_ARKUI_API_MaxFontScaleTest_static_0100] JSON.parseJsonElement(text) is: " + JSON.stringifyJsonElement(JSON.parseJsonElement(text)));
      expect(JSON.parseJsonElement(text).getElement('$attrs').getString('content')).assertEqual('maxFontScale: 2');
      console.info('[SUB_ARKUI_API_MaxFontScaleTest_static_0100] END');
      done();
    });
  })
}