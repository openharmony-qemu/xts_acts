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

export default function SafeAreaInsetStaticTest7() {
  describe('SafeAreaInsetStaticTest7', () => {
    beforeEach(async (): Promise<void> => {
      console.info("SafeAreaInsetStaticTest7 beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/safeAreaInset/SafeAreaInsetStatic7',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SafeAreaInsetStatic7 state pages:" + JSON.stringify(pages));
        if (!("SafeAreaInsetStatic7" == pages.name)) {
          console.info("get SafeAreaInsetStatic7 pages.name:" + JSON.stringify(pages.name));
          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SafeAreaInsetStatic7 page error:" + err);
        expect().assertFail();
      }
      console.info("SafeAreaInsetStaticTest7 beforeEach end");
    });
    afterEach(async () => {
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100
     * @tc.desc   test main content layout without calling safeAreaInset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r1Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r1Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100] main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100] main.top - host.top: '
          + uiContext.px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100] host.bottom - main.bottom: '
          + uiContext.px2vp(hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200
     * @tc.number SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200
     * @tc.desc   test safeAreaInset re-evaluated with empty config resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] START');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] before click main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] before click host.bottom - main.bottom: '
          + uiContext.px2vp(hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 55)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - mainRect.bottom) - 20)) <= 1).assertTrue();
        let driver = Driver.create();
        let r3Button = await driver.findComponent(ON.id('SafeAreaInsetStatic_r3Toggle'));
        expect(r3Button != null).assertTrue();
        await (r3Button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Host');
        mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Main');
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] after click main height: '
          + uiContext.px2vp(mainRect.bottom - mainRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] after click main.top - host.top: '
          + uiContext.px2vp(mainRect.top - hostRect.top));
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] after click host.bottom - main.bottom: '
          + uiContext.px2vp(hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.bottom - mainRect.top) - 70)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(mainRect.top - hostRect.top) - 5)) <= 1).assertTrue();
        expect(Math.floor(Math.abs(uiContext.px2vp(hostRect.bottom - mainRect.bottom) - 5)) <= 1).assertTrue();
        console.info('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] END');
        done();
      } catch (err) {
        console.error('[SUB_ARKUI_API_SafeAreaInsetStaticTest7_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
