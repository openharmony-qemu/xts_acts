/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import ArrayEveryTest from './array/ArrayEvery.test';
import ArrayOfTest from './array/ArrayOf.test';
import ArrayPopTest from './array/ArrayPop.test';
import ArrayPrototypeTest from './array/ArrayPrototype.test';
import ArrayPushTest from './array/ArrayPush.test';
import ArraySliceTest from './array/ArraySlice.test';
import ArraySomeTest from './array/ArraySome.test';
import ArraySpliceTest from './array/ArraySplice.test';

export default function testsuite() {
    ArrayEveryTest();
    ArrayOfTest();
    ArrayPopTest();
    ArrayPrototypeTest();
    ArrayPushTest();
    ArraySliceTest();
    ArraySomeTest();
    ArraySpliceTest();
}