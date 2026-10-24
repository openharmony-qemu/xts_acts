'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import UtilTypesTest from './UtilTypes.test'

import typeTest from './Types/TypeTest.test';
import typesConstructorTest from './Types/TypesConstructorTest.test';
import typesIsAnyArrayBufferTest from './Types/TypesIsAnyArrayBufferTest.test';
import typesIsArrayBufferTest from './Types/TypesIsArrayBufferTest.test';
import typesIsArrayBufferViewTest from './Types/TypesIsArrayBufferViewTest.test';
import typesIsAsyncFunctionTest from './Types/TypesIsAsyncFunctionTest.test';
import typesIsBigInt64ArrayTest from './Types/TypesIsBigInt64ArrayTest.test';
import typesIsBigUint64ArrayTest from './Types/TypesIsBigUint64ArrayTest.test';
import typesIsDataViewTest from './Types/TypesIsDataViewTest.test';
import typesIsDateTest from './Types/TypesIsDateTest.test';
import typesIsFloat32ArrayTest from './Types/TypesIsFloat32ArrayTest.test';
import typesIsFloat64ArrayTest from './Types/TypesIsFloat64ArrayTest.test';
import typesIsInt16ArrayTest from './Types/TypesIsInt16ArrayTest.test';
import typesIsInt32ArrayTest from './Types/TypesIsInt32ArrayTest.test';
import typesIsInt8ArrayTest from './Types/TypesIsInt8ArrayTest.test';
import typesIsMapIteratorTest from './Types/TypesIsMapIteratorTest.test';
import typesIsMapTest from './Types/TypesIsMapTest.test';
import typesIsNativeErrorTest from './Types/TypesIsNativeErrorTest.test';
import typesIsPromiseTest from './Types/TypesIsPromiseTest.test';

export default function testsuite(): void {
  UtilTypesTest();

  typeTest();
  typesConstructorTest();
  typesIsAnyArrayBufferTest();
  typesIsArrayBufferTest();
  typesIsArrayBufferViewTest();
  typesIsAsyncFunctionTest();
  typesIsBigInt64ArrayTest();
  typesIsBigUint64ArrayTest();
  typesIsDataViewTest();
  typesIsDateTest();
  typesIsFloat32ArrayTest();
  typesIsFloat64ArrayTest();
  typesIsInt16ArrayTest();
  typesIsInt32ArrayTest();
  typesIsInt8ArrayTest();
  typesIsMapIteratorTest();
  typesIsMapTest();
  typesIsNativeErrorTest();
  typesIsPromiseTest();
}
