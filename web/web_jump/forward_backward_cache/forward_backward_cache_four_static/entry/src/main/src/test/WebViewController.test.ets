'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level, expect } from '../../../hypium/index';
import events_emitter from '@ohos.events.emitter';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError, RecordData } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext:common.UIAbilityContext;
let emitKey = "emitFetchCookieSync";

export default function webViewControllerJsunit() {
  describe('ActsAceWebDevWebViewControllerTest',  () => {
    beforeAll(async (): Promise<void> => {
      try {
        console.log(' App start')
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
        abilityDelegator.addAbilityMonitor({
          abilityName: 'EntryAbility',
          moduleName: 'entry',
          onAbilityCreate: (abilitys: UIAbility): void => {
            testAbilityContext = abilitys.context
            console.log('onAbilityCreate end')
          },
        }, (err: BusinessError | null): void => {
          if (err != null) {
            console.log('-----' + err.code)
          }
          console.log('BusinessError  end')
        });
        await Utils.msSleep(2000)
        let cmd = 'aa start -a EntryAbility -b com.open.harmony.forwardbackwardcachefourtest.static';
        let user = abilityDelegatorRegistry.getArguments().parameters["-u"];
        if(user !== undefined){
            cmd += ' -u ' + user;
        }
        abilityDelegator.executeShellCommand(cmd)
        await Utils.msSleep(2000)
        console.log('beforeAll end,%s', "Succeed!")
      } catch (error) {
        console.info(`beforeAll error: ${JSON.stringify(error)}`)
      }
    });
    beforeEach(async () => {
      console.info("web beforeEach start");
    })

    /**
     * @tc.name   testFetchCookiePromiseStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1500
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      emitKey="emitFetchCookiePromise";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testFetchCookiePromise","a=d",130,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(8000);
      done();
    })

    /**
     * @tc.name   testFetchCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1400
     * @tc.desc   test for FetchCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookieCallback";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("testFetchCookieSync","a=c",111,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testConfigCookieCallbackStatic
     * @tc.number SUB_ACE_BASIC_ETS_API_1700
     * @tc.desc   test for ConfigCookieCallback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCallbackStatic',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      emitKey="emitConfigCookieCallback";
      await Utils.msSleep(1000);
      Utils.emitEvent(emitKey,10)
      Utils.registerEvent("testConfigCookieCallback","a=f",134,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testSaveCookieAsyncStatic002
     * @tc.number SUB_WEB_SAVECOOKIEASYNC_0200
     * @tc.desc   test saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveCookieAsyncStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent('testSaveCookieAsync002', 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testSaveCookieAsync002', 'done', 134761, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testSaveCookieAsyncStatic001
     * @tc.number SUB_WEB_SAVECOOKIEASYNC_0100
     * @tc.desc   test saveCookieAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSaveCookieAsyncStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="testSaveCookieAsync001";
      Utils.emitEvent(emitKey, 10)
      await Utils.msSleep(1000);
      Utils.registerEvent('testSaveCookieAsync001', 'done', 134760, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testFetchCookieIncognitoErrorStatic008
     * @tc.number SUB_WEB_ERRORCODE_FETCHCOOKIESYNC_INCOGNITO_0800
     * @tc.desc   test fetchCookieSync incognito error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieIncognitoErrorStatic008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      Utils.emitEvent("testFetchCookieIncognitoError008", 10);
      await Utils.msSleep(1000);
      Utils.registerEvent('testFetchCookieIncognitoError008', 'no error happened', 123217, done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(6000);
      done();
    })

    /**
     * @tc.name   testFetchCookiePromiseStatic001
     * @tc.number SUB_ACE_BASIC_ETS_API_1200
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookiePromise001";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("emitFetchCookiePromise001","17100002URL error. No valid cookie found for the specified URL.",131,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testFetchCookiePromiseStatic002
     * @tc.number SUB_ACE_BASIC_ETS_API_1100
     * @tc.desc   test for FetchCookiePromise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(1000);
      emitKey="emitFetchCookiePromise002";
      Utils.emitEvent(emitKey,10)
      await Utils.msSleep(1000);
      Utils.registerEvent("emitFetchCookiePromise002","a=d",132,done);
      await Utils.msSleep(1000);
      inspector.sendEventByKey('webcomponent',10,'');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testFetchCookieSyncStatic101
     * @tc.number SUB_WEB_ERRORCODE_EXT_0101
     * @tc.desc   fetchCookieSync错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testFetchCookieSyncErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieSyncStatic101', 17100002, 2026052001, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookiePromiseStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0103
     * @tc.desc   fetchCookie(url)错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testFetchCookiePromiseErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookiePromiseStatic102', 17100002, 2026052003, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookiePromiseStatic104
     * @tc.number SUB_WEB_ERRORCODE_EXT_0105
     * @tc.desc   fetchCookie(url, incognito)错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookiePromiseStatic104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testFetchCookiePromiseIncognitoErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookiePromiseStatic104', 17100002, 2026052005, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieCallbackStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0107
     * @tc.desc   fetchCookie(url, callback)错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieCallbackStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testFetchCookieCallbackErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieCallbackStatic102', 17100002, 2026052007, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testConfigCookieSyncStatic101
     * @tc.number SUB_WEB_ERRORCODE_EXT_0108
     * @tc.desc   configCookieSync错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testConfigCookieSyncErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testConfigCookieSyncStatic101', 17100002, 2026052008, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testConfigCookieSyncStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0109
     * @tc.desc   configCookieSync错误码覆盖，校验17100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieSyncStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testConfigCookieSyncErrorCode17100005Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testConfigCookieSyncStatic102', 17100005, 2026052009, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testConfigCookiePromiseStatic101
     * @tc.number SUB_WEB_ERRORCODE_EXT_0110
     * @tc.desc   configCookie(url, value)错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookiePromiseStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testConfigCookiePromiseErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testConfigCookiePromiseStatic101', 17100002, 2026052010, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testConfigCookiePromiseStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0111
     * @tc.desc   configCookie(url, value)错误码覆盖，校验17100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookiePromiseStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testConfigCookiePromiseErrorCode17100005Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testConfigCookiePromiseStatic102', 17100005, 2026052011, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testConfigCookieCallbackStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0113
     * @tc.desc   configCookie(url, value, callback)错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCallbackStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testConfigCookieCallbackErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testConfigCookieCallbackStatic102', 17100002, 2026052013, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testConfigCookieCallbackStatic103
     * @tc.number SUB_WEB_ERRORCODE_EXT_0114
     * @tc.desc   configCookie(url, value, callback)错误码覆盖，校验17100005
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testConfigCookieCallbackStatic103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testConfigCookieCallbackErrorCode17100005Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testConfigCookieCallbackStatic103', 17100005, 2026052014, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testLoadUrlStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0121
     * @tc.desc   loadUrl(url)错误码覆盖，校验17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testLoadUrlErrorCode17100001Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testLoadUrlStatic102', 17100001, 2026052021, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testLoadUrlStatic103
     * @tc.number SUB_WEB_ERRORCODE_EXT_0122
     * @tc.desc   loadUrl(url)错误码覆盖，校验17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testLoadUrlErrorCode17100002Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testLoadUrlStatic103', 17100002, 2026052022, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testLoadUrlStatic104
     * @tc.number SUB_WEB_ERRORCODE_EXT_0123
     * @tc.desc   loadUrl(url)错误码覆盖，校验17100003
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testLoadUrlStatic104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testLoadUrlErrorCode17100003Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testLoadUrlStatic104', 17100003, 2026052023, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testGetUserAgentStatic101
     * @tc.number SUB_WEB_ERRORCODE_EXT_0124
     * @tc.desc   getUserAgent错误码覆盖，校验17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testGetUserAgentStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testGetUserAgentErrorCode17100001Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testGetUserAgentStatic101', 17100001, 2026052024, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testSetCustomUserAgentStatic102
     * @tc.number SUB_WEB_ERRORCODE_EXT_0126
     * @tc.desc   setCustomUserAgent错误码覆盖，校验17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetCustomUserAgentStatic102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testSetCustomUserAgentErrorCode17100001Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testSetCustomUserAgentStatic102', 17100001, 2026052026, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testEnableIntelligentTrackingPreventionStatic101
     * @tc.number SUB_WEB_ERRORCODE_EXT_0127
     * @tc.desc   enableIntelligentTrackingPrevention错误码覆盖，校验17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableIntelligentTrackingPreventionStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testEnableIntelligentTrackingPreventionErrorCode17100001Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testEnableIntelligentTrackingPreventionStatic101', 17100001, 2026052027, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testIsIntelligentTrackingPreventionEnabledStatic101
     * @tc.number SUB_WEB_ERRORCODE_EXT_0129
     * @tc.desc   isIntelligentTrackingPreventionEnabled错误码覆盖，校验17100001
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testIsIntelligentTrackingPreventionEnabledStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testIsIntelligentTrackingPreventionEnabledErrorCode17100001Static', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testIsIntelligentTrackingPreventionEnabledStatic101', 17100001, 2026052029, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testWebDownloadItemGetOriginalUrlStatic101
     * @tc.number SUB_WEB_DOWNLOADITEM_API_0100
     * @tc.desc   test WebDownloadItem.getOriginalUrl function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadItemGetOriginalUrlStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testWebDownloadItemGetOriginalUrlStatic101', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testWebDownloadItemGetOriginalUrlStatic101', true, 2026052030, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(10000);
        done();
      })

    /**
     * @tc.name   testWebDownloadItemGetReferrerUrlStatic101
     * @tc.number SUB_WEB_DOWNLOADITEM_API_0200
     * @tc.desc   test WebDownloadItem.getReferrerUrl function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWebDownloadItemGetReferrerUrlStatic101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('testWebDownloadItemGetReferrerUrlStatic101', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testWebDownloadItemGetReferrerUrlStatic101', true, 2026052031, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(10000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedTrueStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0100
     * @tc.desc   test fetchCookieSync includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncPartitionedTrueStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieSyncPartitionedTrueStatic', 'part=true', 2026072401, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedFalseStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0200
     * @tc.desc   test fetchCookieSync includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncPartitionedFalseStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieSyncPartitionedFalseStatic', 'part=false', 2026072402, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedDefaultStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0300
     * @tc.desc   test fetchCookieSync omit includePartitionedCookies default false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedDefaultStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncPartitionedDefaultStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieSyncPartitionedDefaultStatic', 'part=default', 2026072403, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedIncognitoStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0400
     * @tc.desc   test fetchCookieSync incognito and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedIncognitoStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncPartitionedIncognitoStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieSyncPartitionedIncognitoStatic', 'part=incognito', 2026072404, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookiePartitionedTrueStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0500
     * @tc.desc   test fetchCookie includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookiePartitionedTrueStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookiePartitionedTrueStatic', 'async=true', 2026072405, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookiePartitionedFalseStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0600
     * @tc.desc   test fetchCookie includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookiePartitionedFalseStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookiePartitionedFalseStatic', 'async=false', 2026072406, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookiePartitionedIncognitoStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_0700
     * @tc.desc   test fetchCookie incognito and includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedIncognitoStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookiePartitionedIncognitoStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookiePartitionedIncognitoStatic', 'async=incognito', 2026072407, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncPartitionedErrorUrlStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_ERROR_0800
     * @tc.desc   test fetchCookieSync invalid url error 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookieSyncPartitionedErrorUrlStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncPartitionedErrorUrlStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookieSyncPartitionedErrorUrlStatic', '17100002URL error. No valid cookie found for the specified URL.', 2026072408, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookiePartitionedErrorUrlStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_STATIC_ERROR_0900
     * @tc.desc   test fetchCookie invalid url error 17100002
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testFetchCookiePartitionedErrorUrlStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookiePartitionedErrorUrlStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testFetchCookiePartitionedErrorUrlStatic', '17100002URL error. No valid cookie found for the specified URL.', 2026072409, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testAttrPartitionedSyncTrueStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_STATIC_0100
     * @tc.desc   Partitioned attr cookie fetchCookieSync includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedSyncTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitAttrPartitionedSyncTrueStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testAttrPartitionedSyncTrueStatic', 'pass', 2026072414, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testAttrPartitionedSyncFalseStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_STATIC_0200
     * @tc.desc   Partitioned attr cookie fetchCookieSync includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedSyncFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitAttrPartitionedSyncFalseStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testAttrPartitionedSyncFalseStatic', 'pass', 2026072415, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testAttrPartitionedAsyncTrueStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_STATIC_0300
     * @tc.desc   Partitioned attr cookie fetchCookie includePartitionedCookies true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedAsyncTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitAttrPartitionedAsyncTrueStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testAttrPartitionedAsyncTrueStatic', 'pass', 2026072416, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testAttrPartitionedAsyncFalseStatic
     * @tc.number SUB_WEB_WEBCOOKIEMANAGER_FETCHCOOKIE_PARTITIONED_ATTR_STATIC_0400
     * @tc.desc   Partitioned attr cookie fetchCookie includePartitionedCookies false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAttrPartitionedAsyncFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitAttrPartitionedAsyncFalseStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerEvent('testAttrPartitionedAsyncFalseStatic', 'pass', 2026072417, done);
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieIncognitoSuccessStatic
     * @tc.number SUB_WEB_FETCHCOOKIE_INCOGNITO_SUCCESS_0100
     * @tc.desc   test fetchCookie incognito success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieIncognitoSuccessStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieIncognitoSuccessStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieIncognitoSuccessStatic', 'a=b', 2026072418, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieIncognitoSuccessStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieIncognitoNullStatic
     * @tc.number SUB_WEB_FETCHCOOKIE_INCOGNITO_NULL_0100
     * @tc.desc   test fetchCookie incognito null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieIncognitoNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieIncognitoNullStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieIncognitoNullStatic', '401', 2026072419, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieIncognitoNullStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieIncognitoUndefinedStatic
     * @tc.number SUB_WEB_FETCHCOOKIE_INCOGNITO_UNDEFINED_0100
     * @tc.desc   test fetchCookie incognito undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieIncognitoUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieIncognitoUndefinedStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieIncognitoUndefinedStatic', '401', 2026072420, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieIncognitoUndefinedStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncIncognitoNullStatic
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_INCOGNITO_NULL_0100
     * @tc.desc   test fetchCookieSync incognito null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncIncognitoNullStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieSyncIncognitoNullStatic', '401', 2026072421, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieSyncIncognitoNullStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncIncognitoUndefinedStatic
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_INCOGNITO_UNDEFINED_0100
     * @tc.desc   test fetchCookieSync incognito undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncIncognitoUndefinedStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieSyncIncognitoUndefinedStatic', 'incog=undefined', 2026072422, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieSyncIncognitoUndefinedStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieUrlNullStatic
     * @tc.number SUB_WEB_FETCHCOOKIE_URL_NULL_0100
     * @tc.desc   test fetchCookie url null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieUrlNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieUrlNullStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieUrlNullStatic', '401', 2026072423, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieUrlNullStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieUrlUndefinedStatic
     * @tc.number SUB_WEB_FETCHCOOKIE_URL_UNDEFINED_0100
     * @tc.desc   test fetchCookie url undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieUrlUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieUrlUndefinedStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieUrlUndefinedStatic', '401', 2026072424, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieUrlUndefinedStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncUrlNullStatic
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_URL_NULL_0100
     * @tc.desc   test fetchCookieSync url null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncUrlNullStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncUrlNullStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieSyncUrlNullStatic', '401', 2026072425, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieSyncUrlNullStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncUrlUndefinedStatic
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_URL_UNDEFINED_0100
     * @tc.desc   test fetchCookieSync url undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncUrlUndefinedStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncUrlUndefinedStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieSyncUrlUndefinedStatic', '401', 2026072426, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieSyncUrlUndefinedStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncNormalStatic
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_NORMAL_0100
     * @tc.desc   test fetchCookieSync(url) normal return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncNormalStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieSyncNormalStatic', 'sync=normal', 2026072427, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieSyncNormalStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name   testFetchCookieSyncIncognitoNormalStatic
     * @tc.number SUB_WEB_FETCHCOOKIESYNC_INCOGNITO_NORMAL_0100
     * @tc.desc   test fetchCookieSync(url, incognito) normal return value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFetchCookieSyncIncognitoNormalStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        try {
        await Utils.msSleep(1000);
        Utils.emitEvent('emitFetchCookieSyncIncognitoNormalStatic', 10)
        await Utils.msSleep(1000);
        Utils.registerBaseEvent('testFetchCookieSyncIncognitoNormalStatic', 'sync=incog', 2026072428, done,
          (backData: events_emitter.EventData, expected: Object) => {
            const data = backData?.data as Record<string, RecordData>;
            expect(data['ACTION']).assertEqual(expected);
          });
        } catch (err) {
          console.info('[testFetchCookieSyncIncognitoNormalStatic] err:' + JSON.stringify(err));
          done();
        }
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done();
      })

    /**
     * @tc.name        SwitchNextPageStatic
     * @tc.number      testWebViewWindowFeatures00900
     * @tc.desc        onWindowNewExt
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(1000);
        Utils.emitEvent('SwitchNextPageStatic', 10)
        await Utils.msSleep(1000);
        inspector.sendEventByKey('webcomponent',10,'');
        await Utils.msSleep(6000);
        done()
      })
  })
}
