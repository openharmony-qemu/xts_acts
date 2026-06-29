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


import chipDirectionTest from './chip/chipDirection.test';
import ChipAction from './chip/ChipAction.test';
import ChipOnClose from './chip/ChipOnClose.test';
import ChipAction2 from './chip/ChipAction2.test';
import ChipOnClose2 from './chip/ChipOnClose2.test';
import ChipOnClick from './chip/ChipOnClick.test.ets'
import ChipTest0010 from './chip/ChipTest0010.test'; 
import accessibilitySelectedTypeTest from './chip/accessibilitySelectedTypeTest.test';
import ChipApi1 from './chip/ChipApi1.test'
import ChipGroupApi1 from './ChipGroupTest/ChipGroupApi1.test'
import ChipCloseOptions from './chip/ChipCloseOptions.test'
import ChipFontScale from './chip/ChipFontScale.test'
import ChipFontSize from './chip/ChipFontSize.test'
import ChipPadding from './chip/ChipPadding.test'
import ChipBackgroundSystemMaterialTest from './chip/ChipBackgroundSystemMaterialTest.test'
import startSpaceTest from './ChipGroupTest/startSpaceTest.test'
import endSpaceTest from './ChipGroupTest/endSpaceTest.test'
import itemSpaceTest from './ChipGroupTest/itemSpaceTest.test'
import localizedLabelMarginTest from './chip/localizedLabelMarginTest';
import ChipGroupIconItemOptionsTest from './ChipGroupTest/ChipGroupIconItemOptionsTest.test';
import ChipGroupSystemMaterialTest from './ChipGroupTest/ChipGroupSystemMaterialTest.test';
import ChipGroupSystemMaterialTest2 from './ChipGroupTest/ChipGroupSystemMaterialTest2.test';
import ChipGroupSymbolItemOptionsTest from './ChipGroupTest/ChipGroupSymbolItemOptionsTest.test';
import accessibilitySelectedTypeTestV2 from './chipV2/accessibilitySelectedTypeTestV2.test';
import ChipV2Action from './chipV2/ChipV2Action.test';
import ChipV2Action2 from './chipV2/ChipV2Action2.test';
import ChipV2Api1 from './chipV2/ChipV2Api1.test';
import ChipV2BackgroundSystemMaterialTest from './chipV2/ChipV2BackgroundSystemMaterialTest.test';
import ChipV2CloseOptions from './chipV2/ChipV2CloseOptions.test';
import chipV2DirectionTest from './chipV2/chipV2Direction.test';
import ChipV2FontScale from './chipV2/ChipV2FontScale.test';
import ChipV2FontSize from './chipV2/ChipV2FontSize.test';
import ChipV2OnClick from './chipV2/ChipV2OnClick.test';
import ChipV2OnClose from './chipV2/ChipV2OnClose.test';
import ChipV2OnClose2 from './chipV2/ChipV2OnClose2.test';
import ChipV2Padding from './chipV2/ChipV2Padding.test';
import ChipV2Page from './chipV2/ChipV2Page.test';
import ChipV2localizedLabelMargin from './chipV2/ChipV2localizedLabelMargin.test';
import ChipGroupV2EndSpaceTest from './ChipGroupV2Test/ChipGroupV2EndSpaceTest.test';
import ChipGroupV2IconItemOptionsTest from './ChipGroupV2Test/ChipGroupV2IconItemOptionsTest.test';
import ChipGroupV2ItemSpaceTest from './ChipGroupV2Test/ChipGroupV2ItemSpaceTest.test';
import ChipGroupV2StartSpaceTest from './ChipGroupV2Test/ChipGroupV2StartSpaceTest.test';
import ChipGroupV2SymbolItemOptionsTest from './ChipGroupV2Test/ChipGroupV2SymbolItemOptionsTest.test';
import ChipGroupV2IconItemOptions2Test from './ChipGroupV2Test/ChipGroupV2IconItemOptions2Test.test';
import ChipV2AbnormalOptionsTest from './chipV2/ChipV2AbnormalOptions.test';
import ChipGroupV2AbnormalRootTest from './ChipGroupV2Test/ChipGroupV2AbnormalRoot.test';
import ChipV2AbnormalLabelTest from './chipV2/ChipV2AbnormalLabelTest.test';
import ChipV2AbnormalPrefixIconTest from './chipV2/ChipV2AbnormalPrefixIconTest.test';
import ChipV2AbnormalSuffixIconTest from './chipV2/ChipV2AbnormalSuffixIconTest.test';
import ChipV2AbnormalCloseIconTest from './chipV2/ChipV2AbnormalCloseIconTest.test';
import ChipGroupV2AbnormalItemTest from './ChipGroupV2Test/ChipGroupV2AbnormalItemTest.test';
import ChipGroupV2AbnormalItemStyleTest from './ChipGroupV2Test/ChipGroupV2AbnormalItemStyleTest.test';
import ChipGroupV2AbnormalSpacePaddingTest from './ChipGroupV2Test/ChipGroupV2AbnormalSpacePaddingTest.test';
import ChipGroupV2AbnormalSuffixTest from './ChipGroupV2Test/ChipGroupV2AbnormalSuffixTest.test';
import ChipV2AbnormalComboTest from './chipV2/ChipV2AbnormalComboTest.test';
import ChipGroupV2AbnormalComboTest from './ChipGroupV2Test/ChipGroupV2AbnormalComboTest.test';
export default function testsuite() {
  chipDirectionTest();
  ChipAction();
  ChipOnClose();
  ChipAction2();
  ChipOnClose2();
  ChipOnClick();
  ChipTest0010();
  accessibilitySelectedTypeTest();
  ChipApi1();
  startSpaceTest();
  endSpaceTest();
  itemSpaceTest();
  localizedLabelMarginTest();
  ChipGroupIconItemOptionsTest();
  ChipGroupSymbolItemOptionsTest();
  ChipPadding();
  ChipFontSize();
  ChipFontScale();
  ChipCloseOptions();
  ChipGroupSystemMaterialTest();
  ChipGroupSystemMaterialTest2();
  ChipBackgroundSystemMaterialTest();
  accessibilitySelectedTypeTestV2();
  ChipV2Action();
  ChipV2Action2();
  ChipV2Api1();
  ChipV2BackgroundSystemMaterialTest();
  ChipV2CloseOptions();
  chipV2DirectionTest();
  ChipV2FontScale();
  ChipV2FontSize();
  ChipV2OnClick();
  ChipV2OnClose();
  ChipV2OnClose2();
  ChipV2Padding();
  ChipV2Page();
  ChipV2localizedLabelMargin();
  ChipGroupV2EndSpaceTest();
  ChipGroupV2IconItemOptionsTest();
  ChipGroupV2ItemSpaceTest();
  ChipGroupV2StartSpaceTest();
  ChipGroupV2SymbolItemOptionsTest();
  ChipGroupV2IconItemOptions2Test();
  ChipV2AbnormalOptionsTest();
  ChipGroupV2AbnormalRootTest();
  ChipV2AbnormalLabelTest();
  ChipV2AbnormalPrefixIconTest();
  ChipV2AbnormalSuffixIconTest();
  ChipV2AbnormalCloseIconTest();
  ChipGroupV2AbnormalItemTest();
  ChipGroupV2AbnormalItemStyleTest();
  ChipGroupV2AbnormalSpacePaddingTest();
  ChipGroupV2AbnormalSuffixTest();
  ChipV2AbnormalComboTest();
  ChipGroupV2AbnormalComboTest();
}