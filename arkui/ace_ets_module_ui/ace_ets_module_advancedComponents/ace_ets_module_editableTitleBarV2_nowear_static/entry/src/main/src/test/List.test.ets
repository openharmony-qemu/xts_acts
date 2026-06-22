'use static';
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

import editableTitleBarV2BasicTest from './editableTitleBarV2/editableTitleBarV2Basic.test';
import editableTitleBarV2MenuButtonTest from './editableTitleBarV2/editableTitleBarV2MenuButton.test';
import editableTitleBarV2StyleTest from './editableTitleBarV2/editableTitleBarV2Style.test';
import editableTitleBarV2InteractionTest from './editableTitleBarV2/editableTitleBarV2Interaction.test';

export default function testsuite() {
  editableTitleBarV2BasicTest();
  editableTitleBarV2MenuButtonTest();
  editableTitleBarV2StyleTest();
  editableTitleBarV2InteractionTest();
}