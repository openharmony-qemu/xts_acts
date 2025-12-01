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

import { afterEach, beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import events_emitter from '@ohos.events.emitter';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();

export default function webOnLoadInterceptSpecial() {

  describe('WebOnLoadInterceptSpecial', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebOnLoadInterceptSpecial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebOnLoadInterceptSpecial state success " + JSON.stringify(pages));
        if (!("WebOnLoadInterceptSpecial" == pages.name)) {
          console.info("get WebOnLoadInterceptSpecial state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebOnLoadInterceptSpecial page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebOnLoadInterceptSpecial page error: " + err);
      }
      await driver.waitForComponent(ON.id("WebOnLoadInterceptSpecialButton"),10000);
      console.log("waitForComponent WebOnLoadInterceptSpecialButton click==>")
      done()
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
     * @tc.name   testWebOnLoadInterceptSetNull
     * @tc.number SUB_WEB_ONLOADINTERCEPT_NULL_0100
     * @tc.desc   test onLoadIntercept set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebOnLoadInterceptSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebOnLoadInterceptSetNull', 156);
      Utils.registerBaseEvent('testWebOnLoadInterceptSetNull', true, 25112617, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebOnLoadInterceptSpecialButton', 10, '');
    })
    /**
     * @tc.name   testWebOnLoadInterceptSetUndefined
     * @tc.number SUB_WEB_ONLOADINTERCEPT_UNDEFINED_0100
     * @tc.desc   test onLoadIntercept set undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testWebOnLoadInterceptSetUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitWebOnLoadInterceptSetUndefined', 156);
      Utils.registerBaseEvent('testWebOnLoadInterceptSetUndefined', true, 25112618, done,
        (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('WebOnLoadInterceptSpecialButton', 10, '');
    })
  })
}
