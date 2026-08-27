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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function hitTestModeJsunit() {
  describe('hitTestModeJsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("hitTestModeJsunit beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/imageEffects/hitTestMode',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get hitTestModeJsunit state pages:" + JSON.stringify(pages));
        if (!("hitTestMode" == pages.name)) {
          console.info("get hitTestModeJsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push hitTestModeJsunit page error:" + err);
      }
      console.info("hitTestModeJsunit beforeEach end");
    });


    afterEach(async () => {
      try {
        await Utils.sleep(1000);
      } catch (err) {
        console.info('hitTestModeTest afterEach sleep err: ' + JSON.stringify(err));
      }
      console.info("hitTestModeTest after each called");
    });

    
    
    
/**
     * @tc.number   testhitTestMode_static_0002
     * @tc.name     testhitTestMode_static_0002
     * @tc.desc     testhitTestMode_static_0002
     * @tc.level    Level.LEVEL2
     */
it('testhitTestMode_static_0002', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('hitTestMode testhitTestMode0002 START');
      try {
        await Utils.sleep(2000);
      } catch (err) {
        console.info('hitTestModeTest sleep err: ' + JSON.stringify(err));
      }
      let strJson: string = inspector.getInspectorByKey('Block');
      console.info("[testhitTestMode0002] component width strJson:" + strJson);
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      done();
    });
  })
}
