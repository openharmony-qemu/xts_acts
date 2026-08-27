'use static';
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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from '../../../../../../hypium/index';
import CommonFunc from '../../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../../ets/MainAbility/common/Rect';
import inspector from '@ohos.arkui.inspector'
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function GridRow_onBreakpoint() {
  describe('GridRow_onBreakpoint', () => {

    beforeEach(async (): Promise<void> => {
      console.info("GridRow_onBreakpoint beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/onBreakpointChange/onBreakpointChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridRow_onBreakpoint state pages: " + JSON.stringify(pages));
        if (!("onBreakpointChange" == pages.name)) {
          console.info("get GridRow_onBreakpoint state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridRow_onBreakpoint page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('GridRow_onBreakpointTest await err: ' + JSON.stringify(err));
      }
      console.info("GridRow_onBreakpoint after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRow_onBreakPointChange_static_0100
     * @tc.name     SUB_ACE_GridRow_onBreakPointChange_static_0100
     * @tc.desc     SUB_ACE_GridRow_onBreakPointChange_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRow_onBreakPointChange_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRow_onBreakPointChange_static_0100 START');
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('GridRow_onBreakpointTest await err: ' + JSON.stringify(err));
      }

      let Breakpoint_1: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint001');
      let firstBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_0');
      let secondBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_1');
      let thirdBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_2');
      let fourthBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_3');
      let fifthBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_4');
      let sixthBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_5');
      let seventhBreakpoint: RectValue = CommonFunc.getComponentRect('GridRow_onBreakpoint_6');
      let gridRowBreakpointJson = inspector.getInspectorByKey('GridRow_onBreakpoint001');
      let textComponent2 = inspector.getInspectorByKey('GridRowText');
     expect(JSON.parseJsonElement(gridRowBreakpointJson).getString('$type')).assertEqual('GridRow');
     expect(JSON.parseJsonElement(textComponent2).getElement('$attrs').getString('content')).assertEqual('xxl');

      expect(Math.abs(firstBreakpoint.top - Breakpoint_1.top) <= 1).assertTrue();
      expect(Math.abs(secondBreakpoint.top - secondBreakpoint.top) <= 1).assertTrue();
      expect(Math.abs(thirdBreakpoint.top - thirdBreakpoint.top) <= 1).assertTrue();
      expect(Math.abs(firstBreakpoint.left - Breakpoint_1.left) <= 1).assertTrue();

      expect(Math.abs(secondBreakpoint.left - firstBreakpoint.right - UIContext.resolveUIContext()!.vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(thirdBreakpoint.left - secondBreakpoint.right - UIContext.resolveUIContext()!.vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(fourthBreakpoint.left - thirdBreakpoint.right - UIContext.resolveUIContext()!.vp2px(30)) <= 1).assertTrue();
      expect(Math.abs(seventhBreakpoint.top - firstBreakpoint.bottom - UIContext.resolveUIContext()!.vp2px(30)) <= 1).assertTrue();

      console.info('SUB_ACE_GridRow_onBreakPointChange_static_0100 END');
      done();
    });

  })
}
