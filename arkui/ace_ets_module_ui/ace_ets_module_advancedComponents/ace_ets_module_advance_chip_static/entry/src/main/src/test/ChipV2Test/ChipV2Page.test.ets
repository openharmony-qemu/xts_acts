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
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation,
  ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

export default function ChipV2Page(): void {
  describe('ChipV2Page', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2Page beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2Page",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2Page state pages:" + JSON.stringify(pages));
        if (!("ChipV2Page" == pages.name)) {
          console.info("get ChipV2Page pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2Page page error:" + err);
      }
      console.info("ChipV2Page beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("ChipV2Page after each called");
    });

    
    
    /**
     * @tc.number   SUB_ARKUI_API_ChipV2Page_static_0100
     * @tc.name     ChipV2Page_static_0100
     * @tc.desc     ChipV2Page_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2Page_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2Page_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }

      let btn0 = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]

      console.info("[SUB_ARKUI_API_ChipV2Page_static_0100] component btn0.attrs.accessibilityLevel is: " + JSON.stringify(btn0.getElement('$attrs').getString('accessibilityLevel')));
      expect(btn0.getElement('$attrs').getString('accessibilityLevel')).assertEqual('yes');

      console.info('[SUB_ARKUI_API_ChipV2Page_static_0100] END');
      done();
    });

  })
}