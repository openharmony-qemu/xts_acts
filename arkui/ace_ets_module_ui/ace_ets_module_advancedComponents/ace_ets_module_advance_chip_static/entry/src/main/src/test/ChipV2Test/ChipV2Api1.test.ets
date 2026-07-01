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

export default function ChipV2Api1(): void {
  describe('ChipV2Api1', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipV2Api1 beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2Api1 beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2Api1",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2Api1 state pages:" + JSON.stringify(pages));
        if (!("ChipV2Api1" == pages.name)) {
          console.info("get ChipV2Api1 pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ChipV2Api1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2Api1 page error:" + err);
      }
      console.info("ChipV2Api1 beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2Api1 after each called");
    });


    /**
     * @tc.number   SUB_ARKUI_API_ChipV2Api1_static_0100
     * @tc.name     SUB_ARKUI_API_ChipV2Api1_static_0100
     * @tc.desc     SUB_ARKUI_API_ChipV2Api1_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2Api1_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2Api1_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btn1 = await driver.findComponent(ON.id('ChipV2Api1_btn1'));
      await (btn1?.click() as Promise<void>);
      await CommonFunc.sleep(2000);
      console.info('SUB_ARKUI_API_ChipV2Api1_static_0100 Activated click after')

      let text = inspector.getInspectorByKey('ChipV2Api1_text');
      let obj2 = JSON.parseJsonElement(text);
      console.info("[SUB_ARKUI_API_ChipV2Api1_static_0100] component obj2 is: " + JSON.stringify(obj2));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual("#FFFF0000");
      await CommonFunc.sleep(1000);
      
      console.info('[SUB_ARKUI_API_ChipV2Api1_static_0100] 1111111111');
      let rom = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
      console.info("[SUB_ARKUI_API_ChipV2Api1_static_0100] btn.$attrs.accessibilityDescription is: " +
      JSON.stringify(rom.getElement('$attrs').getString('accessibilityDescription')));
      expect(rom.getElement('$attrs').getString('accessibilityDescription')).assertEqual("helloActivate");
      console.info('[SUB_ARKUI_API_ChipV2Api1_static_0100] END');
      done();
    });

  })
}