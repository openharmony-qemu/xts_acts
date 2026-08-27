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

export default function onGetIrregularJsunit() {
  describe('onGetIrregularJsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregularJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregularJsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular" == pages.name)) {
          console.info("get onGetIrregularJsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregularJsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   onGetIrregularJsunit_static_0001
     * @tc.name     onGetIrregularJsunit_static_0001
     * @tc.desc     onGetIrregularJsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregularJsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onGetIrregularJsunit_static_0001] START');
      let Grid: RectValue = CommonFunc.getComponentRect('GridGetIrregular');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregularJsunitTest await err: ' + JSON.stringify(err));
      }

      let GridItem0: RectValue = CommonFunc.getComponentRect('onGetRegular0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('onGetRegular1');
      let GridItem2: RectValue = CommonFunc.getComponentRect('onGetRegular2');

            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregularJsunitTest await err: ' + JSON.stringify(err));
      }
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem0.right - GridItem0.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem1.right - GridItem1.left)) <= 1)
        .assertTrue();
      expect(Math.abs(Math.round(Grid.right - Grid.left) - Math.round(GridItem2.right - GridItem2.left)) <= 1)
        .assertTrue();


      console.info('[onGetIrregularJsunit_static_0001] END');
      done();
    });

  })
}
