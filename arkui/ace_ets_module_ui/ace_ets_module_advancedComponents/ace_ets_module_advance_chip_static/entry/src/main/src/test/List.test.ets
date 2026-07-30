'use static';
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

import ChipGroupItemOptionsPage2Test from './ChipGroupTest/ChipGroupItemOptions2Test.test';
import chipGroupIconItemOptionsTest from './ChipGroupTest/ChipGroupIconItemOptionsTest.test';
import ChipGroupItemOptionsTest from './ChipGroupTest/ChipGroupItemOptionsTest.test';
import ChipGroupSymbolItemOptionsTest from './ChipGroupTest/ChipGroupSymbolItemOptionsTest.test';
import chipTest0010 from './ChipTest/ChipTest0010.test';
import chipSizeTest from './ChipTest/chipSizeTest.test';
import prefixIconTest from './ChipTest/prefixIconTest.test';
import ChipApi1 from './ChipTest/ChipApi1.test';
import labelOptionsTest from './ChipTest/labelOptionsTest.test';
import localizedLabelMargin from './ChipTest/localizedLabelMargin.test';
import ChipOptionsLabelTest from './ChipTest/ChipOptionsLabelTest.test';
import ChipOptionsSuffixIconTest from './ChipTest/ChipOptionsSuffixIconTest.test';
import ChipOptionsSuffixSymbolTest from './ChipTest/ChipOptionsSuffixSymbolTest.test';
import ChipOptionsAllowCloseTest from './ChipTest/ChipOptionsAllowCloseTest.test';
import ChipOptionsCloseOptionsTest from './ChipTest/ChipOptionsCloseOptionsTest.test';
import ChipOptionsEnabledTest from './ChipTest/ChipOptionsEnabledTest.test';
import ChipOptionsActivatedBackgroundColorTest from './ChipTest/ChipOptionsActivatedBackgroundColorTest.test';
import ChipOptionsBorderRadiusTest from './ChipTest/ChipOptionsBorderRadiusTest.test';
import ChipOptionsSizeTest from './ChipTest/ChipOptionsSizeTest.test';
import ChipOptionsAccessibilityTest from './ChipTest/ChipOptionsAccessibilityTest.test';
import ChipOptionsMethodTest from './ChipTest/ChipOptionsMethodTest.test';
import ChipOptionsDirectionTest from './ChipTest/ChipOptionsDirectionTest.test';
import ChipOptionsFontScaleTest from './ChipTest/ChipOptionsFontScaleTest.test';
import ChipOptionsPaddingTest from './ChipTest/ChipOptionsPaddingTest.test';
import ChipOptionsFontSizeTest from './ChipTest/ChipOptionsFontSizeTest.test';
import ChipGroupV2ItemOptions2Test from './ChipGroupV2Test/ChipGroupV2ItemOptions2Test.test';
import ChipGroupV2IconItemOptionsTest from './ChipGroupV2Test/ChipGroupV2IconItemOptionsTest.test';
import ChipGroupV2ItemOptionsTest from './ChipGroupV2Test/ChipGroupV2ItemOptionsTest.test';
import ChipGroupV2SymbolItemOptionsTest from './ChipGroupV2Test/ChipGroupV2SymbolItemOptionsTest.test';
import ChipV2Api1 from './ChipV2Test/ChipV2Api1.test';
import ChipV2LabelOptionsTest from './ChipV2Test/ChipV2LabelOptionsTest.test';
import ChipV2LocalizedLabelMargin from './ChipV2Test/ChipV2LocalizedLabelMargin.test';
import ChipV2OptionsAccessibilityTest from './ChipV2Test/ChipV2OptionsAccessibilityTest.test';
import ChipV2OptionsActivatedBackgroundColorTest from './ChipV2Test/ChipV2OptionsActivatedBackgroundColorTest.test';
import ChipV2OptionsAllowCloseTest from './ChipV2Test/ChipV2OptionsAllowCloseTest.test';
import ChipV2OptionsBorderRadiusTest from './ChipV2Test/ChipV2OptionsBorderRadiusTest.test';
import ChipV2OptionsCloseOptionsTest from './ChipV2Test/ChipV2OptionsCloseOptionsTest.test';
import ChipV2OptionsDirectionTest from './ChipV2Test/ChipV2OptionsDirectionTest.test';
import ChipV2OptionsEnabledTest from './ChipV2Test/ChipV2OptionsEnabledTest.test';
import ChipV2OptionsFontScaleTest from './ChipV2Test/ChipV2OptionsFontScaleTest.test';
import ChipV2OptionsFontSizeTest from './ChipV2Test/ChipV2OptionsFontSizeTest.test';
import ChipV2OptionsLabelTest from './ChipV2Test/ChipV2OptionsLabelTest.test';
import ChipV2OptionsMethodTest from './ChipV2Test/ChipV2OptionsMethodTest.test';
import ChipV2OptionsPaddingTest from './ChipV2Test/ChipV2OptionsPaddingTest.test';
import ChipV2OptionsSizeTest from './ChipV2Test/ChipV2OptionsSizeTest.test';
import ChipV2OptionsSuffixIconTest from './ChipV2Test/ChipV2OptionsSuffixIconTest.test';
import ChipV2OptionsSuffixSymbolTest from './ChipV2Test/ChipV2OptionsSuffixSymbolTest.test';
import ChipV2Page from './ChipV2Test/ChipV2Page.test';
import ChipV2PrefixIconTest from './ChipV2Test/ChipV2PrefixIconTest.test';
import ChipGroupSystemMaterialTest from './ChipGroupTest/ChipGroupSystemMaterialTest.test';
import ChipGroupAbnormalSystemMaterialTest from './ChipGroupTest/ChipGroupAbnormalSystemMaterialTest.test';
import ChipOptionsBackgroundSystemMaterialTest from './ChipTest/ChipOptionsBackgroundSystemMaterialTest.test';
import ChipAbnormalBackgroundSystemMaterialTest from './ChipTest/ChipAbnormalBackgroundSystemMaterialTest.test';
import ChipV2SizeTest from './ChipV2Test/ChipV2SizeTest.test';
import ChipV2AbnormalOptionsTest from './ChipV2Test/ChipV2AbnormalOptions.test';
import ChipV2AbnormalLabelTest from './ChipV2Test/ChipV2AbnormalLabelTest.test';
import ChipV2AbnormalPrefixIconTest from './ChipV2Test/ChipV2AbnormalPrefixIconTest.test';
import ChipV2AbnormalSuffixIconTest from './ChipV2Test/ChipV2AbnormalSuffixIconTest.test';
import ChipV2AbnormalCloseIconTest from './ChipV2Test/ChipV2AbnormalCloseIconTest.test';
import ChipV2AbnormalComboTest from './ChipV2Test/ChipV2AbnormalComboTest.test';
import ChipGroupV2AbnormalRootTest from './ChipGroupV2Test/ChipGroupV2AbnormalRoot.test';
import ChipGroupV2AbnormalItemTest from './ChipGroupV2Test/ChipGroupV2AbnormalItemTest.test';
import ChipGroupV2AbnormalItemStyleTest from './ChipGroupV2Test/ChipGroupV2AbnormalItemStyleTest.test';
import ChipGroupV2AbnormalSpacePaddingTest from './ChipGroupV2Test/ChipGroupV2AbnormalSpacePaddingTest.test';
import ChipGroupV2AbnormalSuffixTest from './ChipGroupV2Test/ChipGroupV2AbnormalSuffixTest.test';
import ChipGroupV2AbnormalComboTest from './ChipGroupV2Test/ChipGroupV2AbnormalComboTest.test';

