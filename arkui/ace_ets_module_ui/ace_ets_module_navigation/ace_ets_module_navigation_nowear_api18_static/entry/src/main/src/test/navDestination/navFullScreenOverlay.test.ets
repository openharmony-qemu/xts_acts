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
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
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

export default function navFullScreenOverlay() {
  describe('navFullScreenOverlay', () => {
    beforeAll(async (): Promise<void> => {
      console.info("navFullScreenOverlay beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.navigationnowear18.static", "EntryAbility")
    });

    beforeEach(async (): Promise<void> => {
      console.info('navFullScreenOverlay beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/navDestination/navFullScreenOverlay',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('get navFullScreenOverlay state pages:' + JSON.stringify(pages));
        if (!('navFullScreenOverlay' == pages.name)) {
          console.info('get navFullScreenOverlay pages.name:' + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error('push navFullScreenOverlay page error:' + err);
      }
      console.info('navFullScreenOverlay beforeEach end');
    });

    /**
     * @tc.name   navFullScreenOverlay_static_0100
     * @tc.number SUB_ARKUI_NAVDESTINATION_FULLSCREENOVERLAY_STATIC_0100
     * @tc.desc   Test NavDestination fullScreenOverlay property with true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navFullScreenOverlay_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navFullScreenOverlay_static_0100] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('fullOverTrue_1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navDestination_full_true');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navFullScreenOverlay_static_0100] fullScreenOverlay: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('fullScreenOverlay')));
      expect(obj.getElement('$attrs').getBoolean('fullScreenOverlay')).assertEqual(true);
      console.info('[navFullScreenOverlay_static_0100] END');
      done();
    });

    /**
     * @tc.name   navFullScreenOverlay_static_0200
     * @tc.number SUB_ARKUI_NAVDESTINATION_FULLSCREENOVERLAY_STATIC_0200
     * @tc.desc   Test NavDestination fullScreenOverlay property with false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navFullScreenOverlay_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navFullScreenOverlay_static_0200] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('fullOverFalse'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navDestination_full_false');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navFullScreenOverlay_static_0200] fullScreenOverlay: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('fullScreenOverlay')));
      expect(obj.getElement('$attrs').getBoolean('fullScreenOverlay')).assertEqual(false);
      console.info('[navFullScreenOverlay_static_0200] END');
      done();
    });

    /**
     * @tc.name   navFullScreenOverlay_static_0300
     * @tc.number SUB_ARKUI_SIDEBARCONTAINER_navFullScreenOverlay_static_0300
     * @tc.desc   Test NavDestination fullScreenOverlay property with undefined, should restore to default value (false)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navFullScreenOverlay_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[navFullScreenOverlay_static_0300] START');
      let driver: Driver = Driver.create()
      await CommonFunc.sleep(1000);
      let btn1 = await driver.findComponent(ON.id('fullOverUndefined_1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('navDestination_full_undefined');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[navFullScreenOverlay_static_0300] fullScreenOverlay: " +
        JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs').getBoolean('fullScreenOverlay')));
      expect(obj.getElement('$attrs').getBoolean('fullScreenOverlay')).assertEqual(false);
      console.info('[navFullScreenOverlay_static_0300] END');
      done();
    });
  });
}