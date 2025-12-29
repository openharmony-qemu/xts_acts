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
import BarStylePage from './Navigation/BarStylePage.test'
import EntryOptionPage from './Navigation/EntryOptionPage.test'
import EntryOptionPage2 from './Navigation/EntryOptionPage2.test'
import HideToolBarNavPage from './Navigation/HideToolBarNavPage.test'
import NavDestinationUIObserver from './Navigation/NavDestinationUIObserver.test'
import NavigationCustomTitlePage from './Navigation/NavigationCustomTitlePage.test'
import NavigationTitleTextModifier from './Navigation/NavigationTitleTextModifier.test'
import TitleOptionsToolOptions from './Navigation/TitleOptionsToolOptions.test'


export default function testsuite() {
  BarStylePage()  // pass 35000ms SDK11.25 1个用例
  NavigationTitleTextModifier()  //  SDK11.25 page88行 设置颜色未生效  取值是#FF182431，设置是#FFFFC000 提到遗留单 12.3
  EntryOptionPage() // pass 1个用例
  EntryOptionPage2() // pass 1个用例
  NavigationCustomTitlePage() //  页面显示后退出
  NavDestinationUIObserver() //并发问题，正在解决
  HideToolBarNavPage()   // app died  代码注释 1个用例
  TitleOptionsToolOptions() //  SDK11.25 appDied THREAD_BLOCK_6S at 20210208030958
}