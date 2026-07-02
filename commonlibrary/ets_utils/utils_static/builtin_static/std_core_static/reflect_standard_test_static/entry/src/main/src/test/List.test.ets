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

import {StaticFieldEqualsTest} from "./StaticField/StaticFieldEqualsTest.test";
import {StaticFieldGetNameTest} from "./StaticField/StaticFieldGetNameTest.test";
import {StaticFieldGetOwnerTest} from "./StaticField/StaticFieldGetOwnerTest.test";
import {StaticFieldGetTypeTest} from "./StaticField/StaticFieldGetTypeTest.test";
import {StaticFieldGetValueTest} from "./StaticField/StaticFieldGetValueTest.test";
import {StaticFieldIsPrivateTest} from "./StaticField/StaticFieldIsPrivateTest.test";
import {StaticFieldIsProtectedTest} from "./StaticField/StaticFieldIsProtectedTest.test";
import {StaticFieldIsPublicTest} from "./StaticField/StaticFieldIsPublicTest.test";
import {StaticFieldIsReadonlyTest} from "./StaticField/StaticFieldIsReadonlyTest.test";
import {StaticFieldSetValueTest} from "./StaticField/StaticFieldSetValueTest.test";
import ClassCreateInstanceTest from './class/ClassCreateInstanceTest.test';
import ClassCurrentTest from './class/ClassCurrentTest.test';
import ClassFromTest from './class/ClassFromTest.test';
import ClassGetConstructorsTest from './class/ClassGetConstructorsTest.test';
import ClassGetDescriptorTest from './class/ClassGetDescriptorTest.test';
import ClassGetFixedArrayComponentTypeTest from './class/ClassGetFixedArrayComponentTypeTest.test';
import ClassGetInstanceFieldTest from './class/ClassGetInstanceFieldTest.test';
import ClassGetInstanceFieldsTest from './class/ClassGetInstanceFieldsTest.test';
import ClassGetInstanceMethodTest001 from './class/ClassGetInstanceMethodTest001.test';
import ClassGetInstanceMethodTest002 from './class/ClassGetInstanceMethodTest002.test';
import ClassGetInstanceMethodsTest from './class/ClassGetInstanceMethodsTest.test';
import ClassGetLinkerTest from './class/ClassGetLinkerTest.test';
import ClassGetNameTest from './class/ClassGetNameTest.test';
import ClassGetStaticFieldTest from './class/ClassGetStaticFieldTest.test';
import ClassGetStaticFieldsTest from './class/ClassGetStaticFieldsTest.test';
import ClassGetStaticMethodTest from './class/ClassGetStaticMethodTest.test';
import ClassGetStaticMethodsTest from './class/ClassGetStaticMethodsTest.test';
import ClassGetSuperTest from './class/ClassGetSuperTest.test';
import ClassGetUnionConstituentTypesTest from './class/ClassGetUnionConstituentTypesTest.test';
import ClassInitializeTest from './class/ClassInitializeTest.test';
import ClassIsAbstractTest from './class/ClassIsAbstractTest.test';
import ClassIsEnumTest from './class/ClassIsEnumTest.test';
import ClassIsFinalTest from './class/ClassIsFinalTest.test';
import ClassIsInterfaceTest from './class/ClassIsInterfaceTest.test';
import ClassIsPrimitiveTest from './class/ClassIsPrimitiveTest.test';
import ClassIsSubtypeOfTest from './class/ClassIsSubtypeOfTest.test';
import ClassIsUnionTest from './class/ClassIsUnionTest.test';
import ClassOfAnyTest from './class/ClassOfAnyTest.test';
import ClassOfCallerTest from './class/ClassOfCallerTest.test';
import ClassOfTest from './class/ClassOfTest.test';
import ConstructorCreateInstanceTest from './constructor/ConstructorCreateInstanceTest.test';
import ConstructorEqualsTest from './constructor/ConstructorEqualsTest.test';
import ConstructorGetNameTest from './constructor/ConstructorGetNameTest.test';
import ConstructorGetOwnerTest from './constructor/ConstructorGetOwnerTest.test';
import ConstructorGetParameterTypeTest from './constructor/ConstructorGetParameterTypeTest.test';
import ConstructorGetParameterTypesTest from './constructor/ConstructorGetParameterTypesTest.test';
import ConstructorGetParametersNumTest from './constructor/ConstructorGetParametersNumTest.test';
import ConstructorGetReturnTypeTest from './constructor/ConstructorGetReturnTypeTest.test';
import ConstructorIsNativeTest from './constructor/ConstructorIsNativeTest.test';
import ConstructorIsPrivateTest from './constructor/ConstructorIsPrivateTest.test';
import ConstructorIsProtectedTest from './constructor/ConstructorIsProtectedTest.test';
import ConstructorIsPublicTest from './constructor/ConstructorIsPublicTest.test';

