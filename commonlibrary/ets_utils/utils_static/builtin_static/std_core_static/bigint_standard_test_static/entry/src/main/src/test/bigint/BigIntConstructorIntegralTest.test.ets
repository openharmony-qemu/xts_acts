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
      const hi: byte = 127;
      const lo: byte = -128;

      expect(BigInt(hi).toString()).assertEqual('127');
      expect(BigInt(lo).toString()).assertEqual('-128');
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
      const z: byte = 0;
      const one: byte = 1;
      const neg: byte = -1;

      expect(BigInt(z).toString()).assertEqual('0');
      expect(BigInt(one).toString()).assertEqual('1');
      expect(BigInt(neg).toString()).assertEqual('-1');
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
      const hi: short = 32767;
      const lo: short = -32768;

      expect(BigInt(hi).toString()).assertEqual('32767');
      expect(BigInt(lo).toString()).assertEqual('-32768');
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
      expect(BigInt(100 as short).toString()).assertEqual('100');
      expect(BigInt(-100 as short).toString()).assertEqual('-100');
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
      expect(BigInt(0).toString()).assertEqual('0');
      expect(BigInt(1).toString()).assertEqual('1');
      expect(BigInt(-1).toString()).assertEqual('-1');
      expect(BigInt(10000).toString()).assertEqual('10000');
      expect(BigInt(-10000).toString()).assertEqual('-10000');
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
      const hi: int = 2147483647;
      const lo: int = -2147483648;

      expect(BigInt(hi).toString()).assertEqual('2147483647');
      expect(BigInt(lo).toString()).assertEqual('-2147483648');
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
      const hi: long = 9223372036854775807;
      const lo: long = -9223372036854775808;

      expect(BigInt(hi).toString()).assertEqual('9223372036854775807');
      expect(BigInt(lo).toString()).assertEqual('-9223372036854775808');
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
      expect(Class.of(BigInt(42 as byte) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(BigInt(1000 as short) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(BigInt(999) as Object)).assertEqual(Class.from<BigInt>());
    });
  });
}
