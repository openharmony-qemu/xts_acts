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
import inspector from '@ohos.arkui.inspector';
import { Alignment } from '@ohos.arkui.component';
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
export default function stackAlignChange() {
  describe('stackAlignChangeTest', () => {
    beforeAll(() => {
      console.info("stackAlignChange beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async ():Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Stack/Stack_change/stackAlignChange',
      };
      try {
        const router = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        router.clear();
        await CommonFunc.sleep(1000);
        let pages = router.getState();
        console.info("get stackAlignChange state success " + JSON.stringify(pages));
        if (!("stackAlignChange" == pages.name)) {
          console.info("get stackAlignChange state success " + JSON.stringify(pages.name));
          // let result = await router.pushUrl(options)
          router.pushUrl(options)
          // console.info("push stackAlignChange page success " + JSON.stringify(result));
        }
      } catch (err:Error) {
        console.error("push stackAlignChange page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
    });
    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("stackAlignChangeTop after each called");
    });


    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0100
     * @tc.name testStackAlignTopStartAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignTopStartAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0200
     * @tc.name testStackAlignTopStartAlignmentTop
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignTopStartAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0300
     * @tc.name testStackAlignTopStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignTopStartAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0400
     * @tc.name testStackAlignTopStartAlignmentStart
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignTopStartAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0500
     * @tc.name testStackAlignTopStartAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignTopStartAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      console.info('new testStackAlignTopStartAlignmentCenter END');
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0600
     * @tc.name testStackAlignTopStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.End'.
     */
    it('testStackAlignTopStartAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0700
     * @tc.name testStackAlignTopStartAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignTopStartAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0800
     * @tc.name testStackAlignTopStartAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignTopStartAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_0900
     * @tc.name testStackAlignTopStartAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.TopStart' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignTopStartAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopStartAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopStart')
      console.info('new testStackAlignTopStartAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1000
     * @tc.name testStackAlignTopAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignTopAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1100
     * @tc.name testStackAlignTopAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignTopAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1200
     * @tc.name testStackAlignTopAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignTopAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1300
     * @tc.name testStackAlignTopAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignTopAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1400
     * @tc.name testStackAlignTopAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignTopAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1500
     * @tc.name testStackAlignTopAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.End'.
     */
    it('testStackAlignTopAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1600
     * @tc.name testStackAlignTopAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignTopAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1700
     * @tc.name testStackAlignTopAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignTopAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1800
     * @tc.name testStackAlignTopAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Top' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignTopAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Top
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Top")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Top')
      console.info('new testStackAlignTopAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_1900
     * @tc.name testStackAlignTopEndAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignTopEndAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2000
     * @tc.name testStackAlignTopEndAlignmentTop
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignTopEndAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2100
     * @tc.name testStackAlignTopEndAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignTopEndAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2200
     * @tc.name testStackAlignTopEndAlignmentStart
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignTopEndAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2300
     * @tc.name testStackAlignTopEndAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignTopEndAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2400
     * @tc.name testStackAlignTopEndAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.End'.
     */
    it('testStackAlignTopEndAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.top - stackTopStartKey01.top) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.top - stackTopStartKey02.top) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2500
     * @tc.name testStackAlignTopEndAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignTopEndAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2600
     * @tc.name testStackAlignTopEndAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignTopEndAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2700
     * @tc.name testStackAlignTopEndAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.TopEnd' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignTopEndAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignTopEndAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.TopEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.top) - (stackTopStartKey01.top)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.top) - (stackTopStartKey02.top)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.TopEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.TopEnd')
      console.info('new testStackAlignTopEndAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2800
     * @tc.name testStackAlignStartAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignStartAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_2900
     * @tc.name testStackAlignStartAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignStartAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3000
     * @tc.name testStackAlignStartAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignStartAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3100
     * @tc.name testStackAlignStartAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignStartAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3200
     * @tc.name testStackAlignStartAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignStartAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3300
     * @tc.name testStackAlignStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.End'.
     */
    it('testStackAlignStartAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3400
     * @tc.name testStackAlignStartAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignStartAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3500
     * @tc.name testStackAlignStartAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignStartAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3600
     * @tc.name testStackAlignStartAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Start' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignStartAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignStartAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Start
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Start")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Start')
      console.info('new testStackAlignStartAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3700
     * @tc.name testStackAlignCenterAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignCenterAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3800
     * @tc.name testStackAlignCenterAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignCenterAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_3900
     * @tc.name testStackAlignCenterAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignCenterAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4000
     * @tc.name testStackAlignCenterAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignCenterAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4100
     * @tc.name testStackAlignCenterAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignCenterAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4200
     * @tc.name testStackAlignCenterAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.End'.
     */
    it('testStackAlignCenterAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4300
     * @tc.name testStackAlignCenterAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignCenterAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4400
     * @tc.name testStackAlignCenterAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignCenterAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4500
     * @tc.name testStackAlignCenterAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Center' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignCenterAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignCenterAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Center
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(Math.round(stackTopStartKey01.top - stackTopStartKey.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.top - stackTopStartKey01.top) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.left - stackTopStartKey.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.left - stackTopStartKey01.left) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey.right - stackTopStartKey01.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey02.right) - Math.round(uiContext.vp2px(50))) <= 1)
        .assertTrue();

      expect(Math.abs(Math.round(stackTopStartKey01.right - stackTopStartKey01.left) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top) - Math.round(uiContext.vp2px(200))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.right - stackTopStartKey02.left) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top) - Math.round(uiContext.vp2px(100))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Center")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Center')
      console.info('new testStackAlignCenterAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4600
     * @tc.name testStackAlignEndAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignEndAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4700
     * @tc.name testStackAlignEndAlignmentTop
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignEndAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4800
     * @tc.name testStackAlignEndAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignEndAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_4900
     * @tc.name testStackAlignEndAlignmentStart
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignEndAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5000
     * @tc.name testStackAlignEndAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignEndAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5100
     * @tc.name testStackAlignEndAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.End'.
     */
    it('testStackAlignEndAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5200
     * @tc.name testStackAlignEndAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignEndAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5300
     * @tc.name testStackAlignEndAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignEndAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5400
     * @tc.name testStackAlignEndAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.End' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignEndAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignEndAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.End
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.bottom - stackTopStartKey01.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey02.bottom)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.End")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.End')
      console.info('new testStackAlignEndAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5500
     * @tc.name testStackAlignBottomStartAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignBottomStartAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5600
     * @tc.name testStackAlignBottomStartAlignmentTop
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignBottomStartAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5700
     * @tc.name testStackAlignBottomStartAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignBottomStartAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5800
     * @tc.name testStackAlignBottomStartAlignmentStart
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignBottomStartAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_5900
     * @tc.name testStackAlignBottomStartAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignBottomStartAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6000
     * @tc.name testStackAlignBottomStartAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.End'.
     */
    it('testStackAlignBottomStartAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.left - stackTopStartKey01.left) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.left - stackTopStartKey02.left) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6100
     * @tc.name testStackAlignBottomStartAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignBottomStartAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6200
     * @tc.name testStackAlignBottomStartAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignBottomStartAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6300
     * @tc.name testStackAlignBottomStartAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.BottomStart' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignBottomStartAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomStartAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomStart
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.left) - (stackTopStartKey01.left)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.left) - (stackTopStartKey02.left)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomStart")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomStart')
      console.info('new testStackAlignBottomStartAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6400
     * @tc.name testStackAlignBottomAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignBottomAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6500
     * @tc.name testStackAlignBottomAlignmentTop
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignBottomAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6600
     * @tc.name testStackAlignBottomAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignBottomAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6700
     * @tc.name testStackAlignBottomAlignmentStart
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignBottomAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6800
     * @tc.name testStackAlignBottomAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignBottomAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_6900
     * @tc.name testStackAlignBottomAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.End'.
     */
    it('testStackAlignBottomAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7000
     * @tc.name testStackAlignBottomAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignBottomAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7100
     * @tc.name testStackAlignBottomAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignBottomAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7200
     * @tc.name testStackAlignBottomAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.Bottom' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignBottomAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.Bottom
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey.right - stackTopStartKey01.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey02.right)) - (Math.round(uiContext.vp2px(50)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.Bottom")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.Bottom')
      console.info('new testStackAlignBottomAlignmentBottomEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7300
     * @tc.name testStackAlignBottomEndAlignmentTopStart
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.TopStart'.
     */
    it('testStackAlignBottomEndAlignmentTopStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentTopStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue()
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue()
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue()

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTopStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7400
     * @tc.name testStackAlignBottomEndAlignmentTop
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Top'.
     */
    it('testStackAlignBottomEndAlignmentTop_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentTop START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Top
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTop END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7500
     * @tc.name testStackAlignBottomEndAlignmentTopEnd
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.TopEnd'.
     */
    it('testStackAlignBottomEndAlignmentTopEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentTopEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.TopEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentTopEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7600
     * @tc.name testStackAlignBottomEndAlignmentStart
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Start'.
     */
    it('testStackAlignBottomEndAlignmentStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Start
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7700
     * @tc.name testStackAlignBottomEndAlignmentCenter
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Center'.
     */
    it('testStackAlignBottomEndAlignmentCenter_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentCenter START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Center
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentCenter END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7800
     * @tc.name testStackAlignBottomEndAlignmentEnd
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.End'.
     */
    it('testStackAlignBottomEndAlignmentEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.End
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs(stackTopStartKey.right - stackTopStartKey01.right) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.right - stackTopStartKey02.right) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs(stackTopStartKey.bottom - stackTopStartKey01.bottom) <= 1).assertTrue();
      expect(Math.abs(stackTopStartKey01.bottom - stackTopStartKey02.bottom) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentEnd END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_7900
     * @tc.name testStackAlignBottomEndAlignmentBottomStart
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.BottomStart'.
     */
    it('testStackAlignBottomEndAlignmentBottomStart_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentBottomStart START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomStart
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottomStart END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_8000
     * @tc.name testStackAlignBottomEndAlignmentBottom
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.Bottom'.
     */
    it('testStackAlignBottomEndAlignmentBottom_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentBottom START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.Bottom
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');
      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottom END');
      done();
    });

    /**
     * @tc.number SUB_ACE_STACK_ALIGNCHANGED_8100
     * @tc.name testStackAlignBottomEndAlignmentBottomEnd
     * @tc.desc Parent component set align 'Alignment.BottomEnd' and alignContent 'Alignment.BottomEnd'.
     */
    it('testStackAlignBottomEndAlignmentBottomEnd_static', 0, async (done: () => void): Promise<void> => {
      console.info('new testStackAlignBottomEndAlignmentBottomEnd START');
      const uiContext = new UIContext();
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'align', value: Alignment.BottomEnd
      });
      AppStorage.get<MessageManager<number>>("messageManager", Type.from<number>())?.notify({
        name: 'alignContent', value: Alignment.BottomEnd
      });
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('stackTopStartKey');

      let stackTopStartKey: RectValue = CommonFunc.getComponentRect('stackTopStartKey');
      let stackTopStartKey01: RectValue = CommonFunc.getComponentRect('stackTopStartKey01');
      let stackTopStartKey02: RectValue = CommonFunc.getComponentRect('stackTopStartKey02');

      expect(Math.abs((stackTopStartKey.right) - (stackTopStartKey01.right)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.right) - (stackTopStartKey02.right)) <= 1).assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.left - stackTopStartKey.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.left - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.top - stackTopStartKey.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.top - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((stackTopStartKey.bottom) - (stackTopStartKey01.bottom)) <= 1).assertTrue();
      expect(Math.abs((stackTopStartKey01.bottom) - (stackTopStartKey02.bottom)) <= 1).assertTrue();

      expect(Math.abs((Math.round(stackTopStartKey01.right - stackTopStartKey01.left)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey01.bottom - stackTopStartKey01.top)) - (Math.round(uiContext.vp2px(200)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.right - stackTopStartKey02.left)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(Math.abs((Math.round(stackTopStartKey02.bottom - stackTopStartKey02.top)) - (Math.round(uiContext.vp2px(100)))) <= 1)
        .assertTrue();
      expect(JSON.parseJsonElement(strJson).getString("$type")).assertEqual('Stack')
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('align')).assertEqual("Alignment.BottomEnd")
      expect(JSON.parseJsonElement(strJson).getElement('$attrs').getString('alignContent')).assertEqual('Alignment.BottomEnd')
      console.info('new testStackAlignBottomEndAlignmentBottomEnd END');
      done();
    });
  })
}