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
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ExtendableToggleBuiltInTest() {
  describe('ExtendableToggleBuiltInTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableToggleBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableToggleBuiltIn",
      }
      try {
        const ExtendableToggleBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableToggleBuiltInTest.clear();
        let pages: router.RouterState = ExtendableToggleBuiltInTest.getState();
        console.info("get ExtendableToggleBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableToggleBuiltIn" == pages.name)) {
          console.info("get ExtendableToggleBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableToggleBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableToggleBuiltInTest page error:" + err);
      }
      console.info("ExtendableToggleBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableToggleBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableToggleBuiltInTest afterAll: all tests finished');
    });

    /**
     * @tc.name: ExtendableToggleBuiltIn_SetToggleOptions_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_TOGGLE_SET_TOGGLE_OPTIONS_0100
     * @tc.desc: Test ExtendableToggle with setToggleOptions method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableToggleBuiltIn_SetToggleOptions_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableToggleBuiltIn_SetToggleOptions_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableToggle_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let type = obj.getString('type');
      let isOn = obj.getString('isOn');
      console.info("[ExtendableToggleBuiltIn_SetToggleOptions_0100] type is: " + type + ", isOn is: " + isOn);
      expect(type).assertEqual('ToggleType.Switch');
      expect(isOn).assertEqual('false');
      console.info('[ExtendableToggleBuiltIn_SetToggleOptions_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableToggleBuiltIn_SelectedColor_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_TOGGLE_SELECTED_COLOR_0200
     * @tc.desc: Test ExtendableToggle selectedColor property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableToggleBuiltIn_SelectedColor_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableToggleBuiltIn_SelectedColor_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableToggle_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let selectedColor = obj.getString('selectedColor');
      console.info("[ExtendableToggleBuiltIn_SelectedColor_0200] selectedColor is: " + selectedColor);
      expect(selectedColor).assertEqual('#FF007DFF');
      console.info('[ExtendableToggleBuiltIn_SelectedColor_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableToggleBuiltIn_CustomAttribute_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_TOGGLE_CUSTOM_ATTRIBUTE_0300
     * @tc.desc: Test ExtendableToggle custom newAttribute method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableToggleBuiltIn_CustomAttribute_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableToggleBuiltIn_CustomAttribute_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableToggle_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let width = obj.getString('width');
      let height = obj.getString('height');
      console.info("[ExtendableToggleBuiltIn_CustomAttribute_0300] width is: " + width + ", height is: " + height);
      expect(width).assertEqual('20.00%');
      expect(height).assertEqual('10.00%');
      console.info('[ExtendableToggleBuiltIn_CustomAttribute_0300] END');
      done();
    });

    /**
     * @tc.name: ExtendableToggleBuiltIn_CustomAttribute_0400
     * @tc.number: SUB_ARKUI_EXTENDABLE_TOGGLE_CUSTOM_ATTRIBUTE_0400
     * @tc.desc: Test ExtendableToggle custom newAttribute method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableToggleBuiltIn_CustomAttribute_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableToggleBuiltIn_CustomAttribute_0400] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("ExtendableToggle_001"));
      await (btn?.click() as Promise<void>);
      let strJson: string = inspector.getInspectorByKey('ExtendableToggle_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let isOn = obj.getString('isOn');
      expect(isOn).assertEqual('true');
      console.info('[ExtendableToggleBuiltIn_CustomAttribute_0400] END');
      done();
    });
  });
}