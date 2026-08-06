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

import PopupOptionsSystemMaterialTest from './popupSystemMaterial/PopupOptionsSystemMaterial.test';
import CustomPopupOptionsSystemMaterialTest from './popupSystemMaterial/CustomPopupOptionsSystemMaterial.test';
import PopupCommonOptionsSystemMaterialTest from './popupSystemMaterial/PopupCommonOptionsSystemMaterial.test';
import SheetOptionsSystemMaterialTest from './popupSystemMaterial/SheetOptionsSystemMaterial.test';
import TipsOptionsSystemMaterialTest from './popupSystemMaterial/TipsOptionsSystemMaterial.test';
import PopupOptionsColorModeTest from './popupColorMode/PopupOptionsColorModeTest.test';
import PopupCommonOptionsColorModeTest from './popupColorMode/PopupCommonOptionsColorModeTest.test';
import CustomPopupOptionsColorModeTest from './popupColorMode/CustomPopupOptionsColorModeTest.test';
import PopupOptionsLevelModeTest from './popupLevelMode/PopupOptionsLevelModeTest.test';
import PopupCommonOptionsLevelModeTest from './popupLevelMode/PopupCommonOptionsLevelModeTest.test';
import CustomPopupOptionsLevelModeTest from './popupLevelMode/CustomPopupOptionsLevelModeTest.test';
import BaseDialogOptionsDisplayModeInSubWindowTest from
  './dialogSystemMaterial/BaseDialogOptionsDisplayModeInSubWindow.test';
import MaterialLevelTest from './uimaterial/MaterialLevelTest.test';

export default function testsuite(): void {
  PopupOptionsSystemMaterialTest();
  CustomPopupOptionsSystemMaterialTest();
  PopupCommonOptionsSystemMaterialTest();
  SheetOptionsSystemMaterialTest();
  TipsOptionsSystemMaterialTest();
  PopupOptionsColorModeTest();
  PopupCommonOptionsColorModeTest();
  CustomPopupOptionsColorModeTest();
  PopupOptionsLevelModeTest();
  PopupCommonOptionsLevelModeTest();
  CustomPopupOptionsLevelModeTest();
  BaseDialogOptionsDisplayModeInSubWindowTest();
  MaterialLevelTest();
}
