'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import versionInfoTest from "./ActsVersionInfo.test";
import boxUnBoxPrimitiveTest from "./BoxUnBoxPrimitive.test";
import AttachThreadTest from './ActsAttachThread.test'
import classOperationsTest from "./ActsClassOperations.test";
import fieldAccessTest from "./ActsFieldAccess.test";
import propertyAccessTest from "./ActsPropertyAccess.test";
import methodCallTest from "./ActsMethodCall.test";
import methodOverloadTest from "./ActsMethodOverload.test";
import enumOperationsTest from "./ActsEnumOperations.test";
import genericClassTest from "./ActsGenericClass.test";
import vmManagementTest from "./VmCovered";

import extendedTestsPart1 from "./ModuleWeakRefCovered";
import extendedTestsPart2 from "./ScopeRefCovered";
import extendedTestsPart3 from "./BoxVarCovered";

import extendedTestsPart4 from "./StrCovered";
import extendedTestsPart5 from "./FuncCallCovered";
import extendedTestsPart6 from "./TupleCovered";
import extendedTestsPart7 from "./ClassCovered";
import extendedTestsPart8 from "./ObjCovered";

export default function testsuite() :void{
    versionInfoTest();
    // ANI Box/Unbox test
    boxUnBoxPrimitiveTest();

    // ANI Attach/Detach test
    AttachThreadTest();

    // ANI Class/Interface Spec test
    classOperationsTest();
    fieldAccessTest();
    propertyAccessTest();
    methodCallTest();
    methodOverloadTest();
    enumOperationsTest();
    genericClassTest();

    // ANI VM Management test
    vmManagementTest();

    // Extended tests
    extendedTestsPart1();
    extendedTestsPart2();
    extendedTestsPart3();

    // Extended tests part 4-8
    extendedTestsPart4();
    extendedTestsPart5();
    extendedTestsPart6();
    extendedTestsPart7();
    extendedTestsPart8();
}