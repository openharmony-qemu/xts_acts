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

export default function GridIrregular1Jsunit() {
  describe('GridIrregular1Jsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("GridIrregular1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/GridIrregular1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get GridIrregular1Jsunit state pages: " + JSON.stringify(pages));
        if (!("GridIrregular1" == pages.name)) {
          console.info("get GridIrregular1Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push GridIrregular1Jsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   GridIrregular1Jsunit_static_0001
     * @tc.name     GridIrregular1Jsunit_static_0001
     * @tc.desc     GridIrregular1Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('GridIrregular1Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[GridIrregular1Jsunit_static_0001] START');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridIrr1');
      let Grid: RectValue = CommonFunc.getComponentRect('gridIrregular1')
      let context = AppStorage.get<UIContext>('context') as UIContext
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('GridIrregular1JsunitTest await err: ' + JSON.stringify(err));
      }

      expect(Math.round(context.px2vp(GridItem1.right - GridItem1.left))).assertEqual(400);
      console.info('[GridIrregular1Jsunit_static_0001] END');
      done();
    });
  })
}
