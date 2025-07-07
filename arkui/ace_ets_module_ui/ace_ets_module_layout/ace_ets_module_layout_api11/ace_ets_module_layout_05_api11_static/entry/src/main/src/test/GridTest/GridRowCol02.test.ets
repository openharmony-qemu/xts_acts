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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../hypium/index"
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function GridRowCol02() {
  describe('GridRowCol02', () => {
    beforeAll(() => {
      console.info("GridRowCol02 beforeAll start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split05.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("GridRowCol02 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridRowCol02',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridRowCol02 state pages: " + JSON.stringify(pages));
        if (!("blank3" == pages.name)) {
          console.info("get GridRowCol02 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridRowCol02 page error: " + err);
      }
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_017
      * @tc.name  : GridRowCol02_static_001
      * @tc.desc  : set rowsTemplate to repeat(auto-fit,10%)
      * @tc.level : Level 3
      */
    it('GridRowCol02_static_001', 0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol02_static_001] START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowsTemplate', value: 'repeat(auto-fit,10%)' });
      await CommonFunc.sleep(200);
      let strJson1 = inspector.getInspectorByKey('GridRowCol02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol02_static_001] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('rowsTemplate')).assertEqual('repeat(auto-fit,10%)');

      console.info('[GridRowCol02_static_001] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_027 016
      * @tc.name  : GridRowCol02_static_002
      * @tc.desc  : set rowsTemplate to repeat(auto-fit,10%)
      * @tc.level : Level 3
      */
    it('GridRowCol02_static_002', 0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol02_static_002] START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(200);
      let strJson1 = inspector.getInspectorByKey('GridRowCol02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol02_static_002] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('rowsTemplate')).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_static_002] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_026
      * @tc.name  : GridRowCol02_static_003
      * @tc.desc  : set rowsTemplate to repeat(auto-fit,10%)
      * @tc.level : Level 3
      */
    it('GridRowCol02_static_003', 0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol02_static_003] START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowsTemplate', value: 'repeat(auto-fit,-1)' });
      await CommonFunc.sleep(200);
      let strJson1 = inspector.getInspectorByKey('GridRowCol02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol02_static_003] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('rowsTemplate')).assertEqual('repeat(auto-fit,-1)');

      console.info('[GridRowCol02_static_003] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_025
      * @tc.name  : GridRowCol02_static_004
      * @tc.desc  : set rowsTemplate to repeat(auto-fit,10%)
      * @tc.level : Level 3
      */
    it('GridRowCol02_static_004', 0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol02_static_004] START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(1000);
      let Column02 = CommonFunc.getComponentRect('Column02');
      let GridRowCol02 = CommonFunc.getComponentRect('GridRowCol02');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(GridRowCol02.top - Column02.top) - Math.round(uiContext.vp2px(10))) <= 1).assertTrue();
      let strJson1 = inspector.getInspectorByKey('GridRowCol02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol02_static_004] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('rowsTemplate')).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_static_004] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_024
      * @tc.name  : GridRowCol02_static_005
      * @tc.desc  : set rowsTemplate to repeat(auto-fit,10%)
      * @tc.level : Level 3
      */
    it('GridRowCol02_static_005', 0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol02_static_005] START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(1000);
      let GridRowCol02 = CommonFunc.getComponentRect('GridRowCol02');
      let Item00 = CommonFunc.getComponentRect('Item00');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.abs(Math.round(Item00.top - GridRowCol02.top) - Math.round(uiContext.vp2px(10))) <= 1).assertTrue();
      let strJson1 = inspector.getInspectorByKey('GridRowCol02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol02_static_005] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('rowsTemplate')).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_static_005] END');
      done();
    });

    /* *
      * @tc.number: SUB_ACE_FUNCTION_JICHU_SR000HQ76H_019
      * @tc.name  : GridRowCol02_static_006
      * @tc.desc  : set rowsTemplate to repeat(auto-fit,10%)
      * @tc.level : Level 3
      */
    it('GridRowCol02_static_006', 0, async (done: () => void): Promise<void> => {

      console.info('[GridRowCol02_static_006] START');
      await CommonFunc.sleep(1000);
      (GlobalContext.getContext().getObject('value', Type.from<MessageManager<string>>())! as MessageManager<string>).notify({name:'rowsTemplate', value: 'repeat(auto-fit,90px)' });
      await CommonFunc.sleep(1000);
      let Item00 = CommonFunc.getComponentRect('Item00');
      let Item03 = CommonFunc.getComponentRect('Item03');
      await CommonFunc.sleep(1000);
      const uiContext = new UIContext();
      expect(Math.abs(Math.abs(Item03.top - Item00.bottom) - uiContext.vp2px(10)) <= 1).assertTrue();
      let strJson1 = inspector.getInspectorByKey('GridRowCol02');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[GridRowCol02_static_006] component obj is: " + JSON.stringify(obj1));
      await CommonFunc.sleep(1000);
      expect(obj1.getElement('$attrs').getString('rowsTemplate')).assertEqual('repeat(auto-fit,90px)');

      console.info('[GridRowCol02_static_006] END');
      done();
    });



  })
}
