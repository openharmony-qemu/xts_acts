'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import hilog from '@ohos.hilog';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { ButtonType, ControlSize } from '@kit.ArkUI';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';

export default function ExtendableStackBuiltInTest() {
  describe('ExtendableStackBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableStackBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableStackBuiltIn",
      }
      try {
        const ExtendableStackBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableStackBuiltInTest.clear();
        let pages: router.RouterState = ExtendableStackBuiltInTest.getState();
        console.info("get ExtendableStackBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableStackBuiltIn" == pages.name)) {
          console.info("get ExtendableStackBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableStackBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableStackBuiltInTest page error:" + err);
      }
      console.info("ExtendableStackBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableStackBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableStackBuiltInTest afterAll: all tests finished');
    });

    /**
     * @tc.name: ExtendableStackBuiltIn_SetStackOptions_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_STACK_SET_STACK_OPTIONS_0100
     * @tc.desc: Test ExtendableStack with setStackOptions method that sets alignContent
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableStackBuiltIn_SetStackOptions_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableStackBuiltIn_SetStackOptions_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableStack_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let alignContent = obj.getString('alignContent');
      console.info("[ExtendableStackBuiltIn_SetStackOptions_0100] alignContent is: " + alignContent);
      expect(alignContent).assertEqual('Alignment.Bottom');
      console.info('[ExtendableStackBuiltIn_SetStackOptions_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableStackBuiltIn_OverrideWidth_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_STACK_OVERRIDE_WIDTH_0200
     * @tc.desc: Test ExtendableStack with overridden width method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableStackBuiltIn_OverrideWidth_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableStackBuiltIn_OverrideWidth_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableStack_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let width = obj.getString('width');
      console.info("[ExtendableStackBuiltIn_OverrideWidth_0200] width is: " + width);
      expect(width).assertEqual('80.00%');
      console.info('[ExtendableStackBuiltIn_OverrideWidth_0200] END');
      done();
    });
  });
}