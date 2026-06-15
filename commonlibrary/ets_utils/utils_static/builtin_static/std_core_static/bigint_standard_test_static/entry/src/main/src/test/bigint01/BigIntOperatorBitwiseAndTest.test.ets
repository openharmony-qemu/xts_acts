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

export default function BigIntOperatorBitwiseAndTest(): void {
  describe('BigInt.operatorBitwiseAnd (mindmap operatorBitwiseAnd)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0100
     * @tc.name testBigIntOperatorBitwiseAndBasic0100
     * @tc.desc Mindmap input and return value: operatorBitwiseAnd basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('4');
      expect(BigInt(0).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(-1).operatorBitwiseAnd(BigInt(7)).toString()).assertEqual('7');
      expect(BigInt(-12).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('4');
      // Two's-complement AND on negative operands: low bits of -3 and -5 both cover -7.
      expect(BigInt(-3).operatorBitwiseAnd(BigInt(-5)).toString()).assertEqual('-7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0200
     * @tc.name testBigIntOperatorBitwiseAndSpecial0200
     * @tc.desc Mindmap input: operatorBitwiseAnd zero, self, and mask patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSpecial0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12345).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(42).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('42');
      expect(BigInt(99).operatorBitwiseAnd(BigInt(99)).toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0300
     * @tc.name testBigIntOperatorBitwiseAndCommutative0300
     * @tc.desc Mindmap return value: operatorBitwiseAnd commutative property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndCommutative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(12);
      const b = BigInt(10);
      expect(a.operatorBitwiseAnd(b).toString()).assertEqual(b.operatorBitwiseAnd(a).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0400
     * @tc.name testBigIntOperatorBitwiseAndImmutable0400
     * @tc.desc Mindmap return value: operatorBitwiseAnd does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndImmutable0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(12);
      const right = BigInt(5);
      const origL = left.toString();
      left.operatorBitwiseAnd(right);
      expect(left.toString()).assertEqual(origL);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0500
     * @tc.name testBigIntOperatorBitwiseAndReturnType0500
     * @tc.desc Mindmap return value: operatorBitwiseAnd returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndReturnType0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(12).operatorBitwiseAnd(BigInt(5)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0600
     * @tc.name testBigIntOperatorBitwiseAndInvalidArg0600
     * @tc.desc Mindmap error handling: operatorBitwiseAnd rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndInvalidArg0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(12);
      expect((): void => {
        // Intentional cast: null at runtime to exercise ClassCastError on operand.
        left.operatorBitwiseAnd(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional cast: undefined at runtime to exercise ClassCastError on operand.
        left.operatorBitwiseAnd(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt string with static BigInt operand type.
        left.operatorBitwiseAnd('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt number with static BigInt operand type.
        left.operatorBitwiseAnd(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt boolean with static BigInt operand type.
        left.operatorBitwiseAnd(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0700
     * @tc.name testBigIntOperatorBitwiseAndLarge0700
     * @tc.desc Mindmap input: operatorBitwiseAnd on large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLarge0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mask = BigInt('18446744073709551615');
      const huge = BigInt('999999999999999999999999999999');
      expect(huge.operatorBitwiseAnd(mask).toString()).assertEqual('5076944270305263615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0800
     * @tc.name testBigIntOperatorBitwiseAndLongBounds0800
     * @tc.desc Mindmap input: operatorBitwiseAnd at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLongBounds0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorBitwiseAnd(max).toString()).assertEqual('9223372036854775807');
      expect(min.operatorBitwiseAnd(max).toString()).assertEqual('0');
      expect(max.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(min.operatorBitwiseAnd(min).toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0900
     * @tc.name testBigIntOperatorBitwiseAndNegativeOperands0900
     * @tc.desc Mindmap input: operatorBitwiseAnd with both operands negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegativeOperands0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-8).operatorBitwiseAnd(BigInt(-3)).toString()).assertEqual('-8');
      expect(BigInt('-9223372036854775808').operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('-9223372036854775808');
    });
  });
}
