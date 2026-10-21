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
import Utils from './Utils.test';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 183117;
const driver = Driver.create();

export default function monitoredBlankScreenCoveragePage() {
  describe('monitoredBlankScreenCoveragePage', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebViewBlankScreenDetectionConfig',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('WebViewBlankScreenDetectionConfig' == pages.name)) {
          await router.pushUrl(options);
        }
      } catch (err) {
        console.error('push WebViewBlankScreenDetectionConfig page error: ' + err);
      }
      await driver.waitForComponent(ON.id('WebViewBlankScreenDetectionConfigButton'), 10000);
      done();
    });

    /**
     * @tc.name   testBlankScreenReasonDnsResolveFailedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0100
     * @tc.desc   test BlankScreenReason.DNS_RESOLVE_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonDnsResolveFailedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonDnsResolveFailed001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonDnsResolveFailedPage001', 101, 20261101, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonDnsResolveFailedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonRequestTimedOutPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0200
     * @tc.desc   test BlankScreenReason.REQUEST_TIMED_OUT call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRequestTimedOutPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonRequestTimedOut001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonRequestTimedOutPage001', 102, 20261102, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonRequestTimedOutPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonConnectionRefusedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0300
     * @tc.desc   test BlankScreenReason.CONNECTION_REFUSED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonConnectionRefusedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonConnectionRefused001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonConnectionRefusedPage001', 103, 20261103, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonConnectionRefusedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonConnectionResetPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0400
     * @tc.desc   test BlankScreenReason.CONNECTION_RESET call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonConnectionResetPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonConnectionReset001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonConnectionResetPage001', 104, 20261104, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonConnectionResetPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonSslErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0500
     * @tc.desc   test BlankScreenReason.SSL_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonSslErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonSslError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonSslErrorPage001', 105, 20261105, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonSslErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonCertErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0600
     * @tc.desc   test BlankScreenReason.CERT_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCertErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonCertError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonCertErrorPage001', 106, 20261106, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonCertErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonInternetDisconnectedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0700
     * @tc.desc   test BlankScreenReason.INTERNET_DISCONNECTED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonInternetDisconnectedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonInternetDisconnected001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonInternetDisconnectedPage001', 107, 20261107, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonInternetDisconnectedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonRedirectLoopPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0800
     * @tc.desc   test BlankScreenReason.REDIRECT_LOOP call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRedirectLoopPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonRedirectLoop001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonRedirectLoopPage001', 108, 20261108, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonRedirectLoopPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonProxyErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_0900
     * @tc.desc   test BlankScreenReason.PROXY_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonProxyErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonProxyError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonProxyErrorPage001', 109, 20261109, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonProxyErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonOtherNetworkErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1000
     * @tc.desc   test BlankScreenReason.OTHER_NETWORK_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonOtherNetworkErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonOtherNetworkError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonOtherNetworkErrorPage001', 199, 20261110, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonOtherNetworkErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonMainDocEmptyPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1100
     * @tc.desc   test BlankScreenReason.MAIN_DOC_EMPTY call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonMainDocEmptyPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonMainDocEmpty001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonMainDocEmptyPage001', 201, 20261111, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonMainDocEmptyPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonHttp4xxErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1200
     * @tc.desc   test BlankScreenReason.HTTP_4XX_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonHttp4xxErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonHttp4xxError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonHttp4xxErrorPage001', 202, 20261112, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonHttp4xxErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonHttp5xxErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1300
     * @tc.desc   test BlankScreenReason.HTTP_5XX_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonHttp5xxErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonHttp5xxError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonHttp5xxErrorPage001', 203, 20261113, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonHttp5xxErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonJsGlobalBundleLoadFailedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1400
     * @tc.desc   test BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonJsGlobalBundleLoadFailedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonJsGlobalBundleLoadFailed001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonJsGlobalBundleLoadFailedPage001', 210, 20261114, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonJsGlobalBundleLoadFailedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonCssLoadFailedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1500
     * @tc.desc   test BlankScreenReason.CSS_LOAD_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCssLoadFailedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonCssLoadFailed001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonCssLoadFailedPage001', 211, 20261115, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonCssLoadFailedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonMultiResourceLoadFailedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1600
     * @tc.desc   test BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonMultiResourceLoadFailedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonMultiResourceLoadFailed001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonMultiResourceLoadFailedPage001', 212, 20261116, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonMultiResourceLoadFailedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonCorsBlockedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1700
     * @tc.desc   test BlankScreenReason.CORS_BLOCKED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCorsBlockedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonCorsBlocked001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonCorsBlockedPage001', 213, 20261117, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonCorsBlockedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonCspBlockedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1800
     * @tc.desc   test BlankScreenReason.CSP_BLOCKED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonCspBlockedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonCspBlocked001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonCspBlockedPage001', 214, 20261118, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonCspBlockedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonMixedContentBlockedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_1900
     * @tc.desc   test BlankScreenReason.MIXED_CONTENT_BLOCKED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonMixedContentBlockedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonMixedContentBlocked001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonMixedContentBlockedPage001', 215, 20261119, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonMixedContentBlockedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonJsRuntimeErrorPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2000
     * @tc.desc   test BlankScreenReason.JS_RUNTIME_ERROR call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonJsRuntimeErrorPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonJsRuntimeError001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonJsRuntimeErrorPage001', 301, 20261120, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonJsRuntimeErrorPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonNoFirstContentfulPaintPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2100
     * @tc.desc   test BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonNoFirstContentfulPaintPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonNoFirstContentfulPaint001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonNoFirstContentfulPaintPage001', 312, 20261121, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonNoFirstContentfulPaintPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonRendererCrashedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2200
     * @tc.desc   test BlankScreenReason.RENDERER_CRASHED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRendererCrashedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonRendererCrashed001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonRendererCrashedPage001', 401, 20261122, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonRendererCrashedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonRendererKilledPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2300
     * @tc.desc   test BlankScreenReason.RENDERER_KILLED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonRendererKilledPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonRendererKilled001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonRendererKilledPage001', 402, 20261123, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonRendererKilledPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonGpuProcessCrashedPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2400
     * @tc.desc   test BlankScreenReason.GPU_PROCESS_CRASHED call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonGpuProcessCrashedPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonGpuProcessCrashed001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonGpuProcessCrashedPage001', 403, 20261124, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonGpuProcessCrashedPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonGpuProcessWatchdogTimeoutPage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2500
     * @tc.desc   test BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonGpuProcessWatchdogTimeoutPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonGpuProcessWatchdogTimeout001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonGpuProcessWatchdogTimeoutPage001', 404, 20261125, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonGpuProcessWatchdogTimeoutPage001');
    })

    /**
     * @tc.name   testBlankScreenReasonWebViewZeroSizePage001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CALL_2600
     * @tc.desc   test BlankScreenReason.WEB_VIEW_ZERO_SIZE call coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testBlankScreenReasonWebViewZeroSizePage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitBlankScreenReasonWebViewZeroSize001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testBlankScreenReasonWebViewZeroSizePage001', 501, 20261126, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testBlankScreenReasonWebViewZeroSizePage001');
    })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoInterfacePage001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_INTERFACE_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo interface coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoInterfacePage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitMonitoredBlankScreenEventInfoInterface001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testMonitoredBlankScreenEventInfoInterfacePage001', true, 20261201, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testMonitoredBlankScreenEventInfoInterfacePage001');
    })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoUrlPage001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_URL_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.url property coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoUrlPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitMonitoredBlankScreenEventInfoUrl001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testMonitoredBlankScreenEventInfoUrlPage001', 'resource://rawfile/kongbai.html', 20261202, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testMonitoredBlankScreenEventInfoUrlPage001');
    })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoReasonPage001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_REASON_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.reason property coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoReasonPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitMonitoredBlankScreenEventInfoReason001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testMonitoredBlankScreenEventInfoReasonPage001', 101, 20261203, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testMonitoredBlankScreenEventInfoReasonPage001');
    })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoExtraMsgPage001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREEN_EXTRAMSG_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.extraMsg property coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMonitoredBlankScreenEventInfoExtraMsgPage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitMonitoredBlankScreenEventInfoExtraMsg001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testMonitoredBlankScreenEventInfoExtraMsgPage001', 'main document is empty', 20261204, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testMonitoredBlankScreenEventInfoExtraMsgPage001');
    })

    /**
     * @tc.name   testOnMonitorBlankScreenCallbackTypePage001
     * @tc.number SUB_WEB_ONMONITORBLANKSCREEN_CALLBACK_0100
     * @tc.desc   test OnMonitorBlankScreenCallback type coverage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testOnMonitorBlankScreenCallbackTypePage001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      Utils.emitEvent('emitOnMonitorBlankScreenCallbackType001', EVENT_ID_SET_SUITE_KEY);
      Utils.registerEvent('testOnMonitorBlankScreenCallbackTypePage001', true, 20261205, done);
      await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', 'testOnMonitorBlankScreenCallbackTypePage001');
    })
  });
}
