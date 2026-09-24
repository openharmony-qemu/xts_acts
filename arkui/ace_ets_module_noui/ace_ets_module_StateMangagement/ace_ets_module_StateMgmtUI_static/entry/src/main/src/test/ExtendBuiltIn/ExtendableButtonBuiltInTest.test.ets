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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { ButtonType, ControlSize } from '@kit.ArkUI';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ExtendableButtonBuiltInTest() {
  describe('ExtendableButtonBuiltInTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableButtonBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableButtonBuiltIn",
      }
      try {
        const ExtendableButtonBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableButtonBuiltInTest.clear();
        let pages: router.RouterState = ExtendableButtonBuiltInTest.getState();
        console.info("get ExtendableButtonBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableButtonBuiltIn" == pages.name)) {
          console.info("get ExtendableButtonBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await ExtendableButtonBuiltInTest.pushUrl(options);
          ExtendableButtonBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ExtendableButtonBuiltInTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ExtendableButtonBuiltInTest page error:" + err);
      }
      console.info("ExtendableButtonBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableButtonBuiltInTest after each called");
    });

    afterAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExtendableButtonBuiltInTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableButtonBuiltIn_Type_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_BUTTON_TYPE_0100
     * @tc.desc: Test ExtendableButton with ButtonType.Circle
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableButtonBuiltIn_Type_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableButtonBuiltIn_Type_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableButton_001');
      await CommonFunc.sleep(1000);
      let buttonType=JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')
      console.info("[ExtendableButtonBuiltIn_Type_0100] buttonType is: " + buttonType);
      expect(buttonType).assertEqual('ButtonType.Circle');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableButtonBuiltIn_Type_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableButtonBuiltIn_ControlSize_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_BUTTON_CONTROLSIZE_0200
     * @tc.desc: Test ExtendableButton with ControlSize.SMALL
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableButtonBuiltIn_ControlSize_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableButtonBuiltIn_ControlSize_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableButton_001');
      await CommonFunc.sleep(1000);
      let controlSize=JSON.parseJsonElement(strJson).getElement('$attrs').getString('controlSize')
      console.info("[ExtendableButtonBuiltIn_ControlSize_0200] controlSize is: " + controlSize);
      expect(controlSize).assertEqual('ControlSize.SMALL');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableButtonBuiltIn_ControlSize_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableButtonBuiltIn_OverrideAttribute_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_BUTTON_OVERRIDE_ATTRIBUTE_0300
     * @tc.desc: Test ExtendableButton with overridden width method and ButtonType.Normal
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableButtonBuiltIn_OverrideAttribute_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableButtonBuiltIn_OverrideAttribute_0300] START');
      let strJson: string = inspector.getInspectorByKey('ExtendableButton_002');
      await CommonFunc.sleep(1000);
      let buttonType=JSON.parseJsonElement(strJson).getElement('$attrs').getString('type')
      console.info("[ExtendableButtonBuiltIn_OverrideAttribute_0300] buttonType is: " + buttonType);
      expect(buttonType).assertEqual('ButtonType.Normal');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableButtonBuiltIn_OverrideAttribute_0300] END');
      done();
    });

    /**
     * @tc.name: ExtendableButtonBuiltIn_ClickEvent_0400
     * @tc.number: SUB_ARKUI_EXTENDABLE_BUTTON_CLICK_EVENT_0400
     * @tc.desc: Test ExtendableButton onClick event callback
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableButtonBuiltIn_ClickEvent_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableButtonBuiltIn_ClickEvent_0400] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ExtendableButton_001'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ExtendableButton_001');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('add!');
      console.info('[ExtendableButtonBuiltIn_ClickEvent_0400] END');
      done();
    });

    /**
     * @tc.name: ExtendableButtonBuiltIn_ClickEvent_0500
     * @tc.number: SUB_ARKUI_EXTENDABLE_BUTTON_CLICK_EVENT_0500
     * @tc.desc: Test ExtendableButton onClick event callback
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableButtonBuiltIn_ClickEvent_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableButtonBuiltIn_ClickEvent_0500] START');
      let driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('ExtendableButton_002'));
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ExtendableButton_002');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('add!~');
      console.info('[ExtendableButtonBuiltIn_ClickEvent_0500] END');
      done();
    });

    /**
     * @tc.name: ExtendableButtonBuiltIn_Undefined_0600
     * @tc.number: SUB_ARKUI_EXTENDABLE_BUTTON_UNDEFINED_0600
     * @tc.desc: ExtendableButtonBuiltIn_Undefined_0600
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableButtonBuiltIn_Undefined_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableButtonBuiltIn_Undefined_0600] START');
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('ExtendableButton_003');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('type')).assertEqual('ButtonType.ROUNDED_RECTANGLE');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('width')).assertEqual('30.00%');
      console.info('[ExtendableButtonBuiltIn_Undefined_0600] END');
      done();
    });
  });
}
