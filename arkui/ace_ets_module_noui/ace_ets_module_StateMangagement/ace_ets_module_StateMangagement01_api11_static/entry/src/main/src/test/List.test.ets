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
import LinkArray from './@stateTest/LinkArray.test';
import LinkColor from './@stateTest/LinkColor.test';
import LinkNumber from './@stateTest/LinkNumber.test';
import PropArray from './@stateTest/PropArray.test';
import PropArray1 from './@stateTest/PropArray1.test';
import PropColor from './@stateTest/PropColor.test';
import StateArray from './@stateTest/StateArray.test';
import StateArray1 from './@stateTest/StateArray1.test';
import StateColor from './@stateTest/StateColor.test';
import StateNumber from './@stateTest/StateNumber.test';
export default function testsuite() {
  LinkArray();
  LinkColor();
  LinkNumber();
  PropArray();
  PropArray1();
  PropColor();
  StateArray();
  StateArray1();
  StateColor();
  StateNumber();
}
