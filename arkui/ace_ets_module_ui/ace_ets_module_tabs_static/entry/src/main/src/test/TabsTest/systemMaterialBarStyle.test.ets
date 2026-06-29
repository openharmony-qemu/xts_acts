'use static';
/**
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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { Color } from '@ohos.arkui.component'
import uiMaterial from '@ohos.arkui.uiMaterial'
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Driver, ON, MouseButton, Component } from '@ohos.UiTest';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import uiMaterial from '@ohos.arkui.uiMaterial';

export default function systemMaterialBarStyle() {
  describe('systemMaterialBarStyle', () => {

    beforeAll(async (): Promise<void> => {
      console.info("systemMaterialBarStyle beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.tabs.static", "EntryAbility");
      await UtilsTest.msSleep(2000)
    });

    beforeEach(async (): Promise<void> => {
      console.info('systemMaterialBarStyle beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/systemMaterialBarStyle',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get systemMaterialBarStyle state pages:' + JSON.stringify(pages));
        if (!('systemMaterialBarStyle' == pages.name)) {
          console.info('get systemMaterialBarStyle pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push systemMaterialBarStyle page error:' + err);
      }
      console.info('systemMaterialBarStyle beforeEach end');
    });

    /**
     * @tc.name   systemMaterialBarStyle_static_0100
     * @tc.number SUB_ARKUI_TABS_SYSTEMMATERIAL_STATIC_0100
     * @tc.desc   Test Tabs barFloatingStyle with systemMaterial THIN style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_systemMaterial_thin');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      let barWidth = barFloatingStyle.getElement('barWidth');
      console.log('[systemMaterialBarStyle_static_0100] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      expect(barFloatingStyle).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      done();
    });

    /**
     * @tc.name   systemMaterialBarStyle_static_0200
     * @tc.number SUB_ARKUI_TABS_SYSTEMMATERIAL_STATIC_0200
     * @tc.desc   Test Tabs barFloatingStyle with systemMaterial ULTRA_THIN style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_systemMaterial_ultra_thin');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[systemMaterialBarStyle_static_0200] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      expect(barFloatingStyle).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      done();
    });

    /**
     * @tc.name   systemMaterialBarStyle_static_0300
     * @tc.number SUB_ARKUI_TABS_SYSTEMMATERIAL_STATIC_0300
     * @tc.desc   Test Tabs barFloatingStyle with systemMaterial REGULAR style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_systemMaterial_regular');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[systemMaterialBarStyle_static_0300] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      expect(barFloatingStyle).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.REGULAR).assertEqual(2);
      done();
    });

    /**
     * @tc.name   systemMaterialBarStyle_static_0400
     * @tc.number SUB_ARKUI_TABS_SYSTEMMATERIAL_STATIC_0400
     * @tc.desc   Test Tabs barFloatingStyle with adaptToHandedness and THICK style
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_adapt_systemMaterial_true');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      console.log('[systemMaterialBarStyle_static_0400] barFloatingStyle: ' + JSON.stringify(barFloatingStyle))
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      expect(barFloatingStyle).not().assertEqual(undefined);
      expect(barFloatingStyle.getBoolean('adaptToHandedness')).assertEqual(true);
      expect(uiMaterial.ImmersiveStyle.THICK).assertEqual(3);
      done();
    });

    /**
     * @tc.name   systemMaterialBarStyle_static_0500
     * @tc.number SUB_ARKUI_TABS_SYSTEMMATERIAL_STATIC_0500
     * @tc.desc   Test Tabs barFloatingStyle with systemMaterial ULTRA_THICK and barWidth
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let driver = Driver.create();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('tabs_systemMaterial_barWidth');
      let obj = JSON.parseJsonElement(strJson);
      let barFloatingStyle = obj.getElement('$attrs').getElement('barFloatingStyle');
      let barWidth = barFloatingStyle.getElement('barWidth');
      console.log('[systemMaterialBarStyle_static_0500] barWidth: ' + JSON.stringify(barWidth))
      expect(obj.getElement('$attrs').getString('barPosition')).assertEqual('BarPosition.End');
      expect(barFloatingStyle).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THICK).assertEqual(4);
      done();
    });
  })
}