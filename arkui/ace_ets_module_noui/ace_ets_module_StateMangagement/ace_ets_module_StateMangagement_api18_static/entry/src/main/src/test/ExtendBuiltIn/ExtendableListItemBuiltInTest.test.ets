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

export default function ExtendableListItemBuiltInTest() {
  describe('ExtendableListItemBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableListItemBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableListItemBuiltIn",
      }
      try {
        const ExtendableListItemBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableListItemBuiltInTest.clear();
        let pages: router.RouterState = ExtendableListItemBuiltInTest.getState();
        console.info("get ExtendableListItemBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableListItemBuiltIn" == pages.name)) {
          console.info("get ExtendableListItemBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableListItemBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableListItemBuiltInTest page error:" + err);
      }
      console.info("ExtendableListItemBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableListItemBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableListItemBuiltInTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableListItemBuiltIn_CustomAttribute_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_ITEM_CUSTOM_ATTRIBUTE_0100
     * @tc.desc: Test ExtendableListItem custom newAttribute method that sets margin and borderRadius
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListItemBuiltIn_CustomAttribute_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableListItemBuiltIn_CustomAttribute_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableListItem_002');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let margin = obj.getString('margin');
      let borderRadius = obj.getString('borderRadius');
      console.info("[ExtendableListItemBuiltIn_CustomAttribute_0100] margin is: " + margin + ", borderRadius is: " + borderRadius);
      expect(margin).assertEqual('10.00vp');
      expect(borderRadius).assertEqual('10.00vp');
      console.info('[ExtendableListItemBuiltIn_CustomAttribute_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableListItemBuiltIn_ChildComponent_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_ITEM_CHILD_COMPONENT_0200
     * @tc.desc: Test ExtendableListItem child component Text exists and displays correct content
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListItemBuiltIn_ChildComponent_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableListItemBuiltIn_ChildComponent_0200] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("ExtendableListItem_001"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableListItem_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      let fontSize = obj.getString('fontSize');
      console.info("[ExtendableListItemBuiltIn_ChildComponent_0300] content is: " + content + ", fontSize is: " + fontSize);
      expect(content).assertEqual('a');
      expect(fontSize).assertEqual('16.00fp');
      console.info('[ExtendableListItemBuiltIn_ChildComponent_0300] END');
      done();
    });

    /**
     * @tc.name: ExtendableListItemBuiltIn_OverrideWidth_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_LIST_ITEM_OVERRIDE_WIDTH_0300
     * @tc.desc: Test ExtendableListItem with overridden width method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableListItemBuiltIn_OverrideWidth_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableListItemBuiltIn_OverrideWidth_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableListItem_002');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let width = obj.getString('width');
      console.info("[ExtendableListItemBuiltIn_OverrideWidth_0300] width is: " + width);
      expect(width).assertEqual('50.00%');
      console.info('[ExtendableListItemBuiltIn_OverrideWidth_0300] END');
      done();
    });
  });
}