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

export default function BigIntConstructorIntegral2Test(): void {
  describe('testBigIntConstructorIntegral2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0100
     * @tc.name testBigIntConstructorIntegral2Test0100
     * @tc.desc long intermediate values toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zeroLong: long = 0;
      const oneLong: long = 1;
      const negOneLong: long = -1;

      expect(BigInt(zeroLong).toString()).assertEqual('0');
      expect(BigInt(oneLong).toString()).assertEqual('1');
      expect(BigInt(negOneLong).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0200
     * @tc.name testBigIntConstructorIntegral2Test0200
     * @tc.desc long mid-range values toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const midLong: long = 65535;
      const negMidLong: long = -65535;

      expect(BigInt(midLong).toString()).assertEqual('65535');
      expect(BigInt(negMidLong).toString()).assertEqual('-65535');
      expect(BigInt(midLong).equals(BigInt(negMidLong))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0300
     * @tc.name testBigIntConstructorIntegral2Test0300
     * @tc.desc byte constructed BigInt increment/decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 42;

      expect(BigInt(b).operatorIncrement().toString()).assertEqual('43');
      expect(BigInt(b).operatorDecrement().toString()).assertEqual('41');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0400
     * @tc.name testBigIntConstructorIntegral2Test0400
     * @tc.desc byte constructed BigInt add/subtract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 10;

      expect(BigInt(b).operatorAdd(BigInt(5)).toString()).assertEqual('15');
      expect(BigInt(b).operatorSubtract(BigInt(20)).toString()).assertEqual('-10');
      expect(BigInt(b).operatorAdd(BigInt(b)).toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0500
     * @tc.name testBigIntConstructorIntegral2Test0500
     * @tc.desc byte constructed BigInt multiply/divide/modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 100;

      expect(BigInt(b).operatorMultiply(BigInt(3)).toString()).assertEqual('300');
      expect(BigInt(b).operatorDivide(BigInt(7)).toString()).assertEqual('14');
      expect(BigInt(b).operatorModule(BigInt(7)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0600
     * @tc.name testBigIntConstructorIntegral2Test0600
     * @tc.desc byte constructed BigInt bitwise AND/OR/XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 0b1100;
      const mask: byte = 0b1010;

      expect(BigInt(b).operatorBitwiseAnd(BigInt(mask)).toString()).assertEqual('8');
      expect(BigInt(b).operatorBitwiseOr(BigInt(mask)).toString()).assertEqual('14');
      expect(BigInt(b).operatorBitwiseXor(BigInt(mask)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0700
     * @tc.name testBigIntConstructorIntegral2Test0700
     * @tc.desc byte constructed BigInt left/right shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 8;
      const shift: byte = 2;

      expect(BigInt(b).operatorLeftShift(BigInt(shift)).toString()).assertEqual('32');
      expect(BigInt(b).operatorRightShift(BigInt(shift)).toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0800
     * @tc.name testBigIntConstructorIntegral2Test0800
     * @tc.desc byte constructed BigInt negate and bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const pos: byte = 50;
      const neg: byte = -50;

      expect(BigInt(pos).negate().toString()).assertEqual('-50');
      expect(BigInt(neg).negate().toString()).assertEqual('50');
      expect(BigInt(pos).operatorBitwiseNot().toString()).assertEqual('-51');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_0900
     * @tc.name testBigIntConstructorIntegral2Test0900
     * @tc.desc short constructed BigInt arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: short = 1000;

      expect(BigInt(s).operatorAdd(BigInt(25000)).toString()).assertEqual('26000');
      expect(BigInt(s).operatorSubtract(BigInt(2000)).toString()).assertEqual('-1000');
      expect(BigInt(s).operatorMultiply(BigInt(10)).toString()).assertEqual('10000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1000
     * @tc.name testBigIntConstructorIntegral2Test1000
     * @tc.desc short constructed BigInt bitwise AND/OR/XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: short = 255;
      const mask: short = 15;

      expect(BigInt(s).operatorBitwiseAnd(BigInt(mask)).toString()).assertEqual('15');
      expect(BigInt(s).operatorBitwiseOr(BigInt(mask)).toString()).assertEqual('255');
      expect(BigInt(s).operatorBitwiseXor(BigInt(mask)).toString()).assertEqual('240');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1100
     * @tc.name testBigIntConstructorIntegral2Test1100
     * @tc.desc short constructed BigInt left/right shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: short = 1024;
      const shift: short = 2;

      expect(BigInt(s).operatorLeftShift(BigInt(shift)).toString()).assertEqual('4096');
      expect(BigInt(s).operatorRightShift(BigInt(shift)).toString()).assertEqual('256');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1200
     * @tc.name testBigIntConstructorIntegral2Test1200
     * @tc.desc short constructed BigInt negate/bitwise NOT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: short = 32767;

      expect(BigInt(s).negate().toString()).assertEqual('-32767');
      expect(BigInt(s).operatorBitwiseNot().toString()).assertEqual('-32768');
      expect(BigInt(s).negate().operatorBitwiseNot().toString()).assertEqual('32766');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1300
     * @tc.name testBigIntConstructorIntegral2Test1300
     * @tc.desc int constructed BigInt add/sub/mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 1000000;

      expect(BigInt(i).operatorAdd(BigInt(2000000)).toString()).assertEqual('3000000');
      expect(BigInt(i).operatorSubtract(BigInt(500000)).toString()).assertEqual('500000');
      expect(BigInt(i).operatorMultiply(BigInt(1000)).toString()).assertEqual('1000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1400
     * @tc.name testBigIntConstructorIntegral2Test1400
     * @tc.desc int constructed BigInt arithmetic beyond int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxInt: int = 2147483647;
      const minInt: int = -2147483648;

      expect(BigInt(maxInt).operatorAdd(BigInt(1)).toString()).assertEqual('2147483648');
      expect(BigInt(minInt).operatorSubtract(BigInt(1)).toString()).assertEqual('-2147483649');
      expect(BigInt(maxInt).operatorMultiply(BigInt(2)).toString()).assertEqual('4294967294');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1500
     * @tc.name testBigIntConstructorIntegral2Test1500
     * @tc.desc int constructed BigInt divide/modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 2147483647;

      expect(BigInt(i).operatorDivide(BigInt(1000000)).toString()).assertEqual('2147');
      expect(BigInt(i).operatorModule(BigInt(1000000)).toString()).assertEqual('483647');
      expect(BigInt(i).operatorDivide(BigInt(1)).toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1600
     * @tc.name testBigIntConstructorIntegral2Test1600
     * @tc.desc int constructed BigInt bitwise AND/OR/XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = -1;
      expect(BigInt(i).operatorBitwiseAnd(BigInt(65535)).toString()).assertEqual('65535');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_
     * @tc.name testBigIntConstructorIntegral2Test
     * @tc.desc int bitwise OR/XOR with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: int = 0xFF00;
      const b: int = 0x0FF0;

      expect(BigInt(a).operatorBitwiseOr(BigInt(b)).toString()).assertEqual('65520');
      expect(BigInt(a).operatorBitwiseXor(BigInt(b)).toString()).assertEqual('61680');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1800
     * @tc.name testBigIntConstructorIntegral2Test1800
     * @tc.desc int constructed BigInt shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 1;

      expect(BigInt(i).operatorLeftShift(BigInt(31)).toString()).assertEqual('2147483648');
      expect(BigInt(i).operatorLeftShift(BigInt(63)).toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_1900
     * @tc.name testBigIntConstructorIntegral2Test1900
     * @tc.desc int constructed BigInt bitwise NOT and negate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 2147483647;

      expect(BigInt(i).negate().toString()).assertEqual('-2147483647');
      expect(BigInt(i).operatorBitwiseNot().toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2000
     * @tc.name testBigIntConstructorIntegral2Test2000
     * @tc.desc long constructed BigInt add/sub/mul
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const l: long = 1000000000000;

      expect(BigInt(l).operatorAdd(BigInt(l)).toString()).assertEqual('2000000000000');
      expect(BigInt(l).operatorSubtract(BigInt(1)).toString()).assertEqual('999999999999');
      expect(BigInt(l).operatorMultiply(BigInt(2)).toString()).assertEqual('2000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2100
     * @tc.name testBigIntConstructorIntegral2Test2100
     * @tc.desc long constructed BigInt divide/modulo with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxLong: long = 9223372036854775807;

      expect(BigInt(maxLong).operatorDivide(BigInt(2)).toString()).assertEqual('4611686018427387903');
      expect(BigInt(maxLong).operatorModule(BigInt(2)).toString()).assertEqual('1');
      expect(BigInt(maxLong).operatorDivide(BigInt(1)).toString()).assertEqual('9223372036854775807');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2200
     * @tc.name testBigIntConstructorIntegral2Test2200
     * @tc.desc long constructed BigInt bitwise AND/OR/XOR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: long = 0xFFFFFFFF;

      expect(BigInt(a).operatorBitwiseAnd(BigInt(0xFFFF)).toString()).assertEqual('65535');
      expect(BigInt(a).operatorBitwiseOr(BigInt(0xFFFF0000)).toString()).assertEqual('4294967295');
      expect(BigInt(a).operatorBitwiseXor(BigInt(a)).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2300
     * @tc.name testBigIntConstructorIntegral2Test2300
     * @tc.desc long BigInt shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const l: long = 1;

      expect(BigInt(l).operatorLeftShift(BigInt(32)).toString()).assertEqual('4294967296');
      expect(BigInt(l).operatorLeftShift(BigInt(62)).toString()).assertEqual('4611686018427387904');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2400
     * @tc.name testBigIntConstructorIntegral2Test2400
     * @tc.desc long constructed BigInt bitwise NOT and negate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const l: long = 9223372036854775807;

      expect(BigInt(l).negate().toString()).assertEqual('-9223372036854775807');
      expect(BigInt(l).operatorBitwiseNot().toString()).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2500
     * @tc.name testBigIntConstructorIntegral2Test2500
     * @tc.desc byte constructed BigInt comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const small: byte = 10;
      const large: byte = 100;

      expect(BigInt(large).operatorGreaterThan(BigInt(small))).assertTrue();
      expect(BigInt(small).operatorLessThan(BigInt(large))).assertTrue();
      expect(BigInt(small).operatorGreaterThanEqual(BigInt(small))).assertTrue();
      expect(BigInt(small).operatorLessThanEqual(BigInt(small))).assertTrue();
      expect(BigInt(small).equals(BigInt(small))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2600
     * @tc.name testBigIntConstructorIntegral2Test2600
     * @tc.desc int boundary constructed BigInt comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxInt: int = 2147483647;
      const minInt: int = -2147483648;
      const zero: int = 0;

      expect(BigInt(maxInt).operatorGreaterThan(BigInt(zero))).assertTrue();
      expect(BigInt(minInt).operatorLessThan(BigInt(zero))).assertTrue();
      expect(BigInt(maxInt).operatorGreaterThan(BigInt(minInt))).assertTrue();
      expect(BigInt(zero).equals(BigInt(zero))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2700
     * @tc.name testBigIntConstructorIntegral2Test2700
     * @tc.desc long boundary constructed BigInt comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxLong: long = 9223372036854775807;
      const minLong: long = -9223372036854775808;

      expect(BigInt(maxLong).operatorGreaterThan(BigInt(minLong))).assertTrue();
      expect(BigInt(minLong).operatorLessThan(BigInt(maxLong))).assertTrue();
      expect(BigInt(maxLong).operatorGreaterThanEqual(BigInt(maxLong))).assertTrue();
      expect(BigInt(minLong).operatorLessThanEqual(BigInt(minLong))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2800
     * @tc.name testBigIntConstructorIntegral2Test2800
     * @tc.desc same value from different integral types equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 42;
      const s: short = 42;
      const i: int = 42;
      const l: long = 42;

      expect(BigInt(b).equals(BigInt(s))).assertTrue();
      expect(BigInt(b).equals(BigInt(i))).assertTrue();
      expect(BigInt(b).equals(BigInt(l))).assertTrue();
      expect(BigInt(s).equals(BigInt(i))).assertTrue();
      expect(BigInt(s).equals(BigInt(l))).assertTrue();
      expect(BigInt(i).equals(BigInt(l))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_2900
     * @tc.name testBigIntConstructorIntegral2Test2900
     * @tc.desc zero from different integral types equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 0;
      const s: short = 0;
      const i: int = 0;
      const l: long = 0;

      expect(BigInt(b).equals(BigInt(s))).assertTrue();
      expect(BigInt(b).equals(BigInt(i))).assertTrue();
      expect(BigInt(b).equals(BigInt(l))).assertTrue();
      expect(BigInt(i).positive()).assertTrue();
      expect(BigInt(i).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3000
     * @tc.name testBigIntConstructorIntegral2Test3000
     * @tc.desc negative one from different integral types equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = -1;
      const s: short = -1;
      const i: int = -1;
      const l: long = -1;

      expect(BigInt(b).equals(BigInt(s))).assertTrue();
      expect(BigInt(b).equals(BigInt(i))).assertTrue();
      expect(BigInt(b).equals(BigInt(l))).assertTrue();
      expect(BigInt(i).negative()).assertTrue();
      expect(BigInt(i).positive()).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3100
     * @tc.name testBigIntConstructorIntegral2Test3100
     * @tc.desc byte constructed BigInt getLong round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 127;
      const result: long = BigInt(b).getLong();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3200
     * @tc.name testBigIntConstructorIntegral2Test3200
     * @tc.desc short constructed BigInt getLong round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: short = 32767;
      const result: long = BigInt(s).getLong();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3300
     * @tc.name testBigIntConstructorIntegral2Test3300
     * @tc.desc int constructed BigInt getLong round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 2147483647;
      const result: long = BigInt(i).getLong();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3400
     * @tc.name testBigIntConstructorIntegral2Test3400
     * @tc.desc long constructed BigInt getLong round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const l: long = 9223372036854775807;
      const result: long = BigInt(l).getLong();
      expect(result).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3500
     * @tc.name testBigIntConstructorIntegral2Test3500
     * @tc.desc negative integral constructed BigInt getLong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = -128;
      const i: int = -2147483648;
      const result1: long = BigInt(b).getLong();
      const result2: long = BigInt(i).getLong();

      expect(result1).assertEqual(-128);
      expect(result2).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3600
     * @tc.name testBigIntConstructorIntegral2Test3600
     * @tc.desc valueOf across integral types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 42;
      const i: int = 999;
      const l: long = 65535;

      expect(BigInt(b).valueOf().toString()).assertEqual('42');
      expect(BigInt(i).valueOf().toString()).assertEqual('999');
      expect(BigInt(l).valueOf().toString()).assertEqual('65535');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3700
     * @tc.name testBigIntConstructorIntegral2Test3700
     * @tc.desc positive/negative methods across integral types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const posByte: byte = 5;
      const negByte: byte = -5;
      const posInt: int = 100;
      const negInt: int = -100;

      expect(BigInt(posByte).positive()).assertTrue();
      expect(BigInt(posByte).negative()).assertFalse();
      expect(BigInt(negByte).positive()).assertFalse();
      expect(BigInt(negByte).negative()).assertTrue();
      expect(BigInt(posInt).positive()).assertTrue();
      expect(BigInt(posInt).negative()).assertFalse();
      expect(BigInt(negInt).positive()).assertFalse();
      expect(BigInt(negInt).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3800
     * @tc.name testBigIntConstructorIntegral2Test3800
     * @tc.desc pow with byte-constructed BigInt base
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base: byte = 2;
      const exp: byte = 10;

      expect(BigInt(base).pow(BigInt(exp)).toString()).assertEqual('1024');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_3900
     * @tc.name testBigIntConstructorIntegral2Test3900
     * @tc.desc pow with int-constructed BigInt base beyond int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base: int = 10;
      const exp: int = 18;

      expect(BigInt(base).pow(BigInt(exp)).toString()).assertEqual('1000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4000
     * @tc.name testBigIntConstructorIntegral2Test4000
     * @tc.desc pow with long-constructed BigInt base exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const base: long = 3;
      const exp: long = 20;
      expect(BigInt(base).pow(BigInt(exp)).toString()).assertEqual('3486784401');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4100
     * @tc.name testBigIntConstructorIntegral2Test4100
     * @tc.desc fromULong vs signed integral constructed equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 100;
      const l: long = 100;

      expect(BigInt.fromULong(100).equals(BigInt(i))).assertTrue();
      expect(BigInt.fromULong(100).equals(BigInt(l))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4200
     * @tc.name testBigIntConstructorIntegral2Test4200
     * @tc.desc byte constructed BigInt toString with radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 127;

      expect(BigInt(b).toString(16)).assertEqual('7f');
      expect(BigInt(b).toString(2)).assertEqual('1111111');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4300
     * @tc.name testBigIntConstructorIntegral2Test4300
     * @tc.desc short constructed BigInt toString with radix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: short = 255;

      expect(BigInt(s).toString(16)).assertEqual('ff');
      expect(BigInt(s).toString(2)).assertEqual('11111111');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4400
     * @tc.name testBigIntConstructorIntegral2Test4400
     * @tc.desc int constructed BigInt toString with radix at boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 2147483647;

      expect(BigInt(i).toString(16)).assertEqual('7fffffff');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4500
     * @tc.name testBigIntConstructorIntegral2Test4500
     * @tc.desc asIntN with byte-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 127;

      expect(BigInt.asIntN(8, BigInt(b)).toString()).assertEqual('127');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4600
     * @tc.name testBigIntConstructorIntegral2Test4600
     * @tc.desc asUintN with int-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = -1;

      expect(BigInt.asUintN(32, BigInt(i)).toString()).assertEqual('4294967295');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4700
     * @tc.name testBigIntConstructorIntegral2Test4700
     * @tc.desc asIntN with long-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const l: long = 9223372036854775807;

      expect(BigInt.asIntN(64, BigInt(l)).equals(BigInt(l))).assertTrue();
      expect(BigInt.asIntN(32, BigInt(l)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4800
     * @tc.name testBigIntConstructorIntegral2Test4800
     * @tc.desc addition between different integral types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 100;
      const i: int = 2000000;

      expect(BigInt(b).operatorAdd(BigInt(i)).toString()).assertEqual('2000100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_4900
     * @tc.name testBigIntConstructorIntegral2Test4900
     * @tc.desc comparison between different integral types same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const b: byte = 100;
      const i: int = 100;
      const l: long = 100;

      expect(BigInt(b).operatorGreaterThanEqual(BigInt(i))).assertTrue();
      expect(BigInt(b).operatorLessThanEqual(BigInt(l))).assertTrue();
      expect(BigInt(i).operatorGreaterThan(BigInt(b))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_5000
     * @tc.name testBigIntConstructorIntegral2Test5000
     * @tc.desc right shift with mixed integral types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test5000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 256;
      const shift: byte = 4;

      expect(BigInt(i).operatorRightShift(BigInt(shift)).toString()).assertEqual('16');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_5100
     * @tc.name testBigIntConstructorIntegral2Test5100
     * @tc.desc getULong from integral constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const i: int = 1000;
      const l: long = 1000;

      expect(BigInt(i).getULong()).assertEqual(1000);
      expect(BigInt(l).getULong()).assertEqual(1000);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_5200
     * @tc.name testBigIntConstructorIntegral2Test5200
     * @tc.desc byte max increment beyond byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test5200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const maxByte: byte = 127;

      expect(BigInt(maxByte).operatorIncrement().toString()).assertEqual('128');
      expect(BigInt(maxByte).operatorAdd(BigInt(1)).toString()).assertEqual('128');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_5300
     * @tc.name testBigIntConstructorIntegral2Test5300
     * @tc.desc byte min decrement beyond byte range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test5300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const minByte: byte = -128;

      expect(BigInt(minByte).operatorDecrement().toString()).assertEqual('-129');
      expect(BigInt(minByte).operatorSubtract(BigInt(1)).toString()).assertEqual('-129');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_5400
     * @tc.name testBigIntConstructorIntegral2Test5400
     * @tc.desc negate int min boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test5400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const minInt: int = -2147483648;

      expect(BigInt(minInt).negate().toString()).assertEqual('2147483648');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_INTEGRAL_5500
     * @tc.name testBigIntConstructorIntegral2Test5500
     * @tc.desc negate long min boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorIntegral2Test5500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const minLong: long = -9223372036854775808;

      expect(BigInt(minLong).negate().toString()).assertEqual('9223372036854775808');
    });

  });
}
