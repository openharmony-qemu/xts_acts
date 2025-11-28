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

import ActionSheet1 from './ActionSheetTest/ActionSheet1.test.ets';
import ActionSheet2 from './ActionSheetTest/ActionSheet2.test.ets';
import ActionSheet3 from './ActionSheetTest/ActionSheet3.test.ets';
import AlertDialog1 from './AlertDialogTest/AlertDialog1.test.ets';
import AlertDialog2 from './AlertDialogTest/AlertDialog2.test.ets';
import AlertDialog3 from './AlertDialogTest/AlertDialog3.test.ets';
import openCustomDialog1 from './openCustomDialogTest/openCustomDialog1.test.ets';
import openCustomDialog2 from './openCustomDialogTest/openCustomDialog2.test.ets';
import openCustomDialog3 from './openCustomDialogTest/openCustomDialog3.test.ets';
import closeCustomDialog from './promptActionTest/closeCustomDialog.test';
import openCustomDialog from './promptActionTest/openCustomDialog.test';
import updateCustomDialog from './promptActionTest/updateCustomDialog.test';
import onHeightDidChange from './OnHeightDidChanges.test';
import IconApiTest from './MenuTest/MenuApiTest/IconApiTest.test';
import SubMenuExpandingModeTest_SIDE from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test';
import SubMenuExpandingModeTest_EMBEDDED from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test';
import closeBindSheetTest from './UIContextTest/closeBindSheetTest.test'
import openBindSheetTest from './UIContextTest/openBindSheetTest.test'
import updateBindSheetTest from './UIContextTest/updateBindSheetTest.test'
import uiCloseCustomDialogTest from './UIContextTest/uiCloseCustomDialogTest.test'
import uiOpenCustomDialogTest from './UIContextTest/uiOpenCustomDialogTest.test'
import uiUpdateCustomDialogTest from './UIContextTest/uiUpdateCustomDialogTest.test'
import subMenuExpandingModeTest_STACK_EXPAND from './MenuTest/MenuApiTest/subMenuExpandingModeTest_STACK_EXPAND.test';
import showToastTest from './promptActionTest/showToast.test';
import arrowOffset from './popup/arrowOffset.test';
import showDialogTest from './promptActionTest/showDialogTest.test';
import CustomDialogTest from './CustomDialogTest/KeyboardAvoidMode/CustomDialogTest.test';
import BaseDialogTest from './CustomDialogTest/KeyboardAvoidMode/BaseDialogTest.test';
import UpdateCustomDialogTest from './CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets';
import MenuApi1 from './Menu/MenuApi1.test';
import buttonMaxFontSize from './button/buttonMaxFontSize.test';
import sheetBorderWidth from './bindSheet/sheetBorderWidth.test';
import CustomDialogBorderColor from './CustomDialogTest/CustomDialogBorderColor.test';
import dialogButtonStyle from './Dialog/dialogButtonStyle.test';
import dialogTransitionTest from './CustomDialogTest/dialogTransitionTest.test';

export default function testsuite() {
  buttonMaxFontSize()
  sheetBorderWidth()
  CustomDialogBorderColor()
  dialogButtonStyle()
  MenuApi1();
  dialogTransitionTest()
  UpdateCustomDialogTest();
  BaseDialogTest();
  CustomDialogTest();
  arrowOffset();
  closeCustomDialog();
  showDialogTest()
  ActionSheet1();
  ActionSheet2();
  ActionSheet3();
  AlertDialog1();
  AlertDialog2();
  AlertDialog3();
  openCustomDialog1();
  openCustomDialog2();
  openCustomDialog3();
  onHeightDidChange();
  openCustomDialog();
  updateCustomDialog();
  IconApiTest();
  SubMenuExpandingModeTest_SIDE();
  SubMenuExpandingModeTest_EMBEDDED();
  closeBindSheetTest();
  openBindSheetTest();
  updateBindSheetTest();
  uiCloseCustomDialogTest();
  uiOpenCustomDialogTest();
  uiUpdateCustomDialogTest();
  subMenuExpandingModeTest_STACK_EXPAND();
  showToastTest();
}
