'use static';
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

import chipGroupIconItemOptionsTest from './ChipGroupTest/ChipGroupIconItemOptionsTest.test';
import ChipGroupItemOptionsTest from './ChipGroupTest/ChipGroupItemOptionsTest.test';
import ChipGroupSymbolItemOptionsTest from './ChipGroupTest/ChipGroupSymbolItemOptionsTest.test';
import chipTest0010 from './ChipTest/ChipTest0010.test';
import chipSizeTest from './ChipTest/chipSizeTest.test';
import prefixIconTest from './ChipTest/prefixIconTest.test';
import ChipApi1 from './ChipTest/ChipApi1.test';
import labelOptionsTest from './ChipTest/labelOptionsTest.test';
import localizedLabelMargin from './ChipTest/localizedLabelMargin.test';

export default function testsuite() {
  chipGroupIconItemOptionsTest();
  ChipGroupItemOptionsTest();
  ChipGroupSymbolItemOptionsTest();
  chipTest0010();
  chipSizeTest();
  prefixIconTest();
  ChipApi1();
  labelOptionsTest();
  localizedLabelMargin();
}