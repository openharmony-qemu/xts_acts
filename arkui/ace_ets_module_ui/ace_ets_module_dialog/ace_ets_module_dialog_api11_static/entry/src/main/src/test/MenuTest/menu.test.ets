'use static';
/**
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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


export default function menu() {
  describe('menu', () => {
    beforeEach(async (): Promise<void> => {
      console.info("menu beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Menu/menu',
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get menu state pages: " + JSON.stringify(pages));
        if (!("menu" == pages.name)) {
          console.info("get menu state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menu success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menu page error: " + err);
      }

    });

    afterEach(async () => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      console.info(" menu after each called");
    });


    
    
/**
     * @tc.number   menu_static_001
     * @tc.name     menu_static_001
     * @tc.desc     menu_static_001
     * @tc.level    Level.LEVEL2
     */
it('menu_static_001', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[menu_static_001] START');

      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      let button: Component | undefined;
      try {
        button = await driver.findComponent(ON.id('button_start_preview'));
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }

      let button1: Component | undefined;
      try {
        button1 = await driver.findComponent(ON.id('button_end_preview'));
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      try {
        await (button1?.click() as Promise<void>);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }


      let strJson1 = inspector.getInspectorByKey('preview_start');
      try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      let obj1 = JSON.parseJsonElement(strJson1);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('10');


      let strJson2 = inspector.getInspectorByKey('preview_end');
      try {
        await CommonFunc.sleep(200);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      let obj2 = JSON.parseJsonElement(strJson2);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('menuTest await err: ' + JSON.stringify(err));
      }
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('20');


      console.info('[menu_static_001] END');
      done();
    });


  })
}

