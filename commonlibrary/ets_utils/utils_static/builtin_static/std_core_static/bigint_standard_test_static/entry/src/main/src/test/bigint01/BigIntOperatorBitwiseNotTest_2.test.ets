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
import { describe, it, expect,afterEach,afterAll, afterEach, beforeAll, beforeEach } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';
function getBigInt(): BigInt {
  return BigInt(100);
}

export default function BigIntOperatorBitwiseNotTest_2(): void {
  describe('BigIntOperatorBitwiseNotTest_2', (): void => {
    afterEach(async (): Promise<void> => {
      await new Promise<void>((resolve)=>{
        setTimeout(()=>{
          resolve(undefined);
        },50)
      })
    });
    beforeAll((): void => {
    });
    beforeEach(async():void=>{
      await Utils.msSleep(30);
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0100
     * @tc.name testBigIntOperatorBitwiseNotTest001
     * @tc.desc operatorBitwiseNot with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorBitwiseNot().toString()).assertEqual('-128');
      expect(BigInt(-128).operatorBitwiseNot().toString()).assertEqual('127');
      expect(BigInt(32767).operatorBitwiseNot().toString()).assertEqual('-32768');
      expect(BigInt(-32768).operatorBitwiseNot().toString()).assertEqual('32767');
      expect(BigInt(127).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0200
     * @tc.name testBigIntOperatorBitwiseNotTest002
     * @tc.desc operatorBitwiseNot with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2147483647).operatorBitwiseNot().toString()).assertEqual('-2147483648');
      expect(BigInt(-2147483648).operatorBitwiseNot().toString()).assertEqual('2147483647');
      expect(BigInt(2147483646).operatorBitwiseNot().toString()).assertEqual('-2147483647');
      expect(BigInt(-2147483647).operatorBitwiseNot().toString()).assertEqual('2147483646');
      expect(BigInt(2147483647).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0300
     * @tc.name testBigIntOperatorBitwiseNotTest003
     * @tc.desc operatorBitwiseNot with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      const v20 = '12345678901234567890';
      const v20_neg = '-12345678901234567890';
      const v40 = '1234567890123456789012345678901234567890';
      const v40_neg = '-1234567890123456789012345678901234567890';

      expect(BigInt(v20).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v20);
      expect(BigInt(v20_neg).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v20_neg);
      expect(BigInt(v40).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v40);
      expect(BigInt(v40_neg).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v40_neg);

      expect(BigInt(v20).operatorBitwiseNot().toString()).assertEqual('-12345678901234567891');
      expect(BigInt(v20_neg).operatorBitwiseNot().toString()).assertEqual('12345678901234567889');
      expect(BigInt(v40).operatorBitwiseNot().toString()).assertEqual('-1234567890123456789012345678901234567891');
      expect(BigInt(v40_neg).operatorBitwiseNot().toString()).assertEqual('1234567890123456789012345678901234567889');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0400
     * @tc.name testBigIntOperatorBitwiseNotTest004
     * @tc.desc operatorBitwiseNot with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0500
     * @tc.name testBigIntOperatorBitwiseNotTest005
     * @tc.desc operatorBitwiseNot with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0600
     * @tc.name testBigIntOperatorBitwiseNotTest006
     * @tc.desc operatorBitwiseNot with power-of-2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0700
     * @tc.name testBigIntOperatorBitwiseNotTest007
     * @tc.desc operatorBitwiseNot with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const negBig100 = '-' + big100;
      expect(BigInt(big100).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(big100);
      expect(BigInt(negBig100).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(negBig100);

      expect(BigInt(big100).operatorBitwiseNot().toString()).assertEqual(BigInt(big100).operatorAdd(BigInt(1)).negate().toString());
      expect(BigInt(negBig100).operatorBitwiseNot().toString()).assertEqual(BigInt(negBig100).operatorAdd(BigInt(1)).negate().toString());

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0800
     * @tc.name testBigIntOperatorBitwiseNotTest008
     * @tc.desc sequential mixed operatorBitwiseNot calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(42);
      expect(a.operatorBitwiseNot().toString()).assertEqual('-43');
      expect(a.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('42');
      expect(a.operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-43');
      expect(a.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_0900
     * @tc.name testBigIntOperatorBitwiseNotTest009
     * @tc.desc operatorBitwiseNot with alternating bit masks (0xAAAA..., 0x5555...)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('2863311530').operatorBitwiseNot().toString()).assertEqual('-2863311531');
      expect(BigInt('1431655765').operatorBitwiseNot().toString()).assertEqual('-1431655766');
      expect(BigInt('2863311530').operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('2863311530');
      expect(BigInt('1431655765').operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('1431655765');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1000
     * @tc.name testBigIntOperatorBitwiseNotExtTest010
     * @tc.desc byte/short/int zone values NOT double-inverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1),
        BigInt(127), BigInt(-128),
        BigInt(65535), BigInt(-65536),
        BigInt(4294967295),
        BigInt(2147483647), BigInt(-2147483648),
      ];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(vals[i].toString());
      }
      expect(BigInt(65535).operatorBitwiseNot().toString()).assertEqual('-65536');
      expect(BigInt(4294967295).operatorBitwiseNot().toString()).assertEqual('-4294967296');
      expect(BigInt(65535).operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('65535');
      expect(BigInt(4294967295).operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('4294967295');
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1100
     * @tc.name testBigIntOperatorBitwiseNotExtTest011
     * @tc.desc large multi-digit NOT double-inverse (40-digit, 150-digit, 500-digit)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s40 = '1234567890123456789012345678901234567890';
      expect(BigInt(s40).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(s40);
      const s150 = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
      expect(BigInt(s150).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(s150);
      const s500 = '99999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      expect(BigInt(s500).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(s500);

      expect(BigInt(s40).operatorBitwiseNot().toString()).assertEqual('-1234567890123456789012345678901234567891');
      expect(BigInt(s500).operatorBitwiseNot().toString()).assertEqual('-1' + '0'.repeat(500));

    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1200
     * @tc.name testBigIntOperatorBitwiseNotExtTest012
     * @tc.desc cross-constructor NOT consistency: int/str/hex/oct/bin/bool/fromULong all same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual(BigInt('0').operatorBitwiseNot().toString());
      expect(BigInt(127).operatorBitwiseNot().toString()).assertEqual(BigInt('127').operatorBitwiseNot().toString());
      expect(BigInt(0xFF).operatorBitwiseNot().toString()).assertEqual(BigInt('0xFF').operatorBitwiseNot().toString());
      expect(BigInt(true).operatorBitwiseNot().toString()).assertEqual(BigInt(1).operatorBitwiseNot().toString());
      expect(BigInt(false).operatorBitwiseNot().toString()).assertEqual(BigInt(0).operatorBitwiseNot().toString());
      expect(BigInt.fromULong(42).operatorBitwiseNot().toString()).assertEqual(BigInt(42).operatorBitwiseNot().toString());
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1300
     * @tc.name testBigIntOperatorBitwiseNotExtTest013
     * @tc.desc NOT == XOR(-1) equivalence for representative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(32767), BigInt(2147483647), BigInt('9223372036854775807')];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().toString()).assertEqual(pts[i].operatorBitwiseXor(BigInt(-1)).toString());
      }
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1400
     * @tc.name testBigIntOperatorBitwiseNotExtTest014
     * @tc.desc NOT == -(x+1) relation for representative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(32767), BigInt(2147483647), BigInt('9223372036854775807'), BigInt('-9223372036854775808'), BigInt(65535)];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().toString()).assertEqual(pts[i].operatorAdd(BigInt(1)).negate().toString());
      }
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1500
     * @tc.name testBigIntOperatorBitwiseNotExtTest015
     * @tc.desc chain NOT (2x,4x) recovery for representative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, ():void => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(-128), BigInt(32767), BigInt(-32768), BigInt(2147483647), BigInt(-2147483648)];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i].toString());
      }
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
      expect(BigInt(-2147483648).operatorBitwiseNot().toString()).assertEqual('2147483647');
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1600
     * @tc.name testBigIntOperatorBitwiseNotExtTest016
     * @tc.desc ~x + 1 == -x for boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pts: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(42), BigInt(127), BigInt(-128), BigInt(32767), BigInt(2147483647), BigInt(-2147483648), BigInt('9223372036854775807'), BigInt('-9223372036854775808')];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i].operatorBitwiseNot().operatorAdd(BigInt(1)).toString()).assertEqual(pts[i].negate().toString());
      }
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1700
     * @tc.name testBigIntOperatorBitwiseNotExtTest017
     * @tc.desc batch pattern NOT: zero, all-1s, alternating bits, masks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseNot().toString()).assertEqual('0');
      expect(BigInt('2863311530').operatorBitwiseNot().toString()).assertEqual('-2863311531');
      expect(BigInt('1431655765').operatorBitwiseNot().toString()).assertEqual('-1431655766');
      expect(BigInt('4294967295').operatorBitwiseNot().toString()).assertEqual('-4294967296');
      expect(BigInt('18446744073709551615').operatorBitwiseNot().toString()).assertEqual('-18446744073709551616');
    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1800
     * @tc.name testBigIntOperatorBitwiseNotExtTest018
     * @tc.desc batch positive/negative NOT symmetry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pts: BigInt[][] = [
        [BigInt(127), BigInt(-127)],
        [BigInt(65535), BigInt(-65535)],
        [BigInt(2147483647), BigInt(-2147483647)],
        [BigInt(-2147483648), BigInt(2147483648)],
        [BigInt('9223372036854775807'), BigInt('-9223372036854775807')],
        [BigInt('-9223372036854775808'), BigInt('9223372036854775808')],
      ];
      for (let i = 0; i < pts.length; i++) {
        expect(pts[i][0].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i][0].toString());
        expect(pts[i][1].operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(pts[i][1].toString());
      }
      expect(BigInt('9223372036854775807').operatorBitwiseNot().toString()).assertEqual('-9223372036854775808');
      expect(BigInt('-9223372036854775808').operatorBitwiseNot().toString()).assertEqual('9223372036854775807');

    });
    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_1900
     * @tc.name testBigIntOperatorBitwiseNotExtTest019
     * @tc.desc batch large negative NOT double-inverse for 50-digit, 100-digit, 200-digit, 300-digit, 500-digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const neg50 = BigInt('-' + '1'.repeat(50));
      expect(neg50.operatorBitwiseNot().operatorBitwiseNot().equals(neg50)).assertTrue();
      const neg100 = BigInt('-' + '1'.repeat(100));
      expect(neg100.operatorBitwiseNot().operatorBitwiseNot().equals(neg100)).assertTrue();
      const neg200 = BigInt('-' + '1'.repeat(200));
      expect(neg200.operatorBitwiseNot().operatorBitwiseNot().equals(neg200)).assertTrue();
      const neg500 = BigInt('-' + '9'.repeat(500));
      expect(neg500.operatorBitwiseNot().operatorBitwiseNot().equals(neg500)).assertTrue();

      expect(neg50.operatorBitwiseNot().toString()).assertEqual(neg50.operatorAdd(BigInt(1)).negate().toString());
      expect(neg500.operatorBitwiseNot().toString()).assertEqual(neg500.operatorAdd(BigInt(1)).negate().toString());

    });
  

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2000
     * @tc.name testBigIntOperatorBitwiseNotExtTest020
     * @tc.desc arithmetic result NOT: add/sub/mul/div/mod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorAdd(BigInt(200)).operatorBitwiseNot().toString()).assertEqual('-301');
      expect(BigInt(500).operatorSubtract(BigInt(200)).operatorBitwiseNot().toString()).assertEqual('-301');
      expect(BigInt(100).operatorMultiply(BigInt(100)).operatorBitwiseNot().toString()).assertEqual('-10001');
      expect(BigInt(100).operatorDivide(BigInt(3)).operatorBitwiseNot().toString()).assertEqual('-34');
      expect(BigInt(100).operatorModule(BigInt(3)).operatorBitwiseNot().toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2100
     * @tc.name testBigIntOperatorBitwiseNotExtTest021
     * @tc.desc bitwise result NOT: shiftL/shiftR/and/or/xor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLeftShift(BigInt(10)).operatorBitwiseNot().toString()).assertEqual('-1025');
      expect(BigInt(1024).operatorRightShift(BigInt(5)).operatorBitwiseNot().toString()).assertEqual('-33');
      expect(BigInt(255).operatorBitwiseAnd(BigInt(15)).operatorBitwiseNot().toString()).assertEqual('-16');
      expect(BigInt(240).operatorBitwiseOr(BigInt(15)).operatorBitwiseNot().toString()).assertEqual('-256');
      expect(BigInt(255).operatorBitwiseXor(BigInt(15)).operatorBitwiseNot().toString()).assertEqual('-241');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2200
     * @tc.name testBigIntOperatorBitwiseNotExtTest022
     * @tc.desc 0x0F (15) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0x0F).operatorBitwiseNot().toString()).assertEqual('-16');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2300
     * @tc.name testBigIntOperatorBitwiseNotExtTest023
     * @tc.desc 0xF0 (240) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0xF0).operatorBitwiseNot().toString()).assertEqual('-241');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2400
     * @tc.name testBigIntOperatorBitwiseNotExtTest024
     * @tc.desc 0xFF00 (65280) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0xFF00).operatorBitwiseNot().toString()).assertEqual('-65281');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2500
     * @tc.name testBigIntOperatorBitwiseNotExtTest025
     * @tc.desc binary 0b1010 (10) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0b1010).operatorBitwiseNot().toString()).assertEqual('-11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2600
     * @tc.name testBigIntOperatorBitwiseNotExtTest026
     * @tc.desc binary 0b1100 (12) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0b1100).operatorBitwiseNot().toString()).assertEqual('-13');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2700
     * @tc.name testBigIntOperatorBitwiseNotExtTest027
     * @tc.desc binary 0b11110000 (240) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0b11111111).operatorBitwiseNot().toString()).assertEqual('-256');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2800
     * @tc.name testBigIntOperatorBitwiseNotExtTest028
     * @tc.desc binary 0b11001100 (204) bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0b11001100).operatorBitwiseNot().toString()).assertEqual('-205');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_2900
     * @tc.name testBigIntOperatorBitwiseNotExtTest029
     * @tc.desc function return value NOT: getBigInt().operatorBitwiseNot()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getBigInt().operatorBitwiseNot().toString()).assertEqual('-101');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3000
     * @tc.name testBigIntOperatorBitwiseNotExtTest030
     * @tc.desc ternary expression result NOT: (true ? 10n : 20n).operatorBitwiseNot()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true ? BigInt(10) : BigInt(20)).operatorBitwiseNot().toString()).assertEqual('-11');
      expect((false ? BigInt(10) : BigInt(20)).operatorBitwiseNot().toString()).assertEqual('-21');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3100
     * @tc.name testBigIntOperatorBitwiseNotExtTest031
     * @tc.desc 2^100 and 2^200 positive/negative NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3200
     * @tc.name testBigIntOperatorBitwiseNotExtTest032
     * @tc.desc receiver unchanged after NOT (negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = BigInt(-100);
      const orig = v.toString();
      v.operatorBitwiseNot();
      expect(v.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3300
     * @tc.name testBigIntOperatorBitwiseNotExtTest033
     * @tc.desc receiver unchanged after NOT (zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v = BigInt(0);
      const orig = v.toString();
      v.operatorBitwiseNot();
      expect(v.toString()).assertEqual(orig);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3400
     * @tc.name testBigIntOperatorBitwiseNotExtTest034
     * @tc.desc NOT returns new object (not same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest034', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = BigInt(42);
      const result = original.operatorBitwiseNot();
      expect(result.toString()).assertEqual('-43');
      expect(original.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3500
     * @tc.name testBigIntOperatorBitwiseNotExtTest035
     * @tc.desc multiple NOT calls don't affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest035', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = BigInt(7);
      original.operatorBitwiseNot();
      original.operatorBitwiseNot();
      expect(original.toString()).assertEqual('7');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3600
     * @tc.name testBigIntOperatorBitwiseNotExtTest036
     * @tc.desc long min/2 NOT: -4611686018427387904
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest036', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-4611686018427387904').operatorBitwiseNot().toString()).assertEqual('4611686018427387903');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3700
     * @tc.name testBigIntOperatorBitwiseNotExtTest037
     * @tc.desc long max/2 NOT: 4611686018427387903
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest037', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('4611686018427387903').operatorBitwiseNot().toString()).assertEqual('-4611686018427387904');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3800
     * @tc.name testBigIntOperatorBitwiseNotExtTest038
     * @tc.desc 2^32 = 4294967296 NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest038', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('4294967296').operatorBitwiseNot().toString()).assertEqual('-4294967297');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_3900
     * @tc.name testBigIntOperatorBitwiseNotExtTest039
     * @tc.desc 10 NOT = -11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest039', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorBitwiseNot().toString()).assertEqual('-11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4000
     * @tc.name testBigIntOperatorBitwiseNotExtTest040
     * @tc.desc -10 NOT = 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest040', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10).operatorBitwiseNot().toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4100
     * @tc.name testBigIntOperatorBitwiseNotExtTest041
     * @tc.desc 1000 NOT = -1001
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest041', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1000).operatorBitwiseNot().toString()).assertEqual('-1001');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4200
     * @tc.name testBigIntOperatorBitwiseNotExtTest042
     * @tc.desc 10^12/10^15/10^18 positive and negative NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest042', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4300
     * @tc.name testBigIntOperatorBitwiseNotExtTest043
     * @tc.desc -100000 NOT = 99999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest043', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-100000).operatorBitwiseNot().toString()).assertEqual('99999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4400
     * @tc.name testBigIntOperatorBitwiseNotExtTest044
     * @tc.desc -123456789 NOT = 123456788
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest044', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-123456789).operatorBitwiseNot().toString()).assertEqual('123456788');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4500
     * @tc.name testBigIntOperatorBitwiseNotExtTest045
     * @tc.desc -987654321 NOT = 987654320
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest045', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-987654321).operatorBitwiseNot().toString()).assertEqual('987654320');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4600
     * @tc.name testBigIntOperatorBitwiseNotExtTest046
     * @tc.desc -2147483647 NOT = 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest046', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-2147483647').operatorBitwiseNot().toString()).assertEqual('2147483646');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4700
     * @tc.name testBigIntOperatorBitwiseNotExtTest047
     * @tc.desc -9223372036854775807 NOT = 9223372036854775806
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest047', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9223372036854775807').operatorBitwiseNot().toString()).assertEqual('9223372036854775806');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4800
     * @tc.name testBigIntOperatorBitwiseNotExtTest048
     * @tc.desc -10000 NOT = 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest048', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10000).operatorBitwiseNot().toString()).assertEqual('9999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_4900
     * @tc.name testBigIntOperatorBitwiseNotExtTest049
     * @tc.desc -4294967296 NOT = 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest049', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-4294967296').operatorBitwiseNot().toString()).assertEqual('4294967295');
    });

    

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5000
     * @tc.name testBigIntOperatorBitwiseNotExtTest050
     * @tc.desc 1000 iterations of operatorBitwiseNot without performance degradation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest050', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = BigInt(1);
      for (let i = 0; i < 1000; i++) {
        v = v.operatorBitwiseNot();
      }
      expect(v.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5100
     * @tc.name testBigIntOperatorBitwiseNotExtTest051
     * @tc.desc large number repeated NOT cycle no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest051', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v = BigInt('999999999999999999999999999999');
      for (let i = 0; i < 100; i++) {
        v = v.operatorBitwiseNot();
      }
      expect(v.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v.toString());
      expect(BigInt(v).operatorBitwiseNot().toString()).assertEqual('-1' + '0'.repeat(30));

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5200
     * @tc.name testBigIntOperatorBitwiseNotExtTest052
     * @tc.desc boundary values -1000 to 1000 cycle NOT no throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest052', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = -100; i <= 100; i++) {
        const v = BigInt(i);
        expect(v.operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual(v.toString());
      }
      expect(BigInt(-100).operatorBitwiseNot().toString()).assertEqual('99');
      expect(BigInt(100).operatorBitwiseNot().toString()).assertEqual('-101');
      expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5300
     * @tc.name testBigIntOperatorBitwiseNotExtTest053
     * @tc.desc operatorBitwiseNot consistency with bitwise NOT (~) operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest053', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: BigInt[] = [BigInt(0), BigInt(1), BigInt(-1), BigInt(100), BigInt(-100), BigInt(255)];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].operatorBitwiseNot().toString()).assertEqual(vals[i].operatorAdd(BigInt(1)).negate().toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5400
     * @tc.name testBigIntOperatorBitwiseNotExtTest054
     * @tc.desc operatorBitwiseNot consistency with ~ for large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest054', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: BigInt[] = [BigInt('9223372036854775807'), BigInt('-9223372036854775808'), BigInt('12345678901234567890')];
      for (let i = 0; i < vals.length; i++) {
        expect(vals[i].operatorBitwiseNot().toString()).assertEqual(vals[i].operatorAdd(BigInt(1)).negate().toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5500
     * @tc.name testBigIntOperatorBitwiseNotExtTest055
     * @tc.desc Mindmap: bitwiseNot on double/leading-zero/copy-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest055', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(256.0).operatorBitwiseNot().toString()).assertEqual('-257');
      expect(BigInt('007').operatorBitwiseNot().toString()).assertEqual('-8');
      expect(BigInt(BigInt(100)).operatorBitwiseNot().toString()).assertEqual('-101');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_BITWISE_NOT_EXT_5600
     * @tc.name testBigIntOperatorBitwiseNotExtTest056
     * @tc.desc Mindmap: bitwiseNot result doubleValue and getLong assertions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotExtTest056', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(256).operatorBitwiseNot().doubleValue()).assertEqual(-257.0);
      expect(BigInt(100).operatorBitwiseNot().getLong()).assertEqual(-101);
    });
  });
}
