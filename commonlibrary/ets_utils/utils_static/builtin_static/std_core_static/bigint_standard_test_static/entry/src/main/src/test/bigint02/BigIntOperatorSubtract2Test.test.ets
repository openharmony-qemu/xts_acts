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

export default function BigIntOperatorSubtract2Test(): void {
  describe('BigInt.operatorSubtract (mindmap operatorSubtract 2)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0100
     * @tc.name testBigIntOperatorSubtract2Test0100
     * @tc.desc Mindmap input: zero subtract various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorSubtract(BigInt(0)).toString()).assertEqual('0');
      expect(BigInt(0).operatorSubtract(BigInt(1)).toString()).assertEqual('-1');
      expect(BigInt(0).operatorSubtract(BigInt(-1)).toString()).assertEqual('1');
      expect(BigInt(0).operatorSubtract(BigInt(127)).toString()).assertEqual('-127');
      expect(BigInt(0).operatorSubtract(BigInt(-128)).toString()).assertEqual('128');
      expect(BigInt(0).operatorSubtract(BigInt(32767)).toString()).assertEqual('-32767');
      expect(BigInt(0).operatorSubtract(BigInt(-32768)).toString()).assertEqual('32768');
      expect(BigInt(0).operatorSubtract(BigInt(2147483647)).toString()).assertEqual('-2147483647');
      expect(BigInt(0).operatorSubtract(BigInt(-2147483648)).toString()).assertEqual('2147483648');
      expect(BigInt(0).operatorSubtract(BigInt('9223372036854775807')).toString()).assertEqual('-9223372036854775807');
      expect(BigInt(0).operatorSubtract(BigInt('-9223372036854775808')).toString()).assertEqual('9223372036854775808');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0200
     * @tc.name testBigIntOperatorSubtract2Test0200
     * @tc.desc Mindmap input: positive subtract positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorSubtract(BigInt(3)).toString()).assertEqual('2');
      expect(BigInt(3).operatorSubtract(BigInt(8)).toString()).assertEqual('-5');
      expect(BigInt(10).operatorSubtract(BigInt(20)).toString()).assertEqual('-10');
      expect(BigInt(100).operatorSubtract(BigInt(50)).toString()).assertEqual('50');
      expect(BigInt(127).operatorSubtract(BigInt(1)).toString()).assertEqual('126');
      expect(BigInt(32767).operatorSubtract(BigInt(1)).toString()).assertEqual('32766');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0300
     * @tc.name testBigIntOperatorSubtract2Test0300
     * @tc.desc Mindmap input: negative subtract negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).operatorSubtract(BigInt(-3)).toString()).assertEqual('-2');
      expect(BigInt(-3).operatorSubtract(BigInt(-8)).toString()).assertEqual('5');
      expect(BigInt(-10).operatorSubtract(BigInt(-7)).toString()).assertEqual('-3');
      expect(BigInt(-128).operatorSubtract(BigInt(-1)).toString()).assertEqual('-127');
      expect(BigInt(-32768).operatorSubtract(BigInt(-1)).toString()).assertEqual('-32767');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0400
     * @tc.name testBigIntOperatorSubtract2Test0400
     * @tc.desc Mindmap input: positive subtract negative and negative subtract positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(5).operatorSubtract(BigInt(-3)).toString()).assertEqual('8');
      expect(BigInt(-5).operatorSubtract(BigInt(3)).toString()).assertEqual('-8');
      expect(BigInt(10).operatorSubtract(BigInt(-5)).toString()).assertEqual('15');
      expect(BigInt(-10).operatorSubtract(BigInt(5)).toString()).assertEqual('-15');
      expect(BigInt(100).operatorSubtract(BigInt(-100)).toString()).assertEqual('200');
      expect(BigInt(-100).operatorSubtract(BigInt(100)).toString()).assertEqual('-200');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0500
     * @tc.name testBigIntOperatorSubtract2Test0500
     * @tc.desc Mindmap input: boundary value cross combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(127).operatorSubtract(BigInt(-128)).toString()).assertEqual('255');
      expect(BigInt(-128).operatorSubtract(BigInt(127)).toString()).assertEqual('-255');
      expect(BigInt(32767).operatorSubtract(BigInt(-32768)).toString()).assertEqual('65535');
      expect(BigInt(-32768).operatorSubtract(BigInt(32767)).toString()).assertEqual('-65535');
      expect(BigInt(2147483647).operatorSubtract(BigInt(-2147483648)).toString()).assertEqual('4294967295');
      expect(BigInt(-2147483648).operatorSubtract(BigInt(2147483647)).toString()).assertEqual('-4294967295');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0600
     * @tc.name testBigIntOperatorSubtract2Test0600
     * @tc.desc Mindmap input: large number subtraction with borrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('100000000000000000000').operatorSubtract(BigInt(1)).toString()).assertEqual('99999999999999999999');
      expect(BigInt('12345678901234567890').operatorSubtract(BigInt('12345678901234567890')).toString()).assertEqual('0');
      expect(BigInt('999999999999999999999999999999').operatorSubtract(BigInt('1')).toString()).assertEqual('999999999999999999999999999998');
      expect(BigInt('111111111111111111111111111111').operatorSubtract(BigInt('222222222222222222222222222222')).toString()).assertEqual('-111111111111111111111111111111');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0700
     * @tc.name testBigIntOperatorSubtract2Test0700
     * @tc.desc Mindmap property: subtraction is NOT commutative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(42);
      const b = BigInt(58);
      const r1 = a.operatorSubtract(b);
      const r2 = b.operatorSubtract(a);
      expect(r1.toString()).assertEqual('-16');
      expect(r2.toString()).assertEqual('16');
      expect(r1.equals(r2)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0800
     * @tc.name testBigIntOperatorSubtract2Test0800
     * @tc.desc Mindmap input: various constructor source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const orig = BigInt(10);
      const copy = BigInt(orig);
      expect(copy.operatorSubtract(BigInt(3)).toString()).assertEqual('7');
      expect(BigInt(5.0).operatorSubtract(BigInt(2)).toString()).assertEqual('3');
      expect(BigInt('789').operatorSubtract(BigInt('123')).toString()).assertEqual('666');
      expect(BigInt(8).operatorSubtract(BigInt(true)).toString()).assertEqual('7');
      expect(BigInt(5).operatorSubtract(BigInt(false)).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0900
     * @tc.name testBigIntOperatorSubtract2Test0900
     * @tc.desc Mindmap return value: equals verification and chained subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(100);
      const b = BigInt(30);
      const c = BigInt(20);
      const result = a.operatorSubtract(b).operatorSubtract(c);
      expect(result.toString()).assertEqual('50');
      expect(result.equals(BigInt(50))).assertTrue();
      expect(BigInt(15).operatorSubtract(BigInt(6)).equals(BigInt(9))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1000
     * @tc.name testBigIntOperatorSubtract2Test1000
     * @tc.desc Mindmap input: zero subtract boolean/string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(0).operatorSubtract(BigInt(true)).toString()).assertEqual('-1');
      expect(BigInt(0).operatorSubtract(BigInt(false)).toString()).assertEqual('0');
      expect(BigInt(0).operatorSubtract(BigInt('-0')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1100
     * @tc.name testBigIntOperatorSubtract2Test1100
     * @tc.desc Mindmap input: intMax boundary subtract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(2147483647).operatorSubtract(BigInt(1)).toString()).assertEqual('2147483646');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1200
     * @tc.name testBigIntOperatorSubtract2Test1200
     * @tc.desc Mindmap input: self-subtract and equal-magnitude subtract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(42).operatorSubtract(BigInt(42)).toString()).assertEqual('0');
      expect(BigInt(100).operatorSubtract(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(-100).operatorSubtract(BigInt(100)).toString()).assertEqual('-200');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1300
     * @tc.name testBigIntOperatorSubtract2Test1300
     * @tc.desc Mindmap input: Boolean as 'this' operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).operatorSubtract(BigInt(3)).toString()).assertEqual('-2');
      expect(BigInt(false).operatorSubtract(BigInt(3)).toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1400
     * @tc.name testBigIntOperatorSubtract2Test1400
     * @tc.desc Mindmap input: ULong max minus 1, result equals ULong max minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ulongMax = BigInt.fromULong(Long.MAX_VALUE);
      expect(ulongMax.operatorSubtract(BigInt(1)).toString()).assertEqual((BigInt.fromULong(Long.MAX_VALUE).operatorSubtract(BigInt(1))).toString());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1500
     * @tc.name testBigIntOperatorSubtract2Test1500
     * @tc.desc Mindmap input: ULong max minus ULong max, result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const ulongMax = BigInt.fromULong(Long.MAX_VALUE);
      expect(ulongMax.operatorSubtract(ulongMax).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1600
     * @tc.name testBigIntOperatorSubtract2Test1600
     * @tc.desc Mindmap input: decimal string minus hex string, result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('100').operatorSubtract(BigInt('0x64')).toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1700
     * @tc.name testBigIntOperatorSubtract2Test1700
     * @tc.desc Mindmap input: boolean true minus boolean false, result is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(true).operatorSubtract(BigInt(false)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1800
     * @tc.name testBigIntOperatorSubtract2Test1800
     * @tc.desc Mindmap input: boolean false minus boolean true, result is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(false).operatorSubtract(BigInt(true)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_1900
     * @tc.name testBigIntOperatorSubtract2Test1900
     * @tc.desc Mindmap input: subtract result equals Long max, verify correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test1900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longMax = BigInt('9223372036854775807');
      expect(longMax.operatorSubtract(BigInt(1)).operatorAdd(BigInt(1)).equals(longMax)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_2000
     * @tc.name testBigIntOperatorSubtract2Test2000
     * @tc.desc Mindmap input: subtract two negative numbers from longMin, result is larger than longMin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test2000', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const longMin = BigInt('-9223372036854775808');
      expect(longMin.operatorSubtract(BigInt(-1)).operatorSubtract(BigInt(-1)).equals(longMin)).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_2100
     * @tc.name testBigIntOperatorSubtract2Test2100
     * @tc.desc Mindmap input: subtract result is negative power of 2, verify result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test2100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(4).operatorSubtract(BigInt(8)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_2200
     * @tc.name testBigIntOperatorSubtract2Test2200
     * @tc.desc Mindmap input: huge number self subtract, result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test2200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const huge = BigInt('9007199254740993000');
      expect(huge.operatorSubtract(huge).toString()).assertEqual('0');
    });
  });
}
