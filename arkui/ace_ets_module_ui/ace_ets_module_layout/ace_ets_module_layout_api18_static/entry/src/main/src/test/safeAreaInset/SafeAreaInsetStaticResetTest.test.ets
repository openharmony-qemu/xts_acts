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

import CommonFunc from '../../../ets/MainAbility/common/Common';
import {
  describe,
  it,
  expect,
  Level
} from '@ohos/hypium-static/src/main/indexStatic';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import router from '@ohos.router';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { Driver, ON } from '@ohos.UiTest';

async function goToPage(url: string, pageName: string): Promise<void> {
  try {
    const testRouter = AppStorage.get<Router>("router") as Router;
    testRouter.clear();
    let pages: router.RouterState = testRouter.getState();
    if (!(pageName == pages.name)) {
      let options: router.RouterOptions = {
        url: url
      };
      await testRouter.pushUrl(options);
      await CommonFunc.sleep(2000);
    }
  } catch (err) {
    console.error("push " + pageName + " page error: " + err);
  }
}

export default function SafeAreaInsetStaticResetTest() {
  describe('SafeAreaInsetStaticResetTest', (): void => {
    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Reset_Static_0100
     * @tc.number SUB_ACE_SAFEAREAINSET_Reset_Static_0100
     * @tc.desc   test main content layout without calling safeAreaInset
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Reset_Static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0100] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_6', 'SafeAreaInsetStatic_6');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r1Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r1Main');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0100] main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0100] main.top - host.top: ' + (mainRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0100] host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(70))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(5))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0100] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_Reset_Static_0100] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Reset_Static_0200
     * @tc.number SUB_ACE_SAFEAREAINSET_Reset_Static_0200
     * @tc.desc   test safeAreaInset re-evaluated with undefined options resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Reset_Static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_6', 'SafeAreaInsetStatic_6');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r2Main');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] before click main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] before click host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(55))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(20))) <= 1).assertTrue();
        let driver = Driver.create();
        let r2Button = await driver.findComponent(ON.id('SafeAreaInsetStatic_r2Toggle'));
        expect(r2Button != null).assertTrue();
        await (r2Button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r2Host');
        mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r2Main');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] after click main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] after click main.top - host.top: ' + (mainRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] after click host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(70))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(5))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_Reset_Static_0200] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Reset_Static_0300
     * @tc.number SUB_ACE_SAFEAREAINSET_Reset_Static_0300
     * @tc.desc   test safeAreaInset re-evaluated with empty config resets all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Reset_Static_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_6', 'SafeAreaInsetStatic_6');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Main');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] before click main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] before click host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(55))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(20))) <= 1).assertTrue();
        let driver = Driver.create();
        let r3Button = await driver.findComponent(ON.id('SafeAreaInsetStatic_r3Toggle'));
        expect(r3Button != null).assertTrue();
        await (r3Button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Host');
        mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r3Main');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] after click main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] after click main.top - host.top: ' + (mainRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] after click host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(70))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(5))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_Reset_Static_0300] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Reset_Static_0400
     * @tc.number SUB_ACE_SAFEAREAINSET_Reset_Static_0400
     * @tc.desc   test edge config with empty build result clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Reset_Static_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0400] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_7', 'SafeAreaInsetStatic_7');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r4Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r4Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r4Top');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0400] host height: ' + (hostRect.bottom - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0400] top.top - host.top: ' + (topRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0400] top height: ' + (topRect.bottom - topRect.top));
        expect(Math.floor(Math.abs((hostRect.bottom - hostRect.top) - uiContext.vp2px(52))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((topRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((topRect.bottom - topRect.top) - uiContext.vp2px(10))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0400] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_Reset_Static_0400] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Reset_Static_0500
     * @tc.number SUB_ACE_SAFEAREAINSET_Reset_Static_0500
     * @tc.desc   test safeAreaInset re-evaluated with undefined edge clears that edge only
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Reset_Static_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_7', 'SafeAreaInsetStatic_7');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Host');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] before click host height: ' + (hostRect.bottom - hostRect.top));
        expect(Math.floor(Math.abs((hostRect.bottom - hostRect.top) - uiContext.vp2px(67))) <= 1).assertTrue();
        let driver = Driver.create();
        let r5Button = await driver.findComponent(ON.id('SafeAreaInsetStatic_r5Toggle'));
        expect(r5Button != null).assertTrue();
        await (r5Button?.click() as Promise<void>);
        await CommonFunc.sleep(1000);
        hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r5Top');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] after click host height: ' + (hostRect.bottom - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] top.top - host.top: ' + (topRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] top height: ' + (topRect.bottom - topRect.top));
        expect(Math.floor(Math.abs((hostRect.bottom - hostRect.top) - uiContext.vp2px(52))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((topRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((topRect.bottom - topRect.top) - uiContext.vp2px(10))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_Reset_Static_0500] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_Reset_Static_0600
     * @tc.number SUB_ACE_SAFEAREAINSET_Reset_Static_0600
     * @tc.desc   test all four edges set to undefined reset all edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_Reset_Static_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0600] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_7', 'SafeAreaInsetStatic_7');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r6Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_r6Main');
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0600] host height: ' + (hostRect.bottom - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0600] main height: ' + (mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs((hostRect.bottom - hostRect.top) - uiContext.vp2px(40))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_Reset_Static_0600] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_Reset_Static_0600] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });
  });
}
