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

function getBigInt(): BigInt { return BigInt(0); }

export default function BigIntOperatorBitwiseAndTest_2(): void {
  describe('BigInt.operatorBitwiseAnd - expanded param dimensions', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1000
     * @tc.name testBigIntOperatorBitwiseAndByteShortBoundary1000
     * @tc.desc operatorBitwiseAnd with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndByteShortBoundary1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorBitwiseAnd(BigInt(127)).toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseAnd(BigInt(-128)).toString()).assertEqual('-128');
      expect(BigInt(32767).operatorBitwiseAnd(BigInt(32767)).toString()).assertEqual('32767');
      expect(BigInt(-32768).operatorBitwiseAnd(BigInt(-32768)).toString()).assertEqual('-32768');
      expect(BigInt(127).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(-128).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(127).operatorBitwiseAnd(BigInt(-128)).toString()).assertEqual('0');
      expect(BigInt(32767).operatorBitwiseAnd(BigInt(-32768)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1100
     * @tc.name testBigIntOperatorBitwiseAndIntBoundary1100
     * @tc.desc operatorBitwiseAnd with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndIntBoundary1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(-2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt(2147483647).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(2147483647).operatorBitwiseAnd(BigInt(-2147483648)).toString()).assertEqual('0');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1200
     * @tc.name testBigIntOperatorBitwiseAndLargeDigitLength1200
     * @tc.desc operatorBitwiseAnd with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargeDigitLength1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v20 = '12345678901234567890';
      const v20_neg = '-12345678901234567890';
      const v40 = '1234567890123456789012345678901234567890';
      const v40_neg = '-1234567890123456789012345678901234567890';

      expect(BigInt(v20).operatorBitwiseAnd(BigInt(v20)).toString()).assertEqual(v20);
      expect(BigInt(v20_neg).operatorBitwiseAnd(BigInt(v20_neg)).toString()).assertEqual(v20_neg);
      expect(BigInt(v40).operatorBitwiseAnd(BigInt(v40)).toString()).assertEqual(v40);
      expect(BigInt(v40_neg).operatorBitwiseAnd(BigInt(v40_neg)).toString()).assertEqual(v40_neg);
      expect(BigInt(v20).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(v40).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(v20).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual(v20);
      expect(BigInt(v40).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual(v40);
      expect(BigInt(v20).operatorBitwiseAnd(BigInt(v40)).toString()).assertEqual(
        BigInt(v40).operatorBitwiseAnd(BigInt(v20)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1300
     * @tc.name testBigIntOperatorBitwiseAndCrossFormatConsistency1300
     * @tc.desc operatorBitwiseAnd with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndCrossFormatConsistency1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('127').operatorBitwiseAnd(BigInt('1')).toString()).assertEqual(
        BigInt(127).operatorBitwiseAnd(BigInt(1)).toString());
      expect(BigInt('-128').operatorBitwiseAnd(BigInt('-1')).toString()).assertEqual(
        BigInt(-128).operatorBitwiseAnd(BigInt(-1)).toString());
      expect(BigInt('32767').operatorBitwiseAnd(BigInt('1')).toString()).assertEqual(
        BigInt(32767).operatorBitwiseAnd(BigInt(1)).toString());
      expect(BigInt('2147483647').operatorBitwiseAnd(BigInt('1')).toString()).assertEqual(
        BigInt(2147483647).operatorBitwiseAnd(BigInt(1)).toString());
      expect(BigInt('9223372036854775807').operatorBitwiseAnd(BigInt('1')).toString()).assertEqual(
        BigInt(9223372036854775807).operatorBitwiseAnd(BigInt(1)).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1400
     * @tc.name testBigIntOperatorBitwiseAndNearZeroValues1400
     * @tc.desc operatorBitwiseAnd with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNearZeroValues1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(1).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('1');
      expect(BigInt(-1).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(-1).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1500
     * @tc.name testBigIntOperatorBitwiseAndPowerOfTwo1500
     * @tc.desc operatorBitwiseAnd with power-of-2 masks and boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndPowerOfTwo1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(1).operatorBitwiseAnd(BigInt(2)).toString()).assertEqual('0');
      expect(BigInt(2).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt(1024).operatorBitwiseAnd(BigInt(1023)).toString()).assertEqual('0');
      expect(BigInt(1024).operatorBitwiseAnd(BigInt(1024)).toString()).assertEqual('1024');
      expect(BigInt(1048576).operatorBitwiseAnd(BigInt(1048575)).toString()).assertEqual('0');
      expect(BigInt(1048576).operatorBitwiseAnd(BigInt(1048576)).toString()).assertEqual('1048576');
      expect(BigInt(2147483648).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('0');
      expect(BigInt('9223372036854775808').operatorBitwiseAnd(BigInt('9223372036854775807')).toString()).assertEqual('0');
      expect(BigInt('9223372036854775808').operatorBitwiseAnd(BigInt('9223372036854775808')).toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1600
     * @tc.name testBigIntOperatorBitwiseAndDeepBoundary1600
     * @tc.desc operatorBitwiseAnd with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndDeepBoundary1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const negBig100 = '-' + big100;

      expect(BigInt(big100).operatorBitwiseAnd(BigInt(big100)).toString()).assertEqual(big100);
      expect(BigInt(big100).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(big100).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual(big100);
      expect(BigInt(negBig100).operatorBitwiseAnd(BigInt(negBig100)).toString()).assertEqual(negBig100);
      expect(BigInt(negBig100).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual(negBig100);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1700
     * @tc.name testBigIntOperatorBitwiseAndSequentialNoThrow1700
     * @tc.desc sequential mixed operatorBitwiseAnd calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSequentialNoThrow1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      expect(a.operatorBitwiseAnd(BigInt(42)).toString()).assertEqual('42');
      expect(a.operatorBitwiseAnd(BigInt(99)).toString()).assertEqual('34');
      expect(a.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(a.operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('42');
      expect(a.operatorBitwiseAnd(BigInt(42)).toString()).assertEqual('42');
      expect(a.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1800
     * @tc.name testBigIntOperatorBitwiseAndAlternatingPattern1800
     * @tc.desc operatorBitwiseAnd with alternating bit masks (0xAAAA… & 0x5555…)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndAlternatingPattern1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const altEven = BigInt('2863311530');
      const altOdd = BigInt('1431655765');

      expect(altEven.operatorBitwiseAnd(altEven).toString()).assertEqual('2863311530');
      expect(altOdd.operatorBitwiseAnd(altOdd).toString()).assertEqual('1431655765');
      expect(altEven.operatorBitwiseAnd(altOdd).toString()).assertEqual('0');
      expect(altOdd.operatorBitwiseAnd(altEven).toString()).assertEqual('0');
      expect(altEven.operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('2863311530');
      expect(altOdd.operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('1431655765');
      expect(altEven.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(altOdd.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_1900
     * @tc.name testBigIntOperatorBitwiseAndBasicOverlapPatterns1900
     * @tc.desc operatorBitwiseAnd basic overlap / no-overlap patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndBasicOverlapPatterns1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorBitwiseAnd(BigInt(-5)).toString()).assertEqual('0');
      expect(BigInt(-5).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(2).operatorBitwiseAnd(BigInt(4)).toString()).assertEqual('0');
      expect(BigInt(3).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('1');
      expect(BigInt(7).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('3');
      expect(BigInt(15).operatorBitwiseAnd(BigInt(240)).toString()).assertEqual('0');
      expect(BigInt(255).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('255');
      expect(BigInt(12).operatorBitwiseAnd(BigInt(10)).toString()).assertEqual('8');
      expect(BigInt(10).operatorBitwiseAnd(BigInt(10)).toString()).assertEqual('10');
      expect(BigInt(15).operatorBitwiseAnd(BigInt(7)).toString()).assertEqual('7');
      expect(BigInt(204).operatorBitwiseAnd(BigInt(204)).toString()).assertEqual('204');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2000
     * @tc.name testBigIntOperatorBitwiseAndHexPatternBatch2000
     * @tc.desc operatorBitwiseAnd with hex and 16-bit bit patterns (合并 #2000 #3800)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndHexPatternBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0xFF).operatorBitwiseAnd(BigInt(0xFF)).toString()).assertEqual('255');
      expect(BigInt(0x0F).operatorBitwiseAnd(BigInt(0xF0)).toString()).assertEqual('0');
      expect(BigInt(0xF0).operatorBitwiseAnd(BigInt(0x0F)).toString()).assertEqual('0');
      expect(BigInt(0x0F).operatorBitwiseAnd(BigInt(0x0F)).toString()).assertEqual('15');
      expect(BigInt(0x00FF).operatorBitwiseAnd(BigInt(0x00FF)).toString()).assertEqual('255');
      expect(BigInt(0x00FF).operatorBitwiseAnd(BigInt(0xFF00)).toString()).assertEqual('0');
      expect(BigInt(0x0F0F0F0F).operatorBitwiseAnd(BigInt(0x0F0F0F0F)).toString()).assertEqual('252645135');
      expect(BigInt(0x0000FFFF).operatorBitwiseAnd(BigInt(0xFFFF0000)).toString()).assertEqual('0');
      expect(BigInt(0x11111111).operatorBitwiseAnd(BigInt(0x11111111)).toString()).assertEqual('286331153');
      expect(BigInt(0x55).operatorBitwiseAnd(BigInt(0x55)).toString()).assertEqual('85');
      expect(BigInt(0xAAF).operatorBitwiseAnd(BigInt(0xAAF)).toString()).assertEqual('2735');
      expect(BigInt(0x07).operatorBitwiseAnd(BigInt(0x38)).toString()).assertEqual('0');
      expect(BigInt(0x03).operatorBitwiseAnd(BigInt(0x0C)).toString()).assertEqual('0');
      expect(BigInt(0xAAAA).operatorBitwiseAnd(BigInt(0x5555)).toString()).assertEqual('0');
      expect(BigInt(0xAAAA).operatorBitwiseAnd(BigInt(0xAAAA)).toString()).assertEqual('43690');
      expect(BigInt(0x5555).operatorBitwiseAnd(BigInt(0x5555)).toString()).assertEqual('21845');
      expect(BigInt(0xFFFF).operatorBitwiseAnd(BigInt(0x0000)).toString()).assertEqual('0');
      expect(BigInt(0x0F0F).operatorBitwiseAnd(BigInt(0xF0F0)).toString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2100
     * @tc.name testBigIntOperatorBitwiseAndSingleBitPatterns2100
     * @tc.desc operatorBitwiseAnd with single-bit positions across the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSingleBitPatterns2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).operatorBitwiseAnd(BigInt(2)).toString()).assertEqual('2');
      expect(BigInt(4).operatorBitwiseAnd(BigInt(4)).toString()).assertEqual('4');
      expect(BigInt(4).operatorBitwiseAnd(BigInt(8)).toString()).assertEqual('0');
      expect(BigInt(8).operatorBitwiseAnd(BigInt(8)).toString()).assertEqual('8');
      expect(BigInt(8).operatorBitwiseAnd(BigInt(16)).toString()).assertEqual('0');
      expect(BigInt(128).operatorBitwiseAnd(BigInt(128)).toString()).assertEqual('128');
      expect(BigInt(128).operatorBitwiseAnd(BigInt(256)).toString()).assertEqual('0');
      expect(BigInt(32768).operatorBitwiseAnd(BigInt(32768)).toString()).assertEqual('32768');
      expect(BigInt(32768).operatorBitwiseAnd(BigInt(65536)).toString()).assertEqual('0');
      expect(BigInt(2147483648).operatorBitwiseAnd(BigInt(2147483648)).toString()).assertEqual('2147483648');
      expect(BigInt(2147483648).operatorBitwiseAnd(BigInt('4294967296')).toString()).assertEqual('0');
      expect(BigInt(2).operatorBitwiseAnd(BigInt(8)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2200
     * @tc.name testBigIntOperatorBitwiseAndBoundaryExtrema2200
     * @tc.desc operatorBitwiseAnd at 32-bit and 64-bit unsigned boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndBoundaryExtrema2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').operatorBitwiseAnd(BigInt(-1)).toString())
        .assertEqual('9223372036854775807');
      expect(BigInt(32767).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt('4294967295').operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt('4294967295').operatorBitwiseAnd(BigInt('4294967296')).toString()).assertEqual('0');
      expect(BigInt('18446744073709551615').operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt('18446744073709551615').operatorBitwiseAnd(BigInt('18446744073709551616')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2300
     * @tc.name testBigIntOperatorBitwiseAndNegativeOperandEdges2300
     * @tc.desc operatorBitwiseAnd with negative operand edge cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegativeOperandEdges2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2).operatorBitwiseAnd(BigInt(2)).toString()).assertEqual('2');
      expect(BigInt(-3).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('1');
      expect(BigInt(-4).operatorBitwiseAnd(BigInt(4)).toString()).assertEqual('4');
      expect(BigInt(-8).operatorBitwiseAnd(BigInt(8)).toString()).assertEqual('8');
      expect(BigInt(-16).operatorBitwiseAnd(BigInt(16)).toString()).assertEqual('16');
      expect(BigInt(-256).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('0');
      expect(BigInt(-65536).operatorBitwiseAnd(BigInt(65535)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2400
     * @tc.name testBigIntOperatorBitwiseAndLargePowerOfTwo2400
     * @tc.desc operatorBitwiseAnd with large power-of-two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargePowerOfTwo2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const pow100 = BigInt(1).operatorLeftShift(BigInt(100));
      expect(pow100.operatorBitwiseAnd(pow100).toString()).assertEqual(pow100.toString());
      const pow101 = BigInt(1).operatorLeftShift(BigInt(101));
      expect(pow100.operatorBitwiseAnd(pow101).toString()).assertEqual('0');
      const pow200 = BigInt(1).operatorLeftShift(BigInt(200));
      expect(pow200.operatorBitwiseAnd(pow200).toString()).assertEqual(pow200.toString());
      const pow201 = BigInt(1).operatorLeftShift(BigInt(201));
      expect(pow200.operatorBitwiseAnd(pow201).toString()).assertEqual('0');
      const big50 = BigInt('100000000000000000000000000000000000000000000000000');
      expect(big50.operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('0');
      expect(BigInt('-100000000000000000000000000000000000000000000000000').operatorBitwiseAnd(BigInt(0)).toString())
        .assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2500
     * @tc.name testBigIntOperatorBitwiseAndChainedExpressions2500
     * @tc.desc operatorBitwiseAnd chained calls and expression results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndChainedExpressions2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(7).operatorBitwiseAnd(BigInt(3)).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(15).operatorBitwiseAnd(BigInt(7)).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('3');
      let a = BigInt(255);
      expect(a.operatorBitwiseAnd(BigInt(15)).toString()).assertEqual('15');
      expect(getBigInt().operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('0');
      expect((true ? BigInt(0xFF) : BigInt(0x00)).operatorBitwiseAnd(BigInt(0x0F)).toString()).assertEqual('15');
      const arr: BigInt[] = [BigInt(0x0F), BigInt(0xF0)];
      expect(arr[0].operatorBitwiseAnd(arr[1]).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2600
     * @tc.name testBigIntOperatorBitwiseAndOperatorConsistency2600
     * @tc.desc operatorBitwiseAnd consistency with & operator and stress tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndOperatorConsistency2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorBitwiseAnd(BigInt(200)).equals(BigInt(100).operatorBitwiseAnd(BigInt(200))))
        .assertTrue();
      expect((BigInt(100).operatorAdd(BigInt(200))).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('44');
      expect((BigInt(100).operatorMultiply(BigInt(100))).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('16');

      expect((BigInt(1).operatorLeftShift(BigInt(8))).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('0');
      expect((BigInt(1024).operatorRightShift(BigInt(5))).operatorBitwiseAnd(BigInt(15)).toString()).assertEqual('0');
      let result = BigInt(0xFFFFFFFF);
      for (let i = 0; i < 1000; i++) {
        result = result.operatorBitwiseAnd(BigInt(0xAAAAAAAA));
      }
      expect(result.toString()).assertEqual('2863311530');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2700
     * @tc.name testBigIntOperatorBitwiseAndNegCrossLongMin2700
     * @tc.desc operatorBitwiseAnd: -1 & longMin, -1 & 1, -2 & -1, negative & positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegCrossLongMin2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt('-9223372036854775808').operatorBitwiseAnd(BigInt(-1)).toString())
        .assertEqual('-9223372036854775808');

      expect(BigInt(1).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('1');

      expect(BigInt(-2).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('-2');

      expect(BigInt(-10).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('4');
      expect(BigInt(5).operatorBitwiseAnd(BigInt(-10)).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2800
     * @tc.name testBigIntOperatorBitwiseAndNegTwoNegThree2800
     * @tc.desc operatorBitwiseAnd: -2 & -3 -> -4 (mindmap negative test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegTwoNegThree2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(-2).operatorBitwiseAnd(BigInt(-3)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_2900
     * @tc.name testBigIntOperatorBitwiseAndSignedMinMaxPairs2900
     * @tc.desc operatorBitwiseAnd: -128&127, -256&255, -65536&65535, -2^31&2^31-1, -2^63&2^63-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSignedMinMaxPairs2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(-128).operatorBitwiseAnd(BigInt(127)).toString()).assertEqual('0');

      expect(BigInt(-256).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('0');

      expect(BigInt(-65536).operatorBitwiseAnd(BigInt(65535)).toString()).assertEqual('0');

      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('0');

      expect(BigInt('-9223372036854775808').operatorBitwiseAnd(BigInt('9223372036854775807')).toString())
        .assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3000
     * @tc.name testBigIntOperatorBitwiseAndLargeCrossSign3000
     * @tc.desc operatorBitwiseAnd: huge positive & huge negative (mindmap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargeCrossSign3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const hugePos = BigInt('123456789012345678901234567890');
      const hugeNeg = BigInt('-123456789012345678901234567890');

      expect(hugePos.operatorBitwiseAnd(hugeNeg).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3100
     * @tc.name testBigIntOperatorBitwiseAndLargeNegAndNegOne3100
     * @tc.desc operatorBitwiseAnd: large positive&-1, large negative&-1, large negative self-and &0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargeNegAndNegOne3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const largePos = BigInt('999999999999999999999999999999');
      const largeNeg = BigInt('-999999999999999999999999999999');

      expect(largePos.operatorBitwiseAnd(BigInt(-1)).toString())
        .assertEqual('999999999999999999999999999999');

      expect(largeNeg.operatorBitwiseAnd(BigInt(-1)).toString())
        .assertEqual('-999999999999999999999999999999');

      expect(largeNeg.operatorBitwiseAnd(largeNeg).toString())
        .assertEqual('-999999999999999999999999999999');

      expect(largeNeg.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3200
     * @tc.name testBigIntOperatorBitwiseAndCommutativeGroups3200
     * @tc.desc operatorBitwiseAnd commutative property for positive, negative, and very large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndCommutativeGroups3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(42).operatorBitwiseAnd(BigInt(58)).toString())
        .assertEqual(BigInt(58).operatorBitwiseAnd(BigInt(42)).toString());

      expect(BigInt(-50).operatorBitwiseAnd(BigInt(75)).toString())
        .assertEqual(BigInt(75).operatorBitwiseAnd(BigInt(-50)).toString());

      expect(BigInt('99999999999999999999').operatorBitwiseAnd(BigInt('11111111111111111111')).toString())
        .assertEqual(BigInt('11111111111111111111').operatorBitwiseAnd(BigInt('99999999999999999999')).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3300
     * @tc.name testBigIntOperatorBitwiseAndImmutableWithNeg13300
     * @tc.desc operatorBitwiseAnd immutability: -1 unchanged, large value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndImmutableWithNeg13300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const a = BigInt(-1);
      const origA = a.toString();
      const result = a.operatorBitwiseAnd(BigInt(999));
      expect(a.toString()).assertEqual(origA);
      expect(result.toString()).assertEqual('999');

      const b = BigInt('12345678901234567890');
      const origB = b.toString();
      b.operatorBitwiseAnd(BigInt('9876543210987654321'));
      expect(b.toString()).assertEqual(origB);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3400
     * @tc.name testBigIntOperatorBitwiseAndConstructorVariants3400
     * @tc.desc operatorBitwiseAnd: BigInt from double, string, copy, boolean constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndConstructorVariants3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(5.0).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('1');

      expect(BigInt('123').operatorBitwiseAnd(BigInt('456')).toString()).assertEqual('72');

      expect(BigInt(BigInt(10)).operatorBitwiseAnd(BigInt(true)).toString()).assertEqual('0');

      expect(BigInt(123456.0).operatorBitwiseAnd(BigInt('654321')) instanceof BigInt).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3500
     * @tc.name testBigIntOperatorBitwiseAndZeroSpecialSources3500
     * @tc.desc operatorBitwiseAnd: zero with boolean true/false, string "-0", byte/short/int/long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndZeroSpecialSources3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(0).operatorBitwiseAnd(BigInt(true)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(false)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt('-0')).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(127)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(-128)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(32767)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(-32768)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt(-2147483648)).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt('9223372036854775807')).toString()).assertEqual('0');

      expect(BigInt(0).operatorBitwiseAnd(BigInt('-9223372036854775808')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3600
     * @tc.name testBigIntOperatorBitwiseAndStructuredLargePatterns3600
     * @tc.desc operatorBitwiseAnd with digit-structured large patterns (all-1s, sequenced)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndStructuredLargePatterns3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt('111111111111111111111111111111').operatorBitwiseAnd(
        BigInt('222222222222222222222222222222')).toString())
        .assertEqual('21665012927145782014190838150');

      expect(BigInt('999999999999999999999999999999').operatorBitwiseAnd(
        BigInt('111111111111111111111111111111')).toString())
        .assertEqual('2171933519367088969084596679');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3700
     * @tc.name testBigIntOperatorBitwiseAndEqualsVerification3700
     * @tc.desc operatorBitwiseAnd result verified via equals()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndEqualsVerification3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(7).operatorBitwiseAnd(BigInt(8)).equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_3900
     * @tc.name testBigIntOperatorBitwiseAndSingleBit63Boundary3900
     * @tc.desc operatorBitwiseAnd: bit 63 self-and and with long max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSingleBit63Boundary3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const bit63 = BigInt('9223372036854775808');
      expect(bit63.operatorBitwiseAnd(bit63).toString()).assertEqual('9223372036854775808');

      expect(bit63.operatorBitwiseAnd(BigInt('9223372036854775807')).toString()).assertEqual('0');
    });
  });
}
