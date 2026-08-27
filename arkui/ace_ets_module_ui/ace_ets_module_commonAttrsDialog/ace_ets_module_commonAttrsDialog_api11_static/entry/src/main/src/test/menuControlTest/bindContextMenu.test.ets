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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';

export default function bindContextMenu() {
  describe('bindContextMenu', () => {
    beforeEach(async (): Promise<void> => {
      console.info("bindContextMenu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/menuControl/bindContextMenu',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get bindContextMenu state pages:" + JSON.stringify(pages));
        if (!("bindContextMenu" == pages.name)) {
          console.info("get bindContextMenu pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push bindContextMenu page error:" + err);
      }
      console.info("bindContextMenu beforeEach end");
    });

    
    
    /**
     * @tc.number   bindContextMenu_static_0100
     * @tc.name     bindContextMenu_static_0100
     * @tc.desc     bindContextMenu_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindContextMenu_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('bindContextMenu_0100 START');
      let abilityContext = AppStorage.get<common.BaseContext>("abilityContext")
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindContextMenu_0100 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('bindContextMenu'));
      button?.longClick();
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindContextMenu_0100 sleep err: ' + JSON.stringify(err));
      }

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(abilityContext as common.BaseContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[bindContextMenu_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(0) //0表示应用子窗口TYPE_APP

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindContextMenu_0100 sleep err: ' + JSON.stringify(err));
      }
      driver?.click(2, 2);
      try {
        await CommonFunc.sleep(3000);
      } catch (err) {
        console.info('bindContextMenu_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info('[bindContextMenu_0100] END');
      done();
    });
  })
}

