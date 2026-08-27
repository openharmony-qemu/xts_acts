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

export default function Gutter_Length_Resource() {
  describe('Gutter_Length_Resource', () => {

    beforeEach(async (): Promise<void> => {
      console.info("push Gutter_Length_Resource beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_Row/Grid_Row_Gutter/Grid_Row_Resource',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get push Gutter_Length_Resource state pages: " + JSON.stringify(pages));
        if (!("Grid_Row_Resource" == pages.name)) {
          console.info("get push Gutter_Length_Resource state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push push Gutter_Length_Resource page error: " + err);
      }
    });

    afterEach(async () => {
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Gutter_Length_ResourceTest await err: ' + JSON.stringify(err));
      }
      console.info("Gutter_Length_Resource after each called")
    });

    
    
    

/**
     * @tc.number   SUB_ACE_GridRowGutterLength_RESOURCE_static_0100
     * @tc.name     SUB_ACE_GridRowGutterLength_RESOURCE_static_0100
     * @tc.desc     SUB_ACE_GridRowGutterLength_RESOURCE_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SUB_ACE_GridRowGutterLength_RESOURCE_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ACE_GridRowGutterLength_RESOURCE_static_0100 START');
            try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('Gutter_Length_ResourceTest await err: ' + JSON.stringify(err));
      }

      let LengthResource_1: RectValue = CommonFunc.getComponentRect('Length_Resource001');
      let firstLengthResource: RectValue = CommonFunc.getComponentRect('Length_Resource_0');
      let secondLengthResource: RectValue = CommonFunc.getComponentRect('Length_Resource_1');
      let thirdLengthResource: RectValue = CommonFunc.getComponentRect('Length_Resource_2');
      let fourthLengthResource: RectValue = CommonFunc.getComponentRect('Length_Resource_3');
      let gridRowLengthResourceJson = inspector.getInspectorByKey('Length_Resource001');
      expect(JSON.parseJsonElement(gridRowLengthResourceJson).getString('$type')).assertEqual('GridRow');

      expect(Math.abs(firstLengthResource.top - LengthResource_1.top) <= 1).assertTrue();
      expect(Math.abs(secondLengthResource.top - LengthResource_1.top) <= 1).assertTrue();
      expect(Math.abs(firstLengthResource.left - LengthResource_1.left) <= 1).assertTrue();

      expect(Math.abs(Math.round(secondLengthResource.left - firstLengthResource.right) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();
      expect(Math.abs(Math.round(thirdLengthResource.top - firstLengthResource.bottom) - Math.round(UIContext.resolveUIContext()!.vp2px(10))) <= 1).assertTrue();

      console.info('SUB_ACE_GridRowGutterLength_RESOURCE_static_0100 END');
      done();
    });

  })
}
