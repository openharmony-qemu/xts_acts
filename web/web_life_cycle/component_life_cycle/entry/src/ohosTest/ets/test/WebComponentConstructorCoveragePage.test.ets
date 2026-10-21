/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { beforeAll, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { Driver, ON } from '@ohos.UiTest';

const EVENT_ID_SET_EMIT_KEY = 138200;
const driver = Driver.create();

export default function webComponentConstructorCoveragePage() {
  describe('webComponentConstructorCoveragePage', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebComponentConstructorCoverage',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('WebComponentConstructorCoverage' == pages.name)) {
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error('push WebComponentConstructorCoverage page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebComponentConstructorCoverageButton'), 10000);
      done();
    });

    /**
     * @tc.name   testPermissionRequestClassCallDirect001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CLASS_CALL_0100
     * @tc.desc   test PermissionRequest class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionRequestClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testPermissionRequestClassCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testPermissionRequestClassCallDirect001', true, 138210, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testPermissionRequestClassCallDirect001');
      })

    /**
     * @tc.name   testPermissionRequestConstructorCallDirect001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_CALL_0100
     * @tc.desc   test PermissionRequest constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionRequestConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testPermissionRequestConstructorCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testPermissionRequestConstructorCallDirect001', true, 138211, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testPermissionRequestConstructorCallDirect001');
      })

    /**
     * @tc.name   testPermissionRequestConstructorReturnDirect001
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test PermissionRequest constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPermissionRequestConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testPermissionRequestConstructorReturnDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testPermissionRequestConstructorReturnDirect001', true, 138212, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testPermissionRequestConstructorReturnDirect001');
      })

    /**
     * @tc.name   testScreenCaptureHandlerClassCallDirect001
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CLASS_CALL_0100
     * @tc.desc   test ScreenCaptureHandler class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScreenCaptureHandlerClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testScreenCaptureHandlerClassCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testScreenCaptureHandlerClassCallDirect001', true, 138220, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testScreenCaptureHandlerClassCallDirect001');
      })

    /**
     * @tc.name   testScreenCaptureHandlerConstructorCallDirect001
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_CALL_0100
     * @tc.desc   test ScreenCaptureHandler constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScreenCaptureHandlerConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testScreenCaptureHandlerConstructorCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testScreenCaptureHandlerConstructorCallDirect001', true, 138221, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testScreenCaptureHandlerConstructorCallDirect001');
      })

    /**
     * @tc.name   testScreenCaptureHandlerConstructorReturnDirect001
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test ScreenCaptureHandler constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testScreenCaptureHandlerConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testScreenCaptureHandlerConstructorReturnDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testScreenCaptureHandlerConstructorReturnDirect001', true, 138222, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testScreenCaptureHandlerConstructorReturnDirect001');
      })

    /**
     * @tc.name   testJsGeolocationClassCallDirect001
     * @tc.number SUB_WEB_JSGEOLOCATION_CLASS_CALL_0100
     * @tc.desc   test JsGeolocation class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsGeolocationClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testJsGeolocationClassCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testJsGeolocationClassCallDirect001', true, 138230, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testJsGeolocationClassCallDirect001');
      })

    /**
     * @tc.name   testJsGeolocationConstructorCallDirect001
     * @tc.number SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_CALL_0100
     * @tc.desc   test JsGeolocation constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsGeolocationConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testJsGeolocationConstructorCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testJsGeolocationConstructorCallDirect001', true, 138231, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testJsGeolocationConstructorCallDirect001');
      })

    /**
     * @tc.name   testJsGeolocationConstructorReturnDirect001
     * @tc.number SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test JsGeolocation constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testJsGeolocationConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testJsGeolocationConstructorReturnDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testJsGeolocationConstructorReturnDirect001', true, 138232, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testJsGeolocationConstructorReturnDirect001');
      })

    /**
     * @tc.name   testEventResultClassCallDirect001
     * @tc.number SUB_WEB_EVENTRESULT_CLASS_CALL_0100
     * @tc.desc   test EventResult class call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventResultClassCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testEventResultClassCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEventResultClassCallDirect001', true, 138240, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testEventResultClassCallDirect001');
      })

    /**
     * @tc.name   testEventResultConstructorCallDirect001
     * @tc.number SUB_WEB_EVENTRESULT_CONSTRUCTOR_CALL_0100
     * @tc.desc   test EventResult constructor call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventResultConstructorCallDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testEventResultConstructorCallDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEventResultConstructorCallDirect001', true, 138241, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testEventResultConstructorCallDirect001');
      })

    /**
     * @tc.name   testEventResultConstructorReturnDirect001
     * @tc.number SUB_WEB_EVENTRESULT_CONSTRUCTOR_RETURN_DIRECT_0100
     * @tc.desc   test EventResult constructor return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEventResultConstructorReturnDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        Utils.emitEvent('testEventResultConstructorReturnDirect001', EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEventResultConstructorReturnDirect001', true, 138242, done);
        await Utils.waitAndClickComponent(driver, 'WebComponentConstructorCoverageButton',
          'testEventResultConstructorReturnDirect001');
      })
  })
}
