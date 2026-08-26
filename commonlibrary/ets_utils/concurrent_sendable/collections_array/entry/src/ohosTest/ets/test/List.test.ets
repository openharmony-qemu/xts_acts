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

import CollectionsArrayCombinationTest from './CollectionsArrayCombinationTest.test';
import CollectionsArrayCombinationSecondTest from './CollectionsArrayCombinationSecondTest.test';
import CollectionsArrayCombinationThirdTest from './CollectionsArrayCombinationThirdTest.test';
import CollectionsArrayCombinationFourthTest from './CollectionsArrayCombinationFourthTest.test';
import CollectionsArraySupplementTest from './CollectionsArraySupplementTest.test';
import CollectionsArrayApisTest from './CollectionsArrayApisTest.test';

import arrayConstructorSuite from './CollectionsArrayBaseTest/ArrayConstructor.test';
import arrayTraversalSuite from './CollectionsArrayBaseTest/ArrayTraversal.test';
import arrayQuerySuite from './CollectionsArrayBaseTest/ArrayQuery.test';
import arrayOperationSuite from './CollectionsArrayBaseTest/ArrayOperation.test';
import arrayTransformSuite from './CollectionsArrayBaseTest/ArrayTransform.test';
import arrayIndexAccessSuite from './CollectionsArrayBaseTest/ArrayIndexAccess.test';
import arrayModifySuite from './CollectionsArrayBaseTest/ArrayModify.test';
import arrayInheritanceSuite from './CollectionsArrayBaseTest/ArrayInheritance.test';
import arrayAnnotationSuite from './CollectionsArrayBaseTest/ArrayAnnotation.test';
import arrayConcurrentSuite from './CollectionsArrayBaseTest/ArrayConcurrent.test';
import arrayConcurrentCreateFromTest from './CollectionsArrayConcurrentTest/ArrayConcurrentCreateFromTest.test';
import arrayConcurrentDataTypeTest from './CollectionsArrayConcurrentTest/ArrayConcurrentDataTypeTest.test';
import arrayConcurrentFillCopyWithinTest from './CollectionsArrayConcurrentTest/ArrayConcurrentFillCopyWithinTest.test';
import arrayConcurrentForEachModifyTest from './CollectionsArrayConcurrentTest/ArrayConcurrentForEachModifyTest.test';
import arrayConcurrentForEachTest from './CollectionsArrayConcurrentTest/ArrayConcurrentForEachTest.test';
import arrayConcurrentIteratorModifyTest from './CollectionsArrayConcurrentTest/ArrayConcurrentIteratorModifyTest.test';
import arrayConcurrentIteratorsTest from './CollectionsArrayConcurrentTest/ArrayConcurrentIteratorsTest.test';
import arrayConcurrentLargeArrayTest from './CollectionsArrayConcurrentTest/ArrayConcurrentLargeArrayTest.test';
import arrayConcurrentLockTest from './CollectionsArrayConcurrentTest/ArrayConcurrentLockTest.test';
import arrayConcurrentNoLockTest from './CollectionsArrayConcurrentTest/ArrayConcurrentNoLockTest.test';
import arrayConcurrentPushPopTest from './CollectionsArrayConcurrentTest/ArrayConcurrentPushPopTest.test';
import arrayConcurrentQueryFindTest from './CollectionsArrayConcurrentTest/ArrayConcurrentQueryFindTest.test';
import arrayConcurrentQueryIndexOfTest from './CollectionsArrayConcurrentTest/ArrayConcurrentQueryIndexOfTest.test';
import arrayConcurrentSendableDataTest from './CollectionsArrayConcurrentTest/ArrayConcurrentSendableDataTest.test';
import arrayConcurrentSortReverseTest from './CollectionsArrayConcurrentTest/ArrayConcurrentSortReverseTest.test';
import arrayConcurrentSpliceTest from './CollectionsArrayConcurrentTest/ArrayConcurrentSpliceTest.test';
import arrayConcurrentTraverseModifyTest from './CollectionsArrayConcurrentTest/ArrayConcurrentTraverseModifyTest.test';
import arrayConcurrentUnshiftShiftTest from './CollectionsArrayConcurrentTest/ArrayConcurrentUnshiftShiftTest.test';
export default function testsuite() {
  CollectionsArrayCombinationTest();
  CollectionsArrayCombinationSecondTest();
  CollectionsArrayCombinationThirdTest();
  CollectionsArrayCombinationFourthTest();
  CollectionsArraySupplementTest();
  CollectionsArrayApisTest();
  
  arrayConstructorSuite();
  arrayTraversalSuite();
  arrayQuerySuite();
  arrayOperationSuite();
  arrayTransformSuite();
  arrayIndexAccessSuite();
  arrayModifySuite();
  arrayInheritanceSuite();
  arrayAnnotationSuite();
  arrayConcurrentSuite();
  arrayConcurrentCreateFromTest();
  arrayConcurrentDataTypeTest();
  arrayConcurrentFillCopyWithinTest();
  arrayConcurrentForEachModifyTest();
  arrayConcurrentForEachTest();
  arrayConcurrentIteratorModifyTest();
  arrayConcurrentIteratorsTest();
  arrayConcurrentLargeArrayTest();
  arrayConcurrentLockTest();
  arrayConcurrentNoLockTest();
  arrayConcurrentPushPopTest();
  arrayConcurrentQueryFindTest();
  arrayConcurrentQueryIndexOfTest();
  arrayConcurrentSendableDataTest();
  arrayConcurrentSortReverseTest();
  arrayConcurrentSpliceTest();
  arrayConcurrentTraverseModifyTest();
  arrayConcurrentUnshiftShiftTest();
};

