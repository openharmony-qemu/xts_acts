/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import {
  UiComponent,
  UiDriver,
  Component,
  Driver,
  UiWindow,
  ON,
  BY,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  MouseButton,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';


export default function ChipV2Action2() {
  describe('ChipV2Action2', () => {
    beforeEach(async (done: Function) => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/chipV2/ChipV2Action2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get ChipV2Action2 state pages: " + JSON.stringify(pages));
        if (!("ChipV2Action2" == pages.name)) {
          console.info("get ChipV2Action2 state pages.name: " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push ChipV2Action2 page result: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push ChipV2Action2 page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_ChipV2Action2_0100
     * @tc.number SUB_ARKUI_API_ChipV2Action2_0100
     * @tc.desc   set enabled to false and action event test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_ChipV2Action2_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {

      console.info('SUB_ARKUI_API_ChipV2Action2_0100 START');
      let ChipActionCol = CommonFunc.getComponentRect('ChipV2Action2Col');
      await CommonFunc.sleep(200);
      let right = ChipActionCol.right - vp2px(22);
      let top = ChipActionCol.top + vp2px(18);
      await CommonFunc.sleep(200);
      console.info('SUB_ARKUI_API_ChipV2Action2_0100 right：' + right + 'top:' + top);
      let driver = Driver.create();
      await driver.mouseClick({
        x: Math.round(right), y: Math.round(top)
      }, MouseButton.MOUSE_BUTTON_LEFT);
      await CommonFunc.sleep(1000);
      console.info('SUB_ARKUI_API_ChipV2Action2_0100 click success');

      let strJson1 = getInspectorByKey('ChipV2Action2');
      await CommonFunc.sleep(1000);
      console.info("[SUB_ARKUI_API_ChipV2Action2_0100] component obj is: " + JSON.stringify(JSON.parse(strJson1)));
      expect(JSON.parse(strJson1).$attrs.content).assertEqual('');
      console.info('[SUB_ARKUI_API_ChipV2Action2_0100] END');

      done();
    });


  })
}
