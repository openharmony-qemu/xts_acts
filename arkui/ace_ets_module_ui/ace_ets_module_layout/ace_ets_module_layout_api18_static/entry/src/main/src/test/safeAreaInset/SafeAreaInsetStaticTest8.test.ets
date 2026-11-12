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
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';

export default function SafeAreaInsetStaticTest8() {
  describe('SafeAreaInsetStaticTest8', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest8 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic8',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic8 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic8" == pages.name)) {
          console.info("get SafeAreaInsetStatic8 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic8 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest8 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100
     * @tc.desc   test edge config with empty build result clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r4Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r4Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r4Top');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100] host height: '
          + uiContext.px2vp(hostRect.bottom - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100] top.top - host.top: '
          + uiContext.px2vp(topRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100] top height: '
          + uiContext.px2vp(topRect.bottom - topRect.top));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - hostRect.top) - 52)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 30)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(topRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(topRect.bottom - topRect.top) - 10)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200
     * @tc.desc   test safeAreaInset re-evaluated with undefined edge clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Host');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] before click host height: '
          + uiContext.px2vp(hostRect.bottom - hostRect.top));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - hostRect.top) - 67)) <= 1).assertTrue();
        let driver = Driver.create();
        let r5Button = await driver.findComponent(ON.id('SafeAreaInsetStatic_r5Toggle'));
        expect(r5Button != null).assertTrue();
        await (r5Button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Top');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] after click host height: '
          + uiContext.px2vp(hostRect.bottom - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] top.top - host.top: '
          + uiContext.px2vp(topRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] top height: '
          + uiContext.px2vp(topRect.bottom - topRect.top));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - hostRect.top) - 52)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 30)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(topRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(topRect.bottom - topRect.top) - 10)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300
     * @tc.desc   test all four edges set to undefined reset all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r6Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r6Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300] host height: '
          + uiContext.px2vp(hostRect.bottom - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300] main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - hostRect.top) - 40)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 30)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest8_0300] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
