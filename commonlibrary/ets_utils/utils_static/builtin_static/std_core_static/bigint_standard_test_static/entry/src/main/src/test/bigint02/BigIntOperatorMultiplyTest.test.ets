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

export default function BigIntOperatorMultiplyTest(): void {
  describe('BigInt.operatorMultiply (mindmap operatorMultiply)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0100
     * @tc.name testBigIntOperatorMultiplyBasic0100
     * @tc.desc Mindmap input and return value: operatorMultiply basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3).operatorMultiply(BigInt(5)).toString()).assertEqual('15');
      expect(BigInt(6).operatorMultiply(BigInt(-2)).toString()).assertEqual('-12');
      expect(BigInt(-3).operatorMultiply(BigInt(-4)).toString()).assertEqual('12');
      expect(BigInt(7).operatorMultiply(BigInt(7)).toString()).assertEqual('49');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0200
     * @tc.name testBigIntOperatorMultiplyZero0200
     * @tc.desc Mindmap input: operatorMultiply zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorMultiply(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(99).operatorMultiply(BigInt(1)).toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0300
     * @tc.name testBigIntOperatorMultiplyLarge0300
     * @tc.desc Mindmap input: operatorMultiply large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyLarge0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999').operatorMultiply(BigInt('999999999')).toString()).assertEqual('999999998000000001');
      expect(BigInt('999999999999999999999999999999').operatorMultiply(BigInt('999999999999999999999999999999')).toString()).assertEqual('999999999999999999999999999998000000000000000000000000000001');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0400
     * @tc.name testBigIntOperatorMultiplyReturnType0400
     * @tc.desc Mindmap return value: operatorMultiply returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyReturnType0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(10).operatorMultiply(BigInt(3)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0500
     * @tc.name testBigIntOperatorMultiplyInvalidArg0500
     * @tc.desc Mindmap error handling: operatorMultiply rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(10);
      expect((): void => {
        a.operatorMultiply(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorMultiply(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorMultiply('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorMultiply(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorMultiply(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0600
     * @tc.name testBigIntOperatorMultiplyLongBounds0600
     * @tc.desc Mindmap input: operatorMultiply at signed long extrema with zero and sign flip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorMultiply(BigInt(0)).toString()).assertEqual('0');
      expect(min.operatorMultiply(BigInt(0)).toString()).assertEqual('0');
      expect(max.operatorMultiply(BigInt(-1)).toString()).assertEqual('-9223372036854775807');
      expect(min.operatorMultiply(BigInt(-1)).toString()).assertEqual('9223372036854775808');
      expect(max.operatorMultiply(BigInt(1)).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_MULTIPLY_0700
     * @tc.name testBigIntOperatorMultiplyBeyondLongRange0700
     * @tc.desc Mindmap input: operatorMultiply with magnitudes beyond signed long maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorMultiplyBeyondLongRange0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const plusOne = BigInt('9223372036854775807').operatorAdd(BigInt(1));

      expect(plusOne.operatorMultiply(BigInt(2)).toString()).assertEqual('18446744073709551616');
      expect(plusOne.operatorMultiply(plusOne).toString()).assertEqual('85070591730234615865843651857942052864');
      expect(BigInt('-999999999999999999999999999999').operatorMultiply(BigInt(2)).toString()).assertEqual('-1999999999999999999999999999998');
    });
  });
}
