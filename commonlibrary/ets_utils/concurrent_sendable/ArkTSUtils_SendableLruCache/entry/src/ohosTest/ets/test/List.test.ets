/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import sendableLruCacheConstructorTest from './SendableLruCacheConstructor.test';
import sendableLruCachePutTest from './SendableLruCachePut.test';
import sendableLruCacheGetTest from './SendableLruCacheGet.test';
import sendableLruCacheRemoveTest from './SendableLruCacheRemove.test';
import sendableLruCacheClearTest from './SendableLruCacheClear.test';
import sendableLruCacheContainsTest from './SendableLruCacheContains.test';
import sendableLruCacheKeysValuesTest from './SendableLruCacheKeysValues.test';
import sendableLruCacheLengthEmptyTest from './SendableLruCacheLengthEmpty.test';
import sendableLruCacheToStringEntriesTest from './SendableLruCacheToStringEntries.test';
import sendableLruCacheCapacityTest from './SendableLruCacheCapacity.test';
import sendableLruCacheCountsTest from './SendableLruCacheCounts.test';
import sendableLruCacheCreateDefaultTest from './SendableLruCacheCreateDefault.test';
import sendableLruCacheConcurrentTest from './SendableLruCacheConcurrent.test';

export default function testsuite() {
  sendableLruCacheConstructorTest();
  sendableLruCachePutTest();
  sendableLruCacheGetTest();
  sendableLruCacheRemoveTest();
  sendableLruCacheClearTest();
  sendableLruCacheContainsTest();
  sendableLruCacheKeysValuesTest();
  sendableLruCacheLengthEmptyTest();
  sendableLruCacheToStringEntriesTest();
  sendableLruCacheCapacityTest();
  sendableLruCacheCountsTest();
  sendableLruCacheCreateDefaultTest();
  sendableLruCacheConcurrentTest();
}
