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
import CollectionsArrayExpand1024Test from './CollectionsArrayExpand1024Test.test';
import TypedArrayExpand1024Test from './TypedArrayExpand1024Test.test';
import CollectionsArrayContainsAllSendableTest from './CollectionsArrayContainsAllSendableTest.test';
import CollectionsArrayContainsAllBuiltinTest from './CollectionsArrayContainsAllBuiltinTest.test';
import CollectionsArrayRetainAllSendableTest from './CollectionsArrayRetainAllSendableTest.test';
import CollectionsArrayRetainAllBuiltinTest from './CollectionsArrayRetainAllBuiltinTest.test';
import CollectionsArrayRetainAllPredicateTest from './CollectionsArrayRetainAllPredicateTest.test';

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
import arrayContainsRetainAllSuite from './CollectionsArrayBaseTest/ArrayContainsRetainAll.test';
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

import ArrayAddTest from './ArrayAdd.test';
import ArrayBasicTest from './ArrayBasic.test';
import ArrayCompleteTest from './ArrayComplete.test';
import ArrayConcurrentTest from './ArrayConcurrent.test';
import ArrayExtendedTest from './ArrayExtended.test';
import CollectionsArrayAtTestTest from './All/CollectionsArrayAtTest.test';
import CollectionsArrayCombinationTestErrTest from './All/CollectionsArrayCombinationTestErr.test';
import CollectionsArrayErrorPathTest from './All/CollectionsArrayErrorPathTest.test';
import CollectionsArrayConcatTestTest from './All/CollectionsArrayConcatTest.test';
import CollectionsArrayConstructorTestTest from './All/CollectionsArrayConstructorTest.test';
import CollectionsArrayCopyWithinTestTest from './All/CollectionsArrayCopyWithinTest.test';
import CollectionsArrayEntriesTestTest from './All/CollectionsArrayEntriesTest.test';
import CollectionsArrayEveryTestTest from './All/CollectionsArrayEveryTest.test';
import CollectionsArrayFillsTestTest from './All/CollectionsArrayFillsTest.test';
import CollectionsArrayFiltersTestTest from './All/CollectionsArrayFiltersTest.test';
import CollectionsArrayFindsIndexTestTest from './All/CollectionsArrayFindsIndexTest.test';
import CollectionsArrayFindsTestTest from './All/CollectionsArrayFindsTest.test';
import CollectionsArrayFlatMapTestTest from './All/CollectionsArrayFlatMapTest.test';
import CollectionsArrayFlatTestTest from './All/CollectionsArrayFlatTest.test';
import CollectionsArrayForEachTestTest from './All/CollectionsArrayForEachTest.test';
import CollectionsArrayIncludesTestTest from './All/CollectionsArrayIncludesTest.test';
import CollectionsArrayIndexOfTest from './All/CollectionsArrayIndexOfTest.test';
import CollectionsArrayIsArrayTest from './All/CollectionsArrayIsArray.test';
import CollectionsArrayJoinTestTest from './All/CollectionsArrayJoinTest.test';
import CollectionsArrayKeysTestTest from './All/CollectionsArrayKeysTest.test';
import CollectionsArrayLastIndexOfTestTest from './All/CollectionsArrayLastIndexOfTest.test';
import CollectionsArrayMapTestTest from './All/CollectionsArrayMapTest.test';
import CollectionsArrayOfTest from './All/CollectionsArrayOf.test';
import CollectionsArrayPopTest from './All/CollectionsArrayPop.test';
import CollectionsArrayPushTest from './All/CollectionsArrayPush.test';
import CollectionsArrayReduceRightTestTest from './All/CollectionsArrayReduceRightTest.test';
import CollectionsArrayReduceTestTest from './All/CollectionsArrayReduceTest.test';
import CollectionsArrayReverseTestTest from './All/CollectionsArrayReverseTest.test';
import CollectionsArrayShiftTest from './All/CollectionsArrayShift.test';
import CollectionsArraySliceTest from './All/CollectionsArraySliceTest.test';
import CollectionsArraySomeTest from './All/CollectionsArraySomeTest.test';
import CollectionsArraySortsTestTest from './All/CollectionsArraySortsTest.test';
import CollectionsArraySplicesTestTest from './All/CollectionsArraySplicesTest.test';
import CollectionsArrayToLocaleStringTestTest from './All/CollectionsArrayToLocaleStringTest.test';
import CollectionsArrayToStringTestTest from './All/CollectionsArrayToStringTest.test';
import CollectionsArrayUnshiftTest from './All/CollectionsArrayUnshift.test';
import CollectionsArrayValuesTest from './All/CollectionsArrayValues.test';
import CollectionsConcatArrayIndexTestTest from './All/CollectionsConcatArrayIndexTest.test';
import CollectionsConcatArrayJoinTestTest from './All/CollectionsConcatArrayJoinTest.test';
import CollectionsConcatArrayLengthTestTest from './All/CollectionsConcatArrayLengthTest.test';
import CollectionsConcatArraySliceTestTest from './All/CollectionsConcatArraySliceTest.test';
import ArrayConcurrentTestConcurrent from './Concurrent/ArrayConcurrent.test';
import ArrayNormalTest from './Normal/ArrayNormal.test';
import ConcatArrayNormalTest from './Normal/ConcatArrayNormal.test';
import ArrayTaskPoolTest from './TaskPool/ArrayTaskPool.test';
import ConcatArrayTaskPoolTest from './TaskPool/ConcatArrayTaskPool.test';

