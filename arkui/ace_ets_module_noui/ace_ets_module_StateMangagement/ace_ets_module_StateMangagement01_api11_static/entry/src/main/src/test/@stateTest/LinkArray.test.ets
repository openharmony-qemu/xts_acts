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

export default function LinkArray() {
  describe('LinkArray', () => {
    beforeEach(async (): Promise<void> => {
      console.info("LinkArray beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/@state/LinkArray",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get LinkArray state pages:" + JSON.stringify(pages));
        if (!("LinkArray" == pages.name)) {
          console.info("get LinkArray pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push LinkArray page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push LinkArray page error:" + err);
      }
      console.info("LinkArray beforeEach end");
    });
    
    
/**
     * @tc.number   LinkArray_0100
     * @tc.name     LinkArray_0100
     * @tc.desc     LinkArray_0100
     * @tc.level    Level.LEVEL0
     */
 it('LinkArray_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArray_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArray_state1'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkArray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is [10]');
      console.info('[LinkArray_0100] END');
      done();
    });
    
    
/**
     * @tc.number   LinkArray_0200
     * @tc.name     LinkArray_0200
     * @tc.desc     LinkArray_0200
     * @tc.level    Level.LEVEL0
     */
it('LinkArray_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArray_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArray_state2'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkArray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is [true]');
      console.info('[LinkArray_0100] END');
      done();
    });
    
    
/**
     * @tc.number   LinkArray_0300
     * @tc.name     LinkArray_0300
     * @tc.desc     LinkArray_0300
     * @tc.level    Level.LEVEL0
     */
it('LinkArray_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArray_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArray_state3'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkArray');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Boolean]" number is true');
      console.info('[LinkArray_0100] END');
      done();
    });
    
    
/**
     * @tc.number   LinkArray_0400
     * @tc.name     LinkArray_0400
     * @tc.desc     LinkArray_0400
     * @tc.level    Level.LEVEL0
     */
it('LinkArray_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('LinkArray_0100 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('LinkArray_state4'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('LinkArrayNew');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[LinkArray_0100] component obj is: " + JSON.stringify(obj));
      console.info("[LinkArray_0100] title: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('count type of "[object Array]" number is 200');
      console.info('[LinkArray_0100] END');
      done();
    });

  })
}

