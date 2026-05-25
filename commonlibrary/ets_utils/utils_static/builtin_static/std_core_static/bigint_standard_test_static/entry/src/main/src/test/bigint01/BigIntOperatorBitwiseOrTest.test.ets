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

export default function BigIntOperatorBitwiseOrTest(): void {
  describe('BigInt.operatorBitwiseOr (mindmap operatorBitwiseOr)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0100
     * @tc.name testBigIntOperatorBitwiseOrBasic0100
     * @tc.desc Verify basic bitwise OR results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorBitwiseOr(BigInt(10)).toString()).assertEqual('14');
      expect(BigInt(5).operatorBitwiseOr(BigInt(3)).toString()).assertEqual('7');
      expect(BigInt(8).operatorBitwiseOr(BigInt(1)).toString()).assertEqual('9');
      expect(BigInt(255).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0200
     * @tc.name testBigIntOperatorBitwiseOrZeroMask0200
     * @tc.desc Verify zero mask and minus-one saturation for bitwise OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrZeroMask0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = BigInt(0);
      const val = BigInt(42);

      expect(zero.operatorBitwiseOr(val).toString()).assertEqual('42');
      expect(val.operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseOr(val).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0300
     * @tc.name testBigIntOperatorBitwiseOrIdempotent0300
     * @tc.desc Verify x or x equals x and commutative property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrIdempotent0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const val = BigInt(99);

      expect(val.operatorBitwiseOr(val).toString()).assertEqual('99');
      const a = BigInt(12);
      const b = BigInt(10);
      expect(a.operatorBitwiseOr(b).toString()).assertEqual(b.operatorBitwiseOr(a).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0400
     * @tc.name testBigIntOperatorBitwiseOrNegative0400
     * @tc.desc Verify bitwise OR with negative operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrNegative0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-3).operatorBitwiseOr(BigInt(-5)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseOr(BigInt(255)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0500
     * @tc.name testBigIntOperatorBitwiseOrReturnType0500
     * @tc.desc Verify operatorBitwiseOr returns BigInt without mutating operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrReturnType0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(12);
      const right = BigInt(5);
      const result = left.operatorBitwiseOr(right);

      expect(Class.of(result as Object)).assertEqual(Class.from<BigInt>());
      expect(left.toString()).assertEqual('12');
      expect(right.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0600
     * @tc.name testBigIntOperatorBitwiseOrInvalidArg0600
     * @tc.desc Verify operatorBitwiseOr rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrInvalidArg0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(12);

      expect((): void => {
        left.operatorBitwiseOr(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseOr(undefined as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0700
     * @tc.name testBigIntOperatorBitwiseOrLarge0700
     * @tc.desc Verify bitwise OR on magnitudes beyond Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrLarge0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const low = BigInt('18446744073709551615');
      const high = BigInt('18446744073709551616');

      expect(low.operatorBitwiseOr(high).toString()).assertEqual('36893488147419103231');
      expect(BigInt('999999999999999999999999999990').operatorBitwiseOr(BigInt(1)).toString()).assertEqual('999999999999999999999999999991');
    });
  });
}
