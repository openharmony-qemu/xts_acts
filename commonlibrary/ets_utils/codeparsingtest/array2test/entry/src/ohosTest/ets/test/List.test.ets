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
import ArraySliceTestSupplement from './array/Array_Slice/ArraySliceTest.test';
import ArraySpliceMindMapTest from './array/Array_Splice/ArraySpliceTest.test';
import ArraySomeMindMapTest from './array/Array_Some/ArraySomeTest.test';
import ArraySortMindMapTest from './array/Array_Sort/ArraySortTest.test';
import ArrayToLocaleStringMindMapTest from './array/Array_ToLocaleString/ToLocaleString.test';
import ArrayToReversedMindMapTest from './array/Array_ToReversed/ToReversed.test';
import ArrayToSortedMindMapTest from './array/Array_ToSorted/ToSorted.test';
import ArrayToSplicedMindMapTest from './array/Array_ToSpliced/ToSpliced.test';
import ArrayToStringMindMapTest from './array/Array_ToString/ToString.test';
import ArrayUnshiftMindMapTest from './array/Array_Unshift/Unshift.test';
import ArrayValuesTestSupplement from './array/Array_Prototype_Values/ArrayValuesTest.test';
import ArrayWithTestSupplement from './array/Array_Prototype_With/ArrayWithTest.test';
import ArraySymbolIteratorTestSupplement from './array/Array_Prototype_Symbol_Iterator/ArraySymbolIteratorTest.test';
import ArraySymbolUnscopables1TestSupplement from './array/Array_Prototype_Symbol_Unscopables/ArraySymbolUnscopables1Test.test';
import ArraySymbolUnscopables2TestSupplement from './array/Array_Prototype_Symbol_Unscopables/ArraySymbolUnscopables2Test.test';
import ArraySymbolSpeciesTestSupplement from './array/Array_Prototype_Symbol_Species/ArraySymbolSpeciesTest.test';

import BuiltinsArrayPrototypeForEachMissingTest from './Array2/Array_PrototypeForEach/BuiltinsArrayPrototypeForEachMissingTest.test';
import BuiltinsArrayPrototypeForEachTest from './Array2/Array_PrototypeForEach/BuiltinsArrayPrototypeForEachTest.test';
import BuiltinsArrayIncludesExtendedTest from './Array2/Array_PrototypeIncludes/BuiltinsArrayIncludesExtendedTest.test';
import BuiltinsArrayIncludesTest from './Array2/Array_PrototypeIncludes/BuiltinsArrayIncludesTest.test';
import BuiltinsArrayIndexOfTest from './Array2/Array_PrototypeIndexOf/BuiltinsArrayIndexOfTest.test';
import BuiltinsArrayIndexOfMissingTest from './Array2/Array_PrototypeIndexOf/BuiltinsArrayIndexOfMissingTest.test';
import BuiltinsArrayPrototypeJoinTest from './Array2/Array_PrototypeJoin/BuiltinsArrayPrototypeJoinTest.test';
import BuiltinsArrayPrototypeJoinExtendedTest from './Array2/Array_PrototypeJoin/BuiltinsArrayPrototypeJoinExtendedTest.test';

import BuiltinsArrayPrototypeLastIndexOfTest from './Array2/Array_Prototype_LastIndexOf/BuiltinsArrayLastIndexOfTest.test'
import BuiltinsArrayPrototypeLastIndexOfJsTest from './Array2/Array_Prototype_LastIndexOf/BuiltinsArrayLastIndexOfJsTest.test'
import BuiltinsArrayPrototypeReduceTest from './Array2/Array_Prototype_Reduce/BuiltinsArrayReduceTest.test'
import BuiltinsArrayPrototypeReduceJsTest from './Array2/Array_Prototype_Reduce/BuiltinsArrayReduceJsTest.test'
import BuiltinsArrayPrototypeReduceSecTest from './Array2/Array_Prototype_Reduce/BuiltinsArrayReduceSecTest.test'
import BuiltinsArrayPrototypeReduceJsSecTest from './Array2/Array_Prototype_Reduce/BuiltinsArrayReduceJsSecTest.test'

import BuiltinsArrayReduceRightTest from './Array2/reduceRight/BuiltinsArrayReduceRightTest.test'
import BuiltinsArrayReduceRightExtendedTest from './Array2/reduceRight/BuiltinsArrayReduceRightExtendedTest.test'
import BuiltinsArrayReduceRightHybridTest from './Array2/reduceRight/BuiltinsArrayReduceRightHybridTest.test'
import BuiltinsArrayShiftTest from './Array2/shift/BuiltinsArrayShiftTest.test'
import BuiltinsArrayShiftExtendedTest from './Array2/shift/BuiltinsArrayShiftExtendedTest.test'
import BuiltinsArrayShiftAdditionalTest from './Array2/shift/BuiltinsArrayShiftAdditionalTest.test'

