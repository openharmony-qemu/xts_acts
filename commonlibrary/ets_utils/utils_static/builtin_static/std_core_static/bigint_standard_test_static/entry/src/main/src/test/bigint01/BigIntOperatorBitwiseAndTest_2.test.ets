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
  describe('BigIntOperatorBitwiseAndTest_2',() => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0001
     * @tc.name testBigIntOperatorBitwiseAndByteShortBoundary0001
     * @tc.desc operatorBitwiseAnd with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndByteShortBoundary0001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0002
     * @tc.name testBigIntOperatorBitwiseAndIntBoundary0002
     * @tc.desc operatorBitwiseAnd with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndIntBoundary0002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(-2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt(2147483647).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(2147483647).operatorBitwiseAnd(BigInt(-2147483648)).toString()).assertEqual('0');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0003
     * @tc.name testBigIntOperatorBitwiseAndLargeDigitLength0003
     * @tc.desc operatorBitwiseAnd with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargeDigitLength0003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0004
     * @tc.name testBigIntOperatorBitwiseAndCrossFormatConsistency0004
     * @tc.desc operatorBitwiseAnd with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndCrossFormatConsistency0004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0005
     * @tc.name testBigIntOperatorBitwiseAndNearZeroValues0005
     * @tc.desc operatorBitwiseAnd with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNearZeroValues0005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0006
     * @tc.name testBigIntOperatorBitwiseAndPowerOfTwo0006
     * @tc.desc operatorBitwiseAnd with power-of-2 masks and boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndPowerOfTwo0006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0007
     * @tc.name testBigIntOperatorBitwiseAndDeepBoundary0007
     * @tc.desc operatorBitwiseAnd with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndDeepBoundary0007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const negBig100 = '-' + big100;

      expect(BigInt(big100).operatorBitwiseAnd(BigInt(big100)).toString()).assertEqual(big100);
      expect(BigInt(big100).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(big100).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual(big100);
      expect(BigInt(negBig100).operatorBitwiseAnd(BigInt(negBig100)).toString()).assertEqual(negBig100);
      expect(BigInt(negBig100).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual(negBig100);
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0008
     * @tc.name testBigIntOperatorBitwiseAndSequentialNoThrow0008
     * @tc.desc sequential mixed operatorBitwiseAnd calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSequentialNoThrow0008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      expect(a.operatorBitwiseAnd(BigInt(42)).toString()).assertEqual('42');
      expect(a.operatorBitwiseAnd(BigInt(99)).toString()).assertEqual('34');
      expect(a.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(a.operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('42');
      expect(a.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0009
     * @tc.name testBigIntOperatorBitwiseAndAlternatingPattern0009
     * @tc.desc operatorBitwiseAnd with alternating bit masks (0xAAAA… & 0x5555…)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndAlternatingPattern0009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0010
     * @tc.name testBigIntOperatorBitwiseAndBasicOverlapPatterns0010
     * @tc.desc operatorBitwiseAnd basic overlap / no-overlap patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndBasicOverlapPatterns0010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0011
     * @tc.name testBigIntOperatorBitwiseAndHexPatternBatch0011
     * @tc.desc operatorBitwiseAnd with hex and 16-bit bit patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndHexPatternBatch0011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0012
     * @tc.name testBigIntOperatorBitwiseAndSingleBitPatterns0012
     * @tc.desc operatorBitwiseAnd with single-bit positions across the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSingleBitPatterns0012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).operatorBitwiseAnd(BigInt(2)).toString()).assertEqual('2');
      expect(BigInt(2).operatorBitwiseAnd(BigInt(8)).toString()).assertEqual('0');
      expect(BigInt(128).operatorBitwiseAnd(BigInt(128)).toString()).assertEqual('128');
      expect(BigInt(128).operatorBitwiseAnd(BigInt(256)).toString()).assertEqual('0');
      expect(BigInt(65536).operatorBitwiseAnd(BigInt(65536)).toString()).assertEqual('65536');
      expect(BigInt(2147483648).operatorBitwiseAnd(BigInt(2147483648)).toString()).assertEqual('2147483648');
      expect(BigInt(2147483648).operatorBitwiseAnd(BigInt('4294967296')).toString()).assertEqual('0');
      expect(BigInt('4294967296').operatorBitwiseAnd(BigInt('4294967296')).toString()).assertEqual('4294967296');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0013
     * @tc.name testBigIntOperatorBitwiseAndBoundaryExtrema0013
     * @tc.desc operatorBitwiseAnd at 32-bit and 64-bit unsigned boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndBoundaryExtrema0013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').operatorBitwiseAnd(BigInt(-1)).toString())
        .assertEqual('9223372036854775807');
      expect(BigInt(32767).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt('4294967295').operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt('4294967295').operatorBitwiseAnd(BigInt('4294967296')).toString()).assertEqual('0');
      expect(BigInt('18446744073709551615').operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt('18446744073709551615').operatorBitwiseAnd(BigInt('18446744073709551616')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0014
     * @tc.name testBigIntOperatorBitwiseAndNegativeOperandEdges0014
     * @tc.desc operatorBitwiseAnd with negative operand edge cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegativeOperandEdges0014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2).operatorBitwiseAnd(BigInt(2)).toString()).assertEqual('2');
      expect(BigInt(-3).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('1');
      expect(BigInt(-4).operatorBitwiseAnd(BigInt(4)).toString()).assertEqual('4');
      expect(BigInt(-8).operatorBitwiseAnd(BigInt(8)).toString()).assertEqual('8');
      expect(BigInt(-16).operatorBitwiseAnd(BigInt(16)).toString()).assertEqual('16');
      expect(BigInt(-256).operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('0');
      expect(BigInt(-65536).operatorBitwiseAnd(BigInt(65535)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0015
     * @tc.name testBigIntOperatorBitwiseAndLargePowerOfTwo0015
     * @tc.desc operatorBitwiseAnd with large power-of-two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargePowerOfTwo0015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0016
     * @tc.name testBigIntOperatorBitwiseAndChainedExpressions0016
     * @tc.desc operatorBitwiseAnd chained calls and expression results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndChainedExpressions0016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(7).operatorBitwiseAnd(BigInt(3)).operatorBitwiseAnd(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(15).operatorBitwiseAnd(BigInt(7)).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('3');
      const a = BigInt(255);
      expect(a.operatorBitwiseAnd(BigInt(15)).toString()).assertEqual('15');
      expect(getBigInt().operatorBitwiseAnd(BigInt(255)).toString()).assertEqual('0');
      expect((true ? BigInt(0xFF) : BigInt(0x00)).operatorBitwiseAnd(BigInt(0x0F)).toString()).assertEqual('15');
      const arr: BigInt[] = [BigInt(0x0F), BigInt(0xF0)];
      expect(arr[0].operatorBitwiseAnd(arr[1]).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0017
     * @tc.name testBigIntOperatorBitwiseAndOperatorConsistency0017
     * @tc.desc operatorBitwiseAnd consistency with & operator and stress tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndOperatorConsistency0017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorBitwiseAnd(BigInt(200)).equals(BigInt(100 & 200)))
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0018
     * @tc.name testBigIntOperatorBitwiseAndNegCrossLongMin0018
     * @tc.desc operatorBitwiseAnd: -1 & longMin, -1 & 1, -2 & -1, negative & positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegCrossLongMin0018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt('-9223372036854775808').operatorBitwiseAnd(BigInt(-1)).toString())
        .assertEqual('-9223372036854775808');

      expect(BigInt(1).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('1');

      expect(BigInt(-2).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('-2');

      expect(BigInt(-10).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('4');
      expect(BigInt(5).operatorBitwiseAnd(BigInt(-10)).toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0019
     * @tc.name testBigIntOperatorBitwiseAndNegTwoNegThree0019
     * @tc.desc operatorBitwiseAnd: -2 & -3 -> -4 (mindmap negative test)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndNegTwoNegThree0019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(-2).operatorBitwiseAnd(BigInt(-3)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0020
     * @tc.name testBigIntOperatorBitwiseAndSignedMinMaxPairs0020
     * @tc.desc operatorBitwiseAnd: -128&127, -256&255, -65536&65535, -2^31&2^31-1, -2^63&2^63-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSignedMinMaxPairs0020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-128).operatorBitwiseAnd(BigInt(127)).toString()).assertEqual('0');
      expect(BigInt(-65536).operatorBitwiseAnd(BigInt(65535)).toString()).assertEqual('0');
      expect(BigInt(-2147483648).operatorBitwiseAnd(BigInt(2147483647)).toString()).assertEqual('0');
      expect(BigInt('-9223372036854775808').operatorBitwiseAnd(BigInt('9223372036854775807')).toString())
        .assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0021
     * @tc.name testBigIntOperatorBitwiseAndLargeCrossSign0021
     * @tc.desc operatorBitwiseAnd: huge positive & huge negative (mindmap)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargeCrossSign0021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const hugePos = BigInt('123456789012345678901234567890');
      const hugeNeg = BigInt('-123456789012345678901234567890');

      expect(hugePos.operatorBitwiseAnd(hugeNeg).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0022
     * @tc.name testBigIntOperatorBitwiseAndLargeNegAndNegOne0022
     * @tc.desc operatorBitwiseAnd: large positive&-1, large negative&-1, large negative self-and &0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLargeNegAndNegOne0022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0023
     * @tc.name testBigIntOperatorBitwiseAndCommutativeGroups0023
     * @tc.desc operatorBitwiseAnd commutative property for positive, negative, and very large
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndCommutativeGroups0023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(42).operatorBitwiseAnd(BigInt(58)).toString())
        .assertEqual(BigInt(58).operatorBitwiseAnd(BigInt(42)).toString());

      expect(BigInt(-50).operatorBitwiseAnd(BigInt(75)).toString())
        .assertEqual(BigInt(75).operatorBitwiseAnd(BigInt(-50)).toString());

      expect(BigInt('99999999999999999999').operatorBitwiseAnd(BigInt('11111111111111111111')).toString())
        .assertEqual(BigInt('11111111111111111111').operatorBitwiseAnd(BigInt('99999999999999999999')).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0024
     * @tc.name testBigIntOperatorBitwiseAndImmutableWithNeg0024
     * @tc.desc operatorBitwiseAnd immutability: -1 unchanged, large value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndImmutableWithNeg0024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0025
     * @tc.name testBigIntOperatorBitwiseAndConstructorVariants0025
     * @tc.desc operatorBitwiseAnd: BigInt from double, string, copy, boolean constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndConstructorVariants0025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(5.0).operatorBitwiseAnd(BigInt(3)).toString()).assertEqual('1');

      expect(BigInt('123').operatorBitwiseAnd(BigInt('456')).toString()).assertEqual('72');

      expect(BigInt(BigInt(10)).operatorBitwiseAnd(BigInt(true)).toString()).assertEqual('0');

      expect(BigInt(123456.0).operatorBitwiseAnd(BigInt('654321')) instanceof BigInt).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0026
     * @tc.name testBigIntOperatorBitwiseAndZeroSpecialSources0026
     * @tc.desc operatorBitwiseAnd: zero with boolean true/false, string "-0", byte/short/int/long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndZeroSpecialSources0026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

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
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0027
     * @tc.name testBigIntOperatorBitwiseAndStructuredLargePatterns0027
     * @tc.desc operatorBitwiseAnd with digit-structured large patterns (all-1s, sequenced)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndStructuredLargePatterns0027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt('111111111111111111111111111111').operatorBitwiseAnd(
        BigInt('222222222222222222222222222222')).toString())
        .assertEqual('21665012927145782014190838150');

      expect(BigInt('999999999999999999999999999999').operatorBitwiseAnd(
        BigInt('111111111111111111111111111111')).toString())
        .assertEqual('2171933519367088969084596679');
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0028
     * @tc.name testBigIntOperatorBitwiseAndEqualsVerification0028
     * @tc.desc operatorBitwiseAnd result verified via equals()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndEqualsVerification0028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      expect(BigInt(7).operatorBitwiseAnd(BigInt(8)).equals(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0029
     * @tc.name testBigIntOperatorBitwiseAndSingleBit63Boundary0029
     * @tc.desc operatorBitwiseAnd: bit 63 self-and and with long max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndSingleBit63Boundary0029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const bit63 = BigInt('9223372036854775808');
      expect(bit63.operatorBitwiseAnd(bit63).toString()).assertEqual('9223372036854775808');

      expect(bit63.operatorBitwiseAnd(BigInt('9223372036854775807')).toString()).assertEqual('0');
    });
  });
}
