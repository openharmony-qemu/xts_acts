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
const EVENT_KEY = 204100;

export default function BlankScreenReasonTest() {
  describe('BlankScreenReason', () => {
    beforeAll(async (done: Function) => {
      await router.pushUrl({ url: 'testability/pages/BlankScreenReason' });
      await driver.waitForComponent(ON.id('BlankScreenReasonBtn'), 10000);
      done();
    });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_DNS_RESOLVE_FAILED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_DNS_RESOLVE_FAILED_0100
     * @tc.desc   test blankscreenreason dns resolve failed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_DNS_RESOLVE_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:DNS_RESOLVE_FAILED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('DNS_RESOLVE_FAILED', 101, 204301, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'DNS_RESOLVE_FAILED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_REQUEST_TIMED_OUT_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_REQUEST_TIMED_OUT_0100
     * @tc.desc   test blankscreenreason request timed out (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_REQUEST_TIMED_OUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:REQUEST_TIMED_OUT', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('REQUEST_TIMED_OUT', 102, 204302, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'REQUEST_TIMED_OUT', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_CONNECTION_REFUSED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_CONNECTION_REFUSED_0100
     * @tc.desc   test blankscreenreason connection refused (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_CONNECTION_REFUSED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:CONNECTION_REFUSED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('CONNECTION_REFUSED', 103, 204303, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'CONNECTION_REFUSED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_CONNECTION_RESET_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_CONNECTION_RESET_0100
     * @tc.desc   test blankscreenreason connection reset (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_CONNECTION_RESET_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:CONNECTION_RESET', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('CONNECTION_RESET', 104, 204304, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'CONNECTION_RESET', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_SSL_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_SSL_ERROR_0100
     * @tc.desc   test blankscreenreason ssl error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_SSL_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:SSL_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('SSL_ERROR', 105, 204305, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'SSL_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_CERT_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_CERT_ERROR_0100
     * @tc.desc   test blankscreenreason cert error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_CERT_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:CERT_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('CERT_ERROR', 106, 204306, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'CERT_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_INTERNET_DISCONNECTED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_INTERNET_DISCONNECTED_0100
     * @tc.desc   test blankscreenreason internet disconnected (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_INTERNET_DISCONNECTED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:INTERNET_DISCONNECTED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('INTERNET_DISCONNECTED', 107, 204307, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'INTERNET_DISCONNECTED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_REDIRECT_LOOP_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_REDIRECT_LOOP_0100
     * @tc.desc   test blankscreenreason redirect loop (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_REDIRECT_LOOP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:REDIRECT_LOOP', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('REDIRECT_LOOP', 108, 204308, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'REDIRECT_LOOP', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_PROXY_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_PROXY_ERROR_0100
     * @tc.desc   test blankscreenreason proxy error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_PROXY_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:PROXY_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('PROXY_ERROR', 109, 204309, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'PROXY_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_OTHER_NETWORK_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_OTHER_NETWORK_ERROR_0100
     * @tc.desc   test blankscreenreason other network error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_OTHER_NETWORK_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:OTHER_NETWORK_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('OTHER_NETWORK_ERROR', 199, 204399, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'OTHER_NETWORK_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_MAIN_DOC_EMPTY_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_MAIN_DOC_EMPTY_0100
     * @tc.desc   test blankscreenreason main doc empty (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_MAIN_DOC_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:MAIN_DOC_EMPTY', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('MAIN_DOC_EMPTY', 201, 204401, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'MAIN_DOC_EMPTY', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_HTTP_4XX_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_HTTP_4XX_ERROR_0100
     * @tc.desc   test blankscreenreason http 4xx error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_HTTP_4XX_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:HTTP_4XX_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('HTTP_4XX_ERROR', 202, 204402, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'HTTP_4XX_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_HTTP_5XX_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_HTTP_5XX_ERROR_0100
     * @tc.desc   test blankscreenreason http 5xx error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_HTTP_5XX_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:HTTP_5XX_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('HTTP_5XX_ERROR', 203, 204403, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'HTTP_5XX_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_JS_GLOBAL_BUNDLE_LOAD_FAILED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_JS_GLOBAL_BUNDLE_LOAD_FAILED_0100
     * @tc.desc   test blankscreenreason js global bundle load failed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_JS_GLOBAL_BUNDLE_LOAD_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:JS_GLOBAL_BUNDLE_LOAD_FAILED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('JS_GLOBAL_BUNDLE_LOAD_FAILED', 210, 204410, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'JS_GLOBAL_BUNDLE_LOAD_FAILED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_CSS_LOAD_FAILED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_CSS_LOAD_FAILED_0100
     * @tc.desc   test blankscreenreason css load failed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_CSS_LOAD_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:CSS_LOAD_FAILED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('CSS_LOAD_FAILED', 211, 204411, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'CSS_LOAD_FAILED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_MULTI_RESOURCE_LOAD_FAILED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_MULTI_RESOURCE_LOAD_FAILED_0100
     * @tc.desc   test blankscreenreason multi resource load failed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_MULTI_RESOURCE_LOAD_FAILED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:MULTI_RESOURCE_LOAD_FAILED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('MULTI_RESOURCE_LOAD_FAILED', 212, 204412, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'MULTI_RESOURCE_LOAD_FAILED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_CORS_BLOCKED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_CORS_BLOCKED_0100
     * @tc.desc   test blankscreenreason cors blocked (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_CORS_BLOCKED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:CORS_BLOCKED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('CORS_BLOCKED', 213, 204413, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'CORS_BLOCKED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_CSP_BLOCKED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_CSP_BLOCKED_0100
     * @tc.desc   test blankscreenreason csp blocked (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_CSP_BLOCKED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:CSP_BLOCKED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('CSP_BLOCKED', 214, 204414, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'CSP_BLOCKED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_MIXED_CONTENT_BLOCKED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_MIXED_CONTENT_BLOCKED_0100
     * @tc.desc   test blankscreenreason mixed content blocked (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_MIXED_CONTENT_BLOCKED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:MIXED_CONTENT_BLOCKED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('MIXED_CONTENT_BLOCKED', 215, 204415, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'MIXED_CONTENT_BLOCKED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_JS_RUNTIME_ERROR_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_JS_RUNTIME_ERROR_0100
     * @tc.desc   test blankscreenreason js runtime error (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_JS_RUNTIME_ERROR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:JS_RUNTIME_ERROR', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('JS_RUNTIME_ERROR', 301, 204501, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'JS_RUNTIME_ERROR', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_NO_FIRST_CONTENTFUL_PAINT_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_NO_FIRST_CONTENTFUL_PAINT_0100
     * @tc.desc   test blankscreenreason no first contentful paint (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_NO_FIRST_CONTENTFUL_PAINT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:NO_FIRST_CONTENTFUL_PAINT', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('NO_FIRST_CONTENTFUL_PAINT', 312, 204512, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'NO_FIRST_CONTENTFUL_PAINT', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_RENDERER_CRASHED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_RENDERER_CRASHED_0100
     * @tc.desc   test blankscreenreason renderer crashed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_RENDERER_CRASHED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:RENDERER_CRASHED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('RENDERER_CRASHED', 401, 204601, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'RENDERER_CRASHED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_RENDERER_KILLED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_RENDERER_KILLED_0100
     * @tc.desc   test blankscreenreason renderer killed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_RENDERER_KILLED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:RENDERER_KILLED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('RENDERER_KILLED', 402, 204602, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'RENDERER_KILLED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_CRASHED_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_CRASHED_0100
     * @tc.desc   test blankscreenreason gpu process crashed (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_CRASHED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:GPU_PROCESS_CRASHED', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('GPU_PROCESS_CRASHED', 403, 204603, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'GPU_PROCESS_CRASHED', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_WATCHDOG_TIMEOUT_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_WATCHDOG_TIMEOUT_0100
     * @tc.desc   test blankscreenreason gpu process watchdog timeout (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_WATCHDOG_TIMEOUT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:GPU_PROCESS_WATCHDOG_TIMEOUT', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('GPU_PROCESS_WATCHDOG_TIMEOUT', 404, 204604, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'GPU_PROCESS_WATCHDOG_TIMEOUT', 1, 5000)) { done(); }
      });
    /**
     * @tc.name   SUB_WEB_BLANKSCREENREASON_WEB_VIEW_ZERO_SIZE_0100
     * @tc.number SUB_WEB_BLANKSCREENREASON_WEB_VIEW_ZERO_SIZE_0100
     * @tc.desc   test blankscreenreason web view zero size (dynamic HAP)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_WEB_BLANKSCREENREASON_WEB_VIEW_ZERO_SIZE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        Utils.emitEvent('enum:WEB_VIEW_ZERO_SIZE', EVENT_KEY);
        let ok = 0;
        Utils.registerBaseEvent('WEB_VIEW_ZERO_SIZE', 501, 204701, () => { ok = 1; },
          (backData: events_emitter.EventData, expected: Object) => {
            expect(backData?.data?.ACTION).assertEqual(expected);
          });
        await Utils.waitAndClickComponent(driver, 'BlankScreenReasonBtn');
        if (await Utils.waitForExist(() => ok, 'WEB_VIEW_ZERO_SIZE', 1, 5000)) { done(); }
      });
  });
}
