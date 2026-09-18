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

import Uint8ClampedArrayBasicTest from './Uint8ClampedArrayBasic.test';
import Uint8ClampedArrayConcurrentTest from './Uint8ClampedArrayConcurrent.test';
import Uint8ClampedArrayAllTest from './All/Uint8ClampedArrayAll.test';
import Uint8ClampedArrayConcurrentTestConcurrent from './Concurrent/Uint8ClampedArrayConcurrent.test';
import Uint8ClampedArrayNormalTest from './Normal/Uint8ClampedArrayNormal.test';
import Uint8ClampedArrayTaskPoolTest from './TaskPool/Uint8ClampedArrayTaskPool.test';

export default function testsuite() {
  Uint8ClampedArrayBasicTest();
  Uint8ClampedArrayConcurrentTest();
  Uint8ClampedArrayAllTest();
  Uint8ClampedArrayConcurrentTestConcurrent();
  Uint8ClampedArrayNormalTest();
  Uint8ClampedArrayTaskPoolTest();
}
