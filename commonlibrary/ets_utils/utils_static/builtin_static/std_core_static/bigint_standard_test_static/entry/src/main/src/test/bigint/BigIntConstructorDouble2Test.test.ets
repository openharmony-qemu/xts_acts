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

export default function BigIntConstructorDouble2Test(): void {
  describe('testBigIntConstructorDouble2Test', () => {


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0100
     * @tc.name testBigIntConstructorDouble2Test0100
     * @tc.desc Negation of double-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42.0).negate().toString()).assertEqual('-42');
      expect(BigInt(-42.0).negate().toString()).assertEqual('42');
      expect(BigInt(0.0).negate().toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0200
     * @tc.name testBigIntConstructorDouble2Test0200
     * @tc.desc positive/negative for double-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1.0).positive()).assertTrue();
      expect(BigInt(1.0).negative()).assertFalse();
      expect(BigInt(-1.0).positive()).assertFalse();
      expect(BigInt(-1.0).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0300
     * @tc.name testBigIntConstructorDouble2Test0300
     * @tc.desc asIntN truncation of double-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(255.0)).toString()).assertEqual('-1');
      expect(BigInt.asIntN(16, BigInt(-1.0)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0400
     * @tc.name testBigIntConstructorDouble2Test0400
     * @tc.desc asUintN truncation of double-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(255.0)).toString()).assertEqual('255');
      expect(BigInt.asUintN(8, BigInt(-1.0)).toString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0500
     * @tc.name testBigIntConstructorDouble2Test0500
     * @tc.desc Bitwise ops on double-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(12.0).operatorBitwiseAnd(BigInt(10.0)).toString()).assertEqual('8');
      expect(BigInt(12.0).operatorBitwiseOr(BigInt(10.0)).toString()).assertEqual('14');
      expect(BigInt(12.0).operatorBitwiseXor(BigInt(10.0)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0600
     * @tc.name testBigIntConstructorDouble2Test0600
     * @tc.desc Copy constructor preserves double-constructed BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src = BigInt(9007199254740992.0);
      const copy = BigInt(src);
      expect(copy.equals(src)).assertTrue();
      expect(copy.toString()).assertEqual('9007199254740992');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0700
     * @tc.name testBigIntConstructorDouble2Test0700
     * @tc.desc valueOf/getLong on double-constructed BigInt at safe integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bi = BigInt(123456789.0);
      expect(bi.valueOf().equals(BigInt(bi))).assertTrue();
      expect(bi.getLong()).assertEqual(123456789);
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0800
     * @tc.name testBigIntConstructorDouble2Test0800
     * @tc.desc pow with double-constructed base and exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2.0).pow(BigInt(10.0)).toString()).assertEqual('1024');
      expect(BigInt(10.0).pow(BigInt(3.0)).toString()).assertEqual('1000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0900
     * @tc.name testBigIntConstructorDouble2Test0900
     * @tc.desc TP11+13: Math.round(5.5) as double constructs 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Math.round(5.5)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1000
     * @tc.name testBigIntConstructorDouble2Test1000
     * @tc.desc TP1: Multiple long-adjacent double literals all converge to same BigInt (ULP=1024 at 2^63)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854775806.0).equals(BigInt(9223372036854775808.0))).assertTrue();
      expect(BigInt(-9223372036854775806.0).equals(BigInt(-9223372036854775808.0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1100
     * @tc.name testBigIntConstructorDouble2Test1100
     * @tc.desc TP1: Value far enough below 2^63 retains distinct representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9223372036854774784.0).toString()).assertEqual('9223372036854774784');
      expect(BigInt(-9223372036854774784.0).toString()).assertEqual('-9223372036854774784');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1200
     * @tc.name testBigIntConstructorDouble2Test1200
     * @tc.desc TP2: Odd beyond safe int rounds to nearest even: 9007199254740993.0 → 9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9007199254740993.0).toString()).assertEqual('9007199254740992');
      expect(BigInt(9007199254740995.0).toString()).assertEqual('9007199254740996');

    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1300
     * @tc.name testBigIntConstructorDouble2Test1300
     * @tc.desc TP2: Negative odd beyond safe int rounds: -9007199254740993.0 → -9007199254740992
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-9007199254740993.0).toString()).assertEqual('-9007199254740992');
      expect(BigInt(-9007199254740995.0).toString()).assertEqual('-9007199254740996');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1400
     * @tc.name testBigIntConstructorDouble2Test1400
     * @tc.desc TP13: Number.MIN_SAFE_INTEGER constant constructs correct BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Number.MIN_SAFE_INTEGER).toString()).assertEqual('-9007199254740991');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1500
     * @tc.name testBigIntConstructorDouble2Test1500
     * @tc.desc TP13: Number.MAX_SAFE_INTEGER constant constructs correct BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Number.MAX_SAFE_INTEGER).toString()).assertEqual('9007199254740991');
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1600
     * @tc.name testBigIntConstructorDouble2Test1600
     * @tc.desc TP3: 2^16 = 65536 as double constructs correct BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(65536.0).toString()).assertEqual('65536');
      expect(BigInt(65536.0).equals(BigInt(1).operatorLeftShift(BigInt(16)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1700
     * @tc.name testBigIntConstructorDouble2Test1700
     * @tc.desc TP3: 2^31 = 2147483648 as double constructs correct BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483648.0).toString()).assertEqual('2147483648');
      expect(BigInt(2147483648.0).equals(BigInt(2).pow(BigInt(31)))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1800
     * @tc.name testBigIntConstructorDouble2Test1800
     * @tc.desc TP3: 2^52 = 4503599627370496 as double constructs correct BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(4503599627370496.0).toString()).assertEqual('4503599627370496');
      expect(BigInt(4503599627370496.0).equals(BigInt(2).pow(BigInt(52)))).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_1900
     * @tc.name testBigIntConstructorDouble2Test1900
     * @tc.desc TP4: -9007199254740991.5 rounds to -9007199254740992 due to IEEE 754 round-to-nearest-even at 2^53 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-9007199254740991.5).toString()).assertEqual('-9007199254740992');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2000
     * @tc.name testBigIntConstructorDouble2Test2000
     * @tc.desc TP4: Negative pi-like -3.14 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(-3.14);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2100
     * @tc.name testBigIntConstructorDouble2Test2100
     * @tc.desc TP5: -Number.MIN_VALUE is non-integer, throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(-Number.MIN_VALUE);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2200
     * @tc.name testBigIntConstructorDouble2Test2200
     * @tc.desc TP5: -Number.EPSILON is non-integer, throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(-Number.EPSILON);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2300
     * @tc.name testBigIntConstructorDouble2Test2300
     * @tc.desc TP12: int32 max as double constructs 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647.0).toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2400
     * @tc.name testBigIntConstructorDouble2Test2400
     * @tc.desc TP12: int32 min as double constructs -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2147483648.0).toString()).assertEqual('-2147483648');
    });
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2500
     * @tc.name testBigIntConstructorDouble2Test2500
     * @tc.desc TP6: Tiny non-integer 0.0000000000001 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        BigInt(0.0000000000001);
      }).assertThrowError('RangeError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2600
     * @tc.name testBigIntConstructorDouble2Test2600
     * @tc.desc TP7 constructed from double returns BigInt type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(42.0) as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2700
     * @tc.name testBigIntConstructorDouble2Test2700
     * @tc.desc TP8: Large negative double BigInt(-9007199254740992.0) is negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-9007199254740992.0).positive()).assertFalse();
      expect(BigInt(-9007199254740992.0).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2800
     * @tc.name testBigIntConstructorDouble2Test2800
     * @tc.desc TP9: Double-constructed at max safe integer equals string-constructed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(9007199254740991.0).equals(BigInt('9007199254740991'))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_2900
     * @tc.name testBigIntConstructorDouble2Test2900
     * @tc.desc TP9: Double-constructed (0.0/1.0) equals boolean-constructed (false/true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0.0).equals(BigInt(false))).assertTrue();
      expect(BigInt(1.0).equals(BigInt(true))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_3000
     * @tc.name testBigIntConstructorDouble2Test3000
     * @tc.desc TP10: Small safe int round-trip → Number → BigInt preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(42);
      const viaDouble = BigInt(Number(original.valueOf()));
      expect(viaDouble.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_3100
     * @tc.name testBigIntConstructorDouble2Test3100
     * @tc.desc TP10: MAX_SAFE_INTEGER round-trip → Number → BigInt preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(Number.MAX_SAFE_INTEGER);
      const viaDouble = BigInt(Number(original.valueOf()));
      expect(viaDouble.equals(original)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_3200
     * @tc.name testBigIntConstructorDouble2Test3200
     * @tc.desc TP11: Math.pow(2.0, 20.0) result as double constructs 1048576
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Math.pow(2.0, 20.0)).toString()).assertEqual('1048576');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_3300
     * @tc.name testBigIntConstructorDouble2Test3300
     * @tc.desc TP11: Math.abs(-100.0) result as double constructs 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Math.abs(-100.0)).toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_3400
     * @tc.name testBigIntConstructorDouble2Test3400
     * @tc.desc TP11: Math.floor(99.9) result as double constructs 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Math.floor(99.9)).toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_3500
     * @tc.name testBigIntConstructorDouble2Test3500
     * @tc.desc TP11: Math.ceil(5.2) result as double constructs 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDouble2Test3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(Math.ceil(5.2)).toString()).assertEqual('6');
    });

  });
}