import ClassIsFuncObjAsyncTest from './reflect/ClassIsFuncObjAsyncTest.test';
import ClassIsLiteralInitializedInterfaceTest from './reflect/ClassIsLiteralInitializedInterfaceTest.test';
import GetInstanceFieldsRecursiveTest from './reflect/GetInstanceFieldsRecursiveTest.test';
import GetInstanceGettersRecursiveTest from './reflect/GetInstanceGettersRecursiveTest.test';

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
import StaticMethodIsPrivateTest from "./staticMethod/StaticMethodIsPrivateTest.test";
import StaticMethodIsProtectedTest from "./staticMethod/StaticMethodIsProtectedTest.test";
import StaticMethodIsPublicTest from "./staticMethod/StaticMethodIsPublicTest.test";
import StaticMethodIsSetterTest from "./staticMethod/StaticMethodIsSetterTest.test";
import InstanceFieldSetValueTest from "./InstanceField/InstanceFieldSetValueTest.test";
import InstanceFieldGetValueTest from "./InstanceField/InstanceFieldGetValueTest.test";
import InstanceFieldIsReadonlyTest from "./InstanceField/InstanceFieldIsReadonlyTest.test";
import InstanceFieldIsPublicTest from "./InstanceField/InstanceFieldIsPublicTest.test";
import InstanceFieldIsPrivateTest from "./InstanceField/InstanceFieldIsPrivateTest.test";
import InstanceFieldIsProtectedTest from "./InstanceField/InstanceFieldIsProtectedTest.test";
import InstanceFieldEqualsTest from "./InstanceField/InstanceFieldEqualsTest.test";
import InstanceFieldGetNameTest from "./InstanceField/InstanceFieldGetNameTest.test";
import InstanceFieldGetOwnerTest from "./InstanceField/InstanceFieldGetOwnerTest.test";
import InstanceFieldGetTypeTest from "./InstanceField/InstanceFieldGetTypeTest.test";



export default function testsuite(): void {
  ClassCreateInstanceTest();
  ClassCurrentTest();
  ClassFromTest();
  ClassGetConstructorsTest();
  ClassGetDescriptorTest();
  ClassGetFixedArrayComponentTypeTest();
  ClassGetInstanceFieldTest();
  ClassGetInstanceFieldsTest();
  ClassGetInstanceMethodTest001();
  ClassGetInstanceMethodTest002();
  ClassGetInstanceMethodsTest();
  ClassGetLinkerTest();
  ClassGetNameTest();
  ClassGetStaticFieldTest();
  ClassGetStaticFieldsTest();
  ClassGetStaticMethodTest();
  ClassGetStaticMethodsTest();
  ClassGetSuperTest();
  ClassGetUnionConstituentTypesTest();
  ClassInitializeTest();
  ClassIsAbstractTest();
  ClassIsEnumTest();
  ClassIsFinalTest();
  ClassIsInterfaceTest();
  ClassIsPrimitiveTest();
  ClassIsSubtypeOfTest();
  ClassIsUnionTest();
  ClassOfAnyTest();
  ClassOfCallerTest();
  ClassOfTest();
  ConstructorCreateInstanceTest();
  ConstructorEqualsTest();
  ConstructorGetNameTest();
  ConstructorGetOwnerTest();
  ConstructorGetParameterTypeTest();
  ConstructorGetParameterTypesTest();
  ConstructorGetParametersNumTest();
  ConstructorGetReturnTypeTest();
  ConstructorIsNativeTest();
  ConstructorIsPrivateTest();
  ConstructorIsProtectedTest();
  ConstructorIsPublicTest();
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
  StaticMethodIsPrivateTest();
  StaticMethodIsProtectedTest();
  StaticMethodIsPublicTest();
  StaticMethodIsSetterTest();

  ClassIsFuncObjAsyncTest();
  ClassIsLiteralInitializedInterfaceTest();
  GetInstanceFieldsRecursiveTest();
  GetInstanceGettersRecursiveTest();

  InstanceFieldSetValueTest();
  InstanceFieldGetValueTest();
  InstanceFieldIsReadonlyTest();
  InstanceFieldIsPublicTest();
  InstanceFieldIsPrivateTest();
  InstanceFieldIsProtectedTest();
  InstanceFieldEqualsTest();
  InstanceFieldGetNameTest();
  InstanceFieldGetOwnerTest();
  InstanceFieldGetTypeTest();
}
