'use static';

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

import { describe, beforeEach, afterEach, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { SafeAreaInsetAlignment } from '@kit.ArkUI';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function SafeAreaInsetStaticTest1() {
  describe('SafeAreaInsetStaticTest1', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest1 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic1',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic1 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic1" == pages.name)) {
          console.info("get SafeAreaInsetStatic1 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic1 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest1 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest1_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest1_0100
     * @tc.desc   test SafeAreaInsetAlignment enum values START CENTER END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest1_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0100] START');
        expect(SafeAreaInsetAlignment.START).assertEqual(0);
        expect(SafeAreaInsetAlignment.CENTER).assertEqual(1);
        expect(SafeAreaInsetAlignment.END).assertEqual(2);
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200
     * @tc.desc   test safeAreaInset bottom edge with spacing in fixed size host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n1Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n1Main');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n1Bottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] main.top - host.top: '
          + uiContext.px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] host.bottom - main.bottom: '
          + uiContext.px2vp(hostRect.bottom - mainRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] host.bottom - edge.bottom: '
          + uiContext.px2vp(hostRect.bottom - edgeRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] edge height: '
          + uiContext.px2vp(edgeRect.bottom - edgeRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] edge.left - host.left: '
          + uiContext.px2vp(edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 51)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - mainRect.bottom) - 24)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - edgeRect.bottom) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(edgeRect.bottom - edgeRect.top) - 15)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(edgeRect.left - hostRect.left) - 40)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300
     * @tc.desc   test SafeAreaInsetOptions four edges config in LTR layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] main width: '
          + uiContext.px2vp(mainRect.right - mainRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] main.left - host.left: '
          + uiContext.px2vp(mainRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] host.right - main.right: '
          + uiContext.px2vp(hostRect.right - mainRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] main.top - host.top: '
          + uiContext.px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] host.bottom - main.bottom: '
          + uiContext.px2vp(hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.right - mainRect.left) - 66)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 60)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.left - hostRect.left) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - mainRect.right) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.top - hostRect.top) - 15)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - mainRect.bottom) - 15)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400
     * @tc.desc   test SafeAreaInsetAlignment START CENTER END positions in LTR layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Host');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Top');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2End');
        let bottomRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Bottom');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Start');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] top.top - host.top: '
          + uiContext.px2vp(topRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] top.left - host.left: '
          + uiContext.px2vp(topRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] host.right - end.right: '
          + uiContext.px2vp(hostRect.right - endRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] end.top - host.top: '
          + uiContext.px2vp(endRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] host.bottom - bottom.bottom: '
          + uiContext.px2vp(hostRect.bottom - bottomRect.bottom));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] host.right - bottom.right: '
          + uiContext.px2vp(hostRect.right - bottomRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] start.left - host.left: '
          + uiContext.px2vp(startRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] start.top - host.top: '
          + uiContext.px2vp(startRect.top - hostRect.top));
        expect(Math.floor(Math.abs(uiContext.px2vp(topRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(topRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - endRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(endRect.top - hostRect.top) - 30)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - bottomRect.bottom) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - bottomRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(startRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(startRect.top - hostRect.top) - 30)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest1_0400] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
