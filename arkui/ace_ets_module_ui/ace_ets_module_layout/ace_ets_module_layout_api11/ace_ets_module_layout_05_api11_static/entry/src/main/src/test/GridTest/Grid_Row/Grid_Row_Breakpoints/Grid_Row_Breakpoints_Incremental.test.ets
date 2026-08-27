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
import router from '@ohos.router';

import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function Grid_Row_Breakpoints_Incremental() {
  describe('Grid_Row_Breakpoints_Incremental', () => {

    beforeEach(async (): Promise<void> => {
      console.info("Grid_Row_Breakpoints_Incremental beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Breakpoints/Grid_Row_Breakpoints_Incremental',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get Grid_Row_Breakpoints_Incremental state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Breakpoints_Incremental" == pages.name)) {
          console.info("get Grid_Row_Breakpoints_Incremental state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push Grid_Row_Breakpoints_Incremental page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_Breakpoints_IncrementalTest await err: ' + JSON.stringify(err));
      }
      console.info("GridRowBreakpoints_Value1 after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowBreakpoints_static_0100
     * @tc.name     SUB_ACE_GridRowBreakpoints_static_0100
     * @tc.desc     SUB_ACE_GridRowBreakpoints_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowBreakpoints_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowBreakpoints_static_0100 START');
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Grid_Row_Breakpoints_IncrementalTest await err: ' + JSON.stringify(err));
      }

      let firstBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental0');
      let secondBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental1');
      let thirdBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental2');
      let fourthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental3');
      let fifthBreakpoints: RectValue = CommonFunc.getComponentRect('Grid_Row_Breakpoints_Incremental4');

      expect(Math.floor(Math.abs((secondBreakpoints.left - firstBreakpoints.right) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((thirdBreakpoints.left - secondBreakpoints.right) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fourthBreakpoints.left - thirdBreakpoints.right) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      expect(Math.floor(Math.abs((fifthBreakpoints.top - firstBreakpoints.bottom) - UIContext.resolveUIContext()!.vp2px(20))) <= 1).assertTrue();
      console.info('SUB_ACE_GridRowBreakpoints_static_0100 END');
      done();
    });

  })
}