import BuiltinsArrayOfTest from './Array2/Array_Of/BuiltinsArrayOfTest.test';
import BuiltinsArrayOfExtendedTest from './Array2/Array_Of/BuiltinsArrayOfExtendedTest.test';
import BuiltinsArrayKeysTest from './Array2/Array_Keys/BuiltinsArrayKeysTest.test';
import BuiltinsArrayKeysExtendedTest from './Array2/Array_Keys/BuiltinsArrayKeysExtendedTest.test';
import BuiltinsArrayReverseTest from './Array2/Array_Reverse/BuiltinsArrayReverseTest.test';
import BuiltinsArrayReverseExtendedTest from './Array2/Array_Reverse/BuiltinsArrayReverseExtendedTest.test';

import BuiltinsArrayPrototypeMapTest from './Array2/Array_PrototypeMap/BuiltinsArrayPrototypeMapTest.test';
import BuiltinsArrayPrototypeMapExtendedTest from './Array2/Array_PrototypeMap/BuiltinsArrayPrototypeMapExtendedTest.test';
import BuiltinsArrayPrototypePopTest from './Array2/Array_PrototypePop/BuiltinsArrayPrototypePopTest.test';
import BuiltinsArrayPrototypePopExtendedTest from './Array2/Array_PrototypePop/BuiltinsArrayPrototypePopExtendedTest.test';
import BuiltinsArrayPrototypePushTest from './Array2/Array_PrototypePush/BuiltinsArrayPrototypePushTest.test';
import BuiltinsArrayPrototypePushExtendedTest from './Array2/Array_PrototypePush/BuiltinsArrayPrototypePushExtendedTest.test';

export default function testsuite() {
  ArraySliceTestSupplement();
  ArraySpliceMindMapTest();
  ArraySomeMindMapTest();
  ArraySortMindMapTest();
  ArrayToLocaleStringMindMapTest();
  ArrayToReversedMindMapTest();
  ArrayToSortedMindMapTest();
  ArrayToSplicedMindMapTest();
  ArrayToStringMindMapTest();
  ArrayUnshiftMindMapTest();
  ArrayValuesTestSupplement();
  ArrayWithTestSupplement();
  ArraySymbolIteratorTestSupplement();
  ArraySymbolUnscopables1TestSupplement();
  ArraySymbolUnscopables2TestSupplement();
  ArraySymbolSpeciesTestSupplement();

  BuiltinsArrayPrototypeForEachTest()
  BuiltinsArrayPrototypeForEachMissingTest()
  BuiltinsArrayIncludesTest()
  BuiltinsArrayIncludesExtendedTest()
  BuiltinsArrayIndexOfTest()
  BuiltinsArrayIndexOfMissingTest()
  BuiltinsArrayPrototypeJoinTest()
  BuiltinsArrayPrototypeJoinExtendedTest()

  BuiltinsArrayPrototypeLastIndexOfTest()
  BuiltinsArrayPrototypeLastIndexOfJsTest()
  BuiltinsArrayPrototypeReduceTest()
  BuiltinsArrayPrototypeReduceSecTest()
  BuiltinsArrayPrototypeReduceJsTest()
  BuiltinsArrayPrototypeReduceJsSecTest()

  BuiltinsArrayReduceRightTest()
  BuiltinsArrayReduceRightExtendedTest()
  BuiltinsArrayReduceRightHybridTest()
  BuiltinsArrayReverseTest()
  BuiltinsArrayReverseExtendedTest()
  BuiltinsArrayShiftTest()
  BuiltinsArrayShiftExtendedTest()
  BuiltinsArrayShiftAdditionalTest()

  BuiltinsArrayOfTest()
  BuiltinsArrayOfExtendedTest()
  BuiltinsArrayKeysTest()
  BuiltinsArrayKeysExtendedTest()
  BuiltinsArrayReverseTest()
  BuiltinsArrayReverseExtendedTest()

  BuiltinsArrayPrototypeMapTest()
  BuiltinsArrayPrototypeMapExtendedTest()
  BuiltinsArrayPrototypePopTest()
  BuiltinsArrayPrototypePopExtendedTest()
  BuiltinsArrayPrototypePushTest()
  BuiltinsArrayPrototypePushExtendedTest();
};

