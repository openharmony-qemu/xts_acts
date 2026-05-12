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

import abilityTest from "./Ability.test";
import StaticMethodEqualsTest from "./staticMethod/StaticMethodEqualsTest.test";
import StaticMethodGetNameTest from "./staticMethod/StaticMethodGetNameTest.test";
import StaticMethodGetOwnerTest from "./staticMethod/StaticMethodGetOwnerTest.test";
import StaticMethodGetParameterTypeTest from "./staticMethod/StaticMethodGetParameterTypeTest.test";
import StaticMethodGetParameterTypesTest from "./staticMethod/StaticMethodGetParameterTypesTest.test";
import StaticMethodGetParametersNumTest from "./staticMethod/StaticMethodGetParametersNumTest.test";
import StaticMethodGetReturnTypeTest from "./staticMethod/StaticMethodGetReturnTypeTest.test";
import StaticMethodInvokeTest from "./staticMethod/StaticMethodInvokeTest.test";
import StaticMethodIsAsyncTest from "./staticMethod/StaticMethodIsAsyncTest.test";
import StaticMethodIsGetterTest from "./staticMethod/StaticMethodIsGetterTest.test";
import StaticMethodIsNativeTest from "./staticMethod/StaticMethodIsNativeTest.test";
import StaticMethodIsPrivateTest from "./staticMethod/StaticMethodIsPrivateTest.test";
import StaticMethodIsProtectedTest from "./staticMethod/StaticMethodIsProtectedTest.test";
import StaticMethodIsPublicTest from "./staticMethod/StaticMethodIsPublicTest.test";
import StaticMethodIsSetterTest from "./staticMethod/StaticMethodIsSetterTest.test";

export default function testsuite(): void {

    StaticMethodEqualsTest();
    StaticMethodGetNameTest();
    StaticMethodGetOwnerTest();
    StaticMethodGetParameterTypeTest();
    StaticMethodGetParameterTypesTest();
    StaticMethodGetParametersNumTest();
    StaticMethodGetReturnTypeTest();
    StaticMethodInvokeTest();
    StaticMethodIsAsyncTest();
    StaticMethodIsGetterTest();
    StaticMethodIsNativeTest();
    StaticMethodIsPrivateTest();
    StaticMethodIsProtectedTest();
    StaticMethodIsPublicTest();
    StaticMethodIsSetterTest();
}