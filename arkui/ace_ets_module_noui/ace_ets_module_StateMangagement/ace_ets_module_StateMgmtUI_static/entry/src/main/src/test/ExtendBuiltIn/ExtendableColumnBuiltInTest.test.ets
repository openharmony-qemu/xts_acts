'use static';
/*
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { ButtonType, ControlSize } from '@kit.ArkUI';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function ExtendableColumnBuiltInTest() {
  describe('ExtendableColumnBuiltInTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableColumnBuiltInTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableColumnBuiltIn",
      }
      try {
        const ExtendableColumnBuiltInTest = AppStorage.get<Router>("router") as Router
        ExtendableColumnBuiltInTest.clear();
        let pages: router.RouterState = ExtendableColumnBuiltInTest.getState();
        console.info("get ExtendableColumnBuiltInTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableColumnBuiltIn" == pages.name)) {
          console.info("get ExtendableColumnBuiltInTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableColumnBuiltInTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableColumnBuiltInTest page error:" + err);
      }
      console.info("ExtendableColumnBuiltInTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableColumnBuiltInTest after each called");
    });

    afterAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExtendableColumnBuiltInTest afterAll: all tests finished');
    });
    
    /**
     * @tc.name: ExtendableColumnBuiltIn_ChildComponent_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_COLUMN_CHILD_COMPONENT_0100
     * @tc.desc: Test ExtendableColumn child components are created correctly
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableColumnBuiltIn_ChildComponent_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableColumnBuiltIn_ChildComponent_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableColumn_001');
      await CommonFunc.sleep(1000);
      let content=JSON.parseJsonElement(strJson).getElement('$attrs').getString('content')
      console.info("[ExtendableColumnBuiltIn_ChildComponent_0100] content is: " + content);
      expect(content).assertEqual('Hello World');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableColumnBuiltIn_ChildComponent_0100] END');
      done();
    });

    /**
     * @tc.name: ExtendableColumnBuiltIn_CustomAttribute_0200
     * @tc.number: SUB_ARKUI_EXTENDABLE_COLUMN_CUSTOM_ATTRIBUTE_0200
     * @tc.desc: Test ExtendableColumn with custom newAttribute method that sets width and height
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableColumnBuiltIn_CustomAttribute_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableColumnBuiltIn_CustomAttribute_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableColumn_002');
      await CommonFunc.sleep(1000);
      let height=JSON.parseJsonElement(strJson).getElement('$attrs').getString('height')
      let width=JSON.parseJsonElement(strJson).getElement('$attrs').getString('width')
      console.info("[ExtendableColumnBuiltIn_CustomAttribute_0200] height is: " + height + ", width is: " + width);
      expect(height).assertEqual('50.00%');
      expect(width).assertEqual('30.00%');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableColumnBuiltIn_CustomAttribute_0200] END');
      done();
    });

    /**
     * @tc.name: ExtendableColumnBuiltIn_CustomAttribute_0300
     * @tc.number: SUB_ARKUI_EXTENDABLE_COLUMN_CUSTOM_ATTRIBUTE_0300
     * @tc.desc: Test ExtendableColumn with custom newAttribute method that sets width and height
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableColumnBuiltIn_CustomAttribute_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableColumnBuiltIn_CustomAttribute_0200] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableColumn_002');
      await CommonFunc.sleep(1000);
      let strJson2: string = inspector.getInspectorByKey('ExtendableColumn_004');
      await CommonFunc.sleep(1000);
      let space1=JSON.parseJsonElement(strJson).getElement('$attrs').getString('space')
      let space2=JSON.parseJsonElement(strJson2).getElement('$attrs').getString('space')
      expect(space1).assertEqual('100.00vp');
      expect(space2).assertEqual('0.00px');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableColumnBuiltIn_CustomAttribute_0300] END');
      done();
    });
  });
}