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

export default function SafeAreaInsetStaticTest5() {
  describe('SafeAreaInsetStaticTest5', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest5 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic5',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic5 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic5" == pages.name)) {
          console.info("get SafeAreaInsetStatic5 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic5 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest5 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100
     * @tc.desc   test default spacing 0vp when spacing is omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n5Host');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100] n5 host height: ' + uiContext.px2vp(heightPx));
        expect(Math.floor(Math.abs(uiContext.px2vp(heightPx) - 52)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200
     * @tc.desc   test edge content margin counts into occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n6Host');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n6Bottom');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200] n6 host height: '
          + uiContext.px2vp(hostRect.bottom - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200] host.bottom - edge.bottom: '
          + uiContext.px2vp(hostRect.bottom - edgeRect.bottom));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - hostRect.top) - 59)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - edgeRect.bottom) - 7)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300
     * @tc.desc   test effective safe area is max of safeAreaPadding and edge occupancy when padding is smaller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n7aHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300] n7a host height: ' + uiContext.px2vp(heightPx));
        expect(Math.floor(Math.abs(uiContext.px2vp(heightPx) - 55)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest5_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
