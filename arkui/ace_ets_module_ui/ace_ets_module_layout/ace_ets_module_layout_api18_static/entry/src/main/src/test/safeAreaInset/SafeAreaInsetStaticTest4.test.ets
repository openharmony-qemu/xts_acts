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

export default function SafeAreaInsetStaticTest4() {
  describe('SafeAreaInsetStaticTest4', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest4 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic4',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic4 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic4" == pages.name)) {
          console.info("get SafeAreaInsetStatic4 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic4 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest4 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with px unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4bHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        let expectedPx: number = uiContext.vp2px(52) + 3;
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100] n4b host heightPx: '
          + heightPx + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with fp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4cHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        let expectedPx: number = uiContext.vp2px(52) + uiContext.fp2px(3);
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200] n4c host heightPx: '
          + heightPx + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with lpx unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4dHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        let expectedPx: number = uiContext.vp2px(52) + uiContext.lpx2px(3);
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300] n4d host heightPx: '
          + heightPx + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest4_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
