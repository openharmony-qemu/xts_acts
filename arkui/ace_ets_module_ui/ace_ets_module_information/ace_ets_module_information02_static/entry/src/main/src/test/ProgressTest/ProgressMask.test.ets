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

import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../hypium/index'
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

export default function ProgressMask() {
  describe('ProgressMask', () => {
    beforeAll(() => {
      console.info("ProgressMask beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.ets.module.information02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    /**
     * @tc.number ProgressMask_static_0100
     * @tc.name ProgressMask_static_0100
     * @tc.desc frameNode: ProgressMaskToWindow
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ProgressMask_static_0100', 0, async (done: () => void): Promise<void> => {
      console.info('ProgressMask_static_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ProgressMaskImage');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressMask_static_0100] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ProgressMask_static_0100] mask obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content'))
        .assertEqual('{"type":"ProgressMask","value":0,"total":100,"color":"#66000000","breathe":true}');
      console.info('[ProgressMask_static_0100] END');
      done();
    });

    /**
     * @tc.number ProgressMask_static_0200
     * @tc.name ProgressMask_static_0200
     * @tc.desc frameNode: ProgressMaskToWindow
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('ProgressMask_static_0200', 0, async (done: () => void): Promise<void> => {
      console.info('ProgressMask_static_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('ProgressMaskText');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ProgressMask_static_0200] component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[ProgressMask_static_0200] content obj is: " + JSON.stringifyJsonElement(obj.getElement('$attrs').getElement('content')));
      expect(obj.getElement('$attrs').getElement('content')).assertEqual("enableBreathingAnimation success");
      console.info('[ProgressMask_static_0200] END');
      done();
    });
  })
}

