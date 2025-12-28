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
import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON } from '@kit.TestKit';
import events_emitter from '@ohos.events.emitter';
import { expect } from '@ohos/hypium';
import { accessibility, config } from '@kit.AccessibilityKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
let driver = Driver.create();

export default function WebUrlRegexRulesSetNull() {

  describe('ActsWebUrlRegexRulesSetNullTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebUrlRegexRulesSetNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebUrlRegexRulesSetNull state success ' + JSON.stringify(pages));
        if (!("WebUrlRegexRulesSetNull" == pages.name)) {
          console.info('get WebUrlRegexRulesSetNull state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebUrlRegexRulesSetNull page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebUrlRegexRulesSetNull page error: ' + err);
      }
      await driver.waitForComponent(ON.id("UrlRegexRulesSetNull"),10000);
      console.log('waitForComponent UrlRegexRulesSetNull==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
         console.info(`enable success`);
       }).catch((err: object) => {
         console.error(`failed to enable, ${err}`);
       })
      console.info('WebUrlRegexRulesSetNull beforeEach start');
      done();
    })


    /**
     * @tc.name   testUrlRegexRulesSetNull
     * @tc.number SUB_WEB_URLREGEXRULES_SET_NULL
     * @tc.desc   test UrlRegexRules set null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUrlRegexRulesSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        Utils.emitEvent("testUrlRegexRulesSetNull", 251223)
        Utils.registerBaseEvent("testUrlRegexRulesSetNull", 'no match', 25122301, done,
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        sendEventByKey('UrlRegexRulesSetNull', 10, '');
    })
  })
}