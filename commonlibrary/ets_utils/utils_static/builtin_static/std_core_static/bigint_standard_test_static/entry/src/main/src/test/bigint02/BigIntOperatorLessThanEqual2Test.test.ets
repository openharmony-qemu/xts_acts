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
  describe('testBigIntOperatorLessThanEqual2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0100
     * @tc.name testBigIntOperatorLessThanEqual2Test0100
     * @tc.desc operatorLessThanEqual zero-related comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(1).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt(0))).assertTrue();
      expect(BigInt(0).operatorLessThanEqual(BigInt(1))).assertTrue();
      expect(BigInt(0).operatorLessThanEqual(BigInt(-1))).assertFalse();
      expect(BigInt(1).operatorLessThanEqual(BigInt(-1))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0200
     * @tc.name testBigIntOperatorLessThanEqual2Test0200
     * @tc.desc operatorLessThanEqual byte/short/int/long extrema vs zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0300
     * @tc.name testBigIntOperatorLessThanEqual2Test0300
     * @tc.desc operatorLessThanEqual adjacent value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0400
     * @tc.name testBigIntOperatorLessThanEqual2Test0400
     * @tc.desc operatorLessThanEqual cross-type adjacent comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt(-2147483648))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThanEqual(BigInt(2147483647))).assertFalse();
      expect(BigInt(1).operatorLessThanEqual(BigInt(127))).assertTrue();
      expect(BigInt(127).operatorLessThanEqual(BigInt(1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0500
     * @tc.name testBigIntOperatorLessThanEqual2Test0500
     * @tc.desc operatorLessThanEqual large number comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('99999999999999999999').operatorLessThanEqual(BigInt(1))).assertFalse();
      expect(BigInt(1).operatorLessThanEqual(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('99999999999999999999').operatorLessThanEqual(BigInt('-99999999999999999999'))).assertFalse();
      expect(BigInt('-99999999999999999999').operatorLessThanEqual(BigInt('99999999999999999999'))).assertTrue();
      expect(BigInt('11111111111111111111').operatorLessThanEqual(BigInt('22222222222222222222'))).assertTrue();
      expect(BigInt('-22222222222222222222').operatorLessThanEqual(BigInt('-11111111111111111111'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0600
     * @tc.name testBigIntOperatorLessThanEqual2Test0600
     * @tc.desc operatorLessThanEqual equal value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).operatorLessThanEqual(BigInt(42))).assertTrue();
      expect(BigInt(-42).operatorLessThanEqual(BigInt(-42))).assertTrue();
      expect(BigInt('12345678901234567890').operatorLessThanEqual(BigInt('12345678901234567890'))).assertTrue();
      expect(BigInt('-12345678901234567890').operatorLessThanEqual(BigInt('-12345678901234567890'))).assertTrue();
      expect(BigInt('9223372036854775807').operatorLessThanEqual(BigInt('9223372036854775807'))).assertTrue();
      expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt('-9223372036854775808'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0700
     * @tc.name testBigIntOperatorLessThanEqual2Test0700
     * @tc.desc operatorLessThanEqual immutability test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0800
     * @tc.name testBigIntOperatorLessThanEqual2Test0800
     * @tc.desc operatorLessThanEqual various constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorLessThanEqual(BigInt('100'))).assertTrue();
      expect(BigInt('99').operatorLessThanEqual(BigInt(100))).assertTrue();
      expect(BigInt(2.0).operatorLessThanEqual(BigInt(3))).assertTrue();
      expect(BigInt('-9223372036854775807').operatorLessThanEqual(BigInt('-9223372036854775808'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0900
     * @tc.name testBigIntOperatorLessThanEqual2Test0900
     * @tc.desc operatorLessThanEqual boolean constructor sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(false).operatorLessThanEqual(BigInt(1))).assertTrue();
      expect(BigInt(true).operatorLessThanEqual(BigInt(0))).assertFalse();
      expect(BigInt(false).operatorLessThanEqual(BigInt(true))).assertTrue();
      const original = BigInt(50);
      expect(BigInt(original).operatorLessThanEqual(BigInt(51))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1000
     * @tc.name testBigIntOperatorLessThanEqual2Test1000
     * @tc.desc operatorLessThanEqual cross-sign large magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorLessThanEqual(BigInt(-100))).assertFalse();
      expect(BigInt(-100).operatorLessThanEqual(BigInt(100))).assertTrue();
      expect(BigInt('1000000').operatorLessThanEqual(BigInt('-1000000'))).assertFalse();
      expect(BigInt('-1000000').operatorLessThanEqual(BigInt('1000000'))).assertTrue();
      expect(BigInt(1).operatorLessThanEqual(BigInt('-9223372036854775808'))).assertFalse();
      expect(BigInt(-1).operatorLessThanEqual(BigInt('9223372036854775807'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1100
     * @tc.name testBigIntOperatorLessThanEqual2Test1100
     * @tc.desc operatorLessThanEqual gap fill for remaining mind map points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1200
     * @tc.name testBigIntOperatorLessThanEqual2Test1200
     * @tc.desc operatorLessThanEqual fromULong constructed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).operatorLessThanEqual(BigInt.fromULong(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1300
     * @tc.name testBigIntOperatorLessThanEqual2Test1300
     * @tc.desc operatorLessThanEqual fromULong equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(4294967295).operatorLessThanEqual(BigInt.fromULong(4294967295))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1400
     * @tc.name testBigIntOperatorLessThanEqual2Test1400
     * @tc.desc operatorLessThanEqual fromULong max value vs regular long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(-1).toString()).assertEqual('18446744073709551615');
      expect(BigInt.fromULong(-1).operatorLessThanEqual(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1500
     * @tc.name testBigIntOperatorLessThanEqual2Test1500
     * @tc.desc operatorLessThanEqual hex string constructed value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0xff').operatorLessThanEqual(BigInt(256))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1600
     * @tc.name testBigIntOperatorLessThanEqual2Test1600
     * @tc.desc operatorLessThanEqual binary string constructed value comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0b1111').operatorLessThanEqual(BigInt(16))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1700
     * @tc.name testBigIntOperatorLessThanEqual2Test1700
     * @tc.desc operatorLessThanEqual default constructed BigInt comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt().toString()).assertEqual('0');
      expect(new BigInt().operatorLessThanEqual(BigInt(1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1800
     * @tc.name testBigIntOperatorLessThanEqual2Test1800
     * @tc.desc operatorLessThanEqual copy constructed value equal to original negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(-999)).operatorLessThanEqual(BigInt(-999))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_1900
     * @tc.name testBigIntOperatorLessThanEqual2Test1900
     * @tc.desc operatorLessThanEqual addition result less than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorLessThanEqual(BigInt(20))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2000
     * @tc.name testBigIntOperatorLessThanEqual2Test2000
     * @tc.desc operatorLessThanEqual addition result equal to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(5)).operatorLessThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2100
     * @tc.name testBigIntOperatorLessThanEqual2Test2100
     * @tc.desc operatorLessThanEqual addition result greater than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorAdd(BigInt(10)).operatorLessThanEqual(BigInt(15))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2200
     * @tc.name testBigIntOperatorLessThanEqual2Test2200
     * @tc.desc operatorLessThanEqual subtraction result less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorSubtract(BigInt(10)).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2300
     * @tc.name testBigIntOperatorLessThanEqual2Test2300
     * @tc.desc operatorLessThanEqual negative subtraction result less than another negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3).operatorSubtract(BigInt(10)).operatorLessThanEqual(BigInt(5).operatorSubtract(BigInt(8)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2400
     * @tc.name testBigIntOperatorLessThanEqual2Test2400
     * @tc.desc operatorLessThanEqual multiplication result less than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3).operatorMultiply(BigInt(4)).operatorLessThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2500
     * @tc.name testBigIntOperatorLessThanEqual2Test2500
     * @tc.desc operatorLessThanEqual multiplication result equal to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3).operatorMultiply(BigInt(5)).operatorLessThanEqual(BigInt(15))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2600
     * @tc.name testBigIntOperatorLessThanEqual2Test2600
     * @tc.desc operatorLessThanEqual multiplication result greater than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(4).operatorMultiply(BigInt(5)).operatorLessThanEqual(BigInt(15))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2700
     * @tc.name testBigIntOperatorLessThanEqual2Test2700
     * @tc.desc operatorLessThanEqual division result less than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(20).operatorDivide(BigInt(3)).operatorLessThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2800
     * @tc.name testBigIntOperatorLessThanEqual2Test2800
     * @tc.desc operatorLessThanEqual division result equal to target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(20).operatorDivide(BigInt(5)).operatorLessThanEqual(BigInt(4))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_2900
     * @tc.name testBigIntOperatorLessThanEqual2Test2900
     * @tc.desc operatorLessThanEqual division result greater than target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(20).operatorDivide(BigInt(3)).operatorLessThanEqual(BigInt(5))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3000
     * @tc.name testBigIntOperatorLessThanEqual2Test3000
     * @tc.desc operatorLessThanEqual modulo result less than divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(20).operatorModule(BigInt(7)).operatorLessThanEqual(BigInt(7))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3100
     * @tc.name testBigIntOperatorLessThanEqual2Test3100
     * @tc.desc operatorLessThanEqual modulo result equal to comparison value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(20).operatorModule(BigInt(7)).operatorLessThanEqual(BigInt(6))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3200
     * @tc.name testBigIntOperatorLessThanEqual2Test3200
     * @tc.desc operatorLessThanEqual original less than or equal to incremented result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorLessThanEqual(BigInt(5).operatorIncrement())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3300
     * @tc.name testBigIntOperatorLessThanEqual2Test3300
     * @tc.desc operatorLessThanEqual decremented result less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorDecrement().operatorLessThanEqual(BigInt(5))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3400
     * @tc.name testBigIntOperatorLessThanEqual2Test3400
     * @tc.desc operatorLessThanEqual power result less than larger value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(3)).operatorLessThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3500
     * @tc.name testBigIntOperatorLessThanEqual2Test3500
     * @tc.desc operatorLessThanEqual power result equal to comparison value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(3)).operatorLessThanEqual(BigInt(8))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3600
     * @tc.name testBigIntOperatorLessThanEqual2Test3600
     * @tc.desc operatorLessThanEqual negated positive less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).negate().operatorLessThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3700
     * @tc.name testBigIntOperatorLessThanEqual2Test3700
     * @tc.desc operatorLessThanEqual negated negative value less than another negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).negate().operatorLessThanEqual(BigInt(5))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3800
     * @tc.name testBigIntOperatorLessThanEqual2Test3800
     * @tc.desc operatorLessThanEqual bitwise AND result less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).operatorLessThanEqual(BigInt(12))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_3900
     * @tc.name testBigIntOperatorLessThanEqual2Test3900
     * @tc.desc operatorLessThanEqual original less than or equal to bitwise OR result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12).operatorLessThanEqual(BigInt(12).operatorBitwiseOr(BigInt(5)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4000
     * @tc.name testBigIntOperatorLessThanEqual2Test4000
     * @tc.desc operatorLessThanEqual original less than or equal to left shift result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).operatorLessThanEqual(BigInt(2).operatorLeftShift(BigInt(2)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4100
     * @tc.name testBigIntOperatorLessThanEqual2Test4100
     * @tc.desc operatorLessThanEqual right shift result less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(8).operatorRightShift(BigInt(2)).operatorLessThanEqual(BigInt(8))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4200
     * @tc.name testBigIntOperatorLessThanEqual2Test4200
     * @tc.desc operatorLessThanEqual bitwise NOT of positive (negative) less than original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorBitwiseNot().operatorLessThanEqual(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4300
     * @tc.name testBigIntOperatorLessThanEqual2Test4300
     * @tc.desc operatorLessThanEqual original negative less than or equal to its bitwise NOT (positive)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).operatorLessThanEqual(BigInt(-10).operatorBitwiseNot())).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4400
     * @tc.name testBigIntOperatorLessThanEqual2Test4400
     * @tc.desc operatorLessThanEqual asIntN truncated negative less than or equal to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(4, BigInt(15)).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4500
     * @tc.name testBigIntOperatorLessThanEqual2Test4500
     * @tc.desc operatorLessThanEqual asIntN truncated value less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(4, BigInt(20)).operatorLessThanEqual(BigInt(20))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4600
     * @tc.name testBigIntOperatorLessThanEqual2Test4600
     * @tc.desc operatorLessThanEqual asUintN truncated value less than or equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(4, BigInt(20)).operatorLessThanEqual(BigInt(20))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4700
     * @tc.name testBigIntOperatorLessThanEqual2Test4700
     * @tc.desc operatorLessThanEqual asUintN 8-bit max less than carry value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(255)).operatorLessThanEqual(BigInt(256))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4800
     * @tc.name testBigIntOperatorLessThanEqual2Test4800
     * @tc.desc operatorLessThanEqual asIntN 8-bit negative boundary less than zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(128)).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_4900
     * @tc.name testBigIntOperatorLessThanEqual2Test4900
     * @tc.desc operatorLessThanEqual asIntN no-overflow result equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(64, BigInt(100)).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5000
     * @tc.name testBigIntOperatorLessThanEqual2Test5000
     * @tc.desc operatorLessThanEqual asUintN no-overflow result equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(64, BigInt(100)).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5100
     * @tc.name testBigIntOperatorLessThanEqual2Test5100
     * @tc.desc operatorLessThanEqual asIntN 32-bit overflow negative less than original positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(32, BigInt(4294967295)).operatorLessThanEqual(BigInt(4294967295))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5200
     * @tc.name testBigIntOperatorLessThanEqual2Test5200
     * @tc.desc operatorLessThanEqual asUintN 8-bit truncation of large value less than original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(1024)).operatorLessThanEqual(BigInt(1024))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5300
     * @tc.name testBigIntOperatorLessThanEqual2Test5300
     * @tc.desc operatorLessThanEqual double round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(100).doubleValue()).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5400
     * @tc.name testBigIntOperatorLessThanEqual2Test5400
     * @tc.desc operatorLessThanEqual long round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(100).getLong()).operatorLessThanEqual(BigInt(100))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5500
     * @tc.name testBigIntOperatorLessThanEqual2Test5500
     * @tc.desc operatorLessThanEqual unsigned long round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt('18446744073709551615').getULong()).operatorLessThanEqual(BigInt('18446744073709551615'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5600
     * @tc.name testBigIntOperatorLessThanEqual2Test5600
     * @tc.desc operatorLessThanEqual decimal string round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(12345).toString()).operatorLessThanEqual(BigInt(12345))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5700
     * @tc.name testBigIntOperatorLessThanEqual2Test5700
     * @tc.desc operatorLessThanEqual hex string round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt("0x"+BigInt(255).toString(16)).operatorLessThanEqual(BigInt(255))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5800
     * @tc.name testBigIntOperatorLessThanEqual2Test5800
     * @tc.desc operatorLessThanEqual binary string round-trip value equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt("0b"+BigInt(255).toString(2)).operatorLessThanEqual(BigInt(255))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_5900
     * @tc.name testBigIntOperatorLessThanEqual2Test5900
     * @tc.desc operatorLessThanEqual 1 less than large power of 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test5900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1).operatorLessThanEqual(BigInt(2).pow(BigInt(20)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6000
     * @tc.name testBigIntOperatorLessThanEqual2Test6000
     * @tc.desc operatorLessThanEqual negative large power of 2 less than -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).pow(BigInt(20)).negate().operatorLessThanEqual(BigInt(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6100
     * @tc.name testBigIntOperatorLessThanEqual2Test6100
     * @tc.desc operatorLessThanEqual 20-digit numbers differing only in last digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('12345678901234567890').operatorLessThanEqual(BigInt('12345678901234567891'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6200
     * @tc.name testBigIntOperatorLessThanEqual2Test6200
     * @tc.desc operatorLessThanEqual 20-digit numbers last digit diff false case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('12345678901234567891').operatorLessThanEqual(BigInt('12345678901234567890'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6300
     * @tc.name testBigIntOperatorLessThanEqual2Test6300
     * @tc.desc operatorLessThanEqual large trailing-zero number less than same-length non-zero number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1000000000000').operatorLessThanEqual(BigInt('1000000000001'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6400
     * @tc.name testBigIntOperatorLessThanEqual2Test6400
     * @tc.desc operatorLessThanEqual same-first-digit mid-all-zero less than mid-all-nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1000000000001').operatorLessThanEqual(BigInt('1999999999999'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6500
     * @tc.name testBigIntOperatorLessThanEqual2Test6500
     * @tc.desc operatorLessThanEqual 30-digit negative numbers differing only in most significant digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-223456789012345678901234567890').operatorLessThanEqual(BigInt('-123456789012345678901234567890'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_6600
     * @tc.name testBigIntOperatorLessThanEqual2Test6600
     * @tc.desc operatorLessThanEqual symmetric large negative less than positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqual2Test6600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9999999999999999999').operatorLessThanEqual(BigInt('9999999999999999999'))).assertTrue();
    });
  });
}
