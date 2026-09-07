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
import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/common/MessageManager';
import accessibility from '@ohos.accessibility';
import inspector from '@ohos.arkui.inspector';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function touchPoint() {
  describe('touchPoint', () => {
    beforeEach(async (): Promise<void> => {
      console.info("touchPoint beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DragController/touchPoint_Auto',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get touchPoint state pages:" + JSON.stringify(pages));
        if (!("touchPoint" == pages.name)) {
          console.info("get touchPoint pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push touchPoint page error:" + err);
      }
      console.info("touchPoint beforeEach end");
    });


    
    /**
     * @tc.number   touchPoint_static_0100
     * @tc.name     touchPoint_static_0100
     * @tc.desc     touchPoint_static_0100
     * @tc.level    Level.LEVEL0
     */
it('touchPoint_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('touchPoint_0100 START');
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('Mul_id'))!;
      let text: Component | null = await driver.findComponent(ON.id('Info_id'))!;
      await (button?.dragTo(text!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Info_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[touchPoint_0100] component obj is: " + JSON.stringify(obj));
      console.info("[touchPoint_0100] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{"x":20,"y":20}');
      console.info('[touchPoint_0100] END');
      done();
    });


    
    /**
     * @tc.number   touchPoint_static_0200
     * @tc.name     touchPoint_static_0200
     * @tc.desc     touchPoint_static_0200
     * @tc.level    Level.LEVEL0
     */
it('touchPoint_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('touchPoint_0200 START');
      let driver: Driver = Driver.create();
      let button: Component | null = await driver.findComponent(ON.id('Mul_id'))!;
      let text: Component | null = await driver.findComponent(ON.id('Info_id'))!;
      await (button?.dragTo(text!) as Promise<void>);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Auto_id');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[touchPoint_0200] component obj is: " + JSON.stringify(obj));
      console.info("[touchPoint_0200] title: " + obj.getElement('$attrs').getString('content'));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('{"mode":1}');
      console.info('[touchPoint_0200] END');
      done();
    });
  })
}

