/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import {  beforeAll, beforeEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import Utils from './Utils.test';
import { BusinessError } from '@ohos.base';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import { accessibility } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let emitKey = ""
const EVENT_ID_SET_SUITE_KEY = 181214;
const driver = Driver.create();

export default function WebViewFullScreenVideoOverlayCaseTest() {
  describe('WebViewFullScreenVideoOverlayTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewFullScreenVideoOverlay',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebEnableDrag state success " + JSON.stringify(pages));
        if (!("WebViewFullScreenVideoOverlay" == pages.name)) {
          console.info("get WebEnableDrag state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("FullScreenVideoOverlayButton"), 10000);
          console.info("push enableFullscreenVideoOverlay page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push enableFullscreenVideoOverlay page error: " + err);
      }
      done()
    });
    beforeEach(async (done: Function) => {
      console.info("web beforeEach start");
      done();
    })

    /**
     * @tc.name   testEnableFullscreenVideoOverlay01
     * @tc.number SUB_WEB_FULL_SCREEN_0100
     * @tc.desc   test testEnableFullscreenVideoOverlay01
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitEnableFullscreenVideoOverlay01"
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testEnableFullscreenVideoOverlay01", true, 20260819, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        try {
           await Utils.waitAndClickComponent(driver, 'FullScreenVideoOverlayButton')
        } catch (error) {
          // 处理错误
          console.error('Error occurred while waiting and clicking component:', error);
      }
      done();
    })

    /**
     * @tc.name   testEnableFullscreenVideoOverlay02
     * @tc.number SUB_WEB_FULL_SCREEN_0200
     * @tc.desc   test testEnableFullscreenVideoOverlay02
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = "emitEnableFullscreenVideoOverlay02"
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
      Utils.registerBaseEvent("testEnableFullscreenVideoOverlay02", true, 20260820, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
        try {
          await Utils.waitAndClickComponent(driver, 'FullScreenVideoOverlayButton')
          } catch (error) {
            // 处理错误
            console.error('Error occurred while waiting and clicking component:', error);
        }
        done();
    })

  })
}
