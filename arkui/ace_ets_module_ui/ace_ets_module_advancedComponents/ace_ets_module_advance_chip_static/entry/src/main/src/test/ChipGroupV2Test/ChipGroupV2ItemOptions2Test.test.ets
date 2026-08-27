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
import { describe, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import {
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipGroupV2ItemOptionsPage2Test(): void {
  describe('ChipGroupV2ItemOptionsPage2Test', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ChipGroupV2ItemOptionsPage2Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipGroupV2/ChipGroupV2ItemOptionsPage2",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipGroupV2ItemOptionsPage2Test state pages:" + JSON.stringify(pages));
        if (!("ChipGroupV2ItemOptionsPage2" == pages.name)) {
          console.info("get ChipGroupV2ItemOptionsPage2Test pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipGroupV2ItemOptionsPage2Test page error:" + err);
      }
      console.info("ChipGroupV2ItemOptionsPage2Test beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("ChipGroupV2ItemOptionsPage2Test after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipGroupV2ItemOptionsPage2Test_static_0100
     * @tc.name     SUB_ARKUI_API_ChipGroupV2ItemOptionsPage2Test_static_0100
     * @tc.desc     SUB_ARKUI_API_ChipGroupV2ItemOptionsPage2Test_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipGroupV2ItemOptionsPage2Test_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsPage2Test_static_0100] START');
      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let roots = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
      let src1 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getElement('$attrs')
        .getString('src')
      expect(src1).assertEqual("resource:///16777230.png");

      let height = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getElement('$attrs')
        .getElement('size')
        .getString('height')
      expect(height).assertEqual("18.00vp");
      let accessibilityText1 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getElement('$attrs')
        .getString('accessibilityText')
      expect(accessibilityText1).assertEqual("后缀图标的无障碍文本属性");
      let src2 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getElement('$attrs')
        .getString('src')
      expect(src2).assertEqual("resource:///125830091.svg");
      let accessibilityText2 = roots.getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getElement('$attrs')
        .getString('accessibilityText')
      expect(accessibilityText2).assertEqual("保存");

      console.info('[SUB_ARKUI_API_ChipGroupV2ItemOptionsPage2Test_static_0100] END');
      done();
    });

  })
}