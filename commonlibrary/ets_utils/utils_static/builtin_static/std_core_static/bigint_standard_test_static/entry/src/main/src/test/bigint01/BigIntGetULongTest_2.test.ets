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
import Utils from '../Util.test';

export default function BigIntGetULongTest_2(): void {
  describe('BigIntGetULongTest_2', () => {
    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0001
     * @tc.name testBigIntGetULongBoundaryBatch0001
     * @tc.desc getULong byte/short/int boundary + cross-format consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongBoundaryBatch0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const vals: BigInt[] = [BigInt(127), BigInt(32767), BigInt(2147483647), BigInt(0)];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].getULong()).assertEqual(vals[i].getLong());
        expect(vals[i].getULong()).assertEqual(BigInt(vals[i].toString()).getULong());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0002
     * @tc.name testBigIntGetULongNegativePowersOfTwo0002
     * @tc.desc getULong with negative power-of-2 values mapped to unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegativePowersOfTwo0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt(-4))).assertEqual('18446744073709551612');
      expect(Utils.ulongRoundTrip(BigInt(-8))).assertEqual('18446744073709551608');
      expect(Utils.ulongRoundTrip(BigInt(-16))).assertEqual('18446744073709551600');
      expect(Utils.ulongRoundTrip(BigInt(-64))).assertEqual('18446744073709551552');
      expect(Utils.ulongRoundTrip(BigInt(-256))).assertEqual('18446744073709551360');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0003
     * @tc.name testBigIntGetULongLargePositiveWithinRange0003
     * @tc.desc getULong with large positive values within uint64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongLargePositiveWithinRange0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('4294967295'))).assertEqual('4294967295');
      expect(Utils.ulongRoundTrip(BigInt('4294967296'))).assertEqual('4294967296');
      expect(Utils.ulongRoundTrip(BigInt('8589934591'))).assertEqual('8589934591');
      expect(Utils.ulongRoundTrip(BigInt('10000000000000000000'))).assertEqual('10000000000000000000');
      expect(Utils.ulongRoundTrip(BigInt('18000000000000000000'))).assertEqual('18000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0004
     * @tc.name testBigIntGetULongMultipleWrapCycles0004
     * @tc.desc getULong wrapping over multiple 2^64 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongMultipleWrapCycles0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('36893488147419103232'))).assertEqual('0');
      expect(Utils.ulongRoundTrip(BigInt('36893488147419103233'))).assertEqual('1');
      expect(Utils.ulongRoundTrip(BigInt('36893488147419103234'))).assertEqual('2');
      expect(Utils.ulongRoundTrip(BigInt('55340232221128654849'))).assertEqual('1');
      expect(Utils.ulongRoundTrip(BigInt('55340232221128654850'))).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0005
     * @tc.name testBigIntGetULongSequentialConsistency0005
     * @tc.desc getULong sequential repeated calls produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongSequentialConsistency0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      expect(a.getULong()).assertEqual(42);
      expect(a.getULong()).assertEqual(a.getULong());
      const b = BigInt('18446744073709551615');
      expect(Utils.ulongRoundTrip(b)).assertEqual('18446744073709551615');
      expect(Utils.ulongRoundTrip(b)).assertEqual(Utils.ulongRoundTrip(b));
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0006
     * @tc.name testBigIntGetULongNegativeUnsignedBatch0006
     * @tc.desc getULong negative values as unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegativeUnsignedBatch0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('-9223372036854775809'))).assertEqual('9223372036854775807');

      expect(Utils.ulongRoundTrip(BigInt('-18446744073709551616'))).assertEqual('0');

      expect(Utils.ulongRoundTrip(BigInt('-18446744073709551617'))).assertEqual('18446744073709551615');

      expect(Utils.ulongRoundTrip(BigInt('-18446744073709551618'))).assertEqual('18446744073709551614');

      expect(Utils.ulongRoundTrip(BigInt('-9223372036854775808'))).assertEqual('9223372036854775808');

      expect(Utils.ulongRoundTrip(BigInt('-9223372036854775807'))).assertEqual('9223372036854775809');

      expect(Utils.ulongRoundTrip(BigInt('-4611686018427387904'))).assertEqual('13835058055282163712');

      expect(Utils.ulongRoundTrip(BigInt('-18446744073709551615'))).assertEqual('1');

      expect(Utils.ulongRoundTrip(BigInt('-65535'))).assertEqual('18446744073709486081');

      expect(Utils.ulongRoundTrip(BigInt('-100000'))).assertEqual('18446744073709451616');

      expect(Utils.ulongRoundTrip(BigInt('-1000000'))).assertEqual('18446744073708551616');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0007
     * @tc.name testBigIntGetULongBooleanConstructors0007
     * @tc.desc getULong for BigInt constructed from boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongBooleanConstructors0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(false).getULong()).assertEqual(0);
      expect(BigInt(true).getULong()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0008
     * @tc.name testBigIntGetULongDoubleConstructors0008
     * @tc.desc getULong for BigInt constructed from double / float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongDoubleConstructors0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1.0).getULong()).assertEqual(1);
      expect(BigInt(0.0).getULong()).assertEqual(0);
      expect(BigInt(127.0).getULong()).assertEqual(127);
      expect(BigInt(255.0).getULong()).assertEqual(255);
      expect(Utils.ulongRoundTrip(BigInt(-128.0))).assertEqual('18446744073709551488');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0009
     * @tc.name testBigIntGetULongDefaultConstructor0009
     * @tc.desc getULong for BigInt default constructor (zero value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongDefaultConstructor0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).getULong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0010
     * @tc.name testBigIntGetULongCopyConstructor0010
     * @tc.desc getULong for BigInt copy-constructed from another BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongCopyConstructor0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(BigInt(42)).getULong()).assertEqual(42);
      expect(new BigInt(BigInt(0)).getULong()).assertEqual(0);
      expect(Utils.ulongRoundTrip(new BigInt(BigInt(-128)))).assertEqual('18446744073709551488');
      expect(Utils.ulongRoundTrip(new BigInt(BigInt('18446744073709551615')))).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0011
     * @tc.name testBigIntGetULongStringBatch0011
     * @tc.desc getULong for positive and negative string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongStringBatch0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1').getULong()).assertEqual(1);
      expect(BigInt('10').getULong()).assertEqual(10);
      expect(BigInt('100').getULong()).assertEqual(100);
      expect(BigInt('1000').getULong()).assertEqual(1000);
      expect(Utils.ulongRoundTrip(BigInt('-10'))).assertEqual('18446744073709551606');
      expect(Utils.ulongRoundTrip(BigInt('-100'))).assertEqual('18446744073709551516');
      expect(Utils.ulongRoundTrip(BigInt('-1000'))).assertEqual('18446744073709550616');
    });


    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0012
     * @tc.name testBigIntGetULongArithmeticChain0012
     * @tc.desc getULong after arithmetic chain operations (add, subtract, multiply, pow)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongArithmeticChain0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorAdd(BigInt(2)).getULong()).assertEqual(3);
      expect(BigInt(10).operatorSubtract(BigInt(5)).getULong()).assertEqual(5);
      expect(BigInt(3).operatorMultiply(BigInt(4)).getULong()).assertEqual(12);
      expect(BigInt(2).pow(BigInt(10)).getULong()).assertEqual(1024);
      expect(BigInt(100).operatorAdd(BigInt(50)).operatorSubtract(BigInt(30)).getULong()).assertEqual(120);
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0013
     * @tc.name testBigIntGetULongNegateChain0013
     * @tc.desc getULong after negate chain (negative unsigned interpretation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegateChain0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt(1).negate())).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0014
     * @tc.name testBigIntGetULongOverflowChain0014
     * @tc.desc getULong after overflow chain (add 1 to max ulong wraps to 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongOverflowChain0014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('18446744073709551615').operatorAdd(BigInt(1)))).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0015
     * @tc.name testBigIntGetULongImmutability0015
     * @tc.desc getULong does not mutate the original BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongImmutability0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      const s1 = a.toString();
      a.getULong();
      expect(a.toString()).assertEqual(s1);

      const b = BigInt('18446744073709551615');
      const before = BigInt(b.toString());
      b.getULong();
      expect(b.equals(before)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0016
     * @tc.name testBigIntGetULongFromULongDiagonal0016
     * @tc.desc getULong round-trip with fromULong for various constructor forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongFromULongDiagonal0016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).getULong()).assertEqual(0);
      expect(BigInt.fromULong(1).getULong()).assertEqual(1);
      expect(BigInt.fromULong(127).getULong()).assertEqual(127);
      expect(BigInt.fromULong(2147483647).getULong()).assertEqual(2147483647);
      expect(Utils.ulongRoundTrip(BigInt.fromULong(-1))).assertEqual('18446744073709551615');
      expect(Utils.ulongRoundTrip(BigInt.fromULong(-128))).assertEqual('18446744073709551488');
      expect(Utils.ulongRoundTrip(BigInt.fromULong(-32768))).assertEqual('18446744073709518848');
      expect(Utils.ulongRoundTrip(BigInt.fromULong(-2147483648))).assertEqual('18446744071562067968');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0017
     * @tc.name testBigIntGetULongPowersOfTwo0017
     * @tc.desc getULong for power-of-2 boundary values from 2^0 to 2^17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongPowersOfTwo0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).getULong()).assertEqual(1);
      expect(BigInt(2).getULong()).assertEqual(2);
      expect(BigInt(65536).getULong()).assertEqual(65536);
      expect(BigInt(4294967296).getULong()).assertEqual(4294967296);
      expect(Utils.ulongRoundTrip(BigInt('1152921504606846976'))).assertEqual('1152921504606846976');
      expect(Utils.ulongRoundTrip(BigInt('36893488147419103232'))).assertEqual('36893488147419103232');
      expect(Utils.ulongRoundTrip(BigInt('1000000000000000'))).assertEqual('1000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0018
     * @tc.name testBigIntGetULongGetLongConsistency0018
     * @tc.desc getULong vs getLong consistency for values representable by signed long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongGetLongConsistency0018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).getULong()).assertEqual(BigInt(100).getLong());
      expect(BigInt(0).getULong()).assertEqual(BigInt(0).getLong());
      expect(BigInt(1).getULong()).assertEqual(BigInt(1).getLong());
      expect(BigInt(2147483647).getULong()).assertEqual(BigInt(2147483647).getLong());
      expect(BigInt(9223372036854775807).getULong()).assertEqual(BigInt(9223372036854775807).getLong());
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0019
     * @tc.name testBigIntGetULongMultiDigitNumericValues0019
     * @tc.desc getULong for various multi-digit numeric values (palindromes, squares, cubes)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongMultiDigitNumericValues0019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10000).getULong()).assertEqual(10000);
      expect(BigInt(123456).getULong()).assertEqual(123456);
      expect(BigInt(12321).getULong()).assertEqual(12321);
      expect(BigInt(1001).getULong()).assertEqual(1001);
      expect(BigInt(97).getULong()).assertEqual(97);
      expect(BigInt(255).getULong()).assertEqual(255);
    });


    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0020
     * @tc.name testBigIntGetULongHugeOverflow0020
     * @tc.desc getULong for extremely large values (2^127, 2^128 range) wrapping behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongHugeOverflow0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('170141183460469231731687303715884105728'))).assertEqual('0');
      expect(Utils.ulongRoundTrip(BigInt('170141183460469231731687303715884105729'))).assertEqual('1');
      expect(Utils.ulongRoundTrip(BigInt('340282366920938463463374607431768211456'))).assertEqual('0');
      expect(Utils.ulongRoundTrip(BigInt('340282366920938463463374607431768211455'))).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0021
     * @tc.name testBigIntGetULongDecadePowers0021
     * @tc.desc getULong for positive decade powers within uint64 range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongDecadePowers0021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('100000000'))).assertEqual('100000000');
      expect(Utils.ulongRoundTrip(BigInt('1000000000'))).assertEqual('1000000000');
      expect(Utils.ulongRoundTrip(BigInt('10000000000'))).assertEqual('10000000000');
      expect(Utils.ulongRoundTrip(BigInt('100000000000'))).assertEqual('100000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0022
     * @tc.name testBigIntGetULongNegativeLargeMagnitude0022
     * @tc.desc getULong for large negative magnitude values (millions/billions)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongNegativeLargeMagnitude0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt(-123456789))).assertEqual('18446744073586094827');
      expect(Utils.ulongRoundTrip(BigInt(-987654321))).assertEqual('18446744072721897295');
      expect(Utils.ulongRoundTrip(BigInt(-2000000000))).assertEqual('18446744071709551616');
      expect(Utils.ulongRoundTrip(BigInt(-5000000000))).assertEqual('18446744068709551616');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0023
     * @tc.name testBigIntGetULongOverflowAddends0023
     * @tc.desc getULong for values just above overflow boundary (+100, +1000) wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongOverflowAddends0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('18446744073709551715'))).assertEqual('99');
      expect(Utils.ulongRoundTrip(BigInt('18446744073709552615'))).assertEqual('999');
      expect(Utils.ulongRoundTrip(BigInt('18446744073709561615'))).assertEqual('9999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0024
     * @tc.name testBigIntGetULongDoubleOverflowOverlay0024
     * @tc.desc getULong for overflow overlay values (2*2^64, 4*2^64 boundaries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongDoubleOverflowOverlay0024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('36893488147419103231'))).assertEqual('18446744073709551615');
      expect(Utils.ulongRoundTrip(BigInt('73786976294838206462'))).assertEqual('18446744073709551614');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0025
     * @tc.name testBigIntGetULongDecadeOverflow0025
     * @tc.desc getULong for positive and negative 10^19 overflow values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongDecadeOverflow0025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('10000000000000000000'))).assertEqual('10000000000000000000');
      expect(Utils.ulongRoundTrip(BigInt('-10000000000000000000'))).assertEqual('8446744073709551616');
    });

    /**
     * @tc.number SUB_BIGINT_STD_GETULONG_0026
     * @tc.name testBigIntGetULongLargeDigitString0026
     * @tc.desc getULong for large digit string values (19-40 digits) round-trip and non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetULongLargeDigitString0026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Utils.ulongRoundTrip(BigInt('1234567890123456789'))).assertEqual('1234567890123456789');
      expect(Utils.ulongRoundTrip(BigInt('9876543210987654321'))).assertEqual('9876543210987654321');

      const r = BigInt('111111111111111111111').getULong();
      const restored = BigInt.fromULong(r);
      expect(restored).not().assertNull();
      expect(restored.toString()).assertEqual(BigInt('430646668853801415').toString());

      const r2 = BigInt('1234567890123456789012345678901234567890').getULong();
      const restored2 = BigInt.fromULong(r2);
      expect(restored2).not().assertNull();
      expect(restored2.getULong()).assertEqual(r2);
    });
  });
}
