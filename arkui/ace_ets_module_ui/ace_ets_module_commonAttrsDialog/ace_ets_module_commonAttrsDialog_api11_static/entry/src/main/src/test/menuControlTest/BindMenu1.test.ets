'use static';
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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import common from '@ohos.app.ability.common';

export default function bindMenu() {
  describe('bindMenu', () => {
    beforeEach(async (): Promise<void> => {
      console.info("bindMenu beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/menuControl/BindMenu1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindMenu state pages:" + JSON.stringify(pages));
        if (!("BindMenu1" == pages.name)) {
          console.info("get bindMenu pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindMenu page error:" + err);
      }
      console.info("bindMenu beforeEach end");
    });

        
    
    /**
     * @tc.number   bindMenu_static_0100
     * @tc.name     bindMenu_static_0100
     * @tc.desc     bindMenu_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindMenu_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindMenu_0100 START');
      let abilityStage=AppStorage.get<common.BaseContext>("abilityContext")
      let driver =  Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindMenu_0100 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('bindMenu'));
       try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('bindMenu_0100 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindMenu_0100 sleep err: ' + JSON.stringify(err));
      }

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(abilityStage as common.BaseContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[bindMenu_0100] title: " + JSON.stringify(properties.type));

      let density = await driver.getDisplayDensity();
      console.log("[bindMenu_0100] density: " + JSON.stringify(density))
      console.log("[bindMenu_0100] density.x: " + JSON.stringify(density.x))
      expect(properties.type == 1 || properties.type == 0).assertTrue()

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindMenu_0100 sleep err: ' + JSON.stringify(err));
      }
       driver?.click(2, 2);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindMenu_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info('[bindMenu_0100] END');
      done();
    });
  })
}

