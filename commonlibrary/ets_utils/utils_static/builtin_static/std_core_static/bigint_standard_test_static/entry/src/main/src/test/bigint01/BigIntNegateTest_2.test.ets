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

export default function BigIntNegateTest_2(): void {
  describe('BigInt.negate - efficient extension', (): void => {
    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0012
     * @tc.name testBigIntNegateByteBoundary0012
     * @tc.desc Verify BigInt.negate on byte range boundaries 127 and -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0012
     * @tc.name testBigIntNegateTypeBoundaryBatch0012
     * @tc.desc Verify BigInt.negate on byte/short/int type boundaries (合并 #012 #013 #014)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateTypeBoundaryBatch0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: Array<[BigInt, string]> = [
        [BigInt(127), '-127'], [BigInt(-128), '128'],
        [BigInt(32767), '-32767'], [BigInt(-32768), '32768'],
        [BigInt(2147483647), '-2147483647'], [BigInt(-2147483648), '2147483648'],
      ];
      for (let i = 0; i < data.length; i++) {
        expect(data[i][0].negate().toString()).assertEqual(data[i][1]);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0015
     * @tc.name testBigIntNegateLongAdjacent0015
     * @tc.desc Verify BigInt.negate on long adjacent values near boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongAdjacent0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775800').negate().toString()).assertEqual('-9223372036854775800');
      expect(BigInt('-9223372036854775800').negate().toString()).assertEqual('9223372036854775800');
      expect(BigInt('-9223372036854775807').negate().toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0016
     * @tc.name testBigIntNegatePow20016
     * @tc.desc Verify BigInt.negate on powers of 2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePow20016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).negate().toString()).assertEqual('-2');
      expect(BigInt(4).negate().toString()).assertEqual('-4');
      expect(BigInt(65536).negate().toString()).assertEqual('-65536');
      expect(BigInt(-65536).negate().toString()).assertEqual('65536');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0017
     * @tc.name testBigIntNegateCrossTypeBoundaryBatch0017
     * @tc.desc Verify BigInt.negate on values crossing byte/short/int boundaries (合并 #017 #018 #019)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCrossTypeBoundaryBatch0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: Array<[BigInt, string]> = [
        [BigInt(128), '-128'], [BigInt(-129), '129'], [BigInt(255), '-255'],
        [BigInt(32768), '-32768'], [BigInt(-32769), '32769'], [BigInt(65535), '-65535'],
        [BigInt(2147483648), '-2147483648'], [BigInt(-2147483649), '2147483649'], [BigInt('4294967295'), '-4294967295'],
      ];
      for (let i = 0; i < data.length; i++) {
        expect(data[i][0].negate().toString()).assertEqual(data[i][1]);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0022
     * @tc.name testBigIntNegateLongZone0022
     * @tc.desc Verify BigInt.negate on values in the long integer zone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongZone0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483648).negate().toString()).assertEqual('-2147483648');
      expect(BigInt(-2147483649).negate().toString()).assertEqual('2147483649');
      expect(BigInt('9223372036854775806').negate().toString()).assertEqual('-9223372036854775806');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0023
     * @tc.name testBigIntNegateSmallSymmetry0023
     * @tc.desc Verify BigInt.negate symmetry for values 1 through 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateSmallSymmetry0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 1; i <= 10; i++) {
        expect(BigInt(-i).negate().toString()).assertEqual(BigInt(i).toString());
        expect(BigInt(i).negate().toString()).assertEqual(BigInt(-i).toString());
      }
    });

    const BIG40 = '1234567890123456789012345678901234567890';
    const BIG50ALL9 = '99999999999999999999999999999999999999999999999999';
    const BIG80 = '99999999999999999999999999999999999999999999999999999999999999999999999999999999';
    const BIG100_1 = '1' + '0'.repeat(99);
    const BIG150 = '9999' + '9'.repeat(146);
    const BIG300_1 = '1'.repeat(300);

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0024
     * @tc.name testBigIntNegateLarge40_500024
     * @tc.desc Verify BigInt.negate on 40-digit and 50-digit magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge40_500024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BIG40).negate().toString()).assertEqual('-' + BIG40);
      expect(BigInt('-' + BIG40).negate().toString()).assertEqual(BIG40);
      expect(BigInt(BIG50ALL9).negate().toString()).assertEqual('-' + BIG50ALL9);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0025
     * @tc.name testBigIntNegateLarge80_1000025
     * @tc.desc Verify BigInt.negate on 80-digit and 100-digit magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge80_1000025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BIG80).negate().negate().toString()).assertEqual(BIG80);
      expect(BigInt(BIG100_1).negate().toString()).assertEqual('-' + BIG100_1);
      expect(BigInt('-' + BIG100_1).negate().toString()).assertEqual(BIG100_1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0026
     * @tc.name testBigIntNegateLarge150_3000026
     * @tc.desc Verify BigInt.negate on 150-digit and 300-digit magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge150_3000026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BIG150).negate().negate().toString()).assertEqual(BIG150);
      expect(BigInt(BIG300_1).negate().negate().toString()).assertEqual(BIG300_1);
      expect(BigInt(BIG300_1).negate().negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0027
     * @tc.name testBigIntNegateAllNineRep0027
     * @tc.desc Verify BigInt.negate on 100-digit and 200-digit all-9 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateAllNineRep0027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9'.repeat(100)).negate().toString()).assertEqual('-' + '9'.repeat(100));
      expect(BigInt('9'.repeat(200)).negate().toString()).assertEqual('-' + '9'.repeat(200));
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0028
     * @tc.name testBigIntNegateHugeZeroEdge0028
     * @tc.desc Verify BigInt.negate on huge number with a leading digit 1 followed by 300 zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateHugeZeroEdge0028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = '1' + '0'.repeat(300);
      expect(BigInt('-' + s).negate().toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0029
     * @tc.name testBigIntNegateMixPattern0029
     * @tc.desc Verify BigInt.negate on mixed digit pattern large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateMixPattern0029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = '1928374655647382910' + '37482910192837465'.repeat(5);
      expect(BigInt(s).negate().negate().toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0030
     * @tc.name testBigIntNegateConsistBatch0030
     * @tc.desc Verify BigInt.negate produces same result across all constructor formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateConsistBatch0030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).negate().toString()).assertEqual(BigInt('0').negate().toString());
      expect(BigInt(0).negate().toString()).assertEqual(BigInt('0x0').negate().toString());
      expect(BigInt(0).negate().toString()).assertEqual(BigInt(false).negate().toString());
      expect(BigInt(1).negate().toString()).assertEqual(BigInt('1').negate().toString());
      expect(BigInt(1).negate().toString()).assertEqual(BigInt(true).negate().toString());
      expect(BigInt(255).negate().toString()).assertEqual(BigInt('0xFF').negate().toString());
      expect(BigInt(65535).negate().toString()).assertEqual(BigInt('0xFFFF').negate().toString());
      expect(BigInt(63).negate().toString()).assertEqual(BigInt('0o77').negate().toString());
      expect(BigInt(255).negate().toString()).assertEqual(BigInt('0b11111111').negate().toString());
      const big = '123456789012345678901234567890';
      expect(BigInt(big).negate().toString()).assertEqual(BigInt(big).negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0038
     * @tc.name testBigIntNegateArithBatch0038
     * @tc.desc Verify negate combined with add/sub/mul/div/mod/inc/dec/bitwise/shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateArithBatch0038', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).negate().operatorAdd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(42).negate().operatorAdd(BigInt(42)).toString()).assertEqual('0');
      expect(BigInt(127).negate().operatorAdd(BigInt(127)).toString()).assertEqual('0');
      expect(BigInt(10).negate().operatorAdd(BigInt(3)).toString()).assertEqual('-7');
      expect(BigInt(10).negate().operatorSubtract(BigInt(3)).toString()).assertEqual('-13');
      expect(BigInt(5).negate().operatorMultiply(BigInt(3)).toString()).assertEqual('-15');
      expect(BigInt(10).operatorAdd(BigInt(5)).negate().toString()).assertEqual('-15');
      expect(BigInt(5).negate().operatorSubtract(BigInt(5)).negate().toString()).assertEqual('10');
      expect(BigInt(10).operatorModule(BigInt(3)).negate().toString()).assertEqual('-1');
      expect(BigInt(100).operatorDivide(BigInt(4)).negate().toString()).assertEqual('-25');
      expect(BigInt(2).pow(BigInt(10)).negate().toString()).assertEqual('-1024');
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorSubtract(BigInt(5)).negate().toString()).assertEqual('-25');
      expect(BigInt(100).operatorDivide(BigInt(5)).operatorMultiply(BigInt(2)).negate().toString()).assertEqual('-40');
      expect(BigInt(5).operatorAdd(BigInt(3)).negate().operatorMultiply(BigInt(2)).toString()).assertEqual('-16');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0050
     * @tc.name testBigIntNegateChainParity0050
     * @tc.desc Verify even count of negate restores original, odd count equals single negate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateChainParity0050', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const vals: BigInt[] = [BigInt(42), BigInt(-42), BigInt(127), BigInt(-128),
        BigInt(32767), BigInt(2147483647), BigInt('999999999999999999999999999999'),
        BigInt(1), BigInt(50), BigInt(33), BigInt(-33)];
      for (let i = 0; i < vals.length; i++) {
        const orig: string = vals[i].toString();
        expect(vals[i].negate().negate().toString()).assertEqual(orig);
        expect(vals[i].negate().toString()).assertEqual(vals[i].negate().negate().negate().toString());
      }
      expect(BigInt(1).negate().negate().negate().negate().negate().toString()).assertEqual('-1');
      expect(BigInt(50).negate().negate().negate().negate().toString()).assertEqual('50');
      expect(BigInt(10).negate().operatorAdd(BigInt(10)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0051
     * @tc.name testBigIntNegateChainZero0051
     * @tc.desc Verify negate chained any number of times on zero always yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateChainZero0051', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 10; i++) {
        let v: BigInt = BigInt(0);
        for (let j = 0; j < i; j++) {
          v = v.negate();
        }
        expect(v.toString()).assertEqual('0');
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0052
     * @tc.name testBigIntNegateFromULongBatch0052
     * @tc.desc Verify BigInt.negate on fromULong values: basic, boundaries, int range (合并 #052 #053 #054)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongBatch0052', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: Array<[BigInt, string]> = [
        [BigInt.fromULong(0), '0'],
        [BigInt.fromULong(1), '-1'],
        [BigInt.fromULong(-1), '-18446744073709551615'],
        [BigInt.fromULong(100), '-100'],
        [BigInt.fromULong(-2), '-18446744073709551614'],
        [BigInt.fromULong(127), '-127'],
        [BigInt.fromULong(128), '-128'],
        [BigInt.fromULong(255), '-255'],
        [BigInt.fromULong(32767), '-32767'],
        [BigInt.fromULong(32768), '-32768'],
        [BigInt.fromULong(65535), '-65535'],
        [BigInt.fromULong(2147483647), '-2147483647'],
        [BigInt.fromULong(2147483648), '-2147483648'],
        [BigInt.fromULong(4294967295), '-4294967295'],
      ];
      for (let i = 0; i < data.length; i++) {
        expect(data[i][0].negate().toString()).assertEqual(data[i][1]);
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0055
     * @tc.name testBigIntNegateFromULongLarge0055
     * @tc.desc Verify BigInt.negate on fromULong large and negative input values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongLarge0055', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1099511627775).negate().toString()).assertEqual('-1099511627775');
      expect(BigInt.fromULong(-128).negate().toString()).assertEqual('-18446744073709551488');
      expect(BigInt.fromULong(-32768).negate().toString()).assertEqual('-18446744073709518848');
      expect(BigInt.fromULong(-2147483648).negate().toString()).assertEqual('-18446744071562067968');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0056
     * @tc.name testBigIntNegateFromULongNegChain0056
     * @tc.desc Verify BigInt.negate chain parity on fromULong constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongNegChain0056', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(42).negate().negate().toString()).assertEqual('42');
      expect(BigInt.fromULong(-1).negate().negate().toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(42)
        .negate()
        .negate()
        .negate()
        .toString()).assertEqual('-42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0057
     * @tc.name testBigIntNegateFromULongAllOnes0057
     * @tc.desc Verify BigInt.negate on fromULong(-1) max unsigned value and sign check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongAllOnes0057', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ulMax: BigInt = BigInt.fromULong(-1);
      expect(ulMax.negate().toString()).assertEqual('-18446744073709551615');
      expect(ulMax.negate().negative()).assertTrue();
      expect(BigInt.fromULong(-65536).negate().negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0059
     * @tc.name testBigIntNegateFromULongAddInv0059
     * @tc.desc Verify negate as additive inverse on fromULong constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongAddInv0059', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1).negate().operatorAdd(BigInt.fromULong(1)).toString()).assertEqual('0');
      expect(BigInt.fromULong(42).negate().operatorAdd(BigInt.fromULong(42)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0062
     * @tc.name testBigIntNegateNegResult0062
     * @tc.desc Verify negate on results of arithmetic with all-negative inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateNegResult0062', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).operatorAdd(BigInt(-5)).negate().toString()).assertEqual('15');
      expect(BigInt(-10).operatorMultiply(BigInt(5)).negate().toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0063
     * @tc.name testBigIntNegateDistributive0063
     * @tc.desc Verify distributive law of negate over add and multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDistributive0063', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(5)).negate().toString())
        .assertEqual(BigInt(10).negate().operatorAdd(BigInt(5).negate()).toString());
      expect(BigInt(10).operatorMultiply(BigInt(5)).negate().toString())
        .assertEqual(BigInt(10).negate().operatorMultiply(BigInt(5)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0064
     * @tc.name testBigIntNegateLargeArith0064
     * @tc.desc Verify negate on arithmetic results with large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLargeArith0064', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big = '99999999999999999999';
      expect(BigInt(big).operatorAdd(BigInt(1)).negate().toString()).assertEqual('-100000000000000000000');
      expect(BigInt('123456789').operatorMultiply(BigInt('987654321')).negate().negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0065
     * @tc.name testBigIntNegateResultZero0065
     * @tc.desc Verify negate on arithmetic results that yield zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateResultZero0065', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorSubtract(BigInt(5)).negate().toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(999)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0066
     * @tc.name testBigIntNegateIncrement0066
     * @tc.desc Verify negate on operatorIncrement results for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIncrement0066', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorIncrement().negate().toString()).assertEqual('-6');
      expect(BigInt(-5).operatorIncrement().negate().toString()).assertEqual('4');
      expect(BigInt(0).operatorIncrement().negate().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0067
     * @tc.name testBigIntNegateDecrement0067
     * @tc.desc Verify negate on operatorDecrement results for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDecrement0067', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorDecrement().negate().toString()).assertEqual('-4');
      expect(BigInt(-5).operatorDecrement().negate().toString()).assertEqual('6');
      expect(BigInt(0).operatorDecrement().negate().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0068
     * @tc.name testBigIntNegateIncDecChain0068
     * @tc.desc Verify negate in chained increment/decrement expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIncDecChain0068', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorIncrement().negate().operatorDecrement().toString()).assertEqual('-7');
      expect(BigInt(5).operatorDecrement().negate().operatorIncrement().toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0069
     * @tc.name testBigIntNegateIncDecBnd0069
     * @tc.desc Verify negate on increment/decrement at type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIncDecBnd0069', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorIncrement().negate().toString()).assertEqual('-128');
      expect(BigInt(-128).operatorDecrement().negate().toString()).assertEqual('129');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0070
     * @tc.name testBigIntNegateModule0070
     * @tc.desc Verify negate on operatorModule results with various signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateModule0070', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorModule(BigInt(3)).negate().toString()).assertEqual('-1');
      expect(BigInt(-10).operatorModule(BigInt(3)).negate().toString()).assertEqual('1');
      expect(BigInt(100).operatorModule(BigInt(7)).negate().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0071
     * @tc.name testBigIntNegateModuleBnd0071
     * @tc.desc Verify negate on operatorModule results with zero and identity inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateModuleBnd0071', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorModule(BigInt(1)).negate().toString()).assertEqual('0');
      expect(BigInt(1).operatorModule(BigInt(1)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0072
     * @tc.name testBigIntNegateBitwiseNot0072
     * @tc.desc Verify negate on operatorBitwiseNot: identity property negate(not(x)) = x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseNot0072', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorBitwiseNot().negate().toString()).assertEqual('6');
      expect(BigInt(-5).operatorBitwiseNot().negate().toString()).assertEqual('-4');
      expect(BigInt(0).operatorBitwiseNot().negate().toString()).assertEqual('1');
      expect(BigInt(1).operatorBitwiseNot().negate().toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0073
     * @tc.name testBigIntNegateShift0073
     * @tc.desc Verify negate on operatorLeftShift and operatorRightShift results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateShift0073', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLeftShift(BigInt(10)).negate().toString()).assertEqual('-1024');
      expect(BigInt(1024).operatorRightShift(BigInt(10)).negate().toString()).assertEqual('-1');
      expect(BigInt(-1).operatorLeftShift(BigInt(8)).negate().toString()).assertEqual('256');
      expect(BigInt(-1024).operatorRightShift(BigInt(10)).negate().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0074
     * @tc.name testBigIntNegateBitwiseAnd0074
     * @tc.desc Verify negate on operatorBitwiseAnd results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseAnd0074', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(6).operatorBitwiseAnd(BigInt(3)).negate().toString()).assertEqual('-2');
      expect(BigInt(-6).operatorBitwiseAnd(BigInt(3)).negate().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0075
     * @tc.name testBigIntNegateBitwiseOr0075
     * @tc.desc Verify negate on operatorBitwiseOr results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseOr0075', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(6).operatorBitwiseOr(BigInt(3)).negate().toString()).assertEqual('-7');
      expect(BigInt(-6).operatorBitwiseOr(BigInt(3)).negate().toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0076
     * @tc.name testBigIntNegateBitwiseXor0076
     * @tc.desc Verify negate on operatorBitwiseXor results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseXor0076', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(6).operatorBitwiseXor(BigInt(3)).negate().toString()).assertEqual('-5');
      expect(BigInt(-6).operatorBitwiseXor(BigInt(3)).negate().toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0077
     * @tc.name testBigIntNegateAsIntN0077
     * @tc.desc Verify negate on asIntN truncated results at 64-bit and 8-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateAsIntN0077', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(64, BigInt(100)).negate().toString()).assertEqual('-100');
      expect(BigInt.asIntN(64, BigInt(-100)).negate().toString()).assertEqual('100');
      expect(BigInt.asIntN(8, BigInt(255)).negate().toString()).assertEqual('1');
      expect(BigInt.asIntN(8, BigInt(-256)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0078
     * @tc.name testBigIntNegateAsUintN0078
     * @tc.desc Verify negate on asUintN truncated results at 64-bit and 8-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateAsUintN0078', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(64, BigInt(100)).negate().toString()).assertEqual('-100');
      expect(BigInt.asUintN(8, BigInt(255)).negate().toString()).assertEqual('-255');
      expect(BigInt.asUintN(8, BigInt(256)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0079
     * @tc.name testBigIntNegateGetLong0079
     * @tc.desc Verify getLong on negate results for normal and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateGetLong0079', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).negate().getLong()).assertEqual(-100);
      expect(BigInt('9223372036854775807').negate().getLong()).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0080
     * @tc.name testBigIntNegateGetULong0080
     * @tc.desc Verify getULong on negate results for unsigned long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateGetULong0080', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(100).negate().getULong()).assertEqual(-100);
      expect(BigInt.fromULong(-1).negate().getULong()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0081
     * @tc.name testBigIntNegateToStringRadix0081
     * @tc.desc Verify negate toString with hex, binary, and octal radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateToStringRadix0081', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negate().toString(16)).assertEqual('-ff');
      expect(BigInt(-255).negate().toString(16)).assertEqual('ff');
      expect(BigInt(255).negate().toString(2)).assertEqual('-11111111');
      expect(BigInt(63).negate().toString(8)).assertEqual('-77');
      expect(BigInt(35).negate().toString(36)).assertEqual('-z');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0082
     * @tc.name testBigIntNegateToStringRadixBnd0082
     * @tc.desc Verify negate toString with hex radix on long boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateToStringRadixBnd0082', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').negate().toString(16)).assertEqual('-7fffffffffffffff');
      expect(BigInt('-9223372036854775808').negate().toString(16)).assertEqual('8000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0083
     * @tc.name testBigIntNegateCopyConstructor0083
     * @tc.desc Verify negate on BigInt copy-constructed from another BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCopyConstructor0083', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const orig: BigInt = BigInt(100);
      const copy: BigInt = BigInt(orig);
      expect(copy.negate().toString()).assertEqual('-100');
      expect(copy.negate().toString()).assertEqual(orig.negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0084
     * @tc.name testBigIntNegateDoubleConstructor0084
     * @tc.desc Verify negate on BigInt constructed from double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDoubleConstructor0084', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromDouble: BigInt = BigInt(3.0);
      expect(fromDouble.negate().toString()).assertEqual('-3');
      const fromDoubleLarge: BigInt = BigInt(9007199254740991.0);
      expect(fromDoubleLarge.negate().toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0085
     * @tc.name testBigIntNegateEqualsSym0085
     * @tc.desc Verify equality symmetry: x.negate().equals(-x) holds for all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateEqualsSym0085', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).negate().equals(BigInt(-5))).assertTrue();
      expect(BigInt(-5).negate().equals(BigInt(5))).assertTrue();
      expect(BigInt(0).negate().equals(BigInt(0))).assertTrue();
      expect(BigInt.fromULong(255).negate().toString()).assertEqual(BigInt('255').negate().toString());
      expect(BigInt.fromULong(4294967295).negate().toString()).assertEqual(BigInt('4294967295').negate().toString());
      expect(BigInt.fromULong(100).negate().toString()).assertEqual(BigInt(100).negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0086
     * @tc.name testBigIntNegatePositiveSym0086
     * @tc.desc Verify positive/negative symmetry: negate flips the positive flag correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePositiveSym0086', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).negate().positive()).assertTrue();
      expect(BigInt(5).negate().positive()).assertFalse();
      expect(BigInt(0).negate().positive()).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0087
     * @tc.name testBigIntNegateMidDigits0087
     * @tc.desc Verify negate on mid-length digit values: 123456789, 65535, 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateMidDigits0087', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(123456789).negate().toString()).assertEqual('-123456789');
      expect(BigInt(-123456789).negate().toString()).assertEqual('123456789');
      expect(BigInt(100000).negate().toString()).assertEqual('-100000');
      expect(BigInt(-100000).negate().toString()).assertEqual('100000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0088
     * @tc.name testBigIntNegatePrimeSquareCube0088
     * @tc.desc Verify negate on special number types: prime 97, perfect square 10000, perfect cube 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePrimeSquareCube0088', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(97).negate().toString()).assertEqual('-97');
      expect(BigInt(-97).negate().toString()).assertEqual('97');
      expect(BigInt(10000).negate().toString()).assertEqual('-10000');
      expect(BigInt(-10000).negate().toString()).assertEqual('10000');
      expect(BigInt(1000000).negate().toString()).assertEqual('-1000000');
      expect(BigInt(-1000000).negate().toString()).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0089
     * @tc.name testBigIntNegatePalindromeSymmetry0089
     * @tc.desc Verify negate on palindrome and symmetric numbers: 12321, 1001, 55 (Fib)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePalindromeSymmetry0089', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12321).negate().toString()).assertEqual('-12321');
      expect(BigInt(-12321).negate().toString()).assertEqual('12321');
      expect(BigInt(1001).negate().toString()).assertEqual('-1001');
      expect(BigInt(-1001).negate().toString()).assertEqual('1001');
      expect(BigInt(55).negate().toString()).assertEqual('-55');
      expect(BigInt(-55).negate().toString()).assertEqual('55');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0090
     * @tc.name testBigIntNegateFactorial0090
     * @tc.desc Verify negate on factorial result 3628800 and large Fibonacci 1134903170
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFactorial0090', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3628800).negate().toString()).assertEqual('-3628800');
      expect(BigInt(-3628800).negate().toString()).assertEqual('3628800');
      expect(BigInt(1134903170).negate().toString()).assertEqual('-1134903170');
      expect(BigInt(-1134903170).negate().toString()).assertEqual('1134903170');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0091
     * @tc.name testBigIntNegatePow100091
     * @tc.desc Verify negate on powers of 10: 10^8, 10^9, 10^12, 10^15, 10^18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePow100091', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100000000).negate().toString()).assertEqual('-100000000');
      expect(BigInt(-100000000).negate().toString()).assertEqual('100000000');
      expect(BigInt(1000000000).negate().toString()).assertEqual('-1000000000');
      expect(BigInt(-1000000000).negate().toString()).assertEqual('1000000000');
      expect(BigInt(1000000000000).negate().toString()).assertEqual('-1000000000000');
      expect(BigInt(-1000000000000).negate().toString()).assertEqual('1000000000000');
      expect(BigInt(1000000000000000).negate().toString()).assertEqual('-1000000000000000');
      expect(BigInt(-1000000000000000).negate().toString()).assertEqual('1000000000000000');
      expect(BigInt('1000000000000000000').negate().toString()).assertEqual('-1000000000000000000');
      expect(BigInt('-1000000000000000000').negate().toString()).assertEqual('1000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0092
     * @tc.name testBigIntNegatePow2Large0092
     * @tc.desc Verify negate on large powers of 2: 2^40, 2^50, 2^60, 2^63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePow2Large0092', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1099511627776).negate().toString()).assertEqual('-1099511627776');
      expect(BigInt(-1099511627776).negate().toString()).assertEqual('1099511627776');
      expect(BigInt(1125899906842624).negate().toString()).assertEqual('-1125899906842624');
      expect(BigInt(-1125899906842624).negate().toString()).assertEqual('1125899906842624');
      expect(BigInt(1152921504606846976).negate().toString()).assertEqual('-1152921504606846976');
      expect(BigInt(-1152921504606846976).negate().toString()).assertEqual('1152921504606846976');
      expect(BigInt(9223372036854775807).negate().toString()).assertEqual('-9223372036854775807');
      expect(BigInt(-9223372036854775808).negate().toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0093
     * @tc.name testBigIntNegateCompoundArith0093
     * @tc.desc Verify negate on compound arithmetic: ((10+20)*3).negate(), (2^3^2).negate(), (10^20).negate()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCompoundArith0093', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorMultiply(BigInt(3)).negate().toString()).assertEqual('-90');
      expect(BigInt(2).pow(BigInt(3)).pow(BigInt(2)).negate().toString()).assertEqual('-64');
      expect(BigInt(10).pow(BigInt(20)).negate().toString()).assertEqual('-' + BigInt(10).pow(BigInt(20)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0094
     * @tc.name testBigIntNegateNegArithResult0094
     * @tc.desc Verify negate on result of negative arithmetic: (-100-200).negate() = 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateNegArithResult0094', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-100).operatorSubtract(BigInt(200)).negate().toString()).assertEqual('300');
      expect(BigInt(-100).operatorAdd(BigInt(-200)).negate().toString()).assertEqual('300');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0095
     * @tc.name testBigIntNegateExprEval0095
     * @tc.desc Verify negate on expression evaluations: ternary, array element, object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateExprEval0095', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((true ? BigInt(10) : BigInt(20)).negate().toString()).assertEqual('-10');
      expect([BigInt(10), BigInt(20)][0].negate().toString()).assertEqual('-10');
      const obj: Map<string, BigInt> = new Map<string, BigInt>();
      obj.set('a', BigInt(10));
      expect((obj.get('a') as BigInt).negate().toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0096
     * @tc.name testBigIntNegateMapSet0096
     * @tc.desc Verify negate on Map values and Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateMapSet0096', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const m: Map<string, BigInt> = new Map<string, BigInt>();
      m.set('k', BigInt(10));
      expect((m.get('k') as BigInt).negate().toString()).assertEqual('-10');
      const s: Set<BigInt> = new Set<BigInt>([BigInt(10)]);
      const iter: IterableIterator<BigInt> = s.values();
      expect((iter.next().value as BigInt).negate().toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0097
     * @tc.name testBigIntNegateStrLeadingZeros0097
     * @tc.desc Verify negate on leading-zero strings: '0000001', '-0000001', '00100', '000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateStrLeadingZeros0097', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0000001').negate().toString()).assertEqual('-1');
      expect(BigInt('-0000001').negate().toString()).assertEqual('1');
      expect(BigInt('00100').negate().toString()).assertEqual('-100');
      expect(BigInt('000').negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0098
     * @tc.name testBigIntNegateStrNegativeZero0098
     * @tc.desc Verify negate on string '-0' yields '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateStrNegativeZero0098', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-0').negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0099
     * @tc.name testBigIntNegateStr9990099
     * @tc.desc Verify negate on string '999' and '-999'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateStr9990099', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999').negate().toString()).assertEqual('-999');
      expect(BigInt('-999').negate().toString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_100
     * @tc.name testBigIntNegateLargeHex0100
     * @tc.desc Verify negate on large hex strings: 0xABCDEF, 0xFFFFFFFFFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLargeHex0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0xABCDEF').negate().toString()).assertEqual('-11259375');
      expect(BigInt('0xABCDEF').negate().negate().toString()).assertEqual('11259375');
      expect(BigInt('0xFFFFFFFFFFFFFFFF').negate().toString()).assertEqual('-18446744073709551615');
      expect(BigInt('0xFFFFFFFFFFFFFFFF').negate().negate().toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_101
     * @tc.name testBigIntNegateCopyConstructExt0101
     * @tc.desc Verify negate on BigInt copy-constructed from various source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCopyConstructExt0101', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(0)).negate().toString()).assertEqual('0');
      expect(BigInt(BigInt(42)).negate().toString()).assertEqual('-42');
      expect(BigInt(BigInt(-42)).negate().toString()).assertEqual('42');
      expect(BigInt(BigInt(1)).negate().toString()).assertEqual('-1');
      expect(BigInt(BigInt(-1)).negate().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_102
     * @tc.name testBigIntNegateCopyConstructLarge0102
     * @tc.desc Verify negate on copy-constructed large BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCopyConstructLarge0102', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt('18446744073709551616')).negate().toString()).assertEqual('-18446744073709551616');
      expect(BigInt(BigInt('-18446744073709551616')).negate().toString()).assertEqual('18446744073709551616');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_104
     * @tc.name testBigIntNegateToStringBin0104
     * @tc.desc Verify negate toString with binary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateToStringBin0104', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).negate().toString(2)).assertEqual('-101');
      expect(BigInt(255).negate().toString(2)).assertEqual('-11111111');
    });


    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_106
     * @tc.name testBigIntNegateLongHalfRange0106
     * @tc.desc Verify negate on long half-range values: -4611686018427387904 and 4611686018427387903
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongHalfRange0106', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-4611686018427387904).negate().toString()).assertEqual('4611686018427387904');
      expect(BigInt(4611686018427387903).negate().toString()).assertEqual('-4611686018427387903');
    });


    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_109
     * @tc.name testBigIntNegateIntHalfRange0109
     * @tc.desc Verify negate on int half-range values: 1073741824 and -1073741825
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIntHalfRange0109', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1073741824).negate().toString()).assertEqual('-1073741824');
      expect(BigInt(-1073741825).negate().toString()).assertEqual('1073741825');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_110
     * @tc.name testBigIntNegateLoop10000110
     * @tc.desc Verify negate in a 1000-iteration loop completes without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLoop10000110', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 1000; i++) {
        const v: BigInt = BigInt(i).negate();
        if (i > 0) {
          expect(v.negative()).assertTrue();
        } else {
          expect(v.negative()).assertFalse();
        }
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_111
     * @tc.name testBigIntNegateLoopBoundary0111
     * @tc.desc Verify negate on a range from -1000 to 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLoopBoundary0111', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = -1000; i <= 1000; i++) {
        expect(BigInt(i).negate().negate().toString()).assertEqual(BigInt(i).toString());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_112
     * @tc.name testBigIntNegateErrorHandling0112
     * @tc.desc Verify negate does not throw on zero, huge (200-digit), or long chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateErrorHandling0112', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const result: BigInt = BigInt(0).negate();
        expect(result.toString()).assertEqual('0');
      } catch (e) {
        caught = true;
      }
      expect(caught).assertFalse();

      caught = false;
      let bigStr: string = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      try {
        const result: BigInt = BigInt(bigStr).negate();
        if (!result.toString().startsWith('-')) {
          caught = true;
        }
      } catch (e) {
        caught = true;
      }
      expect(caught).assertFalse();

      caught = false;
      try {
        BigInt(1)
          .negate()
          .negate()
          .negate()
          .negate()
          .negate()
          .negate();
      } catch (e) {
        caught = true;
      }
      expect(caught).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_114
     * @tc.name testBigIntNegateLargeNegateChain0114
     * @tc.desc Verify large number double negate chain restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLargeNegateChain0114', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big: BigInt = BigInt('18446744073709551616');
      expect(big.negate().negate().equals(big)).assertTrue();
      expect(big.negate().negate().negate().toString()).assertEqual(big.negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_115
     * @tc.name testBigIntNegateDoubleValueConsistency0115
     * @tc.desc Verify negate flips doubleValue correctly for positive and negative inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDoubleValueConsistency0115', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(256).negate().doubleValue()).assertEqual(-256);
      expect(BigInt(-256).negate().doubleValue()).assertEqual(256);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_116
     * @tc.name testBigIntNegateImmutability0116
     * @tc.desc Verify negate does not mutate the original instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateImmutability0116', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original: BigInt = BigInt(42);
      original.negate();
      expect(original.toString()).assertEqual('42');
      expect(original.doubleValue()).assertEqual(42);

      const originalNeg: BigInt = BigInt(-42);
      originalNeg.negate();
      expect(originalNeg.toString()).assertEqual('-42');

      const originalSeven: BigInt = BigInt(7);
      originalSeven.negate();
      originalSeven.negate();
      expect(originalSeven.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_117
     * @tc.name testBigIntNegateHuge78Digit1170117
     * @tc.desc Mindmap: negate 78-digit 2^256 specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateHuge78Digit1170117', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge: string = '115792089237316195423570985008687907853269984665640564039457584007913129639936';
      expect(BigInt(huge).negate().toString()).assertEqual('-' + huge);
      expect(BigInt('-' + huge).negate().toString()).assertEqual(huge);
    });

  });
}