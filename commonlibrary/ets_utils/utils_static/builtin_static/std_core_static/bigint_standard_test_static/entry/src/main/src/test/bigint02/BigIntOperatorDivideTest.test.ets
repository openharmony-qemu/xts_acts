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
import { describe, it, expect } from '@ohos/hypium-binary/src/main/indexStatic';
import { TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic/Constant';

export default function BigIntOperatorDivideTest(): void {
  describe('BigInt.operatorDivide (mindmap operatorDivide)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0100
     * @tc.name testBigIntOperatorDivideBasic0100
     * @tc.desc Mindmap input and return value: operatorDivide basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorDivide(BigInt(5)).toString()).assertEqual('2');
      expect(BigInt(20).operatorDivide(BigInt(-5)).toString()).assertEqual('-4');
      expect(BigInt(-10).operatorDivide(BigInt(5)).toString()).assertEqual('-2');
      expect(BigInt(7).operatorDivide(BigInt(7)).toString()).assertEqual('1');
      expect(BigInt(-7).operatorDivide(BigInt(3)).toString()).assertEqual('-2');
      expect(BigInt(7).operatorDivide(BigInt(-3)).toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0200
     * @tc.name testBigIntOperatorDivideZero0200
     * @tc.desc Mindmap input: operatorDivide zero dividend
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorDivide(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(0).operatorDivide(BigInt(-1)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0300
     * @tc.name testBigIntOperatorDivideReturnType0300
     * @tc.desc Mindmap return value: operatorDivide returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(10).operatorDivide(BigInt(3)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0400
     * @tc.name testBigIntOperatorDivideInvalidArg0400
     * @tc.desc Mindmap error handling: operatorDivide rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(10);
      expect((): void => {
        // Intentional cast: null at runtime to exercise ClassCastError on operand.
        a.operatorDivide(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional cast: undefined at runtime to exercise ClassCastError on operand.
        a.operatorDivide(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt string with static BigInt operand type.
        a.operatorDivide('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt number with static BigInt operand type.
        a.operatorDivide(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        // Intentional double cast: non-BigInt boolean with static BigInt operand type.
        a.operatorDivide(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0500
     * @tc.name testBigIntOperatorDivideDivByZero0500
     * @tc.desc Mindmap error handling: operatorDivide throws on zero divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideDivByZero0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(10).operatorDivide(BigInt(0));
      }).assertThrowError('Error');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0600
     * @tc.name testBigIntOperatorDivideLongBounds0600
     * @tc.desc Mindmap input: operatorDivide at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt('9223372036854775807');
      const min = BigInt('-9223372036854775808');

      expect(max.operatorDivide(BigInt(1)).toString()).assertEqual('9223372036854775807');
      expect(min.operatorDivide(BigInt(1)).toString()).assertEqual('-9223372036854775808');
      expect(min.operatorDivide(BigInt(-1)).toString()).assertEqual('9223372036854775808');
      expect(BigInt(0).operatorDivide(max).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0700
     * @tc.name testBigIntOperatorDivideLarge0700
     * @tc.desc Mindmap input: operatorDivide on magnitudes beyond signed long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideLarge0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999999999999999999999999999999').operatorDivide(BigInt('999999999999999999999999999999')).toString()).assertEqual('1');
      expect(BigInt('1000000000000000000000000000000').operatorDivide(BigInt('100000000000000000000000000000')).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0800
     * @tc.name testBigIntOperatorDivideDoubleSafeInteger0800
     * @tc.desc Mindmap boundary: operatorDivide near double safe-integer magnitude (string operands)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideDoubleSafeInteger0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740991').operatorDivide(BigInt(2)).toString()).assertEqual('4503599627370495');
      expect(BigInt('9007199254740992').operatorDivide(BigInt(2)).toString()).assertEqual('4503599627370496');
    });
  });
}
