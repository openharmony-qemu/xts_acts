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

export default function onGetIrregular9Jsunit() {
  describe('onGetIrregular9Jsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregular9Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular9',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregular9Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular9" == pages.name)) {
          console.info("get onGetIrregular9Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregular9Jsunit page error: " + err);
      }
    });

    
    
    

/**
     * @tc.number   onGetIrregular9Jsunit_static_0001
     * @tc.name     onGetIrregular9Jsunit_static_0001
     * @tc.desc     onGetIrregular9Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregular9Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('[onGetIrregular9Jsunit_static_0001] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular9JsunitTest await err: ' + JSON.stringify(err));
      }

      let GridItem0: RectValue = CommonFunc.getComponentRect('GridCenter0');
      let GridItem1: RectValue = CommonFunc.getComponentRect('GridCenter1');
      let GridItem4: RectValue = CommonFunc.getComponentRect('GridCenter4');
      let context = AppStorage.get<UIContext>('context') as UIContext
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular9JsunitTest await err: ' + JSON.stringify(err));
      }

      expect(Math.abs(context.px2vp(GridItem0.right - GridItem0.left) - 80) <= 1).assertTrue();
      expect(Math.abs(context.px2vp(GridItem4.right - GridItem4.left) - 80) <= 1).assertTrue();

      expect(Math.abs(context.px2vp(GridItem0.bottom - GridItem0.top) - 260) <= 1).assertTrue();
      expect(Math.abs(context.px2vp(GridItem4.bottom - GridItem4.top) - 260) <= 1).assertTrue();

      console.info('[onGetIrregular9Jsunit_static_0001] END');
      done();
    });

  })
}
