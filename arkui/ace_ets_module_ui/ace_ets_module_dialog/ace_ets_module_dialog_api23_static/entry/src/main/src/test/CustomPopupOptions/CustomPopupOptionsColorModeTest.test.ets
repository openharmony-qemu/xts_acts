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

import router from '@ohos.router';
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Driver, ON, MatchPattern } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';
import { AnchoredColorMode } from '@kit.ArkUI';

export default function CustomPopupOptionsColorModeTest() {
  describe('CustomPopupOptionsColorModeTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CustomPopupOptionsColorMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomPopupOptions/CustomPopupOptionsColorMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("CustomPopupOptionsColorMode state pages: " + JSON.stringify(pages));
        console.info("CustomPopupOptionsColorMode state pages.name: " + pages.name);
        if (pages.name !== "CustomPopupOptionsColorMode") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("CustomPopupOptionsColorMode replaceUrl error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   CustomPopupOptionsColorModeTest_0100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsColorModeTest_0100
     * @tc.desc   add arkui api
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsColorModeTest_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('CustomPopupOptionsColorModeTest_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(2000);
      
      expect(AnchoredColorMode.FOLLOW_SYSTEM).assertEqual(0);
      expect(AnchoredColorMode.FOLLOW_TARGET).assertEqual(1);

      console.info('CustomPopupOptionsColorModeTest_0100 END');
      done();
      } catch (err) {
        console.info('CustomPopupOptionsColorModeTest_0100 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  })
}