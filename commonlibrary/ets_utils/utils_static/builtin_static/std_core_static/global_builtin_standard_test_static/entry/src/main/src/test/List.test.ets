'use static';
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

import GlobalClearIntervalPart_1Test from "./global/GlobalClearIntervalPart1Test.test";
import GlobalClearTimeoutPart_1Test from "./global/GlobalClearTimeoutPart1Test.test";
import GlobalConstantPart_1Test from "./global/GlobalConstantPart1Test.test";
import GlobalIsFinitePart_1Test from "./global/GlobalIsFinitePart1Test.test";
import GlobalIsIntegerPart_1Test from "./global/GlobalIsIntegerPart1Test.test";
import GlobalIsNaNPart_1Test from "./global/GlobalIsNaNPart1Test.test";
import GlobalIsSafeIntegerPart_1Test from "./global/GlobalIsSafeIntegerPart1Test.test";
import GlobalParseFloatPart_1Test from "./global/GlobalParseFloatPart1Test.test";
import GlobalParseIntPart_1Test from "./global/GlobalParseIntPart1Test.test";
import GlobalSetIntervalPart_1Test from "./global/GlobalSetIntervalPart1Test.test";
import GlobalSetTimeoutPart_1Test from "./global/GlobalSetTimeoutPart1Test.test";

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

  GlobalClearIntervalPart_1Test();
  GlobalClearTimeoutPart_1Test();
  GlobalConstantPart_1Test();
  GlobalIsFinitePart_1Test();
  GlobalIsIntegerPart_1Test();
  GlobalIsNaNPart_1Test();
  GlobalIsSafeIntegerPart_1Test();
  GlobalParseFloatPart_1Test();
  GlobalParseIntPart_1Test();
  GlobalSetIntervalPart_1Test();
  GlobalSetTimeoutPart_1Test();
}