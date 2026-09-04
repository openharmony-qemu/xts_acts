/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level } from '@ohos/hypium'
import { AlphabetIndexerModifier, NavDestinationModifier, NavigationModifier,
  NavigatorModifier, NavRouterModifier, SideBarContainerModifier,
  StepperItemModifier, SwiperModifier, TabsModifier } from '@ohos.arkui.modifier'
import { ToolBarModifier } from '@ohos.arkui.advanced.ToolBar'
import { LengthMetrics } from '@kit.ArkUI'

export default function ModifierSupplement() {
  describe('ModifierSupplementTest', () => {

    /**
     * @tc.number SUB_ArkUI_Modifier_AlphabetIndexerModifier_constructor_0100
     * @tc.name AlphabetIndexerModifier_constructor
     * @tc.desc Test AlphabetIndexerModifier constructor and applyNormalAttribute
     */
    it('AlphabetIndexerModifier_constructor', Level.LEVEL0, () => {
      const modifier = new AlphabetIndexerModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_NavDestinationModifier_constructor_0100
     * @tc.name NavDestinationModifier_constructor
     * @tc.desc Test NavDestinationModifier constructor and applyNormalAttribute
     */
    it('NavDestinationModifier_constructor', Level.LEVEL0, () => {
      const modifier = new NavDestinationModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_NavigationModifier_constructor_0100
     * @tc.name NavigationModifier_constructor
     * @tc.desc Test NavigationModifier constructor and applyNormalAttribute
     */
    it('NavigationModifier_constructor', Level.LEVEL0, () => {
      const modifier = new NavigationModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_NavigatorModifier_constructor_0100
     * @tc.name NavigatorModifier_constructor
     * @tc.desc Test NavigatorModifier constructor and applyNormalAttribute
     */
    it('NavigatorModifier_constructor', Level.LEVEL0, () => {
      const modifier = new NavigatorModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_NavRouterModifier_constructor_0100
     * @tc.name NavRouterModifier_constructor
     * @tc.desc Test NavRouterModifier constructor and applyNormalAttribute
     */
    it('NavRouterModifier_constructor', Level.LEVEL0, () => {
      const modifier = new NavRouterModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_SideBarContainerModifier_constructor_0100
     * @tc.name SideBarContainerModifier_constructor
     * @tc.desc Test SideBarContainerModifier constructor and applyNormalAttribute
     */
    it('SideBarContainerModifier_constructor', Level.LEVEL0, () => {
      const modifier = new SideBarContainerModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_StepperItemModifier_constructor_0100
     * @tc.name StepperItemModifier_constructor
     * @tc.desc Test StepperItemModifier constructor and applyNormalAttribute
     */
    it('StepperItemModifier_constructor', Level.LEVEL0, () => {
      const modifier = new StepperItemModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_SwiperModifier_constructor_0100
     * @tc.name SwiperModifier_constructor
     * @tc.desc Test SwiperModifier constructor and applyNormalAttribute
     */
    it('SwiperModifier_constructor', Level.LEVEL0, () => {
      const modifier = new SwiperModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_TabsModifier_constructor_0100
     * @tc.name TabsModifier_constructor
     * @tc.desc Test TabsModifier constructor and applyNormalAttribute
     */
    it('TabsModifier_constructor', Level.LEVEL0, () => {
      const modifier = new TabsModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
      expect(typeof modifier.applyNormalAttribute === 'function').assertTrue();
    })

    // ===================== ToolBarModifier tests =====================

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_constructor_0100
     * @tc.name ToolBarModifier_constructor
     * @tc.desc Test ToolBarModifier constructor
     */
    it('ToolBarModifier_constructor', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      expect(modifier !== null && modifier !== undefined).assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_stateEffect_0100
     * @tc.name ToolBarModifier_stateEffect_true
     * @tc.desc Test ToolBarModifier.stateEffect method with true
     */
    it('ToolBarModifier_stateEffect_true', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result = modifier.stateEffect(true);
      expect(result !== null && result !== undefined).assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_stateEffect_0200
     * @tc.name ToolBarModifier_stateEffect_false
     * @tc.desc Test ToolBarModifier.stateEffect method with false
     */
    it('ToolBarModifier_stateEffect_false', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result = modifier.stateEffect(false);
      expect(result !== null && result !== undefined).assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_height_0100
     * @tc.name ToolBarModifier_height
     * @tc.desc Test ToolBarModifier.height method with LengthMetrics
     */
    it('ToolBarModifier_height', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result = modifier.height(LengthMetrics.vp(56));
      expect(result !== null && result !== undefined).assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_backgroundColor_0100
     * @tc.name ToolBarModifier_backgroundColor
     * @tc.desc Test ToolBarModifier.backgroundColor method
     */
    it('ToolBarModifier_backgroundColor', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result = modifier.backgroundColor(Color.White);
      expect(result !== null && result !== undefined).assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_padding_0100
     * @tc.name ToolBarModifier_padding
     * @tc.desc Test ToolBarModifier.padding method with LengthMetrics
     */
    it('ToolBarModifier_padding', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result = modifier.padding(LengthMetrics.vp(24));
      expect(result !== null && result !== undefined).assertTrue();
    })

    /**
     * @tc.number SUB_ArkUI_Modifier_ToolBarModifier_chaining_0100
     * @tc.name ToolBarModifier_chaining
     * @tc.desc Test ToolBarModifier chaining all methods
     */
    it('ToolBarModifier_chaining', Level.LEVEL0, () => {
      const modifier = new ToolBarModifier();
      const result = modifier
        .height(LengthMetrics.vp(56))
        .backgroundColor(Color.White)
        .padding(LengthMetrics.vp(24))
        .stateEffect(true);
      expect(result !== null && result !== undefined).assertTrue();
    })

  })
}
