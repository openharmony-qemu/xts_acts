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

import sendableLruCacheBasicTest from './SendableLruCacheBase/SendableLruCacheBasicTypes.test';
import sendableLruCacheBoundaryTest from './SendableLruCacheBase/SendableLruCacheBoundaryCases.test';
import sendableLruCacheCompositeTest from './SendableLruCacheBase/SendableLruCacheComplexTypes.test';
import sendableLruCacheErrorTest from './SendableLruCacheBase/SendableLruCacheError.test';
import sendableLruCacheSpecialTest from './SendableLruCacheBase/SendableLruCacheSpecial.test';
import sendableLruCacheNullableTest from './SendableLruCacheBase/SendableLruCacheNullableTest.test';
import sendableLruCacheBigintTest from './SendableLruCacheBase/Typetest/SendableLruCacheBigintTest.test';
import sendableLruCacheBooleanTest from './SendableLruCacheBase/Typetest/SendableLruCacheBooleanTest.test';
import sendableLruCacheConcurrencyTest from './SendableLruCacheBase/Typetest/SendableLruCacheConcurrencyTest.test';
import sendableLruCacheNonSendableTest from './SendableLruCacheBase/Typetest/SendableLruCacheNonSendableTest.test';
import sendableLruCacheNumberTest from './SendableLruCacheBase/Typetest/SendableLruCacheNumberTest.test';
import sendableLruCacheSendableTest from './SendableLruCacheBase/Typetest/SendableLruCacheSendableTest.test';
import sendableLruCacheStringTest from './SendableLruCacheBase/Typetest/SendableLruCacheStringTest.test';
import sendableLruCacheUnionTest from './SendableLruCacheBase/Typetest/SendableLruCacheUnionTest.test';
import sendableLruCacheBatch1Test from './SendableLruCacheBase/SendableLruCacheSendableSpecial/Batch1.test';

import sendableLruCacheConcurrentSubTest from './SendableLruCacheConcurrent/SendableLruCacheConcurrent.test';
import SendableLruCacheExpand1024Test from './SendableLruCacheConcurrent/SendableLruCacheExpand1024Test.test';
import SendableExpand1024Test from './SendableLruCacheConcurrent/SendableExpand1024Test.test';

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
  
  sendableLruCacheBasicTest();
  sendableLruCacheBoundaryTest();
  sendableLruCacheCompositeTest();
  sendableLruCacheErrorTest();
  sendableLruCacheSpecialTest();
  sendableLruCacheNullableTest();
  sendableLruCacheBigintTest();
  sendableLruCacheBooleanTest();
  sendableLruCacheConcurrencyTest();
  sendableLruCacheNonSendableTest();
  sendableLruCacheNumberTest();
  sendableLruCacheSendableTest();
  sendableLruCacheStringTest();
  sendableLruCacheUnionTest();
  sendableLruCacheBatch1Test();
  
  sendableLruCacheConcurrentSubTest();
  SendableLruCacheExpand1024Test();
  SendableExpand1024Test();
}
