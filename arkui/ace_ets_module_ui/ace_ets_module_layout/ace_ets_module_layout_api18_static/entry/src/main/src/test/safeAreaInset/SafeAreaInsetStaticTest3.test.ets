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

export default function SafeAreaInsetStaticTest3() {
  describe('SafeAreaInsetStaticTest3', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest3 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic3',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic3 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic3" == pages.name)) {
          console.info("get SafeAreaInsetStatic3 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic3 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest3 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100
     * @tc.desc   test wrapContent host width with start and end edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n9Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n9Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] host width: '
          + uiContext.px2vp(hostRect.right - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] main.left - host.left: '
          + uiContext.px2vp(mainRect.left - hostRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] main width: '
          + uiContext.px2vp(mainRect.right - mainRect.left));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.right - hostRect.left) - 94)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.left - hostRect.left) - 17)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.right - mainRect.left) - 60)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 30)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with vp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4aHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200] n4a host height: ' + uiContext.px2vp(heightPx));
        expect(Math.floor(Math.abs(uiContext.px2vp(heightPx) - 55)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest3_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
