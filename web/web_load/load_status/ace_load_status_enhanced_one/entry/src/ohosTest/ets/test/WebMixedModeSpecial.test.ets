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
export default function WebMixedModeSpecial() {

  describe('WebMixedModeSpecial', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebMixedModeSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebMixedModeSpecial state success " + JSON.stringify(pages));
        if (!("WebMixedModeSpecial" == pages.name)) {
          console.info("get WebMixedModeSpecial state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebMixedModeSpecial page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebMixedModeSpecial page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebMixedModeSpecialButton"),10000);
      console.log("waitForComponent WebMixedModeSpecialButton click==>")
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("WebMixedModeSpecial beforeEach start");
      done();
    })

    afterEach(async (done: Function) => {
      console.info("WebMixedModeSpecial afterEach start");
      done();
    })

    /**
    * @tc.number SUB_ACE_WEB_MIXEDMODE_NULL_API_0100
    * @tc.name testWebMixedModeSetNull
    * @tc.desc test mixedMode set null
    * @tc.size MediumTest
    * @tc.type Function
    * @tc.level Level 2
    */
    it('testWebMixedModeSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebMixedModeSetNull', 153);
      Utils.registerBaseEvent('testWebMixedModeSetNull', 3, 25112611, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebMixedModeSpecialButton', 10, '');
    })
    /**
     * @tc.number SUB_ACE_WEB_MIXEDMODE_UNDEFINED_API_0100
     * @tc.name testWebMixedModeSetUndefined
     * @tc.desc test mixedMode set undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testWebMixedModeSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebMixedModeSetUndefined', 153);
      Utils.registerBaseEvent('testWebMixedModeSetUndefined', 3, 25112612, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebMixedModeSpecialButton', 10, '');
    })

  })
}
