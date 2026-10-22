'use static';
/*
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

import btManagerError003Test from "./BtManagerSwitchOff003Static.test";
import btManagerSwitchOff003 from './BtManagerSwitchOff003.test';
import btHidoff003Test from './BtHidOff003.test';
import btConnection from './BtConnectionTest.test'

export default function testsuite(): void {
  btManagerError003Test();
  btManagerSwitchOff003();
  btHidoff003Test();
  btConnection();
}