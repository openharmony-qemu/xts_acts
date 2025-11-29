/*
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

import { beforeAll, beforeEach,afterEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();
export default function WebCacheModeSpecial() {

  describe('WebCacheModeSpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebCacheModeSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebCacheModeSpecial state success " + JSON.stringify(pages));
        if (!("WebCacheModeSpecial" == pages.name)) {
          console.info("get WebCacheModeSpecial state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebCacheModeSpecial page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebCacheModeSpecial page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebCacheModeSpecialButton"),10000);
      console.log("waitForComponent WebCacheModeSpecialButton click==>")
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebCacheModeSpecial beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebCacheModeSpecial afterEach start");
      done();
    })

    /**
    * @tc.number SUB_ACE_WEB_CACHEMODE_NULL_API_0100
    * @tc.name testWebCacheModeSetNull
    * @tc.desc test cacheMode set null
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 2
    */
    it('testWebCacheModeSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebCacheModeSetNull', 154);
      Utils.registerBaseEvent('testWebCacheModeSetNull', true, 25112613, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebCacheModeSpecialButton', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_CACHEMODE_UNDEFINED_API_0100
     * @tc.name testWebCacheModeSetUndefined
     * @tc.desc test cacheMode set undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebCacheModeSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebCacheModeSetUndefined', 154);
      Utils.registerBaseEvent('testWebCacheModeSetUndefined', true, 25112614, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebCacheModeSpecialButton', 10, '');
    })

  })
}
