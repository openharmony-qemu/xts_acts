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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import common from '@ohos.app.ability.common';
import { UIContext, Router, Context } from '@ohos.arkui.UIContext';



export default function showActionMenuFalse() {
  describe('showActionMenuFalse', () => {
    beforeAll(() => {
      console.info("showActionMenuFalse beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("showActionMenuFalse beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showActionMenuFalse',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get showActionMenuFalse state pages:" + JSON.stringify(pages));
        if (!("showActionMenuFalse" == pages.name)) {
          console.info("get showActionMenuFalse pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showActionMenuFalse page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showActionMenuFalse page error:" + err);
      }
      console.info("showActionMenuFalse beforeEach end");
    });


    /**
     * @tc.number    SUB_ACE_showActionMenuFalse_0100
     * @tc.name      showActionMenuFalse_static_0100
     * @tc.desc      set api
     * @tc.level:    Level 2
     * @tc.type :
     * @tc.size :
     */
    it('showActionMenuFalse_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {
      console.info('showActionMenuFalse_static_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('showActionMenuFalse'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let windowClass: window.Window | undefined = undefined;
      const abilityContext: Context | undefined = AppStorage.get<Context>("ctx")
      windowClass = await window.getLastWindow(abilityContext as common.BaseContext);
      // windowClass = await window.getLastWindow(globalThis.abilityContext);
      let properties: window.WindowProperties = windowClass.getWindowProperties();
      console.info("[showActionMenuFalse_static_0100] title: " + JSON.stringify(properties.type));
      expect(properties.type).assertEqual(1)//1表示系统告警窗口TYPE_SYSTEM_ALERT

      await CommonFunc.sleep(1000);
      await driver.triggerKey(2070)
      await CommonFunc.sleep(1000);
      console.info('[showActionMenuFalse_static_0100] END');
      done();
    });


  })
}

