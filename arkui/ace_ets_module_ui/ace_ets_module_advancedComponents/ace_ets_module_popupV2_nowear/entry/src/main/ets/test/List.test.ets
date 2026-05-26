/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import PopupV2DirectionTest from './PopupV2/PopupV2Direction.test'; 
import PopupV2OnCloseTest from './PopupV2/PopupV2OnClose.test';
import PopupV2ButtonTest from './PopupV2/PopupV2Button.test';

export default function testsuite() {
  PopupV2DirectionTest();
  PopupV2OnCloseTest();
  PopupV2ButtonTest();
}