'use static'
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import { NavPathInfo, NavigationDividerStyle, ScrollEffectType } from '@ohos.arkui.component';

export default function NavScrollEffectOptions() {
  describe('NavScrollEffectOptions', () => {
    beforeAll(async (): Promise<void> => {
      console.info('NavScrollEffectOptions beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('NavScrollEffectOptions beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavScrollEffectOptions',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get NavScrollEffectOptions state pages:' + JSON.stringify(pages));
        if (!('NavScrollEffectOptions' == pages.name)) {
          console.info('get NavScrollEffectOptions pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push NavScrollEffectOptions page error:' + err);
      }
      console.info('NavScrollEffectOptions beforeEach end');
    });

    /**
     * @tc.name   navigationScrollEffectOptions_static_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_STATIC_0100
     * @tc.desc   Test Navigation scrollEffectOptions property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationScrollEffectOptions_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation_scrollEffectOptions_default');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigationScrollEffectOptions_static_0100] title: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('title')));
      console.info("[navigationScrollEffectOptions_static_0100] scrollEffectOptions: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('scrollEffectOptions')));
      expect(obj.getElement('$attrs').getString('title')).assertEqual('Title');
      expect(obj.getElement('$attrs').tryGetElement('scrollEffectOptions')).assertUndefined();
      console.info('[navigationScrollEffectOptions_static_0100] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_static_0200
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_STATIC_0200
     * @tc.desc   Test Navigation scrollEffectOptions property with scrollEffectType COMMON_BLUR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationScrollEffectOptions_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation_scrollEffectOptions_common_blur');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigationScrollEffectOptions_static_0200] title: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('title')));
      console.info("[navigationScrollEffectOptions_static_0200] scrollEffectOptions: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('scrollEffectOptions')));
      expect(obj.getElement('$attrs').getString('title')).assertEqual('COMMON_BLUR');
      expect(ScrollEffectType.COMMON_BLUR).assertEqual(0);
      console.info('[navigationScrollEffectOptions_static_0200] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_static_0300
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_STATIC_0300
     * @tc.desc   Test Navigation scrollEffectOptions property with scrollEffectType GRADUAL_BLUR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationScrollEffectOptions_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation_scrollEffectOptions_gradual_blur');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigationScrollEffectOptions_static_0300] title: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('title')));
      console.info("[navigationScrollEffectOptions_static_0300] scrollEffectOptions: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('scrollEffectOptions')));
      expect(obj.getElement('$attrs').getString('title')).assertEqual('GRADUAL_BLUR');
      expect(ScrollEffectType.GRADUAL_BLUR).assertEqual(1);
      console.info('[navigationScrollEffectOptions_static_0300] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_static_0400
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_STATIC_0400
     * @tc.desc   Test Navigation scrollEffectOptions scrollEffectType property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationScrollEffectOptions_static_0400] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation_scrollEffectOptions_scrollEffectType_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigationScrollEffectOptions_static_0300] title: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('title')));
      console.info("[navigationScrollEffectOptions_static_0300] scrollEffectOptions: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('scrollEffectOptions')));
      expect(obj.getElement('$attrs').getString('title')).assertEqual('Type undefined');
      console.info('[navigationScrollEffectOptions_static_0400] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_static_0500
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_STATIC_0500
     * @tc.desc   Test Navigation scrollEffectOptions property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationScrollEffectOptions_static_0500] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation_scrollEffectOptions_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigationScrollEffectOptions_static_0300] title: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('title')));
      console.info("[navigationScrollEffectOptions_static_0300] scrollEffectOptions: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').tryGetElement('scrollEffectOptions')));
      expect(obj.getElement('$attrs').getString('title')).assertEqual('undefined');
      console.info('[navigationScrollEffectOptions_static_0500] END');
      done();
    });
  });
}