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
import { describe,beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function barBackground() {
  describe('barBackground', () => {
    beforeAll(() => {
      console.info("barBackground beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.scroll18.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("barBackground beforeEach start");
      const barBackground = AppStorage.get<Router>("router",Type.from<Router>()) as Router
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Tabs/barBackground",
      }
      try {
        barBackground.clear();
        let pages = barBackground.getState();
        console.info("get barBackground state pages:" + JSON.stringify(pages));
        if (!("barBackground" == pages.name)) {
          console.info("get barBackground pages.name:" + JSON.stringify(pages.name));
          let result = await barBackground.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push barBackground page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push barBackground page error:" + err);
      }
      console.info("barBackground beforeEach end");
    });

    /**
     * @tc.number    barBackground_static_001
     * @tc.name      barBackground_static_0100
     * @tc.desc      Provide TabBar with a blurring ability between background and content.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barBackground_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barBackground_static_0100] START');
      let strJson = inspector.getInspectorByKey('tabs_bar_back_style');
      console.info("[barBackground_static_0100] component obj1 is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      console.info("[barBackground_static_0100] barBackgroundBlurStyle: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barBackgroundBlurStyle')));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('barBackgroundBlurStyle')).assertEqual("BlurStyle.COMPONENT_THICK");
      console.info('[barBackground_static_0100] END');
      done();
    });

    /**
     * @tc.number    barBackground_static_002
     * @tc.name      barBackground_static_0200
     * @tc.desc      Get TabBar background properties.
     * @tc.level     Level 0
     * @tc.type
     * @tc.size
     */
    it('barBackground_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[barBackground_static_0200] START');
      let strJson = inspector.getInspectorByKey('tabs_bar_back_effect');
      console.info("[barBackEffect_0100] component obj is: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      console.info("[barBackEffect_0100] barBackgroundEffect: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect')));
      console.info("[barBackEffect_0100] radius: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('radius')));
      console.info("[barBackEffect_0100] saturation: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('saturation')));
      console.info("[barBackEffect_0100] brightness: " + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('brightness')));
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('radius')).assertEqual(20);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('saturation')).assertEqual(15);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('brightness')).assertEqual(0.6);
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('color')).assertEqual("#8044A4B5");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('adaptiveColor')).assertEqual("AdaptiveColor.Default");
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('barBackgroundEffect').getString('inactiveColor')).assertEqual("#FFFF0000");
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('barBackgroundEffect')
        .getString('policy')).assertEqual("BlurStyleActivePolicy.ALWAYS_ACTIVE");
      expect(JSON.parseJsonElement(strJson)
        .getElement('$attrs')
        .getElement('barBackgroundEffect')
        .getString('blurOption')).assertEqual("[20.000000,20.000000]");
      console.info('[barBackground_static_0200] END');
      done();
    });

  })
}
