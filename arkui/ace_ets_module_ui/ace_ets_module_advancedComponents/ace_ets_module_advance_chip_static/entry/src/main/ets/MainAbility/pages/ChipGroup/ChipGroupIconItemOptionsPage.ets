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
import Utils from '../../../ets/MainAbility/common/Utils';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipGroupIconItemOptionsTest() {
  describe('ChipGroupIconItemOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipGroupIconItemOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipGroupIconItemOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroup/ChipGroupIconItemOptionsPage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipGroupIconItemOptionsTest state pages:" + JSON.stringify(pages));
        if (!("ChipGroupIconItemOptionsPage" == pages.name)) {
          console.info("get ChipGroupIconItemOptionsTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ChipGroupIconItemOptionsTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipGroupIconItemOptionsTest page error:" + err);
      }
      console.info("ChipGroupIconItemOptionsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipGroupIconItemOptionsTest after each called");
    });

    
    
    
    /**
     * @tc.number   ChipGroupIconItemOptionsTest_static_001
     * @tc.name     ChipGroupIconItemOptionsTest_static_001
     * @tc.desc     ChipGroupIconItemOptionsTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('ChipGroupIconItemOptionsTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[ChipGroupIconItemOptionsTest_static_001] START');
      await CommonFunc.sleep(1000);

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
      console.info("[ChipGroupIconItemOptionsTest_static_001] component btn0.attrs.accessibilityDescription is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityDescription')));
      console.info("[ChipGroupIconItemOptionsTest_static_001] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn0.getElement('$attrs').getString('accessibilityDescription')).assertEqual('ChipGroupItem_accessibilityDescription');
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');

      let btn1 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[ChipGroupSymbolItemOptionsTest_static_001] component btn1.attrs.accessibilityLevel is: " + JSON.stringify(btn1.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn1.getElement('$attrs').getString('accessibilityLevel')).assertEqual('no');

      console.info('[ChipGroupIconItemOptionsTest_static_001] END');
      done();
    });

  })
}