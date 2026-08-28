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

export default function ExtendableGridBuiltInUndefinedTest() {
  describe('ExtendableGridBuiltInUndefinedTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("ExtendableGridBuiltInUndefinedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ExtendBuiltIn/ExtendableGridBuiltInUndefined",
      }
      try {
        const ExtendableGridBuiltInUndefinedTest = AppStorage.get<Router>("router") as Router
        ExtendableGridBuiltInUndefinedTest.clear();
        let pages: router.RouterState = ExtendableGridBuiltInUndefinedTest.getState();
        console.info("get ExtendableGridBuiltInUndefinedTest state pages: " + JSON.stringify(pages));
        if (!("ExtendableGridBuiltInUndefined" == pages.name)) {
          console.info("get ExtendableGridBuiltInUndefinedTest state pages.name: " + JSON.stringify(pages.name));
          ExtendableGridBuiltInUndefinedTest.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ExtendableGridBuiltInUndefinedTest page error:" + err);
      }
      console.info("ExtendableGridBuiltInUndefinedTest beforeEach end");
    });
    afterEach(async () => {
      console.info("ExtendableGridBuiltInUndefinedTest after each called");
    });

    afterAll(async () => {
      await CommonFunc.sleep(1000);
      console.info('ExtendableGridBuiltInUndefinedTest afterAll: all tests finished');
    });


    /**
     * @tc.name: ExtendableGridBuiltIn_Undefined_0100
     * @tc.number: SUB_ARKUI_EXTENDABLE_GRID_UNDEFINED_0100
     * @tc.desc: SUB_ARKUI_EXTENDABLE_GRID_UNDEFINED_0100
     * @tc.type: Function
     * @tc.size: SmallTest
     * @tc.level: Level1
     */
    it('ExtendableGridBuiltIn_Undefined_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[ExtendableGridBuiltIn_Undefined_0100] START');
      await CommonFunc.sleep(1000);
      let strJson: string = inspector.getInspectorByKey('ExtendableGrid_001');
      await CommonFunc.sleep(1000);
      let scrollBar=JSON.parseJsonElement(strJson).getElement('$attrs').getString('scrollBar')
      expect(scrollBar).assertEqual('BarState.Auto');
      await CommonFunc.sleep(1000);
      console.info('[ExtendableGridBuiltIn_Undefined_0100] END');
      done();
    });
  });
}