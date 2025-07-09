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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "../../../../../hypium/index";
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from "../../../../ets/MainAbility/common/Common";
import { GlobalContext } from '../../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext } from "@ohos.arkui.UIContext";
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Visibility } from '@ohos.arkui.component'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function ColumnSetVisibility_SubChange() {
  describe('ColumnSetVisibility_SubChange', () => {
    beforeAll(() => {
      console.info("ColumnSetVisibility_SubChange beforeEach start");
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.layout.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetVisibilityTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetVisibility_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetVisibilityTest state pages:" + JSON.stringify(pages));
        if (!("TextClockApi" == pages.name)) {
          console.info("get ColumnSetVisibilityTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push ColumnSetVisibilityTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetVisibilityTest page error:" + err);
      }
      console.info("ColumnSetVisibilityTest beforeEach end");
    });

    afterEach(async () => {
      await CommonFunc.sleep(3000);
      console.info("ColumnSetVisibility after each called");
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2000
     * @tc.name testColumnSetVisibilityNoneVisible
     * @tc.desc The subcomponents set visibility.none and visibility.visible.
     */
    it('testColumnSetVisibilityNoneVisible_static', 0, async () => {
      console.info('new testColumnSetVisibilityNoneVisible START');
      const uiContext = new UIContext();
      try {
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility1', value: Visibility.None
        });
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_1');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility_1.bottom - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_1.right - columnSetVisibility_1.left) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(uiContext.vp2px(30))) <=
          1)
          .assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(uiContext.vp2px(120))) <=
          1)
          .assertTrue()

      } catch (err) {
        console.error('[testColumnSetVisibilityNoneVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityNoneVisible END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2100
     * @tc.name testColumnSetVisibilityHiddenVisible
     * @tc.desc The subcomponents set visibility.hidden and visibility.visible.
     */
    it('testColumnSetVisibilityHiddenVisible_static', 0, async () => {
      console.info('new testColumnSetVisibilityHiddenVisible START');
      const uiContext = new UIContext();
      try {
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility1', value: Visibility.Hidden
        });
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_1');
        // let obj: ESObject = JSON.parse(strJson);
        // expect(obj.$attrs.visibility).assertEqual("Visibility.Hidden");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility.top - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility_1.bottom - Math.round(uiContext.vp2px(30))) <=
          1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(uiContext.vp2px(30))) <=
          1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(uiContext.vp2px(40))) <=
          1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityHiddenVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityHiddenVisible END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2200
     * @tc.name testColumnSetVisibilityVisible
     * @tc.desc The subcomponents both set visibility.visible.
     */
    it('testColumnSetVisibilityVisible_static', 0, async () => {
      console.info('new testColumnSetVisibilityVisible START');
      const uiContext = new UIContext();
      try {
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility1', value: Visibility.Visible
        });
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility2', value: Visibility.Visible
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_1');
        // let obj: ESObject = JSON.parse(strJson);
        // expect(obj.$attrs.visibility).assertEqual("Visibility.Visible");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility.top - columnSetVisibility_1.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.top - columnSetVisibility_1.bottom - Math.round(uiContext.vp2px(30))) <=
          1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_2.bottom - Math.round(uiContext.vp2px(30))) <=
          1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(uiContext.vp2px(40))) <=
          1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityVisible] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisible END');
    });

    /**
     * @tc.number SUB_ACE_COLUMN_SUBCOMPONENTCHANGED_2300
     * @tc.name testColumnSetVisibilityVisibleNone
     * @tc.desc The subcomponents set visibility.visible and visibility.none.
     */
    it('testColumnSetVisibilityVisibleNone_static', 0, async () => {
      console.info('new testColumnSetVisibilityVisibleNone START');
      const uiContext = new UIContext();
      try {
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility1', value: Visibility.Visible
        });
        GlobalContext.getContext().getObject<number>('value')?.message.notify({
          name: 'testVisibility2', value: Visibility.None
        });
        await CommonFunc.sleep(3000);
        let strJson = inspector.getInspectorByKey('columnSetVisibility_2');
        let obj = JSON.parseJsonElement(strJson);
        expect(obj.getElement('$attrs').getString('visibility')).assertEqual("Visibility.None");
        let columnSetVisibility_1: RectValue = CommonFunc.getComponentRect('columnSetVisibility_1');
        let columnSetVisibility_2: RectValue = CommonFunc.getComponentRect('columnSetVisibility_2');
        let columnSetVisibility_3: RectValue = CommonFunc.getComponentRect('columnSetVisibility_3');
        let columnSetVisibility: RectValue = CommonFunc.getComponentRect('columnSetVisibility');
        expect(Math.abs(columnSetVisibility_2.bottom - columnSetVisibility_2.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_2.right - columnSetVisibility_2.left) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_1.top - columnSetVisibility.top) <= 1).assertTrue()
        expect(Math.abs(columnSetVisibility_3.top - columnSetVisibility_1.bottom - Math.round(uiContext.vp2px(30))) <=
          1).assertTrue()
        expect(Math.abs(columnSetVisibility.bottom - columnSetVisibility_3.bottom - Math.round(uiContext.vp2px(170))) <=
          1).assertTrue()
      } catch (err) {
        console.error('[testColumnSetVisibilityVisibleNone] failed');
        expect().assertFail();
      }
      console.info('new testColumnSetVisibilityVisibleNone END');
    });
  })
}
