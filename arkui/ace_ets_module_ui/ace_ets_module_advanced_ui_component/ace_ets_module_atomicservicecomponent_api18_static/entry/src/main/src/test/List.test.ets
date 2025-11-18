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

import atomicservicenavigationTest from './atomicservicenavigation/AtomicServiceNavigation.test';
import atomicservicesearchTest from './atomicservicesearch/AtomicServiceSearch.test';
import atomicservicetabsTest from './atomicservicetabs/AtomicServiceTabs.test';
import halfscreenlaunchcomponentTest from './halfscreenlaunchcomponent/HalfScreenLaunchComponent.test';

export default function testsuite() {
  atomicservicenavigationTest(); // 高级组件 AtomicServiceNavigation 1
  atomicservicesearchTest(); // 高级组件 AtomicServiceSearch 1
  atomicservicetabsTest();  // 高级组件AtomicServiceTabs  1
  halfscreenlaunchcomponentTest(); // 启动元服务组件 HalfScreenLaunchComponent 1
}