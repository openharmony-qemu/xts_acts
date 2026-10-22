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
import TabsTest from './TabsTest/Tabs.test';
import tabsBarFloatingStyle from './TabsTest/tabsBarFloatingStyle.test';
import systemMaterialBarStyle from './TabsTest/systemMaterialBarStyle.test';
import tabsSidebarStyle from './TabsTest/TabsSidebarStyle.test';
import tabsSidebarDisplayStyle from './TabsTest/TabsSidebarDisplayStyle.test';
import topFloatingBarStyle from './TabsTest/TopFloatingBarStyle.test';
import topFloatingBarInvalid from './TabsTest/TopFloatingBarInvalid.test';
import topFloatingBarLegacy from './TabsTest/TopFloatingBarLegacy.test';

export default function testsuite(): void {
  TabsTest();
  tabsBarFloatingStyle();
  systemMaterialBarStyle();
  tabsSidebarStyle();
  tabsSidebarDisplayStyle();
  topFloatingBarStyle();
  topFloatingBarInvalid();
  topFloatingBarLegacy();
}