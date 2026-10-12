/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import Uint32ArrayBasicTest from './Uint32ArrayBasic.test';
import Uint32ArrayConcurrentTest from './Uint32ArrayConcurrent.test';
import Uint32ArrayAllTest from './All/Uint32ArrayAll.test';
import Uint32ArrayConcurrentTestConcurrent from './Concurrent/Uint32ArrayConcurrent.test';
import Uint32ArrayNormalTest from './Normal/Uint32ArrayNormal.test';
import Uint32ArrayTaskPoolTest from './TaskPool/Uint32ArrayTaskPool.test';

import UintIntArrayTest from './uintArray/UintIntArrayTest.test';
export default function testsuite() {
  Uint32ArrayBasicTest();
  Uint32ArrayConcurrentTest();
  Uint32ArrayAllTest();
  Uint32ArrayConcurrentTestConcurrent();
  Uint32ArrayNormalTest();
  Uint32ArrayTaskPoolTest();
  UintIntArrayTest();
}
