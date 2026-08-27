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

export default function onGetIrregular4Jsunit() {
  describe('onGetIrregular4Jsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregular4Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregular4Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular4" == pages.name)) {
          console.info("get onGetIrregular4Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregular4Jsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   onGetIrregular4Jsunit_static_0001
     * @tc.name     onGetIrregular4Jsunit_static_0001
     * @tc.desc     onGetIrregular4Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregular4Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onGetIrregular4Jsunit_static_0001] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular4JsunitTest await err: ' + JSON.stringify(err));
      }
      let Grid: RectValue = CommonFunc.getComponentRect('GridItem4');

      let GridItem0: RectValue = CommonFunc.getComponentRect('text_Grid0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('text_Grid1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('text_Grid2');
      let GridItem3: RectValue = CommonFunc.getComponentRect('text_Grid3');
      let GridItem4: RectValue = CommonFunc.getComponentRect('text_Grid4');


            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular4JsunitTest await err: ' + JSON.stringify(err));
      }
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem0.right - GridItem0.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem1.right - GridItem1.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem2.right - GridItem2.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem3.right - GridItem3.left))) <= 1).assertTrue();
      expect(Math.abs(Math.round((Grid.right - Grid.left)- (GridItem4.right - GridItem4.left))) <= 1).assertTrue();

      console.info('[onGetIrregular4Jsunit_static_0001] END');
      done();
    });

  })
}
