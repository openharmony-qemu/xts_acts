'use static';
/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from './Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

let testAbilityContext: common.UIAbilityContext;

export default function ExecuteAIPageCommandCheckTest() : void{

  describe('ExecuteAIPageCommandCheckTest', (): void => {
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000);
      console.log("App start")
    });

    beforeEach(async () => {
      await Utils.msSleep(500);
      console.info("ExecuteAIPageCommandCheckTest beforeEach start");
    })

    /**
     * @tc.name   testGetUrlHistory001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0100
     * @tc.desc   test getUrlHistory command with valid params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUrlHistory001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetUrlHistory001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGetUrlHistory001", 10, 148500, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGetUrlHistory002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0200
     * @tc.desc   test getUrlHistory command with browser or host is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUrlHistory002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGetUrlHistory002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGetUrlHistory002", 132, 148501, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testNavigate001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0300
     * @tc.desc   test navigate command with missing url param
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNavigate001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testNavigate001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testNavigate001", 391, 148502, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testNavigate002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0400
     * @tc.desc   test navigate command with empty url string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNavigate002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testNavigate002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testNavigate002", 391, 148503, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testNavigate003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0500
     * @tc.desc   test navigate command with unsupported protocol ftp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNavigate003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testNavigate003", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testNavigate003", 392, 148504, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testNavigate004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0600
     * @tc.desc   test navigate command with valid about blank url
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNavigate004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testNavigate004", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testNavigate004", 10, 148505, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testNavigate005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0700
     * @tc.desc   test navigate command with browser or host is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNavigate005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testNavigate005", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testNavigate005", 132, 148506, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGoBack001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0800
     * @tc.desc   test goBack command when history exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGoBack001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGoBack001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGoBack001", 10, 148507, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGoBack002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_0900
     * @tc.desc   test goBack command when cannot go back
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGoBack002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGoBack002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGoBack002", 11, 148508, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGoBack003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1000
     * @tc.desc   test goBack command with browser or host is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGoBack003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGoBack003", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGoBack003", 132, 148509, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGoForward001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1100
     * @tc.desc   test goForward command when forward history exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGoForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGoForward001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGoForward001", 10, 148510, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGoForward002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1200
     * @tc.desc   test goForward command when cannot go forward
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGoForward002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGoForward002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGoForward002", 11, 148511, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testGoForward003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1300
     * @tc.desc   test goForward command with browser or host is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGoForward003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testGoForward003", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testGoForward003", 132, 148512, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1400
     * @tc.desc   test addPageAnnotation command with missing params
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation001", 110, 148513, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1500
     * @tc.desc   test addPageAnnotation command with empty params missing elementList
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation002", 391, 148514, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1600
     * @tc.desc   test addPageAnnotation command with empty elementList array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation003", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation003", 392, 148515, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1700
     * @tc.desc   test addPageAnnotation command with elementList not array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation004", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation004", 392, 148516, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation005
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1800
     * @tc.desc   test addPageAnnotation command with elementList containing empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation005", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation005", 392, 148517, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation006
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_1900
     * @tc.desc   test addPageAnnotation command with elementList containing non-string items
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation006", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation006", 392, 148518, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation007
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2000
     * @tc.desc   test addPageAnnotation command with valid elementList format
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation007", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation007", 10, 148519, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation008
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2100
     * @tc.desc   test addPageAnnotation command with multiple elementList on annotation fixture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation008", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation008", 10, 148520, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testAddPageAnnotation009
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2200
     * @tc.desc   test addPageAnnotation command with browser or frame is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAddPageAnnotation009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testAddPageAnnotation009", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testAddPageAnnotation009", 132, 148521, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testRemovePageAnnotation001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2300
     * @tc.desc   test removePageAnnotation command after annotation added
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemovePageAnnotation001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRemovePageAnnotation001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testRemovePageAnnotation001", 10, 148522, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testRemovePageAnnotation002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2400
     * @tc.desc   test removePageAnnotation command when no overlay exists
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemovePageAnnotation002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRemovePageAnnotation002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testRemovePageAnnotation002", 11, 148523, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testRemovePageAnnotation003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2500
     * @tc.desc   test removePageAnnotation command with browser or frame is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemovePageAnnotation003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRemovePageAnnotation003", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testRemovePageAnnotation003", 132, 148524, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testRemovePageAnnotation004
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2600
     * @tc.desc   test removePageAnnotation command with annotation command failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemovePageAnnotation004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testRemovePageAnnotation004", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testRemovePageAnnotation004", 11, 148525, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testScreenCapture001
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2700
     * @tc.desc   test screenCapture command with unknown clip param defaults to viewport capture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCapture001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testScreenCapture001", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testScreenCapture001", 392, 148526, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testScreenCapture002
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2800
     * @tc.desc   test screenCapture command with valid clip params on screencapture fixture
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCapture002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testScreenCapture002", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testScreenCapture002", 10, 148527, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
    /**
     * @tc.name   testScreenCapture003
     * @tc.number SUB_WEB_WEBVIEWCONTROLLER_EXECUTEAI_PAGECOMMAND_CHECK_2900
     * @tc.desc   test screenCapture command with browser or host is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testScreenCapture003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("testScreenCapture003", 148188)
        await Utils.msSleep(500);
        Utils.registerEvent("testScreenCapture003", 132, 148528, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('CheckTestButton', 148188, '');
        await Utils.msSleep(2000);
        done();
      })
  })
}