import ConcatArrayImplTest from './concatArray/ConcatArrayImplTest.test'
import ConcatArrayConcurrentTest from './concatArray/ConcatArrayConcurrentTest.test'
import concatArrayBigintTest from './concatArray/Typetest/ConcatArrayBigintTest.test';
import concatArrayBooleanTest from './concatArray/Typetest/ConcatArrayBooleanTest.test';
import concatArrayDateTest from './concatArray/Typetest/ConcatArrayDateTest.test';
import concatArrayFunctionTest from './concatArray/Typetest/ConcatArrayFunctionTest.test';
import concatArrayMapTest from './concatArray/Typetest/ConcatArrayMapTest.test';
import concatArrayNestedTest from './concatArray/Typetest/ConcatArrayNestedTest.test';
import concatArrayNumberTest from './concatArray/Typetest/ConcatArrayNumberTest.test';
import concatArrayObjectTest from './concatArray/Typetest/ConcatArrayObjectTest.test';
import concatArrayRegExpTest from './concatArray/Typetest/ConcatArrayRegExpTest.test';
import concatArraySetTest from './concatArray/Typetest/ConcatArraySetTest.test';
import concatArrayStringTest from './concatArray/Typetest/ConcatArrayStringTest.test';
import concatArrayUnionTest from './concatArray/Typetest/ConcatArrayUnionTest.test';


import CollectionsConcatArrayExpand1024Test from './concatArray/CollectionsConcatArrayExpand1024Test.test';

import collectionsConcatArrayTest from './CollectionsConcatArrayTest/CollectionsConcatArray.test';

import ArrayInheritanceTest from './collections/ArrayInheritanceTest.test';
import ContainerComboTest from './collections/ContainerComboTest.test'
import ConcurrentFactorComboTest from './collections/ConcurrentFactorComboTest.test'
import RealWorldComboTest from './collections/RealWorldComboTest.test'
import StressStabilityComboTest from './collections/StressStabilityComboTest.test'
import CollectionsArrayConcurrentStrictTest from './All/CollectionsArrayConcurrentStrictTest.test';
import CollectionsArrayForEachEdgeTest from './All/CollectionsArrayForEachEdgeTest.test';
import CollectionsArrayReduceEdgeTest from './All/CollectionsArrayReduceEdgeTest.test';
import CollectionsArrayStabilityTest from './All/CollectionsArrayStabilityTest.test';
import CollectionsReceiverTypeCheckTest from './All/CollectionsReceiverTypeCheckTest.test';
import CollectionsArrayThisArgTest from './All/CollectionsArrayThisArgTest.test';

