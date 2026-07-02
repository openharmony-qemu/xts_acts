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

export default function BigIntOperatorLessThanEqual2Test(): void {
  describe('testBigIntOperatorLessThanEqual2Test', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_0700
     * @tc.name testBigIntOperatorLessThanEqual2Test007
     * @tc.desc operatorLessThanEqual zero-related comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(1).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(0).operatorLessThanEqual(BigInt(1))).assertTrue();
      expect(BigInt(0).operatorLessThanEqual(BigInt(-1))).assertFalse();
      expect(BigInt(1).operatorLessThanEqual(BigInt(-1))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_0800
     * @tc.name testBigIntOperatorLessThanEqual2Test008
     * @tc.desc operatorLessThanEqual byte/short/int/long extrema vs zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(-128).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(32767).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(-32768).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(2147483647).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(-2147483648).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_0900
     * @tc.name testBigIntOperatorLessThanEqual2Test009
     * @tc.desc operatorLessThanEqual adjacent value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorLessThanEqual(BigInt(127))).assertTrue();
      expect(BigInt(-128).operatorLessThanEqual(BigInt(-128))).assertTrue();
      expect(BigInt(-128).operatorLessThanEqual(BigInt(127))).assertTrue();
      expect(BigInt(127).operatorLessThanEqual(BigInt(-128))).assertFalse();
      expect(BigInt(-32768).operatorLessThanEqual(BigInt(-128))).assertTrue();
      expect(BigInt(32767).operatorLessThanEqual(BigInt(127))).assertFalse();
      expect(BigInt(-2147483648).operatorLessThanEqual(BigInt(-32768))).assertTrue();
      expect(BigInt(2147483647).operatorLessThanEqual(BigInt(32767))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1000
     * @tc.name testBigIntOperatorLessThanEqual2Test010
     * @tc.desc operatorLessThanEqual cross-type adjacent comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt(-2147483648))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThanEqual(BigInt(2147483647))).assertFalse();
      expect(BigInt(1).operatorLessThanEqual(BigInt(127))).assertTrue();
      expect(BigInt(127).operatorLessThanEqual(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1100
     * @tc.name testBigIntOperatorLessThanEqual2Test011
     * @tc.desc operatorLessThanEqual large number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('99999999999999999999').operatorLessThanEqual(BigInt(1))).assertFalse();
      expect(BigInt(1).operatorLessThanEqual(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('99999999999999999999').operatorLessThanEqual(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThanEqual(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('11111111111111111111').operatorLessThanEqual(BigInt('22222222222222222222'))).assertTrue();
      expect(BigInt('-22222222222222222222').operatorLessThanEqual(BigInt('-11111111111111111111'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1200
     * @tc.name testBigIntOperatorLessThanEqual2Test012
     * @tc.desc operatorLessThanEqual equal value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).operatorLessThanEqual(BigInt(42))).assertTrue();
      expect(BigInt(-42).operatorLessThanEqual(BigInt(-42))).assertTrue();
      expect(BigInt('12345678901234567890').operatorLessThanEqual(BigInt('12345678901234567890'))).assertTrue();
      expect(BigInt('-12345678901234567890').operatorLessThanEqual(BigInt('-12345678901234567890'))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThanEqual(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt('-9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1300
     * @tc.name testBigIntOperatorLessThanEqual2Test013
     * @tc.desc operatorLessThanEqual immutability test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const b = BigInt(200);
      const origA = a.toString();
      const origB = b.toString();
      a.operatorLessThanEqual(b);
      expect(a.toString()).assertEqual(origA);
      expect(b.toString()).assertEqual(origB);
      a.operatorLessThanEqual(BigInt(42));
      a.operatorLessThanEqual(BigInt(0));
      expect(a.toString()).assertEqual(origA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1400
     * @tc.name testBigIntOperatorLessThanEqual2Test014
     * @tc.desc operatorLessThanEqual various constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorLessThanEqual(BigInt('100'))).assertTrue();
      expect(BigInt('99').operatorLessThanEqual(BigInt(100))).assertTrue();
      expect(BigInt(2.0).operatorLessThanEqual(BigInt(3))).assertTrue();
      expect(BigInt('-9223372036854775807').operatorLessThanEqual(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1500
     * @tc.name testBigIntOperatorLessThanEqual2Test015
     * @tc.desc operatorLessThanEqual boolean constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(false).operatorLessThanEqual(BigInt(1))).assertTrue();
      expect(BigInt(true).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(false).operatorLessThanEqual(BigInt(true))).assertTrue();
      const original = BigInt(50);
      expect(BigInt(original).operatorLessThanEqual(BigInt(51))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1600
     * @tc.name testBigIntOperatorLessThanEqual2Test016
     * @tc.desc operatorLessThanEqual cross-sign large magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorLessThanEqual(BigInt(-100))).assertFalse();
      expect(BigInt(-100).operatorLessThanEqual(BigInt(100))).assertTrue();
      expect(BigInt('1000000').operatorLessThanEqual(BigInt('-1000000'))).assertFalse();
      expect(BigInt('-1000000').operatorLessThanEqual(BigInt('1000000'))).assertTrue();
      expect(BigInt(1).operatorLessThanEqual(BigInt('-9223372036854775808'))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt('9223372036854775807'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1700
     * @tc.name testBigIntOperatorLessThanEqual2Test017
     * @tc.desc Verify operatorGreaterThanEqual of BigInt for various large numbers, positive & negative extreme values and absolute value difference scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLessThanEqual(BigInt('-999999999999'))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt('999999999999'))).assertTrue();
      expect(BigInt('1000000000000000000000000000000').operatorLessThanEqual(BigInt('-1000000000000000000000000000000'))).assertFalse();
      expect(BigInt('9223372036854775806').operatorLessThanEqual(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThanEqual(BigInt('-9223372036854775808'))).assertTrue();
      expect(BigInt('88888888888888888888').operatorLessThanEqual(BigInt('77777777777777777777'))).assertFalse();
      expect(BigInt('-11111111111111111111').operatorLessThanEqual(BigInt('-99999999999999999999'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1800
     * @tc.name testBigIntOperatorLessThanEqual2Test018
     * @tc.desc operatorLessThanEqual fromULong constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(0).operatorLessThanEqual(BigInt.fromULong(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_1900
     * @tc.name testBigIntOperatorLessThanEqual2Test019
     * @tc.desc operatorLessThanEqual fromULong equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(4294967295).operatorLessThanEqual(BigInt.fromULong(4294967295))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2000
     * @tc.name testBigIntOperatorLessThanEqual2Test020
     * @tc.desc operatorLessThanEqual fromULong max value vs regular long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(-1).operatorLessThanEqual(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2100
     * @tc.name testBigIntOperatorLessThanEqual2Test021
     * @tc.desc operatorLessThanEqual hex string constructed value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('0xff').operatorLessThanEqual(BigInt(256))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2200
     * @tc.name testBigIntOperatorLessThanEqual2Test022
     * @tc.desc operatorLessThanEqual binary string constructed value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('0b1111').operatorLessThanEqual(BigInt(16))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2300
     * @tc.name testBigIntOperatorLessThanEqual2Test023
     * @tc.desc operatorLessThanEqual default constructed BigInt comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt().toString()).assertEqual('0');
      expect(new BigInt().operatorLessThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2400
     * @tc.name testBigIntOperatorLessThanEqual2Test024
     * @tc.desc operatorLessThanEqual copy constructed value equal to original negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(-999)).operatorLessThanEqual(BigInt(-999))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2500
     * @tc.name testBigIntOperatorLessThanEqual2Test025
     * @tc.desc operatorLessThanEqual addition result less than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorLessThanEqual(BigInt(20))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2600
     * @tc.name testBigIntOperatorLessThanEqual2Test026
     * @tc.desc operatorLessThanEqual addition result equal to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorLessThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2700
     * @tc.name testBigIntOperatorLessThanEqual2Test027
     * @tc.desc operatorLessThanEqual addition result greater than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorAdd(BigInt(10)).operatorLessThanEqual(BigInt(15))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2800
     * @tc.name testBigIntOperatorLessThanEqual2Test028
     * @tc.desc operatorLessThanEqual subtraction result less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorSubtract(BigInt(10)).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_2900
     * @tc.name testBigIntOperatorLessThanEqual2Test029
     * @tc.desc operatorLessThanEqual negative subtraction result less than another negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).operatorSubtract(BigInt(10)).operatorLessThanEqual(BigInt(5).operatorSubtract(BigInt(8)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3000
     * @tc.name testBigIntOperatorLessThanEqual2Test030
     * @tc.desc operatorLessThanEqual multiplication result less than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).operatorMultiply(BigInt(4)).operatorLessThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3100
     * @tc.name testBigIntOperatorLessThanEqual2Test031
     * @tc.desc operatorLessThanEqual multiplication result equal to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).operatorMultiply(BigInt(5)).operatorLessThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3200
     * @tc.name testBigIntOperatorLessThanEqual2Test032
     * @tc.desc operatorLessThanEqual multiplication result greater than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(4).operatorMultiply(BigInt(5)).operatorLessThanEqual(BigInt(15))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3300
     * @tc.name testBigIntOperatorLessThanEqual2Test033
     * @tc.desc operatorLessThanEqual division result less than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorDivide(BigInt(3)).operatorLessThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3400
     * @tc.name testBigIntOperatorLessThanEqual2Test034
     * @tc.desc operatorLessThanEqual division result equal to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorDivide(BigInt(5)).operatorLessThanEqual(BigInt(4))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3500
     * @tc.name testBigIntOperatorLessThanEqual2Test035
     * @tc.desc operatorLessThanEqual division result greater than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorDivide(BigInt(3)).operatorLessThanEqual(BigInt(5))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3600
     * @tc.name testBigIntOperatorLessThanEqual2Test036
     * @tc.desc operatorLessThanEqual modulo result less than divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorModule(BigInt(7)).operatorLessThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3700
     * @tc.name testBigIntOperatorLessThanEqual2Test037
     * @tc.desc operatorLessThanEqual modulo result equal to comparison value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20).operatorModule(BigInt(7)).operatorLessThanEqual(BigInt(6))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3800
     * @tc.name testBigIntOperatorLessThanEqual2Test038
     * @tc.desc operatorLessThanEqual original less than or equal to incremented result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorLessThanEqual(BigInt(5).operatorIncrement())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_3900
     * @tc.name testBigIntOperatorLessThanEqual2Test039
     * @tc.desc operatorLessThanEqual decremented result less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorDecrement().operatorLessThanEqual(BigInt(5))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4000
     * @tc.name testBigIntOperatorLessThanEqual2Test040
     * @tc.desc operatorLessThanEqual power result less than larger value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(3)).operatorLessThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4100
     * @tc.name testBigIntOperatorLessThanEqual2Test041
     * @tc.desc operatorLessThanEqual power result equal to comparison value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(3)).operatorLessThanEqual(BigInt(8))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4200
     * @tc.name testBigIntOperatorLessThanEqual2Test042
     * @tc.desc operatorLessThanEqual negated positive less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).negate().operatorLessThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4300
     * @tc.name testBigIntOperatorLessThanEqual2Test043
     * @tc.desc operatorLessThanEqual negated negative value less than another negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10).negate().operatorLessThanEqual(BigInt(5))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4400
     * @tc.name testBigIntOperatorLessThanEqual2Test044
     * @tc.desc operatorLessThanEqual bitwise AND result less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).operatorLessThanEqual(BigInt(12))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4500
     * @tc.name testBigIntOperatorLessThanEqual2Test045
     * @tc.desc operatorLessThanEqual original less than or equal to bitwise OR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12).operatorLessThanEqual(BigInt(12).operatorBitwiseOr(BigInt(5)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4600
     * @tc.name testBigIntOperatorLessThanEqual2Test046
     * @tc.desc operatorLessThanEqual original less than or equal to left shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).operatorLessThanEqual(BigInt(2).operatorLeftShift(BigInt(2)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4700
     * @tc.name testBigIntOperatorLessThanEqual2Test047
     * @tc.desc operatorLessThanEqual right shift result less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(8).operatorRightShift(BigInt(2)).operatorLessThanEqual(BigInt(8))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4800
     * @tc.name testBigIntOperatorLessThanEqual2Test048
     * @tc.desc operatorLessThanEqual bitwise NOT of positive (negative) less than original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorBitwiseNot().operatorLessThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_4900
     * @tc.name testBigIntOperatorLessThanEqual2Test049
     * @tc.desc operatorLessThanEqual original negative less than or equal to its bitwise NOT (positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10).operatorLessThanEqual(BigInt(-10).operatorBitwiseNot())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5000
     * @tc.name testBigIntOperatorLessThanEqual2Test050
     * @tc.desc operatorLessThanEqual asIntN truncated negative less than or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(4, BigInt(15)).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5100
     * @tc.name testBigIntOperatorLessThanEqual2Test051
     * @tc.desc operatorLessThanEqual asIntN truncated value less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(4, BigInt(20)).operatorLessThanEqual(BigInt(20))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5200
     * @tc.name testBigIntOperatorLessThanEqual2Test052
     * @tc.desc operatorLessThanEqual asUintN truncated value less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(4, BigInt(20)).operatorLessThanEqual(BigInt(20))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5300
     * @tc.name testBigIntOperatorLessThanEqual2Test053
     * @tc.desc operatorLessThanEqual asUintN 8-bit max less than carry value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(255)).operatorLessThanEqual(BigInt(256))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5400
     * @tc.name testBigIntOperatorLessThanEqual2Test054
     * @tc.desc operatorLessThanEqual asIntN 8-bit negative boundary less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(128)).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5500
     * @tc.name testBigIntOperatorLessThanEqual2Test055
     * @tc.desc operatorLessThanEqual asIntN no-overflow result equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(64, BigInt(100)).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5600
     * @tc.name testBigIntOperatorLessThanEqual2Test056
     * @tc.desc operatorLessThanEqual asUintN no-overflow result equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(64, BigInt(100)).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5700
     * @tc.name testBigIntOperatorLessThanEqual2Test057
     * @tc.desc operatorLessThanEqual asIntN 32-bit overflow negative less than original positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(32, BigInt(4294967295)).operatorLessThanEqual(BigInt(4294967295))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5800
     * @tc.name testBigIntOperatorLessThanEqual2Test058
     * @tc.desc operatorLessThanEqual asUintN 8-bit truncation of large value less than original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(8, BigInt(1024)).operatorLessThanEqual(BigInt(1024))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_5900
     * @tc.name testBigIntOperatorLessThanEqual2Test059
     * @tc.desc operatorLessThanEqual double round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(100).doubleValue()).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6000
     * @tc.name testBigIntOperatorLessThanEqual2Test060
     * @tc.desc operatorLessThanEqual long round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(100).getLong()).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6100
     * @tc.name testBigIntOperatorLessThanEqual2Test061
     * @tc.desc operatorLessThanEqual unsigned long round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt('18446744073709551615').getULong()).operatorLessThanEqual(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6200
     * @tc.name testBigIntOperatorLessThanEqual2Test062
     * @tc.desc operatorLessThanEqual decimal string round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(12345).toString()).operatorLessThanEqual(BigInt(12345))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6300
     * @tc.name testBigIntOperatorLessThanEqual2Test063
     * @tc.desc operatorLessThanEqual hex string round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt("0x"+BigInt(255).toString(16)).operatorLessThanEqual(BigInt(255))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6400
     * @tc.name testBigIntOperatorLessThanEqual2Test064
     * @tc.desc operatorLessThanEqual binary string round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt("0b"+BigInt(255).toString(2)).operatorLessThanEqual(BigInt(255))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6500
     * @tc.name testBigIntOperatorLessThanEqual2Test065
     * @tc.desc operatorLessThanEqual 1 less than large power of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorLessThanEqual(BigInt(2).pow(BigInt(20)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6600
     * @tc.name testBigIntOperatorLessThanEqual2Test066
     * @tc.desc operatorLessThanEqual negative large power of 2 less than -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2).pow(BigInt(20)).negate().operatorLessThanEqual(BigInt(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6700
     * @tc.name testBigIntOperatorLessThanEqual2Test067
     * @tc.desc operatorLessThanEqual 20-digit numbers differing only in last digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('12345678901234567890').operatorLessThanEqual(BigInt('12345678901234567891'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6800
     * @tc.name testBigIntOperatorLessThanEqual2Test068
     * @tc.desc operatorLessThanEqual 20-digit numbers last digit diff false case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('12345678901234567891').operatorLessThanEqual(BigInt('12345678901234567890'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_6900
     * @tc.name testBigIntOperatorLessThanEqual2Test069
     * @tc.desc operatorLessThanEqual large trailing-zero number less than same-length non-zero number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1000000000000').operatorLessThanEqual(BigInt('1000000000001'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_7000
     * @tc.name testBigIntOperatorLessThanEqual2Test070
     * @tc.desc operatorLessThanEqual same-first-digit mid-all-zero less than mid-all-nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1000000000001').operatorLessThanEqual(BigInt('1999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_7100
     * @tc.name testBigIntOperatorLessThanEqual2Test071
     * @tc.desc operatorLessThanEqual 30-digit negative numbers differing only in most significant digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-223456789012345678901234567890').operatorLessThanEqual(BigInt('-123456789012345678901234567890'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_LESS_THAN_EQUAL_7200
     * @tc.name testBigIntOperatorLessThanEqual2Test072
     * @tc.desc operatorLessThanEqual symmetric large negative less than positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9999999999999999999').operatorLessThanEqual(BigInt('9999999999999999999'))).assertTrue();
    });
  });
}
