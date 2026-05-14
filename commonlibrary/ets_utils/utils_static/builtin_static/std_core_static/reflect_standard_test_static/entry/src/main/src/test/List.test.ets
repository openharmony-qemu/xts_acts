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

import StaticFieldEqualsTest from "./StaticField/StaticFieldEqualsTest.test";
import StaticFieldGetNameTest from "./StaticField/StaticFieldGetNameTest.test";
import StaticFieldGetOwnerTest from "./StaticField/StaticFieldGetOwnerTest.test";
import StaticFieldGetTypeTest from "./StaticField/StaticFieldGetTypeTest.test";
import StaticFieldGetValueTest from "./StaticField/StaticFieldGetValueTest.test";
import StaticFieldIsPrivateTest from "./StaticField/StaticFieldIsPrivateTest.test";
import StaticFieldIsProtectedTest from "./StaticField/StaticFieldIsProtectedTest.test";
import StaticFieldIsPublicTest from "./StaticField/StaticFieldIsPublicTest.test";
import StaticFieldIsReadonlyTest from "./StaticField/StaticFieldIsReadonlyTest.test";
import StaticFieldSetValueTest from "./StaticField/StaticFieldSetValueTest.test";

export default function testsuite(): void {
  StaticFieldEqualsTest();
  StaticFieldGetNameTest();
  StaticFieldGetOwnerTest();
  StaticFieldGetTypeTest();
  StaticFieldGetValueTest();
  StaticFieldIsPrivateTest();
  StaticFieldIsProtectedTest();
  StaticFieldIsPublicTest();
  StaticFieldIsReadonlyTest();
  StaticFieldSetValueTest();
}

