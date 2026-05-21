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
  describe('BigInt 整型构造（导图 constructor_2~5）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0100
     * @tc.name testBigIntConstructorIntegralByteBoundary0100
     * @tc.desc Verify byte boundary values 127 and -128 construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralByteBoundary0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const hi: byte = 127;
        const lo: byte = -128;
        expect(new BigInt(hi).toString()).assertEqual('127');
        expect(new BigInt(lo).toString()).assertEqual('-128');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0200
     * @tc.name testBigIntConstructorIntegralByteCommon0200
     * @tc.desc Verify common byte values construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralByteCommon0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const z: byte = 0;
        const one: byte = 1;
        const neg: byte = -1;
        expect(new BigInt(z).toString()).assertEqual('0');
        expect(new BigInt(one).toString()).assertEqual('1');
        expect(new BigInt(neg).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0300
     * @tc.name testBigIntConstructorIntegralShortBoundary0300
     * @tc.desc Verify short boundary values construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralShortBoundary0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const hi: short = 32767;
        const lo: short = -32768;
        expect(new BigInt(hi).toString()).assertEqual('32767');
        expect(new BigInt(lo).toString()).assertEqual('-32768');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0400
     * @tc.name testBigIntConstructorIntegralIntCommon0400
     * @tc.desc Verify common int literals construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralIntCommon0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0).toString()).assertEqual('0');
        expect(new BigInt(1).toString()).assertEqual('1');
        expect(new BigInt(-1).toString()).assertEqual('-1');
        expect(new BigInt(10000).toString()).assertEqual('10000');
        expect(new BigInt(-10000).toString()).assertEqual('-10000');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0500
     * @tc.name testBigIntConstructorIntegralLargeDecimalString0500
     * @tc.desc Verify large integers can be constructed from decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralLargeDecimalString0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('9223372036854775807').toString()).assertEqual('9223372036854775807');
      });
  });
}
