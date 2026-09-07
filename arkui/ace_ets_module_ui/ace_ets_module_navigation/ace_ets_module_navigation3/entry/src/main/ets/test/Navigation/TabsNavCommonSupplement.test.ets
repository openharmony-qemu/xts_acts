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
import { ToolBarModifier, ItemState } from '@ohos.arkui.advanced.ToolBar';

export default function TabsNavCommonSupplement() {
  describe('TabsNavCommonSupplement', () => {

    // ===================== Enum values =====================

    /**
     * @tc.number    SUB_ArkUI_ItemState_enum_0001
     * @tc.name      testItemStateEnumValues0001
     * @tc.desc      Test ItemState enum values ENABLE, DISABLE, ACTIVATE are defined
     */
    it('testItemStateEnumValues0001', Level.LEVEL0, () => {
      expect(ItemState.ENABLE !== undefined).assertTrue();
      expect(ItemState.DISABLE !== undefined).assertTrue();
      expect(ItemState.ACTIVATE !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_SwiperDisplayMode_enum_0002
     * @tc.name      testSwiperDisplayModeEnumValues0002
     * @tc.desc      Test SwiperDisplayMode enum values STRETCH and AUTO_LINEAR are defined
     */
    it('testSwiperDisplayModeEnumValues0002', Level.LEVEL0, () => {
      expect(SwiperDisplayMode.STRETCH !== undefined).assertTrue();
      expect(SwiperDisplayMode.AUTO_LINEAR !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_NavigationType_enum_0003
     * @tc.name      testNavigationTypeEnumValues0003
     * @tc.desc      Test NavigationType enum values Push, Replace, Back are defined
     */
    it('testNavigationTypeEnumValues0003', Level.LEVEL0, () => {
      expect(NavigationType.Push !== undefined).assertTrue();
      expect(NavigationType.Replace !== undefined).assertTrue();
      expect(NavigationType.Back !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_IndexerAlign_enum_0004
     * @tc.name      testIndexerAlignEnumValues0004
     * @tc.desc      Test IndexerAlign enum values Left and Right are defined
     */
    it('testIndexerAlignEnumValues0004', Level.LEVEL0, () => {
      expect(IndexerAlign.Left !== undefined).assertTrue();
      expect(IndexerAlign.Right !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_NavDestinationMode_enum_0005
     * @tc.name      testNavDestinationModeEnumValues0005
     * @tc.desc      Test NavDestinationMode enum values STANDARD and DIALOG are defined
     */
    it('testNavDestinationModeEnumValues0005', Level.LEVEL0, () => {
      expect(NavDestinationMode.STANDARD !== undefined).assertTrue();
      expect(NavDestinationMode.DIALOG !== undefined).assertTrue();
    });

    // ===================== SwiperController =====================

    /**
     * @tc.number    SUB_ArkUI_SwiperController_constructor_0006
     * @tc.name      testSwiperControllerConstructor0006
     * @tc.desc      Test SwiperController constructor creates non-null instance
     */
    it('testSwiperControllerConstructor0006', Level.LEVEL0, () => {
      const controller = new SwiperController();
      expect(controller !== null && controller !== undefined).assertTrue();
    });

    // ===================== Indicator.dot() =====================

    /**
     * @tc.number    SUB_ArkUI_Indicator_dot_0007
     * @tc.name      testIndicatorDot0007
     * @tc.desc      Test Indicator.dot() returns non-null DotIndicator
     */
    it('testIndicatorDot0007', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      expect(dot !== null && dot !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_DotIndicator_left_0008
     * @tc.name      testDotIndicatorLeft0008
     * @tc.desc      Test DotIndicator.left() parameter specification - number, string, zero
     */
    it('testDotIndicatorLeft0008', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.left(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.left('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.left(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_DotIndicator_top_0009
     * @tc.name      testDotIndicatorTop0009
     * @tc.desc      Test DotIndicator.top() parameter specification - number, string, zero
     */
    it('testDotIndicatorTop0009', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.top(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.top('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.top(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_DotIndicator_right_0010
     * @tc.name      testDotIndicatorRight0010
     * @tc.desc      Test DotIndicator.right() parameter specification - number, string, zero
     */
    it('testDotIndicatorRight0010', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.right(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.right('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.right(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_DotIndicator_bottom_0011
     * @tc.name      testDotIndicatorBottom0011
     * @tc.desc      Test DotIndicator.bottom() parameter specification - number, string, zero
     */
    it('testDotIndicatorBottom0011', Level.LEVEL0, () => {
      const dot = Indicator.dot();
      const result1 = dot.bottom(10);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = dot.bottom('20vp');
      expect(result2 !== null && result2 !== undefined).assertTrue();
      const result3 = dot.bottom(0);
      expect(result3 !== null && result3 !== undefined).assertTrue();
    });

    // ===================== IndicatorComponentController =====================

    /**
     * @tc.number    SUB_ArkUI_IndicatorComponentController_constructor_0012
     * @tc.name      testIndicatorComponentControllerConstructor0012
     * @tc.desc      Test IndicatorComponentController constructor creates non-null instance
     */
    it('testIndicatorComponentControllerConstructor0012', Level.LEVEL0, () => {
      const controller = new IndicatorComponentController();
      expect(controller !== null && controller !== undefined).assertTrue();
    });

    // ===================== ToolBarModifier =====================

    /**
     * @tc.number    SUB_ArkUI_ToolBarModifier_constructor_0013
     * @tc.name      testToolBarModifierConstructor0013
     * @tc.desc      Test ToolBarModifier constructor creates non-null instance
     */
    it('testToolBarModifierConstructor0013', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ToolBarModifier_stateEffect_0014
     * @tc.name      testToolBarModifierStateEffect0014
     * @tc.desc      Test ToolBarModifier.stateEffect() parameter specification - true, false
     */
    it('testToolBarModifierStateEffect0014', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result1 = modifier.stateEffect(true);
      expect(result1 !== null && result1 !== undefined).assertTrue();
      const result2 = modifier.stateEffect(false);
      expect(result2 !== null && result2 !== undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ArkUI_ToolBarModifier_chained_0015
     * @tc.name      testToolBarModifierChained0015
     * @tc.desc      Test ToolBarModifier chained method calls
     */
    it('testToolBarModifierChained0015', Level.LEVEL0, () => {
      const result = new ToolBarModifier()
        .stateEffect(true);
      expect(result !== null && result !== undefined).assertTrue();
    });
  });
}
