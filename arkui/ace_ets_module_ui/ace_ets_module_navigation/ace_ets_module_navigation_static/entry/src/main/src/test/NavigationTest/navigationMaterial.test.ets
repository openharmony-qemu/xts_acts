'use static';
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

export default function navigationMaterial() {
  describe('navigationMaterial', () => {
    beforeAll(async (): Promise<void> => {
      console.info('navigationMaterial beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.navigation.static', 'EntryAbility');
    });

    beforeEach(async (): Promise<void> => {
      console.info('navigationMaterial beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/navigationMaterial',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get navigationMaterial state pages:' + JSON.stringify(pages));
        if (!('navigationMaterial' == pages.name)) {
          console.info('get navigationMaterial pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2500);
        }
      } catch (err) {
        console.error('push navigationMaterial page error:' + err);
      }
      console.info('navigationMaterial beforeEach end');
    });

    /**
     * @tc.name   navigationMaterial_static_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SYSTEMMATERIAL_PARAM_0100
     * @tc.desc   test Navigation systemMaterial set uiMaterial.ImmersiveStyle.ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationMaterial_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navigationMaterial_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navigation_systemMaterial_1');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navigationMaterial_static_0100] mode: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getString('mode')));
      expect(obj.getElement('$attrs').getString('mode')).assertEqual('NavigationMode.AUTO_WITH_ASPECT_RATIO');
      console.info('[navigationMaterial_static_0100] END');
      done();
    });
  });
}