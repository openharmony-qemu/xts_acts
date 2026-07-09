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
import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntOperatorDecrement2Test(): void {
  describe('testBigIntOperatorDecrement2Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1000
     * @tc.name testBigIntOperatorDecrement2Test010
     * @tc.desc Mindmap huge number matrix: 2^64, 2^128, 2^256, googol and negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('18446744073709551616').operatorDecrement().toString()).assertEqual('18446744073709551615');
      expect(BigInt('18446744073709551617').operatorDecrement().toString()).assertEqual('18446744073709551616');
      expect(BigInt('340282366920938463463374607431768211456').operatorDecrement().toString()).assertEqual('340282366920938463463374607431768211455');
      expect(BigInt('340282366920938463463374607431768211457').operatorDecrement().toString()).assertEqual('340282366920938463463374607431768211456');
      expect(BigInt('115792089237316195423570985008687907853269984665640564039457584007913129639936').operatorDecrement().toString()).assertEqual('115792089237316195423570985008687907853269984665640564039457584007913129639935');
      expect(BigInt('115792089237316195423570985008687907853269984665640564039457584007913129639937').operatorDecrement().toString()).assertEqual('115792089237316195423570985008687907853269984665640564039457584007913129639936');
      expect(BigInt('10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000').operatorDecrement().toString()).assertEqual('9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999');
      expect(BigInt('18446744073709551615').operatorDecrement().toString()).assertEqual('18446744073709551614');
      expect(BigInt('-340282366920938463463374607431768211456').operatorDecrement().toString()).assertEqual('-340282366920938463463374607431768211457');
      expect(BigInt('-115792089237316195423570985008687907853269984665640564039457584007913129639936').operatorDecrement().toString()).assertEqual('-115792089237316195423570985008687907853269984665640564039457584007913129639937');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1100
     * @tc.name testBigIntOperatorDecrement2Test011
     * @tc.desc Mindmap consecutive decrements: 10, 100, 1000 times and from long lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = BigInt(0);
      for (let i = 0; i < 10; i++) {
        x = x.operatorDecrement();
      }
      expect(x.toString()).assertEqual('-10');

      let y = BigInt(0);
      for (let i = 0; i < 100; i++) {
        y = y.operatorDecrement();
      }
      expect(y.toString()).assertEqual('-100');

      let z = BigInt(0);
      for (let i = 0; i < 1000; i++) {
        z = z.operatorDecrement();
      }
      expect(z.toString()).assertEqual('-1000');

      let w = BigInt(5);
      for (let i = 0; i < 10; i++) {
        w = w.operatorDecrement();
      }
      expect(w.toString()).assertEqual('-5');

      let v = BigInt('-9223372036854775808');
      for (let i = 0; i < 100; i++) {
        v = v.operatorDecrement();
      }
      expect(v.toString()).assertEqual('-9223372036854775908');

      let u = BigInt(3);
      for (let i = 0; i < 5; i++) {
        u = u.operatorDecrement();
      }
      expect(u.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1200
     * @tc.name testBigIntOperatorDecrement2Test012
     * @tc.desc Mindmap immutability: reference identity, negative/huge/long bound unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(-99);
      a.operatorDecrement();
      expect(a.toString()).assertEqual('-99');

      const b = BigInt('18446744073709551616');
      b.operatorDecrement();
      expect(b.toString()).assertEqual('18446744073709551616');

      const d = BigInt(7);
      d.operatorDecrement();
      d.operatorDecrement();
      d.operatorDecrement();
      expect(d.toString()).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1300
     * @tc.name testBigIntOperatorDecrement2Test013
     * @tc.desc Mindmap return value: returns a different instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = BigInt(0);
      const res = src.operatorDecrement();
      expect(res!==src).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1400
     * @tc.name testBigIntOperatorDecrement2Test014
     * @tc.desc Mindmap return value: doubleValue, getLong, equals, toString length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorDecrement().doubleValue()).assertEqual(-1.0);
      expect(BigInt(100).operatorDecrement().getLong()).assertEqual(99);
      expect(BigInt(5).operatorDecrement().equals(BigInt(4))).assertTrue();
      const huge = BigInt('115792089237316195423570985008687907853269984665640564039457584007913129639936').operatorDecrement();
      expect(huge.toString().length).assertEqual(78);
      expect(BigInt('18446744073709551616').operatorDecrement().doubleValue()).assertEqual(1.8446744073709552e19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1500
     * @tc.name testBigIntOperatorDecrement2Test015
     * @tc.desc Mindmap constructor diversity: boolean, string, "-50", copy, "007", "+42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorDecrement().toString()).assertEqual('0');
      expect(BigInt(false).operatorDecrement().toString()).assertEqual('-1');
      expect(BigInt('123').operatorDecrement().toString()).assertEqual('122');
      expect(BigInt('-50').operatorDecrement().toString()).assertEqual('-51');
      const src = BigInt(77);
      expect(BigInt(src).operatorDecrement().toString()).assertEqual('76');
      expect(BigInt('007').operatorDecrement().toString()).assertEqual('6');
      expect(BigInt('+42').operatorDecrement().toString()).assertEqual('41');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1600
     * @tc.name testBigIntOperatorDecrement2Test016
     * @tc.desc Mindmap chained calls: dec->inc, dec->add, dec->subtract, dec->dec->dec->multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(100).operatorDecrement().operatorIncrement().toString()).assertEqual('100');
      expect(BigInt(5).operatorDecrement().operatorAdd(BigInt(10)).toString()).assertEqual('14');
      expect(BigInt(10).operatorDecrement().operatorSubtract(BigInt(5)).toString()).assertEqual('4');
      expect(BigInt(5).operatorDecrement().operatorDecrement().operatorDecrement().operatorMultiply(BigInt(3)).toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1700
     * @tc.name testBigIntOperatorDecrement2Test017
     * @tc.desc Mindmap positive boundary matrix: 9, 500, 12345 decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(9).operatorDecrement().toString()).assertEqual('8');
      expect(BigInt(500).operatorDecrement().toString()).assertEqual('499');
      expect(BigInt(12345).operatorDecrement().toString()).assertEqual('12344');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1800
     * @tc.name testBigIntOperatorDecrement2Test018
     * @tc.desc Mindmap negative boundary matrix: -1, -9, -42, -500, -12345 decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1).operatorDecrement().toString()).assertEqual('-2');
      expect(BigInt(-9).operatorDecrement().toString()).assertEqual('-10');
      expect(BigInt(-42).operatorDecrement().toString()).assertEqual('-43');
      expect(BigInt(-500).operatorDecrement().toString()).assertEqual('-501');
      expect(BigInt(-12345).operatorDecrement().toString()).assertEqual('-12346');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_1900
     * @tc.name testBigIntOperatorDecrement2Test019
     * @tc.desc Mindmap power-of-two negatives: -1024, -(3^5) decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-1024).operatorDecrement().toString()).assertEqual('-1025');
      expect(BigInt(-243).operatorDecrement().toString()).assertEqual('-244');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2000
     * @tc.name testBigIntOperatorDecrement2Test020
     * @tc.desc Mindmap power-of-two positives: 1024, 65535, 1048576, 243 decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(1024).operatorDecrement().toString()).assertEqual('1023');
      expect(BigInt(65535).operatorDecrement().toString()).assertEqual('65534');
      expect(BigInt(1048576).operatorDecrement().toString()).assertEqual('1048575');
      expect(BigInt(243).operatorDecrement().toString()).assertEqual('242');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2100
     * @tc.name testBigIntOperatorDecrement2Test021
     * @tc.desc Mindmap fromULong constructs: 0, 1024, -1(64-bit unsigned max), 999 decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.fromULong(0).operatorDecrement().toString()).assertEqual('-1');
      expect(BigInt.fromULong(1024).operatorDecrement().toString()).assertEqual('1023');
      expect(BigInt.fromULong(-1).operatorDecrement().toString()).assertEqual('18446744073709551614');
      expect(BigInt.fromULong(999).operatorDecrement().toString()).assertEqual('998');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2200
     * @tc.name testBigIntOperatorDecrement2Test022
     * @tc.desc Mindmap asIntN/asUintN truncated constructs decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt.asIntN(8, BigInt(127)).operatorDecrement().toString()).assertEqual('126');
      expect(BigInt.asIntN(8, BigInt(-128)).operatorDecrement().toString()).assertEqual('-129');
      expect(BigInt.asUintN(8, BigInt(255)).operatorDecrement().toString()).assertEqual('254');
      expect(BigInt.asIntN(1, BigInt(1)).operatorDecrement().toString()).assertEqual('-2');
      expect(BigInt.asUintN(1, BigInt(1)).operatorDecrement().toString()).assertEqual('0');
      expect(BigInt.asUintN(16, BigInt(65535)).operatorDecrement().toString()).assertEqual('65534');
      expect(BigInt.asUintN(32, BigInt(4294967295)).operatorDecrement().toString()).assertEqual('4294967294');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2300
     * @tc.name testBigIntOperatorDecrement2Test023
     * @tc.desc Mindmap operator-derived BigInt: pow, negate, add, subtract, multiply, divide, mod, bitwise, shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(3).pow(BigInt(3)).operatorDecrement().toString()).assertEqual('26');
      expect(BigInt(-2).pow(BigInt(3)).operatorDecrement().toString()).assertEqual('-9');
      expect(BigInt(-10).negate().operatorDecrement().toString()).assertEqual('9');
      expect(BigInt(10).negate().operatorDecrement().toString()).assertEqual('-11');
      expect(BigInt(10).operatorAdd(BigInt(-3)).operatorDecrement().toString()).assertEqual('6');
      expect(BigInt(4).operatorSubtract(BigInt(10)).operatorDecrement().toString()).assertEqual('-7');
      expect(BigInt(-6).operatorMultiply(BigInt(5)).operatorDecrement().toString()).assertEqual('-31');
      expect(BigInt(20).operatorDivide(BigInt(5)).operatorDecrement().toString()).assertEqual('3');
      expect(BigInt(-35).operatorDivide(BigInt(5)).operatorDecrement().toString()).assertEqual('-8');
      expect(BigInt(23).operatorModule(BigInt(5)).operatorDecrement().toString()).assertEqual('2');
      expect(BigInt(-23).operatorModule(BigInt(5)).operatorDecrement().toString()).assertEqual('-4');
      expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).operatorDecrement().toString()).assertEqual('3');
      expect(BigInt(12).operatorBitwiseOr(BigInt(5)).operatorDecrement().toString()).assertEqual('12');
      expect(BigInt(12).operatorBitwiseXor(BigInt(5)).operatorDecrement().toString()).assertEqual('8');
      expect(BigInt(12).operatorLeftShift(BigInt(1)).operatorDecrement().toString()).assertEqual('23');
      expect(BigInt(12).operatorRightShift(BigInt(1)).operatorDecrement().toString()).assertEqual('5');
      expect(BigInt(12).operatorBitwiseNot().operatorDecrement().toString()).assertEqual('-14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2400
     * @tc.name testBigIntOperatorDecrement2Test024
     * @tc.desc Mindmap format/value-method round-trip: toString, toString(16), toLocaleString, getLong, getULong
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      expect(BigInt(BigInt(123).toString()).operatorDecrement().toString()).assertEqual('122');
      expect(BigInt("0b"+BigInt(8).toString(2)).operatorDecrement().toString()).assertEqual('7');
      expect(BigInt("0x"+BigInt(255).toString(16)).operatorDecrement().toString()).assertEqual('254');
      expect(BigInt(BigInt(5000).getLong()).operatorDecrement().toString()).assertEqual('4999');
      expect(BigInt(BigInt.fromULong(5000).getULong()).operatorDecrement().toString()).assertEqual('4999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2500
     * @tc.name testBigIntOperatorDecrement2Test025
     * @tc.desc Mindmap mid-range numbers: 4294967295, 12345678, -12345678, 123456789, -123456789 decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(4294967295).operatorDecrement().toString()).assertEqual('4294967294');
      expect(BigInt(12345678).operatorDecrement().toString()).assertEqual('12345677');
      expect(BigInt(-12345678).operatorDecrement().toString()).assertEqual('-12345679');
      expect(BigInt(123456789).operatorDecrement().toString()).assertEqual('123456788');
      expect(BigInt(-123456789).operatorDecrement().toString()).assertEqual('-123456790');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2600
     * @tc.name testBigIntOperatorDecrement2Test026
     * @tc.desc Mindmap double float-argument constructed BigInt decrement: 64.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(64.0).operatorDecrement().toString()).assertEqual('63');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2700
     * @tc.name testBigIntOperatorDecrement2Test027
     * @tc.desc Mindmap copy negative instance decrement: new BigInt(new BigInt(-100))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(BigInt(-100)).operatorDecrement().toString()).assertEqual('-101');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2800
     * @tc.name testBigIntOperatorDecrement2Test028
     * @tc.desc Mindmap asUintN 64-bit unsigned max decrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const max = BigInt.asUintN(64, BigInt.fromULong(-1));
      expect(max.operatorDecrement().toString()).assertEqual('18446744073709551614');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_DECREMENT_2900
     * @tc.name testBigIntOperatorDecrement2Test029
     * @tc.desc Decrement from Long.MIN_VALUE produces correct value beyond 64-bit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDecrement2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('-9223372036854775808').operatorDecrement().toString()).assertEqual('-9223372036854775809');
      expect(BigInt('-9223372036854775808').operatorDecrement().operatorLessThan(BigInt('-9223372036854775808'))).assertTrue();
    });
  });
}
