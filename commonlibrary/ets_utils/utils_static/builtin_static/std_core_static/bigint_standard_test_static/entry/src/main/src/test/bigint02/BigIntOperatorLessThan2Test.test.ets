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

export default function BigIntOperatorLessThan2Test(): void {
  describe('testBigIntOperatorLessThan2Test', (): void => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_0700
     * @tc.name testBigIntOperatorLessThan2Test007
     * @tc.desc operatorLessThan zero-related boundary comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt(0).operatorLessThan(BigInt(1))).assertTrue();
      expect(BigInt(0).operatorLessThan(BigInt(-1))).assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt(-1))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_0800
     * @tc.name testBigIntOperatorLessThan2Test008
     * @tc.desc operatorLessThan across byte/short/int/long min/max boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorLessThan(BigInt(-128))).assertFalse();
      expect(BigInt(-128).operatorLessThan(BigInt(127))).assertTrue();
      expect(BigInt(32767).operatorLessThan(BigInt(127))).assertFalse();
      expect(BigInt(-32768).operatorLessThan(BigInt(-128))).assertTrue();
      expect(BigInt(2147483647).operatorLessThan(BigInt(32767))).assertFalse();
      expect(BigInt(-2147483648).operatorLessThan(BigInt(-32768))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThan(BigInt(2147483647))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt(-2147483648))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_0900
     * @tc.name testBigIntOperatorLessThan2Test009
     * @tc.desc operatorLessThan large positive number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('99999999999999999999').operatorLessThan(BigInt(1))).assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('9223372036854775806').operatorLessThan(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('88888888888888888888').operatorLessThan(BigInt('77777777777777777777'))).assertFalse();
      expect(BigInt('11111111111111111111').operatorLessThan(BigInt('22222222222222222222'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1000
     * @tc.name testBigIntOperatorLessThan2Test010
     * @tc.desc operatorLessThan large negative number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-22222222222222222222').operatorLessThan(BigInt('-11111111111111111111'))).assertTrue();
      expect(BigInt('-11111111111111111111').operatorLessThan(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThan(BigInt('-9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1100
     * @tc.name testBigIntOperatorLessThan2Test011
     * @tc.desc operatorLessThan cross-sign and large-value cross comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('99999999999999999999').operatorLessThan(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThan(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('1000000000000000000000000000000').operatorLessThan(BigInt('-1000000000000000000000000000000')))
        .assertFalse();
      expect(BigInt(1).operatorLessThan(BigInt('-9223372036854775808'))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt(1).operatorLessThan(BigInt('-999999999999'))).assertFalse();
      expect(BigInt(-1).operatorLessThan(BigInt('999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1200
     * @tc.name testBigIntOperatorLessThan2Test012
     * @tc.desc operatorLessThan equal value comparisons return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).operatorLessThan(BigInt(42))).assertFalse();
      expect(BigInt(-42).operatorLessThan(BigInt(-42))).assertFalse();
      expect(BigInt('12345678901234567890').operatorLessThan(BigInt('12345678901234567890'))).assertFalse();
      expect(BigInt('-12345678901234567890').operatorLessThan(BigInt('-12345678901234567890'))).assertFalse();
      expect(BigInt('9223372036854775807').operatorLessThan(BigInt('9223372036854775807'))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1300
     * @tc.name testBigIntOperatorLessThan2Test013
     * @tc.desc operatorLessThan does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const b = BigInt(200);
      const origA = a.toString();
      const origB = b.toString();
      a.operatorLessThan(b);
      expect(a.toString()).assertEqual(origA);
      expect(b.toString()).assertEqual(origB);

      const c = BigInt(42);
      const d = BigInt(42);
      c.operatorLessThan(d);
      c.operatorLessThan(BigInt(100));
      c.operatorLessThan(BigInt(0));
      expect(c.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1400
     * @tc.name testBigIntOperatorLessThan2Test014
     * @tc.desc operatorLessThan returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof BigInt(5).operatorLessThan(BigInt(10))).assertEqual('boolean');
      expect(typeof BigInt(10).operatorLessThan(BigInt(5))).assertEqual('boolean');
      expect(typeof BigInt(7).operatorLessThan(BigInt(7))).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1500
     * @tc.name testBigIntOperatorLessThan2Test015
     * @tc.desc operatorLessThan various construction source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorLessThan(BigInt('100'))).assertFalse();
      expect(BigInt('99').operatorLessThan(BigInt(100))).assertTrue();
      const original = BigInt(50);
      expect(BigInt(original).operatorLessThan(BigInt(51))).assertTrue();
      expect(BigInt(2.0).operatorLessThan(BigInt(3))).assertTrue();
      expect(BigInt(false).operatorLessThan(BigInt(1))).assertTrue();
      expect(BigInt(false).operatorLessThan(BigInt(true))).assertTrue();
      expect(BigInt('-9223372036854775807').operatorLessThan(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1600
     * @tc.name testBigIntOperatorLessThan2Test016
     * @tc.desc operatorLessThan byte/short/int/long extrema vs zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-128).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt(32767).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-32768).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt(2147483647).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(-2147483648).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThan(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1700
     * @tc.name testBigIntOperatorLessThan2Test017
     * @tc.desc operatorLessThan adjacent small value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLessThan(BigInt(127))).assertTrue();
      expect(BigInt(127).operatorLessThan(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1800
     * @tc.name testBigIntOperatorLessThan2Test018
     * @tc.desc operatorLessThan very long positive integers differing only in last digit, smaller value is less
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('12345678901234567890').operatorLessThan(BigInt('12345678901234567891'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_1900
     * @tc.name testBigIntOperatorLessThan2Test019
     * @tc.desc operatorLessThan very long negative integers differing only in last digit, more negative is less
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-12345678901234567891').operatorLessThan(BigInt('-12345678901234567890'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2000
     * @tc.name testBigIntOperatorLessThan2Test020
     * @tc.desc operatorLessThan BigInt(true) compared with numeric values 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorLessThan(BigInt(0))).assertFalse();
      expect(BigInt(true).operatorLessThan(BigInt(1))).assertFalse();
      expect(BigInt(true).operatorLessThan(BigInt(2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2100
     * @tc.name testBigIntOperatorLessThan2Test021
     * @tc.desc operatorLessThan double-constructed vs int-constructed BigInt equal value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42.0).operatorLessThan(BigInt(42))).assertFalse();
      expect(BigInt(100.0).operatorLessThan(BigInt(200.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2200
     * @tc.name testBigIntOperatorLessThan2Test022
     * @tc.desc operatorLessThan byte/short/int type boundary value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-128).operatorLessThan(BigInt(-127))).assertTrue();
      expect(BigInt(32767).operatorLessThan(BigInt(32768))).assertTrue();
      expect(BigInt(2147483647).operatorLessThan(BigInt(2147483648))).assertTrue();
      expect(BigInt(-2147483648).operatorLessThan(BigInt(2147483647))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2300
     * @tc.name testBigIntOperatorLessThan2Test023
     * @tc.desc operatorLessThan fromULong unsigned-constructed BigInt comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(0).operatorLessThan(BigInt.fromULong(1))).assertTrue();
      expect(BigInt.fromULong(-1).operatorLessThan(BigInt('18446744073709551615'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2400
     * @tc.name testBigIntOperatorLessThan2Test024
     * @tc.desc operatorLessThan power-of-2 boundary comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLessThan(BigInt(2))).assertTrue();
      expect(BigInt(1024).operatorLessThan(BigInt(1024))).assertFalse();
      expect(BigInt(-1024).operatorLessThan(BigInt(-1023))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2500
     * @tc.name testBigIntOperatorLessThan2Test025
     * @tc.desc operatorLessThan pow operation result comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(3)).operatorLessThan(BigInt(10))).assertTrue();
      expect(BigInt(1).operatorLessThan(BigInt(2).pow(BigInt(20)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2600
     * @tc.name testBigIntOperatorLessThan2Test026
     * @tc.desc operatorLessThan negated positive (negative) compared with original positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).negate().operatorLessThan(BigInt(10))).assertTrue();
      expect(BigInt(2).pow(BigInt(20)).negate().operatorLessThan(BigInt(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2700
     * @tc.name testBigIntOperatorLessThan2Test027
     * @tc.desc operatorLessThan asIntN truncated value compared with original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(4, BigInt(15)).operatorLessThan(BigInt(0))).assertTrue();
      expect(BigInt.asIntN(4, BigInt(20)).operatorLessThan(BigInt(20))).assertTrue();
      expect(BigInt.asIntN(64, BigInt(100)).operatorLessThan(BigInt(100))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2800
     * @tc.name testBigIntOperatorLessThan2Test028
     * @tc.desc operatorLessThan asUintN truncated value compared with original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(4, BigInt(20)).operatorLessThan(BigInt(20))).assertTrue();
      expect(BigInt.asUintN(8, BigInt(255)).operatorLessThan(BigInt(256))).assertTrue();
      expect(BigInt.asUintN(64, BigInt(100)).operatorLessThan(BigInt(100))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_2900
     * @tc.name testBigIntOperatorLessThan2Test029
     * @tc.desc operatorLessThan double/long/ulong/string round-trip conversion equality comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(100).doubleValue()).operatorLessThan(BigInt(100))).assertFalse();
      expect(BigInt(BigInt(100).getLong()).operatorLessThan(BigInt(100))).assertFalse();
      let uLong = BigInt('18446744073709551615').getULong();
      expect(BigInt.fromULong(uLong).operatorLessThan(BigInt('18446744073709551615')))
        .assertFalse();
      expect(BigInt(BigInt(12345).toString()).operatorLessThan(BigInt(12345))).assertFalse();
      expect(BigInt("0x" + BigInt(255).toString(16)).operatorLessThan(BigInt(255))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_3000
     * @tc.name testBigIntOperatorLessThan2Test030
     * @tc.desc operatorLessThan adjacent large prime-level boundary comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('999999999999999989').operatorLessThan(BigInt('999999999999999991'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_3100
     * @tc.name testBigIntOperatorLessThan2Test031
     * @tc.desc operatorLessThan default no-arg constructed BigInt(0) compared with positive, zero, negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt().operatorLessThan(BigInt(1))).assertTrue();
      expect(new BigInt().operatorLessThan(BigInt(0))).assertFalse();
      expect(new BigInt().operatorLessThan(BigInt(-1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_3200
     * @tc.name testBigIntOperatorLessThan2Test032
     * @tc.desc operatorLessThan absolute-value-symmetric negative and positive, negative is less than positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9999999999999999999').operatorLessThan(BigInt('9999999999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_3300
     * @tc.name testBigIntOperatorLessThan2Test033
     * @tc.desc operatorLessThan on null/undefined/string receiver throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThan2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        (null as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (undefined as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        ('abc' as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (123 as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
      expect((): void => {
        (true as Object as BigInt).operatorLessThan(BigInt(1));
      }).assertThrowError('ClassCastError');
    });
  });
}
