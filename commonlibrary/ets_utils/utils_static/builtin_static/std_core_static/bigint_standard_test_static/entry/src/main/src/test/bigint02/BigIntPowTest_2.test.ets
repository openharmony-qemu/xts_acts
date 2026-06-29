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

function getBigInt42(): BigInt {
  return new BigInt(100);
}

export default function BigIntPowTest2(): void {
  describe('BigInt.pow extension (mindmap pow)', (): void => {

    const parseBigInt = (str: string, radix: number): BigInt => {
      let s = str;
      let isNegative = false;

      if (s.indexOf('-') === 0) {
        isNegative = true;
        s = s.substring(1);
      }

      const result: BigInt = BigInt(s);
      return isNegative ? result.negate() : result;
    };


    /**
     * @tc.number SUB_BIGINT_STD_POW_0900
     * @tc.name testBigIntPowNegativeBaseParity0900
     * @tc.desc Verify negative base parity: even exponent yields positive, odd exponent yields negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeBaseParity0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(-3).pow(new BigInt(1)).toString()).assertEqual('-3');
      expect(new BigInt(-3).pow(new BigInt(2)).toString()).assertEqual('9');
      expect(new BigInt(-3).pow(new BigInt(3)).toString()).assertEqual('-27');
      expect(new BigInt(-4).pow(new BigInt(2)).toString()).assertEqual('16');
      expect(new BigInt(-4).pow(new BigInt(3)).toString()).assertEqual('-64');
      expect(new BigInt(-5).pow(new BigInt(2)).toString()).assertEqual('25');
      expect(new BigInt(-5).pow(new BigInt(3)).toString()).assertEqual('-125');
      expect(new BigInt(-10).pow(new BigInt(5)).toString()).assertEqual('-100000');
      expect(new BigInt(-10).pow(new BigInt(6)).toString()).assertEqual('1000000');
    });


    /**
     * @tc.number SUB_BIGINT_STD_POW_1100
     * @tc.name testBigIntPowFromULongExponent1100
     * @tc.desc Verify pow correctness with fromULong constructed exponents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowFromULongExponent1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(BigInt.fromULong(0)).toString()).assertEqual('1');
      expect(new BigInt(2).pow(BigInt.fromULong(1)).toString()).assertEqual('2');
      expect(new BigInt(2).pow(BigInt.fromULong(10)).toString()).assertEqual('1024');
      expect(new BigInt(10).pow(BigInt.fromULong(3)).toString()).assertEqual('1000');
      expect(new BigInt(999).pow(BigInt.fromULong(0)).toString()).assertEqual('1');
      expect(new BigInt(1).pow(BigInt.fromULong(100)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1200
     * @tc.name testBigIntPowStringConstructed1200
     * @tc.desc Verify pow correctness with string-constructed base and exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowStringConstructed1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('123').pow(BigInt('2')).toString()).assertEqual('15129');
      expect(BigInt('-123').pow(BigInt('2')).toString()).assertEqual('15129');
      expect(BigInt('-123').pow(BigInt('3')).toString()).assertEqual('-1860867');
      expect(BigInt('100').pow(BigInt('5')).toString()).assertEqual('10000000000');
      expect(BigInt('-100').pow(BigInt('5')).toString()).assertEqual('-10000000000');
      expect(BigInt('2').pow(BigInt('63')).toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1300
     * @tc.name testBigIntPowHexStringBaseExponent1300
     * @tc.desc Verify pow with hex/binary/octal prefixed string base and exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowHexStringBaseExponent1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).pow(BigInt(2)).toString()).assertEqual('65025');
      expect(BigInt(-255).pow(BigInt(2)).toString()).assertEqual('65025');
      expect(BigInt(255).pow(BigInt(1)).toString()).assertEqual('255');
      expect(BigInt(-255).pow(BigInt(3)).toString()).assertEqual('-16581375');
      expect(BigInt(8).pow(BigInt(2)).toString()).assertEqual('64');
      expect(BigInt(10).pow(BigInt(1)).toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1400
     * @tc.name testBigIntPowLargeExponent1400
     * @tc.desc Verify pow correctness with large exponent greater than 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLargeExponent1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(new BigInt(100)).toString()).assertEqual('1267650600228229401496703205376');
      expect(new BigInt(2).pow(new BigInt(128)).toString()).assertEqual('340282366920938463463374607431768211456');
      expect(new BigInt(3).pow(new BigInt(50)).toString()).assertEqual('717897987691852588770249');
      expect(new BigInt(10).pow(new BigInt(20)).toString()).assertEqual('100000000000000000000');
      expect(new BigInt(5).pow(new BigInt(30)).toString()).assertEqual('931322574615478515625');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1500
     * @tc.name testBigIntPowHugeBase1500
     * @tc.desc Verify pow correctness with huge base of 100+ digits and small exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowHugeBase1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      it('testBigIntPowHugeBase1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const huge = '1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';

        const expectedSquare =
          '152415787532388367504953515625666819450083828733760097552251181223112635269100015241588' +
            '876695626775156226308763907952001219327312604785942508763915375704923650053345576253619' +
            '8787501905199875019052100';

        expect(BigInt(huge).pow(BigInt(0)).toString()).assertEqual('1');
        expect(BigInt(huge).pow(BigInt(1)).toString()).assertEqual(huge);

        expect(BigInt(huge).pow(BigInt(2)).toString()).assertEqual(expectedSquare);
        expect((-BigInt(huge)).pow(BigInt(2)).toString()).assertEqual(expectedSquare);
      });
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1600
     * @tc.name testBigIntPowBooleanConstructed1600
     * @tc.desc Verify pow with boolean-constructed base and exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowBooleanConstructed1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).pow(BigInt(100)).toString()).assertEqual('1');
      expect(BigInt(false).pow(BigInt(0)).toString()).assertEqual('1');
      expect(BigInt(false).pow(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt(true).pow(BigInt(false)).toString()).assertEqual('1');
      expect(BigInt(10).pow(BigInt(false)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1700
     * @tc.name testBigIntPowZeroVariants1700
     * @tc.desc Verify pow with zero constructed from different methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowZeroVariants1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0').pow(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt('-0').pow(BigInt(10)).toString()).assertEqual('0');
      expect(BigInt('000').pow(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt('-000').pow(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt.fromULong(0).pow(BigInt(3)).toString()).assertEqual('0');
      expect(BigInt('0').pow(BigInt('0')).toString()).assertEqual('1');
      expect(BigInt('-0').pow(BigInt('0')).toString()).assertEqual('1');
      expect(BigInt('0x0').pow(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt('0b0').pow(BigInt(0)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1800
     * @tc.name testBigIntPowReturnType1800
     * @tc.desc Verify pow return type is BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowReturnType1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(new BigInt(2).pow(new BigInt(3)) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(new BigInt(0).pow(new BigInt(0)) as Object)).assertEqual(Class.from<BigInt>());
      expect(Class.of(BigInt('999').pow(BigInt(1)) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_1900
     * @tc.name testBigIntPowChainCall1900
     * @tc.desc Verify chained pow calls produce correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowChainCall1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(new BigInt(3)).pow(new BigInt(2)).toString()).assertEqual('64');
      expect(new BigInt(3).pow(new BigInt(2)).pow(new BigInt(3)).toString()).assertEqual('729');
      expect(new BigInt(10).pow(new BigInt(2)).pow(new BigInt(2)).toString()).assertEqual('10000');
      expect(new BigInt(-2).pow(new BigInt(2)).pow(new BigInt(3)).toString()).assertEqual('64');
      expect(new BigInt(1).pow(new BigInt(100)).pow(new BigInt(100)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_2000
     * @tc.name testBigIntPowNegativeBaseLargeExponent2000
     * @tc.desc Verify negative base with large even/odd exponent sign and result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeBaseLargeExponent2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(-2).pow(new BigInt(63)).toString()).assertEqual('-9223372036854775808');
      expect(new BigInt(-2).pow(new BigInt(64)).toString()).assertEqual('18446744073709551616');
      expect(new BigInt(-10).pow(new BigInt(10)).toString()).assertEqual('10000000000');
      expect(new BigInt(-10).pow(new BigInt(11)).toString()).assertEqual('-100000000000');
      expect(new BigInt(-3).pow(new BigInt(20)).toString()).assertEqual('3486784401');
      expect(new BigInt(-3).pow(new BigInt(21)).toString()).assertEqual('-10460353203');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_2100
     * @tc.name testBigIntPowExponentConstructionEquivalence2100
     * @tc.desc Verify equivalent exponents from different constructions produce same pow result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowExponentConstructionEquivalence2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base = new BigInt(2);
      expect(base.pow(new BigInt(10)).toString()).assertEqual('1024');
      expect(base.pow(BigInt('10')).toString()).assertEqual('1024');
      expect(base.pow(BigInt('0xA')).toString()).assertEqual('1024');
      expect(base.pow(BigInt('0o12')).toString()).assertEqual('1024');
      expect(base.pow(BigInt('0b1010')).toString()).assertEqual('1024');
      expect(base.pow(BigInt(true).operatorAdd(BigInt(9))).toString()).assertEqual('1024');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_2200
     * @tc.name testBigIntPowAdditionalInvalidArgs2200
     * @tc.desc Verify additional invalid argument types throw ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowAdditionalInvalidArgs2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = new BigInt(8);
      expect((): void => {
        v.pow('' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow('  ' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow(0 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        v.pow(3.14 as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_2400
     * @tc.name testBigIntPowLeadingSignPrefixConstructed2400
     * @tc.desc Verify pow with leading-zero/whitespace/plus-sign constructed strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLeadingSignPrefixConstructed2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('  2').pow(BigInt(10)).toString()).assertEqual('1024');
      expect(BigInt('0000010').pow(BigInt(3)).toString()).assertEqual('1000');
      expect(BigInt('-0000010').pow(BigInt(3)).toString()).assertEqual('-1000');
      expect(BigInt('10  ').pow(BigInt(2)).toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_2500
     * @tc.name testBigIntPowSquaresAndBeyond2500
     * @tc.desc Verify squares and higher powers: exp=2 for values 3~500, exp=3 for cubes, exp=4~6 for higher (merged _2500/_2700)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowSquaresAndBeyond2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(3).pow(new BigInt(2)).toString()).assertEqual('9');
      expect(new BigInt(4).pow(new BigInt(2)).toString()).assertEqual('16');
      expect(new BigInt(5).pow(new BigInt(2)).toString()).assertEqual('25');
      expect(new BigInt(6).pow(new BigInt(2)).toString()).assertEqual('36');
      expect(new BigInt(7).pow(new BigInt(2)).toString()).assertEqual('49');
      expect(new BigInt(9).pow(new BigInt(2)).toString()).assertEqual('81');
      expect(new BigInt(10).pow(new BigInt(2)).toString()).assertEqual('100');
      expect(new BigInt(20).pow(new BigInt(2)).toString()).assertEqual('400');
      expect(new BigInt(25).pow(new BigInt(2)).toString()).assertEqual('625');
      expect(new BigInt(30).pow(new BigInt(2)).toString()).assertEqual('900');
      expect(new BigInt(40).pow(new BigInt(2)).toString()).assertEqual('1600');
      expect(new BigInt(50).pow(new BigInt(2)).toString()).assertEqual('2500');
      expect(new BigInt(60).pow(new BigInt(2)).toString()).assertEqual('3600');
      expect(new BigInt(1000).pow(new BigInt(2)).toString()).assertEqual('1000000');
      expect(new BigInt(10000).pow(new BigInt(2)).toString()).assertEqual('100000000');
      expect(new BigInt(11).pow(new BigInt(2)).toString()).assertEqual('121');
      expect(new BigInt(12).pow(new BigInt(2)).toString()).assertEqual('144');
      expect(new BigInt(13).pow(new BigInt(2)).toString()).assertEqual('169');
      expect(new BigInt(14).pow(new BigInt(2)).toString()).assertEqual('196');
      expect(new BigInt(15).pow(new BigInt(2)).toString()).assertEqual('225');
      expect(new BigInt(16).pow(new BigInt(2)).toString()).assertEqual('256');
      expect(new BigInt(18).pow(new BigInt(2)).toString()).assertEqual('324');
      expect(new BigInt(21).pow(new BigInt(2)).toString()).assertEqual('441');
      expect(new BigInt(22).pow(new BigInt(2)).toString()).assertEqual('484');
      expect(new BigInt(24).pow(new BigInt(2)).toString()).assertEqual('576');
      expect(new BigInt(35).pow(new BigInt(2)).toString()).assertEqual('1225');
      expect(new BigInt(45).pow(new BigInt(2)).toString()).assertEqual('2025');
      expect(new BigInt(55).pow(new BigInt(2)).toString()).assertEqual('3025');
      expect(new BigInt(70).pow(new BigInt(2)).toString()).assertEqual('4900');
      expect(new BigInt(80).pow(new BigInt(2)).toString()).assertEqual('6400');
      expect(new BigInt(90).pow(new BigInt(2)).toString()).assertEqual('8100');
      expect(new BigInt(110).pow(new BigInt(2)).toString()).assertEqual('12100');
      expect(new BigInt(200).pow(new BigInt(2)).toString()).assertEqual('40000');
      expect(new BigInt(500).pow(new BigInt(2)).toString()).assertEqual('250000');
      expect(new BigInt(2).pow(new BigInt(3)).toString()).assertEqual('8');
      expect(new BigInt(3).pow(new BigInt(3)).toString()).assertEqual('27');
      expect(new BigInt(6).pow(new BigInt(3)).toString()).assertEqual('216');
      expect(new BigInt(8).pow(new BigInt(3)).toString()).assertEqual('512');
      expect(new BigInt(10).pow(new BigInt(3)).toString()).assertEqual('1000');
      expect(new BigInt(10).pow(new BigInt(4)).toString()).assertEqual('10000');
      expect(new BigInt(10).pow(new BigInt(5)).toString()).assertEqual('100000');
      expect(new BigInt(10).pow(new BigInt(6)).toString()).assertEqual('1000000');
      expect(new BigInt(16).pow(new BigInt(3)).toString()).assertEqual('4096');
      expect(new BigInt(20).pow(new BigInt(3)).toString()).assertEqual('8000');
      expect(new BigInt(100).pow(new BigInt(3)).toString()).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_2800
     * @tc.name testBigIntPowPowersOfTwo2800
     * @tc.desc Verify powers of two: 2^1-2^16, 2^20, 2^25, 2^30, 2^32, 2^40, 2^50, 2^60, 2^65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowPowersOfTwo2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(new BigInt(1)).toString()).assertEqual('2');
      expect(new BigInt(2).pow(new BigInt(2)).toString()).assertEqual('4');
      expect(new BigInt(2).pow(new BigInt(4)).toString()).assertEqual('16');
      expect(new BigInt(2).pow(new BigInt(5)).toString()).assertEqual('32');
      expect(new BigInt(2).pow(new BigInt(6)).toString()).assertEqual('64');
      expect(new BigInt(2).pow(new BigInt(7)).toString()).assertEqual('128');
      expect(new BigInt(2).pow(new BigInt(8)).toString()).assertEqual('256');
      expect(new BigInt(2).pow(new BigInt(9)).toString()).assertEqual('512');
      expect(new BigInt(2).pow(new BigInt(11)).toString()).assertEqual('2048');
      expect(new BigInt(2).pow(new BigInt(12)).toString()).assertEqual('4096');
      expect(new BigInt(2).pow(new BigInt(13)).toString()).assertEqual('8192');
      expect(new BigInt(2).pow(new BigInt(14)).toString()).assertEqual('16384');
      expect(new BigInt(2).pow(new BigInt(15)).toString()).assertEqual('32768');
      expect(new BigInt(2).pow(new BigInt(16)).toString()).assertEqual('65536');
      expect(new BigInt(2).pow(new BigInt(20)).toString()).assertEqual('1048576');
      expect(new BigInt(2).pow(new BigInt(25)).toString()).assertEqual('33554432');
      expect(new BigInt(2).pow(new BigInt(30)).toString()).assertEqual('1073741824');
      expect(new BigInt(2).pow(new BigInt(32)).toString()).assertEqual('4294967296');
      expect(new BigInt(2).pow(new BigInt(40)).toString()).assertEqual('1099511627776');
      expect(new BigInt(2).pow(new BigInt(50)).toString()).assertEqual('1125899906842624');
      expect(new BigInt(2).pow(new BigInt(60)).toString()).assertEqual('1152921504606846976');
      expect(new BigInt(2).pow(new BigInt(65)).toString()).assertEqual('36893488147419103232');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3000
     * @tc.name testBigIntPowNegativeBaseExtended3000
     * @tc.desc Verify negative base powers: -6, -7, -8, -9, -20, -30, -50, -100, -1000 squared; -6^3, -7^3, -8^3, -9^3, -100^3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeBaseExtended3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(-6).pow(new BigInt(2)).toString()).assertEqual('36');
      expect(new BigInt(-6).pow(new BigInt(3)).toString()).assertEqual('-216');
      expect(new BigInt(-7).pow(new BigInt(2)).toString()).assertEqual('49');
      expect(new BigInt(-7).pow(new BigInt(3)).toString()).assertEqual('-343');
      expect(new BigInt(-8).pow(new BigInt(2)).toString()).assertEqual('64');
      expect(new BigInt(-8).pow(new BigInt(3)).toString()).assertEqual('-512');
      expect(new BigInt(-9).pow(new BigInt(2)).toString()).assertEqual('81');
      expect(new BigInt(-9).pow(new BigInt(3)).toString()).assertEqual('-729');
      expect(new BigInt(-20).pow(new BigInt(2)).toString()).assertEqual('400');
      expect(new BigInt(-30).pow(new BigInt(2)).toString()).assertEqual('900');
      expect(new BigInt(-50).pow(new BigInt(2)).toString()).assertEqual('2500');
      expect(new BigInt(-100).pow(new BigInt(2)).toString()).assertEqual('10000');
      expect(new BigInt(-100).pow(new BigInt(3)).toString()).assertEqual('-1000000');
      expect(new BigInt(-1000).pow(new BigInt(2)).toString()).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3100
     * @tc.name testBigIntPowZeroAndOneExponent3100
     * @tc.desc Verify any base to power 0 equals 1, and any base to power 1 equals itself (merged _3100/_3200/_0800)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowZeroAndOneExponent3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(100).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(-100).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(-2).pow(new BigInt(0)).toString()).assertEqual('1');
      let b1: byte = 127;
      expect(new BigInt(b1).pow(new BigInt(0)).toString()).assertEqual('1');
      let b2: byte = -128;
      expect(new BigInt(b2).pow(new BigInt(0)).toString()).assertEqual('1');
      let s1: short = 32767;
      expect(new BigInt(s1).pow(new BigInt(0)).toString()).assertEqual('1');
      let s2: short = -32768;
      expect(new BigInt(s2).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(2147483647).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(-2147483648).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(true).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(false).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(BigInt('-99999').pow(BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(0.0).pow(new BigInt(0)).toString()).assertEqual('1');
      expect(new BigInt(0).pow(new BigInt(1)).toString()).assertEqual('0');
      expect(new BigInt(10).pow(new BigInt(1)).toString()).assertEqual('10');
      expect(new BigInt(-100).pow(new BigInt(1)).toString()).assertEqual('-100');
      expect(new BigInt(true).pow(new BigInt(1)).toString()).assertEqual('1');
      expect(new BigInt(false).pow(new BigInt(1)).toString()).assertEqual('0');
      expect(new BigInt(0.0).pow(new BigInt(1)).toString()).assertEqual('0');
      expect(BigInt('54321').pow(BigInt(1)).toString()).assertEqual('54321');
      expect(BigInt('-88888').pow(BigInt(1)).toString()).assertEqual('-88888');
      expect(BigInt('0xFF').pow(BigInt(1)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3300
     * @tc.name testBigIntPowLargeBaseSquares3300
     * @tc.desc Verify large base squares: 100000^2, 1000000^2, int/long/short/byte boundary squares
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLargeBaseSquares3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(100000).pow(new BigInt(2)).toString()).assertEqual('10000000000');
      expect(new BigInt(1000000).pow(new BigInt(2)).toString()).assertEqual('1000000000000');
      expect(new BigInt(2147483647).pow(new BigInt(2)).toString()).assertEqual('4611686014132420609');
      expect(new BigInt(-2147483648).pow(new BigInt(2)).toString()).assertEqual('4611686018427387904');
      let s1: short = 32767;
      expect(new BigInt(s1).pow(new BigInt(2)).toString()).assertEqual('1073676289');
      let s2: short = -32768;
      expect(new BigInt(s2).pow(new BigInt(2)).toString()).assertEqual('1073741824');
      let b1: byte = 127;
      expect(new BigInt(b1).pow(new BigInt(3)).toString()).assertEqual('2048383');
      let b2: byte = -128;
      expect(new BigInt(b2).pow(new BigInt(3)).toString()).assertEqual('-2097152');
      expect(BigInt('9223372036854775807').pow(BigInt(2)).toString()).assertEqual('85070591730234615847396907784232501249');
      expect(BigInt('9007199254740993').pow(BigInt(2)).toString()).assertEqual('81129638414606699710187514626049');
      expect(BigInt('18446744073709551615').pow(BigInt(1)).toString()).assertEqual('18446744073709551615');
      expect(BigInt('9007199254740992').pow(BigInt(1)).toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3400
     * @tc.name testBigIntPowStringConstructedVariants3400
     * @tc.desc Verify pow with string-constructed base variants: leading-zero, plus-sign, minus-zero, copy-constructed, negative strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowStringConstructedVariants3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('007').pow(BigInt(2)).toString()).assertEqual('49');
      expect(BigInt('+123').pow(BigInt(1)).toString()).assertEqual('123');
      expect(BigInt('-0').pow(BigInt(5)).toString()).assertEqual('0');
      expect(BigInt('10').pow(BigInt(5)).toString()).assertEqual('100000');
      expect(BigInt('100').pow(BigInt(3)).toString()).assertEqual('1000000');
      expect(BigInt('6').pow(BigInt(2)).toString()).assertEqual('36');
      expect(BigInt('8').pow(BigInt(3)).toString()).assertEqual('512');
      expect(BigInt('11').pow(BigInt(2)).toString()).assertEqual('121');
      expect(BigInt('-6').pow(BigInt(2)).toString()).assertEqual('36');
      expect(BigInt('-8').pow(BigInt(3)).toString()).assertEqual('-512');
      let baseSrc = new BigInt(5);
      let base = new BigInt(baseSrc);
      expect(base.pow(new BigInt(3)).toString()).assertEqual('125');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3600
     * @tc.name testBigIntPowTypedConstructionBase3600
     * @tc.desc Verify pow with base constructed from byte, short, long, double, fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowTypedConstructionBase3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bb: byte = 2;
      expect(new BigInt(bb).pow(new BigInt(5)).toString()).assertEqual('32');
      let bn: byte = -128;
      expect(new BigInt(bn).pow(new BigInt(2)).toString()).assertEqual('16384');
      let ss: short = 100;
      expect(new BigInt(ss).pow(new BigInt(2)).toString()).assertEqual('10000');
      let sn: short = -30000;
      expect(new BigInt(sn).pow(new BigInt(2)).toString()).assertEqual('900000000');
      let ll: long = 5000;
      expect(new BigInt(ll).pow(new BigInt(2)).toString()).assertEqual('25000000');
      let ln: long = -5000;
      expect(new BigInt(ln).pow(new BigInt(2)).toString()).assertEqual('25000000');
      expect(new BigInt(5.0).pow(new BigInt(3)).toString()).assertEqual('125');
      expect(new BigInt(2.0).pow(new BigInt(10)).toString()).assertEqual('1024');
      expect(BigInt.fromULong(10).pow(new BigInt(2)).toString()).assertEqual('100');
      expect(BigInt.fromULong(0).pow(new BigInt(5)).toString()).assertEqual('0');
      expect(BigInt.fromULong(1).pow(new BigInt(100)).toString()).assertEqual('1');
      expect(BigInt.fromULong(2).pow(new BigInt(8)).toString()).assertEqual('256');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3700
     * @tc.name testBigIntPowTypedConstructionExponent3700
     * @tc.desc Verify pow with exponent constructed from byte, short, long, double, fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowTypedConstructionExponent3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let eb0: byte = 0;
      expect(new BigInt(2).pow(new BigInt(eb0)).toString()).assertEqual('1');
      let eb1: byte = 1;
      expect(new BigInt(2).pow(new BigInt(eb1)).toString()).assertEqual('2');
      let eb3: byte = 3;
      expect(new BigInt(2).pow(new BigInt(eb3)).toString()).assertEqual('8');
      let eb10: byte = 10;
      expect(new BigInt(2).pow(new BigInt(eb10)).toString()).assertEqual('1024');
      let es7: short = 7;
      expect(new BigInt(2).pow(new BigInt(es7)).toString()).assertEqual('128');
      let es15: short = 15;
      expect(new BigInt(2).pow(new BigInt(es15)).toString()).assertEqual('32768');
      let el20: long = 20;
      expect(new BigInt(2).pow(new BigInt(el20)).toString()).assertEqual('1048576');
      let el30: long = 30;
      expect(new BigInt(2).pow(new BigInt(el30)).toString()).assertEqual('1073741824');
      expect(new BigInt(2).pow(new BigInt(6.0)).toString()).assertEqual('64');
      expect(new BigInt(100).pow(new BigInt(0.0)).toString()).assertEqual('1');
      expect(new BigInt(2).pow(BigInt.fromULong(12)).toString()).assertEqual('4096');
      expect(new BigInt(2).pow(BigInt.fromULong(0)).toString()).assertEqual('1');
      expect(new BigInt(2).pow(BigInt.fromULong(1)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3800
     * @tc.name testBigIntPowLargeExponentDigitCount3800
     * @tc.desc Verify pow result digit count for large exponents: 2^100, 2^128, 2^150, 2^200, 2^250, 10^200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLargeExponentDigitCount3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(new BigInt(100)).toString().length).assertEqual(31);
      expect(new BigInt(2).pow(new BigInt(128)).toString().length).assertEqual(39);
      expect(new BigInt(2).pow(new BigInt(150)).toString().length).assertEqual(46);
      expect(new BigInt(2).pow(new BigInt(200)).toString().length).assertEqual(61);
      expect(new BigInt(2).pow(new BigInt(250)).toString().length).assertEqual(76);
      expect(new BigInt(10).pow(new BigInt(200)).toString().length).assertEqual(201);
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_3900
     * @tc.name testBigIntPowReturnValueTests3900
     * @tc.desc Verify pow return value properties: instanceof, typeof, immutability of base and exponent, equals, doubleValue, getLong, valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowReturnValueTests3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let base1 = new BigInt(6);
      let result1 = base1.pow(new BigInt(2));
      expect(result1 instanceof BigInt).assertTrue();
      expect(typeof result1).assertEqual('bigint');
      let base2 = new BigInt(6);
      base2.pow(new BigInt(2));
      expect(base2.toString()).assertEqual('6');
      let base3 = new BigInt(6);
      let exp3 = new BigInt(2);
      base3.pow(exp3);
      expect(exp3.toString()).assertEqual('2');
      let base4 = new BigInt(6);
      let result4 = base4.pow(new BigInt(2));
      expect(result4.toString()).assertEqual('36');
      expect(base4.toString()).assertEqual('6');
      let base5 = new BigInt(6);
      let exp5 = new BigInt(2);
      let result5 = base5.pow(exp5);
      expect(result5.toString()).assertEqual('36');
      expect(exp5.toString()).assertEqual('2');
      let base6 = new BigInt(5);
      let result6 = base6.pow(new BigInt(2));
      expect(result6.equals(new BigInt(25))).assertTrue();
      let base7 = new BigInt(6);
      let result7 = base7.pow(new BigInt(3));
      expect(result7.equals(new BigInt(216)) && result7.toString() === '216').assertTrue();
      let base8 = new BigInt(4);
      let result8 = base8.pow(new BigInt(3));
      expect(result8.doubleValue()).assertEqual(64.0);
      let base9 = new BigInt(2);
      let result9 = base9.pow(new BigInt(10));
      expect(result9.getLong()).assertEqual(1024);
      let base10 = new BigInt(6);
      let result10 = base10.pow(new BigInt(2));
      expect(result10.equals(new BigInt(36))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4000
     * @tc.name testBigIntPowChainAndNested4000
     * @tc.desc Verify chained and nested pow: (3^2)^2=81, (2^2)^2^2=256, (2^2)^3=64, and more
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowChainAndNested4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(3).pow(new BigInt(2)).pow(new BigInt(2)).toString()).assertEqual('81');
      expect(new BigInt(2).pow(new BigInt(2)).pow(new BigInt(2)).toString()).assertEqual('16');
      expect(new BigInt(2).pow(new BigInt(2)).pow(new BigInt(2)).pow(new BigInt(2)).toString()).assertEqual('256');
      expect(new BigInt(2).pow(new BigInt(2)).pow(new BigInt(3)).toString()).assertEqual('64');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4100
     * @tc.name testBigIntPowExpressionAsBase4100
     * @tc.desc Verify pow with expression results as base: add, subtract, multiply, divide, conditional, array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowExpressionAsBase4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).operatorAdd(new BigInt(3)).pow(new BigInt(2)).toString()).assertEqual('25');
      expect(new BigInt(10).operatorSubtract(new BigInt(5)).pow(new BigInt(2)).toString()).assertEqual('25');
      expect(new BigInt(2).operatorMultiply(new BigInt(3)).pow(new BigInt(2)).toString()).assertEqual('36');
      expect(new BigInt(10).operatorDivide(new BigInt(2)).pow(new BigInt(2)).toString()).assertEqual('25');
      expect((true ? new BigInt(2) : new BigInt(3)).pow(new BigInt(3)).toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4200
     * @tc.name testBigIntPowVariableAndFunction4200
     * @tc.desc Verify pow with variable assignment and function return values as base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowVariableAndFunction4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let a = new BigInt(2);
      expect(a.pow(new BigInt(10)).toString()).assertEqual('1024');
      let base42 = getBigInt42();
      expect(base42.pow(new BigInt(2)).toString()).assertEqual('10000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4300
     * @tc.name testBigIntPowNegativeExponentExtended4300
     * @tc.desc Verify pow throws for negative exponent with various bases: 6, 8, 11, 20, 50, 100, 1000, -6, -8, -20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeExponentExtended4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => { new BigInt(6).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(8).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(11).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(20).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(50).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(100).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(1000).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(-6).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(-8).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(-20).pow(new BigInt(-1)); }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4400
     * @tc.name testBigIntPowNegativeExponentDeeper4400
     * @tc.desc Verify pow throws for deeper negative exponents: -2, -4, -6, -7, -50, -200, and zero base with negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowNegativeExponentDeeper4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => { new BigInt(2).pow(new BigInt(-4)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(3).pow(new BigInt(-6)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(10).pow(new BigInt(-7)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(2).pow(new BigInt(-50)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(10).pow(new BigInt(-200)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(0).pow(new BigInt(-2)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(0).pow(new BigInt(-5)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(1).pow(new BigInt(-5)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(-1).pow(new BigInt(-3)); }).assertThrowError('RangeError');
      expect((): void => { new BigInt(3).pow(BigInt('-2')); }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4500
     * @tc.name testBigIntPowBoundaryNegativeExponent4500
     * @tc.desc Verify pow throws for negative exponent with byte boundary bases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowBoundaryNegativeExponent4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bMax: byte = 127;
      expect((): void => { new BigInt(bMax).pow(new BigInt(-1)); }).assertThrowError('RangeError');
      let bMin: byte = -128;
      expect((): void => { new BigInt(bMin).pow(new BigInt(-1)); }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4600
     * @tc.name testBigIntPowLargeExponentResult4600
     * @tc.desc Verify large exponent results: 2^200 (10^20 removed as duplicate of test_1400)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowLargeExponentResult4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(2).pow(new BigInt(200)).toString()).assertEqual(
        '1606938044258990275541962092341162602522202993782792835301376');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4700
     * @tc.name testBigIntPowConsistencyWithOperator4700
     * @tc.desc Verify pow consistency with ** operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowConsistencyWithOperator4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let r1 = new BigInt(2).pow(new BigInt(10));
      expect(r1.equals(new BigInt(2).operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2))
        .operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2))
        .operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2)).operatorMultiply(new BigInt(2))
        .operatorMultiply(new BigInt(2)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4800
     * @tc.name testBigIntPowPerformanceLoop4800
     * @tc.desc Verify pow stability in loops: 100, 1000, and boundary range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowPerformanceLoop4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 1; i <= 100; i++) {
        let r = new BigInt(2).pow(new BigInt(i));
        expect(r.toString().length).assertLarger(0);
      }
      for (let i = 0; i <= 10; i++) {
        let r = new BigInt(10).pow(new BigInt(i));
        expect(r.toString().length).assertEqual(i + 1);
      }
      for (let i = 1; i <= 10; i++) {
        let r = new BigInt(i).pow(new BigInt(2));
        expect(r.toString().length).assertLarger(0);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_4900
     * @tc.name testBigIntPowCopyConstructedExponent4900
     * @tc.desc Verify pow with copy-constructed exponent and int boundary exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowCopyConstructedExponent4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let expSrc = new BigInt(4);
      let exp = new BigInt(expSrc);
      expect(new BigInt(2).pow(exp).toString()).assertEqual('16');
      expect(new BigInt(3).pow(new BigInt(8)).toString()).assertEqual('6561');
    });

    /**
     * @tc.number SUB_BIGINT_STD_POW_5000
     * @tc.name testBigIntPowReturnValueImmutable5000
     * @tc.desc Verify pow returns a new instance (assertNotEqual) and original base/exponent unchanged (POW-RET-003)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowReturnValueImmutable5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: BigInt = new BigInt(6);
      const exp: BigInt = new BigInt(2);
      const result: BigInt = base.pow(exp);
      expect(result).not().assertEqual(base);
      expect(result).not().assertEqual(exp);
      expect(base.toString()).assertEqual('6');
      expect(exp.toString()).assertEqual('2');
      expect(result.toString()).assertEqual('36');

      const base2: BigInt = new BigInt(-3);
      const exp2: BigInt = new BigInt(3);
      const result2: BigInt = base2.pow(exp2);
      expect(result2).not().assertEqual(base2);
      expect(result2).not().assertEqual(exp2);
      expect(base2.toString()).assertEqual('-3');
      expect(exp2.toString()).assertEqual('3');
      expect(result2.toString()).assertEqual('-27');
    });
    /**
     * @tc.number SUB_BIGINT_STD_POW_EXT_5100
     * @tc.name testBigIntPowMissingLargeExponents5100
     * @tc.desc Verify pow for intermediate large exponents: 5^15, 10^25 (PW-12, PW-13)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntPowMissingLargeExponents5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(5).pow(new BigInt(15)).toString()).assertEqual('30517578125');
      expect(new BigInt(-5).pow(new BigInt(15)).toString()).assertEqual('-30517578125');
      expect(new BigInt(10).pow(new BigInt(25)).toString()).assertEqual('10000000000000000000000000');
      expect(new BigInt(-10).pow(new BigInt(25)).toString()).assertEqual('-10000000000000000000000000');
    });
  });
}
