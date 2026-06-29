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

class X {}

class Y {
  value: int = 42;
}

class Base {}

class Derived extends Base {}

function getBigInt(v: int): BigInt {
  return BigInt(v);
}

class EmptyObj {}

class XYObj {
  x: int = 1;
  y: int = 2;
}

export default function BigIntEquals2Test_2(): void {
  describe('BigInt.equals(other: Any) overload - expanded param dimensions', () => {

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_2700
     * @tc.name testBigIntEqualsAnyByteTypes2700
     * @tc.desc equals(Any) returns false for other as byte type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_2700
     * @tc.name testBigIntEqualsAnyPrimitiveTypeFalseBatch
     * @tc.desc equals(Any) returns false for byte/short/int/long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyPrimitiveTypeFalseBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(0).equals((0) as byte)).assertFalse();
      expect(new BigInt(1).equals((1) as byte)).assertFalse();
      expect(new BigInt(-1).equals((-1) as byte)).assertFalse();
      expect(new BigInt(127).equals((127) as byte)).assertFalse();
      expect(new BigInt(-128).equals((-128) as byte)).assertFalse();
      expect(new BigInt(64).equals((64) as byte)).assertFalse();
      expect(new BigInt(-64).equals((-64) as byte)).assertFalse();
      expect(new BigInt(100).equals((100) as byte)).assertFalse();
      expect(new BigInt(32767).equals((32767) as short)).assertFalse();
      expect(new BigInt(-32768).equals((-32768) as short)).assertFalse();
      expect(new BigInt(200).equals((200) as short)).assertFalse();
      expect(new BigInt(-200).equals((-200) as short)).assertFalse();
      expect(new BigInt(1024).equals((1024) as short)).assertFalse();
      expect(new BigInt(-1024).equals((-1024) as short)).assertFalse();
      expect(new BigInt(2147483647).equals((2147483647) as int)).assertFalse();
      expect(new BigInt(-2147483648).equals((-2147483648) as int)).assertFalse();
      expect(new BigInt(50000).equals((50000) as int)).assertFalse();
      expect(new BigInt(-50000).equals((-50000) as int)).assertFalse();
      expect(new BigInt(65536).equals((65536) as int)).assertFalse();
      expect(new BigInt(-65536).equals((-65536) as int)).assertFalse();
      expect(new BigInt(1000000).equals((1000000) as int)).assertFalse();
      expect(new BigInt(-1000000).equals((-1000000) as int)).assertFalse();
      expect(new BigInt('9223372036854775807').equals((9223372036854775807) as long)).assertFalse();
      expect(new BigInt('-9223372036854775808').equals((-9223372036854775808) as long)).assertFalse();
      expect(new BigInt('4294967296').equals((4294967296) as long)).assertFalse();
      expect(new BigInt('-4294967296').equals((-4294967296) as long)).assertFalse();
      expect(new BigInt('1099511627776').equals((1099511627776) as long)).assertFalse();
      expect(new BigInt('-1099511627776').equals((-1099511627776) as long)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3100
     * @tc.name testBigIntEqualsAnyDoubleTypes3100
     * @tc.desc equals(Any) returns false for other as double type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyDoubleTypes3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(new BigInt(0).equals((0.0) as double)).assertFalse();
      expect(new BigInt(0).equals((-0.0) as double)).assertFalse();
      expect(new BigInt(1).equals((1.5) as double)).assertFalse();
      expect(new BigInt(-2).equals((-2.7) as double)).assertFalse();
      expect(new BigInt(3).equals((3.14) as double)).assertFalse();
      expect(new BigInt(-3).equals((-3.14) as double)).assertFalse();
      expect(new BigInt(0).equals((0.1) as double)).assertFalse();
      expect(new BigInt(0).equals((-0.1) as double)).assertFalse();
      expect(new BigInt(100).equals((100.0) as double)).assertFalse();
      expect(new BigInt(-100).equals((-100.0) as double)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3200
     * @tc.name testBigIntEqualsAnyNonBigIntTypeFalseBatch
     * @tc.desc equals(Any) returns false for array/object/container/RegExp/function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyNonBigIntTypeFalseBatch', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      expect(a.equals(new Array<number>(10) as object)).assertFalse();
      expect(a.equals(new Map<number, number>() as object)).assertFalse();
      expect(a.equals(new Set<number>() as object)).assertFalse();
      expect(a.equals(new WeakMap<object, number>() as object)).assertFalse();
      expect(a.equals(new WeakSet<object>() as object)).assertFalse();
      expect(a.equals(new Int8Array(10) as object)).assertFalse();
      expect(a.equals(new Uint8Array(10) as object)).assertFalse();
      expect(a.equals(new Int32Array(10) as object)).assertFalse();
      expect(a.equals(new RegExp('\\d+') as object)).assertFalse();
      expect(a.equals(new Date() as object)).assertFalse();
      expect(a.equals(new Error('test') as object)).assertFalse();
      expect(a.equals(new TypeError('test') as object)).assertFalse();
      expect(a.equals(new X())).assertFalse();
      expect(a.equals(new Y())).assertFalse();
      expect(a.equals(new EmptyObj() as object)).assertFalse();
      expect(a.equals(new XYObj() as object)).assertFalse();
      const fn = (): int => 42;
      expect(a.equals(fn as object)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3400
     * @tc.name testBigIntEqualsAnyAnyBigIntExtended3400
     * @tc.desc equals(Any) with Any variable holding BigInt at various boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyAnyBigIntExtended3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bi0: Any = new BigInt(0);
      expect(new BigInt(0).equals(bi0)).assertTrue();
      let bi1: Any = new BigInt(1);
      expect(new BigInt(1).equals(bi1)).assertTrue();
      let biNeg1: Any = new BigInt(-1);
      expect(new BigInt(-1).equals(biNeg1)).assertTrue();
      let bi127: Any = new BigInt(127);
      expect(new BigInt(127).equals(bi127)).assertTrue();
      let biNeg128: Any = new BigInt(-128);
      expect(new BigInt(-128).equals(biNeg128)).assertTrue();
      let biMaxInt: Any = new BigInt(2147483647);
      expect(new BigInt(2147483647).equals(biMaxInt)).assertTrue();
      let biMinInt: Any = new BigInt(-2147483648);
      expect(new BigInt(-2147483648).equals(biMinInt)).assertTrue();
      let biBig: Any = new BigInt('9007199254740993');
      expect(new BigInt('9007199254740993').equals(biBig)).assertTrue();
      let biLongMax: Any = new BigInt('9223372036854775807');
      expect(new BigInt('9223372036854775807').equals(biLongMax)).assertTrue();
      let biLongMin: Any = new BigInt('-9223372036854775808');
      expect(new BigInt('-9223372036854775808').equals(biLongMin)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3500
     * @tc.name testBigIntEqualsAnyAnyBigIntDiffValues3500
     * @tc.desc equals(Any) with Any variable holding BigInt, different value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyAnyBigIntDiffValues3500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bi0: Any = new BigInt(0);
      expect(new BigInt(1).equals(bi0)).assertFalse();
      let bi1: Any = new BigInt(1);
      expect(new BigInt(-1).equals(bi1)).assertFalse();
      let bi127: Any = new BigInt(127);
      expect(new BigInt(-128).equals(bi127)).assertFalse();
      let biMaxInt: Any = new BigInt(2147483647);
      expect(new BigInt(-2147483648).equals(biMaxInt)).assertFalse();
      let biLargePos: Any = new BigInt('12345678901234567890');
      expect(new BigInt('-12345678901234567890').equals(biLargePos)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3600
     * @tc.name testBigIntEqualsAnyMixedScenarios3600
     * @tc.desc equals(Any) mixed scenarios: Any variable reassignment and copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyMixedScenarios3600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let v: Any = new BigInt(42);
      const matchBigInt = new BigInt(42).equals(v);
      v = 42;
      const matchInt = new BigInt(42).equals(v);
      expect(matchBigInt).assertTrue();
      expect(matchInt).assertFalse();
      const src = new BigInt(999);
      const copy = new BigInt(src);
      const bi: Any = copy;
      expect(src.equals(bi)).assertTrue();
      const sum = new BigInt(3).operatorAdd(new BigInt(4));
      const biSum: Any = sum;
      expect(new BigInt(7).equals(biSum)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3700
     * @tc.name testBigIntEqualsAnyAnyReturnType3700
     * @tc.desc equals(Any) overload returns boolean for various input types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyAnyReturnType3700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let bi: Any = new BigInt(55);
      const r1 = new BigInt(55).equals(bi);
      expect(typeof r1).assertEqual('boolean');
      const r2 = new BigInt(66).equals(bi);
      expect(typeof r2).assertEqual('boolean');
      const r3 = new BigInt(0).equals(null);
      expect(typeof r3).assertEqual('boolean');
      const r4 = new BigInt(0).equals('abc');
      expect(typeof r4).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3800
     * @tc.name testBigIntEqualsAnyImmutability3800
     * @tc.desc equals(Any) does not modify original BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyImmutability3800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = new BigInt(777);
      a.equals(null);
      expect(a.toString()).assertEqual('777');
      const b = new BigInt(888);
      b.equals('test');
      expect(b.toString()).assertEqual('888');
      const c = new BigInt(999);
      c.equals(123);
      c.equals(456.0);
      c.equals(true);
      expect(c.toString()).assertEqual('999');
      const d = new BigInt(12345);
      const bi: Any = new BigInt(67890);
      d.equals(bi);
      expect(d.toString()).assertEqual('12345');
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_3900
     * @tc.name testBigIntEqualsAnyCountAccumulate3900
     * @tc.desc equals(Any) multiple Any-overload calls do not change operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyCountAccumulate3900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = new BigInt(500);
      let count: int = 0;
      if (a.equals(null)) { count++; }
      if (a.equals('abc')) { count++; }
      if (a.equals(999)) { count++; }
      expect(count).assertEqual(0);
      expect(a.toString()).assertEqual('500');
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_4000
     * @tc.name testBigIntEqualsAnyStringExtended4000
     * @tc.desc equals(Any) returns false for additional string types including hex and scientific
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyStringExtended4000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      expect(a.equals('42')).assertFalse();
      expect(a.equals('-42')).assertFalse();
      expect(a.equals('0')).assertFalse();
      expect(a.equals('+42')).assertFalse();
      expect(a.equals('0000042')).assertFalse();
      expect(a.equals('42.0')).assertFalse();
      expect(a.equals('99999999999999999999')).assertFalse();
      expect(a.equals('0xFF')).assertFalse();
      expect(a.equals('1e10')).assertFalse();
      expect(a.equals('NaN')).assertFalse();
      expect(a.equals('Infinity')).assertFalse();
      expect(a.equals('true')).assertFalse();
      expect(a.equals('null')).assertFalse();
      expect(a.equals('undefined')).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_4100
     * @tc.name testBigIntEqualsAnyStringSpecialFormats4100
     * @tc.desc equals(Any) returns false for special format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyStringSpecialFormats4100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(0);
      expect(a.equals('0x0')).assertFalse();
      expect(a.equals('0b0')).assertFalse();
      expect(a.equals('0o0')).assertFalse();
      expect(a.equals('0.0')).assertFalse();
      expect(a.equals('.0')).assertFalse();
      expect(a.equals('0.')).assertFalse();
      expect(a.equals('-0')).assertFalse();
      expect(a.equals('+0')).assertFalse();
      expect(a.equals('00')).assertFalse();
      expect(a.equals(' 0')).assertFalse();
      expect(a.equals('0 ')).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_4400
     * @tc.name testBigIntEqualsAnyBigIntFromFunctionRet4400
     * @tc.desc equals(Any) true for BigInt returned from function and ternary expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyBigIntFromFunctionRet4400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(getBigInt(100).equals(BigInt(100))).assertTrue();
      expect(getBigInt(-50).equals(BigInt(-50))).assertTrue();
      expect((true ? BigInt(10) : BigInt(20)).equals(BigInt(10))).assertTrue();
      expect((false ? BigInt(10) : BigInt(20)).equals(BigInt(20))).assertTrue();
      expect(BigInt([BigInt(10), BigInt(20)][0]).equals(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_4500
     * @tc.name testBigIntEqualsAnyNegPosBoundary4500
     * @tc.desc equals(Any) negative vs positive numbers across type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyNegPosBoundary4500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).equals(BigInt(-0))).assertTrue();
      expect(BigInt(1).equals(BigInt(-1))).assertFalse();
      expect(BigInt(127).equals(BigInt(-128))).assertFalse();
      expect(BigInt(32767).equals(BigInt(-32768))).assertFalse();
      expect(BigInt(2147483647).equals(BigInt(-2147483648))).assertFalse();
      expect(BigInt('9223372036854775807').equals(BigInt('-9223372036854775808'))).assertFalse();
      expect(BigInt(-999999999).equals(BigInt(-999999999))).assertTrue();
      expect(BigInt(-999999999).equals(BigInt(-999999998))).assertFalse();
    });


    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_4700
     * @tc.name testBigIntEqualsAnyBitwiseArithExt4700
     * @tc.desc equals(Any) for bitwise and arithmetic operation results on BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyBitwiseArithExt4700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorModule(BigInt(7)).equals(BigInt(2))).assertTrue();
      expect(BigInt(50).operatorSubtract(BigInt(20)).equals(BigInt(30))).assertTrue();
      expect(BigInt(6).operatorMultiply(BigInt(7)).equals(BigInt(42))).assertTrue();
      expect(BigInt(100).operatorDivide(BigInt(3)).equals(BigInt(33))).assertTrue();
    });


    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_4900
     * @tc.name testBigIntEqualsAnyLargeDigitLen4900
     * @tc.desc equals(Any) for extremely large 200-digit and 500-digit BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyLargeDigitLen4900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const d200 = '9'.repeat(200);
      const d200_adj = '9'.repeat(199) + '8';
      const d500 = '9'.repeat(500);
      const d500_adj = '9'.repeat(499) + '8';
      expect(BigInt(d200).equals(BigInt(d200))).assertTrue();
      expect(BigInt(d200).equals(BigInt(d200_adj))).assertFalse();
      expect(BigInt(d500).equals(BigInt(d500))).assertTrue();
      expect(BigInt(d500).equals(BigInt(d500_adj))).assertFalse();
      expect(BigInt('-' + d200).equals(BigInt('-' + d200))).assertTrue();
      expect(BigInt(d200).equals(BigInt('-' + d200))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_EQUALS_ANY_5100
     * @tc.name testBigIntEqualsAnyDigitLenBoundary5100
     * @tc.desc equals(Any) for single-digit to nine-digit number boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyDigitLenBoundary5100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const values: BigInt[][] = [
        [BigInt(9), BigInt(9)], [BigInt(10), BigInt(10)],
        [BigInt(99), BigInt(99)], [BigInt(100), BigInt(100)],
        [BigInt(999), BigInt(999)], [BigInt(1000), BigInt(1000)],
        [BigInt(9999), BigInt(9999)], [BigInt(10000), BigInt(10000)],
        [BigInt(99999), BigInt(99999)], [BigInt(100000), BigInt(100000)],
        [BigInt(999999), BigInt(999999)],
        [BigInt(9999999), BigInt(9999999)],
        [BigInt(99999999), BigInt(99999999)],
        [BigInt(999999999), BigInt(999999999)],
      ];
      for (let i = 0; i < values.length; i++) {
        expect(values[i][0].equals(values[i][1])).assertTrue();
      }
      expect(BigInt(9).equals(BigInt(10))).assertFalse();
      expect(BigInt(99).equals(BigInt(100))).assertFalse();
      expect(BigInt(999).equals(BigInt(1000))).assertFalse();
    });

  });
}
