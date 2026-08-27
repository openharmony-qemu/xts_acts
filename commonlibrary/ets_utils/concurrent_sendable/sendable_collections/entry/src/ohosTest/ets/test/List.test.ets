/*
 * Copyright (c) 2026 RKH Corp.
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

import ArrayInheritanceTest from './collections/ArrayInheritanceTest.test'
import MapInheritanceTest from './collections/MapInheritanceTest.test'
import SetInheritanceTest from './collections/SetInheritanceTest.test'
import BitVectorTest from './bitVector/BitVectorTest.test'
import ArrayBufferTest from './arrayBuffer/ArrayBufferTest.test'
import ContainerComboTest from './collections/ContainerComboTest.test'
import ConcurrentFactorComboTest from './collections/ConcurrentFactorComboTest.test'
import RealWorldComboTest from './collections/RealWorldComboTest.test'
import StressStabilityComboTest from './collections/StressStabilityComboTest.test'
import ConcatArrayImplTest from './concatArray/ConcatArrayImplTest.test'
import ConcatArrayConcurrentTest from './concatArray/ConcatArrayConcurrentTest.test'
import FloatArrayTest from './floatArray/FloatArrayTest.test'
import IntByteArrayTest from './intArray/IntByteArrayTest.test'
import IntShortArrayTest from './intArray/IntShortArrayTest.test'
import IntIntArrayTest from './intArray/IntIntArrayTest.test'
import UintByteArrayTest from './intArray/UintByteArrayTest.test'
import UintByteClampedArrayCtorTest from './uintArray/UintByteClampedArrayCtorTest.test'
import UintByteClampedArrayMethodTest from './uintArray/UintByteClampedArrayMethodTest.test'
import UintByteClampedArrayConcurrentTest from './uintArray/UintByteClampedArrayConcurrentTest.test'
import UintShortArrayTest from './uintArray/UintShortArrayTest.test'
import UintIntArrayTest from './uintArray/UintIntArrayTest.test'
import sendableLruCacheBasicTest from './SendableLruCacheBase/SendableLruCacheBasicTypes.test';
import sendableLruCacheBoundaryTest from './SendableLruCacheBase/SendableLruCacheBoundaryCases.test';
import sendableLruCacheCompositeTest from './SendableLruCacheBase/SendableLruCacheComplexTypes.test';
import sendableLruCacheErrorTest from './SendableLruCacheBase/SendableLruCacheError.test';
import sendableLruCacheSpecialTest from './SendableLruCacheBase/SendableLruCacheSpecial.test';
import sendableLruCacheNullableTest from './SendableLruCacheBase/SendableLruCacheNullableTest.test';
import collectionsConcatArrayTest from './CollectionsConcatArrayTest/CollectionsConcatArray.test';
import sendableLruCacheBatch1Test from './SendableLruCacheBase/SendableLruCacheSendableSpecial/Batch1.test';
import sendableLruCacheBatch2Test from './SendableLruCacheBase/SendableLruCacheSendableSpecial/Batch2.test';
import sendableLruCacheBatch3Test from './SendableLruCacheBase/SendableLruCacheSendableSpecial/Batch3.test';
import sendableLruCacheBatch4Test from './SendableLruCacheBase/SendableLruCacheSendableSpecial/Batch4.test';
import sendableLruCacheConcurrentTest from './SendableLruCacheConcurrent/SendableLruCacheConcurrent.test';
import CollectionsConcatArrayExpand1024Test from './concatArray/CollectionsConcatArrayExpand1024Test.test';
import SendableLruCacheExpand1024Test from './SendableLruCacheConcurrent/SendableLruCacheExpand1024Test.test';
import SendableExpand1024Test from './SendableLruCacheConcurrent/SendableExpand1024Test.test';
export default function testsuite(): void {
  StressStabilityComboTest()
  BitVectorTest()
  ArrayBufferTest()
  ArrayInheritanceTest()
  MapInheritanceTest()
  SetInheritanceTest()
  ContainerComboTest()
  ConcurrentFactorComboTest() 
  RealWorldComboTest()
  ConcatArrayImplTest()
  ConcatArrayConcurrentTest()
  FloatArrayTest()
  IntByteArrayTest()
  IntShortArrayTest()
  IntIntArrayTest()
  UintByteArrayTest()
  UintByteClampedArrayCtorTest()
  UintByteClampedArrayMethodTest()
  UintByteClampedArrayConcurrentTest()
  UintShortArrayTest()
  UintIntArrayTest()
  
  sendableLruCacheBasicTest();
  sendableLruCacheBoundaryTest();
  sendableLruCacheCompositeTest();
  sendableLruCacheErrorTest();
  sendableLruCacheSpecialTest();
  sendableLruCacheNullableTest();
  sendableLruCacheBatch1Test();
  sendableLruCacheBatch2Test();
  sendableLruCacheBatch3Test();
  sendableLruCacheBatch4Test();
  sendableLruCacheConcurrentTest();
  collectionsConcatArrayTest();
  
  CollectionsConcatArrayExpand1024Test();
  SendableLruCacheExpand1024Test();
  SendableExpand1024Test();
}