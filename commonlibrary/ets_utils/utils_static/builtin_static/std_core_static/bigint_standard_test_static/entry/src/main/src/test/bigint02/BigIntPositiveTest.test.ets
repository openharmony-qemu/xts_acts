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

export default function BigIntPositiveTest(): void {
  describe('BigInt.positive (mindmap positive)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0100
     * @tc.name testBigIntPositiveSignCases0100
     * @tc.desc Verify positive() is true for positive values and zero per API spec (non-negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveSignCases0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(123).positive()).assertTrue();
        expect(BigInt(-123).positive()).assertFalse();
        expect(BigInt(0).positive()).assertTrue();
        expect(BigInt(1).positive()).assertTrue();
        expect(BigInt(-1).positive()).assertFalse();
        expect(BigInt('456').positive()).assertTrue();
        expect(BigInt('-456').positive()).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0200
     * @tc.name testBigIntPositiveComplementNegative0200
     * @tc.desc Verify positive() and negative() complement per API (zero is non-negative, not negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveComplementNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(42).positive()).assertTrue();
        expect(BigInt(42).negative()).assertFalse();
        expect(BigInt(-42).positive()).assertFalse();
        expect(BigInt(-42).negative()).assertTrue();
        expect(BigInt(0).positive()).assertTrue();
        expect(BigInt(0).negative()).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0300
     * @tc.name testBigIntPositiveReturnType0300
     * @tc.desc Verify positive returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const bn = BigInt(100);
        const r1 = bn.positive();
        const r2 = bn.positive();
        const r3 = bn.positive();
        expect(typeof r1 === 'boolean').assertTrue();
        expect(r1 === r2 && r2 === r3).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0400
     * @tc.name testBigIntPositiveBoundary0400
     * @tc.desc Verify positive() at int64 and MAX_SAFE_INTEGER boundary magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveBoundary0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('9223372036854775807').positive()).assertTrue();
        expect(BigInt('-9223372036854775808').positive()).assertFalse();
        expect(BigInt(9223372036854775807).positive()).assertTrue();
        expect(BigInt(-9223372036854775808).positive()).assertFalse();
        const maxSafe = '9007199254740991';
        expect(BigInt(maxSafe).positive()).assertTrue();
        expect(BigInt(`-${maxSafe}`).positive()).assertFalse();
        expect(BigInt(9007199254740991.0).positive()).assertTrue();
        expect(BigInt(-9007199254740991.0).positive()).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_POSITIVE_0500
     * @tc.name testBigIntPositiveLargeMagnitude0500
     * @tc.desc Verify positive() on very large positive and negative magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPositiveLargeMagnitude0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('999999999999999999999999999999').positive()).assertTrue();
        expect(BigInt('-999999999999999999999999999999').positive()).assertFalse();
        expect(BigInt(0).positive()).assertTrue();
      });
  });
}
