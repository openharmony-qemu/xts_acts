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
import runClassInitializeTest from './class/ClassInitializeTest.test';
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
  runClassInitializeTest();
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

}
