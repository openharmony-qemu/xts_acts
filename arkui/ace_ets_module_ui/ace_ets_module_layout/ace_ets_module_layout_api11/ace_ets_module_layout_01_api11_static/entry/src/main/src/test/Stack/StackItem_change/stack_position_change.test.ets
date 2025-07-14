/**
 * Copyright (c) 2025 iSoftStone Information Technology (Group) Co.,Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '../../../../../hypium/index';
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
import { UIContext } from "@ohos.arkui.UIContext";
import { Alignment } from '@ohos.arkui.component';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Stack_Position_Change() {
  describe('Stack_Position_ChangeTest', () => {
    beforeAll(() => {
      console.info("Stack_Position_ChangeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      console.info("Stack_Position_ChangeTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/StackItem_change/stack_position_change",
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get Stack_Position_Change state pages:" + JSON.stringify(pages));
        if (!("stack_position_change" == pages.name)) {
          console.info("get Stack_Position_Change pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // // console.info("push Stack_Position_Change page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push Stack_Position_Change page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_Position_ChangeTest beforeEach end");
    });
    afterEach(async ():Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("Stack_Position_Change after each called")
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0100
     * @tc.name testStackPositionChangeWithAlignmentTopStart
     * @tc.desc The stack component sets alignContent to Alignment.TopStart and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentTopStart] START');
      const uiContext = new UIContext();
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTopStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0200
     * @tc.name testStackPositionChangeWithAlignmentTop
     * @tc.desc The stack component sets alignContent to Alignment.Top and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentTop] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTop] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0300
     * @tc.name testStackPositionChangeWithAlignmentTopEnd
     * @tc.desc The stack component sets alignContent to Alignment.TopEnd and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentTopEnd] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.top) - (Stack_Position_Change_01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentTopEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0400
     * @tc.name testStackPositionChangeWithAlignmentStart
     * @tc.desc The stack component sets alignContent to Alignment.Start and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentStart] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0500
     * @tc.name testStackPositionChangeWithAlignmentCenter
     * @tc.desc The stack component sets alignContent to Alignment.Center and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentCenter] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentCenter] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0600
     * @tc.name testStackPositionChangeWithAlignmentEnd
     * @tc.desc The stack component sets alignContent to Alignment.End and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentEnd] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.End
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.top - Stack_Position_Change_01.top)) - (Math.round(Stack_Position_Change_01.bottom - Stack_Position_Change_012.bottom))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentEnd] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0700
     * @tc.name testStackPositionChangeWithAlignmentBottomStart
     * @tc.desc The stack component sets alignContent to Alignment.BottomStart and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentBottomStart] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.left) - (Stack_Position_Change_01.left)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottomStart] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0800
     * @tc.name testStackPositionChangeWithAlignmentBottom
     * @tc.desc The stack component sets alignContent to Alignment.Bottom and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentBottom] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.left - Stack_Position_Change_01.left)) - (Math.round(Stack_Position_Change_01.right - Stack_Position_Change_012.right))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottom] END');
      done();
    });
    /**
     * @tc.number SUB_ACE_STACK_POSITION_CHANGE_TEST_0900
     * @tc.name testStackPositionChangeWithAlignmentBottomEnd
     * @tc.desc The stack component sets alignContent to Alignment.BottomEnd and sets the position of
     *               the first subcomponent
     */
    it('testStackPositionChangeWithAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackPositionChangeWithAlignmentBottomEnd] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'addAlignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_Position_Change_01');

      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd');
      let Stack_Position_Change_011: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_011');
      let Stack_Position_Change_012: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_012');
      let Stack_Position_Change_01: RectValue = CommonFunc.getComponentRect('Stack_Position_Change_01');
      expect(Math.abs((Stack_Position_Change_012.bottom) - (Stack_Position_Change_01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Stack_Position_Change_012.right) - (Stack_Position_Change_01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.top - Stack_Position_Change_01.top)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.left - Stack_Position_Change_01.left)) - (Math.round(uiContext.vp2px(20)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.bottom - Stack_Position_Change_011.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.bottom - Stack_Position_Change_012.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_011.right - Stack_Position_Change_011.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(Stack_Position_Change_012.right - Stack_Position_Change_012.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      console.info('[testStackPositionChangeWithAlignmentBottomEnd] END');
      done();
    });
  })
}
