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
export default function stackSizeChange() {
  describe('stackSizeChangeTest', () => {

    beforeAll(() => {
      console.info("stackSizeChangeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackSizeChange',
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackSizeChange state success " + JSON.stringify(pages));
        if (!("stackSizeChange" == pages.name)) {
          console.info("get stackSizeChange state success " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options)
          router.pushUrl(options)
          // console.info("push stackSizeChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackSizeChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
    });
    afterEach(async ():Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stackSizeChange after each called");
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0100
     * @tc.name testStackLargerAlignContentTopStart
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'TopStart'.
     */
    it('testStackLargerAlignContentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackLargerAlignContentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0200
     * @tc.name testStackLargerAlignContentTop
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'Top'.
     */
    it('testStackLargerAlignContentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackLargerAlignContentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0300
     * @tc.name testStackLargerAlignContentTopEnd
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'TopEnd'.
     */
    it('testStackLargerAlignContentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackLargerAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0400
     * @tc.name testStackLargerAlignContentStart
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'START'.
     */
    it('testStackLargerAlignContentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackLargerAlignContentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0500
     * @tc.name testStackLargerAlignContentCenter
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'Center'.
     */
    it('testStackLargerAlignContentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackLargerAlignContentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0600
     * @tc.name testStackLargerAlignContentEnd
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'End'.
     */
    it('testStackLargerAlignContentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.bottom - stackSizeKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackLargerAlignContentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0700
     * @tc.name testStackLargerAlignContentBottomStart
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'BottomStart'.
     */
    it('testStackLargerAlignContentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackLargerAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0800
     * @tc.name testStackLargerAlignContentBottom
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'Bottom'.
     */
    it('testStackLargerAlignContentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.right - stackSizeKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackLargerAlignContentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_0900
     * @tc.name testStackLargerAlignContentBottomEnd
     * @tc.desc Set stack's  height and width 300*300 and alignContent mode 'BottomEnd'.
     */
    it('testStackLargerAlignContentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLargerAlignContentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 300
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 300
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey01.left - stackSizeKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.top - stackSizeKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackLargerAlignContentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1000
     * @tc.name testStackEqualAlignContentBottomTopStart
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'TopStart'.
     */
    it('testStackEqualAlignContentBottomTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackEqualAlignContentBottomTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1100
     * @tc.name testStackEqualAlignContentBottomTop
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'Top'.
     */
    it('testStackEqualAlignContentBottomTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackEqualAlignContentBottomTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1200
     * @tc.name testStackEqualAlignContentBottomTopEnd
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'TopEnd'.
     */
    it('testStackEqualAlignContentBottomTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackEqualAlignContentBottomTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1300
     * @tc.name testStackEqualAlignContentBottomStart
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'START'.
     */
    it('testStackEqualAlignContentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackEqualAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1400
     * @tc.name testStackEqualAlignContentCenter
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'Center'.
     */
    it('testStackEqualAlignContentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackEqualAlignContentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1500
     * @tc.name testStackEqualAlignContentEnd
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'End'.
     */
    it('testStackEqualAlignContentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackEqualAlignContentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1600
     * @tc.name testStackEqualAlignContentBottomStart
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'BottomStart'.
     */
    it('testStackEqualAlignContentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackEqualAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1700
     * @tc.name testStackEqualAlignContentBottom
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'Bottom'.
     */
    it('testStackEqualAlignContentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackEqualAlignContentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1800
     * @tc.name testStackEqualAlignContentBottomEnd
     * @tc.desc Set stack's  height and width 200*200 and alignContent mode 'BottomEnd'.
     */
    it('testStackEqualAlignContentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackEqualAlignContentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 200
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 200
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackEqualAlignContentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_1900
     * @tc.name testStackLessAlignContentTopStart
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'TopStart'.
     */
    it('testStackLessAlignContentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackLessAlignContentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2000
     * @tc.name testStackLessAlignContentTop
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'Top'.
     */
    it('testStackLessAlignContentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackLessAlignContentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2100
     * @tc.name testStackLessAlignContentTopEnd
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'TopEnd'.
     */
    it('testStackLessAlignContentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.top) - (stackSizeKey01.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackLessAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2200
     * @tc.name testStackLessAlignContentStart
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'START'.
     */
    it('testStackLessAlignContentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackLessAlignContentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2300
     * @tc.name testStackLessAlignContentCenter
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'Center'.
     */
    it('testStackLessAlignContentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackLessAlignContentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2400
     * @tc.name testStackLessAlignContentEnd
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'End'.
     */
    it('testStackLessAlignContentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.bottom - stackSizeKey.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackLessAlignContentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2500
     * @tc.name testStackLessAlignContentBottomStart
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'BottomStart'.
     */
    it('testStackLessAlignContentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((stackSizeKey.left) - (stackSizeKey01.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackLessAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2600
     * @tc.name testStackLessAlignContentBottom
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'Bottom'.
     */
    it('testStackLessAlignContentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackLessAlignContentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNSIZECHANGED_2700
     * @tc.name testStackLessAlignContentBottomEnd
     * @tc.desc Set stack's  height and width 100*100 and alignContent mode 'BottomEnd'.
     */
    it('testStackLessAlignContentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackLessAlignContentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'height', value: 100
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'width', value: 100
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeKey');

      let stackSizeKey: RectValue = CommonFunc.getComponentRect('stackSizeKey');
      let stackSizeKey01: RectValue = CommonFunc.getComponentRect('stackSizeKey01');
      expect(Math.abs((Math.round(stackSizeKey.left - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.right) - (stackSizeKey01.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey.top - stackSizeKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackSizeKey.bottom) - (stackSizeKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeKey01.right - stackSizeKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackLessAlignContentBottomEnd END');
      done();
    });
  })
}