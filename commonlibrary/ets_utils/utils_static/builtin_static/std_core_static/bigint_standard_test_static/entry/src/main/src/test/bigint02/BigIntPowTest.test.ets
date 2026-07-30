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

export default function BigIntPowTest(): void {
  describe('BigInt.pow (mindmap pow)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_POW_0100
     * @tc.name testBigIntPowBasic0100
     * @tc.desc Verify pow with non-negative exponents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(8).pow(new BigInt(2)).toString()).assertEqual('64');
        expect(new BigInt(2).pow(new BigInt(10)).toString()).assertEqual('1024');
        expect(new BigInt(8).pow(new BigInt(0)).toString()).assertEqual('1');
        expect(new BigInt(8).pow(new BigInt(1)).toString()).assertEqual('8');
        expect(new BigInt(-2).pow(new BigInt(3)).toString()).assertEqual('-8');
        expect(new BigInt(-2).pow(new BigInt(4)).toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_0200
     * @tc.name testBigIntPowSpecial0200
     * @tc.desc Verify pow special base and exponent cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowSpecial0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(0).pow(new BigInt(5)).toString()).assertEqual('0');
        expect(new BigInt(1).pow(new BigInt(100)).toString()).assertEqual('1');
        expect(new BigInt(-1).pow(new BigInt(4)).toString()).assertEqual('1');
        expect(new BigInt(-1).pow(new BigInt(3)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_0300
     * @tc.name testBigIntPowLarge0300
     * @tc.desc Verify pow with large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLarge0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(2).pow(new BigInt(64)).toString()).assertEqual('18446744073709551616');
        expect(new BigInt(999999999).pow(new BigInt(2)).toString()).assertEqual('999999998000000001');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_0400
     * @tc.name testBigIntPowNegativeExponent0400
     * @tc.desc Verify pow throws for negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeExponent0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect((): void => {
          new BigInt(8).pow(new BigInt(-1));
        }).assertThrowError('RangeError');
        expect((): void => {
          new BigInt(2).pow(new BigInt(-100));
        }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_0500
     * @tc.name testBigIntPowInvalidArg0500
     * @tc.desc Verify pow rejects invalid exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowInvalidArg0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const v = new BigInt(8);
      expect((): void => {
        v.pow(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_0600
     * @tc.name testBigIntPowLongBounds0600
     * @tc.desc Verify pow at exponent crossing signed long maximum magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(new BigInt(63)).toString()).assertEqual('9223372036854775808');
      expect(new BigInt(-1).pow(new BigInt(63)).toString()).assertEqual('-1');
      expect(new BigInt(0).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(9223372036854775807).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(9223372036854775807).pow(new BigInt(1)).toString()).assertEqual('9223372036854775807');
      expect(new BigInt(-9223372036854775808).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(-9223372036854775808).pow(new BigInt(1)).toString()).assertEqual('-9223372036854775808');
    });
  });
}
