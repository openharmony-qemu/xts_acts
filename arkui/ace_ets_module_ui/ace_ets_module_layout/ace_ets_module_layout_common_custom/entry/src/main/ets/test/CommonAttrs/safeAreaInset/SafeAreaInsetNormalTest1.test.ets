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

export default function SafeAreaInsetNormalTest1() {
  describe('SafeAreaInsetNormalTest1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetNormalTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CommonAttrs/safeAreaInset/SafeAreaInsetNormal1',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get SafeAreaInsetNormal1 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetNormal1" == pages.name)) {
          console.info("get SafeAreaInsetNormal1 pages.name:" + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetNormal1 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetNormalTest1 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest1_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest1_0100
     * @tc.desc   test SafeAreaInsetAlignment enum values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0100 START');
        expect(SafeAreaInsetAlignment.START).assertEqual(0);
        expect(SafeAreaInsetAlignment.CENTER).assertEqual(1);
        expect(SafeAreaInsetAlignment.END).assertEqual(2);
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0100 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200
     * @tc.desc   test safeAreaInset with valid bottom edge config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200 START');
        let strJson = getInspectorByKey('SafeAreaInsetNormal_n1Host');
        let obj: Record<string, ESObject> = JSON.parse(strJson);
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] n1Host $attrs.safeAreaInset: '
          + obj.$attrs.safeAreaInset);

        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n1Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n1Main');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n1Bottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] main.top - host.top: '
          + px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] host.bottom - main.bottom: '
          + px2vp(hostRect.bottom - mainRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] host.bottom - edge.bottom: '
          + px2vp(hostRect.bottom - edgeRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] edge height: '
          + px2vp(edgeRect.bottom - edgeRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] edge.left - host.left: '
          + px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.bottom - edgeRect.top) - 15)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300
     * @tc.desc   test safeAreaInset with four edges config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300', Level.LEVEL1, async (done: Function) => {
      try {
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300 START');
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n2Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n2Top');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n2End');
        let bottomRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n2Bottom');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetNormal_n2Start');
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] main width: '
          + px2vp(mainRect.right - mainRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] main height: '
          + px2vp(mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs(px2vp(mainRect.right - mainRect.left) - 66)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.bottom - mainRect.top) - 60)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.left - hostRect.left) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.right - mainRect.right) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(mainRect.top - hostRect.top) - 15)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - mainRect.bottom) - 15)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] top edge top: '
          + px2vp(topRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] top edge left: '
          + px2vp(topRect.left - hostRect.left));
        expect(Math.floor(Math.abs(px2vp(topRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(topRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] end edge right: '
          + px2vp(hostRect.right - endRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] end edge top: '
          + px2vp(endRect.top - hostRect.top));
        expect(Math.floor(Math.abs(px2vp(hostRect.right - endRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(endRect.top - hostRect.top) - 30)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] bottom edge bottom: '
          + px2vp(hostRect.bottom - bottomRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] bottom edge right: '
          + px2vp(hostRect.right - bottomRect.right));
        expect(Math.floor(Math.abs(px2vp(hostRect.bottom - bottomRect.bottom) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(hostRect.right - bottomRect.right) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] start edge left: '
          + px2vp(startRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] start edge top: '
          + px2vp(startRect.top - hostRect.top));
        expect(Math.floor(Math.abs(px2vp(startRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(px2vp(startRect.top - hostRect.top) - 30)) <= 1).assertTrue();
        console.info('SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300 END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetNormalTest1_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
