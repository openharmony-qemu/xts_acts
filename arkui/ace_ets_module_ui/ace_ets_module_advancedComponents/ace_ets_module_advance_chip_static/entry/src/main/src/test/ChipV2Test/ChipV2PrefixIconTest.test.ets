'use static';
/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'

export default function ChipV2PrefixIconTest(): void {
  describe('ChipV2PrefixIconTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipV2PrefixIconTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2PrefixIconTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2PrefixIconTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2PrefixIconTest state pages:" + JSON.stringify(pages));
        if (!("ChipV2PrefixIconTest" == pages.name)) {
          console.info("get ChipV2PrefixIconTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2PrefixIconTest page error:" + err);
      }
      console.info("ChipV2PrefixIconTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2PrefixIconTest after each called");
    });


    /**
     * @tc.number   SUB_ARKUI_API_ChipV2PrefixIconTest_static_0100
     * @tc.name     ChipV2PrefixIconTest_static_0100
     * @tc.desc     ChipV2PrefixIconTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2PrefixIconTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0100] btnElement1 fontColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fontColor')));
      expect(btnElement1.getElement('$attrs').getString('fontColor')).assertEqual("#FF008000");

      let btn1 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0100] btnElement2 fontColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fontColor')));
      expect(btnElement2.getElement('$attrs').getString('fontColor')).assertEqual("#FFFF0000");

      let btn2 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2PrefixIconTest_static_0200
     * @tc.name     ChipV2PrefixIconTest_static_0200
     * @tc.desc     ChipV2PrefixIconTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2PrefixIconTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0200] btnElement1 fillColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fillColor')));
      expect(btnElement1.getElement('$attrs').getString('fillColor')).assertEqual("#FFFFC0CB");

      let btn1 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0200] btnElement2 fillColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fillColor')));
      expect(btnElement2.getElement('$attrs').getString('fillColor')).assertEqual("#FFFF0000");
      
      let btn2 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2PrefixIconTest_static_0300
     * @tc.name     ChipV2PrefixIconTest_static_0300
     * @tc.desc     ChipV2PrefixIconTest_static_0300
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2PrefixIconTest_static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0300] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0300] btnElement1 fillColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fillColor')));
      expect(btnElement1.getElement('$attrs').getString('fillColor')).assertEqual("#FFFFC0CB");

      let btn1 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0300] btnElement2 fillColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fillColor')));
      expect(btnElement2.getElement('$attrs').getString('fillColor')).assertEqual("#FFFF0000");
      
      let btn2 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2PrefixIconTest_static_0400
     * @tc.name     ChipV2PrefixIconTest_static_0400
     * @tc.desc     ChipV2PrefixIconTest_static_0400
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2PrefixIconTest_static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0400] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0400] btnElement1 fillColor is: " +
      JSON.stringify(btnElement1.getElement('$attrs').getString('fillColor')));
      expect(btnElement1.getElement('$attrs').getString('fillColor')).assertEqual("#FFFFC0CB");

      let btn1 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      let btnElement2 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[3]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0400] btnElement2 fillColor2 is: " +
      JSON.stringify(btnElement2.getElement('$attrs').getString('fillColor')));
      expect(btnElement2.getElement('$attrs').getString('fillColor')).assertEqual("#FFFF0000");
      
      let btn2 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500
     * @tc.name     ChipV2PrefixIconTest_static_0500
     * @tc.desc     ChipV2PrefixIconTest_static_0500
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[4]
        .getArray("$children")[0]
        .getArray("$children")[0]
      let btnUn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[5]
        .getArray("$children")[0]
        .getArray("$children")[0]

      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500] btnElement fillColor is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fillColor')));
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500] btnUn fillColor is: " +
      JSON.stringify(btnUn.getElement('$attrs').getString('fillColor')));
      expect(btnElement.getElement('$attrs').getString('fillColor'))
        .assertEqual(btnUn.getElement('$attrs').getString('fillColor'));

      let btn1 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_true'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);

      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500] btnElement fillColor2 is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fillColor')));
      console.info("[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500] btnUn fillColor2 is: " +
      JSON.stringify(btnUn.getElement('$attrs').getString('fillColor')));
      expect(btnElement.getElement('$attrs').getString('fillColor'))
        .assertEqual(btnUn.getElement('$attrs').getString('fillColor'));
      
      let btn2 = await driver.findComponent(ON.id('ChipV2PrefixIcon_isActivated_false'));
      await (btn2?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('[SUB_ARKUI_API_ChipV2PrefixIconTest_static_0500] END');
      done();
    });

  })
}