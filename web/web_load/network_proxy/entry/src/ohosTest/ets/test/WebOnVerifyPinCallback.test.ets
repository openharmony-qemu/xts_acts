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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import events_emitter from '@ohos.events.emitter';
import { config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 200215;
const driver = Driver.create();
const CAPACITY = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

export default function webOnVerifyPinCallback() {

  describe('WebOnVerifyPinCallbackTestSuite', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webOnVerifyPinCallback',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webOnVerifyPinCallback state success ' + JSON.stringify(pages));
        if (!('webOnVerifyPinCallback' == pages.name)) {
          console.info('get webOnVerifyPinCallback state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          console.info('push webOnVerifyPinCallback page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webOnVerifyPinCallback page error: ' + err);
      }
      await driver.waitForComponent(ON.id('onVerifyPinButton'), 10000);
      console.log('waitForComponent onVerifyPinButton');
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info('webOnVerifyPinCallback beforeEach start');
      done();
    })

    /**
     * @tc.name   testVerifyPinHandlerConstructor001
     * @tc.number SUB_WEB_VERIFYPINHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test VerifyPinHandler class and constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVerifyPinHandlerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testVerifyPinHandlerConstructor001', EVENT_ID_SET_EMIT_KEY);
        let isReturn220 = 0;
        let isReturn230 = 0;
        Utils.registerEvent('testVerifyPinHandlerConstructor001', true, 200220, () => { isReturn220 = 1 });
        Utils.registerEvent('testVerifyPinHandlerConstructor001', true, 200230, () => { isReturn230 = 1 });
        await Utils.waitAndClickComponent(driver, 'onVerifyPinButton');
        if (await Utils.waitForExist(() => isReturn220 && isReturn230,
          'testVerifyPinHandlerConstructor001_returnCheck', 1, 1000)) {
          done();
        }
      })

    /**
     * @tc.name   testVerifyPinHandlerConstructorReturn001
     * @tc.number SUB_WEB_VERIFYPINHANDLER_CONSTRUCTOR_RETURN_0100
     * @tc.desc   test VerifyPinHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVerifyPinHandlerConstructorReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testVerifyPinHandlerConstructorReturn001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testVerifyPinHandlerConstructorReturn001', true, 200230, done);
        await Utils.waitAndClickComponent(driver, 'onVerifyPinButton');
      })

    /**
     * @tc.name   testOnVerifyPinCallbackInterfaceCall001
     * @tc.number SUB_WEB_ONVERIFYPIN_CALLBACK_0100
     * @tc.desc   test OnVerifyPinCallback type alias interface call
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnVerifyPinCallbackInterfaceCall001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testOnVerifyPinCallbackInterfaceCall001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testOnVerifyPinCallbackInterfaceCall001', true, 200240, done);
        await Utils.waitAndClickComponent(driver, 'onVerifyPinButton');
      })

    /**
     * @tc.name   testVerifyPinHandlerClass001
     * @tc.number SUB_WEB_VERIFYPINHANDLER_CLASS_0100
     * @tc.desc   test VerifyPinHandler class export is available
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testVerifyPinHandlerClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('testVerifyPinHandlerClass001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testVerifyPinHandlerClass001', true, 200250, done);
        await Utils.waitAndClickComponent(driver, 'onVerifyPinButton');
      })
  })
}
