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

export default function SafeAreaInsetNullUndefinedTest4() {
  describe('SafeAreaInsetNullUndefinedTest4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNullUndefinedTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNullUndefined4',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNullUndefined4 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNullUndefined4" == pages.name)) {
          console.info("get SafeAreaInsetNullUndefined4 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNullUndefined4 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNullUndefinedTest4 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100
     * @tc.desc   test omitted alignment falls back to CENTER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100] START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u7bHost');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u7bMain');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u7bBottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200
     * @tc.desc   test all four edges set to undefined reset all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200] START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNullUndefined_u8Host');
        let heightVp = px2vp(hostRect.bottom - hostRect.top);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200] u8 host height: ' + heightVp);
        expect(Math.floor(Math.abs(heightVp - 40)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNullUndefinedTest4_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
