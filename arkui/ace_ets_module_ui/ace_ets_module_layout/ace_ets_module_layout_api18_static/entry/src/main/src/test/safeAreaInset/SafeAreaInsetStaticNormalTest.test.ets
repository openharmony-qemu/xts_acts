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
import { SafeAreaInsetAlignment } from '@kit.ArkUI';

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

export default function SafeAreaInsetStaticNormalTest() {
  describe('SafeAreaInsetStaticNormalTest', (): void => {
    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0100
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0100
     * @tc.desc   test SafeAreaInsetAlignment enum values START CENTER END
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0100] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_1', 'SafeAreaInsetStatic_1');
        expect(SafeAreaInsetAlignment.START).assertEqual(0);
        expect(SafeAreaInsetAlignment.CENTER).assertEqual(1);
        expect(SafeAreaInsetAlignment.END).assertEqual(2);
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0100] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0100] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0200
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0200
     * @tc.desc   test safeAreaInset bottom edge with spacing in fixed size host
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_1', 'SafeAreaInsetStatic_1');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n1Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n1Main');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n1Bottom');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] main.top - host.top: ' + (mainRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] host.bottom - edge.bottom: ' + (hostRect.bottom - edgeRect.bottom));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] edge height: ' + (edgeRect.bottom - edgeRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] edge.left - host.left: ' + (edgeRect.left - hostRect.left));
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(51))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(24))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - edgeRect.bottom) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((edgeRect.bottom - edgeRect.top) - uiContext.vp2px(15))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((edgeRect.left - hostRect.left) - uiContext.vp2px(40))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0200] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0300
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0300
     * @tc.desc   test SafeAreaInsetOptions four edges config in LTR layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_1', 'SafeAreaInsetStatic_1');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Main');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] main width: ' + (mainRect.right - mainRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] main height: ' + (mainRect.bottom - mainRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] main.left - host.left: ' + (mainRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] host.right - main.right: ' + (hostRect.right - mainRect.right));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] main.top - host.top: ' + (mainRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((mainRect.right - mainRect.left) - uiContext.vp2px(66))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(60))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.left - hostRect.left) - uiContext.vp2px(17))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.right - mainRect.right) - uiContext.vp2px(17))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.top - hostRect.top) - uiContext.vp2px(15))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(15))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0300] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0400
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0400
     * @tc.desc   test SafeAreaInsetAlignment START CENTER END positions in LTR layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_1', 'SafeAreaInsetStatic_1');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Host');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Top');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2End');
        let bottomRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Bottom');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n2Start');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] top.top - host.top: ' + (topRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] top.left - host.left: ' + (topRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] host.right - end.right: ' + (hostRect.right - endRect.right));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] end.top - host.top: ' + (endRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] host.bottom - bottom.bottom: ' + (hostRect.bottom - bottomRect.bottom));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] host.right - bottom.right: ' + (hostRect.right - bottomRect.right));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] start.left - host.left: ' + (startRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] start.top - host.top: ' + (startRect.top - hostRect.top));
        expect(Math.floor(Math.abs((topRect.top - hostRect.top) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((topRect.left - hostRect.left) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.right - endRect.right) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((endRect.top - hostRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - bottomRect.bottom) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.right - bottomRect.right) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((startRect.left - hostRect.left) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((startRect.top - hostRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0400] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0500
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0500
     * @tc.desc   test start and end edges swap physical sides in RTL layout
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_2', 'SafeAreaInsetStatic_2');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Main');
        let topRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Top');
        let endRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8End');
        let bottomRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Bottom');
        let startRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n8Start');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] host.right - start.right: ' + (hostRect.right - startRect.right));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] end.left - host.left: ' + (endRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] host.right - top.right: ' + (hostRect.right - topRect.right));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] bottom.left - host.left: ' + (bottomRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] main.left - host.left: ' + (mainRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] host.right - main.right: ' + (hostRect.right - mainRect.right));
        expect(Math.floor(Math.abs((hostRect.right - startRect.right) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((endRect.left - hostRect.left) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.right - topRect.right) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((bottomRect.left - hostRect.left) - uiContext.vp2px(5))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.left - hostRect.left) - uiContext.vp2px(17))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.right - mainRect.right) - uiContext.vp2px(17))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0500] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0600
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0600
     * @tc.desc   test wrapContent host height with top and bottom edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0600] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_2', 'SafeAreaInsetStatic_2');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n3Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n3Main');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0600] host height: ' + (hostRect.bottom - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0600] main.top - host.top: ' + (mainRect.top - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0600] host.bottom - main.bottom: ' + (hostRect.bottom - mainRect.bottom));
        expect(Math.floor(Math.abs((hostRect.bottom - hostRect.top) - uiContext.vp2px(67))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.top - hostRect.top) - uiContext.vp2px(17))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - mainRect.bottom) - uiContext.vp2px(20))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0600] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0600] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0700
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0700
     * @tc.desc   test wrapContent host width with start and end edges
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_3', 'SafeAreaInsetStatic_3');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n9Host');
        let mainRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n9Main');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] host width: ' + (hostRect.right - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] main.left - host.left: ' + (mainRect.left - hostRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] main width: ' + (mainRect.right - mainRect.left));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] main height: ' + (mainRect.bottom - mainRect.top));
        expect(Math.floor(Math.abs((hostRect.right - hostRect.left) - uiContext.vp2px(94))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.left - hostRect.left) - uiContext.vp2px(17))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.right - mainRect.left) - uiContext.vp2px(60))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((mainRect.bottom - mainRect.top) - uiContext.vp2px(30))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0700] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0800
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0800
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with vp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0800] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_3', 'SafeAreaInsetStatic_3');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4aHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0800] n4a host height: ' + heightPx);
        expect(Math.floor(Math.abs(heightPx - uiContext.vp2px(55))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0800] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0800] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_0900
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_0900
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with px unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_0900', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0900] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_4', 'SafeAreaInsetStatic_4');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4bHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        let expectedPx: number = uiContext.vp2px(52) + 3;
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0900] n4b host heightPx: ' + heightPx + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_0900] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_0900] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_1000
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_1000
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with fp unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_1000', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1000] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_4', 'SafeAreaInsetStatic_4');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4cHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        let expectedPx: number = uiContext.vp2px(52) + uiContext.fp2px(3);
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1000] n4c host heightPx: ' + heightPx + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1000] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_1000] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_1100
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_1100
     * @tc.desc   test SafeAreaInsetEdgeConfig spacing with lpx unit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1100] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_4', 'SafeAreaInsetStatic_4');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n4dHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        let expectedPx: number = uiContext.vp2px(52) + uiContext.lpx2px(3);
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1100] n4d host heightPx: ' + heightPx + ', expectedPx: ' + expectedPx);
        expect(Math.floor(Math.abs(heightPx - expectedPx)) <= 2).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1100] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_1100] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_1200
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_1200
     * @tc.desc   test default spacing 0vp when spacing is omitted
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1200] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_5', 'SafeAreaInsetStatic_5');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n5Host');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1200] n5 host height: ' + heightPx);
        expect(Math.floor(Math.abs(heightPx - uiContext.vp2px(52))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1200] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_1200] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_1300
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_1300
     * @tc.desc   test edge content margin counts into occupancy
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1300] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_5', 'SafeAreaInsetStatic_5');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n6Host');
        let edgeRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n6Bottom');
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1300] n6 host height: ' + (hostRect.bottom - hostRect.top));
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1300] host.bottom - edge.bottom: ' + (hostRect.bottom - edgeRect.bottom));
        expect(Math.floor(Math.abs((hostRect.bottom - hostRect.top) - uiContext.vp2px(59))) <= 1).assertTrue();
        expect(Math.floor(Math.abs((hostRect.bottom - edgeRect.bottom) - uiContext.vp2px(5))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1300] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_1300] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_1400
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_1400
     * @tc.desc   test effective safe area is max of safeAreaPadding and edge occupancy when padding is smaller
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1400] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_5', 'SafeAreaInsetStatic_5');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n7aHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1400] n7a host height: ' + heightPx);
        expect(Math.floor(Math.abs(heightPx - uiContext.vp2px(55))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1400] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_1400] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   SUB_ACE_SAFEAREAINSET_StaticNormal_1500
     * @tc.number SUB_ACE_SAFEAREAINSET_StaticNormal_1500
     * @tc.desc   test effective safe area is max of safeAreaPadding and edge occupancy when padding is larger
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_ACE_SAFEAREAINSET_StaticNormal_1500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1500] START');
        await goToPage('MainAbility/pages/safeAreaInset/SafeAreaInsetStatic_6', 'SafeAreaInsetStatic_6');
        const uiContext = AppStorage.get<UIContext>('uiContext')!;
        let hostRect = CommonFunc.getComponentRect('SafeAreaInsetStatic_n7bHost');
        let heightPx: number = hostRect.bottom - hostRect.top;
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1500] n7b host height: ' + heightPx);
        expect(Math.floor(Math.abs(heightPx - uiContext.vp2px(60))) <= 1).assertTrue();
        console.info('[SUB_ACE_SAFEAREAINSET_StaticNormal_1500] END');
      } catch (err) {
        console.error('[SUB_ACE_SAFEAREAINSET_StaticNormal_1500] ERR: ' + err);
        expect().assertFail();
      }
      done();
    });
  });
}
