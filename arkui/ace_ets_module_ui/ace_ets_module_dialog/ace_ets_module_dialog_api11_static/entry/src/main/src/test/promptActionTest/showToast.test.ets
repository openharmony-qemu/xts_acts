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
import {
  describe,
  beforeEach,
  afterEach,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import window from '@ohos.window';

let abilityStage = AppStorage.get<common.BaseContext>("abilityContext")


export default function showToast() {
  describe('showToast', () => {

    beforeEach(async (): Promise<void> => {
      console.info("showToast beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/showToast',
      }
      try {
        const showToast = AppStorage.get<Router>("router") as Router
        showToast.clear();
        let pages: router.RouterState = showToast.getState();
        console.info("get showToast state pages: " + JSON.stringify(pages));
        if (!("showToast" == pages.name)) {
          console.info("get showToast state pages.name: " + JSON.stringify(pages.name));
          // let result = await showToast.pushUrl(options);
          showToast.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push showToast success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push showToast page error: " + err);
        expect().assertFail();
      }
    });


    
    
/**
     * @tc.number   showToast_static_0100
     * @tc.name     showToast_static_0100
     * @tc.desc     showToast_static_0100
     * @tc.level    Level.LEVEL2
     */
it('showToast_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('showToast_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      let button: Component | undefined;
      try {
        button = await driver.findComponent(ON.id('showToast'));
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }

      let windowClass: window.Window | undefined = undefined;
      try {
        windowClass = await (window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext) as Promise<window.Window>);
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      if (windowClass) {
        let properties: window.WindowProperties = windowClass.getWindowProperties() as window.WindowProperties;
        console.info("[showToast_static_0100] title: " + JSON.stringify(properties.type));
        expect(properties.type).assertEqual(1) //1鐞涖劎銇氱化鑽ょ埠閸涘﹨顒熺粣妤€褰汿YPE_SYSTEM_ALERT
      }

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('showToastTest await err: ' + JSON.stringify(err));
      }
      console.info('[showToast_static_0100] END');
      done();
    });


  })
}
