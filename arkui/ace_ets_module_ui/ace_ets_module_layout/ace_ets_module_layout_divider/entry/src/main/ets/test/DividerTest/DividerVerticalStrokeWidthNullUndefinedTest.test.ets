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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/utils/Common';

export default function DividerVerticalStrokeWidthNullUndefinedTest() {
  describe('DividerVerticalStrokeWidthNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Divider/DividerVerticalStrokeWidthNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get DividerVerticalStrokeWidthNullUndefined state success " + JSON.stringify(pages));
        if (!("DividerVerticalStrokeWidthNullUndefined" == pages.name)) {
          console.info("get DividerVerticalStrokeWidthNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(1000);
          console.info("push DividerVerticalStrokeWidthNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push DividerVerticalStrokeWidthNullUndefined page error: " + err);
      }
      done()
    });

    /**
     * @tc.name   DividerVerticalStrokeWidthNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_DividerVerticalStrokeWidthNullUndefinedTest_0100
     * @tc.desc   add divider api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('DividerVerticalStrokeWidthNullUndefinedTest_0100', Level.LEVEL0, async () => {
      console.info('[DividerVerticalStrokeWidthNullUndefinedTest_0100] START');
      await CommonFunc.sleep(1000);

      let strJson1 = getInspectorByKey('DividerVerticalStrokeWidthNullUndefined1');
      let strJson2 = getInspectorByKey('DividerVerticalStrokeWidthNullUndefined2');
      let strJson3 = getInspectorByKey('DividerVerticalStrokeWidthNullUndefined3');
      let strJson4 = getInspectorByKey('DividerVerticalStrokeWidthNullUndefined4');

      expect(JSON.parse(strJson1).$type).assertEqual('Divider');
      expect(JSON.parse(strJson2).$type).assertEqual('Divider');
      expect(JSON.parse(strJson3).$type).assertEqual('Divider');
      expect(JSON.parse(strJson4).$type).assertEqual('Divider');

      console.info('[DividerVerticalStrokeWidthNullUndefinedTest_0100] END');
    })

  })
}
