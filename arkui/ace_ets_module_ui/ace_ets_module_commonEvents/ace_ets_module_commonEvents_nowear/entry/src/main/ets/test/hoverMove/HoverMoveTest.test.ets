/*
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import { Driver } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common';

export default function hoverMoveTest() {
  describe('HoverMoveTest', () => {
    beforeEach(async (done: Function) => {
      console.info('HoverMoveTest beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/HoverMove/HoverMove',
      };
      try {
        router.clear();
        let pages = router.getState();
        if (!('HoverMovePage' == pages.name)) {
          await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push HoverMove page success');
        }
      } catch (err) {
        console.error('push page error: ' + err);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   hoverMove_0100
     * @tc.number SUB_ArkUI_ArkUI_hoverMove_0100
     * @tc.desc   penSwipe on button and verify hoverMove coordinates change
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('hoverMove_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[hoverMove_0100] START');
      let driver: Driver = Driver.create();
      let rect = CommonFunc.getComponentRectOnScreen('hoverMoveBtn');
      let w = rect.right - rect.left;
      let h = rect.bottom - rect.top;
      let startX = Math.round(rect.left + w * 0.2);
      let endX = Math.round(rect.left + w * 0.8);
      let midY = Math.round(rect.top + h / 2);
      console.info('[hoverMove_0100] rect left=' + rect.left + ' right=' + rect.right + ' top=' + rect.top + ' bottom=' + rect.bottom);
      console.info('[hoverMove_0100] penSwipe from(' + startX + ',' + midY + ') to(' + endX + ',' + midY + ')');
      await driver.penSwipe({ x: startX, y: midY }, { x: endX, y: midY }, 600, 0.5);
      await CommonFunc.sleep(1000);
      let hoverX: number = AppStorage.get<number>('hoverX') ?? -1;
      let hoverY: number = AppStorage.get<number>('hoverY') ?? -1;
      let windowX: number = AppStorage.get<number>('windowX') ?? -1;
      let windowY: number = AppStorage.get<number>('windowY') ?? -1;
      let displayX: number = AppStorage.get<number>('displayX') ?? -1;
      let displayY: number = AppStorage.get<number>('displayY') ?? -1;
      console.info('[hoverMove_0100] hoverX=' + hoverX + ' hoverY=' + hoverY + ' windowX=' + windowX + ' windowY=' + windowY + ' displayX=' + displayX + ' displayY=' + displayY);
      expect(hoverX >= 0).assertTrue();
      expect(hoverY >= 0).assertTrue();
      expect(windowX >= 0).assertTrue();
      expect(windowY >= 0).assertTrue();
      expect(displayX >= 0).assertTrue();
      expect(displayY >= 0).assertTrue();
      done();
    });
  });
}
