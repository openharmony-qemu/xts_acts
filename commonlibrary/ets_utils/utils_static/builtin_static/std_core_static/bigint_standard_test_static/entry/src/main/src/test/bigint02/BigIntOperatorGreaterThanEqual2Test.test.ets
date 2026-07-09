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
import { describe, it, expect, afterEach, afterAll } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorGreaterThanEqual2Test(): void {
  describe('testBigIntOperatorGreaterThanEqual2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_0700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test007
     * @tc.desc operatorGreaterThanEqual with double constructor sources: equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5.0).operatorGreaterThanEqual(BigInt(5.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_0800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test008
     * @tc.desc operatorGreaterThanEqual double constructor: larger > smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(99.0).operatorGreaterThanEqual(BigInt(50.0))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_0900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test009
     * @tc.desc operatorGreaterThanEqual double constructor: smaller >= larger is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(50.0).operatorGreaterThanEqual(BigInt(99.0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test010
     * @tc.desc operatorGreaterThanEqual double constructor: negative double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-10.0).operatorGreaterThanEqual(BigInt(-20.0))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test011
     * @tc.desc operatorGreaterThanEqual string constructor: equal numbers as string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('123456789').operatorGreaterThanEqual(BigInt('123456789'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test012
     * @tc.desc operatorGreaterThanEqual string constructor: smaller string >= larger string is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('123').operatorGreaterThanEqual(BigInt('456'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test013
     * @tc.desc operatorGreaterThanEqual string constructor: equal negative string numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-987654321').operatorGreaterThanEqual(BigInt('-987654321'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test014
     * @tc.desc operatorGreaterThanEqual string constructor: numbers with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('00100').operatorGreaterThanEqual(BigInt('99'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1500
     * @tc.name testBigIntOperatorGreaterThanEqual2Test015
     * @tc.desc operatorGreaterThanEqual byte constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100 as byte).operatorGreaterThanEqual(BigInt(50 as byte))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1600
     * @tc.name testBigIntOperatorGreaterThanEqual2Test016
     * @tc.desc operatorGreaterThanEqual byte constructor: equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(77 as byte).operatorGreaterThanEqual(BigInt(77 as byte))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test017
     * @tc.desc operatorGreaterThanEqual byte constructor: smaller >= larger is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(30 as byte).operatorGreaterThanEqual(BigInt(80 as byte))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test018
     * @tc.desc operatorGreaterThanEqual short constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(30000 as short).operatorGreaterThanEqual(BigInt(20000 as short))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_1900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test019
     * @tc.desc operatorGreaterThanEqual short constructor: equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(20000 as short).operatorGreaterThanEqual(BigInt(20000 as short))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test020
     * @tc.desc operatorGreaterThanEqual short constructor: smaller >= larger is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10000 as short).operatorGreaterThanEqual(BigInt(25000 as short))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test021
     * @tc.desc operatorGreaterThanEqual int constructor sources: non-boundary positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(12345678).operatorGreaterThanEqual(BigInt(12345678))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test022
     * @tc.desc operatorGreaterThanEqual int constructor: larger >= smaller is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(999999).operatorGreaterThanEqual(BigInt(888888))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test023
     * @tc.desc operatorGreaterThanEqual long constructor: equal long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(123456789012345 as long).operatorGreaterThanEqual(BigInt(123456789012345 as long))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test024
     * @tc.desc operatorGreaterThanEqual long constructor: larger >= smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(500000000000000 as long).operatorGreaterThanEqual(BigInt(400000000000000 as long))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2500
     * @tc.name testBigIntOperatorGreaterThanEqual2Test025
     * @tc.desc operatorGreaterThanEqual with BigInt.fromULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(100 as long).operatorGreaterThanEqual(BigInt.fromULong(50 as long))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2600
     * @tc.name testBigIntOperatorGreaterThanEqual2Test026
     * @tc.desc operatorGreaterThanEqual with BigInt.fromULong equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(200 as long).operatorGreaterThanEqual(BigInt.fromULong(200 as long))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test027
     * @tc.desc operatorGreaterThanEqual using copy-constructed BigInt on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(888)).operatorGreaterThanEqual(BigInt(BigInt(777)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test028
     * @tc.desc operatorGreaterThanEqual copy-constructed equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(555)).operatorGreaterThanEqual(BigInt(BigInt(555)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_2900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test029
     * @tc.desc operatorGreaterThanEqual copy-constructed: smaller >= larger is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(100)).operatorGreaterThanEqual(BigInt(BigInt(200)))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test030
     * @tc.desc operatorGreaterThanEqual with BigInt.asIntN truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(4, BigInt(15)).operatorGreaterThanEqual(BigInt.asIntN(4, BigInt(14)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test031
     * @tc.desc operatorGreaterThanEqual with BigInt.asIntN equal truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(100)).operatorGreaterThanEqual(BigInt.asIntN(8, BigInt(100)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test032
     * @tc.desc operatorGreaterThanEqual with BigInt.asUintN truncated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(4, BigInt(15)).operatorGreaterThanEqual(BigInt.asUintN(4, BigInt(14)))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test033
     * @tc.desc operatorGreaterThanEqual with BigInt.asUintN: smaller >= larger is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asUintN(4, BigInt(7)).operatorGreaterThanEqual(BigInt.asUintN(4, BigInt(8)))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test034
     * @tc.desc operatorGreaterThanEqual large number with different digit lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('1000000000000000000000000').operatorGreaterThanEqual(BigInt('999999999999999999999')))
        .assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3500
     * @tc.name testBigIntOperatorGreaterThanEqual2Test035
     * @tc.desc operatorGreaterThanEqual negative numbers with different digit lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-999999999999999999999').operatorGreaterThanEqual(BigInt('-1000000000000000000000000')))
        .assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3600
     * @tc.name testBigIntOperatorGreaterThanEqual2Test036
     * @tc.desc operatorGreaterThanEqual large negative numbers with equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-77777777777777777777').operatorGreaterThanEqual(BigInt('-77777777777777777777'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test037
     * @tc.desc operatorGreaterThanEqual very large string number vs long max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('123456789012345678901234567890').operatorGreaterThanEqual(BigInt('9223372036854775807')))
        .assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test038
     * @tc.desc operatorGreaterThanEqual long min vs very large negative string number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9223372036854775808').operatorGreaterThanEqual(BigInt('-123456789012345678901234567890')))
        .assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_3900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test039
     * @tc.desc operatorGreaterThanEqual zero vs string negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorGreaterThanEqual(BigInt('-0'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test040
     * @tc.desc operatorGreaterThanEqual byte overflow: 128 as byte (overflow to -128) vs -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let overflowVal: byte = Int.toByte(128);
      expect(BigInt(overflowVal).operatorGreaterThanEqual(BigInt(-127 as byte))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test041
     * @tc.desc operatorGreaterThanEqual byte boundary: 127 (byte max) vs 126
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127 as byte).operatorGreaterThanEqual(BigInt(126 as byte))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test042
     * @tc.desc operatorGreaterThanEqual byte boundary: -128 (byte min) vs -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-128 as byte).operatorGreaterThanEqual(BigInt(-127 as byte))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test043
     * @tc.desc operatorGreaterThanEqual short boundary: 32767 vs 32766
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(32767 as short).operatorGreaterThanEqual(BigInt(32766 as short))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test044
     * @tc.desc operatorGreaterThanEqual short boundary: -32768 vs -32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-32768 as short).operatorGreaterThanEqual(BigInt(-32767 as short))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4500
     * @tc.name testBigIntOperatorGreaterThanEqual2Test045
     * @tc.desc operatorGreaterThanEqual comparing pow result with value-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).pow(BigInt(2)).operatorGreaterThanEqual(BigInt(24))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4600
     * @tc.name testBigIntOperatorGreaterThanEqual2Test046
     * @tc.desc operatorGreaterThanEqual comparing negate result with smaller negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).negate().operatorGreaterThanEqual(BigInt(-6))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test047
     * @tc.desc operatorGreaterThanEqual comparing add result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorAdd(BigInt(3)).operatorGreaterThanEqual(BigInt(8))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test048
     * @tc.desc operatorGreaterThanEqual comparing subtract result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorSubtract(BigInt(3)).operatorGreaterThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_4900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test049
     * @tc.desc operatorGreaterThanEqual comparing multiply result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorMultiply(BigInt(3)).operatorGreaterThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test050
     * @tc.desc operatorGreaterThanEqual comparing divide result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorDivide(BigInt(2)).operatorGreaterThanEqual(BigInt(5))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test051
     * @tc.desc operatorGreaterThanEqual comparing mod result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(10).operatorModule(BigInt(3)).operatorGreaterThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test052
     * @tc.desc operatorGreaterThanEqual comparing bitwise and result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorBitwiseAnd(BigInt(3)).operatorGreaterThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test053
     * @tc.desc operatorGreaterThanEqual comparing bitwise or result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorBitwiseOr(BigInt(3)).operatorGreaterThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test054
     * @tc.desc operatorGreaterThanEqual comparing bitwise xor result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorBitwiseXor(BigInt(3)).operatorGreaterThanEqual(BigInt(6))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5500
     * @tc.name testBigIntOperatorGreaterThanEqual2Test055
     * @tc.desc operatorGreaterThanEqual comparing left shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorLeftShift(BigInt(1)).operatorGreaterThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5600
     * @tc.name testBigIntOperatorGreaterThanEqual2Test056
     * @tc.desc operatorGreaterThanEqual comparing right shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorRightShift(BigInt(1)).operatorGreaterThanEqual(BigInt(2))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test057
     * @tc.desc operatorGreaterThanEqual comparing bitwise not result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorBitwiseNot().operatorGreaterThanEqual(BigInt(-6))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test058
     * @tc.desc operatorGreaterThanEqual comparing incremented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorIncrement().operatorGreaterThanEqual(BigInt(6))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_5900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test059
     * @tc.desc operatorGreaterThanEqual comparing decremented value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorDecrement().operatorGreaterThanEqual(BigInt(4))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test060
     * @tc.desc operatorGreaterThanEqual after doubleValue round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(8).doubleValue()).operatorGreaterThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test061
     * @tc.desc operatorGreaterThanEqual after getLong round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(8).getLong()).operatorGreaterThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test062
     * @tc.desc operatorGreaterThanEqual after getULong round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(8).getULong()).operatorGreaterThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test063
     * @tc.desc operatorGreaterThanEqual asIntN truncated: larger >= smaller is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(32, BigInt(300)).operatorGreaterThanEqual(BigInt.asIntN(32, BigInt(200)))).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test064
     * @tc.desc operatorGreaterThanEqual zero-related comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(1).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(-1).operatorGreaterThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(0).operatorGreaterThanEqual(BigInt(1))).assertFalse();
      expect(BigInt(0).operatorGreaterThanEqual(BigInt(-1))).assertTrue();
      expect(BigInt(1).operatorGreaterThanEqual(BigInt(-1))).assertTrue();
      expect(BigInt(-1).operatorGreaterThanEqual(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6500
     * @tc.name testBigIntOperatorGreaterThanEqual2Test065
     * @tc.desc operatorGreaterThanEqual byte/short/int/long extrema vs zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(-128).operatorGreaterThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(32767).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(-32768).operatorGreaterThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(2147483647).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(-2147483648).operatorGreaterThanEqual(BigInt(0))).assertFalse();
      expect(BigInt('9223372036854775807').operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorGreaterThanEqual(BigInt(0))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6600
     * @tc.name testBigIntOperatorGreaterThanEqual2Test066
     * @tc.desc operatorGreaterThanEqual adjacent value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorGreaterThanEqual(BigInt(127))).assertTrue();
      expect(BigInt(-128).operatorGreaterThanEqual(BigInt(-128))).assertTrue();
      expect(BigInt(127).operatorGreaterThanEqual(BigInt(-128))).assertTrue();
      expect(BigInt(-128).operatorGreaterThanEqual(BigInt(127))).assertFalse();
      expect(BigInt(32767).operatorGreaterThanEqual(BigInt(127))).assertTrue();
      expect(BigInt(-32768).operatorGreaterThanEqual(BigInt(-128))).assertFalse();
      expect(BigInt(2147483647).operatorGreaterThanEqual(BigInt(32767))).assertTrue();
      expect(BigInt(-2147483648).operatorGreaterThanEqual(BigInt(-32768))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6700
     * @tc.name testBigIntOperatorGreaterThanEqual2Test067
     * @tc.desc operatorGreaterThanEqual cross-type adjacent comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('9223372036854775807').operatorGreaterThanEqual(BigInt(2147483647))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorGreaterThanEqual(BigInt(-2147483648))).assertFalse();
      expect(BigInt(1).operatorGreaterThanEqual(BigInt(127))).assertFalse();
      expect(BigInt(127).operatorGreaterThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6800
     * @tc.name testBigIntOperatorGreaterThanEqual2Test068
     * @tc.desc operatorGreaterThanEqual large number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('99999999999999999999').operatorGreaterThanEqual(BigInt(1))).assertTrue();
      expect(BigInt(1).operatorGreaterThanEqual(BigInt('99999999999999999999'))).assertFalse();
      expect(BigInt('99999999999999999999').operatorGreaterThanEqual(BigInt('-99999999999999999999'))).assertTrue();
      expect(BigInt('-99999999999999999999').operatorGreaterThanEqual(BigInt('99999999999999999999'))).assertFalse();
      expect(BigInt('88888888888888888888').operatorGreaterThanEqual(BigInt('77777777777777777777'))).assertTrue();
      expect(BigInt('-11111111111111111111').operatorGreaterThanEqual(BigInt('-22222222222222222222'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_6900
     * @tc.name testBigIntOperatorGreaterThanEqual2Test069
     * @tc.desc operatorGreaterThanEqual equal value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).operatorGreaterThanEqual(BigInt(42))).assertTrue();
      expect(BigInt(-42).operatorGreaterThanEqual(BigInt(-42))).assertTrue();
      expect(BigInt('12345678901234567890').operatorGreaterThanEqual(BigInt('12345678901234567890'))).assertTrue();
      expect(BigInt('-12345678901234567890').operatorGreaterThanEqual(BigInt('-12345678901234567890'))).assertTrue();
      expect(BigInt('9223372036854775807').operatorGreaterThanEqual(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorGreaterThanEqual(BigInt('-9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_7000
     * @tc.name testBigIntOperatorGreaterThanEqual2Test070
     * @tc.desc operatorGreaterThanEqual immutability test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const b = BigInt(50);
      const origA = a.toString();
      const origB = b.toString();
      a.operatorGreaterThanEqual(b);
      expect(a.toString()).assertEqual(origA);
      expect(b.toString()).assertEqual(origB);
      a.operatorGreaterThanEqual(BigInt(0));
      a.operatorGreaterThanEqual(BigInt(-1));
      expect(a.toString()).assertEqual(origA);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_7100
     * @tc.name testBigIntOperatorGreaterThanEqual2Test071
     * @tc.desc operatorGreaterThanEqual various constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorGreaterThanEqual(BigInt('100'))).assertTrue();
      expect(BigInt('100').operatorGreaterThanEqual(BigInt(99))).assertTrue();
      expect(BigInt(3.0).operatorGreaterThanEqual(BigInt(2))).assertTrue();
      expect(BigInt('-9223372036854775809').operatorGreaterThanEqual(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_7200
     * @tc.name testBigIntOperatorGreaterThanEqual2Test072
     * @tc.desc operatorGreaterThanEqual boolean constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(false).operatorGreaterThanEqual(BigInt(1))).assertFalse();
      expect(BigInt(true).operatorGreaterThanEqual(BigInt(false))).assertTrue();
      const original = BigInt(50);
      expect(BigInt(original).operatorGreaterThanEqual(BigInt(49))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_7300
     * @tc.name testBigIntOperatorGreaterThanEqual2Test073
     * @tc.desc operatorGreaterThanEqual cross-sign large magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorGreaterThanEqual(BigInt(-100))).assertTrue();
      expect(BigInt(-100).operatorGreaterThanEqual(BigInt(100))).assertFalse();
      expect(BigInt('1000000').operatorGreaterThanEqual(BigInt('-1000000'))).assertTrue();
      expect(BigInt('-1000000').operatorGreaterThanEqual(BigInt('1000000'))).assertFalse();
      expect(BigInt(1).operatorGreaterThanEqual(BigInt('-9223372036854775808'))).assertTrue();
      expect(BigInt(-1).operatorGreaterThanEqual(BigInt('9223372036854775807'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_GREATER_THAN_EQUAL_7400
     * @tc.name testBigIntOperatorGreaterThanEqual2Test074
     * @tc.desc Verify operatorGreaterThanEqual of BigInt for various large numbers, positive & negative extreme values and absolute value difference scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqual2Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1).operatorGreaterThanEqual(BigInt('-999999999999'))).assertTrue();
      expect(BigInt(-1).operatorGreaterThanEqual(BigInt('999999999999'))).assertFalse();
      expect(BigInt('1000000000000000000000000000000')
        .operatorGreaterThanEqual(BigInt('-1000000000000000000000000000000'))).assertTrue();
      expect(BigInt('9223372036854775808').operatorGreaterThanEqual(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorGreaterThanEqual(BigInt('-99999999999999999999'))).assertTrue();
      expect(BigInt('-99999999999999999999').operatorGreaterThanEqual(BigInt('-9223372036854775808'))).assertFalse();
      expect(BigInt('11111111111111111111').operatorGreaterThanEqual(BigInt('22222222222222222222'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorGreaterThanEqual(BigInt('-11111111111111111111'))).assertFalse();
    });
  });
}
