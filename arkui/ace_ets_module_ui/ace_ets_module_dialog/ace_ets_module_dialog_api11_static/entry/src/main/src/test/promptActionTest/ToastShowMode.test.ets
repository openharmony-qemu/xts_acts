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
import {
  describe,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';


export default function ToastShowMode() {
  describe('ToastShowMode', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ToastShowMode beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/ToastShowMode',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get ToastShowMode state pages: " + JSON.stringify(pages));
        if (!("ToastShowMode" == pages.name)) {
          console.info("get ToastShowMode state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ToastShowMode success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ToastShowMode page error: " + err);
        expect().assertFail();
      }

    });


    
    
/**
     * @tc.number   ToastShowMode_static_0100
     * @tc.name     ToastShowMode_static_0100
     * @tc.desc     ToastShowMode_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ToastShowMode_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ToastShowMode_static_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      let button;
      try {
        button = await driver.findComponent(ON.id('ShowMode_p1'));
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>)
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('mess_mode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToastShowMode_static_0100] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("label")).assertEqual('Message DEFAULT');
      console.info('[ToastShowMode_static_0100] END');
      done();
    });


    
    
/**
     * @tc.number   ToastShowMode_static_0200
     * @tc.name     ToastShowMode_static_0200
     * @tc.desc     ToastShowMode_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ToastShowMode_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ToastShowMode_static_0200 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      let button;
      try {
        button = await driver.findComponent(ON.id('ShowMode_p2'));
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>)
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ToastShowModeTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('mess_mode');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ToastShowMode_static_0200] component obj is: " + JSON.stringify(obj));
      expect(obj.getElement('$attrs').getString("label")).assertEqual('Message TOP_MOST');
      console.info('[ToastShowMode_static_0200] END');
      done();
    });

  })
}
