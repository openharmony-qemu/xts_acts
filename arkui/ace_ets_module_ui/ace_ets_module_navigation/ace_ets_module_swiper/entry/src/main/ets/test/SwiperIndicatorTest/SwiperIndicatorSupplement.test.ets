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
import { LengthMetrics } from '@ohos.arkui.node';

export default function SwiperIndicatorSupplementTest() {
  describe('SwiperIndicatorSupplementTest', () => {

    // ===================== Indicator.left =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_left_PARAM_0001
     * @tc.name      testIndicatorLeftParam0001
     * @tc.desc      Test Indicator.left() parameter specification - number, string, zero
     */
    it('testIndicatorLeftParam0001', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.left(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.left('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.left(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    // ===================== Indicator.top =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_top_PARAM_0002
     * @tc.name      testIndicatorTopParam0002
     * @tc.desc      Test Indicator.top() parameter specification - number, string, zero
     */
    it('testIndicatorTopParam0002', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.top(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.top('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.top(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    // ===================== Indicator.right =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_right_PARAM_0003
     * @tc.name      testIndicatorRightParam0003
     * @tc.desc      Test Indicator.right() parameter specification - number, string, zero
     */
    it('testIndicatorRightParam0003', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.right(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.right('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.right(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    // ===================== Indicator.bottom (single param) =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_bottom_PARAM_0004
     * @tc.name      testIndicatorBottomParam0004
     * @tc.desc      Test Indicator.bottom() single parameter specification - number, string, zero
     */
    it('testIndicatorBottomParam0004', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.bottom(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.bottom('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.bottom(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    // ===================== Indicator.bottom (two params) =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_bottom_PARAM_0005
     * @tc.name      testIndicatorBottomTwoParam0005
     * @tc.desc      Test Indicator.bottom() two parameter specification - LengthMetrics + ignoreSize
     */
    it('testIndicatorBottomTwoParam0005', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.bottom(10, true);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.bottom(10, false);
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.bottom(LengthMetrics.vp(20), true);
      expect(result3 !== null && result3 !== undefined).assertTrue();
      const result4 = dot.bottom(LengthMetrics.vp(20), false);
      expect(result4 !== null && result4 !== undefined).assertTrue();
    });

    // ===================== Indicator.start =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_start_PARAM_0006
     * @tc.name      testIndicatorStartParam0006
     * @tc.desc      Test Indicator.start() parameter specification - LengthMetrics
     */
    it('testIndicatorStartParam0006', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.start(LengthMetrics.vp(10));
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.start(LengthMetrics.vp(0));
      expect(result2 !== null && result2 !== undefined).assertTrue();
    });

    // ===================== Indicator.end =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_end_PARAM_0007
     * @tc.name      testIndicatorEndParam0007
     * @tc.desc      Test Indicator.end() parameter specification - LengthMetrics
     */
    it('testIndicatorEndParam0007', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.end(LengthMetrics.vp(10));
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.end(LengthMetrics.vp(0));
      expect(result2 !== null && result2 !== undefined).assertTrue();
    });

    // ===================== DotIndicator.mask =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_mask_PARAM_0008
     * @tc.name      testDotIndicatorMaskParam0008
     * @tc.desc      Test DotIndicator.mask() parameter specification - true, false
     */
    it('testDotIndicatorMaskParam0008', Level.LEVEL0, () => {
      const dot = new DotIndicator();
      const result1 = dot.mask(true);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.mask(false);
      expect(result2 !== null && result2 !== undefined).assertTrue();
    });

    // ===================== DotIndicator.maxDisplayCount =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_maxDisplayCount_PARAM_0009
     * @tc.name      testDotIndicatorMaxDisplayCountParam0009
     * @tc.desc      Test DotIndicator.maxDisplayCount() parameter specification - valid, boundary, negative, zero
     */
    it('testDotIndicatorMaxDisplayCountParam0009', Level.LEVEL0, () => {
      const dot = new DotIndicator();
      const result1 = dot.maxDisplayCount(6);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.maxDisplayCount(9);
      expect(result2 !== null && result1 !== undefined).assertTrue();
      const result3 = dot.maxDisplayCount(7);
      expect(result3 !== null && result3 !== undefined).assertTrue();
      const result4 = dot.maxDisplayCount(-1);
      expect(result4 !== null && result4 !== undefined).assertTrue();
      const result5 = dot.maxDisplayCount(0);
      expect(result5 !== null && result5 !== undefined).assertTrue();
    });

    // ===================== Indicator.dot() and Indicator.digit() =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_dot_RETURN_0024
     * @tc.name      testIndicatorDotReturn0024
     * @tc.desc      Test Indicator.dot() returns DotIndicator enabling chained calls
     */
    it('testIndicatorDotReturn0024', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      expect(dot !== null && dot !== undefined).assertTrue();
      const result = dot.itemWidth(6).itemHeight(6).selectedItemWidth(6).selectedItemHeight(6)
        .mask(true).color('#1A182431').selectedColor('#007DFF')
        .left(10).top(5).right(10).bottom(5);
      expect(result !== null && result !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_Indicator_digit_RETURN_0025
     * @tc.name      testIndicatorDigitReturn0025
     * @tc.desc      Test Indicator.digit() returns DigitIndicator enabling chained calls
     */
    it('testIndicatorDigitReturn0025', Level.LEVEL0, () => {
      const digit = Indicator.digit();
      expect(digit !== null && digit !== undefined).assertTrue();
      const result = digit.fontColor('#ff182431').selectedFontColor('#ff182431')
        .left(10).top(5).right(10).bottom(5);
      expect(result !== null && result !== undefined).assertTrue();
    });

    // ===================== DotIndicator chaining with Indicator methods =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_chained_RETURN_0026
     * @tc.name      testDotIndicatorFullChainedReturn0026
     * @tc.desc      Test DotIndicator full chained calls with Indicator inherited methods
     */
    it('testDotIndicatorFullChainedReturn0026', Level.LEVEL0, () => {
      const result = new DotIndicator()
        .itemWidth(6)
        .itemHeight(6)
        .selectedItemWidth(10)
        .selectedItemHeight(6)
        .mask(false)
        .color('#1A182431')
        .selectedColor('#007DFF')
        .maxDisplayCount(6)
        .left(10)
        .top(5)
        .start(LengthMetrics.vp(10))
        .end(LengthMetrics.vp(10));
      expect(result !== null && result !== undefined).assertTrue();
    });
  });
}
