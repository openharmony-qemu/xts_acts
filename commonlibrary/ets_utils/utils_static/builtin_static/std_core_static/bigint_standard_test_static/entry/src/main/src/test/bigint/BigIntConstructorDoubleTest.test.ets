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

export default function BigIntConstructorDoubleTest(): void {
  describe('BigInt double constructor (mindmap constructor_6)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0100
     * @tc.name testBigIntConstructorDoubleIntegerSmall0100
     * @tc.desc Verify integer doubles 0, 1, and -1 construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleIntegerSmall0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0.0).toString()).assertEqual('0');
      expect(BigInt(1.0).toString()).assertEqual('1');
      expect(BigInt(-1.0).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0200
     * @tc.name testBigIntConstructorDoubleIntegerLarge0200
     * @tc.desc Verify larger integer doubles construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleIntegerLarge0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100.0).toString()).assertEqual('100');
      expect(BigInt(-999999.0).toString()).assertEqual('-999999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0300
     * @tc.name testBigIntConstructorDoubleZeroSign0300
     * @tc.desc Verify positive and negative zero doubles construct BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleZeroSign0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(+0.0).toString()).assertEqual('0');
      expect(BigInt(-0.0).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0400
     * @tc.name testBigIntConstructorDoubleSafeInteger0400
     * @tc.desc Verify safe integer boundary doubles construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleSafeInteger0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9007199254740991.0).toString()).assertEqual('9007199254740991');
      expect(BigInt(-9007199254740991.0).toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0500
     * @tc.name testBigIntConstructorDoubleNonInteger0500
     * @tc.desc Verify non-integer doubles throw RangeError when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleNonInteger0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(1.5);
      }).assertThrowError('RangeError');
      expect((): void => {
        BigInt(3.14);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0600
     * @tc.name testBigIntConstructorDoubleBeyondSafeInteger0600
     * @tc.desc Verify integer doubles beyond MAX_SAFE_INTEGER construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleBeyondSafeInteger0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9007199254740992.0).toString()).assertEqual('9007199254740992');
      expect(BigInt(-9007199254740992.0).toString()).assertEqual('-9007199254740992');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0700
     * @tc.name testBigIntConstructorDoubleMaxValue0700
     * @tc.desc Verify integral Number.MAX_VALUE constructs expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleMaxValue0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Number.MAX_VALUE).toString()).assertEqual('179769313486231570814527423731704356798070567525844996598917476803157260780'+ '028538760589558632766878171540458953514382464234321326889464182768467546703'+ '537516986049910576551282076245490090389328944075868508455133942304583236903'+ '222948165808559332123348274797826204144723168738177180919299881250404026184'+ '124858368');
      expect(BigInt(-Number.MAX_VALUE).toString()).assertEqual('-' + '179769313486231570814527423731704356798070567525844996598917476803157260780'+ '028538760589558632766878171540458953514382464234321326889464182768467546703'+ '537516986049910576551282076245490090389328944075868508455133942304583236903'+ '222948165808559332123348274797826204144723168738177180919299881250404026184'+ '124858368');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0800
     * @tc.name testBigIntConstructorDoubleMinValue0800
     * @tc.desc Verify BigInt constructed from Number.MIN_VALUE throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleMinValue0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(Number.MIN_VALUE);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0900
     * @tc.name testBigIntConstructorDoubleNaN0900
     * @tc.desc Verify BigInt constructed from NaN double throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleNaN0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(Number.NaN);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1000
     * @tc.name testBigIntConstructorDoubleInfinity1000
     * @tc.desc Verify BigInt constructed from positive Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleInfinity1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(Number.POSITIVE_INFINITY);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1100
     * @tc.name testBigIntConstructorDoubleNegativeInfinity1100
     * @tc.desc Verify BigInt constructed from negative Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleNegativeInfinity1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(Number.NEGATIVE_INFINITY);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1200
     * @tc.name testBigIntConstructorDoubleLongBounds1200
     * @tc.desc Verify double constructor at long extrema follows IEEE 754 rounding (9223372036854775807 rounds up)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleLongBounds1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775808.0).toString()).assertEqual('9223372036854775808');
      expect(BigInt(-9223372036854775808.0).toString()).assertEqual('-9223372036854775808');
    });
  });
}
