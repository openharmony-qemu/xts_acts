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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import Utils from '../Utils';

const UI_EVENT_CLICK: number = 10;

export default function TabSegmentButtonV2Animation() {
  describe('TabSegmentButtonV2Animation', () => {
    beforeEach(async (done: Function) => {
      console.info("TabSegmentButtonV2Animation beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/segmentButtonV2/TabSegmentButtonV2Animation",
      }
      try {
        let pages = router.getState();
        console.info("get current pages:" + JSON.stringify(pages));
        if (pages.name !== "TabSegmentButtonV2Animation") {
          router.clear();
          console.info("get TabSegmentButtonV2Animation pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TabSegmentButtonV2Animation page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TabSegmentButtonV2Animation page error:" + err);
      }
      console.info("TabSegmentButtonV2Animation beforeEach end");
      done();
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("TabSegmentButtonV2Animation after each called");
    });

    /**
     * @tc.name   TabSegmentButtonV2Animation_001
     * @tc.number TabSegmentButtonV2Animation_001
     * @tc.desc   Test MultiSegmentButtonV2 selectedIndexes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TabSegmentButtonV2Animation_001', Level.LEVEL0, async (done: Function) => {
      console.log("[TabSegmentButtonV2Animation_001] START");
      await CommonFunc.sleep(1000);
      expect(sendEventByKey('TabSegmentButtonV2Animation_true', UI_EVENT_CLICK, '')).assertTrue();
      await CommonFunc.sleep(1500);

      let enabled: boolean | undefined = Utils.resolveEnableStateAnimationAttr(
        'TabSegmentButtonV2_03', 'TabSegmentButtonV2Animation_mirror', 'TabSegmentButtonV2Animation_001'
      );
      expect(enabled !== undefined).assertTrue();
      expect(enabled).assertEqual(true);
      console.log("[TabSegmentButtonV2Animation_001] END");
      done();
    })
  })
}