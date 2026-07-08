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

export default function BigIntConstructorIntegralTest(): void {
  describe('BigInt integral constructor (mindmap constructor_2~5)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0100
     * @tc.name testBigIntConstructorIntegralByteBoundary0100
     * @tc.desc Mindmap constructor_2 input: byte boundary 127 and -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralByteBoundary0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxByte: byte = 127;
      const minByte: byte = -128;

      expect(BigInt(maxByte).toString()).assertEqual('127');
      expect(BigInt(minByte).toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0200
     * @tc.name testBigIntConstructorIntegralByteCommon0200
     * @tc.desc Mindmap constructor_2 input: common byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralByteCommon0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeroByte: byte = 0;
      const oneByte: byte = 1;
      const negOneByte: byte = -1;

      expect(BigInt(zeroByte).toString()).assertEqual('0');
      expect(BigInt(oneByte).toString()).assertEqual('1');
      expect(BigInt(negOneByte).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0300
     * @tc.name testBigIntConstructorIntegralShortBoundary0300
     * @tc.desc Mindmap constructor_3 input: short boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralShortBoundary0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxShort: short = 32767;
      const minShort: short = -32768;

      expect(BigInt(maxShort).toString()).assertEqual('32767');
      expect(BigInt(minShort).toString()).assertEqual('-32768');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0400
     * @tc.name testBigIntConstructorIntegralShortCommon0400
     * @tc.desc Mindmap constructor_3 input: common short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralShortCommon0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const positiveShort: short = 100;
      const negativeShort: short = -100;

      expect(BigInt(positiveShort).toString()).assertEqual('100');
      expect(BigInt(negativeShort).toString()).assertEqual('-100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0500
     * @tc.name testBigIntConstructorIntegralIntCommon0500
     * @tc.desc Mindmap constructor_4 input: common int literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralIntCommon0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeroInt: int = 0;
      const oneInt: int = 1;
      const negOneInt: int = -1;
      const positiveInt: int = 10000;
      const negativeInt: int = -10000;

      expect(BigInt(zeroInt).toString()).assertEqual('0');
      expect(BigInt(oneInt).toString()).assertEqual('1');
      expect(BigInt(negOneInt).toString()).assertEqual('-1');
      expect(BigInt(positiveInt).toString()).assertEqual('10000');
      expect(BigInt(negativeInt).toString()).assertEqual('-10000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0600
     * @tc.name testBigIntConstructorIntegralIntBoundary0600
     * @tc.desc Mindmap constructor_4 input: int max and min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralIntBoundary0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxInt: int = 2147483647;
      const minInt: int = -2147483648;

      expect(BigInt(maxInt).toString()).assertEqual('2147483647');
      expect(BigInt(minInt).toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0700
     * @tc.name testBigIntConstructorIntegralLongBoundary0700
     * @tc.desc Mindmap constructor_5 input: long max and min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralLongBoundary0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxLong: long = 9223372036854775807;
      const minLong: long = -9223372036854775808;

      expect(BigInt(maxLong).toString()).assertEqual('9223372036854775807');
      expect(BigInt(minLong).toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0800
     * @tc.name testBigIntConstructorIntegralReturnType0800
     * @tc.desc Mindmap return value: integral overloads return BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralReturnType0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromByte: byte = 42;
      const fromShort: short = 1000;
      const fromInt: int = 999;

      expect(Class.of(BigInt(fromByte) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(BigInt(fromShort) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(BigInt(fromInt) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0900
     * @tc.name testBigIntConstructorIntegralBeyondLongRange0900
     * @tc.desc Mindmap boundary: integral long extrema then arithmetic beyond signed long range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralBeyondLongRange0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxLongValue = BigInt(9223372036854775807);
      const minLongValue = BigInt(-9223372036854775808);

      expect(maxLongValue.toString()).assertEqual('9223372036854775807');
      expect(minLongValue.toString()).assertEqual('-9223372036854775808');
      expect(maxLongValue.operatorAdd(BigInt(1)).toString()).assertEqual('9223372036854775808');
      expect(minLongValue.operatorSubtract(BigInt(1)).toString()).assertEqual('-9223372036854775809');
      const plusOne = maxLongValue.operatorAdd(BigInt(1));

      expect(maxLongValue.operatorMultiply(plusOne).toString()).assertEqual('85070591730234615856620279821087277056');
    });
  });
}
