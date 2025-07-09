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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../hypium/index";
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
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
export default function stackPaddingChange() {
  describe('stackPaddingChangeTest', () => {
    beforeAll(() => {
      console.info("stackPaddingChangeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackPaddingChange',
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackPaddingChange state success " + JSON.stringify(pages));
        if (!("stackPaddingChange" == pages.name)) {
          console.info("get stackPaddingChange state success " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options)
          router.pushUrl(options)
          // console.info("push stackPaddingChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackPaddingChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
    });
    afterEach(async ():Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stackPaddingChange after each called");
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0100
     * @tc.name testStackAlignPaddingAlignTopStart
     * @tc.desc Set stack's  padding 10  and alignContent mode 'TopStart'.
     */
    it('testStackAlignPaddingAlignTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignPaddingAlignTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0200
     * @tc.name testStackAlignPaddingAlignTop
     * @tc.desc Set stack's  padding 10  and alignContent mode 'Top'.
     */
    it('testStackAlignPaddingAlignTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignPaddingAlignTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0300
     * @tc.name testStackAlignPaddingAlignTopEnd
     * @tc.desc Set stack's  padding 10  and alignContent mode 'TopEnd'.
     */
    it('testStackAlignPaddingAlignTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignPaddingAlignTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0400
     * @tc.name testStackAlignPaddingAlignStart
     * @tc.desc Set stack's  padding 10  and alignContent mode 'START'.
     */
    it('testStackAlignPaddingAlignStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignPaddingAlignStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0500
     * @tc.name testStackAlignPaddingAlignCenter
     * @tc.desc Set stack's  padding 10  and alignContent mode 'Center'.
     */
    it('testStackAlignPaddingAlignCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignPaddingAlignCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0600
     * @tc.name testStackAlignPaddingAlignEnd
     * @tc.desc Set stack's  padding 10  and alignContent mode 'End'.
     */
    it('testStackAlignPaddingAlignEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(40))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(10))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1).assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignPaddingAlignEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0700
     * @tc.name testStackAlignPaddingAlignBottomStart
     * @tc.desc Set stack's  padding 10  and alignContent mode 'BottomStart'.
     */
    it('testStackAlignPaddingAlignBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignPaddingAlignBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0800
     * @tc.name testStackAlignPaddingAlignBottom
     * @tc.desc Set stack's  padding 10  and alignContent mode 'Bottom'.
     */
    it('testStackAlignPaddingAlignBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignPaddingAlignBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_0900
     * @tc.name testStackAlignPaddingAlignBottomEnd
     * @tc.desc Set stack's  padding 10  and alignContent mode 'BottomEnd'.
     */
    it('testStackAlignPaddingAlignBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingAlignBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 10
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(40))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(10))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignPaddingAlignBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1000
     * @tc.name testStackAlignPaddingExceedAlignTopStart
     * @tc.desc Set stack's  padding 30  and alignContent mode 'TopStart'.
     */
    it('testStackAlignPaddingExceedAlignTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignPaddingExceedAlignTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1100
     * @tc.name testStackAlignPaddingExceedAlignTop
     * @tc.desc Set stack's  padding 30  and alignContent mode 'Top'.
     */
    it('testStackAlignPaddingExceedAlignTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignPaddingExceedAlignTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1200
     * @tc.name testStackAlignPaddingExceedAlignTopEnd
     * @tc.desc Set stack's  padding 30  and alignContent mode 'TopEnd'.
     */
    it('testStackAlignPaddingExceedAlignTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignPaddingExceedAlignTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1300
     * @tc.name testStackAlignPaddingExceedAlignStart
     * @tc.desc Set stack's  padding 30  and alignContent mode 'START'.
     */
    it('testStackAlignPaddingExceedAlignStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignPaddingExceedAlignStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1400
     * @tc.name testStackAlignPaddingExceedAlignCenter
     * @tc.desc Set stack's  padding 30  and alignContent mode 'Center'.
     */
    it('testStackAlignPaddingExceedAlignCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignPaddingExceedAlignCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1500
     * @tc.name testStackAlignPaddingExceedAlignEnd
     * @tc.desc Set stack's  padding 30  and alignContent mode 'End'.
     */
    it('testStackAlignPaddingExceedAlignEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignPaddingExceedAlignEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1600
     * @tc.name testStackAlignPaddingExceedAlignBottomStart
     * @tc.desc Set stack's  padding 30  and alignContent mode 'BottomStart'.
     */
    it('testStackAlignPaddingExceedAlignBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignPaddingExceedAlignBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1700
     * @tc.name testStackAlignPaddingExceedAlignBottom
     * @tc.desc Set stack's  padding 30  and alignContent mode 'Bottom'.
     */
    it('testStackAlignPaddingExceedAlignBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left)- uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(25))) <= 1).assertTrue()
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignPaddingExceedAlignBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNPADDINGCHANGED_1800
     * @tc.name testStackAlignPaddingExceedAlignBottomEnd
     * @tc.desc Set stack's  padding 30  and alignContent mode 'BottomEnd'.
     */
    it('testStackAlignPaddingExceedAlignBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignPaddingExceedAlignBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'padding', value: 30
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackPaddingKey');

      let stackPaddingKey: RectValue = CommonFunc.getComponentRect('stackPaddingKey');
      let stackPaddingKey01: RectValue = CommonFunc.getComponentRect('stackPaddingKey01');
      expect(Math.floor(Math.abs((stackPaddingKey01.left - stackPaddingKey.left) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey01.right) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.top - stackPaddingKey.top) - uiContext.vp2px(20))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.bottom - stackPaddingKey01.bottom) - uiContext.vp2px(30))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey01.right - stackPaddingKey01.left) - uiContext.vp2px(250))) <= 1)
        .assertTrue();
      expect(Math.floor(Math.abs((stackPaddingKey.right - stackPaddingKey.left) - uiContext.vp2px(300))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignPaddingExceedAlignBottomEnd END');
      done();
    });
  })
}