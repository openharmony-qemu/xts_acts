/*
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

import CommonFunc, { RectValue } from '../../MainAbility/common/Common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-dynamic';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';

export default function FoldSplitContainer1Test() {
  describe('FoldSplitContainer1Test', () => {
    beforeEach(async (done: Function) => {
      console.info("FoldSplitContainer1Test beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/FoldSplitContainer/FoldSplitContainer1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get FoldSplitContainer1 state pages:" + JSON.stringify(pages));
        if (!("FoldSplitContainer1" == pages.name)) {
          console.info("get FoldSplitContainer1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push FoldSplitContainer1 page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push FoldSplitContainer1 page error:" + err);
      }
      console.info("FoldSplitContainer1 beforeEach end");
      done();
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   FoldSplitContainer1Test_0100
     * @tc.number SUB_ARKUI_API_FoldSplitContainer1Test_0100
     * @tc.desc   ArkUI API
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('FoldSplitContainer1Test_0100', Level.LEVEL2, async (done: Function) => {
      console.info('[FoldSplitContainer1Test_0100] START');
      await CommonFunc.sleep(2000);

      let strJson = getInspectorByKey('PageIdColumn');
      expect(JSON.parse(strJson).$type).assertEqual('Column');

      console.info('[FoldSplitContainer1Test_0100] END');
      done();
    });

  })
}