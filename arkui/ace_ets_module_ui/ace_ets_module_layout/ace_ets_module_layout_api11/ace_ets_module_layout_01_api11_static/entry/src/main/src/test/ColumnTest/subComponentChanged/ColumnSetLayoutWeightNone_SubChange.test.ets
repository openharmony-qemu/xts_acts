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

import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../../hypium/index'
import router from '@ohos.router';
import RectValue from '../../../../ets/MainAbility/common/Rect';
import CommonFunc from '../../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../../ets/MainAbility/common/MessageManager';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';




export default function ColumnSetLayoutWeightNone_SubChange() {
  describe('ColumnSetLayoutWeightTest', () => {

    beforeEach(async (): Promise<void> => {
      console.info("ColumnSetLayoutWeightTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Column/subcomponentChanged/ColumnSetLayoutWeightNone_SubChange',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ColumnSetLayoutWeightTest state pages:" + JSON.stringify(pages));
        if (!("ColumnSetLayoutWeightNone_SubChange" == pages.name)) {
          console.info("get ColumnSetLayoutWeightTest pages.name:" + '');
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(1000);
          // console.info("push ColumnSetLayoutWeightTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ColumnSetLayoutWeightTest page error:" + err);
      }
      console.info("ColumnSetLayoutWeightTest beforeEach end");
    });

    afterEach(async () => {
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ColumnSetLayoutWeightTest sleep err: ' + JSON.stringify(err));
      }
      console.info("SetLayoutWeight after each called");
    });


    /**
     * @tc.number   testColumnSetLayoutWeightWithRateThreeTwoZero_static
     * @tc.name     testColumnSetLayoutWeightWithRateThreeTwoZero_static
     * @tc.desc     testColumnSetLayoutWeightWithRateThreeTwoZero_static
     * @tc.level    Level.LEVEL0
     */
    it('testColumnSetLayoutWeightWithRateThreeTwoZero_static', Level.LEVEL0, async () => {
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoZero_static START');
      const uiContext = AppStorage.get<UIContext>('uiContext');
      try {
      await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('ColumnSetLayoutWeightTest sleep err: ' + JSON.stringify(err));
      }
      let layoutExpectHeight1 = (190 / 5) * 3;
      let layoutExpectHeight2 = (190 / 5) * 2;
      let layoutExpectHeight3 = 150;
      let setLayoutWeightNone1: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone1');
      let setLayoutWeightNone2: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone2');
      let setLayoutWeightNone3: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone3');
      let setLayoutWeightNone: RectValue = CommonFunc.getComponentRect('setLayoutWeightNone');

      expect(Math.abs(setLayoutWeightNone1.top - setLayoutWeightNone.top) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone2.top - setLayoutWeightNone1.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()
      expect(Math.abs(setLayoutWeightNone3.top - setLayoutWeightNone2.bottom - Math.round(uiContext!.vp2px(30))) <= 1)
        .assertTrue()

      expect(Math.abs(setLayoutWeightNone1.bottom - setLayoutWeightNone1.top -
      Math.round(uiContext!.vp2px(layoutExpectHeight1))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone2.bottom - setLayoutWeightNone2.top -
      Math.round(uiContext!.vp2px(layoutExpectHeight2))) <= 1).assertTrue()
      expect(Math.abs(setLayoutWeightNone3.bottom - setLayoutWeightNone3.top -
      Math.round(uiContext!.vp2px(layoutExpectHeight3))) <= 1).assertTrue()
      console.info('new testColumnSetLayoutWeightWithRateThreeTwoZero_static END');
    });
  })
}
