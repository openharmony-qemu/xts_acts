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

export default function ExtendableRowBuiltInTest() {
  describe('ExtendableRowBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableRowBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableRowBuiltIn",
      }
      try {
        const ExtendableRowBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableRowBuiltInTest.clear();
        let pages: router.RouterState = ExtendableRowBuiltInTest.getState();
        console.info("get ExtendableRowBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableRowBuiltIn" == pages.name)) {
          console.info("get ExtendableRowBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableRowBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableRowBuiltInTest page error:" + err);
      }
      console.info("ExtendableRowBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableRowBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableRowBuiltInTest afterAll: all tests finished');
    });

    /**
     * @tc.name: ExtendableRowBuiltIn_SetRowOptions_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_ROW_SET_ROW_OPTIONS_0100
     * @tc.desc: Test ExtendableRow with setRowOptions method that sets space
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableRowBuiltIn_SetRowOptions_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableRowBuiltIn_SetRowOptions_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableRow_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let space = obj.getString('space');
      console.info("[ExtendableRowBuiltIn_SetRowOptions_0100] space is: " + space);
      expect(space).assertEqual('100.00vp');
      console.info('[ExtendableRowBuiltIn_SetRowOptions_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableRowBuiltIn_OverrideHeight_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_ROW_OVERRIDE_HEIGHT_0200
     * @tc.desc: Test ExtendableRow with overridden height method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableRowBuiltIn_OverrideHeight_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableRowBuiltIn_OverrideHeight_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableRow_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let height = obj.getString('height');
      console.info("[ExtendableRowBuiltIn_OverrideHeight_0200] height is: " + height);
      expect(height).assertEqual('60.00%');
      console.info('[ExtendableRowBuiltIn_OverrideHeight_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableRowBuiltIn_Border_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_ROW_BORDER_0300
     * @tc.desc: Test ExtendableRow border property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableRowBuiltIn_Border_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableRowBuiltIn_Border_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableRow_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let borderWidth = obj.getString('borderWidth');
      let borderColor = obj.getString('borderColor');
      console.info("[ExtendableRowBuiltIn_Border_0300] borderWidth is: " + borderWidth + ", borderColor is: " + borderColor);
      expect(borderWidth).assertEqual('2.00vp');
      expect(borderColor).assertEqual('#FF6699FF');
      console.info('[ExtendableRowBuiltIn_Border_0300] END');
      done();
    });

    /**
     * @tc.name: ExtendableRowBuiltIn_Undefined_0400
     * @tc.number: SUB_ARKUI_EXTENDABLE_ROW_UNDEFINED_0400
     * @tc.desc: Test ExtendableRow border property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableRowBuiltIn_Undefined_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableRowBuiltIn_Undefined_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableRow_002');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let space = obj.getString('space');
      expect(space).assertEqual('0.00px');
      console.info('[ExtendableRowBuiltIn_Undefined_0400] END');
      done();
    });
  });
}