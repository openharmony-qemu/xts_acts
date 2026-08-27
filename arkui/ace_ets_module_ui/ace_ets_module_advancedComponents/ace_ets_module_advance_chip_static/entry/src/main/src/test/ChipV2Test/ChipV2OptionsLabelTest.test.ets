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

export default function ChipV2OptionsLabelTest(): void {
  describe('ChipV2OptionsLabelTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2OptionsLabelTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2OptionsLabelTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2OptionsLabelTest state pages:" + JSON.stringify(pages));
        if (!("ChipV2OptionsLabelTest" == pages.name)) {
          console.info("get ChipV2OptionsLabelTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2OptionsLabelTest page error:" + err);
      }
      console.info("ChipV2OptionsLabelTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      console.info("ChipV2OptionsLabelTest after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0100
     * @tc.name     ChipV2OptionsLabelTest_static_0100
     * @tc.desc     ChipV2OptionsLabelTest_static_0100
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0100] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      const treeText = JSON.stringify(inspector.getInspectorTree());
      const componentCount = treeText.split('"$type":"Image"').length - 1;
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0100] length '+componentCount);
      expect(componentCount).assertEqual(3);
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0200
     * @tc.name     ChipV2OptionsLabelTest_static_0200
     * @tc.desc     ChipV2OptionsLabelTest_static_0200
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0200] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let Text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]

      console.info("[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0200] component chip2 is: " + Text.getElement('$attrs').getString('content'));
      expect(Text.getElement('$attrs').getString('content')).assertEqual('Chip1');
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0200] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0300
     * @tc.name     ChipV2OptionsLabelTest_static_0300
     * @tc.desc     ChipV2OptionsLabelTest_static_0300
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0300] START');
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('xxxTest sleep err: ' + JSON.stringify(err));
      }
      let Text = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[1]

      console.info("[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0300] component chip3 is: " + Text.getElement('$attrs').getString('content'));
      expect(Text.getElement('$attrs').getString('content')).assertEqual('Chip2');
      console.info('[SUB_ARKUI_API_ChipV2OptionsLabelTest_static_0300] END');
      done();
    });
  })
}