export default function testsuite() {
  CollectionsArrayCombinationTest();
  CollectionsArrayCombinationSecondTest();
  CollectionsArrayCombinationThirdTest();
  CollectionsArrayCombinationFourthTest();
  CollectionsArraySupplementTest();
  CollectionsArrayExpand1024Test();
  TypedArrayExpand1024Test();
  CollectionsArrayContainsAllSendableTest();
  CollectionsArrayContainsAllBuiltinTest();
  CollectionsArrayRetainAllSendableTest();
  CollectionsArrayRetainAllBuiltinTest();
  CollectionsArrayRetainAllPredicateTest();
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
  arrayContainsRetainAllSuite();
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

  ArrayAddTest();
  ArrayBasicTest();
  ArrayCompleteTest();
  ArrayConcurrentTest();
  ArrayExtendedTest();
  CollectionsArrayAtTestTest();
  CollectionsArrayCombinationTestErrTest();
  CollectionsArrayErrorPathTest();
  CollectionsArrayConcatTestTest();
  CollectionsArrayConstructorTestTest();
  CollectionsArrayCopyWithinTestTest();
  CollectionsArrayEntriesTestTest();
  CollectionsArrayEveryTestTest();
  CollectionsArrayFillsTestTest();
  CollectionsArrayFiltersTestTest();
  CollectionsArrayFindsIndexTestTest();
  CollectionsArrayFindsTestTest();
  CollectionsArrayFlatMapTestTest();
  CollectionsArrayFlatTestTest();
  CollectionsArrayForEachTestTest();
  CollectionsArrayIncludesTestTest();
  CollectionsArrayIndexOfTest();
  CollectionsArrayIsArrayTest();
  CollectionsArrayJoinTestTest();
  CollectionsArrayKeysTestTest();
  CollectionsArrayLastIndexOfTestTest();
  CollectionsArrayMapTestTest();
  CollectionsArrayOfTest();
  CollectionsArrayPopTest();
  CollectionsArrayPushTest();
  CollectionsArrayReduceRightTestTest();
  CollectionsArrayReduceTestTest();
  CollectionsArrayReverseTestTest();
  CollectionsArrayShiftTest();
  CollectionsArraySliceTest();
  CollectionsArraySomeTest();
  CollectionsArraySortsTestTest();
  CollectionsArraySplicesTestTest();
  CollectionsArrayToLocaleStringTestTest();
  CollectionsArrayToStringTestTest();
  CollectionsArrayUnshiftTest();
  CollectionsArrayValuesTest();
  CollectionsConcatArrayIndexTestTest();
  CollectionsConcatArrayJoinTestTest();
  CollectionsConcatArrayLengthTestTest();
  CollectionsConcatArraySliceTestTest();
  ArrayConcurrentTestConcurrent();
  ArrayNormalTest();
  ConcatArrayNormalTest();
  ArrayTaskPoolTest();
  ConcatArrayTaskPoolTest();
  
  ConcatArrayImplTest();
  ConcatArrayConcurrentTest();
  concatArrayBigintTest();
  concatArrayBooleanTest();
  concatArrayDateTest();
  concatArrayFunctionTest();
  concatArrayMapTest();
  concatArrayNestedTest();
  concatArrayNumberTest();
  concatArrayObjectTest();
  concatArrayRegExpTest();
  concatArraySetTest();
  concatArrayStringTest();
  concatArrayUnionTest();
  CollectionsConcatArrayExpand1024Test();
  
  collectionsConcatArrayTest();
  
  StressStabilityComboTest();
  ArrayInheritanceTest();
  ContainerComboTest();
  ConcurrentFactorComboTest();
  RealWorldComboTest();
  CollectionsArrayConcurrentStrictTest();
  CollectionsArrayForEachEdgeTest();
  CollectionsArrayReduceEdgeTest();
  CollectionsArrayStabilityTest();
  CollectionsReceiverTypeCheckTest();
  CollectionsArrayThisArgTest();
};
