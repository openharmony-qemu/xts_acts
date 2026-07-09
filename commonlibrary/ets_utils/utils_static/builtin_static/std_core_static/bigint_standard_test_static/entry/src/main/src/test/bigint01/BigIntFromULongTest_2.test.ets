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
import { describe, it, expect ,afterAll, afterEach, beforeAll, beforeEach} from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';
import Utils from '../Util.test';
export default function BigIntFromULongTest_2(): void {
  describe('BigIntFromULongTest_2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0100
     * @tc.name testBigIntFromULongTest001
     * @tc.desc fromULong with negative power-of-2 boundary values �?unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-4).toString()).assertEqual('18446744073709551612');
      expect(BigInt.fromULong(-8).toString()).assertEqual('18446744073709551608');
      expect(BigInt.fromULong(-16).toString()).assertEqual('18446744073709551600');
      expect(BigInt.fromULong(-64).toString()).assertEqual('18446744073709551552');
      expect(BigInt.fromULong(-256).toString()).assertEqual('18446744073709551360');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0200
     * @tc.name testBigIntFromULongTest002
     * @tc.desc fromULong with byte/short type boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(127).toString()).assertEqual('127');
      expect(BigInt.fromULong(-128).toString()).assertEqual('18446744073709551488');
      expect(BigInt.fromULong(32767).toString()).assertEqual('32767');
      expect(BigInt.fromULong(-32768).toString()).assertEqual('18446744073709518848');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0300
     * @tc.name testBigIntFromULongTest003
     * @tc.desc fromULong with positive power-of-2 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(2).toString()).assertEqual('2');
      expect(BigInt.fromULong(65536).toString()).assertEqual('65536');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0400
     * @tc.name testBigIntFromULongTest004
     * @tc.desc fromULong non-negative values cross-verified with BigInt.equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(0).equals(BigInt(0))).assertTrue();
      expect(BigInt.fromULong(1).equals(BigInt(1))).assertTrue();
      expect(BigInt.fromULong(100).equals(BigInt(100))).assertTrue();
      expect(BigInt.fromULong(127).equals(BigInt(127))).assertTrue();
      expect(BigInt.fromULong(255).equals(BigInt(255))).assertTrue();
      expect(BigInt.fromULong(4294967295).equals(BigInt('4294967295'))).assertTrue();
      expect(BigInt.fromULong(-1).equals(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0500
     * @tc.name testBigIntFromULongTest005
     * @tc.desc fromULong result usable with operatorAdd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(10).operatorAdd(BigInt.fromULong(20)).toString()).assertEqual('30');
      expect(BigInt.fromULong(100).operatorAdd(BigInt.fromULong(200)).toString()).assertEqual('300');
      expect(BigInt.fromULong(5).operatorAdd(BigInt(3)).toString()).assertEqual('8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0600
     * @tc.name testBigIntFromULongTest006
     * @tc.desc fromULong with int boundary adjacent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(2147483646).toString()).assertEqual('2147483646');
      expect(BigInt.fromULong(-2147483647).toString()).assertEqual('18446744071562067969');
      expect(BigInt.fromULong(4294967296).toString()).assertEqual('4294967296');
      expect(BigInt.fromULong(4294967297).toString()).assertEqual('4294967297');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0700
     * @tc.name testBigIntFromULongTest007
     * @tc.desc fromULong with various additional positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(10).toString()).assertEqual('10');
      expect(BigInt.fromULong(1000).toString()).assertEqual('1000');
      expect(BigInt.fromULong(65535).toString()).assertEqual('65535');
      expect(BigInt.fromULong(100000).toString()).assertEqual('100000');
      expect(BigInt.fromULong(123456789).toString()).assertEqual('123456789');
      expect(BigInt.fromULong(999999999).toString()).assertEqual('999999999');
      expect(BigInt.fromULong(2147483648).toString()).assertEqual('2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0800
     * @tc.name testBigIntFromULongTest008
     * @tc.desc fromULong with odd, even, prime, palindrome, and special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(101).toString()).assertEqual('101');
      expect(BigInt.fromULong(97).toString()).assertEqual('97');
      expect(BigInt.fromULong(1024).toString()).assertEqual('1024');
      expect(BigInt.fromULong(12321).toString()).assertEqual('12321');
      expect(BigInt.fromULong(1001).toString()).assertEqual('1001');
      expect(BigInt.fromULong(10000).toString()).assertEqual('10000');
      expect(BigInt.fromULong(255).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_0900
     * @tc.name testBigIntFromULongTest009
     * @tc.desc fromULong with power-of-10 boundary values from 10^1 ,10^9,10^19,0,10^0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(1).toString()).assertEqual('1');
      expect(BigInt.fromULong(0).toString()).assertEqual('0');
      expect(BigInt.fromULong(10).toString()).assertEqual('10');
      expect(BigInt.fromULong(1000000000).toString()).assertEqual('1000000000');
      expect(BigInt('10000000000000000000').toString()).assertEqual('10000000000000000000');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1000
     * @tc.name testBigIntFromULongTest010
     * @tc.desc fromULong with more negative values interpreted as unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-10).toString()).assertEqual('18446744073709551606');
      expect(BigInt.fromULong(-100).toString()).assertEqual('18446744073709551516');
      expect(BigInt.fromULong(-1000).toString()).assertEqual('18446744073709550616');
      expect(BigInt.fromULong(-65535).toString()).assertEqual('18446744073709486081');
      expect(BigInt.fromULong(-100000).toString()).assertEqual('18446744073709451616');
      expect(BigInt.fromULong(-4294967296).toString()).assertEqual('18446744069414584320');
      expect(BigInt.fromULong(-123456789).toString()).assertEqual('18446744073586094827');
      expect(BigInt.fromULong(-987654321).toString()).assertEqual('18446744072721897295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1100
     * @tc.name testBigIntFromULongTest011
     * @tc.desc fromULong with negative round thousand values interpreted as unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-1000000000).toString()).assertEqual('18446744072709551616');
      expect(BigInt.fromULong(-2000000000).toString()).assertEqual('18446744071709551616');
      expect(BigInt.fromULong(-3000000000).toString()).assertEqual('18446744070709551616');
      expect(BigInt.fromULong(-4000000000).toString()).assertEqual('18446744069709551616');
      expect(BigInt.fromULong(-5000000000).toString()).assertEqual('18446744068709551616');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1200
     * @tc.name testBigIntFromULongTest012
     * @tc.desc fromULong with negative boundary extremes as unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-9223372036854775807).toString()).assertEqual('9223372036854775809');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1300
     * @tc.name testBigIntFromULongTest013
     * @tc.desc fromULong with large power-of-2 values (2^40, 2^50, 2^60, 2^63)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(1099511627776).toString()).assertEqual('1099511627776');
      expect(BigInt.fromULong(1125899906842624).toString()).assertEqual('1125899906842624');
      expect(BigInt.fromULong(1152921504606846976).toString()).assertEqual('1152921504606846976');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1400
     * @tc.name testBigIntFromULongTest014
     * @tc.desc fromULong with maximum ulong boundary and special large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(1134903170).toString()).assertEqual('1134903170');
      expect(BigInt.fromULong(479001600).toString()).assertEqual('479001600');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1500
     * @tc.name testBigIntFromULongTest015
     * @tc.desc fromULong precision: exact large integer values up to 20 digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(1234567890123456).toString()).assertEqual('1234567890123456');
      expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
      expect(BigInt('99999999999999999999').toString()).assertEqual('99999999999999999999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1600
     * @tc.name testBigIntFromULongTest016
     * @tc.desc fromULong with arithmetic operation results as input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(100 + 200).toString()).assertEqual('300');
      expect(BigInt.fromULong(500 - 200).toString()).assertEqual('300');
      expect(BigInt.fromULong(100 * 100).toString()).assertEqual('10000');
      expect(BigInt.fromULong(100 / 3).toString()).assertEqual('33');
      expect(BigInt.fromULong(100 % 3).toString()).assertEqual('1');
      expect(BigInt.fromULong(1 << 10).toString()).assertEqual('1024');
      expect(BigInt.fromULong(1024 >> 5).toString()).assertEqual('32');
      expect(BigInt.fromULong(255 & 15).toString()).assertEqual('15');
      expect(BigInt.fromULong(240 | 15).toString()).assertEqual('255');
      expect(BigInt.fromULong(255 ^ 15).toString()).assertEqual('240');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1700
     * @tc.name testBigIntFromULongTest017
     * @tc.desc fromULong result supports doubleValue conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(100).doubleValue()).assertEqual(100.0);
      expect(BigInt.fromULong(0).doubleValue()).assertEqual(0.0);
      expect(BigInt.fromULong(1).doubleValue()).assertEqual(1.0);
      expect(BigInt.fromULong(2147483647).doubleValue()).assertEqual(2147483647.0);
      expect(BigInt.fromULong(9223372036854775807).doubleValue()).assertEqual(9223372036854775807.0);
      expect(BigInt.fromULong(-9223372036854775808).doubleValue()).assertEqual(9223372036854775808.0);
      expect(BigInt.fromULong(-1).doubleValue()).assertEqual(18446744073709551615.0);
      expect(BigInt.fromULong(0x100000000).doubleValue()).assertEqual(4294967296.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1800
     * @tc.name testBigIntFromULongTest018
     * @tc.desc fromULong result used in array, object, Map, and Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: BigInt[] = [BigInt.fromULong(100)];
      expect(arr[0].toString()).assertEqual('100');

      const map = new Map<string, BigInt>();
      map.set('k', BigInt.fromULong(100));
      const mapVal: BigInt | undefined = map.get('k');
      expect(mapVal!.toString()).assertEqual('100');

      const set = new Set<BigInt>();
      set.add(BigInt.fromULong(100));
      expect(set.has(BigInt.fromULong(100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_1900
     * @tc.name testBigIntFromULongTest019
     * @tc.desc fromULong with variable assignment and conditional expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: BigInt = BigInt.fromULong(100);
      expect(a.toString()).assertEqual('100');

      expect(BigInt.fromULong(true ? 100 : 200).toString()).assertEqual('100');
      expect(BigInt.fromULong(false ? 100 : 200).toString()).assertEqual('200');

      expect(BigInt.fromULong(100).equals(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2000
     * @tc.name testBigIntFromULongTest020
     * @tc.desc fromULong returns consistent results on persistent repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const VAL: long = 123456789;
      expect(BigInt.fromULong(VAL).toString()).assertEqual('123456789');
      expect(BigInt.fromULong(VAL).toString()).assertEqual('123456789');
      expect(BigInt.fromULong(VAL).toString()).assertEqual('123456789');
      expect(BigInt.fromULong(VAL).toString()).assertEqual('123456789');
      expect(BigInt.fromULong(VAL).toString()).assertEqual('123456789');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2100
     * @tc.name testBigIntFromULongTest021
     * @tc.desc Mindmap: fromULong result toString(16/2/36) radix views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(9223372036854775807).toString(16)).assertEqual('7fffffffffffffff');
      expect(BigInt.fromULong(256).toString(16)).assertEqual('100');
      expect(BigInt.fromULong(65536).toString(16)).assertEqual('10000');
      expect(BigInt.fromULong(0).toString(2)).assertEqual('0');
      expect(BigInt.fromULong(1).toString(36)).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2200
     * @tc.name testBigIntFromULongTest022
     * @tc.desc Mindmap: fromULong result getLong reads back original long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-9223372036854775808).getLong()).assertEqual(-9223372036854775808);
      expect(BigInt.fromULong(100).getLong()).assertEqual(100);
      expect(BigInt.fromULong(0).getLong()).assertEqual(0);
      expect(BigInt.fromULong(0x80000000).getLong()).assertEqual(2147483648);
      expect(BigInt.fromULong(0xFFFFFFFF).getLong()).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2300
     * @tc.name testBigIntFromULongTest023
     * @tc.desc Mindmap: fromULong result getULong reads back unsigned long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-1).getULong()).assertEqual(-1);
      expect(BigInt.fromULong(0).getULong()).assertEqual(0);
      expect(BigInt.fromULong(100).getULong()).assertEqual(100);
      expect(BigInt.fromULong(0xFFFFFFFF).getULong()).assertEqual(4294967295);
      expect(BigInt.fromULong(0x80000000).getULong()).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2400
     * @tc.name testBigIntFromULongTest024
     * @tc.desc Mindmap: two fromULong(0x7FFFFFFF) return independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt.fromULong(0x7FFFFFFF);
      const b = BigInt.fromULong(0x7FFFFFFF);
      expect(a === b).assertTrue();
      expect(a.equals(b)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2500
     * @tc.name testBigIntFromULongTest025
     * @tc.desc Mindmap: fromULong(-1) unsigned semantic > any positive long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-1).operatorGreaterThan(BigInt(9223372036854775807))).assertTrue();
      expect(BigInt.fromULong(-1).operatorGreaterThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_FROMULONG_2600
     * @tc.name testBigIntFromULongTest026
     * @tc.desc Mindmap: fromULong(-1) + 1 overflow to 18446744073709551616
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntFromULongTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-1).operatorAdd(BigInt(1)).toString()).assertEqual('18446744073709551616');
      expect(BigInt.fromULong(-1).toString(2).length).assertEqual(64);
    });
  });
}
