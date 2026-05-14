/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
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
}
