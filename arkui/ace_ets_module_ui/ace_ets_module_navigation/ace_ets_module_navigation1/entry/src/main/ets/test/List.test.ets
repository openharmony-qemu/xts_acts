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

import InterceptionTest from './Interception/InterceptionTest.test'
import NavigationTest from './Navigation/NavigationTest.test'
import EnableShowHideWithContentCoverPage from './Navigation/EnableShowHideWithContentCoverPage.test'
import SplitPlaceholder from './Navigation/SplitPlaceholder.test'
import UIContextNavDestinationUpdate from './UIContext/UIContextNavDestinationUpdate.test'
import StepperModifierPage from './Stepper/StepperModifierPage.test'
import HomePage from './Navigation/HomePage.test'
import StepperModifierTest from './Stepper/StepperModifierTest.test'
import NavigatorTargetJsunit from './Navigator/navigator.test'


export default function testsuite() {
  InterceptionTest();
  NavigationTest();
  EnableShowHideWithContentCoverPage()
  SplitPlaceholder();
  UIContextNavDestinationUpdate();
  StepperModifierPage();
  HomePage();
  StepperModifierTest();
  NavigatorTargetJsunit();
} 