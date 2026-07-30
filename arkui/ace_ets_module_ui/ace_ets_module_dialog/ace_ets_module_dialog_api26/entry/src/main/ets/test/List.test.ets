/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import PopupOptionsColorMode from './popup/PopupOptionsColorMode.test';
import PopupCommonOptionsColorMode from './popup/PopupCommonOptionsColorMode.test';
import PopupOptionsLevelMode from './popup/PopupOptionsLevelMode.test';
import CustomPopupOptionsLevelMode from './popup/CustomPopupOptionsLevelMode.test';
import ContextMenuByResponseType from './menu/ContextMenuByResponseType.test';
import ContextMenuWithResponse from './menu/ContextMenuWithResponse.test';
import ContextMenuByIsShow from './menu/ContextMenuByIsShow.test';
import ContextMenuGridStyle from './menu/ContextMenuGridStyle.test';
import MenuItemSubMenuBuilder from './menu/MenuItemSubMenuBuilder.test';
import SelectMenuBackground from './select/SelectMenuBackground.test';
import DisplayModeInSubWindow from './dialog/DisplayModeInSubWindow.test';

export default function testsuite() {
  PopupOptionsColorMode();
  PopupCommonOptionsColorMode();
  PopupOptionsLevelMode();
  CustomPopupOptionsLevelMode();
  ContextMenuByResponseType();
  ContextMenuWithResponse();
  ContextMenuByIsShow();
  ContextMenuGridStyle();
  MenuItemSubMenuBuilder();
  SelectMenuBackground();
  DisplayModeInSubWindow();
}
