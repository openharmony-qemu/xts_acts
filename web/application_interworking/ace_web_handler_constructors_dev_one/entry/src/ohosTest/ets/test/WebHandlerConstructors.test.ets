/*
 * Copyright (c) 2026 KaiHong Co., Ltd.
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

import { beforeAll, describe, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import Utils from './Utils.test';
import events_emitter from '@ohos.events.emitter';

const driver = Driver.create();
const EVENT_KEY = 208100;

export default function WebHandlerConstructorsTest() {
  describe('WebHandlerConstructors', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/WebHandlerConstructors' });
      await driver.waitForComponent(ON.id('WebHandlerConstructors'), 10000);
      done();
    });
    /**
     * @tc.name   SUB_WEB_JSRESULT_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_JSRESULT_CONSTRUCTOR_0100
     * @tc.desc   test jsresult constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_JSRESULT_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runJsResult', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('JsResult', true, 208111, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'JsResult', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_0100
     * @tc.desc   test permissionrequest constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_PERMISSIONREQUEST_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runPermissionRequest', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('PermissionRequest', true, 208112, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'PermissionRequest', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_HTTPAUTHHANDLER_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_HTTPAUTHHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test httpauthhandler constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_HTTPAUTHHANDLER_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runHttpAuthHandler', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('HttpAuthHandler', true, 208113, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'HttpAuthHandler', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_SSLERRORHANDLER_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_SSLERRORHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test sslerrorhandler constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_SSLERRORHANDLER_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runSslErrorHandler', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('SslErrorHandler', true, 208114, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'SslErrorHandler', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_CLIENTAUTHENTICATIONHANDLER_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_CLIENTAUTHENTICATIONHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test clientauthenticationhandler constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_CLIENTAUTHENTICATIONHANDLER_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runClientAuthHandler', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('ClientAuthenticationHandler', true, 208115, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'ClientAuthenticationHandler', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_DATARESUBMISSIONHANDLER_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_DATARESUBMISSIONHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test dataresubmissionhandler constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_DATARESUBMISSIONHANDLER_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runDataResubmitHandler', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('DataResubmissionHandler', true, 208116, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'DataResubmissionHandler', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_0100
     * @tc.desc   test screencapturehandler constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_SCREENCAPTUREHANDLER_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runScreenCaptureHandler', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('ScreenCaptureHandler', true, 208117, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'ScreenCaptureHandler', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBCONTEXTMENUPARAM_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_WEBCONTEXTMENUPARAM_CONSTRUCTOR_0100
     * @tc.desc   test webcontextmenuparam constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBCONTEXTMENUPARAM_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runWebContextMenuParam', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('WebContextMenuParam', true, 208118, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'WebContextMenuParam', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_EVENTRESULT_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_EVENTRESULT_CONSTRUCTOR_0100
     * @tc.desc   test eventresult constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_EVENTRESULT_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runEventResult', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('EventResult', true, 208119, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'EventResult', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_0100
     * @tc.desc   test jsgeolocation constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_JSGEOLOCATION_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runJsGeolocation', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('JsGeolocation', true, 208120, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'JsGeolocation', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBRESOURCEERROR_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_WEBRESOURCEERROR_CONSTRUCTOR_0100
     * @tc.desc   test webresourceerror constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBRESOURCEERROR_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runWebResourceError', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('WebResourceError', true, 208121, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'WebResourceError', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBRESOURCEREQUEST_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_WEBRESOURCEREQUEST_CONSTRUCTOR_0100
     * @tc.desc   test webresourcerequest constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBRESOURCEREQUEST_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runWebResourceRequest', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('WebResourceRequest', true, 208122, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'WebResourceRequest', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBRESOURCERESPONSE_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_WEBRESOURCERESPONSE_CONSTRUCTOR_0100
     * @tc.desc   test webresourceresponse constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBRESOURCERESPONSE_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runWebResourceResponse', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('WebResourceResponse', true, 208123, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'WebResourceResponse', 1, 8000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_WEBINTERFACE_CONSTRUCTOR_0100
     * @tc.number SUB_WEB_WEBINTERFACE_CONSTRUCTOR_0100
     * @tc.desc   test webinterface constructor (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_WEBINTERFACE_CONSTRUCTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('runWebInterface', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('WebInterface', true, 208124, () => { ok = 1; },
          (d: events_emitter.EventData, e: Object) => { expect(d?.data?.ACTION).assertEqual(e); });
        await Utils.waitAndClickComponent(driver, 'WebHandlerConstructors');
        if (await Utils.waitForExist(() => ok, 'WebInterface', 1, 8000)) { done(); }
      });
  });
}
