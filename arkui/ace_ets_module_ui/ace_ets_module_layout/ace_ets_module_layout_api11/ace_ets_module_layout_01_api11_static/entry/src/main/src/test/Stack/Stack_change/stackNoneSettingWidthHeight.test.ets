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
export default function stackNoneSettingWidthHeight() {
  describe('stackNoneSettingWidthHeightTest', () => {
    beforeAll(() => {
      console.info("stackNoneSettingWidthHeightTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackNoneSettingWidthHeight',
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackNoneSettingWidthHeight state success " + JSON.stringify(pages));
        if (!("stackNoneSettingWidthHeight" == pages.name)) {
          console.info("get stackNoneSettingWidthHeight state success " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options)
          router.pushUrl(options)
          // console.info("push stackNoneSettingWidthHeight page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push stackNoneSettingWidthHeight page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(1000);
    });
    afterEach(async ():Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stackNoneSettingWidthHeight after each called");
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0100
     * @tc.name testStackDefaultSizeAlignContentTopStart
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'TopStart'.
     */
    it('testStackDefaultSizeAlignContentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackSizeDefaultKey01.right - stackSizeDefaultKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackDefaultSizeAlignContentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0200
     * @tc.name testStackDefaultSizeAlignContentTop
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'Top'.
     */
    it('testStackDefaultSizeAlignContentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackDefaultSizeAlignContentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0300
     * @tc.name testStackDefaultSizeAlignContentTopEnd
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'TopEnd'.
     */
    it('testStackDefaultSizeAlignContentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackDefaultSizeAlignContentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0400
     * @tc.name testStackDefaultSizeAlignContentStart
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'START'.
     */
    it('testStackDefaultSizeAlignContentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackDefaultSizeAlignContentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0500
     * @tc.name testStackDefaultSizeAlignContentCenter
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'Center'.
     */
    it('testStackDefaultSizeAlignContentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackDefaultSizeAlignContentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0600
     * @tc.name testStackDefaultSizeAlignContentEnd
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'End'.
     */
    it('testStackDefaultSizeAlignContentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackDefaultSizeAlignContentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0700
     * @tc.name testStackDefaultSizeAlignContentBottomStart
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'BottomStart'.
     */
    it('testStackDefaultSizeAlignContentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackDefaultSizeAlignContentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0800
     * @tc.name testStackDefaultSizeAlignContentBottom
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'Bottom'.
     */
    it('testStackDefaultSizeAlignContentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackDefaultSizeAlignContentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_DEFAULTHEIGHTWIDTH_0900
     * @tc.name testStackDefaultSizeAlignContentBottomEnd
     * @tc.desc Set stack's  default height and width  ,set alignContent mode 'BottomEnd'.
     */
    it('testStackDefaultSizeAlignContentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackDefaultSizeAlignContentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackSizeDefaultKey');

      let stackSizeDefaultKey: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey');
      let stackSizeDefaultKey01: RectValue = CommonFunc.getComponentRect('stackSizeDefaultKey01');
      expect(Math.abs((stackSizeDefaultKey.left) - (stackSizeDefaultKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.right) - (stackSizeDefaultKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.top) - (stackSizeDefaultKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackSizeDefaultKey.bottom) - (stackSizeDefaultKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((Math.round((stackSizeDefaultKey01.right - stackSizeDefaultKey01.left))) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackDefaultSizeAlignContentBottomEnd END');
      done();
    });
  })
}