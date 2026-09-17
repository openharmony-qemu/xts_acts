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

import { afterEach, beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 177101;
let driver = Driver.create();

export default function webAttributeTest() {

  describe('WebAttributeTest', () => {

    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebAttributeTest',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebAttributeTest state success " + JSON.stringify(pages));
        if (!("WebAttributeTest" == pages.name)) {
          console.info("get WebAttributeTest state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("WebAttributeTestButton"), 10000);
          console.info("push WebAttributeTest page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebAttributeTest page error: " + err);
      }
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
     * @tc.name   testOnAlert001
     * @tc.number SUB_WEB_ONALERT_0100
     * @tc.desc   test onAlert callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnAlert001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnAlert001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnAlert001", "alert test", 177110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testOnAlert001");
	  
      await Utils.waitForExist(() => isReturn, "testOnAlert001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testOnConfirm001
     * @tc.number SUB_WEB_ONCONFIRM_0100
     * @tc.desc   test onConfirm normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnConfirm001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnConfirm001", "confirm test", 177120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testOnConfirm001");
      await Utils.waitForExist(() => isReturn, "testOnConfirm001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testOnPrompt001
     * @tc.number SUB_WEB_ONPROMPT_0100
     * @tc.desc   test onPrompt normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOnPrompt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitOnPrompt001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testOnPrompt001", "prompt test", 177130, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testOnPrompt001");
      await Utils.waitForExist(() => isReturn, "testOnPrompt001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsResultHandleCancel001
     * @tc.number SUB_WEB_JSRESULT_HANDLECANCEL_0100
     * @tc.desc   test JsResultHandle.cancel()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsResultHandleCancel001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandleCancel001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testJsResultHandleCancel001", "false", 177140, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testJsResultHandleCancel001");
      await Utils.waitForExist(() => isReturn, "testJsResultHandleCancel001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsResultHandleConfirm001
     * @tc.number SUB_WEB_JSRESULT_HANDLECONFIRM_0100
     * @tc.desc   test JsResultHandle.confirm()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsResultHandleConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandleConfirm001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testJsResultHandleConfirm001", "true", 177150, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testJsResultHandleConfirm001");
      await Utils.waitForExist(() => isReturn, "testJsResultHandleConfirm001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsResultHandlePromptConfirm001
     * @tc.number SUB_WEB_JSRESULT_HANDLEPROMPTCONFIRM_0100
     * @tc.desc   test JsResultHandle.promptConfirm()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsResultHandlePromptConfirm001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent("emitJsResultHandlePromptConfirm001", EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent("testJsResultHandlePromptConfirm001", "\"handlePromptConfirm\"", 177160, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "WebAttributeTestButton", "testJsResultHandlePromptConfirm001");
      await Utils.waitForExist(() => isReturn, "testJsResultHandlePromptConfirm001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsResultConstructor001
     * @tc.number SUB_WEB_JSRESULT_CONSTRUCTOR_0100
     * @tc.desc   test JsResult class constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsResultConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      Utils.emitEvent('emitJsResultConstructor001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testJsResultConstructor001', true, 177170, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testJsResultConstructor001');
      await Utils.waitForExist(() => isReturn, "testJsResultConstructor001" + '_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScreenCaptureHandlerConstructor001
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test ScreenCaptureHandler class constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureHandlerConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitScreenCaptureHandlerConstructor001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testScreenCaptureHandlerConstructor001', true, 177180, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testScreenCaptureHandlerConstructor001');
      await Utils.waitForExist(() => isReturn, 'testScreenCaptureHandlerConstructor001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsGeolocationConstructor001
     * @tc.number SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_0100
     * @tc.desc   test JsGeolocation class constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsGeolocationConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitJsGeolocationConstructor001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testJsGeolocationConstructor001', true, 177190, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testJsGeolocationConstructor001');
      await Utils.waitForExist(() => isReturn, 'testJsGeolocationConstructor001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsResultConstructorReturn001
     * @tc.number SUB_WEB_JSRESULT_CONSTRUCTOR_RETURN_0100
     * @tc.desc   test JsResult constructor return value instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsResultConstructorReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitJsResultConstructorReturn001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testJsResultConstructorReturn001', true, 177171, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testJsResultConstructorReturn001');
      await Utils.waitForExist(() => isReturn, 'testJsResultConstructorReturn001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsResultClass001
     * @tc.number SUB_WEB_JSRESULT_CLASS_0100
     * @tc.desc   test JsResult class export accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsResultClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitJsResultClass001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testJsResultClass001', true, 177172, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testJsResultClass001');
      await Utils.waitForExist(() => isReturn, 'testJsResultClass001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScreenCaptureHandlerConstructorReturn001
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_RETURN_0100
     * @tc.desc   test ScreenCaptureHandler constructor return value instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureHandlerConstructorReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitScreenCaptureHandlerConstructorReturn001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testScreenCaptureHandlerConstructorReturn001', true, 177181, () => {
        isReturn = true;
      });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton',
        'testScreenCaptureHandlerConstructorReturn001');
      await Utils.waitForExist(() => isReturn,
        'testScreenCaptureHandlerConstructorReturn001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testScreenCaptureHandlerClass001
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CLASS_0100
     * @tc.desc   test ScreenCaptureHandler class export accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCaptureHandlerClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitScreenCaptureHandlerClass001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testScreenCaptureHandlerClass001', true, 177182, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testScreenCaptureHandlerClass001');
      await Utils.waitForExist(() => isReturn, 'testScreenCaptureHandlerClass001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsGeolocationConstructorReturn001
     * @tc.number SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_RETURN_0100
     * @tc.desc   test JsGeolocation constructor return value instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsGeolocationConstructorReturn001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitJsGeolocationConstructorReturn001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testJsGeolocationConstructorReturn001', true, 177191, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testJsGeolocationConstructorReturn001');
      await Utils.waitForExist(() => isReturn, 'testJsGeolocationConstructorReturn001_returnCheck', true, 1000);
      done();
    })

    /**
     * @tc.name   testJsGeolocationClass001
     * @tc.number SUB_WEB_JSGEOLOCATION_CLASS_0100
     * @tc.desc   test JsGeolocation class export accessible
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testJsGeolocationClass001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
      Utils.emitEvent('emitJsGeolocationClass001', EVENT_ID_SET_SUITE_KEY);
      let isReturn = false;
      Utils.registerEvent('testJsGeolocationClass001', true, 177192, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, 'WebAttributeTestButton', 'testJsGeolocationClass001');
      await Utils.waitForExist(() => isReturn, 'testJsGeolocationClass001_returnCheck', true, 1000);
      done();
    })

  })
}
