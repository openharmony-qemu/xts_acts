'use static';
/**
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import popupTest from './PopupTest/popupTest.test';
import PopupNodeTest from './PopupTest/PopupNodeTest.test';
import CustomPopupOptionsTest from './PopupTest/CustomPopupOptions.test';
import PopupCommonTest from './PopupTest/PopupCommon.test';
import PopupOptionsTest from './PopupTest/PopupOptions.test';
import TipsOptionsTest from './TipsOptionsTest/TipsOptions.test';
import ImmersiveOptionsApplyShadowTest from './uimaterial/ImmersiveOptionsApplyShadow.test';
import ActionMenuOptionsSystemMaterialTest from './dialogSystemMaterial/ActionMenuOptionsSystemMaterial.test';
import ActionSheetOptionsSystemMaterialTest from './dialogSystemMaterial/ActionSheetOptionsSystemMaterial.test';
import AlertDialogSystemMaterialTest from './dialogSystemMaterial/AlertDialogSystemMaterial.test';
import BaseDialogOptionsSystemMaterialTest from './dialogSystemMaterial/BaseDialogOptionsSystemMaterial.test';
import ShowDialogOptionsSystemMaterialTest from './dialogSystemMaterial/ShowDialogOptionsSystemMaterial.test';
import ShowToastOptionsTest from './dialogSystemMaterial/ShowToastOptions.test';
import ImmersiveStyleTest from './uimaterial/ImmersiveStyleTest.test';
import ImmersiveOptionsMaterialColorTest from './uimaterial/ImmersiveOptionsMaterialColor.test';
import ImmersiveOptionsColorInvertTest from './uimaterial/ImmersiveOptionsColorInvert.test';
import UIMaterialTest from './uimaterial/UIMaterial.test';

export default function testsuite() {
  popupTest();
  PopupNodeTest();
  CustomPopupOptionsTest();
  PopupCommonTest();
  PopupOptionsTest();
  TipsOptionsTest();
  ImmersiveOptionsApplyShadowTest();
  ActionMenuOptionsSystemMaterialTest();
  ActionSheetOptionsSystemMaterialTest();
  AlertDialogSystemMaterialTest();
  BaseDialogOptionsSystemMaterialTest();
  ShowDialogOptionsSystemMaterialTest();
  ShowToastOptionsTest();
  ImmersiveStyleTest();
  ImmersiveOptionsMaterialColorTest();
  ImmersiveOptionsColorInvertTest();
}