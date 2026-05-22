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
     * @tc.desc Verify byte boundary values 127 and -128 construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralByteBoundary0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const hi: byte = 127;
        const lo: byte = -128;
        expect(BigInt(hi).toString()).assertEqual('127');
        expect(BigInt(lo).toString()).assertEqual('-128');
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
        expect(BigInt(z).toString()).assertEqual('0');
        expect(BigInt(one).toString()).assertEqual('1');
        expect(BigInt(neg).toString()).assertEqual('-1');
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
        expect(BigInt(hi).toString()).assertEqual('32767');
        expect(BigInt(lo).toString()).assertEqual('-32768');
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
        expect(BigInt(0).toString()).assertEqual('0');
        expect(BigInt(1).toString()).assertEqual('1');
        expect(BigInt(-1).toString()).assertEqual('-1');
        expect(BigInt(10000).toString()).assertEqual('10000');
        expect(BigInt(-10000).toString()).assertEqual('-10000');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0450
     * @tc.name testBigIntConstructorIntegralIntBoundary0450
     * @tc.desc Verify int boundary values 2147483647 and -2147483648 construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralIntBoundary0450',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const hi: int = 2147483647;
        const lo: int = -2147483648;
        expect(BigInt(hi).toString()).assertEqual('2147483647');
        expect(BigInt(lo).toString()).assertEqual('-2147483648');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0500
     * @tc.name testBigIntConstructorIntegralLongBoundary0500
     * @tc.desc Verify long boundary values construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegralLongBoundary0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const hi: long = 9223372036854775807;
        const lo: long = -9223372036854775808;
        expect(BigInt(hi).toString()).assertEqual('9223372036854775807');
        expect(BigInt(lo).toString()).assertEqual('-9223372036854775808');
      });
  });
}
