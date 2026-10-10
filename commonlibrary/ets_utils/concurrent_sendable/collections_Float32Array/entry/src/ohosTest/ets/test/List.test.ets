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

import Float32ArrayBasicTest from './Float32ArrayBasic.test';
import Float32ArrayConcurrentTest from './Float32ArrayConcurrent.test';
import Float32ArrayAllTest from './All/Float32ArrayAll.test';
import Float32ArrayConcurrentTestConcurrent from './Concurrent/Float32ArrayConcurrent.test';
import Float32ArrayNormalTest from './Normal/Float32ArrayNormal.test';
import Float32ArrayTaskPoolTest from './TaskPool/Float32ArrayTaskPool.test';

import FloatArrayTest from './FloatArrayTest.test'
export default function testsuite() {
  Float32ArrayBasicTest();
  Float32ArrayConcurrentTest();
  Float32ArrayAllTest();
  Float32ArrayConcurrentTestConcurrent();
  Float32ArrayNormalTest();
  Float32ArrayTaskPoolTest();
  FloatArrayTest();
}
