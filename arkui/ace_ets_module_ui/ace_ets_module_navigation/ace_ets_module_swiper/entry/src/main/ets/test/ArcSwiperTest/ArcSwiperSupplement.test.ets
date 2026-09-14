/**
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

import { describe, it, expect, Level } from '@ohos/hypium';
import { ArcSwiperController, ArcDotIndicator, ArcDirection } from '@ohos.arkui.ArcSwiper';

export default function ArcSwiperSupplementTest() {
  describe('ArcSwiperSupplementTest', () => {

    // ===================== ArcSwiperController =====================

    /**
     * @tc.number    SUB_ArkUI_ArcSwiper_showNext_PARAM_0001
     * @tc.name      testShowNextParam0001
     * @tc.desc      Test ArcSwiperController.showNext() parameter specification - no parameter call succeeds
     */
    it('testShowNextParam0001', Level.LEVEL0, () => {
      const controller = new ArcSwiperController();
      expect(controller !== null && controller !== undefined).assertTrue();
      controller.showNext();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcSwiper_showNext_RETURN_0001
     * @tc.name      testShowNextReturn0001
     * @tc.desc      Test ArcSwiperController.showNext() return value - no return, call does not throw
     */
    it('testShowNextReturn0001', Level.LEVEL0, () => {
      const controller = new ArcSwiperController();
      let noError = true;
      try {
        controller.showNext();
      } catch (_e) {
        noError = false;
      }
      expect(noError).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcSwiper_showPrevious_PARAM_0002
     * @tc.name      testShowPreviousParam0002
     * @tc.desc      Test ArcSwiperController.showPrevious() parameter specification - no parameter call succeeds
     */
    it('testShowPreviousParam0002', Level.LEVEL0, () => {
      const controller = new ArcSwiperController();
      expect(controller !== null && controller !== undefined).assertTrue();
      controller.showPrevious();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcSwiper_showPrevious_RETURN_0002
     * @tc.name      testShowPreviousReturn0002
     * @tc.desc      Test ArcSwiperController.showPrevious() return value - no return, call does not throw
     */
    it('testShowPreviousReturn0002', Level.LEVEL0, () => {
      const controller = new ArcSwiperController();
      let noError = true;
      try {
        controller.showPrevious();
      } catch (_e) {
        noError = false;
      }
      expect(noError).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcSwiper_finishAnimation_PARAM_0003
     * @tc.name      testFinishAnimationParam0003
     * @tc.desc      Test ArcSwiperController.finishAnimation() parameter specification - with callback and undefined
     */
    it('testFinishAnimationParam0003', Level.LEVEL0, () => {
      const controller = new ArcSwiperController();
      const handler = (): void => {};
      controller.finishAnimation(handler);
      controller.finishAnimation(undefined);
      expect(controller !== null && controller !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcSwiper_finishAnimation_RETURN_0003
     * @tc.name      testFinishAnimationReturn0003
     * @tc.desc      Test ArcSwiperController.finishAnimation() return value - no return, call does not throw
     */
    it('testFinishAnimationReturn0003', Level.LEVEL0, () => {
      const controller = new ArcSwiperController();
      let noError = true;
      try {
        controller.finishAnimation();
        controller.finishAnimation((): void => {});
      } catch (_e) {
        noError = false;
      }
      expect(noError).assertTrue();
    });

    // ===================== ArcDotIndicator =====================

    /**
     * @tc.number    SUB_ArkUI_ArcDotIndicator_arcDirection_PARAM_0004
     * @tc.name      testArcDotIndicatorArcDirectionParam0004
     * @tc.desc      Test ArcDotIndicator.arcDirection() parameter specification - valid ArcDirection values and undefined
     */
    it('testArcDotIndicatorArcDirectionParam0004', Level.LEVEL0, () => {
      const indicator = new ArcDotIndicator();
      const result1 = indicator.arcDirection(ArcDirection.THREE_CLOCK_DIRECTION);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = indicator.arcDirection(ArcDirection.SIX_CLOCK_DIRECTION);
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = indicator.arcDirection(ArcDirection.NINE_CLOCK_DIRECTION);
      expect(result3 !== null && result3 !== undefined).assertTrue();
      const result4 = indicator.arcDirection(undefined);
      expect(result4 !== null && result4 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcDotIndicator_itemColor_PARAM_0005
     * @tc.name      testArcDotIndicatorItemColorParam0005
     * @tc.desc      Test ArcDotIndicator.itemColor() parameter specification - valid ResourceColor and undefined
     */
    it('testArcDotIndicatorItemColorParam0005', Level.LEVEL0, () => {
      const indicator = new ArcDotIndicator();
      const result1 = indicator.itemColor('#A9FFFFFF');
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = indicator.itemColor(0x00FF00);
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = indicator.itemColor(undefined);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcDotIndicator_selectedItemColor_PARAM_0006
     * @tc.name      testArcDotIndicatorSelectedItemColorParam0006
     * @tc.desc      Test ArcDotIndicator.selectedItemColor() parameter specification - valid ResourceColor and undefined
     */
    it('testArcDotIndicatorSelectedItemColorParam0006', Level.LEVEL0, () => {
      const indicator = new ArcDotIndicator();
      const result1 = indicator.selectedItemColor('#FF5EA1FF');
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = indicator.selectedItemColor(0xFF0000);
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = indicator.selectedItemColor(undefined);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcDotIndicator_backgroundColor_PARAM_0007
     * @tc.name      testArcDotIndicatorBackgroundColorParam0007
     * @tc.desc      Test ArcDotIndicator.backgroundColor() parameter specification - valid ResourceColor and undefined
     */
    it('testArcDotIndicatorBackgroundColorParam0007', Level.LEVEL0, () => {
      const indicator = new ArcDotIndicator();
      const result1 = indicator.backgroundColor('#FF404040');
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = indicator.backgroundColor(0x808080);
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = indicator.backgroundColor(undefined);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ArcDotIndicator_maskColor_PARAM_0008
     * @tc.name      testArcDotIndicatorMaskColorParam0008
     * @tc.desc      Test ArcDotIndicator.maskColor() parameter specification - valid LinearGradient and undefined
     */
    it('testArcDotIndicatorMaskColorParam0008', Level.LEVEL0, () => {
      const indicator = new ArcDotIndicator();
      const gradient: LinearGradient = {
        angle: 90,
        colors: [['#00000000', 0.0], ['#FF000000', 1.0]]
      };
      const result1 = indicator.maskColor(gradient);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = indicator.maskColor(undefined);
      expect(result2 !== null && result2 !== undefined).assertTrue();
    });

    // ===================== ArcDotIndicator chaining return =====================

    /**
     * @tc.number    SUB_ArkUI_ArcDotIndicator_chained_RETURN_0023
     * @tc.name      testArcDotIndicatorChainedReturn0023
     * @tc.desc      Test ArcDotIndicator chained method calls return ArcDotIndicator
     */
    it('testArcDotIndicatorChainedReturn0023', Level.LEVEL0, () => {
      const result = new ArcDotIndicator()
        .arcDirection(ArcDirection.THREE_CLOCK_DIRECTION)
        .itemColor('#FFFFFF')
        .selectedItemColor('#0000FF')
        .backgroundColor('#404040')
        .maskColor({ angle: 90, colors: [['#00000000', 0.0], ['#FF000000', 1.0]] });
      expect(result !== null && result !== undefined).assertTrue();
    });
  });
}
