'use static';
/*
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
import { describe, expect, beforeEach, afterEach, afterAll, it, Level } from '../../../../hypium/index';
import { Component, Driver, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function LinkColor() {
  describe('LinkColor', () => {
    beforeEach(async (): Promise<void> => {
      console.info("LinkColor beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/@state/LinkColor",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LinkColor state pages:" + JSON.stringify(pages));
        if (!("LinkColor" == pages.name)) {
          console.info("get LinkColor pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LinkColor page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkColor page error:" + err);
      }
      console.info("LinkColor beforeEach end");
    });
    
    
/**
     * @tc.number   LinkColor_0100
     * @tc.name     LinkColor_0100
     * @tc.desc     LinkColor_0100
     * @tc.level    Level.LEVEL0
     */
it('LinkColor_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkColor_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkColor001'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkColor001');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkColor_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFFFA500');
      console.info('[LinkColor_0100] END');
      done();
    });


    
    
/**
     * @tc.number   LinkColor_0200
     * @tc.name     LinkColor_0200
     * @tc.desc     LinkColor_0200
     * @tc.level    Level.LEVEL0
     */
it('LinkColor_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkColor_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkColor002'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkColor002');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkColor_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF0000FF');
      console.info('[LinkColor_0100] END');
      done();
    });
    
    
/**
     * @tc.number   LinkColor_0300
     * @tc.name     LinkColor_0300
     * @tc.desc     LinkColor_0300
     * @tc.level    Level.LEVEL0
     */
it('LinkColor_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkColor_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkColor003'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkColor');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkColor_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Undefined]" number is ');
      console.info('[LinkColor_0100] END');
      done();
    });
    
    
/**
     * @tc.number   LinkColor_0400
     * @tc.name     LinkColor_0400
     * @tc.desc     LinkColor_0400
     * @tc.level    Level.LEVEL0
     */
it('LinkColor_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkColor_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkColor004'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkColor004');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkColor_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FFA52A2A');
      console.info('[LinkColor_0100] END');
      done();
    });

    
    
/**
     * @tc.number   LinkColor_0500
     * @tc.name     LinkColor_0500
     * @tc.desc     LinkColor_0500
     * @tc.level    Level.LEVEL0
     */
// it('LinkColor_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
//       console.info('LinkColor_0100 START');
//       let driver = Driver.create()
//       await CommonFunc.sleep(1000);
//       let button = await driver.findComponent(ON.id('state5'));
//       await (button?.click() as Promise<void>);
//       await CommonFunc.sleep(1000);
//       let strJson = inspector.getInspectorByKey('LinkColor');
//       let obj = JSON.parseJsonElement(strJson);
//       console.info("[LinkColor_0100] component obj is: " + JSON.stringify(obj));
//       console.info("[LinkColor_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
//       expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Null]" number is null');
//       console.info('[LinkColor_0100] END');
//       done();
//     });


    
    
/**
     * @tc.number   LinkColor_0600
     * @tc.name     LinkColor_0600
     * @tc.desc     LinkColor_0600
     * @tc.level    Level.LEVEL0
     */
it('LinkColor_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkColor_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkColor006'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkColor006');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkColor_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkColor_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('backgroundColor')));
      expect(obj.getElement('$attrs').getString('backgroundColor')).assertEqual('#FF008000');
      console.info('[LinkColor_0100] END');
      done();
    });

  })
}