export default function testsuite(): void {
  ChipGroupItemOptionsPage2Test();
  chipGroupIconItemOptionsTest();
  ChipGroupItemOptionsTest();
  ChipGroupSymbolItemOptionsTest();
  chipTest0010();
  chipSizeTest();
  prefixIconTest();
  ChipApi1();
  labelOptionsTest();
  localizedLabelMargin();
  ChipOptionsLabelTest();
  ChipOptionsSuffixIconTest();
  ChipOptionsSuffixSymbolTest();
  ChipOptionsAllowCloseTest();
  ChipOptionsCloseOptionsTest();
  ChipOptionsEnabledTest();
  ChipOptionsActivatedBackgroundColorTest();
  // ChipOptionsBorderRadiusTest();
  ChipOptionsSizeTest();
  ChipOptionsAccessibilityTest();
  ChipOptionsMethodTest();
  ChipOptionsDirectionTest();
  ChipOptionsFontScaleTest();
  ChipOptionsPaddingTest();
  // ChipOptionsFontSizeTest();
  ChipGroupV2ItemOptions2Test();
  ChipGroupV2IconItemOptionsTest();
  ChipGroupV2ItemOptionsTest();
  ChipGroupV2SymbolItemOptionsTest();
  ChipV2Api1();
  ChipV2LabelOptionsTest();
  ChipV2LocalizedLabelMargin();
  ChipV2OptionsAccessibilityTest();
  ChipV2OptionsActivatedBackgroundColorTest();
  ChipV2OptionsAllowCloseTest();
  ChipV2OptionsBorderRadiusTest();
  ChipV2OptionsCloseOptionsTest();
  ChipV2OptionsDirectionTest();
  ChipV2OptionsEnabledTest();
  ChipV2OptionsFontScaleTest();
  ChipV2OptionsFontSizeTest();
  ChipV2OptionsLabelTest();
  ChipV2OptionsMethodTest();
  ChipV2OptionsPaddingTest();
  ChipV2OptionsSizeTest();
  ChipV2OptionsSuffixIconTest();
  ChipV2OptionsSuffixSymbolTest();
  ChipV2Page();
  ChipV2PrefixIconTest();
  ChipV2SizeTest();
  ChipGroupSystemMaterialTest();
  ChipGroupAbnormalSystemMaterialTest();
  ChipOptionsBackgroundSystemMaterialTest();
  ChipAbnormalBackgroundSystemMaterialTest();
  ChipV2AbnormalOptionsTest();
  ChipV2AbnormalLabelTest();
  ChipV2AbnormalPrefixIconTest();
  ChipV2AbnormalSuffixIconTest();
  ChipV2AbnormalCloseIconTest();
  ChipV2AbnormalComboTest();
  ChipGroupV2AbnormalRootTest();
  ChipGroupV2AbnormalItemTest();
  ChipGroupV2AbnormalItemStyleTest();
  ChipGroupV2AbnormalSpacePaddingTest();
  ChipGroupV2AbnormalSuffixTest();
  ChipGroupV2AbnormalComboTest();
}
