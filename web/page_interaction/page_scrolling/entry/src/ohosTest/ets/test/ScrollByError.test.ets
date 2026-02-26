/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 179560;
let driver: Driver = Driver.create();

export default function scrollByError() {
  describe('scrollByErrorTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/ScrollByError',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollByError state success " + JSON.stringify(pages));
        if (!("ScrollByError" == pages.name)) {
          console.info("get scrollByError state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("scrollByErrorButton"), 10000);
          console.info("push scrollByError page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollByError page error: " + err);
      }
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })


    /**
     * @tc.name   testScrollByDeltaYUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBY_ERROR_001
     * @tc.desc   WebviewController scrollBy deltaY undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByDeltaYUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollByDeltaYUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollByDeltaYUndefined", "401", 179564, done);
      sendEventByKey('scrollByErrorButton', 10, '');
    })


    /**
     * @tc.name   testScrollByDeltaXNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBY_ERROR_002
     * @tc.desc   WebviewController scrollBy duration undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByDeltaXNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollByDeltaXNull", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollByDeltaXNull", "401", 179561, done);
      sendEventByKey('scrollByErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollByDeltaXUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBY_ERROR_003
     * @tc.desc   WebviewController scrollBy deltaX undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.levell  LEVEL2
     */
    it('testScrollByDeltaXUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollByDeltaXUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollByDeltaXUndefined", "401", 179562, done);
      sendEventByKey('scrollByErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollByDeltaYNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBY_ERROR_004
     * @tc.desc   WebviewController scrollBy deltaY null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByDeltaYNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollByDeltaYNull", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollByDeltaYNull", "401", 179563, done);
      sendEventByKey('scrollByErrorButton', 10, '');
    })



    /**
     * @tc.name   testScrollByDurationNull
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBY_ERROR_005
     * @tc.desc   WebviewController scrollBy duration null test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByDurationNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollByDurationNull", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollByDurationNull", "401", 179565, done);
      sendEventByKey('scrollByErrorButton', 10, '');
    })

    /**
     * @tc.name   testScrollByDurationUndefined
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_SCROLLBY_ERROR_006
     * @tc.desc   WebviewController scrollBy duration undefined test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScrollByDurationUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testScrollByDurationUndefined", EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent("testScrollByDurationUndefined", "401", 179566, done);
      sendEventByKey('scrollByErrorButton', 10, '');
    })
  })
}
