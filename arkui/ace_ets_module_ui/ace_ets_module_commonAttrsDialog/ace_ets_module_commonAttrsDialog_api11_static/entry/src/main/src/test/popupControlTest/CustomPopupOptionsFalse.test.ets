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
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';

export default function CustomPopupOptionsFalse() {
  describe('CustomPopupOptionsFalse', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CustomPopupOptionsFalse beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/popupControl/CustomPopupOptionsFalse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomPopupOptionsFalse state pages:" + JSON.stringify(pages));
        if (!("CustomPopupOptionsFalse" == pages.name)) {
          console.info("get CustomPopupOptionsFalse pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomPopupOptionsFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomPopupOptionsFalse page error:" + err);
      }
      console.info("CustomPopupOptionsFalse beforeEach end");
    });


    
    
    /**
     * @tc.number   CustomPopupOptionsFalse_static_0100
     * @tc.name     CustomPopupOptionsFalse_static_0100
     * @tc.desc     CustomPopupOptionsFalse_static_0100
     * @tc.level    Level.LEVEL0
     */
it('CustomPopupOptionsFalse_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsFalse_0100 START');
      let abilityContext = AppStorage.get<common.BaseContext>("abilityContext")
      let driver =  Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomPopupOptionsFalse_0100 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('CustomPopupOptionsFalse'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('CustomPopupOptionsFalse_0100 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomPopupOptionsFalse_0100 sleep err: ' + JSON.stringify(err));
      }

      let windowClass: window.Window | undefined = undefined;
      windowClass = await window.getLastWindow(abilityContext as common.BaseContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[CustomPopupOptionsFalse_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1) //1表示系统告警窗口TYPE_SYSTEM_ALERT

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomPopupOptionsFalse_0100 sleep err: ' + JSON.stringify(err));
      }
       driver?.click(2, 2);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomPopupOptionsFalse_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info('[CustomPopupOptionsFalse_0100] END');
      done();
    });
  })
}

