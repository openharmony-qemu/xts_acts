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
import DensityInfo from './observerTest/DensityInfo.test'
import idScrollEvent from './observerTest/idScrollEvent.test'
import indexTabs from './observerTest/indexTabs.test'
import ObserverApi1 from './observerTest/ObserverApi1.test'
import ObserverNavDestinationId from './observerTest/ObserverNavDestinationId.test'
import ObserverNavDestinationState from './observerTest/ObserverNavDestinationState.test'
import ObserverPageId from './observerTest/ObserverPageId.test'
import observerScroll from './observerTest/observerScroll.test'
import observeTabJsunit from './observerTest/observeTabJsunit.test'
import onTabUpdate from './observerTest/onTabUpdate.test'
import tabContentState from './observerTest/tabContentState.test'
import uiIdUpdate from './observerTest/uiIdUpdate.test'
import uiScrollEvent from './observerTest/uiScrollEvent.test'
import uiTabUpdate from './observerTest/uiTabUpdate.test'

export default function testsuite() {
  // observerScroll()  // SDK12.15 pass 1
  // DensityInfo()  // SDK12.15 pass 1
  // idScrollEvent()   // SDK11.25 2025112169406 1个
  // ObserverApi1()  // SDK 11.25 2025111921736 1个
  // tabContentState()   // SDK11.20 2025110729059 1个
  // ObserverNavDestinationId()  // SDK12.15 pass 1
  // ObserverNavDestinationState() // SDK11.20 2025110729059 1个
  // ObserverPageId()  // SDK12.15 pass
  onTabUpdate() // SDK12.15 0702表格31行 1个
  // uiIdUpdate()  // SDK12.15 0702表格31行 1个
  // uiTabUpdate() // SDK12.15 0702表格31行 1个
  // indexTabs()   // SDK12.15 0702表格31行 1个
  // observeTabJsunit() // SDK12.15 0702表格31行 1个
  // uiScrollEvent()   // SDK12.15 0702表格31行 1个
}