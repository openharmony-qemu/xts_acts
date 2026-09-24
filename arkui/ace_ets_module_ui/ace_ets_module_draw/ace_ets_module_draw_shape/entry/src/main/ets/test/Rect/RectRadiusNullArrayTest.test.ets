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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function RectRadiusNullArrayTest() {
  describe('RectRadiusNullArrayTest', () => {
    beforeAll(async (done: Function) => {
      console.info("RectRadiusNullArrayTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Rect/RectRadiusNullArray",
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RectRadiusNullArray state pages: " + JSON.stringify(pages));
        if (!("RectRadiusNullArray" == pages.name)) {
          console.info("get RectRadiusNullArray state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push RectRadiusNullArray success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RectRadiusNullArray page error: " + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   RectRadiusNullArrayTest_0100
     * @tc.number SUB_ARKUI_ACE_RectRadiusNullArrayTest_0100
     * @tc.desc   Add Rect radius null array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RectRadiusNullArrayTest_0100', Level.LEVEL0, async () => {
      console.info('[RectRadiusNullArrayTest_0100] START');
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('RectRadiusNullArray');
      let strJson1 = getInspectorByKey('RectRadiusNullString');
      expect(JSON.parse(strJson).$type).assertEqual('Rect');
      expect(JSON.parse(strJson1).$type).assertEqual('Rect');

      console.info('[RectRadiusNullArrayTest_0100] END');
    })

  })
}
