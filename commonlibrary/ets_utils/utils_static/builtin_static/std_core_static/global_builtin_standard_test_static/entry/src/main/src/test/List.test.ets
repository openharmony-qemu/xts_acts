/*
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

import GlobalClearIntervalTest from "./global/GlobalClearIntervalTest.test";
import GlobalClearTimeoutTest from "./global/GlobalClearTimeoutTest.test";
import GlobalConstantTest from "./global/GlobalConstantTest.test";
import GlobalIsFiniteTest from "./global/GlobalIsFiniteTest.test";
import GlobalIsIntegerTest from "./global/GlobalIsIntegerTest.test";
import GlobalIsNaNTest from "./global/GlobalIsNaNTest.test";
import GlobalIsSafeIntegerTest from "./global/GlobalIsSafeIntegerTest.test";
import GlobalParseFloatTest from "./global/GlobalParseFloatTest.test";
import GlobalParseIntTest from "./global/GlobalParseIntTest.test";
import GlobalSetIntervalTest from "./global/GlobalSetIntervalTest.test";
import GlobalSetTimeoutTest from "./global/GlobalSetTimeoutTest.test";

export default function testsuite(): void {
  GlobalClearIntervalTest();
  GlobalClearTimeoutTest();
  GlobalConstantTest();
  GlobalIsFiniteTest();
  GlobalIsIntegerTest();
  GlobalIsNaNTest();
  GlobalIsSafeIntegerTest();
  GlobalParseFloatTest();
  GlobalParseIntTest();
  GlobalSetIntervalTest();
  GlobalSetTimeoutTest();
}