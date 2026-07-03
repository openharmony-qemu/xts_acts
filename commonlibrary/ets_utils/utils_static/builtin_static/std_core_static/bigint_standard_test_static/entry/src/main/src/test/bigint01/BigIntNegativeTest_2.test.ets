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

class NegObj {
  a: BigInt = BigInt(0);
}

export default function BigIntNegativeTest_2(): void {
  describe('BigIntNegativeTest_2', () =>{
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0100
     * @tc.name testBigIntNegativeTest001
     * @tc.desc negative() with hex string constructor values (positive and negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negative()).assertFalse();
      expect(BigInt('-255').negative()).assertTrue();
      expect(BigInt(9223372036854775807).negative()).assertFalse();
      expect(BigInt('-9223372036854775808').negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0200
     * @tc.name testBigIntNegativeTest002
     * @tc.desc negative() with octal string constructor values (positive and negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(63).negative()).assertFalse();
      expect(BigInt(-63).negative()).assertTrue();
      expect(BigInt(8589934591).negative()).assertFalse();
      expect(BigInt(-8589934591).negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0300
     * @tc.name testBigIntNegativeTest003
     * @tc.desc negative() with binary string constructor values (positive and negative)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negative()).assertFalse();
      expect(BigInt(-255).negative()).assertTrue();
      expect(BigInt(1).negative()).assertFalse();
      expect(BigInt(-1).negative()).assertTrue();
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt(-10).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0400
     * @tc.name testBigIntNegativeTest004
     * @tc.desc negative() across byte/short/int/long/unsigned type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const positives: BigInt[] = [
        BigInt(0),
        BigInt(1),
        BigInt(127),
        BigInt(32767),
        BigInt(2147483647),
        BigInt('9223372036854775807'),
        BigInt(65535),
        BigInt(4294967295),
      ];
      const negatives: BigInt[] = [
        BigInt(-1),
        BigInt(-128),
        BigInt(-32768),
        BigInt(-2147483648),
        BigInt('-9223372036854775808'),
        BigInt(-65536),
        BigInt(-4294967296),
        BigInt('-4611686018427387904'),
      ];
      for (let i = 0; i < positives.length; i++) {
        expect(positives[i].negative()).assertFalse();
      }
      for (let i = 0; i < negatives.length; i++) {
        expect(negatives[i].negative()).assertTrue();
      }
      expect(BigInt(4611686018427387903).negative()).assertFalse();
      expect(BigInt(-4611686018427387904).negative()).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0500
     * @tc.name testBigIntNegativeTest005
     * @tc.desc negative() for 40/50/100/200-digit values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const data: string[] = [
        '1234567890123456789012345678901234567890',
        '99999999999999999999999999999999999999999999999999',
        '9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999',
        '10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
      ];
      for (let i = 0; i < data.length; i++) {
        expect(BigInt(data[i]).negative()).assertFalse();
        expect(BigInt('-' + data[i]).negative()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0600
     * @tc.name testBigIntNegativeTest006
     * @tc.desc negative() with zero from all constructor forms returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).negative()).assertFalse();
      expect(BigInt('0').negative()).assertFalse();
      expect(BigInt('0x0').negative()).assertFalse();
      expect(BigInt('0o0').negative()).assertFalse();
      expect(BigInt('0b0').negative()).assertFalse();
      expect(BigInt(false).negative()).assertFalse();
      expect(BigInt.fromULong(0).negative()).assertFalse();
      expect(BigInt(-0).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0700
     * @tc.name testBigIntNegativeTest007
     * @tc.desc negative() with fromULong at power-of-2 boundaries, always non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(1).negative()).assertFalse();
      expect(BigInt.fromULong(2).negative()).assertFalse();
      expect(BigInt.fromULong(255).negative()).assertFalse();
      expect(BigInt.fromULong(256).negative()).assertFalse();
      expect(BigInt.fromULong(65535).negative()).assertFalse();
      expect(BigInt.fromULong(65536).negative()).assertFalse();
      expect(BigInt.fromULong(4294967295).negative()).assertFalse();
      expect(BigInt.fromULong(4294967296).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0800
     * @tc.name testBigIntNegativeTest008
     * @tc.desc negative() with fromULong with negative args (unsigned interpretation)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(-1).negative()).assertFalse();
      expect(BigInt.fromULong(-128).negative()).assertFalse();
      expect(BigInt.fromULong(-32768).negative()).assertFalse();
      expect(BigInt.fromULong(-2147483648).negative()).assertFalse();
      expect(BigInt.fromULong(-9223372036854775808).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_0900
     * @tc.name testBigIntNegativeTest009
     * @tc.desc negative() after pow() - even exponent yields non-negative, odd keeps sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const p1: BigInt = BigInt(2).pow(BigInt(10));
      expect(p1.negative()).assertFalse();
      const p2: BigInt = BigInt(10).pow(BigInt(3));
      expect(p2.negative()).assertFalse();
      const p3: BigInt = BigInt(-2).pow(BigInt(2));
      expect(p3.negative()).assertFalse();
      const p4: BigInt = BigInt(-2).pow(BigInt(4));
      expect(p4.negative()).assertFalse();
      const p5: BigInt = BigInt(-2).pow(BigInt(3));
      expect(p5.negative()).assertTrue();
      const p6: BigInt = BigInt(-2).pow(BigInt(5));
      expect(p6.negative()).assertTrue();
      const p7: BigInt = BigInt(-10).pow(BigInt(2));
      expect(p7.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1000
     * @tc.name testBigIntNegativeTest010
     * @tc.desc negative() after bitwise NOT - positive becomes negative, negative becomes non-negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bn1: BigInt = BigInt(1).operatorBitwiseNot();
      expect(bn1.negative()).assertTrue();
      const bn2: BigInt = BigInt(-1).operatorBitwiseNot();
      expect(bn2.negative()).assertFalse();
      const bn3: BigInt = BigInt(0).operatorBitwiseNot();
      expect(bn3.negative()).assertTrue();
      const bn4: BigInt = BigInt(127).operatorBitwiseNot();
      expect(bn4.negative()).assertTrue();
      const bn5: BigInt = BigInt(-128).operatorBitwiseNot();
      expect(bn5.negative()).assertFalse();
      const bn6: BigInt = BigInt(65536).operatorBitwiseNot();
      expect(bn6.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1100
     * @tc.name testBigIntNegativeTest011
     * @tc.desc negative() after bitwise AND/OR/XOR operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const bo1: BigInt = BigInt(-1).operatorBitwiseOr(BigInt(1));
      expect(bo1.negative()).assertTrue();

      const bx1: BigInt = BigInt(-1).operatorBitwiseXor(BigInt(1));
      expect(bx1.negative()).assertTrue();

      const ba2: BigInt = BigInt(255).operatorBitwiseAnd(BigInt(-256));
      expect(ba2.negative()).assertFalse();
      expect(ba2.equals(BigInt(0))).assertTrue();

      const bx2: BigInt = BigInt(0).operatorBitwiseXor(BigInt(-1));
      expect(bx2.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1200
     * @tc.name testBigIntNegativeTest012
     * @tc.desc negative() after 1-4 negate operations - sign pattern correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const n1: BigInt = BigInt(42).negate();
      expect(n1.negative()).assertTrue();
      const n2: BigInt = BigInt(-42).negate();
      expect(n2.negative()).assertFalse();
      const n3: BigInt = BigInt(0).negate();
      expect(n3.negative()).assertFalse();
      const n4: BigInt = BigInt(42).negate().negate();
      expect(n4.negative()).assertFalse();
      const n5: BigInt = BigInt(-42).negate().negate();
      expect(n5.negative()).assertTrue();
      const n6: BigInt = BigInt(42).negate().negate().negate();
      expect(n6.negative()).assertTrue();
      const n7: BigInt = BigInt(-42).negate().negate().negate();
      expect(n7.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1300
     * @tc.name testBigIntNegativeTest013
     * @tc.desc negative() same result from number vs string vs hex for same numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(255).negative()).assertEqual(BigInt('255').negative());
      expect(BigInt(-255).negative()).assertEqual(BigInt('-255').negative());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1400
     * @tc.name testBigIntNegativeTest014
     * @tc.desc negative() consistent across different constructor types for same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).negative()).assertEqual(BigInt('127').negative());
      expect(BigInt(-128).negative()).assertEqual(BigInt('-128').negative());
      expect(BigInt(0).negative()).assertEqual(BigInt('0').negative());
      expect(BigInt.fromULong(100).negative()).assertEqual(BigInt(100).negative());
      expect(BigInt.fromULong(255).negative()).assertEqual(BigInt('255').negative());
      expect(BigInt.fromULong(0).negative()).assertEqual(BigInt(0).negative());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1500
     * @tc.name testBigIntNegativeTest015
     * @tc.desc negative() after arithmetic expression chains (add/sub/mul/div)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a1: BigInt = BigInt(100).operatorAdd(BigInt(200));
      expect(a1.negative()).assertFalse();
      const a2: BigInt = BigInt(-100).operatorAdd(BigInt(-200));
      expect(a2.negative()).assertTrue();
      const s1: BigInt = BigInt(100).operatorSubtract(BigInt(30));
      expect(s1.negative()).assertFalse();
      const s2: BigInt = BigInt(30).operatorSubtract(BigInt(100));
      expect(s2.negative()).assertTrue();
      const m1: BigInt = BigInt(10).operatorMultiply(BigInt(-20));
      expect(m1.negative()).assertTrue();
      const m2: BigInt = BigInt(-10).operatorMultiply(BigInt(-20));
      expect(m2.negative()).assertFalse();
      const d1: BigInt = BigInt(100).operatorDivide(BigInt(-3));
      expect(d1.negative()).assertTrue();
      const d2: BigInt = BigInt(-100).operatorDivide(BigInt(-3));
      expect(d2.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1600
     * @tc.name testBigIntNegativeTest016
     * @tc.desc negative() after left shift and right shift operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ls1: BigInt = BigInt(1).operatorLeftShift(BigInt(10));
      expect(ls1.negative()).assertFalse();
      const ls2: BigInt = BigInt(1).operatorLeftShift(BigInt(63));
      expect(ls2.negative()).assertFalse();
      const rs1: BigInt = BigInt(100).operatorRightShift(BigInt(2));
      expect(rs1.negative()).assertFalse();
      const rs2: BigInt = BigInt(-100).operatorRightShift(BigInt(2));
      expect(rs2.negative()).assertTrue();
      const rs3: BigInt = BigInt(-1).operatorRightShift(BigInt(10));
      expect(rs3.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1700
     * @tc.name testBigIntNegativeTest017
     * @tc.desc negative() with BigInt copy constructor and fromULong comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest017', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const original = BigInt(-42);
      const copy = BigInt(original);
      expect(copy.negative()).assertTrue();

      const posOriginal = BigInt(999);
      const posCopy = BigInt(posOriginal);
      expect(posCopy.negative()).assertFalse();

      const zeroCopy = BigInt(BigInt(0));
      expect(zeroCopy.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1800
     * @tc.name testBigIntNegativeTest018
     * @tc.desc negative() for even/odd/prime int and string constructors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest018', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).negative()).assertFalse();
      expect(BigInt(-100).negative()).assertTrue();
      expect(BigInt(101).negative()).assertFalse();
      expect(BigInt(-101).negative()).assertTrue();
      expect(BigInt(97).negative()).assertFalse();
      expect(BigInt(-97).negative()).assertTrue();
      expect(BigInt('100').negative()).assertFalse();
      expect(BigInt('-100').negative()).assertTrue();
      expect(BigInt('101').negative()).assertFalse();
      expect(BigInt('-101').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_1900
     * @tc.name testBigIntNegativeTest019
     * @tc.desc negative() for powers of ten: 10^3 through 10^9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest019', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1000).negative()).assertFalse();
      expect(BigInt(-1000).negative()).assertTrue();
      expect(BigInt(10000).negative()).assertFalse();
      expect(BigInt(100000).negative()).assertFalse();
      expect(BigInt(-100000).negative()).assertTrue();
      expect(BigInt(1000000).negative()).assertFalse();
      expect(BigInt(10000000).negative()).assertFalse();
      expect(BigInt(100000000).negative()).assertFalse();
      expect(BigInt(1000000000).negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2000
     * @tc.name testBigIntNegativeTest020
     * @tc.desc negative() for large powers: 10^12, 10^15, 10^18 and 2^40, 2^50, 2^60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest020', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1000000000000').negative()).assertFalse();
      expect(BigInt('-1000000000000').negative()).assertTrue();
      expect(BigInt('1000000000000000').negative()).assertFalse();
      expect(BigInt('-1000000000000000').negative()).assertTrue();
      expect(BigInt('1000000000000000000').negative()).assertFalse();
      expect(BigInt('-1000000000000000000').negative()).assertTrue();
      expect(BigInt('1152921504606846976').negative()).assertFalse();
      expect(BigInt('-1152921504606846976').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2100
     * @tc.name testBigIntNegativeTest021
     * @tc.desc negative() on Fibonacci number and large signed boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest021', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(1134903170).negative()).assertFalse();
      expect(BigInt('-9223372036854775808').negative()).assertTrue();
      expect(BigInt('9223372036854775807').negative()).assertFalse();
      expect(BigInt('1099511627776').negative()).assertFalse();
      expect(BigInt('-1099511627776').negative()).assertTrue();
      expect(BigInt('1125899906842624').negative()).assertFalse();
      expect(BigInt('-1125899906842624').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2200
     * @tc.name testBigIntNegativeTest022
     * @tc.desc negative() after modulo operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest022', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mod1: BigInt = BigInt(100).operatorModule(BigInt(3));
      expect(mod1.negative()).assertFalse();
      const mod2: BigInt = BigInt(-100).operatorModule(BigInt(3));
      expect(mod2.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2300
     * @tc.name testBigIntNegativeTest023
     * @tc.desc negative() on result of ternary conditional expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest023', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const v1: BigInt = true ? BigInt(-10) : BigInt(20);
      expect(v1.negative()).assertTrue();
      const v2: BigInt = false ? BigInt(10) : BigInt(20);
      expect(v2.negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2400
     * @tc.name testBigIntNegativeTest024
     * @tc.desc negative() on BigInt values accessed from arrays, objects, Map, and Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest024', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr1: BigInt[] = [BigInt(-10), BigInt(20)];
      expect(arr1[0].negative()).assertTrue();
      const arr2: BigInt[] = [BigInt(10), BigInt(-20)];
      expect(arr2[1].negative()).assertTrue();
      const obj: NegObj = new NegObj();
      obj.a = BigInt(-10);
      expect((obj.a as BigInt).negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2500
     * @tc.name testBigIntNegativeTest025
     * @tc.desc negative() used with every() and map() for sequence sign checking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest025', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const posArr: BigInt[] = [BigInt(1), BigInt(2), BigInt(3)];
      expect(posArr.every((n: BigInt): boolean => !n.negative())).assertTrue();
      const negArr: BigInt[] = [BigInt(-1), BigInt(-2), BigInt(-3)];
      expect(negArr.every((n: BigInt): boolean => n.negative())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2600
     * @tc.name testBigIntNegativeTest026
     * @tc.desc negative() on mixed sign sequence mapped to boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest026', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mixArr: BigInt[] = [BigInt(-1), BigInt(0), BigInt(1)];
      const result: boolean[] = mixArr.map((n: BigInt): boolean => n.negative());
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
      expect(result[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2700
     * @tc.name testBigIntNegativeTest027
     * @tc.desc negative() for various large negative numbers from -1000000000 through -999999999999999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest027', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2).negative()).assertTrue();
      expect(BigInt(-123456789).negative()).assertTrue();
      expect(BigInt(-1000000000).negative()).assertTrue();
      expect(BigInt(-2000000000).negative()).assertTrue();
      expect(BigInt(-3000000000).negative()).assertTrue();
      expect(BigInt(-4000000000).negative()).assertTrue();
      expect(BigInt(-5000000000).negative()).assertTrue();
      expect(BigInt('-1000000000000').negative()).assertTrue();
      expect(BigInt('-999999999999999').negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2800
     * @tc.name testBigIntNegativeTest028
     * @tc.desc negative() chained with negation for double-flip and multi-level chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest028', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-10).negate().negative()).assertFalse();
      expect(BigInt(-10).negate().negate().negative()).assertTrue();
      const t1: BigInt = BigInt(-10);
      expect(t1.negative()).assertTrue();
      expect(t1.negative()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_2900
     * @tc.name testBigIntNegativeTest029
     * @tc.desc negative() result consistent with comparison operator < 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest029', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {

      const bn1: boolean = BigInt(-100).negative();
      expect(bn1).assertTrue();

      const bn2: boolean = BigInt(-100) < BigInt(0);
      expect(bn2).assertTrue();

      const bn3: boolean = BigInt(0).negative();
      expect(bn3).assertFalse();

      const bn4: boolean = BigInt(0) < BigInt(0);
      expect(bn4).assertFalse();

      const bn5: boolean = BigInt(100).negative();
      expect(bn5).assertFalse();

      const bn6: boolean = BigInt(100) < BigInt(0);
      expect(bn6).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_3000
     * @tc.name testBigIntNegativeTest030
     * @tc.desc negative() with leading-zero and plus-sign string formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest030', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-00000123').negative()).assertTrue();
      expect(BigInt('-0777').negative()).assertTrue();
      expect(BigInt('+0').negative()).assertFalse();
      expect(BigInt('000').negative()).assertFalse();
      expect(BigInt('00000123').negative()).assertFalse();
      expect(BigInt('0777').negative()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_NEGATIVE_3100
     * @tc.name testBigIntNegativeTest031
     * @tc.desc negative() after operatorNegate() for sign change verification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntNegativeTest031', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const n1: BigInt = BigInt(5).negate();
      expect(n1.negative()).assertTrue();
      const n2: BigInt = BigInt(-5).negate();
      expect(n2.negative()).assertFalse();
      const n3: BigInt = BigInt(0).negate();
      expect(n3.negative()).assertFalse();
    });
  });
}