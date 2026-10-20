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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function monitoredBlankScreenCoverageDirect() {
  describe('monitoredBlankScreenCoverageDirect', () => {
    /**
     * @tc.name   testBlankScreenReasonDnsResolveFailedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0100
     * @tc.desc   test BlankScreenReason.DNS_RESOLVE_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonDnsResolveFailedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.DNS_RESOLVE_FAILED).assertEqual(101);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonRequestTimedOutDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0200
     * @tc.desc   test BlankScreenReason.REQUEST_TIMED_OUT call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRequestTimedOutDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.REQUEST_TIMED_OUT).assertEqual(102);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonConnectionRefusedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0300
     * @tc.desc   test BlankScreenReason.CONNECTION_REFUSED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonConnectionRefusedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.CONNECTION_REFUSED).assertEqual(103);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonConnectionResetDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0400
     * @tc.desc   test BlankScreenReason.CONNECTION_RESET call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonConnectionResetDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.CONNECTION_RESET).assertEqual(104);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonSslErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0500
     * @tc.desc   test BlankScreenReason.SSL_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonSslErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.SSL_ERROR).assertEqual(105);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonCertErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0600
     * @tc.desc   test BlankScreenReason.CERT_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCertErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.CERT_ERROR).assertEqual(106);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonInternetDisconnectedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0700
     * @tc.desc   test BlankScreenReason.INTERNET_DISCONNECTED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonInternetDisconnectedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.INTERNET_DISCONNECTED).assertEqual(107);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonRedirectLoopDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0800
     * @tc.desc   test BlankScreenReason.REDIRECT_LOOP call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRedirectLoopDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.REDIRECT_LOOP).assertEqual(108);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonProxyErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0900
     * @tc.desc   test BlankScreenReason.PROXY_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonProxyErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.PROXY_ERROR).assertEqual(109);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonOtherNetworkErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1000
     * @tc.desc   test BlankScreenReason.OTHER_NETWORK_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonOtherNetworkErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.OTHER_NETWORK_ERROR).assertEqual(199);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonMainDocEmptyDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1100
     * @tc.desc   test BlankScreenReason.MAIN_DOC_EMPTY call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonMainDocEmptyDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.MAIN_DOC_EMPTY).assertEqual(201);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonHttp4xxErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1200
     * @tc.desc   test BlankScreenReason.HTTP_4XX_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonHttp4xxErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.HTTP_4XX_ERROR).assertEqual(202);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonHttp5xxErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1300
     * @tc.desc   test BlankScreenReason.HTTP_5XX_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonHttp5xxErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.HTTP_5XX_ERROR).assertEqual(203);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonJsGlobalBundleLoadFailedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1400
     * @tc.desc   test BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonJsGlobalBundleLoadFailedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED).assertEqual(210);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonCssLoadFailedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1500
     * @tc.desc   test BlankScreenReason.CSS_LOAD_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCssLoadFailedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.CSS_LOAD_FAILED).assertEqual(211);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonMultiResourceLoadFailedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1600
     * @tc.desc   test BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonMultiResourceLoadFailedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED).assertEqual(212);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonCorsBlockedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1700
     * @tc.desc   test BlankScreenReason.CORS_BLOCKED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCorsBlockedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.CORS_BLOCKED).assertEqual(213);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonCspBlockedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1800
     * @tc.desc   test BlankScreenReason.CSP_BLOCKED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCspBlockedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.CSP_BLOCKED).assertEqual(214);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonMixedContentBlockedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1900
     * @tc.desc   test BlankScreenReason.MIXED_CONTENT_BLOCKED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonMixedContentBlockedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.MIXED_CONTENT_BLOCKED).assertEqual(215);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonJsRuntimeErrorDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2000
     * @tc.desc   test BlankScreenReason.JS_RUNTIME_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonJsRuntimeErrorDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.JS_RUNTIME_ERROR).assertEqual(301);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonNoFirstContentfulPaintDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2100
     * @tc.desc   test BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonNoFirstContentfulPaintDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT).assertEqual(312);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonRendererCrashedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2200
     * @tc.desc   test BlankScreenReason.RENDERER_CRASHED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRendererCrashedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.RENDERER_CRASHED).assertEqual(401);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonRendererKilledDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2300
     * @tc.desc   test BlankScreenReason.RENDERER_KILLED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRendererKilledDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.RENDERER_KILLED).assertEqual(402);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonGpuProcessCrashedDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2400
     * @tc.desc   test BlankScreenReason.GPU_PROCESS_CRASHED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonGpuProcessCrashedDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.GPU_PROCESS_CRASHED).assertEqual(403);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonGpuProcessWatchdogTimeoutDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2500
     * @tc.desc   test BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonGpuProcessWatchdogTimeoutDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT).assertEqual(404);
        done();
      })

    /**
     * @tc.name   testBlankScreenReasonWebViewZeroSizeDirect001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2600
     * @tc.desc   test BlankScreenReason.WEB_VIEW_ZERO_SIZE call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonWebViewZeroSizeDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        expect(BlankScreenReason.WEB_VIEW_ZERO_SIZE).assertEqual(501);
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoInterfaceDirect001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_INTERFACE_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo interface coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoInterfaceDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let info: MonitoredBlankScreenEventInfo = {
          url: 'resource://rawfile/kongbai.html',
          reason: BlankScreenReason.SSL_ERROR,
          extraMsg: 'ssl handshake failed'
        };
        expect(info != null).assertTrue();
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoUrlDirect001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_URL_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.url property coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoUrlDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let info: MonitoredBlankScreenEventInfo = {
          url: 'resource://rawfile/kongbai.html',
          reason: BlankScreenReason.MAIN_DOC_EMPTY,
          extraMsg: ''
        };
        expect(info.url).assertEqual('resource://rawfile/kongbai.html');
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoReasonDirect001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_REASON_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.reason property coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoReasonDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let info: MonitoredBlankScreenEventInfo = {
          url: 'resource://rawfile/1text.html',
          reason: BlankScreenReason.DNS_RESOLVE_FAILED,
          extraMsg: 'dns error'
        };
        expect(info.reason).assertEqual(BlankScreenReason.DNS_RESOLVE_FAILED);
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoExtraMsgDirect001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_EXTRAMSG_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.extraMsg property coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoExtraMsgDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let info: MonitoredBlankScreenEventInfo = {
          url: 'resource://rawfile/1text.html',
          reason: BlankScreenReason.REQUEST_TIMED_OUT,
          extraMsg: 'request timed out after 30s'
        };
        expect(info.extraMsg).assertEqual('request timed out after 30s');
        done();
      })

    /**
     * @tc.name   testOnMonitorBlankScreenCallbackTypeDirect001
     * @tc.number SUB_WEB_ONMONITORBLANKSCREEN_CALLBACK_0100
     * @tc.desc   test OnMonitorBlankScreenCallback type coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnMonitorBlankScreenCallbackTypeDirect001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        let callback: OnMonitorBlankScreenCallback = (event: MonitoredBlankScreenEventInfo) => {
          expect(event.url.length).assertLarger(0);
          expect(event.reason).assertEqual(BlankScreenReason.CERT_ERROR);
          expect(event.extraMsg).assertEqual('cert invalid');
        };
        callback({
          url: 'resource://rawfile/kongbai.html',
          reason: BlankScreenReason.CERT_ERROR,
          extraMsg: 'cert invalid'
        });
        done();
      })
  })
}
