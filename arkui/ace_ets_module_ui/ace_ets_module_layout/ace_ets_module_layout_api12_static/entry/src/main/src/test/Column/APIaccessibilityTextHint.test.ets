'use static';
/*
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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import router from '@ohos.router';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function APIaccessibilityTextHint() {
  describe('APIaccessibilityTextHint', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("APIaccessibilityTextHint beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/APIaccessibilityTextHint',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get APIaccessibilityTextHint state pages:" + JSON.stringify(pages));
        if (!("APIaccessibilityTextHint" == pages.name)) {
          console.info("get APIaccessibilityTextHint pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push APIaccessibilityTextHint page error:" + err);
      }
      console.info("APIaccessibilityTextHint beforeEach end");
    });
    afterEach(async () => {
    });


    
    /**
     * @tc.number   APIaccessibilityTextHint_static_0100
     * @tc.name     APIaccessibilityTextHint_static_0100
     * @tc.desc     APIaccessibilityTextHint_static_0100
     * @tc.level    Level.LEVEL0
     */
it('APIaccessibilityTextHint_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('APIaccessibilityTextHint_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('APIaccessibilityTextHint sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('APIaccessibilityTextHint');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[APIaccessibilityTextHint_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString('accessibilityTextHint')).assertEqual('str');
      console.info('[APIaccessibilityTextHint_static_0100] END');
      done()
    });
  })
}