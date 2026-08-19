'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import float64ArrayBehaviorTest from './float64array/Float64ArrayBehaviorTest.test';
import float64ArrayBoundaryNumericTest from './float64array/Float64ArrayBoundaryNumericTest.test';
import float64ArrayChainBusinessTest from './float64array/Float64ArrayChainBusinessTest.test';
import float64ArrayContractErrorTest from './float64array/Float64ArrayContractErrorTest.test';
import float64ArrayCoverageExpansionTest from './float64array/Float64ArrayCoverageExpansionTest.test';
import float64ArrayIteratorTest from './float64array/Float64ArrayIteratorTest.test';
import float64ArrayPropertyTest from './float64array/Float64ArrayPropertyTest.test';
import float64ArrayViewBufferTest from './float64array/Float64ArrayViewBufferTest.test';
import float64ArrayChainExtension1Test from './float64array/Float64ArrayChainExtension1Test.test';
import float64ArrayChainExtension2Test from './float64array/Float64ArrayChainExtension2Test.test';
import float64ArrayCoverageTest from './float64array/Float64ArrayCoverageTest.test';
import float64ArrayBracketAccessTest from './float64array/Float64ArrayBracketAccessTest.test';
import float64ArrayDimensionTest from './float64array/Float64ArrayDimensionTest.test';
import float64ArrayMiscellaneousTest from './float64array/Float64ArrayMiscellaneousTest.test';
import float64ArrayProperty2Test from './float64array/Float64ArrayProperty2Test.test';
 import float64ArraySupplementaryTest from './float64array/Float64ArraySupplementaryTest.test';
import float64ArrayTruncationAlignmentTest from './float64array/Float64ArrayTruncationAlignmentTest.test';
import float64ArrayViewExtensionTest from './float64array/Float64ArrayViewExtensionTest.test';
import float64ArrayValueExpansionTest from './float64array/Float64ArrayValueExpansionTest.test';
import float64ArrayErrorAtomicityTest from './float64array/Float64ArrayErrorAtomicityTest.test';
import float64ArrayReturnChainTest from './float64array/Float64ArrayReturnChainTest.test';
import float64ArrayCallbackMutationTest from './float64array/Float64ArrayCallbackMutationTest.test';

export default function testsuite(): void {
  float64ArrayBehaviorTest();
  float64ArrayBoundaryNumericTest();
  float64ArrayChainBusinessTest();
  float64ArrayContractErrorTest();
  float64ArrayCoverageExpansionTest();
  float64ArrayIteratorTest();
  float64ArrayPropertyTest();
  float64ArrayViewBufferTest();
  float64ArrayMiscellaneousTest();
  float64ArrayBracketAccessTest();
  float64ArrayDimensionTest();
  float64ArraySupplementaryTest();
  float64ArrayViewExtensionTest();
  float64ArrayCoverageTest();
  float64ArrayChainExtension1Test();
  float64ArrayChainExtension2Test();
  float64ArrayProperty2Test();
  float64ArrayTruncationAlignmentTest();
  float64ArrayValueExpansionTest();
  float64ArrayErrorAtomicityTest();
  float64ArrayReturnChainTest();
  float64ArrayCallbackMutationTest();
 }
