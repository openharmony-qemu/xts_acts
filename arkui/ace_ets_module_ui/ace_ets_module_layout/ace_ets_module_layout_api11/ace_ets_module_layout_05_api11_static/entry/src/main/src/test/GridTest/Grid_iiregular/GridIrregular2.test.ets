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

import { describe, beforeEach, afterEach, afterAll, it, expect,Level } from "../../../../../hypium/index"
import {
  Component,
  Driver,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import RectValue  from '../../../../ets/MainAbility/common/Rect';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function GridIrregular2Jsunit() {
  describe('GridIrregular2Jsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("blank beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/GridIrregular2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get blank state pages: " + JSON.stringify(pages));
        if (!("GridIrregular2" == pages.name)) {
          console.info("get blank state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push blank page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridIrregular2Jsunit_static_0001
     * @tc.name     GridIrregular2Jsunit_static_0001
     * @tc.desc     GridIrregular2Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('GridIrregular2Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridIrregular2Jsunit_static_0001] START');
      let GridItem0: RectValue = CommonFunc.getComponentRect('GridArr0');
      let GridItem3: RectValue = CommonFunc.getComponentRect('GridArr3');
      let Grid: RectValue = CommonFunc.getComponentRect('GridIrregular2' + '_GridIrregular2')
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridIrregular2JsunitTest await err: ' + JSON.stringify(err));
      }
      expect(Math.abs(Math.round((GridItem3.right - GridItem3.left)- (Grid.right - Grid.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((GridItem3.top - GridItem3.bottom)- (GridItem0.top - GridItem0.bottom))) <= 1).assertTrue();
      console.info('[GridIrregular2Jsunit_static_0001] END');
      done();
    });

  })
}
