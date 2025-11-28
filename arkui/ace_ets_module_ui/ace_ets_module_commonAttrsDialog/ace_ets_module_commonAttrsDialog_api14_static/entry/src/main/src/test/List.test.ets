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
import actionSheetHoverMode from './ActiveSheet/actionSheetHoverMode.test';

import alertDialogHoverMode from './AlertDialog/alertDialogHoverMode.test';

import bindSheetHoverMode from './bindSheetTest/bindSheetHoverMode.test';
import bindSheetShowClose from './bindSheetTest/bindSheetShowClose.test';
import bindSheetType from './bindSheetTest/bindSheetType.test';

import customDialogHoverMode from './CustomDialog/customDialogHoverMode.test';

import popoverDialogTest from './dialog/popoverDialogTest.test';
import followTransformOfTargetCustomPopup from './PopupTest/followTransformOfTargetCustomPopup.test';
import followTransformOfTargetPopup from './PopupTest/followTransformOfTargetPopup.test';
import showDialogHoverMode from './promptActionTest/showDialogHoverMode.test';
import showToastHoverMode from './promptActionTest/showToastHoverMode.test';
import activeTest from './UIContext/FocusController/activeTest.test';

export default function testsuite() {
   actionSheetHoverMode();
   alertDialogHoverMode();
   bindSheetHoverMode();
   bindSheetShowClose();//std.core.ClassCastError
   bindSheetType();
   customDialogHoverMode();
   popoverDialogTest();// at std.core.NullPointerError
   followTransformOfTargetCustomPopup();// at std.core.NullPointerError
   followTransformOfTargetPopup();
   showDialogHoverMode();
   showToastHoverMode();//11.20SDK  showToastHoverMode_static_0200, expect enableHoverMode false equals enableHoverMode true
   activeTest();//11.20SDK failed:2 expect enableHoverMode false equals true true;expect true true equals true false

}
