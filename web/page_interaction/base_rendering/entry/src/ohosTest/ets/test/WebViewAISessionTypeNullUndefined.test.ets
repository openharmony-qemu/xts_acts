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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';
import { waitForExist} from './WaitTest.test';
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 183129;
const driver = Driver.create();

export default function WebViewAISessionTypeNullUndefinedSuite() {

  describe('WebViewAISessionTypeNullUndefinedTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewAISessionTypeNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebViewAISessionType state success " + JSON.stringify(pages));
        if (!("WebViewAISessionType" == pages.name)) {
          console.info("get WebViewAISessionType state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info("push WebViewAISessionType page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebViewAISessionType page error: " + err);
      }
      try {
        await driver.waitForComponent(ON.id("WebViewAISessionTypeNullUndefinedButton"), 10000)
      } catch (err) {
        console.error("wait WebViewAISessionTypeNullUndefinedButton error: " + JSON.stringify(err));
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("webViewController beforeEach start");
      done();
    })


    /**
     * @tc.number     SUB_WEB_AI_SESSION_OPTIONS_0100
     * @tc.name       testWebViewAiSessionOptions01
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewAiSessionOptions01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewAiSessionOptions01", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewAiSessionOptions01",true, 20260520, (err: Error) => {
        if (err) {
          console.error('isReturn registerEvent error: ' + JSON.stringify(err));
        } else {
          isReturn = true;
        }
      });
      Utils.waitAndClickComponent(driver, "WebViewAISessionTypeNullUndefinedButton","testWebViewAiSessionOptions01");
      try {
        await Utils.waitForExist((err?: Error) => {
          if (err) {
            console.error('isReturn waitForExist callback error: ' + JSON.stringify(err));
          }
          return isReturn;
        }, "testWebViewAiSessionOptions01" + '_returnCheck', true, 1000);
      } catch (err) {
        console.error('Utils.waitForExist async call error: ' + JSON.stringify(err));
      }
      done();
    })


    /**
     * @tc.number     SUB_WEB_AI_SESSION_OPTIONS_0200
     * @tc.name       testWebViewAiSessionOptions02
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewAiSessionOptions02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewAiSessionOptions02", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewAiSessionOptions02",true, 20260521, (err: Error) => {
        if (err) {
          console.error('isReturn registerEvent error: ' + JSON.stringify(err));
        } else {
          isReturn = true;
        }
      });
      Utils.waitAndClickComponent(driver, "WebViewAISessionTypeNullUndefinedButton","testWebViewAiSessionOptions02");
      try {
        await Utils.waitForExist((err?: Error) => {
          if (err) {
            console.error('isReturn waitForExist callback error: ' + JSON.stringify(err));
          }
          return isReturn;
        }, "testWebViewAiSessionOptions02" + '_returnCheck', true, 1000);
      } catch (err) {
        console.error('Utils.waitForExist async call error: ' + JSON.stringify(err));
      }
      done();
    })


    /**
     * @tc.number     SUB_WEB_AI_SESSION_OPTIONS_0300
     * @tc.name       testWebViewAiSessionOptions03
     * @tc.desc       aiSessionOptions
     * @tc.size       MediumTest
     * @tc.type       Function
     * @tc.level      Level 1
     */
    it('testWebViewAiSessionOptions03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitWebViewAiSessionOptions03", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testWebViewAiSessionOptions03",true, 20260522, (err: Error) => {
        if (err) {
          console.error('isReturn registerEvent error: ' + JSON.stringify(err));
        } else {
          isReturn = true;
        }
      });
      Utils.waitAndClickComponent(driver, "WebViewAISessionTypeNullUndefinedButton","testWebViewAiSessionOptions03");
      try {
        await Utils.waitForExist((err?: Error) => {
          if (err) {
            console.error('isReturn waitForExist callback error: ' + JSON.stringify(err));
          }
          return isReturn;
        }, "testWebViewAiSessionOptions03" + '_returnCheck', true, 1000);
      } catch (err) {
        console.error('Utils.waitForExist async call error: ' + JSON.stringify(err));
      }
      done();
    })
  })
}
