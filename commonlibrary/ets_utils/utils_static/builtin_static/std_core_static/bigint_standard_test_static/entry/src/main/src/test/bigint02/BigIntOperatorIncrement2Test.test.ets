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

export default function BigIntOperatorIncrement2Test(): void {
  describe('testBigIntOperatorIncrement2Test', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0100
     * @tc.name testBigIntOperatorIncrement2Test0100
     * @tc.desc Mindmap initial value boundary matrix: 2->3, 100->101, -100->-99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2).operatorIncrement().toString()).assertEqual('3');
      expect(BigInt(100).operatorIncrement().toString()).assertEqual('101');
      expect(BigInt(-100).operatorIncrement().toString()).assertEqual('-99');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0200
     * @tc.name testBigIntOperatorIncrement2Test0200
     * @tc.desc Mindmap long bound neighborhood: int/short/byte bounds increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorIncrement().toString()).assertEqual('2147483648');
      expect(BigInt(-2147483648).operatorIncrement().toString()).assertEqual('-2147483647');
      expect(BigInt(32767).operatorIncrement().toString()).assertEqual('32768');
      expect(BigInt(-32768).operatorIncrement().toString()).assertEqual('-32767');
      expect(BigInt(127).operatorIncrement().toString()).assertEqual('128');
      expect(BigInt(-128).operatorIncrement().toString()).assertEqual('-127');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0300
     * @tc.name testBigIntOperatorIncrement2Test0300
     * @tc.desc Mindmap huge number matrix: 2^64, 2^128, googol increment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('18446744073709551616').operatorIncrement().toString()).assertEqual('18446744073709551617');
      expect(BigInt('18446744073709551615').operatorIncrement().toString()).assertEqual('18446744073709551616');
      expect(BigInt('340282366920938463463374607431768211456').operatorIncrement().toString()).assertEqual('340282366920938463463374607431768211457');
      const googol = '10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
      const googolPlus1 = '10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001';
      expect(BigInt(googol).operatorIncrement().toString()).assertEqual(googolPlus1);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0400
     * @tc.name testBigIntOperatorIncrement2Test0400
     * @tc.desc Mindmap multiple increments: 10, 100, 1000 consecutive increments from 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x = BigInt(0);
      for (let i = 0; i < 10; i++) {
        x = x.operatorIncrement();
      }
      expect(x.toString()).assertEqual('10');

      x = BigInt(0);
      for (let i = 0; i < 100; i++) {
        x = x.operatorIncrement();
      }
      expect(x.toString()).assertEqual('100');

      x = BigInt(0);
      for (let i = 0; i < 1000; i++) {
        x = x.operatorIncrement();
      }
      expect(x.toString()).assertEqual('1000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0500
     * @tc.name testBigIntOperatorIncrement2Test0500
     * @tc.desc Mindmap multiple increments: negative across zero and long bound consecutive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let x = BigInt(-5);
      for (let i = 0; i < 10; i++) {
        x = x.operatorIncrement();
      }
      expect(x.toString()).assertEqual('5');

      x = BigInt(-3);
      for (let i = 0; i < 5; i++) {
        x = x.operatorIncrement();
      }
      expect(x.toString()).assertEqual('2');

      x = BigInt('9223372036854775807');
      for (let i = 0; i < 100; i++) {
        x = x.operatorIncrement();
      }
      expect(x.toString()).assertEqual('9223372036854775907');
    });


    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0600
     * @tc.name testBigIntOperatorIncrement2Test0600
     * @tc.desc Mindmap return value: doubleValue, getLong, equals, toString length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const r0 = BigInt(0).operatorIncrement();
      expect(r0.doubleValue()).assertEqual(1.0);
      const r100 = BigInt(100).operatorIncrement();
      expect(r100.getLong()).assertEqual(101);
      expect(BigInt(5).operatorIncrement().equals(BigInt(6))).assertTrue();
      const huge = BigInt('115792089237316195423570985008687907853269984665640564039457584007913129639936');
      expect(huge.operatorIncrement().toString().length).assertEqual(78);
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0700
     * @tc.name testBigIntOperatorIncrement2Test0700
     * @tc.desc Mindmap constructor diversity: boolean, string, copy, "007", "+42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).operatorIncrement().toString()).assertEqual('2');
      expect(BigInt(false).operatorIncrement().toString()).assertEqual('1');
      expect(BigInt('123').operatorIncrement().toString()).assertEqual('124');
      expect(BigInt('-50').operatorIncrement().toString()).assertEqual('-49');
      expect(BigInt('007').operatorIncrement().toString()).assertEqual('8');
      expect(BigInt('+42').operatorIncrement().toString()).assertEqual('43');
      const src = BigInt(77);
      expect(BigInt(src).operatorIncrement().toString()).assertEqual('78');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0800
     * @tc.name testBigIntOperatorIncrement2Test0800
     * @tc.desc Mindmap chained operations: inc->dec, inc->add, inc->subtract, triple inc->multiply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorIncrement().operatorDecrement().toString()).assertEqual('100');
      expect(BigInt(5).operatorIncrement().operatorAdd(BigInt(10)).toString()).assertEqual('16');
      expect(BigInt(10).operatorIncrement().operatorSubtract(BigInt(5)).toString()).assertEqual('6');
      expect(BigInt(1).operatorIncrement().operatorIncrement().operatorIncrement().operatorMultiply(BigInt(3)).toString()).assertEqual('12');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_0900
     * @tc.name testBigIntOperatorIncrement2Test0900
     * @tc.desc Mindmap input: operatorIncrement on hex string "0xff"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0xff').operatorIncrement().toString()).assertEqual('256');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1000
     * @tc.name testBigIntOperatorIncrement2Test1000
     * @tc.desc Mindmap input: operatorIncrement on hex string "0x1a"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('0x1a').operatorIncrement().toString()).assertEqual('27');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1100
     * @tc.name testBigIntOperatorIncrement2Test1100
     * @tc.desc Mindmap input: operatorIncrement on string "-0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-0').operatorIncrement().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1200
     * @tc.name testBigIntOperatorIncrement2Test1200
     * @tc.desc Mindmap input: operatorIncrement on copy of huge positive BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: BigInt = BigInt('999999999999999999999');
      expect(BigInt(src).operatorIncrement().toString()).assertEqual('1000000000000000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1300
     * @tc.name testBigIntOperatorIncrement2Test1300
     * @tc.desc Mindmap input: operatorIncrement on copy of huge negative BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: BigInt = BigInt('-999999999999999999999');
      expect(BigInt(src).operatorIncrement().toString()).assertEqual('-999999999999999999998');
    });



    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1400
     * @tc.name testBigIntOperatorIncrement2Test1400
     * @tc.desc Mindmap input: operatorIncrement on negative string "-9999999"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-9999999').operatorIncrement().toString()).assertEqual('-9999998');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1500
     * @tc.name testBigIntOperatorIncrement2Test1500
     * @tc.desc Mindmap input: operatorIncrement on 100-digit ones string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('1'.repeat(100)).operatorIncrement().toString()).assertEqual('1'.repeat(99) + '2');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1600
     * @tc.name testBigIntOperatorIncrement2Test1600
     * @tc.desc Mindmap input: operatorIncrement on 100-digit negative ones string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('-' + '1'.repeat(100)).operatorIncrement().toString()).assertEqual('-' + '1'.repeat(99) + '0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1700
     * @tc.name testBigIntOperatorIncrement2Test1700
     * @tc.desc Mindmap input: operatorIncrement on fromULong(999999999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(999999999).operatorIncrement().toString()).assertEqual('1000000000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1800
     * @tc.name testBigIntOperatorIncrement2Test1800
     * @tc.desc Mindmap chained: negate result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(50).negate().operatorIncrement().toString()).assertEqual('-49');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_1900
     * @tc.name testBigIntOperatorIncrement2Test1900
     * @tc.desc Mindmap chained: bitwise-not result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3).operatorBitwiseNot().operatorIncrement().toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2000
     * @tc.name testBigIntOperatorIncrement2Test2000
     * @tc.desc Mindmap chained: asIntN(8, 100) then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(8, BigInt(100)).operatorIncrement().toString()).assertEqual('101');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2100
     * @tc.name testBigIntOperatorIncrement2Test2100
     * @tc.desc Mindmap chained: asIntN(16, -500) then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asIntN(16, BigInt(-500)).operatorIncrement().toString()).assertEqual('-499');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2200
     * @tc.name testBigIntOperatorIncrement2Test2200
     * @tc.desc Mindmap chained: asUintN(64, 0) then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(64, BigInt(0)).operatorIncrement().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2300
     * @tc.name testBigIntOperatorIncrement2Test2300
     * @tc.desc Mindmap chained: asUintN(8, 200) then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.asUintN(8, BigInt(200)).operatorIncrement().toString()).assertEqual('201');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2400
     * @tc.name testBigIntOperatorIncrement2Test2400
     * @tc.desc Mindmap chained: pow result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(3).pow(BigInt(4)).operatorIncrement().toString()).assertEqual('82');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2500
     * @tc.name testBigIntOperatorIncrement2Test2500
     * @tc.desc Mindmap chained: negative base pow result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-2).pow(BigInt(3)).operatorIncrement().toString()).assertEqual('-7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2600
     * @tc.name testBigIntOperatorIncrement2Test2600
     * @tc.desc Mindmap input: operatorIncrement on fromULong(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt.fromULong(0).operatorIncrement().toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2700
     * @tc.name testBigIntOperatorIncrement2Test2700
     * @tc.desc Mindmap chained: negative bitwiseAnd result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).operatorBitwiseAnd(BigInt(2)).operatorIncrement().toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2800
     * @tc.name testBigIntOperatorIncrement2Test2800
     * @tc.desc Mindmap chained: negative bitwiseXor result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).operatorBitwiseXor(BigInt(2)).operatorIncrement().toString()).assertEqual('-6');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_2900
     * @tc.name testBigIntOperatorIncrement2Test2900
     * @tc.desc Mindmap chained: negative leftShift result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test2900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-4).operatorLeftShift(BigInt(1)).operatorIncrement().toString()).assertEqual('-7');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_3000
     * @tc.name testBigIntOperatorIncrement2Test3000
     * @tc.desc Mindmap chained: negative rightShift result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test3000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-8).operatorRightShift(BigInt(1)).operatorIncrement().toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_3100
     * @tc.name testBigIntOperatorIncrement2Test3100
     * @tc.desc Mindmap chained: negative bitwiseOr result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test3100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).operatorBitwiseOr(BigInt(2)).operatorIncrement().toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_3200
     * @tc.name testBigIntOperatorIncrement2Test3200
     * @tc.desc Mindmap chained: negative module result then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test3200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-11).operatorModule(BigInt(3)).operatorIncrement().toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_3300
     * @tc.name testBigIntOperatorIncrement2Test3300
     * @tc.desc Mindmap chained: getULong result as BigInt then operatorIncrement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test3300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(BigInt(9999).getULong()).operatorIncrement().toString()).assertEqual('10000');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_INCREMENT_3400
     * @tc.name testBigIntOperatorIncrement2Test3400
     * @tc.desc Increment from Long.MAX_VALUE produces correct value beyond 64-bit range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorIncrement2Test3400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9223372036854775807').operatorIncrement().toString()).assertEqual('9223372036854775808');
      expect(BigInt('9223372036854775807').operatorIncrement().operatorGreaterThan(BigInt('9223372036854775807'))).assertTrue();
    });
  });
}
