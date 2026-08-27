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

export default function onGetIrregular7Jsunit() {
  describe('onGetIrregular7Jsunit', () => {

    beforeEach(async (): Promise<void> => {
      console.info("onGetIrregular7Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/Grid_iiregular/onGetIrregular7',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages:router.RouterState = routerInstance.getState();
        console.info("get onGetIrregular7Jsunit state pages: " + JSON.stringify(pages));
        if (!("onGetIrregular7" == pages.name)) {
          console.info("get onGetIrregular7Jsunit state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push onGetIrregular7Jsunit page error: " + err);
      }
    });

    


    
    

/**
     * @tc.number   onGetIrregular7Jsunit_static_0001
     * @tc.name     onGetIrregular7Jsunit_static_0001
     * @tc.desc     onGetIrregular7Jsunit_static_0001
     * @tc.level    Level.LEVEL0
     */
it('onGetIrregular7Jsunit_static_0001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[onGetIrregular7Jsunit_static_0001] START');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular7JsunitTest await err: ' + JSON.stringify(err));
      }
      let GridItem0: RectValue = CommonFunc.getComponentRect('onTextTemplate0');
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular7JsunitTest await err: ' + JSON.stringify(err));
      }
      let context = AppStorage.get<UIContext>('context') as UIContext
      expect(Math.round(context.px2vp(GridItem0.right - GridItem0.left))).assertEqual(400);
            try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('onGetIrregular7JsunitTest await err: ' + JSON.stringify(err));
      }
      console.info('[onGetIrregular7Jsunit_static_0001] END');
      done();
    });

  })
}

