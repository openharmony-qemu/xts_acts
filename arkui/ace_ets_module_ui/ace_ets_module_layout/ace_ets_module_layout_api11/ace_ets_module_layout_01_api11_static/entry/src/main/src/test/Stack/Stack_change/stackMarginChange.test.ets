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
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
export default function stackMarginChange() {
  describe('stackMarginChangeTest', () => {
    beforeAll(() => {
      console.info("stackMarginChangeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackMarginChange',
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackMarginChange state success " + JSON.stringify(pages));
        if (!("stackMarginChange" == pages.name)) {
          console.info("get stackMarginChange state success " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options)
          router.pushUrl(options)
          // console.info("push stackMarginChange page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackMarginChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
    });
    afterEach(async ():Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stackMarginChange after each called");
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0100
     * @tc.name testStackMarginAlignContentTopStart
     * @tc.desc Set stack's  margin 20  and alignContent mode 'TopStart'.
     */
    it('testStackMarginAlignContentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((stackMarginKey01.left) - (stackMarginKey.left)) <= 1).assertTrue();
      expect(Math.abs((stackMarginKey01.top) - (stackMarginKey.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackMarginAlignContentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0200
     * @tc.name testStackMarginAlignContentTop
     * @tc.desc Set stack's  margin 20  and alignContent mode 'Top'.
     */
    it('testStackMarginAlignContentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.top) - (stackMarginKey.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackMarginAlignContentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0300
     * @tc.name testStackMarginAlignContentTopEnd
     * @tc.desc Set stack's  margin 20  and alignContent mode 'TopEnd'.
     */
    it('testStackMarginAlignContentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.right) - (stackMarginKey.right)) <= 1).assertTrue();
      expect(Math.abs((stackMarginKey01.top) - (stackMarginKey.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackMarginAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0400
     * @tc.name testStackMarginAlignContentStart
     * @tc.desc Set stack's  margin 20  and alignContent mode 'START'.
     */
    it('testStackMarginAlignContentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((stackMarginKey01.left) - (stackMarginKey.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackMarginAlignContentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0500
     * @tc.name testStackMarginAlignContentCenter
     * @tc.desc Set stack's  margin 20  and alignContent mode 'Center'.
     */
    it('testStackMarginAlignContentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackMarginAlignContentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0600
     * @tc.name testStackMarginAlignContentEnd
     * @tc.desc Set stack's  margin 20  and alignContent mode 'End'.
     */
    it('testStackMarginAlignContentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.right) - (stackMarginKey.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.bottom - stackMarginKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackMarginAlignContentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0700
     * @tc.name testStackMarginAlignContentBottomStart
     * @tc.desc Set stack's  margin 20  and alignContent mode 'BottomStart'.
     */
    it('testStackMarginAlignContentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((stackMarginKey01.left) - (stackMarginKey.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.bottom) - (stackMarginKey.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackMarginAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0800
     * @tc.name testStackMarginAlignContentBottom
     * @tc.desc Set stack's  margin 20  and alignContent mode 'Bottom'.
     */
    it('testStackMarginAlignContentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey.right - stackMarginKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.bottom) - (stackMarginKey.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackMarginAlignContentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNMARGINCHANGED_0900
     * @tc.name testStackMarginAlignContentBottomEnd
     * @tc.desc Set stack's  margin 20  and alignContent mode 'BottomEnd'.
     */
    it('testStackMarginAlignContentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackMarginAlignContentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'margin', value: 20
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackMarginKey');

      let stackMarginKey: RectValue = CommonFunc.getComponentRect('stackMarginKey');
      let stackMarginKey01: RectValue = CommonFunc.getComponentRect('stackMarginKey01');
      expect(Math.abs((Math.round(stackMarginKey01.left - stackMarginKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.right) - (stackMarginKey.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.top - stackMarginKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackMarginKey01.bottom) - (stackMarginKey.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackMarginKey01.right - stackMarginKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackMarginAlignContentBottomEnd END');
      done();
    });
  })
}