/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { Level, Size, TestType, beforeAll, beforeEach, describe, it, afterEach } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Utils.test';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import{BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import inspector from '@ohos.arkui.inspector';
import webview from '@ohos.web.webview'

let testAbilityContext:common.UIAbilityContext;

export default function webDownloadEnumTest() {

  describe('WebDownloadEnumTest', () => {
    beforeAll(async (): Promise<void> => {
      console.log("App start")
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void=> {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err: BusinessError<void> | null): void => {
        if (err != null) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.logdottingfivetest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    /**
     * @tc.name   testWebDownloadEnumStatic001
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0100
     * @tc.desc   test the value of WebDownloadErrorCode.ERROR_UNKNOWN is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum001", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum001", 0, 70250, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic002
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0200
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_FAILED is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum002", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum002", 1, 70251, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic003
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0300
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_ACCESS_DENIED is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum003", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum003", 2, 70252, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic004
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0400
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_NO_SPACE is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum004", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum004", 3, 70253, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic005
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0500
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_NAME_TOO_LONG is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum005", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum005", 5, 70254, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic006
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0600
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TOO_LARGE is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum006", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum006", 6, 70255, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic007
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0700
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TRANSIENT_ERROR is 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum007", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum007", 10, 70256, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic008
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0800
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_BLOCKED is 11
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum008", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum008", 11, 70257, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic009
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_0900
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_TOO_SHORT is 13
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum009", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum009", 13, 70258, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic010
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1000
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_HASH_MISMATCH is 14
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum010", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum010", 14, 70259, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic011
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1100
     * @tc.desc   test the value of WebDownloadErrorCode.FILE_SAME_AS_SOURCE is 15
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum011", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum011", 15, 70260, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic012
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1200
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_FAILED is 20
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum012", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum012", 20, 70261, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic013
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1300
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_TIMEOUT is 21
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum013", 10);
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum013", 21, 70262, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic014
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1400
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_DISCONNECTED is 22
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum014", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum014", 22, 70263, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic015
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1500
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_SERVER_DOWN is 23
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum015", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum015", 23, 70264, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic016
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1600
     * @tc.desc   test the value of WebDownloadErrorCode.NETWORK_INVALID_REQUEST is 24
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum016", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum016", 24, 70265, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic017
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1700
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_FAILED is 30
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum017", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum017", 30, 70266, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic018
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1800
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_NO_RANGE is 31
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum018", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum018", 31, 70267, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic019
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_1900
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_BAD_CONTENT is 33
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum019", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum019", 33, 70268, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic020
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2000
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_UNAUTHORIZED is 34
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum020", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum020", 34, 70269, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic021
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2100
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CERT_PROBLEM is 35
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum021", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum021", 35, 70270, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic022
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2200
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_FORBIDDEN is 36
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum022", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum022", 36, 70271, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic023
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2300
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_UNREACHABLE is 37
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum023", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum023", 37, 70272, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic024
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2400
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CONTENT_LENGTH_MISMATCH is 38
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum024", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum024", 38, 70273, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic025
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2500
     * @tc.desc   test the value of WebDownloadErrorCode.SERVER_CROSS_ORIGIN_REDIRECT is 39
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum025", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum025", 39, 70274, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic026
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2600
     * @tc.desc   test the value of WebDownloadErrorCode.USER_CANCELED is 40
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum026", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum026", 40, 70275, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic027
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2700
     * @tc.desc   test the value of WebDownloadErrorCode.USER_SHUTDOWN is 41
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum027", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum027", 41, 70276, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic028
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2800
     * @tc.desc   test the value of WebDownloadErrorCode.CRASH is 50
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum028", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum028", 50, 70277, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic029
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_2900
     * @tc.desc   test the value of WebDownloadState.IN_PROGRESS is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum029", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum029", 0, 70278, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic030
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3000
     * @tc.desc   test the value of WebDownloadState.COMPLETED is 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum030", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum030", 1, 70279, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic031
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3100
     * @tc.desc   test the value of WebDownloadState.CANCELED is 2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum031", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum031", 2, 70280, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic032
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3200
     * @tc.desc   test the value of WebDownloadState.INTERRUPTED is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum032", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum032", 3, 70281, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic033
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3300
     * @tc.desc   test the value of WebDownloadState.PENDING is 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum033", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum033", 4, 70282, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic034
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3400
     * @tc.desc   test the value of WebDownloadState.PAUSED is 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum034", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum034", 5, 70283, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })

    /**
     * @tc.name   testWebDownloadEnumStatic035
     * @tc.number SUB_WEB_WEBDOWNLOAD_ENUM_3500
     * @tc.desc   test the value of WebDownloadState.UNKNOWN is 6
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testWebDownloadEnumStatic035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000);
      Utils.emitEvent("testWebDownloadEnum035", 10)
      await Utils.msSleep(2000);
      Utils.registerEvent("testWebDownloadEnum035", 6, 70284, done);
      await Utils.msSleep(2000);
      inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
      await Utils.msSleep(2000);
      done();
    })
    /**
     * @tc.name   emitonSwitchNextPage
     * @tc.number SUB_WEB_EMITONSWITCHNEXTPAGE_0100
     * @tc.desc   test emitonSwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('emitonSwitchNextPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent('emitonSwitchNextPage', 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebDownloadEnumTestButton', 10, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
