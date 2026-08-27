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

export default function onGetIrregular1Jsunit() {
  describe('onGetIrregular1Jsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregular1Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregular1Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular1" == pages.name)) {
          console.info("get onGetIrregular1Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregular1Jsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   onGetIrregular1Jsunit_static_0001
     * @tc.name     onGetIrregular1Jsunit_static_0001
     * @tc.desc     onGetIrregular1Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregular1Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onGetIrregular1Jsunit_static_0001] START');
      let Grid: RectValue = CommonFunc.getComponentRect('Irregular1');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular1JsunitTest await err: ' + JSON.stringify(err));
      }

      let GridItem0: RectValue = CommonFunc.getComponentRect('GridIrr0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridIrr1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('GridIrr2');
      let GridItem3: RectValue = CommonFunc.getComponentRect('GridIrr3');
      let GridItem4: RectValue = CommonFunc.getComponentRect('GridIrr4');

            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular1JsunitTest await err: ' + JSON.stringify(err));
      }
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem0.right - GridItem0.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem1.right - GridItem1.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem2.right - GridItem2.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem3.right - GridItem3.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem4.right - GridItem4.left)) <= 1)
        .assertTrue();


      console.info('[onGetIrregular1Jsunit_static_0001] END');
      done();
    });

  })
}
