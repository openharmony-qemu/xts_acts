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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import {
  $r,
} from '@ohos.arkui.component';

export default function ChipV2OptionsFontSizeTest(): void {
  describe('ChipV2OptionsFontSizeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipV2OptionsFontSizeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2OptionsFontSizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2OptionsFontSizeTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2OptionsFontSizeTest state pages:" + JSON.stringify(pages));
        if (!("ChipV2OptionsFontSizeTest" == pages.name)) {
          console.info("get ChipV2OptionsFontSizeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2OptionsFontSizeTest page error:" + err);
      }
      console.info("ChipV2OptionsFontSizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2OptionsFontSizeTest after each called");
    });



    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0100
     * @tc.name     ChipV2OptionsFontSizeTest_static_0100
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0100] START');
      await CommonFunc.sleep(1000);
      const driver = Driver.create();
      const chipList = await driver.findComponents(ON.type('Image').within(ON.id('ChipV2OptionsFontSizeExample')));
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0100] length '+chipList?.length);
      expect(chipList?.length).assertEqual(3);
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0200
     * @tc.name     ChipV2OptionsFontSizeTest_static_0200
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let Text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0200] component fontSize is: " + Text.getElement('$attrs').getString('fontSize'));
      let resFontSize:string  = CommonFunc.getResourceFloat($r('sys.float.chip_normal_font_size'),'fp')
      expect(Text.getElement('$attrs').getString('fontSize')).assertEqual(resFontSize);
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0300
     * @tc.name     ChipV2OptionsFontSizeTest_static_0300
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0300] START');
      await CommonFunc.sleep(1000);
      let Symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0300] component fontSize is: " + Symbol.getElement('$attrs').getString('fontSize'));
      expect(Symbol.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0300] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0400
     * @tc.name     ChipV2OptionsFontSizeTest_static_0400
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0400
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0400] START');
      await CommonFunc.sleep(1000);
      let Text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0400] component fontSize is: " + Text.getElement('$attrs').getString('fontSize'));
      expect(Text.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0400] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0500
     * @tc.name     ChipV2OptionsFontSizeTest_static_0500
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0500
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0500] START');
      await CommonFunc.sleep(1000);
      let Symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0500] component fontSize is: " + Symbol.getElement('$attrs').getString('fontSize'));
      expect(Symbol.getElement('$attrs').getString('fontSize')).assertEqual('12.00fp');
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0500] END');
      done();
    });
    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0600
     * @tc.name     ChipV2OptionsFontSizeTest_static_0600
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0600
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0600] START');
      await CommonFunc.sleep(1000);
      let Text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0600] component fontSize is: " + Text.getElement('$attrs').getString('fontSize'));
      let resFontSize:string  = CommonFunc.getResourceFloat($r('sys.float.chip_normal_font_size'),'fp')
      expect(Text.getElement('$attrs').getString('fontSize')).assertEqual(resFontSize);
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0600] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0700
     * @tc.name     ChipV2OptionsFontSizeTest_static_0700
     * @tc.desc     ChipV2OptionsFontSizeTest_static_0700
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0700] START');
      await CommonFunc.sleep(1000);
      let Symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
      console.info("[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0700] component fontSize is: " + Symbol.getElement('$attrs').getString('fontSize'));
      expect(Symbol.getElement('$attrs').getString('fontSize')).assertEqual('16.00fp');
      console.info('[SUB_ARKUI_API_ChipV2OptionsFontSizeTest_static_0700] END');
      done();
    });
  })
}