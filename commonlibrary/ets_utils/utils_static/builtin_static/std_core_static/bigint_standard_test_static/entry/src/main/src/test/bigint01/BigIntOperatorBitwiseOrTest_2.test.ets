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
import { describe, it, expect,afterAll, afterEach, beforeAll, beforeEach } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';
function getBigInt(): BigInt { return BigInt(0); }

export default function BigIntOperatorBitwiseOrTest_2(): void {
  describe('BigIntOperatorBitwiseOrTest_2',(): void=>{

    beforeAll((): void => {
    });
    beforeEach(async()=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0100
     * @tc.name testBigIntBitwiseOrTest001
     * @tc.desc operatorBitwiseOr with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorBitwiseOr(BigInt(127)).toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseOr(BigInt(-128)).toString()).assertEqual('-128');
      expect(BigInt(32767).operatorBitwiseOr(BigInt(32767)).toString()).assertEqual('32767');
      expect(BigInt(-32768).operatorBitwiseOr(BigInt(-32768)).toString()).assertEqual('-32768');
      expect(BigInt(127).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('127');
      expect(BigInt(-128).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-128');
      expect(BigInt(127).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-128).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(127).operatorBitwiseOr(BigInt(-128)).toString()).assertEqual('-1');
      expect(BigInt(32767).operatorBitwiseOr(BigInt(-32768)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0200
     * @tc.name testBigIntBitwiseOrTest002
     * @tc.desc operatorBitwiseOr with int type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2147483647).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-2147483648');
      expect(BigInt(2147483647).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-2147483648).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(2147483647).operatorBitwiseOr(BigInt(-2147483648)).toString()).assertEqual('-1');
      expect(BigInt(2147483647).operatorBitwiseOr(BigInt(2147483647)).toString()).assertEqual('2147483647');
      expect(BigInt(-2147483648).operatorBitwiseOr(BigInt(-2147483648)).toString()).assertEqual('-2147483648');
      expect(BigInt(-2147483648).operatorBitwiseOr(BigInt(2147483647)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0300
     * @tc.name testBigIntBitwiseOrTest003
     * @tc.desc operatorBitwiseOr with values adjacent to signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax = BigInt('9223372036854775806');
      const nearMin = BigInt('-9223372036854775807');

      expect(nearMax.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('9223372036854775806');
      expect(nearMin.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-9223372036854775807');
      expect(nearMax.operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(nearMin.operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(nearMax.operatorBitwiseOr(nearMin).toString()).assertEqual('-1');
      expect(nearMax.operatorBitwiseOr(BigInt(1)).toString()).assertEqual('9223372036854775807');
      expect(nearMax.toString()).assertEqual('9223372036854775806');
      expect(nearMin.toString()).assertEqual('-9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0400
     * @tc.name testBigIntBitwiseOrTest004
     * @tc.desc operatorBitwiseOr with 20-digit and 40-digit large magnitude values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v20 = '12345678901234567890';
      const v20_neg = '-12345678901234567890';
      const v40 = '1234567890123456789012345678901234567890';
      const v40_neg = '-1234567890123456789012345678901234567890';

      expect(BigInt(v20).operatorBitwiseOr(BigInt(v20)).toString()).assertEqual(v20);
      expect(BigInt(v20_neg).operatorBitwiseOr(BigInt(v20_neg)).toString()).assertEqual(v20_neg);
      expect(BigInt(v40).operatorBitwiseOr(BigInt(v40)).toString()).assertEqual(v40);
      expect(BigInt(v40_neg).operatorBitwiseOr(BigInt(v40_neg)).toString()).assertEqual(v40_neg);
      expect(BigInt(v20).operatorBitwiseOr(BigInt(0)).toString()).assertEqual(v20);
      expect(BigInt(v40).operatorBitwiseOr(BigInt(0)).toString()).assertEqual(v40);
      expect(BigInt(v20).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(v40).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(v20).operatorBitwiseOr(BigInt(v40)).toString()).assertEqual(
        BigInt(v40).operatorBitwiseOr(BigInt(v20)).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0500
     * @tc.name testBigIntBitwiseOrTest005
     * @tc.desc operatorBitwiseOr with BigInt from different constructor formats (number vs string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('127').operatorBitwiseOr(BigInt('1')).toString()).assertEqual(
        BigInt(127).operatorBitwiseOr(BigInt(1)).toString());
      expect(BigInt('-128').operatorBitwiseOr(BigInt('-1')).toString()).assertEqual(
        BigInt(-128).operatorBitwiseOr(BigInt(-1)).toString());
      expect(BigInt('32767').operatorBitwiseOr(BigInt('1')).toString()).assertEqual(
        BigInt(32767).operatorBitwiseOr(BigInt(1)).toString());
      expect(BigInt('2147483647').operatorBitwiseOr(BigInt('1')).toString()).assertEqual(
        BigInt(2147483647).operatorBitwiseOr(BigInt(1)).toString());
      expect(BigInt('9223372036854775807').operatorBitwiseOr(BigInt('1')).toString()).assertEqual(
        BigInt(9223372036854775807).operatorBitwiseOr(BigInt(1)).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0600
     * @tc.name testBigIntBitwiseOrTest006
     * @tc.desc operatorBitwiseOr with values near zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(1).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('1');
      expect(BigInt(0).operatorBitwiseOr(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(1).operatorBitwiseOr(BigInt(1)).toString()).assertEqual('1');
      expect(BigInt(-1).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-1');
      expect(BigInt(1).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-1).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(1).operatorBitwiseOr(BigInt(2)).toString()).assertEqual('3');
      expect(BigInt(2).operatorBitwiseOr(BigInt(4)).toString()).assertEqual('6');
      expect(BigInt(4).operatorBitwiseOr(BigInt(8)).toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0700
     * @tc.name testBigIntBitwiseOrTest007
     * @tc.desc operatorBitwiseOr with power-of-2 values and adjacent all-1s boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1024).operatorBitwiseOr(BigInt(1023)).toString()).assertEqual('2047');
      expect(BigInt(1048576).operatorBitwiseOr(BigInt(1048575)).toString()).assertEqual('2097151');
      expect(BigInt(2147483648).operatorBitwiseOr(BigInt(2147483647)).toString()).assertEqual('4294967295');
      expect(BigInt(1).operatorBitwiseOr(BigInt(2)).toString()).assertEqual('3');
      expect(BigInt(1).operatorBitwiseOr(BigInt(4)).toString()).assertEqual('5');
      expect(BigInt(2).operatorBitwiseOr(BigInt(4)).toString()).assertEqual('6');
      expect(BigInt(1).operatorBitwiseOr(BigInt(1024)).toString()).assertEqual('1025');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0800
     * @tc.name testBigIntBitwiseOrTest008
     * @tc.desc operatorBitwiseOr combining multi-byte masks (0x00FF, 0xFF00)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).operatorBitwiseOr(BigInt(65280)).toString()).assertEqual('65535');
      expect(BigInt(255).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('255');
      expect(BigInt(65280).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('65280');
      expect(BigInt(65535).operatorBitwiseOr(BigInt(65535)).toString()).assertEqual('65535');
      expect(BigInt(65535).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('65535');
      expect(BigInt(65535).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(255).operatorBitwiseOr(BigInt(255)).toString()).assertEqual('255');
      expect(BigInt(65280).operatorBitwiseOr(BigInt(65280)).toString()).assertEqual('65280');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_0900
     * @tc.name testBigIntBitwiseOrTest009
     * @tc.desc operatorBitwiseOr with 100-digit extreme values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big100 = '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999';
      const negBig100 = '-' + big100;

      expect(BigInt(big100).operatorBitwiseOr(BigInt(big100)).toString()).assertEqual(big100);
      expect(BigInt(big100).operatorBitwiseOr(BigInt(0)).toString()).assertEqual(big100);
      expect(BigInt(big100).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(negBig100).operatorBitwiseOr(BigInt(negBig100)).toString()).assertEqual(negBig100);
      expect(BigInt(negBig100).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1000
     * @tc.name testBigIntBitwiseOrTest010
     * @tc.desc sequential chained operatorBitwiseOr calls without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(16);
      const b = BigInt(32);
      const c = BigInt(64);

      expect(a.operatorBitwiseOr(b).operatorBitwiseOr(c).toString()).assertEqual('112');
      expect(a.operatorBitwiseOr(b).toString()).assertEqual('48');
      expect(a.operatorBitwiseOr(c).toString()).assertEqual('80');
      expect(b.operatorBitwiseOr(c).toString()).assertEqual('96');
      expect(a.toString()).assertEqual('16');
      expect(b.toString()).assertEqual('32');
      expect(c.toString()).assertEqual('64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1100
     * @tc.name testBigIntBitwiseOrTest011
     * @tc.desc operatorBitwiseOr with alternating bit masks (0xAAAA | 0x5555 = 0xFFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const altEven = BigInt('2863311530');
      const altOdd = BigInt('1431655765');
      const allOnes = BigInt('4294967295');

      expect(altEven.operatorBitwiseOr(altOdd).toString()).assertEqual('4294967295');
      expect(altOdd.operatorBitwiseOr(altEven).toString()).assertEqual('4294967295');
      expect(altEven.operatorBitwiseOr(altEven).toString()).assertEqual('2863311530');
      expect(altOdd.operatorBitwiseOr(altOdd).toString()).assertEqual('1431655765');
      expect(altEven.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('2863311530');
      expect(altEven.operatorBitwiseOr(allOnes).toString()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1200
     * @tc.name testBigIntBitwiseOrTest012
     * @tc.desc operatorBitwiseOr commutativity validated across boundary value pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: BigInt[] = [
        BigInt(0), BigInt(1), BigInt(-1),
        BigInt(127), BigInt(-128),
        BigInt(32767), BigInt(-32768),
        BigInt(2147483647), BigInt(-2147483648),
        BigInt('9223372036854775807'), BigInt('-9223372036854775808'),
        BigInt('12345678901234567890'),
      ];

      for (let i = 0; i < values.length; i++) {
        for (let j = i; j < values.length; j++) {
          const ij = values[i].operatorBitwiseOr(values[j]).toString();
          const ji = values[j].operatorBitwiseOr(values[i]).toString();
          expect(ij).assertEqual(ji);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1300
     * @tc.name testBigIntBitwiseOrTest013
     * @tc.desc operatorBitwiseOr accumulating bits via incremental chained OR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc = BigInt(0);
      const bits: BigInt[] = [
        BigInt(1), BigInt(2), BigInt(4), BigInt(8),
        BigInt(16), BigInt(32), BigInt(64), BigInt(128),
      ];

      for (let i = 0; i < bits.length; i++) {
        acc = acc.operatorBitwiseOr(bits[i]);
        expect(acc.toString()).assertEqual(BigInt(Math.pow(2, i + 1) - 1).toString());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1400
     * @tc.name testBigIntBitwiseOrTest014
     * @tc.desc operatorBitwiseOr combining disjoint high and low bit regions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const low16 = BigInt(65535);
      const high16 = BigInt('4294901760');
      const full32 = BigInt('4294967295');

      expect(low16.operatorBitwiseOr(high16).toString()).assertEqual('4294967295');
      expect(high16.operatorBitwiseOr(low16).toString()).assertEqual('4294967295');
      expect(low16.operatorBitwiseOr(low16).toString()).assertEqual('65535');
      expect(high16.operatorBitwiseOr(high16).toString()).assertEqual('4294901760');
      expect(low16.operatorBitwiseOr(full32).toString()).assertEqual('4294967295');
      expect(high16.operatorBitwiseOr(full32).toString()).assertEqual('4294967295');
      expect(low16.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('65535');
      expect(high16.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('4294901760');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1500
     * @tc.name testBigIntBitwiseOrTest015
     * @tc.desc operatorBitwiseOr basic function cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorBitwiseOr(BigInt(-5)).toString()).assertEqual('-5');
      expect(BigInt(-5).operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-5');
      expect(BigInt(8).operatorBitwiseOr(BigInt(16)).toString()).assertEqual('24');
      expect(BigInt(15).operatorBitwiseOr(BigInt(240)).toString()).assertEqual('255');
      expect(BigInt(0x0F).operatorBitwiseOr(BigInt(0xF0)).toString()).assertEqual('255');
      expect(BigInt(0b1010).operatorBitwiseOr(BigInt(0b0101)).toString()).assertEqual('15');
      expect(BigInt(0b1111).operatorBitwiseOr(BigInt(0b0000)).toString()).assertEqual('15');
      expect(BigInt(0b1100).operatorBitwiseOr(BigInt(0b0011)).toString()).assertEqual('15');
      expect(BigInt(0b1010).operatorBitwiseOr(BigInt(0b1010)).toString()).assertEqual('10');
      expect(BigInt(0b1000).operatorBitwiseOr(BigInt(0b0111)).toString()).assertEqual('15');
      expect(BigInt(0b11110000).operatorBitwiseOr(BigInt(0b00001111)).toString()).assertEqual('255');
      expect(BigInt(0b11001100).operatorBitwiseOr(BigInt(0b00110011)).toString()).assertEqual('255');
      expect(BigInt(0b11111111).operatorBitwiseOr(BigInt(0b00000000)).toString()).assertEqual('255');
      expect(BigInt(0b00000000).operatorBitwiseOr(BigInt(0b11111111)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1600
     * @tc.name testBigIntBitwiseOrTest016
     * @tc.desc operatorBitwiseOr boundary cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u32max = BigInt('4294967295');
      const u32next = BigInt('4294967296');
      const u64max = BigInt('18446744073709551615');
      expect(u32max.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('4294967295');
      expect(u32max.operatorBitwiseOr(u32next).toString()).assertEqual('8589934591');
      expect(u64max.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1700
     * @tc.name testBigIntBitwiseOrTest017
     * @tc.desc operatorBitwiseOr single-bit test cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(8).operatorBitwiseOr(BigInt(16)).toString()).assertEqual('24');
      expect(BigInt(16).operatorBitwiseOr(BigInt(32)).toString()).assertEqual('48');
      expect(BigInt(32).operatorBitwiseOr(BigInt(64)).toString()).assertEqual('96');
      expect(BigInt(64).operatorBitwiseOr(BigInt(128)).toString()).assertEqual('192');
      expect(BigInt(128).operatorBitwiseOr(BigInt(256)).toString()).assertEqual('384');
      expect(BigInt(256).operatorBitwiseOr(BigInt(512)).toString()).assertEqual('768');
      expect(BigInt(512).operatorBitwiseOr(BigInt(1024)).toString()).assertEqual('1536');
      expect(BigInt(1024).operatorBitwiseOr(BigInt(2048)).toString()).assertEqual('3072');
      expect(BigInt(32768).operatorBitwiseOr(BigInt(65536)).toString()).assertEqual('98304');
      expect(BigInt(2147483648).operatorBitwiseOr(BigInt('4294967296')).toString()).assertEqual('6442450944');
      expect(BigInt('9223372036854775808').operatorBitwiseOr(BigInt('18446744073709551616')).toString()).assertEqual('27670116110564327424');
      expect(BigInt(1).operatorBitwiseOr(BigInt('9223372036854775808')).toString()).assertEqual('9223372036854775809');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1800
     * @tc.name testBigIntBitwiseOrTest018
     * @tc.desc operatorBitwiseOr multi-bit combination cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0x0F).operatorBitwiseOr(BigInt(0xF0)).toString()).assertEqual('255');
      expect(BigInt(0x0F0F0F0F).operatorBitwiseOr(BigInt(0xF0F0F0F0)).toString()).assertEqual('4294967295');
      const low32 = BigInt('4294967295');
      const high32 = BigInt('18446744069414584320');
      expect(low32.operatorBitwiseOr(high32).toString()).assertEqual('18446744073709551615');
      expect(BigInt(0x11111111).operatorBitwiseOr(BigInt(0x22222222)).toString()).assertEqual('858993459');
      expect(BigInt(0x000F).operatorBitwiseOr(BigInt(0x00F0)).operatorBitwiseOr(BigInt(0x0F00)).operatorBitwiseOr(BigInt(0xF000)).toString()).assertEqual('65535');
      expect(BigInt(0x000000FF).operatorBitwiseOr(BigInt(0x0000FF00)).operatorBitwiseOr(BigInt(0x00FF0000)).operatorBitwiseOr(BigInt(0xFF000000)).toString()).assertEqual('4294967295');
      expect(BigInt(0x01).operatorBitwiseOr(BigInt(0x04)).operatorBitwiseOr(BigInt(0x10)).operatorBitwiseOr(BigInt(0x40)).toString()).assertEqual('85');
      expect(BigInt(0x02).operatorBitwiseOr(BigInt(0x08)).operatorBitwiseOr(BigInt(0x20)).operatorBitwiseOr(BigInt(0x80)).toString()).assertEqual('170');
      expect(BigInt(0x07).operatorBitwiseOr(BigInt(0x38)).operatorBitwiseOr(BigInt(0x1C0)).toString()).assertEqual('511');
      expect(BigInt(0x03).operatorBitwiseOr(BigInt(0x0C)).operatorBitwiseOr(BigInt(0x30)).operatorBitwiseOr(BigInt(0xC0)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_1900
     * @tc.name testBigIntBitwiseOrTest019
     * @tc.desc operatorBitwiseOr negative number cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-2).operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(BigInt(-2).operatorBitwiseOr(BigInt(2)).toString()).assertEqual('-2');
      expect(BigInt(-3).operatorBitwiseOr(BigInt(3)).toString()).assertEqual('-1');
      expect(BigInt(-4).operatorBitwiseOr(BigInt(4)).toString()).assertEqual('-4');
      expect(BigInt(-8).operatorBitwiseOr(BigInt(8)).toString()).assertEqual('-8');
      expect(BigInt(-16).operatorBitwiseOr(BigInt(16)).toString()).assertEqual('-16');
      expect(BigInt(-256).operatorBitwiseOr(BigInt(255)).toString()).assertEqual('-1');
      expect(BigInt(-65536).operatorBitwiseOr(BigInt(65535)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2000
     * @tc.name testBigIntBitwiseOrTest020
     * @tc.desc operatorBitwiseOr large number cases not covered by existing tests
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPow100 = BigInt(1).operatorLeftShift(BigInt(100));
      expect(twoPow100.operatorBitwiseOr(twoPow100).toString()).assertEqual(twoPow100.toString());
      const twoPow101 = twoPow100.operatorMultiply(BigInt(2));
      const expected097 = twoPow100.operatorAdd(twoPow101);
      expect(twoPow100.operatorBitwiseOr(twoPow101).toString()).assertEqual(expected097.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2100
     * @tc.name testBigIntBitwiseOrTest021
     * @tc.desc operatorBitwiseOr with 10^50 large number cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPow50 = BigInt('100000000000000000000000000000000000000000000000000');
      const negTenPow50 = BigInt('-100000000000000000000000000000000000000000000000000');
      expect(tenPow50.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('100000000000000000000000000000000000000000000000000');
      expect(tenPow50.operatorBitwiseOr(tenPow50).toString()).assertEqual('100000000000000000000000000000000000000000000000000');
      expect(tenPow50.operatorBitwiseOr(BigInt(1)).toString()).assertEqual('100000000000000000000000000000000000000000000000001');
      expect(tenPow50.operatorBitwiseOr(BigInt(-1)).toString()).assertEqual('-1');
      expect(negTenPow50.operatorBitwiseOr(BigInt(0)).toString()).assertEqual('-100000000000000000000000000000000000000000000000000');
      expect(negTenPow50.operatorBitwiseOr(negTenPow50).toString()).assertEqual('-100000000000000000000000000000000000000000000000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2200
     * @tc.name testBigIntBitwiseOrTest022
     * @tc.desc operatorBitwiseOr with operation results as operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorAdd(BigInt(200)).operatorBitwiseOr(BigInt(50)).toString()).assertEqual('318');
      expect(BigInt(100).operatorMultiply(BigInt(100)).operatorBitwiseOr(BigInt(255)).toString()).assertEqual('10239');
      expect(BigInt(1).operatorLeftShift(BigInt(8)).operatorBitwiseOr(BigInt(15)).toString()).assertEqual('271');
      expect(BigInt(1024).operatorRightShift(BigInt(5)).operatorBitwiseOr(BigInt(3)).toString()).assertEqual('35');
      expect(BigInt(1).operatorBitwiseOr(BigInt(2)).operatorBitwiseOr(BigInt(4)).operatorBitwiseOr(BigInt(8)).toString()).assertEqual('15');
      const a = BigInt(15);
      expect(a.operatorBitwiseOr(BigInt(240)).toString()).assertEqual('255');
      expect(getBigInt().operatorBitwiseOr(BigInt(255)).toString()).assertEqual('255');
      expect((true ? BigInt(0xFF) : BigInt(0x00)).operatorBitwiseOr(BigInt(0x0F)).toString()).assertEqual('255');
      const arr: BigInt[] = [BigInt(0x0F), BigInt(0xF0)];
      expect(arr[0].operatorBitwiseOr(arr[1]).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2300
     * @tc.name testBigIntBitwiseOrTest023
     * @tc.desc operatorBitwiseOr power-of-two and special pattern cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorBitwiseOr(BigInt(2)).operatorBitwiseOr(BigInt(4)).operatorBitwiseOr(BigInt(8)).toString()).assertEqual('15');
      expect(BigInt(1).operatorBitwiseOr(BigInt(4)).operatorBitwiseOr(BigInt(16)).operatorBitwiseOr(BigInt(64)).toString()).assertEqual('85');
      expect(BigInt(2).operatorBitwiseOr(BigInt(8)).operatorBitwiseOr(BigInt(32)).operatorBitwiseOr(BigInt(128)).toString()).assertEqual('170');
      const allOnes64 = BigInt('18446744073709551615');
      expect(BigInt(0).operatorBitwiseOr(allOnes64).toString()).assertEqual('18446744073709551615');
      expect(allOnes64.operatorBitwiseOr(allOnes64).toString()).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2400
     * @tc.name testBigIntBitwiseOrTest024
     * @tc.desc operatorBitwiseOr performance and stress test cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acc = BigInt(0);
      for (let i = 0; i < 1000; i++) {
        acc = acc.operatorBitwiseOr(BigInt(i));
      }
      expect(acc.toString()).assertEqual('1023');
      let acc2 = BigInt(0);
      for (let i = 0; i < 10000; i++) {
        acc2 = acc2.operatorBitwiseOr(BigInt(i));
      }
      expect(acc2.toString()).assertEqual('16383');
      const large = BigInt('12345678901234567890');
      let acc3 = large;
      for (let i = 0; i < 100; i++) {
        acc3 = acc3.operatorBitwiseOr(BigInt(i));
      }
      expect(acc3.toString()).assertEqual('12345678901234567935');
      expect(BigInt(100).operatorBitwiseOr(BigInt(200)).toString()).assertEqual('236');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2500
     * @tc.name testBigIntBitwiseOrTest025
     * @tc.desc operatorBitwiseOr with BigInt constructed from boolean, string "-0", and double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorBitwiseOr(BigInt(true)).toString()).assertEqual('1');
      expect(BigInt(0).operatorBitwiseOr(BigInt(false)).toString()).assertEqual('0');
      expect(BigInt(0).operatorBitwiseOr(BigInt('-0')).toString()).assertEqual('0');
      expect(BigInt('-0').operatorBitwiseOr(BigInt('-0')).toString()).assertEqual('0');
      expect(BigInt(5.0).operatorBitwiseOr(BigInt(3)).toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2600
     * @tc.name testBigIntBitwiseOrTest026
     * @tc.desc operatorBitwiseOr with BigInt constructed from various string and copy-construct sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('123').operatorBitwiseOr(BigInt('456')).toString()).assertEqual('507');
      const original = BigInt(10);
      expect(BigInt(original).operatorBitwiseOr(BigInt(true)).toString()).assertEqual('11');
      const resultDoubleStr = BigInt(123456.0).operatorBitwiseOr(BigInt('654321'));
      expect(resultDoubleStr instanceof BigInt).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2700
     * @tc.name testBigIntBitwiseOrTest027
     * @tc.desc operatorBitwiseOr with boundary extrema combinations: short-span, long-span, int-min|1, long-min|1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(32767).operatorBitwiseOr(BigInt(32768)).toString()).assertEqual('65535');
      expect(BigInt('9223372036854775807').operatorBitwiseOr(BigInt('9223372036854775808')).toString()).assertEqual('18446744073709551615');
      expect(BigInt(-2147483648).operatorBitwiseOr(BigInt(1)).toString()).assertEqual('-2147483647');
      expect(BigInt('-9223372036854775808').operatorBitwiseOr(BigInt(1)).toString()).assertEqual('-9223372036854775807');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2800
     * @tc.name testBigIntBitwiseOrTest028
     * @tc.desc operatorBitwiseOr with common bit patterns: 0xAA|0x55, 127|1, 123456789|987654321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0xAA).operatorBitwiseOr(BigInt(0x55)).toString()).assertEqual('255');
      expect(BigInt(127).operatorBitwiseOr(BigInt(1)).toString()).assertEqual('127');
      expect(BigInt('123456789').operatorBitwiseOr(BigInt('987654321')).toString()).assertEqual('1071639989');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_2900
     * @tc.name testBigIntBitwiseOrTest029
     * @tc.desc operatorBitwiseOr with 2^200 and 2^201 using left shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPow200 = BigInt(1).operatorLeftShift(BigInt(200));
      expect(twoPow200.operatorBitwiseOr(twoPow200).toString()).assertEqual(twoPow200.toString());
      const twoPow201 = twoPow200.operatorMultiply(BigInt(2));
      const expected = twoPow200.operatorAdd(twoPow201);
      expect(twoPow200.operatorBitwiseOr(twoPow201).toString()).assertEqual(expected.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_3000
     * @tc.name testBigIntBitwiseOrTest030
     * @tc.desc operatorBitwiseOr does not mutate original operand when operand is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(-1);
      const b = BigInt(999);
      const origValue = a.toString();
      const result = a.operatorBitwiseOr(b);
      expect(a.toString()).assertEqual(origValue);
      expect(result.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_3100
     * @tc.name testBigIntBitwiseOrTest031
     * @tc.desc operatorBitwiseOr result verifiable via equals method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = BigInt(7).operatorBitwiseOr(BigInt(8));
      const expected = BigInt(15);
      expect(result.equals(expected)).assertTrue();
      const result2 = BigInt(100).operatorBitwiseOr(BigInt(50));
      const expected2 = BigInt(118);
      expect(result2.equals(expected2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_3200
     * @tc.name testBigIntBitwiseOrTest032
     * @tc.desc operatorBitwiseOr commutativity with specific representative pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest032', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1 = BigInt(42).operatorBitwiseOr(BigInt(58));
      const r2 = BigInt(58).operatorBitwiseOr(BigInt(42));
      expect(r1.toString()).assertEqual(r2.toString());
      expect(r1.toString()).assertEqual('58');

      const r3 = BigInt(-50).operatorBitwiseOr(BigInt(75));
      const r4 = BigInt(75).operatorBitwiseOr(BigInt(-50));
      expect(r3.toString()).assertEqual(r4.toString());
      expect(r3.toString()).assertEqual('-49');

      const r5 = BigInt('99999999999999999999').operatorBitwiseOr(BigInt('11111111111111111111'));
      const r6 = BigInt('11111111111111111111').operatorBitwiseOr(BigInt('99999999999999999999'));
      expect(r5.toString()).assertEqual(r6.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_BITWISE_OR_3300
     * @tc.name testBigIntBitwiseOrTest033
     * @tc.desc operatorBitwiseOr throws ClassCastError for undefined and null directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntBitwiseOrTest033', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = BigInt(10);
      expect((): void => {
        (null as Any as BigInt).operatorBitwiseOr(left);
      }).assertThrowError('ClassCastError');
    });
  });
}
