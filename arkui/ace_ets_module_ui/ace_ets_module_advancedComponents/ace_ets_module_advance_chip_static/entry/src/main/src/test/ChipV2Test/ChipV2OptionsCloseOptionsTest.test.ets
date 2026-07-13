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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipV2OptionsCloseOptionsTest(): void {
  describe('ChipV2OptionsCloseOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipV2OptionsCloseOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2OptionsCloseOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2OptionsCloseOptionsTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2OptionsCloseOptionsTest state pages:" + JSON.stringify(pages));
        if (!("ChipV2OptionsCloseOptionsTest" == pages.name)) {
          console.info("get ChipV2OptionsCloseOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2OptionsCloseOptionsTest page error:" + err);
      }
      console.info("ChipV2OptionsCloseOptionsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2OptionsCloseOptionsTest after each called");
    });



    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0100
     * @tc.name     ChipV2OptionsCloseOptionsTest_static_0100
     * @tc.desc     ChipV2OptionsCloseOptionsTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0100] START');
      await CommonFunc.sleep(1000);
      const driver = Driver.create();
      const chipList = await driver.findComponents(ON.type('Image').within(ON.id('ChipV2OptionsCloseOptionsExample')));
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0100] length '+chipList?.length);
      expect(chipList?.length).assertEqual(2);
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0200
     * @tc.name     ChipV2OptionsCloseOptionsTest_static_0200
     * @tc.desc     ChipV2OptionsCloseOptionsTest_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0200] START');
      await CommonFunc.sleep(1000);
      let Symbol = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]

      console.info("[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0200] component accessibilityText is: " + Symbol.getElement('$attrs').getString('accessibilityText'));
      expect(Symbol.getElement('$attrs').getString('accessibilityText')).assertEqual('删除');
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0300
     * @tc.name     ChipV2OptionsCloseOptionsTest_static_0300
     * @tc.desc     ChipV2OptionsCloseOptionsTest_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0300] START');
      await CommonFunc.sleep(1000);
      let Btn = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]

      console.info("[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0300] component accessibilityText is: " + Btn.getElement('$attrs').getString('accessibilityText'));
      expect(Btn.getElement('$attrs').getString('accessibilityText')).assertEqual('accessibilityText1');
      console.info("[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0300] component accessibilityDescription is: " + Btn.getElement('$attrs').getString('accessibilityDescription'));
      expect(Btn.getElement('$attrs').getString('accessibilityDescription')).assertEqual('accessibilityDescription1');
      console.info('[SUB_ARKUI_API_ChipV2OptionsCloseOptionsTest_static_0300] END');
      done();
    });
  })
}