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

import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import window from '@ohos.window';

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function ActionSheet() {
  describe('ActionSheet', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ActionSheet beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/actionSheet/ActionSheet',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ActionSheet state pages: " + JSON.stringify(pages));
        if (!("ActionSheet" == pages.name)) {
          console.info("get ActionSheet state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ActionSheet success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ActionSheet page error: " + err);
        expect().assertFail();
      }
      // done();
    });


    
    
/**
     * @tc.number   ActionSheet_static_0100
     * @tc.name     ActionSheet_static_0100
     * @tc.desc     ActionSheet_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ActionSheet_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ActionSheet_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      let button: Component | undefined;
      try {
        button = await driver.findComponent(ON.id('ActionSheet'));
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }

      let windowClass: window.Window | undefined = undefined;
      try {
        windowClass = await (window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext) as Promise<window.Window>);
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      if (windowClass) {
        let properties: window.WindowProperties = windowClass.getWindowProperties() as window.WindowProperties;
        console.info("[ActionSheet_static_0100] title: " + JSON.stringify(properties.type));
        expect(properties.type).assertEqual(1) //1鐞涖劎銇氱化鑽ょ埠閸涘﹨顒熺粣妤€褰汿YPE_SYSTEM_ALERT
      }

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ActionSheetTest await err: ' + JSON.stringify(err));
      }
      console.info('[ActionSheet_static_0100] END');
      done();
    });


  })
}
