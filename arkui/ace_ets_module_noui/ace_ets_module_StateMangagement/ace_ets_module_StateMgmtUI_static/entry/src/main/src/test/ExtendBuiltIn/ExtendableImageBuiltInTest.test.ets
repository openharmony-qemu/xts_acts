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
import { ImageFit } from '@kit.ArkUI';
import { AppStorage } from '@ohos.arkui.stateManagement';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';

export default function ExtendableImageBuiltInTest() {
  describe('ExtendableImageBuiltInTest', () => {
    beforeAll(async (): Promise<void> => {
      await UtilsTest.startAbility("com.arkui.ace.StateMgmtUI.static", "EntryAbility")
    })
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableImageBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableImageBuiltIn",
      }
      try {
        const ExtendableImageBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableImageBuiltInTest.clear();
        let pages: router.RouterState = ExtendableImageBuiltInTest.getState();
        console.info("get ExtendableImageBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableImageBuiltIn" == pages.name)) {
          console.info("get ExtendableImageBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableImageBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableImageBuiltInTest page error:" + err);
      }
      console.info("ExtendableImageBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableImageBuiltInTest after each called");
    });

    afterAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExtendableImageBuiltInTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableImageBuiltIn_ObjectFit_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_IMAGE_OBJECTFIT_0100
     * @tc.desc: Test ExtendableImage with objectFit attribute set to ImageFit.TOP_START
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableImageBuiltIn_ObjectFit_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableImageBuiltIn_ObjectFit_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableImage_001');
      await CommonFunc.sleep(1000);
      let objectFit=JSON.parseJsonElement(strJson).getElement('$attrs').getString('objectFit')
      console.info("[ExtendableImageBuiltIn_ObjectFit_0100] objectFit is: " + objectFit);
      expect(objectFit).assertEqual('ImageFit.TOP_START');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableImageBuiltIn_ObjectFit_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableImageBuiltIn_Border_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_IMAGE_BORDER_0200
     * @tc.desc: Test ExtendableImage with border attribute
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableImageBuiltIn_Border_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableImageBuiltIn_Border_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableImage_001');
      await CommonFunc.sleep(1000);
      let borderWidth=JSON.parseJsonElement(strJson).getElement('$attrs').getString('borderWidth')
      console.info("[ExtendableImageBuiltIn_Border_0200] borderWidth is: " + borderWidth);
      expect(borderWidth).assertEqual('2.00vp');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableImageBuiltIn_Border_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableImageBuiltIn_CustomAttribute_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_IMAGE_CUSTOM_ATTRIBUTE_0300
     * @tc.desc: Test ExtendableImage with custom newAttribute method that sets height and margin
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableImageBuiltIn_CustomAttribute_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableImageBuiltIn_CustomAttribute_0300] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableImage_001');
      await CommonFunc.sleep(1000);
      let height=JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')
      console.info("[ExtendableImageBuiltIn_CustomAttribute_0300] height is: " + height);
      expect(height).assertEqual('50.00%');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableImageBuiltIn_CustomAttribute_0300] END');
      done();
    });

    /**
     * @tc.name: ExtendableImageBuiltIn_OverrideWidth_0400
     * @tc.number: SUB_ARKUI_EXTENDABLE_IMAGE_OVERRIDE_WIDTH_0400
     * @tc.desc: Test ExtendableImage with overridden width method that sets width to 100%
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableImageBuiltIn_OverrideWidth_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableImageBuiltIn_OverrideWidth_0400] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableImage_001');
      await CommonFunc.sleep(1000);
      let width=JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')
      console.info("[ExtendableImageBuiltIn_OverrideWidth_0400] width is: " + width);
      expect(width).assertEqual('100.00%');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableImageBuiltIn_OverrideWidth_0400] END');
      done();
    });

    /**
     * @tc.name: ExtendableImageBuiltIn_Overlay_0500
     * @tc.number: SUB_ARKUI_EXTENDABLE_IMAGE_OVERLAY_0500
     * @tc.desc: Test ExtendableImage with overlay attribute
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableImageBuiltIn_Overlay_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableImageBuiltIn_Overlay_0500] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableImage_001');
      await CommonFunc.sleep(1000);
      let overlayText=JSON.parseJsonElement(strJson).getElement('$attrs').getElement('overlay').getString('title')
      console.info("[ExtendableImageBuiltIn_Overlay_0500] overlayText is: " + overlayText);
      expect(overlayText).assertEqual('png');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableImageBuiltIn_Overlay_0500] END');
      done();
    });

    /**
     * @tc.name: ExtendableImageBuiltIn_UndeFined_0600
     * @tc.number: SUB_ARKUI_EXTENDABLE_IMAGE_UNDEFINED_0600
     * @tc.desc: Test ExtendableImage with overlay attribute
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableImageBuiltIn_UndeFined_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableImageBuiltIn_UndeFined_0600] START');
      await CommonFunc.sleep(1000);
      let strJson1: string = inspector.getInspectorByKey('ExtendableImage_001');
      let strJson2: string = inspector.getInspectorByKey('ExtendableImage_002');
      await CommonFunc.sleep(1000);
      let srcUndefined1=JSON.parseJsonElement(strJson1).getElement('$attrs').getString('src')
      let srcUndefined2=JSON.parseJsonElement(strJson2).getElement('$attrs').getString('src')
      expect(srcUndefined1).assertContain('png');
      expect(srcUndefined2).assertEqual('');
      console.info('[ExtendableImageBuiltIn_UndeFined_0600] END');
      done();
    });
  });
}