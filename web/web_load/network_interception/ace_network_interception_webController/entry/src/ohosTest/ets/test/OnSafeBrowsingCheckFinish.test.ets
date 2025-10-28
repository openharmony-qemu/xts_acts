/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, expect, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';
const driver = Driver.create();


export default function onSafeBrowsingCheckFinishTest() {

  describe('onSafeBrowsingCheckFinishTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/onSafeBrowsingCheckFinish',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get onSafeBrowsingCheckFinish state success ' + JSON.stringify(pages));
        if (!("onSafeBrowsingCheckFinish" == pages.name)) {
          console.info('get onSafeBrowsingCheckFinish state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push onSafeBrowsingCheckFinish page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push onSafeBrowsingCheckFinish page error: ' + err);
      }
      await driver.waitForComponent(ON.id('onSafeBrowsingCheckFinishButton'),10000);
      console.log('onSafeBrowsingCheckFinishButton click==>');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('onSafeBrowsingCheckFinish beforeEach start');
      done();
    })


    /**
    * @tc.number SUB_WEB_ONSAFEBROWSINGCHECKFINISH_API_0100
    * @tc.name   testOnSafeBrowsingCheckFinish01
    * @tc.desc   test onSafeBrowsingCheckFinish threatType 5
    * @tc.size   MediumTest
    * @tc.type   Function
    * @tc.level  Level 0
    */
    it('testOnSafeBrowsingCheckFinish01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      Utils.emitEvent('emitOnSafeBrowsingCheckFinish01', 125)
      Utils.registerBaseEvent('testOnSafeBrowsingCheckFinish01', 5, 2025102812,
        done, (backData: events_emitter.EventData, expected: Object) => {
          expect(backData?.data?.ACTION).assertEqual(expected);
        });
      sendEventByKey('onSafeBrowsingCheckFinishButton', 10, '');
    })



  })
}
