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

import Int16ArrayBasicTest from './Int16ArrayBasic.test';
import Int16ArrayConcurrentTest from './Int16ArrayConcurrent.test';
import Int16ArrayExtendedTest from './Int16ArrayExtended.test';
import Int16ArrayAllTest from './All/Int16ArrayAll.test';
import Int16ArrayConcurrentTestConcurrent from './Concurrent/Int16ArrayConcurrent.test';
import Int16ArrayNormalTest from './Normal/Int16ArrayNormal.test';
import Int16ArrayTaskPoolTest from './TaskPool/Int16ArrayTaskPool.test';

import IntShortArrayTest from './intArray/IntShortArrayTest.test';
export default function testsuite() {
  Int16ArrayBasicTest();
  Int16ArrayConcurrentTest();
  Int16ArrayExtendedTest();
  Int16ArrayAllTest();
  Int16ArrayConcurrentTestConcurrent();
  Int16ArrayNormalTest();
  Int16ArrayTaskPoolTest();
  
  IntShortArrayTest();
}
