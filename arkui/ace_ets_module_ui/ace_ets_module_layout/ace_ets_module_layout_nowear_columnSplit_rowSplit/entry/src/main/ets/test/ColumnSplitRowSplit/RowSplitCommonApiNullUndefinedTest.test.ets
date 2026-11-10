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

import { afterEach, beforeAll, describe, expect, it, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc, { RectValue } from '../../MainAbility/common/Common';

export default function RowSplitCommonApiNullUndefinedTest() {
  describe('RowSplitCommonApiNullUndefinedTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ColumnSplitRowSplit/RowSplitCommonApiNullUndefined',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get RowSplitCommonApiNullUndefined state success " + JSON.stringify(pages));
        if (!("RowSplitCommonApiNullUndefined" == pages.name)) {
          console.info("get RowSplitCommonApiNullUndefined state success " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          console.info("push RowSplitCommonApiNullUndefined page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push RowSplitCommonApiNullUndefined page error " + JSON.stringify(err));
      }
      await CommonFunc.sleep(2000);
      done();
    });

    /**
     * @tc.name   RowSplitCommonApiNullUndefinedTest_0100
     * @tc.number SUB_ARKUI_API_RowSplitCommonApiNullUndefinedTest_0100
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('RowSplitCommonApiNullUndefinedTest_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[RowSplitCommonApiNullUndefinedTest_0100] START');
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('RowSplitCommonApiNull');
      let strJson1 = getInspectorByKey('RowSplitCommonApiUndefined');
      expect(JSON.parse(strJson).$type).assertEqual('RowSplit');
      expect(JSON.parse(strJson1).$type).assertEqual('RowSplit');

      console.info('[RowSplitCommonApiNullUndefinedTest_0100] END');
      done();
    });

  })
}
