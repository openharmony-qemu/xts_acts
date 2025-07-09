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

export default function AlignSpaceEvenly_AddVisibility() {
  describe('AlignSpaceEvenly_AddVisibility', () => {

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
        url: 'MainAbility/pages/Flex/justifyContent/SpaceEvenly/AlignSpaceEvenly_AddVisibility',
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
      console.info("AlignSpaceEvenly_AddVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1000
     * @tc.name textFlexAlignSpaceEvenlyTextVisibilityNone_static
     * @tc.desc The subcomponent sets the visibility. None, the child components are hidden in the interface display
     */
    it('textFlexAlignSpaceEvenlyTextVisibilityNone_static', 0, async () : Promise<void> => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityNone] START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'OneVisibility', value: 0
          });

        }

        GlobalContext.getContext()?.getObject<number>('value')?.message?.notify({
          name: 'OneVisibility', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');

        const uiContext = new UIContext();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_01.left) - Math.round(uiContext.vp2px(200 / 3))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) - Math.round(uiContext.vp2px(200 / 3))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) - Math.round(uiContext.vp2px(200 / 3))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(uiContext.vp2px(100))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();


      } catch (err:Error) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityNone] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityNone] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1100
     * @tc.name textFlexAlignSpaceEvenlyTextVisibilityHidden_static
     * @tc.desc When the subcomponent sets visibility.hidden, the interface of the subcomponent does not occupy the
     * position
     */
    it('textFlexAlignSpaceEvenlyTextVisibilityHidden_static', 0, async () : Promise<void> => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityHidden] START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'OneVisibility', value: 0
          });

        }
        /*GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Hidden
        });*/
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Hidden");
        let SpaceEvenly_AddVisibility_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');
        const uiContext = new UIContext();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(Math.round(SpaceEvenly_AddVisibility_012.top)) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(Math.round(SpaceEvenly_AddVisibility_012.top)) - Math.round(SpaceEvenly_AddVisibility_011.top)) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();


        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top) - Math.round(uiContext.vp2px(50))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(uiContext.vp2px(100))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();

      } catch (err:Error) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityHidden] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityHidden] END');

    });
    /**
     * @tc.number SUB_ACE_FLEX_JUSTIFYCONTENT_FLEXALIGN_SPACEEVENLY_TEST_1700
     * @tc.name textFlexAlignSpaceEvenlyTextVisibilityVisible_static
     * @tc.desc The subcomponent sets the visibility. Visible, the subcomponent does not occupy a position in the
     * interface display
     */
    it('textFlexAlignSpaceEvenlyTextVisibilityVisible_static', 0, async () : Promise<void> => {
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityVisible] START');
      try {
        const result = GlobalContext.getContext().getObject<number>('value')
        if (result !== null) {
          (result! as FaceValue<number>).message.notify({
            name: 'OneVisibility', value: 0
          });

        }
       /* GlobalContext.getContext().getObject<number>('value').message.notify({
          name: 'OneVisibility', value: Visibility.Visible
        });*/
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_01');

        let strJson2 = inspector.getInspectorByKey('SpaceEvenly_AddVisibility_011');

        expect(JSON.parseJsonElement(strJson).getString('$type')).assertEqual('Flex');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('direction')).assertEqual('FlexDirection.Row');
        expect(JSON.parseJsonElement(strJson).getElement('$attrs').getElement('constructor').getString('justifyContent')).assertEqual('FlexAlign.SpaceEvenly');
        expect(JSON.parseJsonElement(strJson2).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
        let SpaceEvenly_AddVisibility_011: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_011');
        let SpaceEvenly_AddVisibility_012: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_012');
        let SpaceEvenly_AddVisibility_013: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_013');
        let SpaceEvenly_AddVisibility_01: RectValue = CommonFunc.getComponentRect('SpaceEvenly_AddVisibility_01');

        const uiContext = new UIContext();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_013.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_01.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.top) - Math.round(SpaceEvenly_AddVisibility_011.top)) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_011.left - SpaceEvenly_AddVisibility_01.left) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_01.right - SpaceEvenly_AddVisibility_013.right) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_012.left - SpaceEvenly_AddVisibility_011.right) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round((SpaceEvenly_AddVisibility_013.left - SpaceEvenly_AddVisibility_012.right) * 100) / 100 - Math.round(uiContext.vp2px(12.5) * 100) / 100) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.right - SpaceEvenly_AddVisibility_011.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.right - SpaceEvenly_AddVisibility_012.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.right - SpaceEvenly_AddVisibility_013.left) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_011.bottom - SpaceEvenly_AddVisibility_011.top) - Math.round(uiContext.vp2px(50))) <= 2)
          .assertTrue();

        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_012.bottom - SpaceEvenly_AddVisibility_012.top) - Math.round(uiContext.vp2px(100))) <= 2)
          .assertTrue();
        expect(Math.abs(Math.round(SpaceEvenly_AddVisibility_013.bottom - SpaceEvenly_AddVisibility_013.top) - Math.round(uiContext.vp2px(150))) <= 2)
          .assertTrue();

      } catch (err:Error) {
        console.error('[textFlexAlignSpaceEvenlyTextVisibilityVisible] failed' + JSON.stringify(err));
        expect().assertFail();
      }
      console.info('[textFlexAlignSpaceEvenlyTextVisibilityVisible] END');

    });
  })
}
