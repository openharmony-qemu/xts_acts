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

export default function ExtendableTextBuiltInTest() {
  describe('ExtendableTextBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMgmtUI.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableTextBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableTextBuiltIn",
      }
      try {
        const ExtendableTextBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableTextBuiltInTest.clear();
        let pages: router.RouterState = ExtendableTextBuiltInTest.getState();
        console.info("get ExtendableTextBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableTextBuiltIn" == pages.name)) {
          console.info("get ExtendableTextBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableTextBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableTextBuiltInTest page error:" + err);
      }
      console.info("ExtendableTextBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableTextBuiltInTest after each called");
    });

    afterAll(async () => {
      console.info('ExtendableTextBuiltInTest afterAll: all tests finished');
    });

    /**
     * @tc.name: ExtendableTextBuiltIn_Content_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_TEXT_CONTENT_0100
     * @tc.desc: Test ExtendableText displays correct content
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableTextBuiltIn_Content_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableTextBuiltIn_Content_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableText_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      console.info("[ExtendableTextBuiltIn_Content_0100] content is: " + content);
      expect(content).assertEqual('Hello World');
      console.info('[ExtendableTextBuiltIn_Content_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableTextBuiltIn_FontSize_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_TEXT_FONT_SIZE_0200
     * @tc.desc: Test ExtendableText fontSize property
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableTextBuiltIn_FontSize_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableTextBuiltIn_FontSize_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableText_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let fontSize = obj.getString('fontSize');
      console.info("[ExtendableTextBuiltIn_FontSize_0200] fontSize is: " + fontSize);
      expect(fontSize).assertEqual('50.00fp');
      console.info('[ExtendableTextBuiltIn_FontSize_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableTextBuiltIn_CustomAttribute_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_TEXT_CUSTOM_ATTRIBUTE_0300
     * @tc.desc: Test ExtendableText custom newAttribute method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableTextBuiltIn_CustomAttribute_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableTextBuiltIn_CustomAttribute_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableText_001');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let width = obj.getString('width');
      let height = obj.getString('height');
      console.info("[ExtendableTextBuiltIn_CustomAttribute_0300] width is: " + width + ", height is: " + height);
      expect(width).assertEqual('50.00%');
      expect(height).assertEqual('50.00%');
      console.info('[ExtendableTextBuiltIn_CustomAttribute_0300] END');
      done();
    });

    /**
     * @tc.name: ExtendableTextBuiltIn_OverrideWidth_0400
     * @tc.number: SUB_ARKUI_EXTENDABLE_TEXT_OVERRIDE_WIDTH_0400
     * @tc.desc: Test ExtendableText with overridden width method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableTextBuiltIn_OverrideWidth_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableTextBuiltIn_OverrideWidth_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableText_002');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let width = obj.getString('width');
      console.info("[ExtendableTextBuiltIn_OverrideWidth_0400] width is: " + width);
      expect(width).assertEqual('40.00%');
      console.info('[ExtendableTextBuiltIn_OverrideWidth_0400] END');
      done();
    });

    /**
     * @tc.name: ExtendableTextBuiltIn_Undefined_0500
     * @tc.number: SUB_ARKUI_EXTENDABLE_TEXT_UNDEFINED_0500
     * @tc.desc: Test ExtendableText with overridden width method
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableTextBuiltIn_Undefined_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableTextBuiltIn_Undefined_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableText_003');
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(strJson).getElement('$attrs');
      let content = obj.getString('content');
      expect(content).assertEqual('');
      console.info('[ExtendableTextBuiltIn_Undefined_0500] END');
      done();
    });
  });
}