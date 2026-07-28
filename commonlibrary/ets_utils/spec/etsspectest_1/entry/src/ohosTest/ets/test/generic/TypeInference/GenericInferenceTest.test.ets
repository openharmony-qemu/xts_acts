/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium';
import {
  testSingleParamInferenceNumber,
  testSingleParamInferenceString,
  testMultiParamInferenceKey,
  testMultiParamInferenceValue,
  testConstructorInferenceExplicit,
  testConstructorInferenceInferred,
  testMethodInference,
  testLiteralWideningNumber,
  testLiteralWideningString,
  testArrayElementInferenceNumber,
  testArrayElementInferenceString,
  testNestedInference,
  testCallbackContextualInferenceString,
  testCallbackContextualInferenceNumber,
  testConstraintSubtypeInferenceId,
  testConstraintSubtypeInferenceName,
  testConflictingCandidateInferenceNumber,
  testConflictingCandidateInferenceString,
  testExplicitVsInferenceNumber,
  testExplicitVsInferenceString
} from './genericInferenceTsHelper'

export default function GenericInferenceTest() {
  describe('GenericInferenceTest', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0100
     * @tc.name      testSingleParamInference0001
     * @tc.desc      Verify single parameter type inference with number argument (GTP-IN-001)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSingleParamInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testSingleParamInferenceNumber()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0200
     * @tc.name      testSingleParamInference0002
     * @tc.desc      Verify single parameter type inference with string argument (GTP-IN-001)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSingleParamInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testSingleParamInferenceString()).assertEqual('hello')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0300
     * @tc.name      testMultiParamInference0001
     * @tc.desc      Verify multiple type parameters independently inferred - key type (GTP-IN-002)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMultiParamInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testMultiParamInferenceKey()).assertEqual('age')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0400
     * @tc.name      testMultiParamInference0002
     * @tc.desc      Verify multiple type parameters independently inferred - value type (GTP-IN-002)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMultiParamInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testMultiParamInferenceValue()).assertEqual(30)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0500
     * @tc.name      testConstructorInference0001
     * @tc.desc      Verify generic class constructor type inference with explicit type annotation (GTP-IN-003)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstructorInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testConstructorInferenceExplicit()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0600
     * @tc.name      testConstructorInference0002
     * @tc.desc      Verify generic class constructor type inference with inferred type (GTP-IN-003)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstructorInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testConstructorInferenceInferred()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0700
     * @tc.name      testMethodInference0001
     * @tc.desc      Verify generic method type inference — T inferred from argument 'test' (GTP-IN-004)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testMethodInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testMethodInference()).assertEqual('test')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0800
     * @tc.name      testLiteralWidening0001
     * @tc.desc      Verify number literal widens to number via assignment in .ts helper (GTP-IN-005). Runtime assertion alone insufficient; widening verified by .ts compile-time assignment `let widened: number = identity(42)`.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLiteralWidening0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testLiteralWideningNumber()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_0900
     * @tc.name      testLiteralWidening0002
     * @tc.desc      Verify string literal widens to string via assignment in .ts helper (GTP-IN-005). Runtime assertion alone insufficient; widening verified by .ts compile-time assignment `let widened: string = identity('literal')`.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLiteralWidening0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testLiteralWideningString()).assertEqual('literal')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1000
     * @tc.name      testArrayElementInference0001
     * @tc.desc      Verify T inferred from number array elements (GTP-IN-006)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayElementInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testArrayElementInferenceNumber()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1100
     * @tc.name      testArrayElementInference0002
     * @tc.desc      Verify T inferred from string array elements (GTP-IN-006)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayElementInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testArrayElementInferenceString()).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1200
     * @tc.name      testNestedInference0001
     * @tc.desc      Verify T inferred from nested generic Box<number> parameter (GTP-IN-007)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNestedInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testNestedInference()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1300
     * @tc.name      testCallbackContextualInference0001
     * @tc.desc      Verify callback contextual inference — lambda (x) => x.toString() infers x: number, return string from apply<T,R> context (GTP-IN-008)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackContextualInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testCallbackContextualInferenceString()).assertEqual('42')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1400
     * @tc.name      testCallbackContextualInference0002
     * @tc.desc      Verify callback contextual inference — lambda (x) => x * 2 infers x: number, return number from apply<T,R> context (GTP-IN-008)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCallbackContextualInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testCallbackContextualInferenceNumber()).assertEqual(20)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1500
     * @tc.name      testConstraintSubtypeInference0001
     * @tc.desc      Verify constraint participates in inference - id property preserved (GTP-IN-009)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintSubtypeInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testConstraintSubtypeInferenceId()).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1600
     * @tc.name      testConstraintSubtypeInference0002
     * @tc.desc      Verify constraint participates in inference - T preserved as EntityWithName, name read from return (GTP-IN-009)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConstraintSubtypeInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testConstraintSubtypeInferenceName()).assertEqual('test')
    })


    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1700
     * @tc.name      testConflictingCandidateInference0001
     * @tc.desc      Verify inference from multiple parameters infers same number type (GTP-IN-011). True conflicting-candidate test requires static compile-time verification; this positive case confirms multi-param inference works.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConflictingCandidateInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testConflictingCandidateInferenceNumber()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1800
     * @tc.name      testConflictingCandidateInference0002
     * @tc.desc      Verify inference from multiple parameters infers same string type (GTP-IN-011). True conflicting-candidate test requires static compile-time verification.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testConflictingCandidateInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testConflictingCandidateInferenceString()).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_1900
     * @tc.name      testExplicitVsInference0001
     * @tc.desc      Verify explicit type argument <number> in identity<number>(42) — explicit type arg invocation (GTP-IN-012)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitVsInference0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testExplicitVsInferenceNumber()).assertEqual(42)
    })

    /**
     * @tc.number    SUB_GENERIC_IN_INFERENCE_2000
     * @tc.name      testExplicitVsInference0002
     * @tc.desc      Verify explicit type argument <string> in identity<string>('hello') — explicit type arg invocation (GTP-IN-012)
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testExplicitVsInference0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(testExplicitVsInferenceString()).assertEqual('hello')
    })
  })
}