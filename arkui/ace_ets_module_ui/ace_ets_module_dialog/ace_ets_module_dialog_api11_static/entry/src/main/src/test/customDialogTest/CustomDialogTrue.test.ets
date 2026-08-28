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
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
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
import common from '@ohos.app.ability.common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function CustomDialogTrue() {
  describe('CustomDialogTrue', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CustomDialogTrue beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/customDialog/CustomDialogTrue',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get CustomDialogTrue state pages: " + JSON.stringify(pages));
        if (!("CustomDialogTrue2" == pages.name)) {
          console.info("get CustomDialogTrue state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomDialogTrue success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogTrue page error: " + err);
        expect().assertFail();
      }

    });


    
    
/**
     * @tc.number   CustomDialogTrue_static_0100
     * @tc.name     CustomDialogTrue_static_0100
     * @tc.desc     CustomDialogTrue_static_0100
     * @tc.level    Level.LEVEL2
     */
it('CustomDialogTrue_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomDialogTrue_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      let button: Component | undefined;
      try {
        button = await driver.findComponent(ON.id('CustomDialogTrue'));
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>)
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }

      let windowClass: window.Window | undefined = undefined;
      try {
        windowClass = await (window.getLastWindow(AppStorage.get<common.BaseContext>('abilityContext') as common.BaseContext) as Promise<window.Window>);
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      ;
      if (windowClass) {
        let properties: window.WindowProperties = windowClass.getWindowProperties() as window.WindowProperties;
        console.info("[CustomDialogTrue_static_0100] title: " + JSON.stringify(properties.type));
        expect(properties.type).assertEqual(0) //0鐞涖劎銇氭惔鏃傛暏鐎涙劗鐛ラ崣顤歒PE_APP
      }

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      try {
        await driver.triggerKey(2070)
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogTrueTest await err: ' + JSON.stringify(err));
      }
      console.info('[CustomDialogTrue_static_0100] END');
      done();
    });


  })
}
