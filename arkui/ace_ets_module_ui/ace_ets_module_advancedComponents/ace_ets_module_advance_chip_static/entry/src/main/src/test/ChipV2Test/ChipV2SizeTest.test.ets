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
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Color, FontWeight, $r, Resource } from '@ohos.arkui.component'

export default function ChipV2SizeTest(): void {
  describe('ChipV2SizeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipV2SizeTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2SizeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2SizeTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2SizeTest state pages:" + JSON.stringify(pages));
        if (!("ChipV2SizeTest" == pages.name)) {
          console.info("get ChipV2SizeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2SizeTest page error:" + err);
      }
      console.info("ChipV2SizeTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2SizeTest after each called");
    });

    
    /**
     * @tc.number   SUB_ARKUI_API_ChipV2SizeTest_static_0100
     * @tc.name     ChipV2SizeTest_static_0100
     * @tc.desc     ChipV2SizeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2SizeTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2SizeTest_static_0100] START');
      await CommonFunc.sleep(1000);

      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]

      let unElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]

      console.info("[SUB_ARKUI_API_ChipV2SizeTest_static_0100] btnElement constraintSize is: " +
        JSON.stringify(btnElement.getElement('$attrs').getString('constraintSize')));
      console.info("[SUB_ARKUI_API_ChipV2SizeTest_static_0100] unElement constraintSize is: " +
        JSON.stringify(unElement.getElement('$attrs').getString('constraintSize')));

      let constraintSize1 = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('constraintSize'))
      let constraintSizeUn = JSON.parseJsonElement(unElement.getElement('$attrs').getString('constraintSize'))
      
      expect(constraintSize1.getString('minWidth')).assertEqual(constraintSizeUn.getString('minWidth'));
      expect(constraintSize1.getString('maxWidth')).assertEqual(constraintSizeUn.getString('maxWidth'));
      expect(constraintSize1.getString('minHeight')).assertEqual(constraintSizeUn.getString('minHeight'));
      expect(constraintSize1.getString('maxHeight')).assertEqual(constraintSizeUn.getString('maxHeight'));
      console.info('[SUB_ARKUI_API_ChipV2SizeTest_static_0100] END');
      done();
    });
    
    /**
     * @tc.number   SUB_ARKUI_API_ChipV2SizeTest_static_0200
     * @tc.name     ChipV2SizeTest_static_0200
     * @tc.desc     ChipV2SizeTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2SizeTest_static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2SizeTest_static_0200] START');
      await CommonFunc.sleep(1000);

      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]

      let unElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]

      console.info("[SUB_ARKUI_API_ChipV2SizeTest_static_0200] btnElement constraintSize is: " +
        JSON.stringify(btnElement.getElement('$attrs').getString('constraintSize')));
      console.info("[SUB_ARKUI_API_ChipV2SizeTest_static_0200] unElement constraintSize is: " +
        JSON.stringify(unElement.getElement('$attrs').getString('constraintSize')));

      let constraintSize1 = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('constraintSize'))
      let constraintSizeUn = JSON.parseJsonElement(unElement.getElement('$attrs').getString('constraintSize'))
      
      expect(constraintSize1.getString('minWidth')).assertEqual(constraintSizeUn.getString('minWidth'));
      expect(constraintSize1.getString('maxWidth')).assertEqual(constraintSizeUn.getString('maxWidth'));
      expect(constraintSize1.getString('maxHeight')).assertEqual(constraintSizeUn.getString('maxHeight'));
      console.info('[SUB_ARKUI_API_ChipV2SizeTest_static_0200] END');
      done();
    });

  })
}