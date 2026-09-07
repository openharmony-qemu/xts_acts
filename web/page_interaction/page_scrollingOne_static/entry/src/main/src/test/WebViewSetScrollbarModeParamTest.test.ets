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

import { beforeAll, beforeEach, describe, it, Level, Size, TestType } from '../../../hypium/index';
import Utils from './Util.test';
import UtilsHelpers from './UtilsHelper'
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import deviceInfo from '@ohos.deviceInfo'


let testAbilityContext:common.UIAbilityContext;

export default function webViewSetScrollbarModeParamTest():void {

  describe('WebViewSetScrollbarModeParamTest', () => {

    beforeAll(async (): Promise<void> => {
      console.log("App start")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async () => {
      await Utils.msSleep(2000);
      console.info("WebViewSetScrollbarModeParamTest beforeEach start");
    })

    // /**
    //  * @tc.name   testSetScrollbarModeParamNull001
    //  * @tc.number SUB_WEB_WEBVIEW_SETSCROLLBARMODE_PARAM_0100
    //  * @tc.desc   setScrollbarMode null param test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testSetScrollbarModeParamNull001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   Utils.emitEvent("testSetScrollbarModeParamNull001", 10)
    //   await Utils.msSleep(1000)
    //   Utils.registerEvent("testSetScrollbarModeParamNull001", "401", 202608261, done);
    //   await Utils.msSleep(1000)
    //   inspector.sendEventByKey('SetScrollbarModeParamTestButton', 10, '');
    //   await Utils.msSleep(5000);
    //   done();
    // })

    // /**
    //  * @tc.name   testSetScrollbarModeParamUndefined001
    //  * @tc.number SUB_WEB_WEBVIEW_SETSCROLLBARMODE_PARAM_0200
    //  * @tc.desc   setScrollbarMode undefined param test.
    //  * @tc.type   FUNCTION
    //  * @tc.size   MEDIUMTEST
    //  * @tc.level  LEVEL0
    //  */
    // it('testSetScrollbarModeParamUndefined001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
    //   Utils.emitEvent("testSetScrollbarModeParamUndefined001", 10)
    //   await Utils.msSleep(1000)
    //   Utils.registerEvent("testSetScrollbarModeParamUndefined001", "401", 202608262, done);
    //   await Utils.msSleep(1000)
    //   inspector.sendEventByKey('SetScrollbarModeParamTestButton', 10, '');
    //   await Utils.msSleep(5000);
    //   done();
    // })

    /**
     * @tc.name   testSetScrollbarModeParamInvalidEnum001
     * @tc.number SUB_WEB_WEBVIEW_SETSCROLLBARMODE_PARAM_0300
     * @tc.desc   setScrollbarMode invalid enum value 3 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollbarModeParamInvalidEnum001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testSetScrollbarModeParamInvalidEnum001", 10)
      await Utils.msSleep(1000)
      Utils.registerEvent("testSetScrollbarModeParamInvalidEnum001", "401", 202608263, done);
      await Utils.msSleep(1000)
      inspector.sendEventByKey('SetScrollbarModeParamTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })

    /**
     * @tc.name   testSetScrollbarModeParamInvalidEnum002
     * @tc.number SUB_WEB_WEBVIEW_SETSCROLLBARMODE_PARAM_0400
     * @tc.desc   setScrollbarMode invalid enum value -1 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetScrollbarModeParamInvalidEnum002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      Utils.emitEvent("testSetScrollbarModeParamInvalidEnum002", 10)
      await Utils.msSleep(1000)
      Utils.registerEvent("testSetScrollbarModeParamInvalidEnum002", "401", 202608264, done);
      await Utils.msSleep(1000)
      inspector.sendEventByKey('SetScrollbarModeParamTestButton', 10, '');
      await Utils.msSleep(5000);
      done();
    })


  })
}
