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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils.test';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_SUITE_KEY = 183117;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

function enumPageCase(
  emitKey: string,
  testName: string,
  tcNumber: string,
  expected: number | string | boolean,
  eventId: number) {
  it(testName, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
    Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY);
    Utils.registerEvent(testName, expected, eventId, done);
    await Utils.waitAndClickComponent(driver, 'WebViewBlankScreenDetectionConfigButton', testName);
  });
}

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

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      });
      done();
    });

    enumPageCase('emitBlankScreenReasonDnsResolveFailed001', 'testBlankScreenReasonDnsResolveFailedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0100', 101, 20261101);
    enumPageCase('emitBlankScreenReasonRequestTimedOut001', 'testBlankScreenReasonRequestTimedOutPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0200', 102, 20261102);
    enumPageCase('emitBlankScreenReasonConnectionRefused001', 'testBlankScreenReasonConnectionRefusedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0300', 103, 20261103);
    enumPageCase('emitBlankScreenReasonConnectionReset001', 'testBlankScreenReasonConnectionResetPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0400', 104, 20261104);
    enumPageCase('emitBlankScreenReasonSslError001', 'testBlankScreenReasonSslErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0500', 105, 20261105);
    enumPageCase('emitBlankScreenReasonCertError001', 'testBlankScreenReasonCertErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0600', 106, 20261106);
    enumPageCase('emitBlankScreenReasonInternetDisconnected001', 'testBlankScreenReasonInternetDisconnectedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0700', 107, 20261107);
    enumPageCase('emitBlankScreenReasonRedirectLoop001', 'testBlankScreenReasonRedirectLoopPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0800', 108, 20261108);
    enumPageCase('emitBlankScreenReasonProxyError001', 'testBlankScreenReasonProxyErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_0900', 109, 20261109);
    enumPageCase('emitBlankScreenReasonOtherNetworkError001', 'testBlankScreenReasonOtherNetworkErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1000', 199, 20261110);
    enumPageCase('emitBlankScreenReasonMainDocEmpty001', 'testBlankScreenReasonMainDocEmptyPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1100', 201, 20261111);
    enumPageCase('emitBlankScreenReasonHttp4xxError001', 'testBlankScreenReasonHttp4xxErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1200', 202, 20261112);
    enumPageCase('emitBlankScreenReasonHttp5xxError001', 'testBlankScreenReasonHttp5xxErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1300', 203, 20261113);
    enumPageCase('emitBlankScreenReasonJsGlobalBundleLoadFailed001', 'testBlankScreenReasonJsGlobalBundleLoadFailedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1400', 210, 20261114);
    enumPageCase('emitBlankScreenReasonCssLoadFailed001', 'testBlankScreenReasonCssLoadFailedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1500', 211, 20261115);
    enumPageCase('emitBlankScreenReasonMultiResourceLoadFailed001', 'testBlankScreenReasonMultiResourceLoadFailedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1600', 212, 20261116);
    enumPageCase('emitBlankScreenReasonCorsBlocked001', 'testBlankScreenReasonCorsBlockedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1700', 213, 20261117);
    enumPageCase('emitBlankScreenReasonCspBlocked001', 'testBlankScreenReasonCspBlockedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1800', 214, 20261118);
    enumPageCase('emitBlankScreenReasonMixedContentBlocked001', 'testBlankScreenReasonMixedContentBlockedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_1900', 215, 20261119);
    enumPageCase('emitBlankScreenReasonJsRuntimeError001', 'testBlankScreenReasonJsRuntimeErrorPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2000', 301, 20261120);
    enumPageCase('emitBlankScreenReasonNoFirstContentfulPaint001', 'testBlankScreenReasonNoFirstContentfulPaintPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2100', 312, 20261121);
    enumPageCase('emitBlankScreenReasonRendererCrashed001', 'testBlankScreenReasonRendererCrashedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2200', 401, 20261122);
    enumPageCase('emitBlankScreenReasonRendererKilled001', 'testBlankScreenReasonRendererKilledPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2300', 402, 20261123);
    enumPageCase('emitBlankScreenReasonGpuProcessCrashed001', 'testBlankScreenReasonGpuProcessCrashedPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2400', 403, 20261124);
    enumPageCase('emitBlankScreenReasonGpuProcessWatchdogTimeout001', 'testBlankScreenReasonGpuProcessWatchdogTimeoutPage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2500', 404, 20261125);
    enumPageCase('emitBlankScreenReasonWebViewZeroSize001', 'testBlankScreenReasonWebViewZeroSizePage001',
      'SUB_WEB_BLANKSCREENREASON_CALL_2600', 501, 20261126);

    enumPageCase('emitMonitoredBlankScreenEventInfoInterface001', 'testMonitoredBlankScreenEventInfoInterfacePage001',
      'SUB_WEB_MONITOREDBLANKSCREEN_INTERFACE_0100', true, 20261201);
    enumPageCase('emitMonitoredBlankScreenEventInfoUrl001', 'testMonitoredBlankScreenEventInfoUrlPage001',
      'SUB_WEB_MONITOREDBLANKSCREEN_URL_0100', 'resource://rawfile/kongbai.html', 20261202);
    enumPageCase('emitMonitoredBlankScreenEventInfoReason001', 'testMonitoredBlankScreenEventInfoReasonPage001',
      'SUB_WEB_MONITOREDBLANKSCREEN_REASON_0100', 101, 20261203);
    enumPageCase('emitMonitoredBlankScreenEventInfoExtraMsg001', 'testMonitoredBlankScreenEventInfoExtraMsgPage001',
      'SUB_WEB_MONITOREDBLANKSCREEN_EXTRAMSG_0100', 'main document is empty', 20261204);
    enumPageCase('emitOnMonitorBlankScreenCallbackType001', 'testOnMonitorBlankScreenCallbackTypePage001',
      'SUB_WEB_ONMONITORBLANKSCREEN_CALLBACK_0100', true, 20261205);
  });
}
