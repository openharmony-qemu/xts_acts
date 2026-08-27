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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, Point, Rect, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import display from '@ohos.display';
import { $r } from '@ohos.arkui.component';
export default function BindSheetTest() {
  describe('BindSheetTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("BindSheetTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/BindSheet/bindSheetRadius',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get BindSheetTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get BindSheetTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          try {
            await CommonFunc.sleep(2000);
          } catch (err) {
            console.info('BindSheetTest sleep err: ' + JSON.stringify(err));
          }
          // console.info("push BindSheetTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push BindSheetTest page error:" + err);
      }
      console.info("BindSheetTest beforeEach end");
    });




    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('BindSheetTest sleep err: ' + JSON.stringify(err));
      }
      console.info('bindSheetRadius after each called');
    })



    /**
     * @tc.number   bindSheetTest_static_0100
     * @tc.name     bindSheetTest_static_0100
     * @tc.desc     bindSheetTest_static_0100
     * @tc.level    Level.LEVEL0
     */
it('bindSheetTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0100';
      console.info('[' + tagName + '] START============================');
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!
      let driver = Driver.create();
      console.info("[bindSheetTest_0100] driver is: " + driver);
      let btn1: Component | undefined;
      try {
        btn1 = await driver.findComponent(ON.id('bindSheet_001'));
      } catch (err) {
        console.info('bindSheetTest_0100 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0100 sleep err: ' + JSON.stringify(err));
      }
      try {
        await (btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0100 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0100 sleep err: ' + JSON.stringify(err));
      }
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('bindSheetTest_0100 sleep err: ' + JSON.stringify(err));
      }
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('bindSheetTest_0100 sleep err: ' + JSON.stringify(err));
      }
      console.info("[bindSheetTest_0100] date1 is: " , obj1.getElement('$children')[1].getElement('$children')[0]);
      console.info("[bindSheetTest_0100] topLeft is: " + Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft')))));
      let windowRadiusSmall = inspector.getInspectorByKey("window_radius_small");
      let radius: string = JSON.parseJsonElement(windowRadiusSmall)?.getElement('$attrs').getString('content').split(".")[0] as string;
      console.info("[bindSheetTest_0100] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0100] radius is: " + radius)
      console.info("[bindSheetTest_0100] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft'))))).assertEqual(parseInt(radius));
      expect(Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topRight'))))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2: Component | undefined;
      try {
        btn2 = await driver.findComponent(ON.id('close1'));
      } catch (err) {
        console.info('bindSheetTest_0100 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0100 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0100 sleep err: ' + JSON.stringify(err));
      }
      done();
    });





    /**
     * @tc.number   bindSheetTest_static_0200
     * @tc.name     bindSheetTest_static_0200
     * @tc.desc     bindSheetTest_static_0200
     * @tc.level    Level.LEVEL0
     */
it('bindSheetTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0200';
      console.info('[' + tagName + '] START============================');
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!
      let driver = Driver.create();
      console.info("[bindSheetTest_0200] driver is: " + driver);
      let btn1: Component | undefined;
      try {
        btn1 = await driver.findComponent(ON.id('bindSheet_002'));
      } catch (err) {
        console.info('bindSheetTest_0200 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0200 sleep err: ' + JSON.stringify(err));
      }
      try {
        await (btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0200 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0200 sleep err: ' + JSON.stringify(err));
      }
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('bindSheetTest_0200 sleep err: ' + JSON.stringify(err));
      }
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('bindSheetTest_0200 sleep err: ' + JSON.stringify(err));
      }
      console.info("[bindSheetTest_0200] date1 is: " + date1);
      console.info("[bindSheetTest_0200] topLeft is: " + obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft'));
      expect(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft')).assertEqual("0.00vp");
      expect(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topRight')).assertEqual("0.00vp");
      console.info('[' + tagName + '] END ===========================');
      let btn2: Component | undefined;
      try {
        btn2 = await driver.findComponent(ON.id('close2'));
      } catch (err) {
        console.info('bindSheetTest_0200 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0200 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0200 sleep err: ' + JSON.stringify(err));
      }
      done();
    });





    /**
     * @tc.number   bindSheetTest_static_0300
     * @tc.name     bindSheetTest_static_0300
     * @tc.desc     bindSheetTest_static_0300
     * @tc.level    Level.LEVEL0
     */
it('bindSheetTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0300';
      console.info('[' + tagName + '] START============================');
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!
      let driver = Driver.create();
      console.info("[bindSheetTest_0300] driver is: " + driver);
      let btn1: Component | undefined;
      try {
        btn1 = await driver.findComponent(ON.id('bindSheet_003'));
      } catch (err) {
        console.info('bindSheetTest_0300 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0300 sleep err: ' + JSON.stringify(err));
      }
      try {
        await (btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0300 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0300 sleep err: ' + JSON.stringify(err));
      }
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('bindSheetTest_0300 sleep err: ' + JSON.stringify(err));
      }
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      console.info("[bindSheetTest_0300] date1 is: " + date1);
      console.info("[bindSheetTest_0300] topLeft is: " + obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft'));
      console.info("[bindSheetTest_0300] topRight is: " + Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topRight')))));
      let windowRadiusSmall = inspector.getInspectorByKey("window_radius_small");
      let radius: string = JSON.parseJsonElement(windowRadiusSmall)?.getElement('$attrs').getString('content').split(".")[0] as string;
      console.info("[bindSheetTest_0300] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0300] radius is: " + radius)
      console.info("[bindSheetTest_0300] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft')).assertEqual("100.00vp");
      expect(Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topRight'))))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2: Component | undefined;
      try {
        btn2 = await driver.findComponent(ON.id('close3'));
      } catch (err) {
        console.info('bindSheetTest_0300 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0300 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0300 sleep err: ' + JSON.stringify(err));
      }
      done();
    });





    /**
     * @tc.number   bindSheetTest_static_0400
     * @tc.name     bindSheetTest_static_0400
     * @tc.desc     bindSheetTest_static_0400
     * @tc.level    Level.LEVEL0
     */
it('bindSheetTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0400';
      console.info('[' + tagName + '] START============================');
      const uiContext: UIContext = AppStorage.get<UIContext>('uiContext')!
      let driver = Driver.create();
      console.info("[bindSheetTest_0400] driver is: " + driver);
      let btn1: Component | undefined;
      try {
        btn1 = await driver.findComponent(ON.id('bindSheet_004'));
      } catch (err) {
        console.info('bindSheetTest_0400 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0400 sleep err: ' + JSON.stringify(err));
      }
      try {
        await (btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0400 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0400 sleep err: ' + JSON.stringify(err));
      }
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('bindSheetTest_0400 sleep err: ' + JSON.stringify(err));
      }
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      console.info("[bindSheetTest_0400] date1 is: " + date1);
      console.info("[bindSheetTest_0400] topLeft is: " + Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft')))));
      let windowRadiusSmall = inspector.getInspectorByKey("window_radius_small");
      let radius: string = JSON.parseJsonElement(windowRadiusSmall)?.getElement('$attrs').getString('content').split(".")[0] as string;
      console.info("[bindSheetTest_0400] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0400] radius is: " + radius)
      console.info("[bindSheetTest_0400] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topLeft'))))).assertEqual(parseInt(radius));
      expect(Math.trunc(uiContext.vp2px(parseInt(obj1.getElement('$children')[1].getElement('$children')[0].getElement('$attrs').getElement('borderRadius').getString('topRight'))))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2: Component | undefined;
      try {
        btn2 = await driver.findComponent(ON.id('close4'));
      } catch (err) {
        console.info('bindSheetTest_0400 findComponent err: ' + JSON.stringify(err));
      }
      try {
        await (btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('bindSheetTest_0400 click err: ' + JSON.stringify(err));
      }
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('bindSheetTest_0400 sleep err: ' + JSON.stringify(err));
      }
      done();
    });
  })
}
