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
import { describe, it, expect,afterEach } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

function getBigInt(): BigInt {
  return BigInt(100);
}

export default function BigIntOperatorBitwiseNotTest_2(): void {
  describe('BigInt.operatorBitwiseNot - expanded param dimensions', (): void => {
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve)=>{
        setTimeout(()=>{
          resolve(undefined);
        },50)
      })
    });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0700
     * @tc.name testBigIntOperatorBitwiseNotByteShortBoundary0700
     * @tc.desc operatorBitwiseNot with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotByteShortBoundary0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorBitwiseNot().toString()).assertEqual('-128');
      expect(BigInt(-128).operatorBitwiseNot().toString()).assertEqual('127');
      expect(BigInt(32767).operatorBitwiseNot().toString()).assertEqual('-32768');
      expect(BigInt(-32768).operatorBitwiseNot().toString()).assertEqual('32767');
      expect(BigInt(127).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0800
     * @tc.name testBigIntOperatorBitwiseNotIntBoundary0800
     * @tc.desc operatorBitwiseNot with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotIntBoundary0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorBitwiseNot().toString()).assertEqual('-2147483648');
      expect(BigInt(-2147483648).operatorBitwiseNot().toString()).assertEqual('2147483647');
      expect(BigInt(2147483646).operatorBitwiseNot().toString()).assertEqual('-2147483647');
      expect(BigInt(-2147483647).operatorBitwiseNot().toString()).assertEqual('2147483646');
      expect(BigInt(2147483647).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_0900
     * @tc.name testBigIntOperatorBitwiseNotLargeDigitLength0900
     * @tc.desc operatorBitwiseNot with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLargeDigitLength0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v20 = '12345678901234567890';
      const v20_neg = '-12345678901234567890';
      const v40 = '1234567890123456789012345678901234567890';
      const v40_neg = '-1234567890123456789012345678901234567890';

      expect(BigInt(v20).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v20);
      expect(BigInt(v20_neg).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v20_neg);
      expect(BigInt(v40).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v40);
      expect(BigInt(v40_neg).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v40_neg);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_1000
     * @tc.name testBigIntOperatorBitwiseNotCrossFormatConsistency1000
     * @tc.desc operatorBitwiseNot with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotCrossFormatConsistency1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('127').operatorBitwiseNot().toString()).assertEqual(
        BigInt(127).operatorBitwiseNot().toString());
      expect(BigInt('-128').operatorBitwiseNot().toString()).assertEqual(
        BigInt(-128).operatorBitwiseNot().toString());
      expect(BigInt('32767').operatorBitwiseNot().toString()).assertEqual(
        BigInt(32767).operatorBitwiseNot().toString());
      expect(BigInt('2147483647').operatorBitwiseNot().toString()).assertEqual(
        BigInt(2147483647).operatorBitwiseNot().toString());
      expect(BigInt('9223372036854775807').operatorBitwiseNot().toString()).assertEqual(
        BigInt(9223372036854775807).operatorBitwiseNot().toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_1100
     * @tc.name testBigIntOperatorBitwiseNotNearZeroValues1100
     * @tc.desc operatorBitwiseNot with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNearZeroValues1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
      expect(BigInt(1).operatorBitwiseNot().toString()).assertEqual('-2');
      expect(BigInt(-1).operatorBitwiseNot().toString()).assertEqual('0');
      expect(BigInt(-2).operatorBitwiseNot().toString()).assertEqual('1');
      expect(BigInt(2).operatorBitwiseNot().toString()).assertEqual('-3');
      expect(BigInt(-3).operatorBitwiseNot().toString()).assertEqual('2');
      expect(BigInt(0).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_1200
     * @tc.name testBigIntOperatorBitwiseNotPowerOfTwo1200
     * @tc.desc operatorBitwiseNot with power-of-2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPowerOfTwo1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorBitwiseNot().toString()).assertEqual('-2');
      expect(BigInt(2).operatorBitwiseNot().toString()).assertEqual('-3');
      expect(BigInt(1024).operatorBitwiseNot().toString()).assertEqual('-1025');
      expect(BigInt(1048576).operatorBitwiseNot().toString()).assertEqual('-1048577');
      expect(BigInt(2147483648).operatorBitwiseNot().toString()).assertEqual('-2147483649');
      expect(BigInt('9223372036854775808').operatorBitwiseNot().toString()).assertEqual('-9223372036854775809');
      expect(BigInt(1).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('1');
      expect(BigInt('9223372036854775808').operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_1300
     * @tc.name testBigIntOperatorBitwiseNotDeepBoundary1300
     * @tc.desc operatorBitwiseNot with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotDeepBoundary1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const negBig100 = '-' + big100;

      expect(BigInt(big100).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(big100);
      expect(BigInt(negBig100).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(negBig100);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_1400
     * @tc.name testBigIntOperatorBitwiseNotSequentialNoThrow1400
     * @tc.desc sequential mixed operatorBitwiseNot calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotSequentialNoThrow1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      expect(a.operatorBitwiseNot().toString()).assertEqual('-43');
      expect(a.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('42');
      expect(a.operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-43');
      expect(a.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_1500
     * @tc.name testBigIntOperatorBitwiseNotAlternatingPattern1500
     * @tc.desc operatorBitwiseNot with alternating bit masks (0xAAAA..., 0x5555...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotAlternatingPattern1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('2863311530').operatorBitwiseNot().toString()).assertEqual('-2863311531');
      expect(BigInt('1431655765').operatorBitwiseNot().toString()).assertEqual('-1431655766');
      expect(BigInt('2863311530').operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('2863311530');
      expect(BigInt('1431655765').operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('1431655765');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_018
     * @tc.name testBigIntOperatorBitwiseNotTypeZoneBatch
     * @tc.desc byte/short/int zone values NOT double-inverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTypeZoneBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const vals: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(64), BigInt(-64),
        BigInt(127), BigInt(-128), BigInt(128), BigInt(-129), BigInt(255), BigInt(-256),
        BigInt(32767), BigInt(-32768), BigInt(32768), BigInt(-32769), BigInt(65535),
        BigInt(-65536), BigInt(2147483647), BigInt(-2147483648)];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(vals[i].toString());
      }
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_021
     * @tc.name testBigIntOperatorBitwiseNotLarge_EXT021
     * @tc.desc large multi-digit NOT double-inverse (40-digit, 150-digit, 500-digit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLarge_EXT021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s40 = '1234567890123456789012345678901234567890';
      expect(BigInt(s40).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(s40);
      const s150 = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
      expect(BigInt(s150).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(s150);
      const s500 = '99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      expect(BigInt(s500).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(s500);
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_041
     * @tc.name testBigIntOperatorBitwiseNotConsist_EXT041
     * @tc.desc cross-constructor NOT consistency: int/str/hex/oct/bin/bool/fromULong all same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotConsist_EXT041', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual(BigInt('0').operatorBitwiseNot().toString());
      expect(BigInt(127).operatorBitwiseNot().toString()).assertEqual(BigInt('127').operatorBitwiseNot().toString());
      expect(BigInt(0xFF).operatorBitwiseNot().toString()).assertEqual(BigInt('0xFF').operatorBitwiseNot().toString());
      expect(BigInt(true).operatorBitwiseNot().toString()).assertEqual(BigInt(1).operatorBitwiseNot().toString());
      expect(BigInt(false).operatorBitwiseNot().toString()).assertEqual(BigInt(0).operatorBitwiseNot().toString());
      expect(BigInt.fromULong(42).operatorBitwiseNot().toString()).assertEqual(BigInt(42).operatorBitwiseNot().toString());
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_061
     * @tc.name testBigIntOperatorBitwiseNotXorEqBatch_EXT061
     * @tc.desc NOT == XOR(-1) equivalence for representative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotXorEqBatch_EXT061', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(32767), BigInt(2147483647), BigInt('9223372036854775807')];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().toString()).assertEqual(pts[i].operatorBitwiseXor(BigInt(-1)).toString());
      }
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_081
     * @tc.name testBigIntOperatorBitwiseNotRelAddOneBatch_EXT081
     * @tc.desc NOT == -(x+1) relation for representative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotRelAddOneBatch_EXT081', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(32767), BigInt(2147483647), BigInt('9223372036854775807'), BigInt('-9223372036854775808'), BigInt(65535)];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().toString()).assertEqual(pts[i].operatorAdd(BigInt(1)).negate().toString());
      }
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_101
     * @tc.name testBigIntOperatorBitwiseNotChainBatch_EXT101
     * @tc.desc chain NOT (2x,4x) recovery for representative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotChainBatch_EXT101', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(-128), BigInt(32767), BigInt(-32768), BigInt(2147483647), BigInt(-2147483648)];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i].toString());
        expect(pts[i].operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i].toString());
      }
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_121
     * @tc.name testBigIntOperatorBitwiseNotCombo_EXT121
     * @tc.desc ~x + 1 == -x for boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotCombo_EXT121', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(-128), BigInt(32767), BigInt(2147483647), BigInt(-2147483648), BigInt('9223372036854775807'), BigInt('-9223372036854775808')];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().operatorAdd(BigInt(1)).toString()).assertEqual(pts[i].negate().toString());
      }
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_141
     * @tc.name testBigIntOperatorBitwiseNotPatBatch_EXT141
     * @tc.desc batch pattern NOT: zero, all-1s, alternating bits, masks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPatBatch_EXT141', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseNot().toString()).assertEqual('0');
      expect(BigInt('2863311530').operatorBitwiseNot().toString()).assertEqual('-2863311531');
      expect(BigInt('1431655765').operatorBitwiseNot().toString()).assertEqual('-1431655766');
      expect(BigInt('4294967295').operatorBitwiseNot().toString()).assertEqual('-4294967296');
      expect(BigInt('18446744073709551615').operatorBitwiseNot().toString()).assertEqual('-18446744073709551616');
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_161
     * @tc.name testBigIntOperatorBitwiseNotSymBatch_EXT161
     * @tc.desc batch positive/negative NOT symmetry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotSymBatch_EXT161', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pts: BigInt[][] = [[BigInt(5), BigInt(-5)], [BigInt(42), BigInt(-42)], [BigInt(127), BigInt(-127)], [BigInt(128), BigInt(-128)], [BigInt(32767), BigInt(-32767)], [BigInt(65535), BigInt(-65535)], [BigInt(2147483647), BigInt(-2147483647)], [BigInt(-2147483648), BigInt(2147483648)], [BigInt('9223372036854775807'), BigInt('-9223372036854775807')], [BigInt('-9223372036854775808'), BigInt('9223372036854775808')]];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i][0].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i][0].toString());
        expect(pts[i][1].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i][1].toString());
      }
    });
    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_181
     * @tc.name testBigIntOperatorBitwiseNotLargeNegBatch_EXT181
     * @tc.desc batch large negative NOT double-inverse for 50-digit, 100-digit, 200-digit, 300-digit, 500-digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLargeNegBatch_EXT181', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const neg50 = BigInt('-' + '1'.repeat(50));
      expect(neg50.operatorBitwiseNot().operatorBitwiseNot().equals(neg50)).assertTrue();
      const neg100 = BigInt('-' + '1'.repeat(100));
      expect(neg100.operatorBitwiseNot().operatorBitwiseNot().equals(neg100)).assertTrue();
      const neg200 = BigInt('-' + '1'.repeat(200));
      expect(neg200.operatorBitwiseNot().operatorBitwiseNot().equals(neg200)).assertTrue();
      const neg500 = BigInt('-' + '9'.repeat(500));
      expect(neg500.operatorBitwiseNot().operatorBitwiseNot().equals(neg500)).assertTrue();
    });
  

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_201
     * @tc.name testBigIntOpBitwiseNotOpArithBatch
     * @tc.desc arithmetic result NOT: add/sub/mul/div/mod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOpBitwiseNotOpArithBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorAdd(BigInt(200)).operatorBitwiseNot().toString()).assertEqual('-301');
      expect(BigInt(500).operatorSubtract(BigInt(200)).operatorBitwiseNot().toString()).assertEqual('-301');
      expect(BigInt(100).operatorMultiply(BigInt(100)).operatorBitwiseNot().toString()).assertEqual('-10001');
      expect(BigInt(100).operatorDivide(BigInt(3)).operatorBitwiseNot().toString()).assertEqual('-34');
      expect(BigInt(100).operatorModule(BigInt(3)).operatorBitwiseNot().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_206
     * @tc.name testBigIntOpBitwiseNotOpBitwiseBatch
     * @tc.desc bitwise result NOT: shiftL/shiftR/and/or/xor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOpBitwiseNotOpBitwiseBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLeftShift(BigInt(10)).operatorBitwiseNot().toString()).assertEqual('-1025');
      expect(BigInt(1024).operatorRightShift(BigInt(5)).operatorBitwiseNot().toString()).assertEqual('-33');
      expect(BigInt(255).operatorBitwiseAnd(BigInt(15)).operatorBitwiseNot().toString()).assertEqual('-16');
      expect(BigInt(240).operatorBitwiseOr(BigInt(15)).operatorBitwiseNot().toString()).assertEqual('-256');
      expect(BigInt(255).operatorBitwiseXor(BigInt(15)).operatorBitwiseNot().toString()).assertEqual('-241');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_211
     * @tc.name testBigIntOperatorBitwiseNotPat0x0F_EXT211
     * @tc.desc 0x0F (15) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0x0F_EXT211', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0x0F).operatorBitwiseNot().toString()).assertEqual('-16');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_212
     * @tc.name testBigIntOperatorBitwiseNotPat0xF0_EXT212
     * @tc.desc 0xF0 (240) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0xF0_EXT212', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0xF0).operatorBitwiseNot().toString()).assertEqual('-241');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_213
     * @tc.name testBigIntOperatorBitwiseNotPat0xFF00_EXT213
     * @tc.desc 0xFF00 (65280) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0xFF00_EXT213', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0xFF00).operatorBitwiseNot().toString()).assertEqual('-65281');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_214
     * @tc.name testBigIntOperatorBitwiseNotPat0b1010_EXT214
     * @tc.desc binary 0b1010 (10) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0b1010_EXT214', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0b1010).operatorBitwiseNot().toString()).assertEqual('-11');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_215
     * @tc.name testBigIntOperatorBitwiseNotPat0b1100_EXT215
     * @tc.desc binary 0b1100 (12) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0b1100_EXT215', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0b1100).operatorBitwiseNot().toString()).assertEqual('-13');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_216
     * @tc.name testBigIntOperatorBitwiseNotPat0b11110000_EXT216
     * @tc.desc binary 0b11110000 (240) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0b11110000_EXT216', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0b11110000).operatorBitwiseNot().toString()).assertEqual('-241');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_217
     * @tc.name testBigIntOperatorBitwiseNotPat0b11001100_EXT217
     * @tc.desc binary 0b11001100 (204) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPat0b11001100_EXT217', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0b11001100).operatorBitwiseNot().toString()).assertEqual('-205');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_218
     * @tc.name testBigIntOperatorBitwiseNotFuncReturn_EXT218
     * @tc.desc function return value NOT: getBigInt().operatorBitwiseNot()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotFuncReturn_EXT218', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getBigInt().operatorBitwiseNot().toString()).assertEqual('-101');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_219
     * @tc.name testBigIntOperatorBitwiseNotTernaryExpr_EXT219
     * @tc.desc ternary expression result NOT: (true ? 10n : 20n).operatorBitwiseNot()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTernaryExpr_EXT219', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((true ? BigInt(10) : BigInt(20)).operatorBitwiseNot().toString()).assertEqual('-11');
      expect((false ? BigInt(10) : BigInt(20)).operatorBitwiseNot().toString()).assertEqual('-21');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_220
     * @tc.name testBigIntOpBitwiseNotPow2Batch
     * @tc.desc 2^100 and 2^200 positive/negative NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOpBitwiseNotPow2Batch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: BigInt[] = [
        BigInt(2).pow(BigInt(100)),
        BigInt(2).pow(BigInt(100)).negate(),
        BigInt(2).pow(BigInt(200)),
        BigInt(2).pow(BigInt(200)).negate(),
      ];
      for (let i = 0; i < data.length; i++) {
        const expected = data[i].operatorAdd(BigInt(1)).negate();
        expect(data[i].operatorBitwiseNot().toString()).assertEqual(expected.toString());
      }
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_224
     * @tc.name testBigIntOperatorBitwiseNotImmutableNeg_EXT224
     * @tc.desc receiver unchanged after NOT (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotImmutableNeg_EXT224', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(-100);
      const orig = v.toString();
      v.operatorBitwiseNot();
      expect(v.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_225
     * @tc.name testBigIntOperatorBitwiseNotImmutableZero_EXT225
     * @tc.desc receiver unchanged after NOT (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotImmutableZero_EXT225', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v = BigInt(0);
      const orig = v.toString();
      v.operatorBitwiseNot();
      expect(v.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_226
     * @tc.name testBigIntOperatorBitwiseNotNewRef_EXT226
     * @tc.desc NOT returns new object (not same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNewRef_EXT226', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(42);
      const result = original.operatorBitwiseNot();
      expect(result.toString()).assertEqual('-43');
      expect(original.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_227
     * @tc.name testBigIntOperatorBitwiseNotImmutableMultiple_EXT227
     * @tc.desc multiple NOT calls don't affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotImmutableMultiple_EXT227', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(7);
      original.operatorBitwiseNot();
      original.operatorBitwiseNot();
      expect(original.toString()).assertEqual('7');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_228
     * @tc.name testBigIntOperatorBitwiseNotLongMinHalf_EXT228
     * @tc.desc long min/2 NOT: -4611686018427387904
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLongMinHalf_EXT228', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-4611686018427387904').operatorBitwiseNot().toString()).assertEqual('4611686018427387903');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_229
     * @tc.name testBigIntOperatorBitwiseNotLongMaxHalf_EXT229
     * @tc.desc long max/2 NOT: 4611686018427387903
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLongMaxHalf_EXT229', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('4611686018427387903').operatorBitwiseNot().toString()).assertEqual('-4611686018427387904');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_230
     * @tc.name testBigIntOperatorBitwiseNot4294967296_EXT230
     * @tc.desc 2^32 = 4294967296 NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNot4294967296_EXT230', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('4294967296').operatorBitwiseNot().toString()).assertEqual('-4294967297');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_231
     * @tc.name testBigIntOperatorBitwiseNotBasic10_EXT231
     * @tc.desc 10 NOT = -11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotBasic10_EXT231', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorBitwiseNot().toString()).assertEqual('-11');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_232
     * @tc.name testBigIntOperatorBitwiseNotBasicNeg10_EXT232
     * @tc.desc -10 NOT = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotBasicNeg10_EXT232', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).operatorBitwiseNot().toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_233
     * @tc.name testBigIntOperatorBitwiseNotBasic1000_EXT233
     * @tc.desc 1000 NOT = -1001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotBasic1000_EXT233', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000).operatorBitwiseNot().toString()).assertEqual('-1001');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_234
     * @tc.name testBigIntOpBitwiseNotPow10Batch
     * @tc.desc 10^12/10^15/10^18 positive and negative NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOpBitwiseNotPow10Batch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: Array<[string, string]> = [
        ['1000000000000', '-1000000000001'],
        ['-1000000000000', '999999999999'],
        ['1000000000000000', '-1000000000000001'],
        ['-1000000000000000', '999999999999999'],
        ['1000000000000000000', '-1000000000000000001'],
        ['-1000000000000000000', '999999999999999999'],
      ];
      for (let i = 0; i < data.length; i++) {
        expect(BigInt(data[i][0]).operatorBitwiseNot().toString()).assertEqual(data[i][1]);
      }
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_240
     * @tc.name testBigIntOperatorBitwiseNotNeg100000_EXT240
     * @tc.desc -100000 NOT = 99999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg100000_EXT240', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-100000).operatorBitwiseNot().toString()).assertEqual('99999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_241
     * @tc.name testBigIntOperatorBitwiseNotNeg123456789_EXT241
     * @tc.desc -123456789 NOT = 123456788
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg123456789_EXT241', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-123456789).operatorBitwiseNot().toString()).assertEqual('123456788');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_242
     * @tc.name testBigIntOperatorBitwiseNotNeg987654321_EXT242
     * @tc.desc -987654321 NOT = 987654320
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg987654321_EXT242', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-987654321).operatorBitwiseNot().toString()).assertEqual('987654320');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_243
     * @tc.name testBigIntOperatorBitwiseNotNeg2147483647_EXT243
     * @tc.desc -2147483647 NOT = 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg2147483647_EXT243', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-2147483647').operatorBitwiseNot().toString()).assertEqual('2147483646');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_244
     * @tc.name testBigIntOperatorBitwiseNotNeg9223372036854775807_EXT244
     * @tc.desc -9223372036854775807 NOT = 9223372036854775806
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg9223372036854775807_EXT244', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9223372036854775807').operatorBitwiseNot().toString()).assertEqual('9223372036854775806');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_245
     * @tc.name testBigIntOperatorBitwiseNotNeg10000_EXT245
     * @tc.desc -10000 NOT = 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg10000_EXT245', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10000).operatorBitwiseNot().toString()).assertEqual('9999');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_246
     * @tc.name testBigIntOperatorBitwiseNotNeg4294967296_EXT246
     * @tc.desc -4294967296 NOT = 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNeg4294967296_EXT246', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-4294967296').operatorBitwiseNot().toString()).assertEqual('4294967295');
    });

    

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_247
     * @tc.name testBigIntOperatorBitwiseNotPerf1000_EXT247
     * @tc.desc 1000 iterations of operatorBitwiseNot without performance degradation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPerf1000_EXT247', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v = BigInt(1);
      for (let i = 0; i < 1000; i++) {
        v = v.operatorBitwiseNot();
      }
      expect(v.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v.toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_248
     * @tc.name testBigIntOperatorBitwiseNotPerfLargeCycle_EXT248
     * @tc.desc large number repeated NOT cycle no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPerfLargeCycle_EXT248', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v = BigInt('999999999999999999999999999999');
      for (let i = 0; i < 100; i++) {
        v = v.operatorBitwiseNot();
      }
      expect(v.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v.toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_249
     * @tc.name testBigIntOperatorBitwiseNotPerfBoundaryLoop_EXT249
     * @tc.desc boundary values -1000 to 1000 cycle NOT no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotPerfBoundaryLoop_EXT249', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      for (let i = -100; i <= 100; i++) {
        const v = BigInt(i);
        expect(v.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v.toString());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_250
     * @tc.name testBigIntOperatorBitwiseNotConsistencyWithTilde_EXT250
     * @tc.desc operatorBitwiseNot consistency with bitwise NOT (~) operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotConsistencyWithTilde_EXT250', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const vals: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(100), BigInt(-100), BigInt(255)];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].operatorBitwiseNot().toString()).assertEqual(vals[i].operatorAdd(BigInt(1)).negate().toString());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_251
     * @tc.name testBigIntOperatorBitwiseNotConsistencyWithTildeLarge_EXT251
     * @tc.desc operatorBitwiseNot consistency with ~ for large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotConsistencyWithTildeLarge_EXT251', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const vals: BigInt[] = [BigInt('9223372036854775807'), BigInt('-9223372036854775808'), BigInt('12345678901234567890')];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].operatorBitwiseNot().toString()).assertEqual(vals[i].operatorAdd(BigInt(1)).negate().toString());
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_252
     * @tc.name testBigIntOperatorBitwiseNotConstructSources252
     * @tc.desc Mindmap: bitwiseNot on double/leading-zero/copy-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotConstructSources252', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(256.0).operatorBitwiseNot().toString()).assertEqual('-257');
      expect(BigInt('007').operatorBitwiseNot().toString()).assertEqual('-8');
      expect(BigInt(BigInt(100)).operatorBitwiseNot().toString()).assertEqual('-101');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_BITWISE_NOT_EXT_253
     * @tc.name testBigIntOperatorBitwiseNotReturnConversions253
     * @tc.desc Mindmap: bitwiseNot result doubleValue and getLong assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotReturnConversions253', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(256).operatorBitwiseNot().doubleValue()).assertEqual(-257.0);
      expect(BigInt(100).operatorBitwiseNot().getLong()).assertEqual(-101);
    });
  });
}
