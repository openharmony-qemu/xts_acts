'use static'
/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import CacheMaxCountForHSPValidTest from './CacheMaxCountTest/CacheMaxCountForHSPValidTest.test';
import CacheMaxCountForHSPErrorTest from './CacheMaxCountTest/CacheMaxCountForHSPErrorTest.test';
import PopupBackgroundBlurStyleOptionsTest from './popupBackground/PopupBackgroundBlurStyleOptionsTest.test';
import PopupCommonOptionsBackgroundBlurStyleOptionsTest from
  './popupBackground/PopupCommonOptionsBackgroundBlurStyleOptionsTest.test';
import CustomPopupOptionsBackgroundBlurStyleOptionsTest from
  './popupBackground/CustomPopupOptionsBackgroundBlurStyleOptionsTest.test';
import CustomDialogDisplayModeInSubWindowTest from './CustomDialogTest/CustomDialogDisplayModeInSubWindow.test';
import CustomDialogSystemMaterialTest from './CustomDialogTest/CustomDialogSystemMaterial.test';
import SubMenuBuilderTest from './MenuTest/SubMenuBuilderTest.test';
import MenuSystemMaterialTest from './MenuSystemMaterialTest/MenuSystemMaterial.test';

export default function testsuite(): void {
  CacheMaxCountForHSPValidTest();
  CacheMaxCountForHSPErrorTest();
  PopupBackgroundBlurStyleOptionsTest();
  PopupCommonOptionsBackgroundBlurStyleOptionsTest();
  CustomPopupOptionsBackgroundBlurStyleOptionsTest();
  CustomDialogDisplayModeInSubWindowTest();
  CustomDialogSystemMaterialTest();
  SubMenuBuilderTest();
  MenuSystemMaterialTest();
}
