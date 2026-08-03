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
}