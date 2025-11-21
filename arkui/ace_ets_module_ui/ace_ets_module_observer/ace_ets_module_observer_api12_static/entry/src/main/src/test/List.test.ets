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
  // idScrollEvent()   // onScrollEvent appDied
  ObserverApi1()  // 断言失败 1   （page89）queryNavDestinationInfo（）获取不到param 造成 （test87）断言失败
  // tabContentState()   // Tabs组件获取不到 1  动效框架组 1.(page37) observer.on 造成页面加载失败 2.（test88）获取不到页面组件
  // ObserverNavDestinationId()  // pass 1
  // ObserverNavDestinationState() // 1.(page70) observer.on 造成页面加载失败 2.（page142）页面无法跳转 导致 （test92）获取不到button
  // ObserverPageId()  //  1.(page32) observer.on 造成页面加载失败
  // observerScroll()  // 1.(page35) observer.on 造成页面加载失败
  // onTabUpdate() // 1.(page32) observer.on 造成页面加载失败
  // uiIdUpdate()  // 1.(page40) observer.on 造成页面加载失败
  // uiTabUpdate() // 1.(page32) observer.on 造成页面加载失败
  // DensityInfo()  // app died  1.(page38) observer.on 造成页面加载失败
  // indexTabs()  // app died    1.(page33) observer.on 造成页面加载失败
  // observeTabJsunit() // app died   1.(page34) observer.on 造成页面加载失败
  // uiScrollEvent()   // app died   1.(page38) observer.on 造成页面加载失败
}