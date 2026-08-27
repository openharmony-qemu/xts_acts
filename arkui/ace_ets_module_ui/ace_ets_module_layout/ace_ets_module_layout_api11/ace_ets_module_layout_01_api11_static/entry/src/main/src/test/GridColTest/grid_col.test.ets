'use static';
/*
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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import {FlexAlign} from '@ohos.arkui.component'
// import {fp2px,lpx2px} from '@ohos.arkui.UIContext'
import  RectValue from '../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../ets/MainAbility/common/Common';
// import GlobalContext from '../../../ets/MainAbility/common/GlobalContext'
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';




import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function grid_colSpanJsunit() {
  describe('grid_colSpanTest', () => {


    afterEach(async () => {
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('grid_colSpanTest sleep err: ' + JSON.stringify(err));
      }
      console.info("grid_colSpan after each called");
    });

    
    



    /**
     * @tc.number  testgrid_colSpan0001_static
     * @tc.name     testgrid_colSpan0001_static
     * @tc.desc     testgrid_colSpan0001_static
     * @tc.level    Level.LEVEL0
     */
    it('testgrid_colSpan0001_static', Level.LEVEL0, async () => {
      console.info('grid_rowOnBreakpointChange testgrid_colSpan0001_static START');
      try {
      await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('grid_colSpanTest sleep err: ' + JSON.stringify(err));
      }
      let strJson = inspector.getInspectorByKey('gridContainer');
      console.info("[testgrid_colSpan0001_static] component height strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getString('$type')).assertEqual('GridCol');
      expect(obj.getElement('$attrs').getString('width')).assertEqual("100.00vp");
      console.info("[testgrid_colSpan0001_static] width value :" + obj.getElement('$attrs').getString('width'));

    });
  })
}
