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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0800
     * @tc.name testBigIntNegateTypeBoundaryBatch0800
     * @tc.desc Verify BigInt.negate on byte/short/int type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateTypeBoundaryBatch0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_0900
     * @tc.name testBigIntNegateLongAdjacent0900
     * @tc.desc Verify BigInt.negate on long adjacent values near boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongAdjacent0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775800').negate().toString()).assertEqual('-9223372036854775800');
      expect(BigInt('-9223372036854775800').negate().toString()).assertEqual('9223372036854775800');
      expect(BigInt('-9223372036854775807').negate().toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1000
     * @tc.name testBigIntNegatePow1000
     * @tc.desc Verify BigInt.negate on powers of 2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePow1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).negate().toString()).assertEqual('-2');
      expect(BigInt(4).negate().toString()).assertEqual('-4');
      expect(BigInt(65536).negate().toString()).assertEqual('-65536');
      expect(BigInt(-65536).negate().toString()).assertEqual('65536');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1100
     * @tc.name testBigIntNegateCrossTypeBoundaryBatch1100
     * @tc.desc Verify BigInt.negate on values crossing byte/short/int boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCrossTypeBoundaryBatch1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1200
     * @tc.name testBigIntNegateLongZone1200
     * @tc.desc Verify BigInt.negate on values in the long integer zone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongZone1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483648).negate().toString()).assertEqual('-2147483648');
      expect(BigInt(-2147483649).negate().toString()).assertEqual('2147483649');
      expect(BigInt('9223372036854775806').negate().toString()).assertEqual('-9223372036854775806');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1300
     * @tc.name testBigIntNegateSmallSymmetry1300
     * @tc.desc Verify BigInt.negate symmetry for values 1 through 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateSmallSymmetry1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1400
     * @tc.name testBigIntNegateLarge1400
     * @tc.desc Verify BigInt.negate on 40-digit and 50-digit magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BIG40).negate().toString()).assertEqual('-' + BIG40);
      expect(BigInt('-' + BIG40).negate().toString()).assertEqual(BIG40);
      expect(BigInt(BIG50ALL9).negate().toString()).assertEqual('-' + BIG50ALL9);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1500
     * @tc.name testBigIntNegateLarge1500
     * @tc.desc Verify BigInt.negate on 80-digit and 100-digit magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BIG80).negate().negate().toString()).assertEqual(BIG80);
      expect(BigInt(BIG100_1).negate().toString()).assertEqual('-' + BIG100_1);
      expect(BigInt('-' + BIG100_1).negate().toString()).assertEqual(BIG100_1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1600
     * @tc.name testBigIntNegateLarge1600
     * @tc.desc Verify BigInt.negate on 150-digit and 300-digit magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLarge1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BIG150).negate().negate().toString()).assertEqual(BIG150);
      expect(BigInt(BIG300_1).negate().negate().toString()).assertEqual(BIG300_1);
      expect(BigInt(BIG300_1).negate().negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1700
     * @tc.name testBigIntNegateAllNineRep1700
     * @tc.desc Verify BigInt.negate on 100-digit and 200-digit all-9 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateAllNineRep1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9'.repeat(100)).negate().toString()).assertEqual('-' + '9'.repeat(100));
      expect(BigInt('9'.repeat(200)).negate().toString()).assertEqual('-' + '9'.repeat(200));
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1800
     * @tc.name testBigIntNegateHugeZeroEdge1800
     * @tc.desc Verify BigInt.negate on huge number with a leading digit 1 followed by 300 zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateHugeZeroEdge1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = '1' + '0'.repeat(300);
      expect(BigInt('-' + s).negate().toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_1900
     * @tc.name testBigIntNegateMixPattern1900
     * @tc.desc Verify BigInt.negate on mixed digit pattern large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateMixPattern1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s = '1928374655647382910' + '37482910192837465'.repeat(5);
      expect(BigInt(s).negate().negate().toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2000
     * @tc.name testBigIntNegateConsistBatch2000
     * @tc.desc Verify BigInt.negate produces same result across all constructor formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateConsistBatch2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2100
     * @tc.name testBigIntNegateArithBatch2100
     * @tc.desc Verify negate combined with add/sub/mul/div/mod/inc/dec/bitwise/shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateArithBatch2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2200
     * @tc.name testBigIntNegateChainParity2200
     * @tc.desc Verify even count of negate restores original, odd count equals single negate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateChainParity2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2300
     * @tc.name testBigIntNegateChainZero2300
     * @tc.desc Verify negate chained any number of times on zero always yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateChainZero2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = 0; i < 10; i++) {
        let v: BigInt = BigInt(0);
        for (let j = 0; j < i; j++) {
          v = v.negate();
        }
        expect(v.toString()).assertEqual('0');
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2400
     * @tc.name testBigIntNegateFromULongBatch2400
     * @tc.desc Verify BigInt.negate on fromULong values: basic, boundaries, int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongBatch2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2500
     * @tc.name testBigIntNegateFromULongLarge2500
     * @tc.desc Verify BigInt.negate on fromULong large and negative input values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongLarge2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1099511627775).negate().toString()).assertEqual('-1099511627775');
      expect(BigInt.fromULong(-128).negate().toString()).assertEqual('-18446744073709551488');
      expect(BigInt.fromULong(-32768).negate().toString()).assertEqual('-18446744073709518848');
      expect(BigInt.fromULong(-2147483648).negate().toString()).assertEqual('-18446744071562067968');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2600
     * @tc.name testBigIntNegateFromULongNegChain2600
     * @tc.desc Verify BigInt.negate chain parity on fromULong constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongNegChain2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(42).negate().negate().toString()).assertEqual('42');
      expect(BigInt.fromULong(-1).negate().negate().toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(42)
        .negate()
        .negate()
        .negate()
        .toString()).assertEqual('-42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2700
     * @tc.name testBigIntNegateFromULongAllOnes2700
     * @tc.desc Verify BigInt.negate on fromULong(-1) max unsigned value and sign check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongAllOnes2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ulMax: BigInt = BigInt.fromULong(-1);
      expect(ulMax.negate().toString()).assertEqual('-18446744073709551615');
      expect(ulMax.negate().negative()).assertTrue();
      expect(BigInt.fromULong(-65536).negate().negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2800
     * @tc.name testBigIntNegateFromULongAddInv2800
     * @tc.desc Verify negate as additive inverse on fromULong constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFromULongAddInv2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1).negate().operatorAdd(BigInt.fromULong(1)).toString()).assertEqual('0');
      expect(BigInt.fromULong(42).negate().operatorAdd(BigInt.fromULong(42)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_2900
     * @tc.name testBigIntNegateNegResult2900
     * @tc.desc Verify negate on results of arithmetic with all-negative inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateNegResult2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).operatorAdd(BigInt(-5)).negate().toString()).assertEqual('15');
      expect(BigInt(-10).operatorMultiply(BigInt(5)).negate().toString()).assertEqual('50');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_3000
     * @tc.name testBigIntNegateDistributive3000
     * @tc.desc Verify distributive law of negate over add and multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDistributive3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(5)).negate().toString())
        .assertEqual(BigInt(10).negate().operatorAdd(BigInt(5).negate()).toString());
      expect(BigInt(10).operatorMultiply(BigInt(5)).negate().toString())
        .assertEqual(BigInt(10).negate().operatorMultiply(BigInt(5)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_3800
     * @tc.name testBigIntNegateLargeArith3800
     * @tc.desc Verify negate on arithmetic results with large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLargeArith3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big = '99999999999999999999';
      expect(BigInt(big).operatorAdd(BigInt(1)).negate().toString()).assertEqual('-100000000000000000000');
      expect(BigInt('123456789').operatorMultiply(BigInt('987654321')).negate().negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4800
     * @tc.name testBigIntNegateResultZero4800
     * @tc.desc Verify negate on arithmetic results that yield zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateResultZero4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorSubtract(BigInt(5)).negate().toString()).assertEqual('0');
      expect(BigInt(0).operatorMultiply(BigInt(999)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5800
     * @tc.name testBigIntNegateIncrement5800
     * @tc.desc Verify negate on operatorIncrement results for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIncrement5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorIncrement().negate().toString()).assertEqual('-6');
      expect(BigInt(-5).operatorIncrement().negate().toString()).assertEqual('4');
      expect(BigInt(0).operatorIncrement().negate().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6800
     * @tc.name testBigIntNegateDecrement6800
     * @tc.desc Verify negate on operatorDecrement results for positive, negative, and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDecrement6800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorDecrement().negate().toString()).assertEqual('-4');
      expect(BigInt(-5).operatorDecrement().negate().toString()).assertEqual('6');
      expect(BigInt(0).operatorDecrement().negate().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7800
     * @tc.name testBigIntNegateIncDecChain7800
     * @tc.desc Verify negate in chained increment/decrement expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIncDecChain7800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorIncrement().negate().operatorDecrement().toString()).assertEqual('-7');
      expect(BigInt(5).operatorDecrement().negate().operatorIncrement().toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_3600
     * @tc.name testBigIntNegateIncDecBnd3600
     * @tc.desc Verify negate on increment/decrement at type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIncDecBnd3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorIncrement().negate().toString()).assertEqual('-128');
      expect(BigInt(-128).operatorDecrement().negate().toString()).assertEqual('129');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_3700
     * @tc.name testBigIntNegateModule3700
     * @tc.desc Verify negate on operatorModule results with various signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateModule3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorModule(BigInt(3)).negate().toString()).assertEqual('-1');
      expect(BigInt(-10).operatorModule(BigInt(3)).negate().toString()).assertEqual('1');
      expect(BigInt(100).operatorModule(BigInt(7)).negate().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_3800
     * @tc.name testBigIntNegateModuleBnd3800
     * @tc.desc Verify negate on operatorModule results with zero and identity inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateModuleBnd3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorModule(BigInt(1)).negate().toString()).assertEqual('0');
      expect(BigInt(1).operatorModule(BigInt(1)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_3900
     * @tc.name testBigIntNegateBitwiseNot3900
     * @tc.desc Verify negate on operatorBitwiseNot: identity property negate(not(x)) = x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseNot3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorBitwiseNot().negate().toString()).assertEqual('6');
      expect(BigInt(-5).operatorBitwiseNot().negate().toString()).assertEqual('-4');
      expect(BigInt(0).operatorBitwiseNot().negate().toString()).assertEqual('1');
      expect(BigInt(1).operatorBitwiseNot().negate().toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4000
     * @tc.name testBigIntNegateShift4000
     * @tc.desc Verify negate on operatorLeftShift and operatorRightShift results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateShift4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLeftShift(BigInt(10)).negate().toString()).assertEqual('-1024');
      expect(BigInt(1024).operatorRightShift(BigInt(10)).negate().toString()).assertEqual('-1');
      expect(BigInt(-1).operatorLeftShift(BigInt(8)).negate().toString()).assertEqual('256');
      expect(BigInt(-1024).operatorRightShift(BigInt(10)).negate().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4100
     * @tc.name testBigIntNegateBitwiseAnd4100
     * @tc.desc Verify negate on operatorBitwiseAnd results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseAnd4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(6).operatorBitwiseAnd(BigInt(3)).negate().toString()).assertEqual('-2');
      expect(BigInt(-6).operatorBitwiseAnd(BigInt(3)).negate().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4200
     * @tc.name testBigIntNegateBitwiseOr4200
     * @tc.desc Verify negate on operatorBitwiseOr results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseOr4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(6).operatorBitwiseOr(BigInt(3)).negate().toString()).assertEqual('-7');
      expect(BigInt(-6).operatorBitwiseOr(BigInt(3)).negate().toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4300
     * @tc.name testBigIntNegateBitwiseXor4300
     * @tc.desc Verify negate on operatorBitwiseXor results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateBitwiseXor4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(6).operatorBitwiseXor(BigInt(3)).negate().toString()).assertEqual('-5');
      expect(BigInt(-6).operatorBitwiseXor(BigInt(3)).negate().toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4400
     * @tc.name testBigIntNegateAsIntN4400
     * @tc.desc Verify negate on asIntN truncated results at 64-bit and 8-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateAsIntN4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(64, BigInt(100)).negate().toString()).assertEqual('-100');
      expect(BigInt.asIntN(64, BigInt(-100)).negate().toString()).assertEqual('100');
      expect(BigInt.asIntN(8, BigInt(255)).negate().toString()).assertEqual('1');
      expect(BigInt.asIntN(8, BigInt(-256)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4500
     * @tc.name testBigIntNegateAsUintN4500
     * @tc.desc Verify negate on asUintN truncated results at 64-bit and 8-bit widths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateAsUintN4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(64, BigInt(100)).negate().toString()).assertEqual('-100');
      expect(BigInt.asUintN(8, BigInt(255)).negate().toString()).assertEqual('-255');
      expect(BigInt.asUintN(8, BigInt(256)).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4600
     * @tc.name testBigIntNegateGetLong4600
     * @tc.desc Verify getLong on negate results for normal and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateGetLong4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).negate().getLong()).assertEqual(-100);
      expect(BigInt('9223372036854775807').negate().getLong()).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4700
     * @tc.name testBigIntNegateGetULong4700
     * @tc.desc Verify getULong on negate results for unsigned long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateGetULong4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(100).negate().getULong()).assertEqual(-100);
      expect(BigInt.fromULong(-1).negate().getULong()).assertEqual(1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4800
     * @tc.name testBigIntNegateToStringRadix4800
     * @tc.desc Verify negate toString with hex, binary, and octal radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateToStringRadix4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negate().toString(16)).assertEqual('-ff');
      expect(BigInt(-255).negate().toString(16)).assertEqual('ff');
      expect(BigInt(255).negate().toString(2)).assertEqual('-11111111');
      expect(BigInt(63).negate().toString(8)).assertEqual('-77');
      expect(BigInt(35).negate().toString(36)).assertEqual('-z');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_4900
     * @tc.name testBigIntNegateToStringRadixBnd4900
     * @tc.desc Verify negate toString with hex radix on long boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateToStringRadixBnd4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').negate().toString(16)).assertEqual('-7fffffffffffffff');
      expect(BigInt('-9223372036854775808').negate().toString(16)).assertEqual('8000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5000
     * @tc.name testBigIntNegateCopyConstructor5000
     * @tc.desc Verify negate on BigInt copy-constructed from another BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCopyConstructor5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const orig: BigInt = BigInt(100);
      const copy: BigInt = BigInt(orig);
      expect(copy.negate().toString()).assertEqual('-100');
      expect(copy.negate().toString()).assertEqual(orig.negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5100
     * @tc.name testBigIntNegateDoubleConstructor5100
     * @tc.desc Verify negate on BigInt constructed from double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDoubleConstructor5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const fromDouble: BigInt = BigInt(3.0);
      expect(fromDouble.negate().toString()).assertEqual('-3');
      const fromDoubleLarge: BigInt = BigInt(9007199254740991.0);
      expect(fromDoubleLarge.negate().toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5200
     * @tc.name testBigIntNegateEqualsSym5200
     * @tc.desc Verify equality symmetry: x.negate().equals(-x) holds for all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateEqualsSym5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).negate().equals(BigInt(-5))).assertTrue();
      expect(BigInt(-5).negate().equals(BigInt(5))).assertTrue();
      expect(BigInt(0).negate().equals(BigInt(0))).assertTrue();
      expect(BigInt.fromULong(255).negate().toString()).assertEqual(BigInt('255').negate().toString());
      expect(BigInt.fromULong(4294967295).negate().toString()).assertEqual(BigInt('4294967295').negate().toString());
      expect(BigInt.fromULong(100).negate().toString()).assertEqual(BigInt(100).negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5300
     * @tc.name testBigIntNegatePositiveSym5300
     * @tc.desc Verify positive/negative symmetry: negate flips the positive flag correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePositiveSym5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).negate().positive()).assertTrue();
      expect(BigInt(5).negate().positive()).assertFalse();
      expect(BigInt(0).negate().positive()).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5400
     * @tc.name testBigIntNegateMidDigits5400
     * @tc.desc Verify negate on mid-length digit values: 123456789, 65535, 100000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateMidDigits5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(123456789).negate().toString()).assertEqual('-123456789');
      expect(BigInt(-123456789).negate().toString()).assertEqual('123456789');
      expect(BigInt(100000).negate().toString()).assertEqual('-100000');
      expect(BigInt(-100000).negate().toString()).assertEqual('100000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5500
     * @tc.name testBigIntNegatePrimeSquareCube5500
     * @tc.desc Verify negate on special number types: prime 97, perfect square 10000, perfect cube 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePrimeSquareCube5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(97).negate().toString()).assertEqual('-97');
      expect(BigInt(-97).negate().toString()).assertEqual('97');
      expect(BigInt(10000).negate().toString()).assertEqual('-10000');
      expect(BigInt(-10000).negate().toString()).assertEqual('10000');
      expect(BigInt(1000000).negate().toString()).assertEqual('-1000000');
      expect(BigInt(-1000000).negate().toString()).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5600
     * @tc.name testBigIntNegatePalindromeSymmetry5600
     * @tc.desc Verify negate on palindrome and symmetric numbers: 12321, 1001, 55 (Fib)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePalindromeSymmetry5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12321).negate().toString()).assertEqual('-12321');
      expect(BigInt(-12321).negate().toString()).assertEqual('12321');
      expect(BigInt(1001).negate().toString()).assertEqual('-1001');
      expect(BigInt(-1001).negate().toString()).assertEqual('1001');
      expect(BigInt(55).negate().toString()).assertEqual('-55');
      expect(BigInt(-55).negate().toString()).assertEqual('55');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5700
     * @tc.name testBigIntNegateFactorial5700
     * @tc.desc Verify negate on factorial result 3628800 and large Fibonacci 1134903170
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateFactorial5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3628800).negate().toString()).assertEqual('-3628800');
      expect(BigInt(-3628800).negate().toString()).assertEqual('3628800');
      expect(BigInt(1134903170).negate().toString()).assertEqual('-1134903170');
      expect(BigInt(-1134903170).negate().toString()).assertEqual('1134903170');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5800
     * @tc.name testBigIntNegatePow10_5800
     * @tc.desc Verify negate on powers of 10: 10^8, 10^9, 10^12, 10^15, 10^18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePow105800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_5900
     * @tc.name testBigIntNegatePow2Large5900
     * @tc.desc Verify negate on large powers of 2: 2^40, 2^50, 2^60, 2^63
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegatePow2Large5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6000
     * @tc.name testBigIntNegateCompoundArith6000
     * @tc.desc Verify negate on compound arithmetic: ((10+20)*3).negate(), (2^3^2).negate(), (10^20).negate()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCompoundArith6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(20)).operatorMultiply(BigInt(3)).negate().toString()).assertEqual('-90');
      expect(BigInt(2).pow(BigInt(3)).pow(BigInt(2)).negate().toString()).assertEqual('-64');
      expect(BigInt(10).pow(BigInt(20)).negate().toString()).assertEqual('-' + BigInt(10).pow(BigInt(20)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6100
     * @tc.name testBigIntNegateNegArithResult6100
     * @tc.desc Verify negate on result of negative arithmetic: (-100-200).negate() = 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateNegArithResult6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-100).operatorSubtract(BigInt(200)).negate().toString()).assertEqual('300');
      expect(BigInt(-100).operatorAdd(BigInt(-200)).negate().toString()).assertEqual('300');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6200
     * @tc.name testBigIntNegateExprEval6200
     * @tc.desc Verify negate on expression evaluations: ternary, array element, object property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateExprEval6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((true ? BigInt(10) : BigInt(20)).negate().toString()).assertEqual('-10');
      expect([BigInt(10), BigInt(20)][0].negate().toString()).assertEqual('-10');
      const obj: Map<string, BigInt> = new Map<string, BigInt>();
      obj.set('a', BigInt(10));
      expect((obj.get('a') as BigInt).negate().toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6300
     * @tc.name testBigIntNegateMapSet6300
     * @tc.desc Verify negate on Map values and Set elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateMapSet6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const m: Map<string, BigInt> = new Map<string, BigInt>();
      m.set('k', BigInt(10));
      expect((m.get('k') as BigInt).negate().toString()).assertEqual('-10');
      const s: Set<BigInt> = new Set<BigInt>([BigInt(10)]);
      const iter: IterableIterator<BigInt> = s.values();
      expect((iter.next().value as BigInt).negate().toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6400
     * @tc.name testBigIntNegateStrLeadingZeros6400
     * @tc.desc Verify negate on leading-zero strings: '0000001', '-0000001', '00100', '000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateStrLeadingZeros6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0000001').negate().toString()).assertEqual('-1');
      expect(BigInt('-0000001').negate().toString()).assertEqual('1');
      expect(BigInt('00100').negate().toString()).assertEqual('-100');
      expect(BigInt('000').negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6500
     * @tc.name testBigIntNegateStrNegativeZero6500
     * @tc.desc Verify negate on string '-0' yields '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateStrNegativeZero6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-0').negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6600
     * @tc.name testBigIntNegateStr999_6600
     * @tc.desc Verify negate on string '999' and '-999'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateStr9996600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('999').negate().toString()).assertEqual('-999');
      expect(BigInt('-999').negate().toString()).assertEqual('999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6700
     * @tc.name testBigIntNegateLargeHex6700
     * @tc.desc Verify negate on large hex strings: 0xABCDEF, 0xFFFFFFFFFFFFFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLargeHex6700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0xABCDEF').negate().toString()).assertEqual('-11259375');
      expect(BigInt('0xABCDEF').negate().negate().toString()).assertEqual('11259375');
      expect(BigInt('0xFFFFFFFFFFFFFFFF').negate().toString()).assertEqual('-18446744073709551615');
      expect(BigInt('0xFFFFFFFFFFFFFFFF').negate().negate().toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6800
     * @tc.name testBigIntNegateCopyConstructExt6800
     * @tc.desc Verify negate on BigInt copy-constructed from various source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCopyConstructExt6800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(0)).negate().toString()).assertEqual('0');
      expect(BigInt(BigInt(42)).negate().toString()).assertEqual('-42');
      expect(BigInt(BigInt(-42)).negate().toString()).assertEqual('42');
      expect(BigInt(BigInt(1)).negate().toString()).assertEqual('-1');
      expect(BigInt(BigInt(-1)).negate().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_6900
     * @tc.name testBigIntNegateCopyConstructLarge6900
     * @tc.desc Verify negate on copy-constructed large BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateCopyConstructLarge6900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt('18446744073709551616')).negate().toString()).assertEqual('-18446744073709551616');
      expect(BigInt(BigInt('-18446744073709551616')).negate().toString()).assertEqual('18446744073709551616');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7000
     * @tc.name testBigIntNegateToStringBin7000
     * @tc.desc Verify negate toString with binary radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateToStringBin7000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).negate().toString(2)).assertEqual('-101');
      expect(BigInt(255).negate().toString(2)).assertEqual('-11111111');
    });


    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7100
     * @tc.name testBigIntNegateLongHalfRange7100
     * @tc.desc Verify negate on long half-range values: -4611686018427387904 and 4611686018427387903
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLongHalfRange7100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-4611686018427387904).negate().toString()).assertEqual('4611686018427387904');
      expect(BigInt(4611686018427387903).negate().toString()).assertEqual('-4611686018427387903');
    });


    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7200
     * @tc.name testBigIntNegateIntHalfRange7200
     * @tc.desc Verify negate on int half-range values: 1073741824 and -1073741825
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateIntHalfRange7200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1073741824).negate().toString()).assertEqual('-1073741824');
      expect(BigInt(-1073741825).negate().toString()).assertEqual('1073741825');
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7300
     * @tc.name testBigIntNegateLoop1000_7300
     * @tc.desc Verify negate in a 1000-iteration loop completes without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLoop10007300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7400
     * @tc.name testBigIntNegateLoopBoundary7400
     * @tc.desc Verify negate on a range from -1000 to 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLoopBoundary7400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = -1000; i <= 1000; i++) {
        expect(BigInt(i).negate().negate().toString()).assertEqual(BigInt(i).toString());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7500
     * @tc.name testBigIntNegateErrorHandling7500
     * @tc.desc Verify negate does not throw on zero, huge (200-digit), or long chains
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateErrorHandling7500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const result: BigInt = BigInt(0).negate();
        expect(result.toString()).assertEqual('0');
      } catch (e) {
        caught = true;
      }
      expect(caught).assertFalse();

      caught = false;
      const bigStr: string = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7600
     * @tc.name testBigIntNegateLargeNegateChain7600
     * @tc.desc Verify large number double negate chain restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateLargeNegateChain7600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big: BigInt = BigInt('18446744073709551616');
      expect(big.negate().negate().equals(big)).assertTrue();
      expect(big.negate().negate().negate().toString()).assertEqual(big.negate().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7700
     * @tc.name testBigIntNegateDoubleValueConsistency7700
     * @tc.desc Verify negate flips doubleValue correctly for positive and negative inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateDoubleValueConsistency7700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(256).negate().doubleValue()).assertEqual(-256);
      expect(BigInt(-256).negate().doubleValue()).assertEqual(256);
    });

    /**
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7800
     * @tc.name testBigIntNegateImmutability7800
     * @tc.desc Verify negate does not mutate the original instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateImmutability7800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_NEGATE_EXT_7900
     * @tc.name testBigIntNegateHuge78Digit117_7900
     * @tc.desc Mindmap: negate 78-digit 2^256 specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegateHuge78Digit1177900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge: string = '115792089237316195423570985008687907853269984665640564039457584007913129639936';
      expect(BigInt(huge).negate().toString()).assertEqual('-' + huge);
      expect(BigInt('-' + huge).negate().toString()).assertEqual(huge);
    });

  });
}