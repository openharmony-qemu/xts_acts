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

import { expect, afterEach, beforeAll, beforeEach, describe, it, TestType, Size, Level } from '../../../hypium/index';
import router from '@ohos.router';
import Utils from '../../src/test/Util.test';
import inspector from '@ohos.arkui.inspector';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import events_emitter from '@ohos.events.emitter';
import { Driver, ON } from '@ohos.UiTest';

let testAbilityContext:common.UIAbilityContext;

export default function WebBlanklessErrorCodeJsunit() {
  describe('WebBlanklessErrorCodeTest',  () =>{
    beforeAll(async (): Promise<void> => {
      await Utils.msSleep(2000)
      console.log("App start")
      let abilityDelegator:abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName:"entry",
        onAbilityCreate: (abilitys : UIAbility) : void => {
          testAbilityContext = abilitys.context
          console.log("onAbilityCreate end")
        },
      }, (err : BusinessError | null) : void => {
        if (err != null ) {
          console.log("-----" + err.code)
        }
        console.log("BusinessError  end")
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.open.harmony.leathercandycachetwotest.static")
      await Utils.msSleep(2000)
      console.log("beforeAll end,%s", "Succeed!")
    });

    beforeEach(async  () =>{
      await Utils.msSleep(2000);
      console.info("blurMode beforeEach start");
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic00
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0000
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic00',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode00", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode00",true,20260316,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode00 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic01
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0001
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode01",true,20260317,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode01 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic02
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0002
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode02", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode02",true,20260318,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode02 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic03
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0003
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic03',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode03", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode03",true,20260319,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode03 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic04
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0004
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic04',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode04", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode04", true, 20260320, done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton', 10, '');
      console.info(`testWebBlanklessErrorCode04 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic05
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0005
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic05',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode05", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode05",true,20260321,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode05 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic06
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0006
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic06',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode06", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode06",true,20260322,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode06 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testWebBlanklessErrorCodeStatic07
     * @tc.number SUB_WEB_WEBBLANKLESSERRORCODE_0007
     * @tc.desc   test WebBlanklessErrorCode.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testWebBlanklessErrorCodeStatic07',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testWebBlanklessErrorCode07", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testWebBlanklessErrorCode07",true,20260323,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testWebBlanklessErrorCode07 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testBlanklessFrameInterpolationStateStatic00
     * @tc.number SUB_WEB_BLANKLESSFRAMEINTERPOLATIONSTATE_0000
     * @tc.desc   test BlanklessFrameInterpolationState.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testBlanklessFrameInterpolationStateStatic00',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testBlanklessFrameInterpolationState00", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testBlanklessFrameInterpolationState00",0,20260324,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testBlanklessFrameInterpolationState00 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testBlanklessFrameInterpolationStateStatic01
     * @tc.number SUB_WEB_BLANKLESSFRAMEINTERPOLATIONSTATE_0001
     * @tc.desc   test BlanklessFrameInterpolationState.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testBlanklessFrameInterpolationStateStatic01',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testBlanklessFrameInterpolationState01", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testBlanklessFrameInterpolationState01",1,20260325,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testBlanklessFrameInterpolationState01 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   testBlanklessFrameInterpolationStateStatic02
     * @tc.number SUB_WEB_BLANKLESSFRAMEINTERPOLAtionstate_0002
     * @tc.desc   test BlanklessFrameInterpolationState.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL0
     */
    it('testBlanklessFrameInterpolationStateStatic02',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await Utils.msSleep(2000)
      Utils.emitEvent("testBlanklessFrameInterpolationState02", 10)
      await Utils.msSleep(2000)
      Utils.registerEvent("testBlanklessFrameInterpolationState02",2,20260326,done);
      await Utils.msSleep(2000)
      inspector.sendEventByKey('WebBlanklessErrorCodeButton',10,'');
      console.info(`testBlanklessFrameInterpolationState02 finish`);
      await Utils.msSleep(2000)
      done();
    })

    /**
     * @tc.name   SwitchNextPageStatic
     * @tc.number SwitchNextPage_20260323
     * @tc.desc   SwitchNextPage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SwitchNextPageStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitonSwitchNextPage", 10)
        await Utils.msSleep(2000);
        inspector.sendEventByKey('WebBlanklessErrorCodeButton', 10, '');
        await Utils.msSleep(5000);
        done();
      })
  })
}
