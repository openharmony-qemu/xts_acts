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

export default function BigIntOperatorSubtractTest(): void {
  describe('BigInt.operatorSubtract (mindmap operatorSubtract)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0100
     * @tc.name testBigIntOperatorSubtractBasic0100
     * @tc.desc Mindmap input and return value: operatorSubtract basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorSubtract(BigInt(5)).toString()).assertEqual('7');
      expect(BigInt(20).operatorSubtract(BigInt(-5)).toString()).assertEqual('25');
      expect(BigInt(-10).operatorSubtract(BigInt(5)).toString()).assertEqual('-15');
      expect(BigInt(-8).operatorSubtract(BigInt(-3)).toString()).assertEqual('-5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0200
     * @tc.name testBigIntOperatorSubtractZero0200
     * @tc.desc Mindmap input: operatorSubtract zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).operatorSubtract(BigInt(0)).toString()).assertEqual('42');
      expect(BigInt(0).operatorSubtract(BigInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0300
     * @tc.name testBigIntOperatorSubtractLarge0300
     * @tc.desc Mindmap input: operatorSubtract large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractLarge0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('99999999999999999999').operatorSubtract(BigInt('12345678901234567890')).toString()).assertEqual('87654321098765432109');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0400
     * @tc.name testBigIntOperatorSubtractReturnType0400
     * @tc.desc Mindmap return value: operatorSubtract returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(10).operatorSubtract(BigInt(3)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0500
     * @tc.name testBigIntOperatorSubtractInvalidArg0500
     * @tc.desc Mindmap error handling: operatorSubtract rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(10);
      expect((): void => {
        a.operatorSubtract(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorSubtract(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorSubtract('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorSubtract(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorSubtract(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0600
     * @tc.name testBigIntOperatorSubtractLongBounds0600
     * @tc.desc Mindmap input: operatorSubtract at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorSubtract(BigInt(1)).toString()).assertEqual('9223372036854775806');
      expect(min.operatorSubtract(BigInt(-1)).toString()).assertEqual('-9223372036854775807');
      expect(max.operatorSubtract(max).toString()).assertEqual('0');
      expect(min.operatorSubtract(min).toString()).assertEqual('0');
      expect(max.operatorSubtract(min).toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0700
     * @tc.name testBigIntOperatorSubtractBeyondLongRange0700
     * @tc.desc Mindmap input: operatorSubtract with magnitudes beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractBeyondLongRange0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775808').operatorSubtract(BigInt(1)).toString()).assertEqual('9223372036854775807');
      expect(BigInt('-9223372036854775809').operatorSubtract(BigInt(1)).toString()).assertEqual('-9223372036854775810');
      expect(BigInt('9223372036854775808').operatorSubtract(BigInt('-9223372036854775809')).toString()).assertEqual('18446744073709551617');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0800
     * @tc.name testBigIntOperatorSubtractImmutable0800
     * @tc.desc Mindmap return value: operatorSubtract does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractImmutable0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(12);
      const orig = a.toString();
      a.operatorSubtract(BigInt(5));
      expect(a.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0900
     * @tc.name testBigIntOperatorSubtractDoubleSafeInteger0900
     * @tc.desc Mindmap boundary: operatorSubtract near double safe-integer magnitude (string operands)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractDoubleSafeInteger0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740992').operatorSubtract(BigInt(1)).toString()).assertEqual('9007199254740991');
      expect(BigInt('9007199254740991').operatorSubtract(BigInt('9007199254740991')).toString()).assertEqual('0');
    });
  });
}
