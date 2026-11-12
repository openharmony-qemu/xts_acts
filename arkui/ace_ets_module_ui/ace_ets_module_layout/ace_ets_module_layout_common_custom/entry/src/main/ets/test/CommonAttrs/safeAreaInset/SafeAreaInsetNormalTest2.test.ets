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

export default function SafeAreaInsetNormalTest2() {
  describe('SafeAreaInsetNormalTest2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNormalTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal2',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNormal2 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNormal2" == pages.name)) {
          console.info("get SafeAreaInsetNormal2 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNormal2 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNormalTest2 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100
     * @tc.desc   test safeAreaInset with SafeAreaInsetAlignment.START on top edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3StartEndHost');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3StartTop');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100] edge.top - host.top: '
          + px2vp(edgeRect.top - hostRect.top));
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200
     * @tc.desc   test safeAreaInset with SafeAreaInsetAlignment.CENTER on top edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3CenterHost');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3CenterTop');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 35)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300
     * @tc.desc   test safeAreaInset with SafeAreaInsetAlignment.END on bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3StartEndHost');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3EndBottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300] host.right - edge.right: '
          + px2vp(hostRect.right - edgeRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300] host.bottom - edge.bottom: '
          + px2vp(hostRect.bottom - edgeRect.bottom));
        expect(Math.floor(Math.abs(px2vp(hostRect.right - edgeRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400
     * @tc.desc   test safeAreaInset with default alignment on bottom edge
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3CenterHost');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3DefaultBottom');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n3CenterMain');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400] main.top - host.top: '
          + px2vp(mainRect.top - hostRect.top));
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 35)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 15)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest2_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
