/**
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

import { Component, Driver } from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level  } from '../../../../hypium/index'
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from "@ohos.arkui.inspector";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Utils.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;


export default function ProgressContentModifierTest() {
  describe('ProgressContentModifierTest', () => {
    beforeAll(() => {
      console.info("ProgressContentModifierTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    /* *
    * @tc.number: ProgressContentModifierTest_001
    * @tc.name  : ProgressContentModifierTest_static_001
    * @tc.desc  : To test the contentModifier
    * @tc.level : Level 0
    * @tc.type
    * @tc.size
    */
    it('ProgressContentModifierTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ProgressContentModifierTest_001 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ProgressContentModifier_total');
      let obj = JSON.parseJsonElement(strJson);
      await CommonFunc.sleep(1000);
      console.info("[ProgressContentModifierTest_001] obj is: " + JSON.stringifyJsonElement(obj));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual('Current progress is：0/3');
      console.info('[ProgressContentModifierTest_001] END');
      done();
    });
  })
}
