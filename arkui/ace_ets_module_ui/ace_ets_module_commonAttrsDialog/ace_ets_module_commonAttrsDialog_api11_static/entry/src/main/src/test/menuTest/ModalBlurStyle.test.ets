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
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import window from '@ohos.window';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function ModalBlurStyle() {
  describe('ModalBlurStyle', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ModalBlurStyle beforeEach start");
      let options: router.RouterOptions = {
        url:'MainAbility/pages/menu/ModalBlurStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ModalBlurStyle state pages:" + JSON.stringify(pages));
        if (!("ModalBlurStyle" == pages.name)) {
          console.info("get ModalBlurStyle pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ModalBlurStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ModalBlurStyle page error:" + err);
      }
      console.info("ModalBlurStyle beforeEach end");
    });


    afterEach(async () => {
      let driver = Driver.create();
      try {
        await CommonFunc.sleep(500);
      } catch (err) {
        console.info('ModalBlurStyle afterEach sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('blurStyle_init'));
       try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ModalBlurStyle afterEach click err: ' + JSON.stringify(err));
      }
      console.log('reset button click succ')
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle afterEach sleep err: ' + JSON.stringify(err));
      }
    });
    
    
    /**
     * @tc.number   ModalBlurStyle_static_0100
     * @tc.name     ModalBlurStyle_static_0100
     * @tc.desc     ModalBlurStyle_static_0100
     * @tc.level    Level.LEVEL0
     */
it('ModalBlurStyle_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0100 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0100 sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0100 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('blurStyle_1'));
       try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ModalBlurStyle_0100 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0100 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('blurStyle_1');

      console.info("[ModalBlurStyle_0100] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 1');
      console.info('[ModalBlurStyle_0100] END');
      done();
    });
    
    
    /**
     * @tc.number   ModalBlurStyle_static_0200
     * @tc.name     ModalBlurStyle_static_0200
     * @tc.desc     ModalBlurStyle_static_0200
     * @tc.level    Level.LEVEL0
     */
it('ModalBlurStyle_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0200 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0200 sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0200 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('blurStyle_2'));
       try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ModalBlurStyle_0200 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0200 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('blurStyle_2');
      console.info("[ModalBlurStyle_0200] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 2');
      console.info('[ModalBlurStyle_0200] END');
      done();
    });
    
    
    /**
     * @tc.number   ModalBlurStyle_static_0300
     * @tc.name     ModalBlurStyle_static_0300
     * @tc.desc     ModalBlurStyle_static_0300
     * @tc.level    Level.LEVEL0
     */
it('ModalBlurStyle_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0300 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0300 sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0300 sleep err: ' + JSON.stringify(err));
      }
      let button = await driver.findComponent(ON.id('blurStyle_3'));
       try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ModalBlurStyle_0300 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0300 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('blurStyle_3');
      console.info("[ModalBlurStyle_0300] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 3');
      console.info('[ModalBlurStyle_0300] END');
      done();
    });
    
    
    /**
     * @tc.number   ModalBlurStyle_static_0400
     * @tc.name     ModalBlurStyle_static_0400
     * @tc.desc     ModalBlurStyle_static_0400
     * @tc.level    Level.LEVEL0
     */
it('ModalBlurStyle_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0400 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0400 sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0400 sleep err: ' + JSON.stringify(err));
      }
      let scrollBar: Component = (await driver.findComponent(ON.type('Scroll'))) as Component;
      let button = await scrollBar.scrollSearch(ON.id('blurStyle_4'));
       try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ModalBlurStyle_0400 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0400 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('blurStyle_4');
      console.info("[ModalBlurStyle_0400] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 4');
      console.info('[ModalBlurStyle_0400] END');
      done();
    });
    
    
    /**
     * @tc.number   ModalBlurStyle_static_0500
     * @tc.name     ModalBlurStyle_static_0500
     * @tc.desc     ModalBlurStyle_static_0500
     * @tc.level    Level.LEVEL0
     */
it('ModalBlurStyle_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ModalBlurStyle_0500 START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0500 sleep err: ' + JSON.stringify(err));
      }
      let driver = Driver.create()
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0500 sleep err: ' + JSON.stringify(err));
      }
      let scrollBar: Component = (await driver.findComponent(ON.type('Scroll'))) as Component;
      let button = await scrollBar.scrollSearch(ON.id('blurStyle_5'));
      try {
        await (button?.click() as Promise<void>);
      } catch (err) {
        console.info('ModalBlurStyle_0500 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('ModalBlurStyle_0500 sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('blurStyle_5');
      console.info("[ModalBlurStyle_0500] component JSON.parseJsonElement(strJson) is: " + JSON.stringify(JSON.parseJsonElement(strJson)));
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('label')).assertEqual('BlurStyle 5');
      console.info('[ModalBlurStyle_0500] END');
      done();
    });
  })
}