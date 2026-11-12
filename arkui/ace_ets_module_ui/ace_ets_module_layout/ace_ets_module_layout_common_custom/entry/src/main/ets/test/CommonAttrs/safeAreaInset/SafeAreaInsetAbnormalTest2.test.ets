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

import { describe, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium-dynamic"
import router from '@ohos.router';
import CommonFunc from '../../../MainAbility/common/Common';

export default function SafeAreaInsetAbnormalTest2() {
  describe('SafeAreaInsetAbnormalTest2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetAbnormalTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetAbnormal2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetAbnormal2 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetAbnormal2" == pages.name)) {
          console.info("get SafeAreaInsetAbnormal2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetAbnormal2 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetAbnormalTest2 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100
     * @tc.desc   test edge config with undefined content clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a6Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100] a6 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200
     * @tc.desc   test edge config with null content clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetAbnormal_a7Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200] a7 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetAbnormalTest2_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
