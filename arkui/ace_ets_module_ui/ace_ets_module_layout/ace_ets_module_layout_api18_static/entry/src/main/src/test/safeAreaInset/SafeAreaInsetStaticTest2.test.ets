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
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function SafeAreaInsetStaticTest2() {
  describe('SafeAreaInsetStaticTest2', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest2 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic2',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic2 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic2" == pages.name)) {
          console.info("get SafeAreaInsetStatic2 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic2 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest2 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100
     * @tc.desc   test start and end edges swap physical sides in RTL layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Top');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8End');
        let bottomRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Bottom');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Start');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] host.right - start.right: '
          + uiContext.px2vp(hostRect.right - startRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] end.left - host.left: '
          + uiContext.px2vp(endRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] host.right - top.right: '
          + uiContext.px2vp(hostRect.right - topRect.right));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] bottom.left - host.left: '
          + uiContext.px2vp(bottomRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] main.left - host.left: '
          + uiContext.px2vp(mainRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] host.right - main.right: '
          + uiContext.px2vp(hostRect.right - mainRect.right));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - startRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(endRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - topRect.right) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(bottomRect.left - hostRect.left) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.left - hostRect.left) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - mainRect.right) - 17)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200
     * @tc.desc   test wrapContent host height with top and bottom edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n3Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n3Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200] host height: '
          + uiContext.px2vp(hostRect.bottom - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200] main.top - host.top: '
          + uiContext.px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200] host.bottom - main.bottom: '
          + uiContext.px2vp(hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - hostRect.top) - 67)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.top - hostRect.top) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - mainRect.bottom) - 20)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 30)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest2_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
