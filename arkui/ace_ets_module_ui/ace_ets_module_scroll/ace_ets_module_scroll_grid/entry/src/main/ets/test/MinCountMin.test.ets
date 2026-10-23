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

export default function MinCountMin() {
  describe('minCountMin', () => {
    beforeEach(async (done: Function) => {
      console.info("minCountMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/minCountMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get minCountMin state pages:" + JSON.stringify(pages));
        if (!("minCountMin" == pages.name)) {
          console.info("get minCountMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push minCountMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push minCountMin page error:" + err);
      }
      console.info("minCountMin beforeEach end");
      done();
    });

    /**
     * @tc.name   minCountMin_0100
     * @tc.number SUB_ARKUI_GRID_MINCOUNT_BOUNDARY_0100
     * @tc.desc   set Grid minCount to 0, value less than 1 should be treated as default value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('minCountMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[minCountMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJsonDefault = getInspectorByKey('grid_minCount_default');
      console.info("[minCountMin_0100] default component obj is: " + strJsonDefault);
      console.info("[minCountMin_0100] default minCount: " +
        JSON.stringify(JSON.parse(strJsonDefault).$attrs.minCount));
      let strJson = getInspectorByKey('grid_minCount_zero');
      console.info("[minCountMin_0100] component obj is: " + strJson);
      console.info("[minCountMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[minCountMin_0100] minCount: " + JSON.stringify(JSON.parse(strJson).$attrs.minCount));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      // minCount设置为小于1的值时按默认值处理，应与未设置minCount的Grid一致
      expect(JSON.parse(strJson).$attrs.minCount).assertEqual(JSON.parse(strJsonDefault).$attrs.minCount);
      console.info('[minCountMin_0100] END');
      done();
    });

    /**
     * @tc.name   minCountMin_0200
     * @tc.number SUB_ARKUI_GRID_MINCOUNT_BOUNDARY_0200
     * @tc.desc   set Grid minCount to 1, the minimum valid value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('minCountMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[minCountMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('grid_minCount_one');
      console.info("[minCountMin_0200] component obj is: " + strJson);
      console.info("[minCountMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[minCountMin_0200] minCount: " + JSON.stringify(JSON.parse(strJson).$attrs.minCount));
      expect(JSON.parse(strJson).$type).assertEqual("Grid");
      expect(JSON.parse(strJson).$attrs.minCount).assertEqual(1);
      console.info('[minCountMin_0200] END');
      done();
    });
  })
}
