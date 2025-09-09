/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 **     http://www.apache.org/licenses/LICENSE-2.0
 **
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  Point,
  PointerMatrix,
  Rect,
  ResizeDirection,
  UiWindow,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../../ets/MainAbility/utils/MessageManager';
import window from '@ohos.window';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import inspector from '@ohos.arkui.inspector'
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'
import display from '@ohos.display'
import { $r } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import { UtilsTest } from '../Util.test'

let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;
let uiContext = new UIContext()

export default function BindSheetTest() {
  describe('BindSheetTest', () => {

    beforeAll(() => {
      console.info("assemblyCallbackTest beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetest.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

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

          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push BindSheetTest page error:" + err);
      }
      console.info("BindSheetTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info('bindSheetRadius after each called');
    })


    /*
     * @tc.number    bindSheetTest_static_0100
     * @tc.name      bindSheetTest_static_0100
     * @tc.desc      bindSheetTest_static_0100
     * @tc.level     2
     */
    it('bindSheetTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0100';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0100] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_001'));
      await (btn1?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      console.info("[bindSheetTest_0100] date1 is: " + date1);
      console.info("[bindSheetTest_0100] topLeft is: " +
      Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topLeft')))));
      let windowRadiusSmall = inspector.getInspectorByKey("window_radius_small");
      let radius: string =
        JSON.parseJsonElement(windowRadiusSmall)?.getElement('$attrs').getString('content').split(".")[0] as string;
      console.info("[bindSheetTest_0100] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0100] radius is: " + radius)
      console.info("[bindSheetTest_0100] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topLeft'))))).assertEqual(parseInt(radius));
      expect(Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topRight'))))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close1'));
      await (btn2?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      done();
    });


    /*
     * @tc.number    bindSheetTest_static_0200
     * @tc.name      bindSheetTest_static_0200
     * @tc.desc      bindSheetTest_static_0200
     * @tc.level     2
     */
    it('bindSheetTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0200';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0200] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_002'));
      await (btn1?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      console.info("[bindSheetTest_0200] date1 is: " + date1);
      console.info("[bindSheetTest_0200] topLeft is: " + JSON.stringify(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topLeft')));
      expect(JSON.parseJsonElement(date1).getElement('$attrs').getElement('borderRadius').getString('topLeft'))
        .assertEqual("0.00vp");
      expect(JSON.parseJsonElement(date1).getElement('$attrs').getElement('borderRadius').getString('topRight'))
        .assertEqual("0.00vp");
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close2'));
      await (btn2?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      done();
    });


    /*
     * @tc.number    bindSheetTest_static_0300
     * @tc.name      bindSheetTest_static_0300
     * @tc.desc      bindSheetTest_static_0300
     * @tc.level     2
     */
    it('bindSheetTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0300';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0300] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_003'));
      await (btn1?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      console.info("[bindSheetTest_0300] date1 is: " + date1);
      console.info("[bindSheetTest_0300] topLeft is: " +
      JSON.parseJsonElement(date1).getElement('$attrs').getElement('borderRadius').getString('topLeft'));
      console.info("[bindSheetTest_0300] topRight is: " +
      Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topRight')))));
      let windowRadiusSmall = inspector.getInspectorByKey("window_radius_small");
      let radius: string =
        JSON.parseJsonElement(windowRadiusSmall)?.getElement('$attrs').getString('content').split(".")[0] as string;
      console.info("[bindSheetTest_0300] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0300] radius is: " + radius)
      console.info("[bindSheetTest_0300] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(JSON.parseJsonElement(date1).getElement('$attrs').getElement('borderRadius').getString('topLeft'))
        .assertEqual("100.00vp");
      expect(Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topRight'))))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close3'));
      await (btn2?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      done();
    });


    /*
     * @tc.number    bindSheetTest_static_0400
     * @tc.name      bindSheetTest_static_0400
     * @tc.desc      bindSheetTest_static_0400
     * @tc.level     2
     */
    it('bindSheetTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      let tagName = 'bindSheetTest_0400';
      console.info('[' + tagName + '] START============================');
      let driver = Driver.create();
      console.info("[bindSheetTest_0400] driver is: " + driver);
      let btn1 = await driver.findComponent(ON.id('bindSheet_004'));
      await (btn1?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()));
      await CommonFunc.sleep(2000);
      let date1 = JSON.stringify(obj1.getElement('$children')[1].getElement('$children')[0])
      console.info("[bindSheetTest_0400] date1 is: " + date1);
      console.info("[bindSheetTest_0400] topLeft is: " +
      Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topLeft')))));
      let windowRadiusSmall = inspector.getInspectorByKey("window_radius_small");
      let radius: string =
        JSON.parseJsonElement(windowRadiusSmall)?.getElement('$attrs').getString('content').split(".")[0] as string;
      console.info("[bindSheetTest_0400] windowRadiusSmall is: " + windowRadiusSmall)
      console.info("[bindSheetTest_0400] radius is: " + radius)
      console.info("[bindSheetTest_0400] is: " + JSON.stringify($r('sys.float.window_radius_small')))
      expect(Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topLeft'))))).assertEqual(parseInt(radius));
      expect(Math.trunc(UIContext.getFocusedUIContext()!.vp2px(parseInt(JSON.parseJsonElement(date1)
        .getElement('$attrs')
        .getElement('borderRadius')
        .getString('topRight'))))).assertEqual(parseInt(radius));
      console.info('[' + tagName + '] END ===========================');
      let btn2 = await driver.findComponent(ON.id('close4'));
      await (btn2?.click() as Promise<void>);
      ;
      await CommonFunc.sleep(1000);
      done();
    });
  })
}