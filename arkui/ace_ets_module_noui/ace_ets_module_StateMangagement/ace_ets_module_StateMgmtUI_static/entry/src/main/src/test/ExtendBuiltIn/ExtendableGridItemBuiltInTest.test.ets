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

export default function ExtendableGridItemBuiltInTest() {
  describe('ExtendableGridItemBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableGridItemBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableGridItemBuiltIn",
      }
      try {
        const ExtendableGridItemBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableGridItemBuiltInTest.clear();
        let pages: router.RouterState = ExtendableGridItemBuiltInTest.getState();
        console.info("get ExtendableGridItemBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableGridItemBuiltIn" == pages.name)) {
          console.info("get ExtendableGridItemBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableGridItemBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableGridItemBuiltInTest page error:" + err);
      }
      console.info("ExtendableGridItemBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableGridItemBuiltInTest after each called");
    });

    afterAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExtendableGridItemBuiltInTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableGridItemBuiltIn_CustomAttribute_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_GRID_ITEM_CUSTOM_ATTRIBUTE_0100
     * @tc.desc: Test ExtendableGridItem with custom newAttribute method (rowStart, backgroundColor)
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableGridItemBuiltIn_CustomAttribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableGridItemBuiltIn_CustomAttribute_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableGridItem_001');
      await CommonFunc.sleep(1000);
      let rowStart=JSON.parseJsonElement(strJson).getElement('$attrs').getString('rowStart')
      let backgroundColor=JSON.parseJsonElement(strJson).getElement('$attrs').getString('backgroundColor')
      console.info("[ExtendableGridItemBuiltIn_CustomAttribute_0100] rowStart is: " + rowStart + ", backgroundColor is: " + backgroundColor);
      expect(rowStart).assertEqual('1');
      expect(backgroundColor).assertEqual('#FFFFA500');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableGridItemBuiltIn_CustomAttribute_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableGridItemBuiltIn_ChildComponent_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_GRID_ITEM_CHILD_COMPONENT_0200
     * @tc.desc: Test ExtendableGridItem child component content
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableGridItemBuiltIn_ChildComponent_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableGridItemBuiltIn_ChildComponent_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableGridItem_002');
      await CommonFunc.sleep(1000);
      let content=JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')
      console.info("[ExtendableGridItemBuiltIn_ChildComponent_0200] content is: " + content);
      expect(content).assertEqual('N0');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableGridItemBuiltIn_ChildComponent_0200] END');
      done();
    });
  });
}