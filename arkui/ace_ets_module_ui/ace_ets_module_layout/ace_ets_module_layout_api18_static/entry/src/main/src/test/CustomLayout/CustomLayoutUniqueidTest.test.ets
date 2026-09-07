'use static';
/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';

import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

export default function CustomLayoutUniqueidTest() {
  describe('CustomLayoutUniqueidTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("CustomLayoutUniqueidTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomLayout/CustomLayoutUniqueidPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomLayoutUniqueidTest state pages:" + JSON.stringify(pages));
        if (!("CustomLayoutUniqueidTest" == pages.name)) {
          console.info("get CustomLayoutUniqueidTest pages.name:" + JSON.stringify(pages.name));

          await routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);

        }
      } catch (err) {
        console.error("push CustomLayoutUniqueidTest page error: " + err);
        expect().assertFail();
      }

    });






/**
     * @tc.number   CustomLayoutUniqueidTest_static_0100
     * @tc.name     CustomLayoutUniqueidTest_static_0100
     * @tc.desc     CustomLayoutUniqueidTest_static_0100
     * @tc.level    Level.LEVEL1
     */
it('CustomLayoutUniqueidTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('[CustomLayoutUniqueidTest_static_0100] START');
        await CommonFunc.sleep(2000);

        console.log('[CustomLayoutUniqueidTest_static_0100] onPlaceChildren_UniqueId_0 is:' +
        AppStorage.get<Int>('CustomLayoutUniqueid_onPlaceChildren_UniqueId_0'));
        console.log('[CustomLayoutUniqueidTest_static_0100] onPlaceChildren_UniqueId_1 is:' +
        AppStorage.get<Int>('CustomLayoutUniqueid_onPlaceChildren_UniqueId_1'));
        console.log('[CustomLayoutUniqueidTest_static_0100] onMeasureSize_UniqueId_0 is:' +
        AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_0'));
        console.log('[CustomLayoutUniqueidTest_static_0100] onMeasureSize_UniqueId_1 is:' +
        AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_1'));
        console.log('[CustomLayoutUniqueidTest_static_0100] onMeasureSize_FrameNode_UniqueId_0 is:' +
        AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_0'));
        console.log('[CustomLayoutUniqueidTest_static_0100] onMeasureSize_FrameNode_UniqueId_1 is:' +
        AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_1'));
        expect(AppStorage.get<Int>('CustomLayoutUniqueid_onPlaceChildren_UniqueId_0'))
          .assertEqual(AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_0'));
        expect(AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_0'))
          .assertEqual(AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_0'));
        expect(AppStorage.get<Int>('CustomLayoutUniqueid_onPlaceChildren_UniqueId_1'))
          .assertEqual(AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_1'));
        expect(AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_UniqueId_1'))
          .assertEqual(AppStorage.get<Int>('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_1'));
        AppStorage.delete('CustomLayoutUniqueid_onPlaceChildren_UniqueId_0');
        AppStorage.delete('CustomLayoutUniqueid_onPlaceChildren_UniqueId_1');
        AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_UniqueId_0');
        AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_UniqueId_1');
        AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_0');
        AppStorage.delete('CustomLayoutUniqueid_onMeasureSize_FrameNode_UniqueId_1');

        console.info('[CustomLayoutUniqueidTest_static_0100] END');
        done();
      } catch (err) {
        console.error('[CustomLayoutUniqueidTest_static_0100] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });






/**
     * @tc.number   CustomLayoutUniqueidTest_static_0200
     * @tc.name     CustomLayoutUniqueidTest_static_0200
     * @tc.desc     CustomLayoutUniqueidTest_static_0200
     * @tc.level    Level.LEVEL1
     */
it('CustomLayoutUniqueidTest_static_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        console.info('CustomLayoutUniqueidTest_static_0200 START');
        await CommonFunc.sleep(1000);

        let Child_0 = CommonFunc.getComponentRect('CustomLayoutUniqueid_Child_0');
        let Child_1 = CommonFunc.getComponentRect('CustomLayoutUniqueid_Child_1');
        let Child_0_width = Child_0.right - Child_0.left;
        let Child_0_height = Child_0.bottom - Child_0.top;
        let Child_1_width = Child_1.right - Child_1.left;
        let Child_1_height = Child_1.bottom - Child_1.top;

        console.log('[CustomLayoutUniqueidTest_static_0200] Child_0_width is:' + Child_0_width);
        console.log('[CustomLayoutUniqueidTest_static_0200] Child_0_height is:' + Child_0_height);
        console.log('[CustomLayoutUniqueidTest_static_0200] Child_1_width is:' + Child_1_width);
        console.log('[CustomLayoutUniqueidTest_static_0200] Child_1_height is:' + Child_1_height);
        expect(Math.floor(Math.abs(Child_0_width - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Child_0_height - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Child_1_width - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();
        expect(Math.floor(Math.abs(Child_1_height - UIContext.resolveUIContext()!.vp2px(100))) <= 1).assertTrue();

        console.info('[CustomLayoutUniqueidTest_static_0200] END');
        done();
      } catch (err) {
        console.error('[CustomLayoutUniqueidTest_static_0200] ERR: ' + err);
        expect().assertFail();
        done();
      }
    });
  })
}
