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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import CommonFunc from '../MainAbility/common/Common';

export default function MaxCountMin() {
  describe('maxCountMin', () => {
    beforeEach(async (done: Function) => {
      console.info("maxCountMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/maxCountMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get maxCountMin state pages:" + JSON.stringify(pages));
        if (!("maxCountMin" == pages.name)) {
          console.info("get maxCountMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push maxCountMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push maxCountMin page error:" + err);
      }
      console.info("maxCountMin beforeEach end");
      done();
    });

    /**
     * @tc.name   maxCountMin_0100
     * @tc.number SUB_ARKUI_GRID_MAXCOUNT_BOUNDARY_0100
     * @tc.desc   set Grid maxCount to 0, value less than 1 should be treated as default value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxCountMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[maxCountMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJsonDefault = getInspectorByKey('grid_maxCount_default');
      console.info("[maxCountMin_0100] default component obj is: " + strJsonDefault);
      console.info("[maxCountMin_0100] default maxCount: " +
        JSON.stringify(JSON.parse(strJsonDefault).$attrs.maxCount));
      let strJson = getInspectorByKey('grid_maxCount_zero');
      console.info("[maxCountMin_0100] component obj is: " + strJson);
      console.info("[maxCountMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[maxCountMin_0100] maxCount: " + JSON.stringify(JSON.parse(strJson).$attrs.maxCount));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      // maxCount设置为小于1的值时按默认值处理，应与未设置maxCount的Grid一致
      expect(JSON.parse(strJson).$attrs.maxCount).assertEqual(JSON.parse(strJsonDefault).$attrs.maxCount);
      console.info('[maxCountMin_0100] END');
      done();
    });

    /**
     * @tc.name   maxCountMin_0200
     * @tc.number SUB_ARKUI_GRID_MAXCOUNT_BOUNDARY_0200
     * @tc.desc   set Grid maxCount to 1, the minimum valid value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('maxCountMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[maxCountMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('grid_maxCount_one');
      console.info("[maxCountMin_0200] component obj is: " + strJson);
      console.info("[maxCountMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[maxCountMin_0200] maxCount: " + JSON.stringify(JSON.parse(strJson).$attrs.maxCount));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      expect(JSON.parse(strJson).$attrs.maxCount).assertEqual(1);
      console.info('[maxCountMin_0200] END');
      done();
    });
  })
}
