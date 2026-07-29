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
import {describe, beforeEach, afterEach, it, expect, beforeAll, TestType, Size, Level } from "@ohos/hypium";
import events_emitter from '@ohos.events.emitter';
import { waitAndClickComponent, waitForComponent } from './WaitTest.test';
import { Driver } from '@ohos.UiTest';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
export default function WebViewOnFirstScreenPaintCase() {
  let driver: Driver | null = null;
  const getDriver = (): Driver => {
    if (driver == null) {
      driver = Driver.create();
    }
    return driver as Driver;
  }
  describe('WebViewOnFirstScreenPaintTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewOnFirstScreenPaint',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewOnFirstScreenPaint state success " + JSON.stringify(pages));
        if (!("WebViewOnFirstScreenPaint" == pages.name)) {
          console.info("get WebViewOnFirstScreenPaint state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewOnFirstScreenPaint page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewOnFirstScreenPaint page error: " + err);
      }
      await waitForComponent("WebViewOnFirstScreenPaintButton");
      done()
    });
    beforeEach(async (done: Function) => {
      // Local XtsTestServer: skip WLAN (enableWifi -> Permission denied).
      try {
        config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
          console.info(`enable success`);
        }).catch((err: object) => {
          console.error(`failed to enable, ${err}`);
        })
      } catch (err) {
        console.error(`enableAbility skipped: ${err}`);
      }
      console.info("web beforeEach start (skip wifi for local XtsTestServer)");
      done();
    })

    /**
     * @tc.name   testOnFirstScreenPaint001
     * @tc.number SUB_WEB_SCREENSHOTTING_0100
     * @tc.desc   onFirstScreenPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnFirstScreenPaint001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstScreenPaint001", 152069)
      Utils.registerEvent("testOnFirstScreenPaint001", "resource://rawfile/4stiaozhuangbaidu.html", 20260131, done);
      await waitAndClickComponent('WebViewOnFirstScreenPaintButton', getDriver());
    })


    /**
     * @tc.name   testOnFirstScreenPaint002
     * @tc.number SUB_WEB_SCREENSHOTTING_0200
     * @tc.desc   onFirstScreenPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnFirstScreenPaint002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstScreenPaint002", 152069)
      Utils.registerEvent("testOnFirstScreenPaint002", true, 20260132, done);
      await waitAndClickComponent('WebViewOnFirstScreenPaintButton', getDriver());
    })

    /**
     * @tc.name   testOnFirstScreenPaint003
     * @tc.number SUB_WEB_SCREENSHOTTING_0300
     * @tc.desc   onFirstScreenPaint
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEXT
     * @tc.level  LEVEL1
     */
    it('testOnFirstScreenPaint003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnFirstScreenPaint003", 152069)
      Utils.registerEvent("testOnFirstScreenPaint003", true, 20260133, done);
      await waitAndClickComponent('WebViewOnFirstScreenPaintButton', getDriver());
    })
  })
}