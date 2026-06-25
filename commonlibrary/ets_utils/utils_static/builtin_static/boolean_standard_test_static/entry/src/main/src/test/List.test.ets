/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import BooleanAndTest from "./Boolean/BooleanAndTest.test";
import BooleanOrTest from "./Boolean/BooleanOrTest.test";
import BooleanXorTest from "./Boolean/BooleanXorTest.test";
import BooleanNegateTest from "./Boolean/BooleanNegateTest.test";
import BooleanIsTrueTest from "./Boolean/BooleanIsTrueTest.test";
import BooleanIsFalseTest from "./Boolean/BooleanIsFalseTest.test";
import BooleanEqualsTest from "./Boolean/BooleanEqualsTest.test";
import BooleanCompareToTest from "./Boolean/BooleanCompareToTest.test";
import BooleanToStringTest from "./Boolean/BooleanToStringTest.test";
import BooleanConstructorTest from "./Boolean/BooleanConstructorTest.test";
import BooleanToBooleanInstanceTest from "./Boolean/BooleanToBooleanTest.test";
import BooleanValueOfInstanceTest from "./Boolean/BooleanValueOfTest.test";
import BooleanInvokeTest from "./BooleanStatic/BooleanInvokeStaticTest.test";
import BooleanInvokeTTest from "./BooleanStatic/BooleanInvokeTStaticTest.test";
import BooleanPropertyTest from "./BooleanStatic/BooleanPropertyStaticTest.test";
import BooleanToBooleanStaticTest from "./BooleanStatic/BooleanToBooleanStaticTest.test";
import BooleanValueOfStaticTest from "./BooleanStatic/BooleanValueOfStaticTest.test";

export default function testsuite(): void {

  BooleanAndTest();
  BooleanOrTest();
  BooleanXorTest();
  BooleanNegateTest();
  BooleanIsTrueTest();
  BooleanIsFalseTest();
  BooleanEqualsTest();
  BooleanCompareToTest();
  BooleanToStringTest();
  BooleanConstructorTest();
  BooleanToBooleanInstanceTest();
  BooleanValueOfInstanceTest();
  BooleanInvokeTest();
  BooleanInvokeTTest();
  BooleanPropertyTest();
  BooleanToBooleanStaticTest();
  BooleanValueOfStaticTest();
}