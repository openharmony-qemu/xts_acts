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

export default function BigIntGetLongTest_2(): void {
  describe('BigIntGetLongTest_2', () =>{
    beforeAll((): void => {
    });
    beforeEach(async():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0100
     * @tc.name testBigIntGetLongTest001
     * @tc.desc getLong with byte/short/int boundary values, cross-constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<[BigInt, long]> = [
        [BigInt(127), 127], [BigInt(-128), -128],
        [BigInt(32767), 32767], [BigInt(-32768), -32768],
        [BigInt(2147483647), 2147483647], [BigInt(-2147483648), -2147483648],
      ];
      for (let i = 0; i < data.length; i++) {
        expect(data[i][0].getLong()).assertEqual(data[i][1]);
        expect(BigInt(data[i][1].toString()).getLong()).assertEqual(data[i][1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0200
     * @tc.name testBigIntGetLongTest002
     * @tc.desc getLong with values adjacent to signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9223372036854775806').getLong()).assertEqual(9223372036854775806);
      expect(BigInt('-9223372036854775807').getLong()).assertEqual(-9223372036854775807);
      expect(BigInt('9223372036854775800').getLong()).assertEqual(9223372036854775800);
      expect(BigInt('-9223372036854775800').getLong()).assertEqual(-9223372036854775800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0300
     * @tc.name testBigIntGetLongTest003
     * @tc.desc getLong wrap-around at 2^64 boundary (offset ±small)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('18446744073709551615').getLong()).assertEqual(-1);
      expect(BigInt('18446744073709551614').getLong()).assertEqual(-2);
      expect(BigInt('18446744073709551613').getLong()).assertEqual(-3);
      expect(BigInt('18446744073709551617').getLong()).assertEqual(1);
      expect(BigInt('18446744073709551618').getLong()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0400
     * @tc.name testBigIntGetLongTest004
     * @tc.desc getLong wrap-around over multiple 2^64 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('36893488147419103232').getLong()).assertEqual(0);
      expect(BigInt('36893488147419103233').getLong()).assertEqual(1);
      expect(BigInt('36893488147419103234').getLong()).assertEqual(2);
      expect(BigInt('55340232221128654849').getLong()).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0500
     * @tc.name testBigIntGetLongTest005
     * @tc.desc getLong sequential repeated calls produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(42);
      expect(a.getLong()).assertEqual(42);
      expect(a.getLong()).assertEqual(a.getLong());
      const b = BigInt('9223372036854775807');
      expect(b.getLong()).assertEqual(9223372036854775807);
      expect(b.getLong()).assertEqual(b.getLong());
      const c = BigInt('-9223372036854775808');
      expect(c.getLong()).assertEqual(-9223372036854775808);
      expect(c.getLong()).assertEqual(c.getLong());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0600
     * @tc.name testBigIntGetLongTest006
     * @tc.desc getLong wrapping for large magnitude values beyond 2^64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9999999999999999999').getLong()).assertEqual(-8446744073709551617);
      expect(BigInt('-9999999999999999999').getLong()).assertEqual(8446744073709551617);
      expect(BigInt('12345678901234567890').getLong()).assertEqual(-6101065172474983726);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0700
     * @tc.name testBigIntGetLongTest007
     * @tc.desc getLong for more positive values within long range (2^N and boundaries)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).getLong()).assertEqual(2);
      expect(BigInt(65536).getLong()).assertEqual(65536);
      expect(BigInt(2147483648).getLong()).assertEqual(2147483648);
      expect(BigInt(4294967296).getLong()).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0800
     * @tc.name testBigIntGetLongTest008
     * @tc.desc getLong for more negative values beyond -int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-2).getLong()).assertEqual(-2);
      expect(BigInt(-3).getLong()).assertEqual(-3);
      expect(BigInt(-4).getLong()).assertEqual(-4);
      expect(BigInt(-10).getLong()).assertEqual(-10);
      expect(BigInt(-100).getLong()).assertEqual(-100);
      expect(BigInt(-129).getLong()).assertEqual(-129);
      expect(BigInt(-32769).getLong()).assertEqual(-32769);
      expect(BigInt(-2147483649).getLong()).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_0900
     * @tc.name testBigIntGetLongTest009
     * @tc.desc getLong with unsigned type boundaries (uint, ushort, ubyte max)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(255).getLong()).assertEqual(255);
      expect(BigInt(65535).getLong()).assertEqual(65535);
      expect(BigInt(4294967295).getLong()).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1000
     * @tc.name testBigIntGetLongTest010
     * @tc.desc getLong with hex/octal/binary numeric literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<[long, long]> = [
        [0xFF, 255], [0x7F, 127], [0x7FFF, 32767],
        [0x7FFFFFFF, 2147483647], [0x7FFFFFFFFFFFFFFF, 9223372036854775807], [0x1A, 26],
        [0o377, 255], [0o777, 511], [0o177777, 65535], [0o12, 10],
        [0b11111111, 255], [0b100000000, 256],
        [0b1111111111111111, 65535], [0b1010, 10],
      ];
      for (let i = 0; i < data.length; i++) {
        expect(BigInt(data[i][0]).getLong()).assertEqual(data[i][1]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1100
     * @tc.name testBigIntGetLongTest011
     * @tc.desc getLong with BigInt from strings with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('00').getLong()).assertEqual(0);
      expect(BigInt('00000000000000000042').getLong()).assertEqual(42);
      expect(BigInt('999999999999999999').getLong()).assertEqual(999999999999999999);
      expect(BigInt('-999999999999999999').getLong()).assertEqual(-999999999999999999);
      expect(BigInt('1000000000000000000').getLong()).assertEqual(1000000000000000000);
      expect(BigInt('-1000000000000000000').getLong()).assertEqual(-1000000000000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1200
     * @tc.name testBigIntGetLongTest012
     * @tc.desc getLong with BigInt constructed from boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).getLong()).assertEqual(1);
      expect(BigInt(false).getLong()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1300
     * @tc.name testBigIntGetLongTest013
     * @tc.desc getLong with BigInt constructed from another BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(42)).getLong()).assertEqual(42);
      expect(BigInt(BigInt('9223372036854775807')).getLong()).assertEqual(9223372036854775807);
      expect(BigInt(BigInt(-2147483648)).getLong()).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1400
     * @tc.name testBigIntGetLongTest014
     * @tc.desc getLong idempotency (multiple calls) and immutability (instance unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(777);
      expect(a.getLong()).assertEqual(a.getLong());
      const b = BigInt(555);
      b.getLong();
      expect(b.toString()).assertEqual('555');
      const c = BigInt(100);
      const result: long = c.getLong();
      expect(result + 1).assertEqual(101);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1500
     * @tc.name testBigIntGetLongTest015
     * @tc.desc getLong positive overflow: values beyond long max, including 10^19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9223372036854775810').getLong()).assertEqual(-9223372036854775806);
      expect(BigInt('18446744073709551657').getLong()).assertEqual(41);
      expect(BigInt('10000000000000000000').getLong()).assertEqual(-8446744073709551616);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1600
     * @tc.name testBigIntGetLongTest016
     * @tc.desc getLong negative overflow: values below long min, including -10^19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9223372036854775810').getLong()).assertEqual(9223372036854775806);
      expect(BigInt('-18446744073709551615').getLong()).assertEqual(1);
      expect(BigInt('-18446744073709551617').getLong()).assertEqual(-1);
      expect(BigInt('-10000000000000000000').getLong()).assertEqual(8446744073709551616);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1700
     * @tc.name testBigIntGetLongTest017
     * @tc.desc getLong overflow with hex string patterns at 64-bit boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('0x8000000000000000').getLong()).assertEqual(-9223372036854775808);
      expect(BigInt('0xFFFFFFFFFFFFFFFF').getLong()).assertEqual(-1);
      expect(BigInt('0x10000000000000000').getLong()).assertEqual(0);
      expect(BigInt('0x10000000000000001').getLong()).assertEqual(1);
      expect(BigInt('0x8000000000000001').getLong()).assertEqual(-9223372036854775807);
      expect(BigInt('0x8000000000000002').getLong()).assertEqual(-9223372036854775806);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1800
     * @tc.name testBigIntGetLongTest018
     * @tc.desc getLong negative overflow over multiple 2^64 cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-36893488147419103232').getLong()).assertEqual(0);
      expect(BigInt('-36893488147419103233').getLong()).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_1900
     * @tc.name testBigIntGetLongTest019
     * @tc.desc getLong on arithmetic operation results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((BigInt(100) + BigInt(200)).getLong()).assertEqual(300);
      expect((BigInt(500) - BigInt(200)).getLong()).assertEqual(300);
      expect((BigInt(100) * BigInt(100)).getLong()).assertEqual(10000);
      expect((BigInt(100) / BigInt(3)).getLong()).assertEqual(33);
      expect((BigInt(100) % BigInt(3)).getLong()).assertEqual(1);
      expect((BigInt(1) << BigInt(10)).getLong()).assertEqual(1024);
      expect((BigInt(1024) >> BigInt(5)).getLong()).assertEqual(32);
      expect((BigInt(255) & BigInt(15)).getLong()).assertEqual(15);
      expect((BigInt(240) | BigInt(15)).getLong()).assertEqual(255);
      expect((BigInt(255) ^ BigInt(15)).getLong()).assertEqual(240);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_2000
     * @tc.name testBigIntGetLongTest020
     * @tc.desc getLong in various scenarios: variable, conditional, array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      expect(a.getLong()).assertEqual(100);
      expect((true ? BigInt(10) : BigInt(20)).getLong()).assertEqual(10);
      expect([BigInt(10), BigInt(20)][0].getLong()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_GETLONG_2100
     * @tc.name testBigIntGetLongTest021
     * @tc.desc getLong does not throw on extremely large positive/negative BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntGetLongTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p = BigInt('99999999999999999999999999');
      const resultP: long = p.getLong();
      expect(resultP).assertEqual(-2537764290115403777);
      expect(typeof resultP).assertEqual('long');
      const n = BigInt('-99999999999999999999999999');
      const resultN: long = n.getLong();
      expect(resultN).assertEqual(2537764290115403777);
      expect(typeof resultN).assertEqual('long');
    });
  });
}