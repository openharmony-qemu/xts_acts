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
import Utils from '../Util.test';
class X { _: int = 0; }

class Y {
  value: int = 42;
}

function getBigInt(v: int): BigInt {
  return BigInt(v);
}

class EmptyObj { _: int = 0; }

class XYObj {
  x: int = 1;
  y: int = 2;
}

export default function BigIntEquals2Test_2(): void {
  describe('BigIntEquals2Test_2', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async ():void=>{
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0100
     * @tc.name testBigIntEqualsAnyTest001
     * @tc.desc equals(Any) returns false for byte/short/int/long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest001', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt(0).equals((0) as byte)).assertFalse();
      expect(new BigInt(1).equals((1) as byte)).assertFalse();
      expect(new BigInt(-1).equals((-1) as byte)).assertFalse();
      expect(new BigInt(2).equals((2) as byte)).assertFalse();
      expect(new BigInt(-2).equals((-2) as byte)).assertFalse();
      expect(new BigInt(127).equals((127) as byte)).assertFalse();
      expect(new BigInt(-128).equals((-128) as byte)).assertFalse();

      expect(new BigInt(32767).equals((32767) as short)).assertFalse();
      expect(new BigInt(-32768).equals((-32768) as short)).assertFalse();

      expect(new BigInt(2147483647).equals((2147483647) as int)).assertFalse();
      expect(new BigInt(-2147483648).equals((-2147483648) as int)).assertFalse();
      expect(new BigInt(65536).equals((65536) as int)).assertFalse();
      expect(new BigInt(-65536).equals((-65536) as int)).assertFalse();

      expect(new BigInt('9223372036854775807').equals((9223372036854775807) as long)).assertFalse();
      expect(new BigInt('-9223372036854775808').equals((-9223372036854775808) as long)).assertFalse();
      expect(new BigInt('4294967296').equals((4294967296) as long)).assertFalse();
      expect(new BigInt('-4294967296').equals((-4294967296) as long)).assertFalse();
      expect(new BigInt('9223372036854775808').equals(Long.MAX_VALUE as Any)).assertFalse();
      expect(new BigInt('-9223372036854775809').equals(Long.MIN_VALUE as Any)).assertFalse();
      expect(new BigInt('18446744073709551616').equals(Long.MAX_VALUE as Any)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0200
     * @tc.name testBigIntEqualsAnyTest002
     * @tc.desc equals(Any) returns false for other as double type values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest002', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt(0).equals((0.0) as double)).assertFalse();
      expect(new BigInt(0).equals((-0.0) as double)).assertFalse();
      expect(new BigInt(-0).equals((-0.0) as double)).assertFalse();
      expect(new BigInt(1).equals((1.5) as double)).assertFalse();
      expect(new BigInt(1).equals((-1.5) as double)).assertFalse();
      expect(new BigInt(-1).equals((-1.5) as double)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0300
     * @tc.name testBigIntEqualsAnyTest003
     * @tc.desc equals(Any) returns false for array/object/container/RegExp/function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest003', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(42);
      expect(a.equals(new Array<number>(10) as Any)).assertFalse();
      expect(a.equals(new Map<number, number>() as Any)).assertFalse();
      expect(a.equals(new Set<number>() as Any)).assertFalse();
      expect(a.equals(new Int8Array(10) as Any)).assertFalse();
      expect(a.equals(new Uint8Array(10) as Any)).assertFalse();
      expect(a.equals(new Int32Array(10) as Any)).assertFalse();
      expect(a.equals(new RegExp('\\d+') as Any)).assertFalse();
      expect(a.equals(new Date() as Any)).assertFalse();
      expect(a.equals(new Error('test') as Any)).assertFalse();
      expect(a.equals(new X())).assertFalse();
      expect(a.equals(new Y())).assertFalse();
      expect(a.equals(new EmptyObj() as Any)).assertFalse();
      expect(a.equals(new XYObj() as Any)).assertFalse();
      const fn = (): int => 42;
      expect(a.equals(fn as Any)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0400
     * @tc.name testBigIntEqualsAnyTest004
     * @tc.desc equals(Any) with Any variable holding BigInt at various boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest004', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).equals(BigInt(0) as Any)).assertTrue();
      expect(BigInt(1).equals(BigInt(1) as Any)).assertTrue();
      expect(BigInt(-1).equals(BigInt(-1) as Any)).assertTrue();
      expect(BigInt(127).equals(BigInt(127) as Any)).assertTrue();
      expect(BigInt(-128).equals(BigInt(-128) as Any)).assertTrue();
      expect(BigInt(2147483647).equals(BigInt(2147483647) as Any)).assertTrue();
      expect(BigInt(-2147483648).equals(BigInt(-2147483648) as Any)).assertTrue();
      expect(BigInt('9007199254740993').equals(BigInt('9007199254740993') as Any)).assertTrue();
      expect(BigInt('9223372036854775807').equals(BigInt('9223372036854775807') as Any)).assertTrue();
      expect(BigInt('-9223372036854775808').equals(BigInt('-9223372036854775808') as Any)).assertTrue();

      expect(BigInt(0).equals(BigInt(1) as Any)).assertFalse();
      expect(BigInt(100).equals(BigInt(200) as Any)).assertFalse();
      expect(BigInt(0).equals(0 as Any)).assertFalse();
      expect(BigInt(1).equals('1' as Any)).assertFalse();
      expect(BigInt(1).equals(true as Any)).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0500
     * @tc.name testBigIntEqualsAnyTest005
     * @tc.desc equals(Any) with Any variable holding BigInt, different value comparisons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest005', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bi0: Any = new BigInt(0);
      expect(new BigInt(1).equals(bi0)).assertFalse();
      const bi1: Any = new BigInt(1);
      expect(new BigInt(-1).equals(bi1)).assertFalse();
      const bi127: Any = new BigInt(127);
      expect(new BigInt(-128).equals(bi127)).assertFalse();
      const biMaxInt: Any = new BigInt(2147483647);
      expect(new BigInt(-2147483648).equals(biMaxInt)).assertFalse();
      const biLargePos: Any = new BigInt('12345678901234567890');
      expect(new BigInt('-12345678901234567890').equals(biLargePos)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0600
     * @tc.name testBigIntEqualsAnyTest006
     * @tc.desc equals(Any) mixed scenarios: Any variable reassignment and copy construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest006', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0700
     * @tc.name testBigIntEqualsAnyTest007
     * @tc.desc equals(Any) overload returns boolean for various input types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest007', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bi: Any = new BigInt(55);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0800
     * @tc.name testBigIntEqualsAnyTest008
     * @tc.desc equals(Any) does not modify original BigInt value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest008', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_0900
     * @tc.name testBigIntEqualsAnyTest009
     * @tc.desc equals(Any) multiple Any-overload calls do not change operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest009', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new BigInt(500);
      let count: int = 0;
      if (a.equals(null)) { count++; }
      if (a.equals('abc')) { count++; }
      if (a.equals(999)) { count++; }
      expect(count).assertEqual(0);
      expect(a.toString()).assertEqual('500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1000
     * @tc.name testBigIntEqualsAnyTest010
     * @tc.desc equals(Any) returns false for additional string types including hex and scientific
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest010', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1100
     * @tc.name testBigIntEqualsAnyTest011
     * @tc.desc equals(Any) returns false for special format strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest011', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1200
     * @tc.name testBigIntEqualsAnyTest012
     * @tc.desc equals(Any) true for BigInt returned from function and ternary expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest012', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getBigInt(100).equals(BigInt(100))).assertTrue();
      expect(getBigInt(-50).equals(BigInt(-50))).assertTrue();
      expect((true ? BigInt(10) : BigInt(20)).equals(BigInt(10))).assertTrue();
      expect((false ? BigInt(10) : BigInt(20)).equals(BigInt(20))).assertTrue();
      expect(BigInt([BigInt(10), BigInt(20)][0]).equals(BigInt(10))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1300
     * @tc.name testBigIntEqualsAnyTest013
     * @tc.desc equals(Any) negative vs positive numbers across type boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest013', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1400
     * @tc.name testBigIntEqualsAnyTest014
     * @tc.desc equals(Any) for bitwise and arithmetic operation results on BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest014', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorModule(BigInt(7)).equals(BigInt(2))).assertTrue();
      expect(BigInt(50).operatorSubtract(BigInt(20)).equals(BigInt(30))).assertTrue();
      expect(BigInt(6).operatorMultiply(BigInt(7)).equals(BigInt(42))).assertTrue();
      expect(BigInt(100).operatorDivide(BigInt(3)).equals(BigInt(33))).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1500
     * @tc.name testBigIntEqualsAnyTest015
     * @tc.desc equals(Any) for extremely large 200-digit and 500-digit BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest015', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_EQUALS_ANY_1600
     * @tc.name testBigIntEqualsAnyTest016
     * @tc.desc equals(Any) for critical digit carry boundaries, 2^65, and Long overflow boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntEqualsAnyTest016', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(9).equals(BigInt(10))).assertFalse();
      expect(BigInt(999).equals(BigInt(1000))).assertFalse();
      expect(BigInt('36893488147419103232').equals(BigInt('36893488147419103232'))).assertTrue();
      expect(BigInt('9223372036854775807').equals(BigInt('9223372036854775808'))).assertFalse();
      expect(BigInt('18446744073709551616').equals(BigInt('18446744073709551616'))).assertTrue();
      expect(BigInt('18446744073709551615').equals(BigInt('18446744073709551615'))).assertTrue();
    });
  });
}
