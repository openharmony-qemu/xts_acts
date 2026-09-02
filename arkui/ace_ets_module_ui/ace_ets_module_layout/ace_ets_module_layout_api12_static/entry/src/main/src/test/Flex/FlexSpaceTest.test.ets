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

export default function FlexSpaceTest() {
  describe('FlexSpaceTest', (): void => {
    beforeEach(async (): Promise<void> => {
      console.info("FlexSpaceTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/FlexSpaceTest',
      }
      try {
        const router = AppStorage.get<Router>("router") as Router
        router.clear();
        let pages = router.getState();
        console.info("get FlexSpaceTest state pages:" + JSON.stringify(pages));
        if (!("FlexSpaceTest" == pages.name)) {
          console.info("get FlexSpaceTest pages.name:" + JSON.stringify(pages.name));
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push FlexSpaceTest page error:" + err);
      }
      console.info("FlexSpaceTest beforeEach end");
    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('FlexSpaceTest sleep err: ' + JSON.stringify(err));
      }
      console.info("FlexSpaceTest after each called");
    });


    
    /**
     * @tc.number   FlexSpaceTest_static_0100
     * @tc.name     FlexSpaceTest_static_0100
     * @tc.desc     FlexSpaceTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('FlexSpaceTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('FlexSpaceTest_static_0100 START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('FlexSpaceTest sleep err: ' + JSON.stringify(err));
      }

      let text1Rect = CommonFunc.getComponentRect('FlexSpaceTest_text1');
      console.info("[FlexSpaceTest_static_0100] text1Rect.bottom " + text1Rect.bottom);
      let text3Rect = CommonFunc.getComponentRect('FlexSpaceTest_text3');
      console.info("[FlexSpaceTest_static_0100] text3Rect.top " + text3Rect.top);
      expect(Math.abs((text3Rect.top - text1Rect.bottom) - 50) <= 1).assertTrue();
      console.info('FlexSpaceTest_static_0100 END');
      done()
    });
  })
}