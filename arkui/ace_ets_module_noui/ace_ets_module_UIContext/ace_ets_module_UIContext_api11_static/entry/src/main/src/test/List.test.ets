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

import atomicServiceBarTest from "./UIContext/autoservice/atomicServiceBar.test";
import getDragController from './UIContext/getDragController.test'
import getUIObserver from './UIContext/getUIObserver.test'
import mediaQueryOffJsunit from './mediaqueryTest/mediaQuery.test'

export default function testsuite() {
  // getDragController(); //  SDK12.9 pass1
  // atomicServiceBarTest();  // SDK12.9 getAtomicServiceBar appDied  api22 SR20250717371939（6个用例）
  // getUIObserver(); // SDK12.9 自动化点击后，appDied，手动不会 记录到问题表格77行
  mediaQueryOffJsunit(); // SDK12.9 记录在表格77行
}