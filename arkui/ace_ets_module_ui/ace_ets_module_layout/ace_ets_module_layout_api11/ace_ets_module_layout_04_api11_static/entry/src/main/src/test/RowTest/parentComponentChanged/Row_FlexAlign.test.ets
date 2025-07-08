/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../hypium/index";
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../../../ets/MainAbility/common/Common'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import { FlexAlign } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function Row_FlexAlign() {
  describe('Row_FlexAlign', () => {
    beforeAll(() => {
      console.info("Row_FlexAlign beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split04.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("Row_FlexAlign beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Row/parentComponentChanged/Row_FlexAlign',
      };
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        await CommonFunc.sleep(1000);
        let pages = routerInstance.getState();
        console.info("get Row_FlexAlign state success " + "");
        if (!("Row_FlexAlign" == pages.name)) {
          console.info("get Row_FlexAlign state success " + "");
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push Row_FlexAlign page success " + "");
        }
      } catch (err) {
        console.error("push Row_FlexAlign page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000)
      console.info("Row_FlexAlign beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(2000)
      console.info("Row_FlexAlign after each called");
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1100
     * @tc.name testRowJustifyContentFlexAlignStart
     * @tc.desc The JustifyContent property of the ROW component is set to FlexAlign.Start
     */

    it('testRowJustifyContentFlexAlignStart_static_01', 0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignStart_static_01 START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'justifyContent', value: FlexAlign.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();

     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.Start");

      expect(Math.abs((Text1.left) - (Row.left)) <= 1).assertTrue();
      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Row.right).assertLarger(Text3.right);

      console.info('testRowJustifyContentFlexAlignStart_static_01 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1200
     * @tc.name testRowJustifyContentFlexAlignCenter
     * @tc.desc The JustifyContent property of the ROW component is set to FlexAlign.Center
     */

    it('testRowJustifyContentFlexAlignCenter_static_02', 0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignCenter_static_02 START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'justifyContent', value: FlexAlign.Center
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.Center");

      expect(Math.abs(Math.round(Text1.left - Row.left) - Math.round(Row.right - Text3.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignCenter_static_02 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1300
     * @tc.name testRowJustifyContentFlexAlignEnd
     * @tc.desc The JustifyContent property of the ROW component is set to FlexAlign.End
     */

    it('testRowJustifyContentFlexAlignEnd_static_03', 0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignEnd_static_03 START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'justifyContent', value: FlexAlign.End
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.End");

      expect(Math.abs(Text3.right - Row.right) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(uiContext.vp2px(10)))) <= 1).assertTrue();
      expect(Text1.left).assertLarger(Row.left);

      console.info('testRowJustifyContentFlexAlignEnd_static_03 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1400
     * @tc.name testRowJustifyContentFlexAlignSpaceBetween
     * @tc.desc The JustifyContent property of the ROW component is set to FlexAlign.SpaceBetween
     */

    it('testRowJustifyContentFlexAlignSpaceBetween_static_04', 0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignSpaceBetween_static_04 START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceBetween
      });
      await CommonFunc.sleep(3000)
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.SpaceBetween");

      expect(Math.abs(Text1.left - Row.left) <= 1).assertTrue();
      expect(Math.abs(Text3.right - Row.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(Math.round((Text2.left - Text1.right) * 10) / 10)) - (Math.round(uiContext.vp2px(25)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Math.round((Text3.left - Text2.right) * 10) / 10)) - (Math.round(uiContext.vp2px(25)))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignSpaceBetween_static_04 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1500
     * @tc.name testRowJustifyContentFlexAlignSpaceAround
     * @tc.desc The JustifyContent property of the ROW component is set to FlexAlign.SpaceAround
     */

    it('testRowJustifyContentFlexAlignSpaceAround_static_05', 0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignSpaceAround_static_05 START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceAround
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));

      const uiContext = new UIContext();
      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.SpaceAround");

      expect(Math.abs(Math.round(Text1.left - Row.left) - Math.round(Row.right - Text3.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round((Text1.left - Row.left) * 10) / 10 - Math.round(uiContext.vp2px(50 / 6) * 10) / 10) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Text2.left - Text1.right)) - (Math.round(uiContext.vp2px(50 / 3)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.left - Text2.right)) - (Math.round(uiContext.vp2px(50 / 3)))) <= 1).assertTrue();

      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignSpaceAround_static_05 END');
      done();
    });

    /**
     * @tc.number SUB_ACE_ROW_PARENTCOMPONENTCHANGED_1600
     * @tc.name testRowJustifyContentFlexAlignSpaceEvenly
     * @tc.desc The JustifyContent property of the ROW component is set to FlexAlign.SpaceEvenly
     */

    it('testRowJustifyContentFlexAlignSpaceEvenly_static_06', 0, async (done: () => void): Promise<void> => {
      console.info('testRowJustifyContentFlexAlignSpaceEvenly_static_06 START');
      AppStorage.get<MessageManager<number>>('messageManager', Type.from<MessageManager<number>>())?.notify({
        name: 'justifyContent', value: FlexAlign.SpaceEvenly
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Row_ParentComponentChanged_Row');

     console.info('Row obj.$attrs is:' + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$attrs')));
      let Row: RectValue = CommonFunc.getComponentRect('Row_ParentComponentChanged_Row');
      let Text1: RectValue = CommonFunc.getComponentRect('Text1');
      let Text2: RectValue = CommonFunc.getComponentRect('Text2');
      let Text3: RectValue = CommonFunc.getComponentRect('Text3');

      console.log('Row rect_value is:' + JSON.stringify(Row));
      console.log('Text1 rect_value is:' + JSON.stringify(Text1));
      console.log('Text2 rect_value is:' + JSON.stringify(Text2));
      console.log('Text3 rect_value is:' + JSON.stringify(Text3));
      const uiContext = new UIContext();
      expect(Math.abs((Math.round(Text1.bottom - Text1.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.bottom - Text2.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.bottom - Text3.top)) - (Math.round(uiContext.vp2px(150)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text1.right - Text1.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text2.right - Text2.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(Text3.right - Text3.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
     expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('justifyContent')).assertEqual("FlexAlign.SpaceEvenly");

      expect(Math.abs(Math.round(Text1.left - Row.left) - Math.round(Row.right - Text3.right)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Math.round((Text1.left - Row.left) * 100) / 100) - Math.round(Math.round(uiContext.vp2px(50 / 4) * 100) / 100)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Math.round((Text2.left - Text1.right) * 100) / 100) - Math.round(Math.round(uiContext.vp2px(50 / 4) * 100) / 100)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Math.round((Text3.left - Text2.right) * 100) / 100) - Math.round(Math.round(uiContext.vp2px(50 / 4) * 100) / 100)) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(Text1.top - Row.top) - Math.round(Row.bottom - Text1.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text2.top - Row.top) - Math.round(Row.bottom - Text2.bottom)) <= 1).assertTrue();
      expect(Math.abs(Math.round(Text3.top - Row.top) - Math.round(Row.bottom - Text3.bottom)) <= 1).assertTrue();

      console.info('testRowJustifyContentFlexAlignSpaceEvenly_static_06 END');
      done();
    });

  })
}
