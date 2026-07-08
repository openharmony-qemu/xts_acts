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

export default function ChipV2LabelOptionsTest(): void {
  describe('ChipV2LabelOptionsTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ChipV2LabelOptionsTest beforeEach start");
      await UtilsTest.startAbility("com.arkui.ace.advance.chip.static", "EntryAbility")

    });

    beforeEach(async (): Promise<void> => {
      console.info("ChipV2LabelOptionsTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/ChipV2/ChipV2LabelOptionsTest",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ChipV2LabelOptionsTest state pages:" + JSON.stringify(pages));
        if (!("ChipV2LabelOptionsTest" == pages.name)) {
          console.info("get ChipV2LabelOptionsTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ChipV2LabelOptionsTest page error:" + err);
      }
      console.info("ChipV2LabelOptionsTest beforeEach end");
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("ChipV2LabelOptionsTest after each called");
    });


    /**
     * @tc.number   SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100
     * @tc.name     SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100
     * @tc.desc     SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver = Driver.create();
      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] btnElement content is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('content')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] btnElement fontSize is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontSize')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] btnElement fontColor is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontColor')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] btnElement fontFamily is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontFamily')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] btnElement margin is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('margin')));

      expect(btnElement.getElement('$attrs').getString('content')).assertEqual("label1");
      expect(btnElement.getElement('$attrs').getString('fontSize')).assertEqual("12.00fp");
      expect(btnElement.getElement('$attrs').getString('fontColor')).assertEqual("#FF0000FF");
      expect(btnElement.getElement('$attrs').getString('fontFamily')).assertEqual("HarmonySans");
      let margin = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('margin'))
      expect(margin.getString('top')).assertEqual("0.00vp");
      expect(margin.getString('right')).assertEqual("30.00vp");
      expect(margin.getString('bottom')).assertEqual("0.00vp");
      expect(margin.getString('left')).assertEqual("20.00vp");
      console.info('[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0100] END');
      done();
    });

    /**
     * @tc.number   SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200
     * @tc.name     SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200
     * @tc.desc     SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_002] START');
      await CommonFunc.sleep(1000);
      let btnElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] btnElement content is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('content')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] btnElement fontSize is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontSize')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] btnElement fontColor is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontColor')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] btnElement fontFamily is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('fontFamily')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] btnElement margin is: " +
      JSON.stringify(btnElement.getElement('$attrs').getString('margin')));

      let unElement = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[0]
        .getArray("$children")[2]
        .getArray("$children")[0]
        .getArray("$children")[1]
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] unElement content is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('content')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] unElement fontSize is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('fontSize')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] unElement fontColor is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('fontColor')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] unElement fontFamily is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('fontFamily')));
      console.info("[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] unElement margin is: " +
      JSON.stringify(unElement.getElement('$attrs').getString('margin')));

      expect(btnElement.getElement('$attrs').getString('content')).assertEqual("label2");
      expect(unElement.getElement('$attrs').getString('content')).assertEqual("label3");
      expect(btnElement.getElement('$attrs').getString('fontSize'))
        .assertEqual(unElement.getElement('$attrs').getString('fontSize'));
      expect(btnElement.getElement('$attrs').getString('fontColor'))
        .assertEqual(unElement.getElement('$attrs').getString('fontColor'));
      expect(btnElement.getElement('$attrs').getString('fontFamily'))
        .assertEqual('HarmonySans');

      let margin1 = JSON.parseJsonElement(btnElement.getElement('$attrs').getString('margin'))
      let marginUn = JSON.parseJsonElement(unElement.getElement('$attrs').getString('margin'))
      expect(margin1.getString('top')).assertEqual("0.00vp");
      expect(margin1.getString('bottom')).assertEqual("0.00vp");
      expect(margin1.getString('right')).assertEqual(marginUn.getString('right'));
      expect(margin1.getString('left')).assertEqual(marginUn.getString('left'));
      console.info('[SUB_ARKUI_API_ChipV2LabelOptionsTest_static_0200] END');
      done();
    });

  })
}