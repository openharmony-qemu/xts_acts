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

import ArrayBufferBasicTest from './ArrayBufferBasic.test';
import CollectionsArrayBufferByteLengthTest from './All/CollectionsArrayBufferByteLengthTest.test';
import CollectionsArrayBufferConstructorTest from './All/CollectionsArrayBufferConstructorTest.test';
import CollectionsArrayBufferIsViewTest from './All/CollectionsArrayBufferIsViewTest.test';
import CollectionsArrayBufferLikeTest from './All/CollectionsArrayBufferLikeTest.test';
import CollectionsArrayBufferSliceTest from './All/CollectionsArrayBufferSliceTest.test';
import CollectionsArrayBufferViewTest from './All/CollectionsArrayBufferViewTest.test';
import ArrayBufferNormalTest from './Normal/ArrayBufferNormal.test';
import ArrayBufferTaskPoolTest from './TaskPool/ArrayBufferTaskPool.test';

import ArrayBufferTest from './ArrayBufferTest.test';
export default function testsuite() {
  ArrayBufferBasicTest();
  CollectionsArrayBufferByteLengthTest();
  CollectionsArrayBufferConstructorTest();
  CollectionsArrayBufferIsViewTest();
  CollectionsArrayBufferLikeTest();
  CollectionsArrayBufferSliceTest();
  CollectionsArrayBufferViewTest();
  ArrayBufferNormalTest();
  ArrayBufferTaskPoolTest();
  ArrayBufferTest();
}
