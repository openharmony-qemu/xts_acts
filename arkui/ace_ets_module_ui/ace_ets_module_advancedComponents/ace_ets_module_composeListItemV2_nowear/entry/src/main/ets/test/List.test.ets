/**
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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

import composeListItemV2PageTest from './composeListItemV2/ComposeListItemV2Page.test';
import composeListItemV2Page02Test from './composeListItemV2/ComposeListItemV2Page02.test';
import composeListItemV2Page03Test from './composeListItemV2/ComposeListItemV2Page03.test';
import composeListItemV2Page04Test from './composeListItemV2/ComposeListItemV2Page04.test';

export default function testsuite() {
  composeListItemV2PageTest();
  composeListItemV2Page02Test();
  composeListItemV2Page03Test();
  composeListItemV2Page04Test();
}