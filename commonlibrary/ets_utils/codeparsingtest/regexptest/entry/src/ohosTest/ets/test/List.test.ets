/*
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

import RegExpTest001 from './RegExp001.test';
import RegExpTest002 from './RegExp002.test';
import RegExpTest003 from './RegExp003.test';
import RegExpTest004 from './RegExp004.test';
import RegExpCombination1Test from './RegExpCombination1Test.test';

export default function testsuite() {
  RegExpTest001();
  RegExpTest002();
  RegExpTest003();
  RegExpTest004();
  RegExpCombination1Test();
}