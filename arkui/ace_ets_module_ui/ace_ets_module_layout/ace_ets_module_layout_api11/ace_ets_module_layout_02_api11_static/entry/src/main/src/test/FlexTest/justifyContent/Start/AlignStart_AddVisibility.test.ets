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

import { describe, beforeEach, it, expect, Level, afterEach, beforeAll } from '../../../../../../hypium/index'
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../../Util.test';
import router from '@ohos.router';
import inspector from '@ohos.arkui.inspector';
import RectValue from '../../../../../ets/MainAbility/common/Rect';
import { FaceValue } from '../../../../../ets/MainAbility/common/Value';
import GlobalContext from '../../../../../ets/MainAbility/common/GlobalContext';
import {Alignment,Visibility } from '@ohos.arkui.component'
import { Router } from '@ohos.arkui.UIContext';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function AlignStart_AddVisibility() {
  describe('AlignStart_AddVisibility', () => {

    beforeAll(() => {
      console.info("SearchTypeTest beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.split02.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("richEditorApi2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Flex/justifyContent/Start/AlignStart_AddVisibility',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get richEditorApi2 state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get richEditorApi2 pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push richEditorApi2 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push richEditorApi2 page error:" + err);
      }
      console.info("richEditorApi2 beforeEach end");
    });

    afterEach(async () : Promise<void> => {
      await CommonFunc.sleep(2000);
      console.info("AlignStart_AddVisibility after each called");
    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1000
     * @tc.name testFlexAlignStartTextVisibilityNone_static
     * @tc.desc The subcomponent sets the visibility. None, the child components are hidden in the interface display
     */
    it('testFlexAlignStartTextVisibilityNone_static', 0, async () : Promise<void> => {
      console.info('[testFlexAlignStartTextVisibilityNone] START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'OneVisibility', value: 0
          });

        }
        GlobalContext.getContext().getObject<number>('value')?.message?.notify({
          name: 'OneVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');
        const uiContext = new UIContext();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_01.left) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.right - Start_AddVisibility_013.left) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - uiContext.vp2px(100)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_01.right - Start_AddVisibility_013.right) - uiContext.vp2px(200)) <= 1).assertTrue();
      } catch (err:Error) {
        console.error('[testFlexAlignStartTextVisibilityNone] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityNone] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1100
     * @tc.name testFlexAlignStartTextVisibilityHidden_static
     * @tc.desc When the subcomponent sets visibility.hidden, the interface of the subcomponent does not occupy the
     * position
     */
    it('testFlexAlignStartTextVisibilityHidden_static', 0, async () : Promise<void> => {
      console.info('[testFlexAlignStartTextVisibilityHidden] START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'OneVisibility', value: 0
          });

        }
        GlobalContext.getContext().getObject<number>('value')?.message?.notify({
          name: 'OneVisibility', value: Visibility.Hidden
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let Start_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_011');
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');
        const uiContext = new UIContext();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right) <= 1).assertTrue();
        expect(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - uiContext.vp2px(50)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - uiContext.vp2px(100)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      } catch (err:Error) {
        console.error('[testFlexAlignStartTextVisibilityHidden] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_START_TEST_1700
     * @tc.name testFlexAlignStartTextVisibilityVisible_static
     * @tc.desc The subcomponent sets the visibility. Visible, the subcomponent does not occupy a position in the
     * interface display
     */
    it('testFlexAlignStartTextVisibilityVisible_static', 0, async () : Promise<void> => {
      console.info('[testFlexAlignStartTextVisibilityVisible] START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'OneVisibility', value: 0
          });

        }
        GlobalContext.getContext().getObject<number>('value')?.message?.notify({
          name: 'OneVisibility', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('Start_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('Start_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.Start');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let Start_AddVisibility_011: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_011');
        let Start_AddVisibility_012: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_012');
        let Start_AddVisibility_013: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_013');
        let Start_AddVisibility_01: RectValue = CommonFunc.getComponentRect('Start_AddVisibility_01');
        const uiContext = new UIContext();
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_011.top) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_013.top) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_012.top - Start_AddVisibility_01.top) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_012.left - Start_AddVisibility_011.right) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_013.left - Start_AddVisibility_012.right) <= 1).assertTrue()
        expect(Math.abs(Start_AddVisibility_01.left - Start_AddVisibility_011.left) <= 1).assertTrue()
        expect(Math.abs((Start_AddVisibility_011.right - Start_AddVisibility_011.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.right - Start_AddVisibility_012.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.right - Start_AddVisibility_013.left) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_011.bottom - Start_AddVisibility_011.top) - uiContext.vp2px(50)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.bottom - Start_AddVisibility_012.top) - uiContext.vp2px(100)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_013.bottom - Start_AddVisibility_013.top) - uiContext.vp2px(150)) <= 1).assertTrue();
        expect(Math.abs((Start_AddVisibility_012.left - Start_AddVisibility_01.left) - uiContext.vp2px(150)) <= 1).assertTrue();
      } catch (err:Error) {
        console.error('[testFlexAlignStartTextVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('[testFlexAlignStartTextVisibilityVisible] END');

    });
  })
}
