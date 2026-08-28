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


export default function promptTest() {

  describe('promptTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("promptTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/promptAction/prompt',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get promptTest state pages: " + JSON.stringify(pages));
        if (!("prompt" == pages.name)) {
          console.info("get promptTest state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push promptTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push promptTest page error: " + err);
        expect().assertFail();
      }

    });


    
    
/**
     * @tc.number   promptTest_static_0100
     * @tc.name     promptTest_static_0100
     * @tc.desc     promptTest_static_0100
     * @tc.level    Level.LEVEL2
     */
it('promptTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('promptTest_static_0100 START');
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      let button: Component | null;
      try {
        button = await driver.findComponent(ON.id('prompt' + '_3'));
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>)
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      let strJson1 = inspector.getInspectorByKey('prompt' + '_2');
      let obj1 = JSON.parseJsonElement(strJson1);
      expect(obj1.getElement('$attrs').getString("label")).assertEqual('确认');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      let button1: Component | null;
      try {
        button1 = await driver.findComponent(ON.id('prompt' + '_2'));
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>)
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('promptTestTest await err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('prompt' + '_3');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[promptTest_static_0100] component obj is: " + JSON.stringify(obj));
      console.info("[promptTest_static_0100] component obj.$attrs is: " + JSON.stringify(obj.getElement('$attrs')));
      // console.info("[promptTest_static_0100] text: " + JSON.stringify(obj.getElement('$attrs').getString("label")));
      expect(obj.getElement('$attrs').getString("content")).assertEqual('Hello World');
      console.info('[promptTest_static_0100] END');
      done();
    });
  })
}
