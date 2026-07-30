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

import NavDestinationTest from './NavDestinationTest/NavDestination.test';
import NavigationTest from './NavigationTest/Navigation.test';
import SwiperControllerTest from './SwiperControllerTest/SwiperController.test';
import NavigationNavDestinationTest from './NavigationNavDestinationTest/NavigationNavDestination.test';
import ToolBarItemDebugLineTest from './ToolBarItemDebugLineTest/ToolBarItemDebugLine.test';
import NavScrollEffectOptions from './NavigationTest/NavScrollEffectOptions.test';
import NavigationModeRatio from './NavigationTest/NavigationModeRatio.test';
import navigationMaterial from './NavigationTest/navigationMaterial.test';
import configurationNav from './NavigationNavDestinationTest/configurationNav.test';
import colorLengthMetrics from './Graphics/colorLengthMetrics.test';
import swiperIndicatorIcon from './SwiperControllerTest/swiperIndicatorIcon.test';
import swiperSystemMaterial from './SwiperControllerTest/swiperSystemMaterial.test';

export default function testsuite() {
  NavDestinationTest();
  NavigationTest();
  SwiperControllerTest();
  NavigationNavDestinationTest();
  ToolBarItemDebugLineTest();
  NavScrollEffectOptions();
  NavigationModeRatio();
  navigationMaterial();
  configurationNav();
  colorLengthMetrics();
  swiperIndicatorIcon();
  swiperSystemMaterial();
}