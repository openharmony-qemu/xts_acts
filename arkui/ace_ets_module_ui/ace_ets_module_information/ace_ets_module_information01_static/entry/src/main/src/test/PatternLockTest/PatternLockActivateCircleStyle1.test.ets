/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON } from '@ohos.UiTest';
import inspector from "@ohos.arkui.inspector";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function PatternLockActivateCircleStyle1() {
  describe('PatternLockActivateCircleStyle1', () => {
    beforeAll(() => {
      console.info("PatternLockActivateCircleStyle1 beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information01.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("PatternLockActivateCircleStyle1 after each called");
    });

    /**
     * @tc.number PatternLockActivateCircleStyle1_0100
     * @tc.name PatternLockActivateCircleStyle1_static_0010
     * @tc.desc Test PatternLock activateCircleStyle
     * @tc.level Level 2
     */
    it('PatternLockActivateCircleStyle1_static_0010', 0, async (done: () => void): Promise<void> => {
      console.info('[PatternLockActivateCircleStyle1_0100] START');
      await CommonFunc.sleep(2000);

      let strJson1 = inspector.getInspectorByKey('PatternLock_activateCircleStyle');
      let obj1 = JSON.parseJsonElement(strJson1);
      await CommonFunc.sleep(1000);
      console.info("[VideoReset1_0100] obj1 is: " + JSON.stringify(obj1));
      expect(obj1.getElement('$attrs').getString('activeCircleColor')).assertEqual('#FF90EE90');
      expect(obj1.getElement('$attrs').getString('activeCircleRadius')).assertEqual('16.00vp');
      expect(obj1.getElement('$attrs').getString('enableWaveEffect')).assertEqual('true');

      console.info('[PatternLockActivateCircleStyle1_0100] END');
      done();
    });
  })
}

