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
import CommonFunc from '../../MainAbility/common/Common';

export default function ScrollBarWidthMin() {
  describe('scrollBarWidthMin', () => {
    beforeEach(async (done: Function) => {
      console.info("scrollBarWidthMin beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Scroll/scrollBarWidthMin',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get scrollBarWidthMin state pages:" + JSON.stringify(pages));
        if (!("scrollBarWidthMin" == pages.name)) {
          console.info("get scrollBarWidthMin pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push scrollBarWidthMin page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push scrollBarWidthMin page error:" + err);
      }
      console.info("scrollBarWidthMin beforeEach end");
      done();
    });

    /**
     * @tc.name   scrollBarWidthMin_0100
     * @tc.number SUB_ARKUI_SCROLL_SCROLLBARWIDTH_BOUNDARY_0100
     * @tc.desc   set scrollBarWidth to -1, if the value is less than 0, the default value 4 vp is used.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarWidthMin_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollBarWidthMin_0100] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_barWidth_negative');
      console.info("[scrollBarWidthMin_0100] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollBarWidthMin_0100] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[scrollBarWidthMin_0100] scrollBarWidth: " +
        JSON.stringify(JSON.parse(strJson).$attrs.scrollBarWidth));
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.scrollBarWidth).assertEqual("4.00vp");
      console.info('[scrollBarWidthMin_0100] END');
      done();
    });

    /**
     * @tc.name   scrollBarWidthMin_0200
     * @tc.number SUB_ARKUI_SCROLL_SCROLLBARWIDTH_BOUNDARY_0200
     * @tc.desc   set scrollBarWidth to '-10' (string), if the value is less than 0, the default value 4 vp is used.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('scrollBarWidthMin_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[scrollBarWidthMin_0200] START');
      await CommonFunc.sleep(1000);
      let strJson = getInspectorByKey('scroll_barWidth_negative_str');
      console.info("[scrollBarWidthMin_0200] component obj is: " + JSON.stringify(JSON.parse(strJson)));
      console.info("[scrollBarWidthMin_0200] type: " + JSON.stringify(JSON.parse(strJson).$type));
      console.info("[scrollBarWidthMin_0200] scrollBarWidth: " +
        JSON.stringify(JSON.parse(strJson).$attrs.scrollBarWidth));
      expect(JSON.parse(strJson).$type).assertEqual("Scroll");
      expect(JSON.parse(strJson).$attrs.scrollBarWidth).assertEqual("4.00vp");
      console.info('[scrollBarWidthMin_0200] END');
      done();
    });
  })
}
