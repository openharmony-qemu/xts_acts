'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import TcBindTest from "./TcBindTest.test";
import TcManglingTest from "./TcManglingTest.test";
import TcTypeTest from "./TcTypeTest.test";
import TcParamTest from "./TcParamTest.test";
import TcCreateTest from "./TcCreateTest.test";
import TcIfaceTest from "./TcIfaceTest.test";
import TcFuncTest from "./TcFuncTest.test";
import TcAsyncTest from "./TcAsyncTest.test";
import TcMtTest from "./TcMtTest.test";
import TcArrayTest from "./TcArrayTest.test";
import TcFixedArrayTest from "./TcFixedArrayTest.test";
import TcValueArrayTest from "./TcValueArrayTest.test";
import TcArrayBufferTest from "./TcArrayBufferTest.test";
import TcEnumTest from "./TcEnumTest.test";
import TcErrorCodeTest from "./TcErrorCodeTest.test";
import TcFaqTest from "./TcFaqTest.test";
import TcBigIntTest from "./TcBigIntTest.test";
import TcContainerTest from "./TcContainerTest.test";
import TcLifecycleTest from "./TcLifecycleTest.test";
import TcExceptionTest from "./TcExceptionTest.test";
import TcStringTest from "./TcStringTest.test";
import TcOptTest from "./TcOptTest.test";
import TcLoadLibTest from "./TcLoadLibTest.test";
import TcErrorNoLoadLibTest from "./TcErrorNoLoadLibTest.test";
import TcErrorTest from "./TcErrorTest.test";
import TcDisasmTest from "./TcDisasmTest.test";
import aniNativeTest from "./ActsAniNativeTest.test";
import classStorageTest from './ClassStorageTest.test.ets';
import containerStorageTest from './ContainerStorageTest.test.ets';
import threadSafeStorageTest from './ThreadSafeStorageTest.test.ets';
import aniObjectTypeTest from './AniObjectTypeTest.test.ets';
import concurrentStorageTest from './ConcurrentStorageTest.test.ets';
import mapKeyStorageTest from './MapKeyStorageTest.test.ets';
import exceptionStorageTest from './ExceptionStorageTest.test.ets';

export default function testsuite() :void{
  TcBindTest();
  TcManglingTest();
  TcTypeTest();
  TcParamTest();
  TcCreateTest();
  TcIfaceTest();
  TcFuncTest();
  TcAsyncTest();
  TcMtTest();
  TcArrayTest();
  TcFixedArrayTest();
  TcValueArrayTest();
  TcArrayBufferTest();
  TcEnumTest();
  TcErrorCodeTest();
  TcFaqTest();
  TcBigIntTest();
  TcContainerTest();
  TcLifecycleTest();
  TcExceptionTest();
  TcStringTest();
  TcOptTest();
  TcLoadLibTest();
  TcErrorCodeTest();
  TcErrorNoLoadLibTest();
  TcErrorTest();
  TcDisasmTest();
  aniNativeTest();
  classStorageTest();
  containerStorageTest();
  threadSafeStorageTest();
  aniObjectTypeTest();
  concurrentStorageTest();
  mapKeyStorageTest();
  exceptionStorageTest();
}
