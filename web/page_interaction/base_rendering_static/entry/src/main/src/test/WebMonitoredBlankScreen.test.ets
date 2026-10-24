'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, TestType, Size, Level, beforeAll } from '../../../hypium/index';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function webMonitoredBlankScreenJsunit(): void {
  describe('WebMonitoredBlankScreenTest', (): void => {
    beforeAll(async (): Promise<void> => {
      let abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: 'EntryAbility',
        moduleName: 'entry',
        onAbilityCreate: (abilitys: UIAbility): void => {
          testAbilityContext = abilitys.context
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          console.log('-----' + err.code)
        }
      });
      await Utils.msSleep(2000)
      let cmd = 'aa start -a EntryAbility -b com.pageBaseRendering.test.static';
      let user = abilityDelegatorRegistry.getArguments().parameters['-u'];
      if (user !== undefined) {
        cmd += ' -u ' + user;
      }
      abilityDelegator.executeShellCommand(cmd)
      await Utils.msSleep(2000)
      Utils.emitEvent('emitSwitchToWebMonitoredBlankScreenPage', 10)
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlankScreenDetectionMethodButton', 10, '');
      await Utils.msSleep(2000)
    });

    /**
     * @tc.name   testOnMonitoredBlankScreenStatic001
     * @tc.number SUB_WEB_WEBATTRIBUTE_ONMONITOREDBLANKSCREEN_STATIC_0100
     * @tc.desc   test WebAttribute.onMonitoredBlankScreen static
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOnMonitoredBlankScreenStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('testOnMonitoredBlankScreenStatic001', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testOnMonitoredBlankScreenStatic001', 'onMonitoredBlankScreen', 20260450, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoUrlStatic001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREENEVENTINFO_URL_STATIC_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.url
     */
    it('testMonitoredBlankScreenEventInfoUrlStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testMonitoredBlankScreenEventInfoUrl', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testMonitoredBlankScreenEventInfoUrl', 'probe:url', 20260451, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoReasonStatic001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREENEVENTINFO_REASON_STATIC_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.reason
     */
    it('testMonitoredBlankScreenEventInfoReasonStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testMonitoredBlankScreenEventInfoReason', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testMonitoredBlankScreenEventInfoReason', 101, 20260452, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testOnMonitoredBlankScreenUndefinedStatic001
     * @tc.number SUB_WEB_ONMONITOREDBLANKSCREEN_UNDEFINED_STATIC_0200
     * @tc.desc   test onMonitoredBlankScreen(undefined) parameter
     */
    it('testOnMonitoredBlankScreenUndefinedStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnMonitoredBlankScreenUndefined', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testOnMonitoredBlankScreenUndefined', true, 20260455, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testOnMonitoredBlankScreenChainingStatic001
     * @tc.number SUB_WEB_ONMONITOREDBLANKSCREEN_CHAIN_STATIC_0300
     * @tc.desc   test enableBlankScreenMonitor+onMonitoredBlankScreen chain returns this
     */
    it('testOnMonitoredBlankScreenChainingStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testOnMonitoredBlankScreenChaining', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testOnMonitoredBlankScreenChaining', 'chain-ok', 20260458, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableBlankScreenMonitorTrueStatic001
     * @tc.number SUB_WEB_ENABLEBLANKSCREENMONITOR_TRUE_STATIC_0100
     * @tc.desc   test enableBlankScreenMonitor(true)
     */
    it('testEnableBlankScreenMonitorTrueStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testEnableBlankScreenMonitorTrue', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableBlankScreenMonitorTrue', true, 20260456, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testEnableBlankScreenMonitorFalseStatic001
     * @tc.number SUB_WEB_ENABLEBLANKSCREENMONITOR_FALSE_STATIC_0100
     * @tc.desc   test enableBlankScreenMonitor(false) on secondary Web
     */
    it('testEnableBlankScreenMonitorFalseStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testEnableBlankScreenMonitorFalse', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testEnableBlankScreenMonitorFalse', false, 20260457, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testMonitoredBlankScreenEventInfoExtraMsgStatic001
     * @tc.number SUB_WEB_MONITOREDBLANKSCREENEVENTINFO_EXTRAMSG_STATIC_0100
     * @tc.desc   test MonitoredBlankScreenEventInfo.extraMsg
     */
    it('testMonitoredBlankScreenEventInfoExtraMsgStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testMonitoredBlankScreenEventInfoExtraMsg', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testMonitoredBlankScreenEventInfoExtraMsg', 'probe-extra', 20260453, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_DNS_RESOLVE_FAILEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_DNS_RESOLVE_FAILED_STATIC_0100
     * @tc.desc   test BlankScreenReason.DNS_RESOLVE_FAILED
     */
    it('testBlankScreenReason_DNS_RESOLVE_FAILEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_DNS_RESOLVE_FAILED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_DNS_RESOLVE_FAILED', 101, 20260400, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_REQUEST_TIMED_OUTStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_REQUEST_TIMED_OUT_STATIC_0100
     * @tc.desc   test BlankScreenReason.REQUEST_TIMED_OUT
     */
    it('testBlankScreenReason_REQUEST_TIMED_OUTStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_REQUEST_TIMED_OUT', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_REQUEST_TIMED_OUT', 102, 20260401, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_CONNECTION_REFUSEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CONNECTION_REFUSED_STATIC_0100
     * @tc.desc   test BlankScreenReason.CONNECTION_REFUSED
     */
    it('testBlankScreenReason_CONNECTION_REFUSEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_CONNECTION_REFUSED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_CONNECTION_REFUSED', 103, 20260402, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_CONNECTION_RESETStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CONNECTION_RESET_STATIC_0100
     * @tc.desc   test BlankScreenReason.CONNECTION_RESET
     */
    it('testBlankScreenReason_CONNECTION_RESETStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_CONNECTION_RESET', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_CONNECTION_RESET', 104, 20260403, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_SSL_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_SSL_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.SSL_ERROR
     */
    it('testBlankScreenReason_SSL_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_SSL_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_SSL_ERROR', 105, 20260404, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_CERT_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CERT_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.CERT_ERROR
     */
    it('testBlankScreenReason_CERT_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_CERT_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_CERT_ERROR', 106, 20260405, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_INTERNET_DISCONNECTEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_INTERNET_DISCONNECTED_STATIC_0100
     * @tc.desc   test BlankScreenReason.INTERNET_DISCONNECTED
     */
    it('testBlankScreenReason_INTERNET_DISCONNECTEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_INTERNET_DISCONNECTED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_INTERNET_DISCONNECTED', 107, 20260406, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_REDIRECT_LOOPStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_REDIRECT_LOOP_STATIC_0100
     * @tc.desc   test BlankScreenReason.REDIRECT_LOOP
     */
    it('testBlankScreenReason_REDIRECT_LOOPStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_REDIRECT_LOOP', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_REDIRECT_LOOP', 108, 20260407, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_PROXY_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_PROXY_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.PROXY_ERROR
     */
    it('testBlankScreenReason_PROXY_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_PROXY_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_PROXY_ERROR', 109, 20260408, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_OTHER_NETWORK_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_OTHER_NETWORK_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.OTHER_NETWORK_ERROR
     */
    it('testBlankScreenReason_OTHER_NETWORK_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_OTHER_NETWORK_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_OTHER_NETWORK_ERROR', 199, 20260409, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_MAIN_DOC_EMPTYStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_MAIN_DOC_EMPTY_STATIC_0100
     * @tc.desc   test BlankScreenReason.MAIN_DOC_EMPTY
     */
    it('testBlankScreenReason_MAIN_DOC_EMPTYStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_MAIN_DOC_EMPTY', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_MAIN_DOC_EMPTY', 201, 20260410, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_HTTP_4XX_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_HTTP_4XX_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.HTTP_4XX_ERROR
     */
    it('testBlankScreenReason_HTTP_4XX_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_HTTP_4XX_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_HTTP_4XX_ERROR', 202, 20260411, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_HTTP_5XX_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_HTTP_5XX_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.HTTP_5XX_ERROR
     */
    it('testBlankScreenReason_HTTP_5XX_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_HTTP_5XX_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_HTTP_5XX_ERROR', 203, 20260412, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_JS_GLOBAL_BUNDLE_LOAD_FAILEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_JS_GLOBAL_BUNDLE_LOAD_FAILED_STATIC_0100
     * @tc.desc   test BlankScreenReason.JS_GLOBAL_BUNDLE_LOAD_FAILED
     */
    it('testBlankScreenReason_JS_GLOBAL_BUNDLE_LOAD_FAILEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_JS_GLOBAL_BUNDLE_LOAD_FAILED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_JS_GLOBAL_BUNDLE_LOAD_FAILED', 210, 20260413, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_CSS_LOAD_FAILEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CSS_LOAD_FAILED_STATIC_0100
     * @tc.desc   test BlankScreenReason.CSS_LOAD_FAILED
     */
    it('testBlankScreenReason_CSS_LOAD_FAILEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_CSS_LOAD_FAILED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_CSS_LOAD_FAILED', 211, 20260414, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_MULTI_RESOURCE_LOAD_FAILEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_MULTI_RESOURCE_LOAD_FAILED_STATIC_0100
     * @tc.desc   test BlankScreenReason.MULTI_RESOURCE_LOAD_FAILED
     */
    it('testBlankScreenReason_MULTI_RESOURCE_LOAD_FAILEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_MULTI_RESOURCE_LOAD_FAILED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_MULTI_RESOURCE_LOAD_FAILED', 212, 20260415, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_CORS_BLOCKEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CORS_BLOCKED_STATIC_0100
     * @tc.desc   test BlankScreenReason.CORS_BLOCKED
     */
    it('testBlankScreenReason_CORS_BLOCKEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_CORS_BLOCKED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_CORS_BLOCKED', 213, 20260416, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_CSP_BLOCKEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_CSP_BLOCKED_STATIC_0100
     * @tc.desc   test BlankScreenReason.CSP_BLOCKED
     */
    it('testBlankScreenReason_CSP_BLOCKEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_CSP_BLOCKED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_CSP_BLOCKED', 214, 20260417, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_MIXED_CONTENT_BLOCKEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_MIXED_CONTENT_BLOCKED_STATIC_0100
     * @tc.desc   test BlankScreenReason.MIXED_CONTENT_BLOCKED
     */
    it('testBlankScreenReason_MIXED_CONTENT_BLOCKEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_MIXED_CONTENT_BLOCKED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_MIXED_CONTENT_BLOCKED', 215, 20260418, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_JS_RUNTIME_ERRORStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_JS_RUNTIME_ERROR_STATIC_0100
     * @tc.desc   test BlankScreenReason.JS_RUNTIME_ERROR
     */
    it('testBlankScreenReason_JS_RUNTIME_ERRORStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_JS_RUNTIME_ERROR', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_JS_RUNTIME_ERROR', 301, 20260419, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_NO_FIRST_CONTENTFUL_PAINTStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_NO_FIRST_CONTENTFUL_PAINT_STATIC_0100
     * @tc.desc   test BlankScreenReason.NO_FIRST_CONTENTFUL_PAINT
     */
    it('testBlankScreenReason_NO_FIRST_CONTENTFUL_PAINTStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_NO_FIRST_CONTENTFUL_PAINT', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_NO_FIRST_CONTENTFUL_PAINT', 312, 20260420, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_RENDERER_CRASHEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_RENDERER_CRASHED_STATIC_0100
     * @tc.desc   test BlankScreenReason.RENDERER_CRASHED
     */
    it('testBlankScreenReason_RENDERER_CRASHEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_RENDERER_CRASHED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_RENDERER_CRASHED', 401, 20260421, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_RENDERER_KILLEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_RENDERER_KILLED_STATIC_0100
     * @tc.desc   test BlankScreenReason.RENDERER_KILLED
     */
    it('testBlankScreenReason_RENDERER_KILLEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_RENDERER_KILLED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_RENDERER_KILLED', 402, 20260422, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_GPU_PROCESS_CRASHEDStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_CRASHED_STATIC_0100
     * @tc.desc   test BlankScreenReason.GPU_PROCESS_CRASHED
     */
    it('testBlankScreenReason_GPU_PROCESS_CRASHEDStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_GPU_PROCESS_CRASHED', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_GPU_PROCESS_CRASHED', 403, 20260423, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_GPU_PROCESS_WATCHDOG_TIMEOUTStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_GPU_PROCESS_WATCHDOG_TIMEOUT_STATIC_0100
     * @tc.desc   test BlankScreenReason.GPU_PROCESS_WATCHDOG_TIMEOUT
     */
    it('testBlankScreenReason_GPU_PROCESS_WATCHDOG_TIMEOUTStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_GPU_PROCESS_WATCHDOG_TIMEOUT', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_GPU_PROCESS_WATCHDOG_TIMEOUT', 404, 20260424, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

    /**
     * @tc.name   testBlankScreenReason_WEB_VIEW_ZERO_SIZEStatic001
     * @tc.number SUB_WEB_BLANKSCREENREASON_WEB_VIEW_ZERO_SIZE_STATIC_0100
     * @tc.desc   test BlankScreenReason.WEB_VIEW_ZERO_SIZE
     */
    it('testBlankScreenReason_WEB_VIEW_ZERO_SIZEStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        Utils.emitEvent('testBlankScreenReason_WEB_VIEW_ZERO_SIZE', 10);
        await Utils.msSleep(2000);
        Utils.registerEvent('testBlankScreenReason_WEB_VIEW_ZERO_SIZE', 501, 20260425, done);
        inspector.sendEventByKey('WebMonitoredBlankScreenButton', 10, '');
        await Utils.msSleep(3000);
        done();
      })

  })
}
