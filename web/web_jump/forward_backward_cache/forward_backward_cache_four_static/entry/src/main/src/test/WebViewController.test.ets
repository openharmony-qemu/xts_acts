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
import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
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
