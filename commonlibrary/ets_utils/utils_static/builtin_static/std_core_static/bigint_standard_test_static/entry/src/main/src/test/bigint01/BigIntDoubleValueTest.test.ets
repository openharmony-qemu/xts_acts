'use static'
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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntDoubleValueTest(): void {
  describe('BigInt.doubleValue (mindmap doubleValue)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0100
     * @tc.name testBigIntDoubleValueSigns0100
     * @tc.desc Verify doubleValue for positive, negative, and zero BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSigns0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).doubleValue()).assertEqual(42.0);
      expect(BigInt(1).doubleValue()).assertEqual(1.0);
      expect(BigInt(100).doubleValue()).assertEqual(100.0);
      expect(BigInt(8).doubleValue()).assertEqual(8.0);
      expect(BigInt(-42).doubleValue()).assertEqual(-42.0);
      expect(BigInt(-1).doubleValue()).assertEqual(-1.0);
      expect(BigInt(0).doubleValue()).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0200
     * @tc.name testBigIntDoubleValueSafeInteger0200
     * @tc.desc Verify doubleValue near Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueSafeInteger0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740991').doubleValue()).assertEqual(9007199254740991.0);
      const a = BigInt('9007199254740992').doubleValue();
      const b = BigInt('9007199254740993').doubleValue();
      expect(a).assertEqual(9007199254740992.0);
      expect(b).assertEqual(9007199254740993.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0300
     * @tc.name testBigIntDoubleValueReturnType0300
     * @tc.desc Verify doubleValue returns finite number with zero fractional part for integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r = BigInt(42).doubleValue();

      expect(typeof r === 'number').assertTrue();
      expect(r % 1).assertEqual(0);
      const bn = BigInt(-42);
      const d1 = bn.doubleValue();
      const d2 = bn.doubleValue();
      expect(d1).assertEqual(d2);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0400
     * @tc.name testBigIntDoubleValueFromExpression0400
     * @tc.desc Verify doubleValue on values produced by arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueFromExpression0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const sum = BigInt(10).operatorAdd(BigInt(20));

      expect(sum.doubleValue()).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0500
     * @tc.name testBigIntDoubleValueNoThrow0500
     * @tc.desc Verify doubleValue does not throw on normal calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueNoThrow0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(999999).doubleValue()).assertEqual(999999.0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_DOUBLEVALUE_0600
     * @tc.name testBigIntDoubleValueCompareBoundary0600
     * @tc.desc Verify doubleValue for double-constructible Number boundaries used in comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntDoubleValueCompareBoundary0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9007199254740991.0).doubleValue()).assertEqual(9007199254740991.0);
      expect(BigInt(9007199254740992.0).doubleValue()).assertEqual(9007199254740992.0);
      expect(BigInt('9007199254740991').doubleValue()).assertEqual(9007199254740991.0);
    });
  });
}
