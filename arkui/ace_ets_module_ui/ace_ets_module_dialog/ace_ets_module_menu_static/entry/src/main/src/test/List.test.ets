'use static';
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
import onDidAppearTest from './BindMenuTest/onDidAppearTest.test'
import onDidDisappearTest from './BindMenuTest/onDidDisappearTest.test'
import onWillAppearTest from './BindMenuTest/onWillAppearTest.test'
import onWillDisappearTest from './BindMenuTest/onWillDisappearTest.test'
import maskTest from './BindMenuTest/maskTest.test'
import maskColorTest from './BindMenuTest/maskColorTest.test'
import maskBackgroundBlurStyleTest from './BindMenuTest/maskBackgroundBlurStyleTest.test'
import onDidAppearOpenTest from './OpenMenuTest/onDidAppearOpenTest.test'
import onDidDisappearOpenTest from './OpenMenuTest/onDidDisappearOpenTest.test'
import onWillAppearOpenTest from './OpenMenuTest/onWillAppearOpenTest.test'
import onWillDisappearOpenTest from './OpenMenuTest/onWillDisappearOpenTest.test'
import updateMenuTest from './UpdateMenuTest/updateMenuTest.test'
import bindContextMenuTest from './BindContextMenuTest/bindContextMenuTest.test'
import ContextMenuOptionsTest from './BindContextMenuTest/ContextMenuOptions.test'
import PromptActionTest from './PromptActionTest/PromptAction.test'
import HoverScaleInterruptionTest from './CommonTest/HoverScaleInterruption.test'
import MenuKeyboardAvoidModeTest from './CommonTest/MenuKeyboardAvoidMode.test'
import MenuTest from './menuExpandSymbol/Menu.test'
import GetStateTest from './PromptActionTest/GetState.test'
import SheetTest from './SheetTest/Sheet.test'
import scrollBarTest from './scrollBarTest/scrollBarTest.test';
import maxHeightTest from './maxHeightTest/maxHeightTest.test';
import targetSpaceTest from './targetSpaceTest/targetSpaceTest.test';
import ContextMenuMaxHeightTest from './BindContextMenuTest/ContextMenuMaxHeightTest.test'
import GridStyleTest from './GridStyleTest/GridStyleTest.test'
import BindMenuWithResponseTest from './BindContextMenuTest/BindMenuWithResponse.test'
import BindContextMenuResponseTypeTest from './BindContextMenuTest/BindContextMenuResponseType.test'
import SubMenuBuilderTest from './OpenMenuTest/SubMenuBuilderTest.test'
import BindContextMenuByIsShowOptionsTest from './BindContextMenuByIsShowTest/BindContextMenuByIsShowOptions.test'
import BindContextMenuByIsShowBlurMaskBgTest from './BindContextMenuByIsShowTest/BindContextMenuByIsShowBlurMaskBg.test'
import BindContextMenuByIsShowBlurMaskMaskTest from './BindContextMenuByIsShowTest/BindContextMenuByIsShowBlurMaskMask.test'
import BindContextMenuByIsShowBlurMaskTest from './BindContextMenuByIsShowTest/BindContextMenuByIsShowBlurMask.test'
import BindContextMenuByIsShowNullUndefinedTest from './BindContextMenuByIsShowTest/BindContextMenuByIsShowNullUndefined.test'

export default function testsuite(): void {
  maskTest();
  maskColorTest();
  maskBackgroundBlurStyleTest();
  onDidAppearTest();
  onDidDisappearTest();
  onWillAppearTest();
  onWillDisappearTest();
  onDidAppearOpenTest();
  onDidDisappearOpenTest();
  onWillAppearOpenTest();
  onWillDisappearOpenTest();
  updateMenuTest();
  bindContextMenuTest();
  ContextMenuOptionsTest();
  PromptActionTest();
  HoverScaleInterruptionTest();
  MenuKeyboardAvoidModeTest();
  MenuTest();
  GetStateTest();
  SheetTest();
  scrollBarTest();
  maxHeightTest();
  targetSpaceTest();
  ContextMenuMaxHeightTest();
  GridStyleTest();
  BindMenuWithResponseTest();
  BindContextMenuResponseTypeTest();
  SubMenuBuilderTest();
  BindContextMenuByIsShowOptionsTest();
  BindContextMenuByIsShowBlurMaskBgTest();
  BindContextMenuByIsShowBlurMaskMaskTest();
  BindContextMenuByIsShowBlurMaskTest();
  BindContextMenuByIsShowNullUndefinedTest();
}