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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorBitwiseOrTest(): void {
  describe('BigInt.operatorBitwiseOr (mindmap operatorBitwiseOr)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0100
     * @tc.name testBigIntOperatorBitwiseOrBasic0100
     * @tc.desc Mindmap input and return value: operatorBitwiseOr basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorBitwiseOr(BigInt(10)).toString()).assertEqual('14');
      expect(BigInt(5).operatorBitwiseOr(BigInt(3)).toString()).assertEqual('7');
      expect(BigInt(255).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0200
     * @tc.name testBigIntOperatorBitwiseOrSpecial0200
     * @tc.desc Mindmap input: operatorBitwiseOr zero, self, and mask patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrSpecial0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseOr(BigInt(42)).toString()).assertEqual('42');
      expect(BigInt(42).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0300
     * @tc.name testBigIntOperatorBitwiseOrCommutative0300
     * @tc.desc Mindmap return value: operatorBitwiseOr commutative property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrCommutative0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(12);
      const b = BigInt(10);

      expect(a.operatorBitwiseOr(b).toString()).assertEqual(b.operatorBitwiseOr(a).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0400
     * @tc.name testBigIntOperatorBitwiseOrImmutable0400
     * @tc.desc Mindmap return value: operatorBitwiseOr does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrImmutable0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = BigInt(12);
      const orig = left.toString();
      left.operatorBitwiseOr(BigInt(5));
      expect(left.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0500
     * @tc.name testBigIntOperatorBitwiseOrReturnType0500
     * @tc.desc Mindmap return value: operatorBitwiseOr returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrReturnType0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(12).operatorBitwiseOr(BigInt(5)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0600
     * @tc.name testBigIntOperatorBitwiseOrInvalidArg0600
     * @tc.desc Mindmap error handling: operatorBitwiseOr rejects invalid operand types
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
      expect((): void => {
        left.operatorBitwiseOr('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseOr(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        left.operatorBitwiseOr(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0700
     * @tc.name testBigIntOperatorBitwiseOrLarge0700
     * @tc.desc Mindmap input: operatorBitwiseOr on large magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrLarge0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('18446744073709551615').operatorBitwiseOr(BigInt('18446744073709551616')).toString()).assertEqual('36893488147419103231');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0800
     * @tc.name testBigIntOperatorBitwiseOrLongBounds0800
     * @tc.desc Mindmap input: operatorBitwiseOr at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrLongBounds0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('9223372036854775807');
      expect(min.operatorBitwiseOr(max).toString()).assertEqual('-1');
      expect(max.operatorBitwiseOr(min).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_OR_0900
     * @tc.name testBigIntOperatorBitwiseOrNegativeBoundary0900
     * @tc.desc Mindmap boundary: operatorBitwiseOr at -9223372036854775808 and negative mask operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseOrNegativeBoundary0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const min = BigInt('-9223372036854775808');

      expect(min.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-9223372036854775808');
      expect(min.operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(min.operatorBitwiseOr(min).toString()).assertEqual('-9223372036854775808');
      expect(BigInt('-999999999999999999999999999999').operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
    });
  });
}
