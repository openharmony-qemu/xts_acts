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
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback,Message } from '../../../../ets/MainAbility/common/MessageManager';
import { Alignment } from '@ohos.arkui.component';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function Stack_AlignContent() {
  describe('Stack_AlignContent_Test',  ()=> {
    beforeAll(() => {
      console.info("Stack_AlignContent_Test beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("Stack_AlignContent_Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Stack/Stack_alignContent/stack_alignContent",
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        let pages = router.getState();
        console.info("get Stack_AlignContent state pages:" + JSON.stringify(pages));
        if (!("stack_alignContent" == pages.name)) {
          console.info("get stack_alignContent pages.name:" + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options);
          router.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push stack_alignContent page result:" + JSON.stringify(result));
        }
      } catch (err: Error) {
        console.error("push stack_alignContent page error " + JSON.stringify(err));
        expect().assertFail();
      }
      console.info("Stack_AlignContent_Test beforeEach end");
    });
    afterEach(async (): Promise<void> =>{
      await CommonFunc.sleep(2000);
      console.info("stack_alignContent after each called")
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0100
     * @tc.name      testStackAlignContentNotConfig
     * @tc.desc      The stack component does not set alignContent
     */
    it('testStackAlignContentCenter_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentCenter] START');
      const uiContext = new UIContext();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_01');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.Center');
      let stack_alignContent_011:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_011');
      let stack_alignContent_012:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_012');
      let stack_alignContent_013:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_013');
      let stack_alignContent_01:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_01');
      expect(Math.abs((stack_alignContent_011.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_011.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_012.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_012.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_013.left - stack_alignContent_01.left) - (stack_alignContent_01.right - stack_alignContent_013.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_011.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_011.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_012.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_012.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_013.top - stack_alignContent_01.top) - (stack_alignContent_01.bottom - stack_alignContent_013.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_011.bottom - stack_alignContent_011.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_012.bottom - stack_alignContent_012.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_013.bottom - stack_alignContent_013.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_011.right - stack_alignContent_011.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_012.right - stack_alignContent_012.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_013.right - stack_alignContent_013.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentCenter] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_stack_alignContent_TEST_0200
     * @tc.name      testStackAlignContentTopStart
     * @tc.desc      The stack component sets alignContent to Alignment.TopStart
     */
    it('testStackAlignContentTopStart_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentTopStart] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.TopStart });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.TopStart');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTopStart] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_stack_alignContent_TEST_0300
     * @tc.name      testStackAlignContentTop
     * @tc.desc      The stack component sets alignContent to Alignment.Top
     */
    it('testStackAlignContentTop_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentTop] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.Top });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.Top');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTop] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0400
     * @tc.name      testStackAlignContentTopEnd
     * @tc.desc      The stack component sets alignContent to Alignment.TopEnd
     */
    it('testStackAlignContentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('[testStackAlignContentTopEnd] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.TopEnd });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.TopEnd');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top) - (stack_alignContent_02.top)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentTopEnd] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0500
     * @tc.name      testStackAlignContentStart
     * @tc.desc      The stack component sets alignContent to Alignment.Start
     */
    it('testStackAlignContentStart_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentStart] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.Start });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.Start');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentStart] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0600
     * @tc.name      testStackAlignContentCenter
     * @tc.desc      The stack component sets alignContent to Alignment.Center
     */
    it('testStackAlignContentCenter_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentCenter] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.Center });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.Center');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentCenter] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0700
     * @tc.name      testStackAlignContentEnd
     * @tc.desc      The stack component sets alignContent to Alignment.End
     */
    it('testStackAlignContentEnd_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentEnd] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.End });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.End');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_021.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_022.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.top - stack_alignContent_02.top) - (stack_alignContent_02.bottom - stack_alignContent_023.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentEnd] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0800
     * @tc.name      testStackAlignContentBottomStart
     * @tc.desc      The stack component sets alignContent to Alignment.BottomStart
     */
    it('testStackAlignContentBottomStart_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentBottomStart] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.BottomStart });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.BottomStart');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left) - (stack_alignContent_02.left)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottomStart] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_0900
     * @tc.name      testStackAlignContentBottom
     * @tc.desc      The stack component sets alignContent to Alignment.Bottom
     */
    it('testStackAlignContentBottom_static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentBottom] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.Bottom });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.Bottom');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_021.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_022.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.left - stack_alignContent_02.left) - (stack_alignContent_02.right - stack_alignContent_023.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottom] END');
      done();
    });
    /**
     * @tc.number    SUB_ACE_STACK_ALIGNCONTENT_TEST_1000
     * @tc.name      testStackAlignContentBottomEnd
     * @tc.desc      The stack component sets alignContent to Alignment.BottomEnd
     */
    it('testStackAlignContentBottomEnd_Static', 0, async (done: () => void): Promise<void>=> {
      console.info('[testStackAlignContentBottomEnd] START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({ name: 'addAlignContent', value: Alignment.BottomEnd });
      await CommonFunc.sleep(3000);
      let strJson = inspector.getInspectorByKey('Stack_AlignContent_02');

      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack');
      expect(JSON.parseJsonElement(strJson).getElement("$attrs").getString("alignContent")).assertEqual('Alignment.BottomEnd');
      let stack_alignContent_021:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_021');
      let stack_alignContent_022:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_022');
      let stack_alignContent_023:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_023');
      let stack_alignContent_02:RectValue  = CommonFunc.getComponentRect('Stack_AlignContent_02');
      expect(Math.abs((stack_alignContent_021.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.bottom) - (stack_alignContent_02.bottom)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_021.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_022.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((stack_alignContent_023.right) - (stack_alignContent_02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.bottom - stack_alignContent_021.top)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.bottom - stack_alignContent_022.top)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.bottom - stack_alignContent_023.top)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_021.right - stack_alignContent_021.left)) - (Math.round(uiContext.vp2px(300)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_022.right - stack_alignContent_022.left)) - (Math.round(uiContext.vp2px(200)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stack_alignContent_023.right - stack_alignContent_023.left)) - (Math.round(uiContext.vp2px(100)))) <= 1).assertTrue();
      console.info('[testStackAlignContentBottomEnd] END');
      done();
    });
  })
}
