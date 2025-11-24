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

import { beforeAll, beforeEach,afterEach, describe, it , TestType, Size, Level, expect } from '@ohos/hypium';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { waitForComponent } from './WaitTest';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function ActsWebRunJavaScriptOnDocumentEndSetNullTest() {

  describe('RunJavaScriptOnDocumentEndSetNullTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebRunJavaScriptOnDocumentEndSetNull',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get WebRunJavaScriptOnDocumentEndSetNull state success ' + JSON.stringify(pages));
        if (!("WebRunJavaScriptOnDocumentEndSetNull" == pages.name)) {
          console.info('get WebRunJavaScriptOnDocumentEndSetNull state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push WebRunJavaScriptOnDocumentEndSetNull page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push WebRunJavaScriptOnDocumentEndSetNull page error: ' + err);
      }
      await waitForComponent("RunJavaScriptOnDocumentEndSetNull");
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('WebRunJavaScriptOnDocumentEndSetNull beforeEach start');
      done();
    })


    /*
    * @tc.number     : SUB_ACE_WEB_RUNJAVASCRIPTONDOCUMENTEND_SetNull
    * @tc.name       : testRunJavaScriptOnDocumentEndSetNull
    * @tc.desc       : test runJavaScriptOnDocumentEnd set null
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 2
    */
    it('testRunJavaScriptOnDocumentEndSetNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent("testRunJavaScriptOnDocumentEndSetNull", 2511226)
      Utils.registerBaseEvent('testRunJavaScriptOnDocumentEndSetNull', '"test msg"', 25112410, done, (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.ACTION).assertEqual(expected);
      });
      sendEventByKey('RunJavaScriptOnDocumentEndSetNull', 10, '');
    })
  })
}
