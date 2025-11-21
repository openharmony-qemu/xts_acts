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
import BarStylePage from './Navigation/BarStylePage.test'
import EntryOptionPage from './Navigation/EntryOptionPage.test'
import EntryOptionPage2 from './Navigation/EntryOptionPage2.test'
import HideToolBarNavPage from './Navigation/HideToolBarNavPage.test'
import NavDestinationUIObserver from './Navigation/NavDestinationUIObserver.test'
import NavigationCustomTitlePage from './Navigation/NavigationCustomTitlePage.test'
import NavigationTitleTextModifier from './Navigation/NavigationTitleTextModifier.test'
import TitleOptionsToolOptions from './Navigation/TitleOptionsToolOptions.test'


export default function testsuite() {
  BarStylePage()  // pass 35000ms  1个用例
  NavigationTitleTextModifier()  // 1.(page88) Cannot find method '<set>mainTitleModifier 造成 页面颜色未更新 1个用例
  TitleOptionsToolOptions() // 取不到值  Button 组件 组件树取不到children
  EntryOptionPage() // pass 1个用例
  EntryOptionPage2() // pass 1个用例
  HideToolBarNavPage()   // app died  代码注释 1个用例
  NavigationCustomTitlePage() //  (page47) Cannot find method 'pushPathByName 导致 app died 2ge用例
  NavDestinationUIObserver()
}