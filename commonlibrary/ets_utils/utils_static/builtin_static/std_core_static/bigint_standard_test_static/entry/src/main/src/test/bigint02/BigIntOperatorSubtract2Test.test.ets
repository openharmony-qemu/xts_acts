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

export default function BigIntOperatorSubtract2Test(): void {
  describe('testBigIntOperatorSubtract2Test', (): void => {

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1000
     * @tc.name testBigIntOperatorSubtract2Test010
     * @tc.desc Mindmap input: zero subtract various values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1100
     * @tc.name testBigIntOperatorSubtract2Test011
     * @tc.desc Mindmap input: positive subtract positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorSubtract(BigInt(3)).toString()).assertEqual('2');
      expect(BigInt(3).operatorSubtract(BigInt(8)).toString()).assertEqual('-5');
      expect(BigInt(10).operatorSubtract(BigInt(20)).toString()).assertEqual('-10');
      expect(BigInt(100).operatorSubtract(BigInt(50)).toString()).assertEqual('50');
      expect(BigInt(127).operatorSubtract(BigInt(1)).toString()).assertEqual('126');
      expect(BigInt(32767).operatorSubtract(BigInt(1)).toString()).assertEqual('32766');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1200
     * @tc.name testBigIntOperatorSubtract2Test012
     * @tc.desc Mindmap input: negative subtract negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(-5).operatorSubtract(BigInt(-3)).toString()).assertEqual('-2');
      expect(BigInt(-3).operatorSubtract(BigInt(-8)).toString()).assertEqual('5');
      expect(BigInt(-10).operatorSubtract(BigInt(-7)).toString()).assertEqual('-3');
      expect(BigInt(-128).operatorSubtract(BigInt(-1)).toString()).assertEqual('-127');
      expect(BigInt(-32768).operatorSubtract(BigInt(-1)).toString()).assertEqual('-32767');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1300
     * @tc.name testBigIntOperatorSubtract2Test013
     * @tc.desc Mindmap input: positive subtract negative and negative subtract positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(5).operatorSubtract(BigInt(-3)).toString()).assertEqual('8');
      expect(BigInt(-5).operatorSubtract(BigInt(3)).toString()).assertEqual('-8');
      expect(BigInt(10).operatorSubtract(BigInt(-5)).toString()).assertEqual('15');
      expect(BigInt(-10).operatorSubtract(BigInt(5)).toString()).assertEqual('-15');
      expect(BigInt(100).operatorSubtract(BigInt(-100)).toString()).assertEqual('200');
      expect(BigInt(-100).operatorSubtract(BigInt(100)).toString()).assertEqual('-200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1400
     * @tc.name testBigIntOperatorSubtract2Test014
     * @tc.desc Mindmap input: boundary value cross combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(127).operatorSubtract(BigInt(-128)).toString()).assertEqual('255');
      expect(BigInt(-128).operatorSubtract(BigInt(127)).toString()).assertEqual('-255');
      expect(BigInt(32767).operatorSubtract(BigInt(-32768)).toString()).assertEqual('65535');
      expect(BigInt(-32768).operatorSubtract(BigInt(32767)).toString()).assertEqual('-65535');
      expect(BigInt(2147483647).operatorSubtract(BigInt(-2147483648)).toString()).assertEqual('4294967295');
      expect(BigInt(-2147483648).operatorSubtract(BigInt(2147483647)).toString()).assertEqual('-4294967295');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1500
     * @tc.name testBigIntOperatorSubtract2Test015
     * @tc.desc Mindmap input: large number subtraction with borrow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('100000000000000000000').operatorSubtract(BigInt(1)).toString()).assertEqual('99999999999999999999');
      expect(BigInt('12345678901234567890').operatorSubtract(BigInt('12345678901234567890')).toString()).assertEqual('0');
      expect(BigInt('999999999999999999999999999999').operatorSubtract(BigInt('1')).toString()).assertEqual('999999999999999999999999999998');
      expect(BigInt('111111111111111111111111111111').operatorSubtract(BigInt('222222222222222222222222222222')).toString()).assertEqual('-111111111111111111111111111111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1600
     * @tc.name testBigIntOperatorSubtract2Test016
     * @tc.desc Mindmap property: subtraction is NOT commutative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(42);
      const b = BigInt(58);
      const r1 = a.operatorSubtract(b);
      const r2 = b.operatorSubtract(a);
      expect(r1.toString()).assertEqual('-16');
      expect(r2.toString()).assertEqual('16');
      expect(r1.equals(r2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1700
     * @tc.name testBigIntOperatorSubtract2Test017
     * @tc.desc Mindmap input: various constructor source combinations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const orig = BigInt(10);
      const copy = BigInt(orig);
      expect(copy.operatorSubtract(BigInt(3)).toString()).assertEqual('7');
      expect(BigInt(5.0).operatorSubtract(BigInt(2)).toString()).assertEqual('3');
      expect(BigInt('789').operatorSubtract(BigInt('123')).toString()).assertEqual('666');
      expect(BigInt(8).operatorSubtract(BigInt(true)).toString()).assertEqual('7');
      expect(BigInt(5).operatorSubtract(BigInt(false)).toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1800
     * @tc.name testBigIntOperatorSubtract2Test018
     * @tc.desc Mindmap return value: equals verification and chained subtraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = BigInt(100);
      const b = BigInt(30);
      const c = BigInt(20);
      const result = a.operatorSubtract(b).operatorSubtract(c);
      expect(result.toString()).assertEqual('50');
      expect(result.equals(BigInt(50))).assertTrue();
      expect(BigInt(15).operatorSubtract(BigInt(6)).equals(BigInt(9))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_1900
     * @tc.name testBigIntOperatorSubtract2Test019
     * @tc.desc Mindmap input: zero subtract boolean/string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(0).operatorSubtract(BigInt(true)).toString()).assertEqual('-1');
      expect(BigInt(0).operatorSubtract(BigInt(false)).toString()).assertEqual('0');
      expect(BigInt(0).operatorSubtract(BigInt('-0')).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2000
     * @tc.name testBigIntOperatorSubtract2Test020
     * @tc.desc Mindmap input: intMax boundary subtract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(2147483647).operatorSubtract(BigInt(1)).toString()).assertEqual('2147483646');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2100
     * @tc.name testBigIntOperatorSubtract2Test021
     * @tc.desc Mindmap input: self-subtract and equal-magnitude subtract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(42).operatorSubtract(BigInt(42)).toString()).assertEqual('0');
      expect(BigInt(100).operatorSubtract(BigInt(100)).toString()).assertEqual('0');
      expect(BigInt(-100).operatorSubtract(BigInt(100)).toString()).assertEqual('-200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2200
     * @tc.name testBigIntOperatorSubtract2Test022
     * @tc.desc Mindmap input: Boolean as 'this' operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorSubtract(BigInt(3)).toString()).assertEqual('-2');
      expect(BigInt(false).operatorSubtract(BigInt(3)).toString()).assertEqual('-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2300
     * @tc.name testBigIntOperatorSubtract2Test023
     * @tc.desc Mindmap input: ULong max minus 1, result equals ULong max minus 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ulongMax = BigInt.fromULong(Long.MAX_VALUE);
      expect(ulongMax.operatorSubtract(BigInt(1)).toString()).assertEqual('9223372036854775806');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2400
     * @tc.name testBigIntOperatorSubtract2Test024
     * @tc.desc Mindmap input: ULong max minus ULong max, result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ulongMax = BigInt.fromULong(Long.MAX_VALUE);
      expect(ulongMax.operatorSubtract(ulongMax).toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2500
     * @tc.name testBigIntOperatorSubtract2Test025
     * @tc.desc Mindmap input: decimal string minus hex string, result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt('100').operatorSubtract(BigInt('0x64')).toString(16)).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2600
     * @tc.name testBigIntOperatorSubtract2Test026
     * @tc.desc Mindmap input: boolean true minus boolean false, result is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(true).operatorSubtract(BigInt(false)).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2700
     * @tc.name testBigIntOperatorSubtract2Test027
     * @tc.desc Mindmap input: boolean false minus boolean true, result is -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(false).operatorSubtract(BigInt(true)).toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2800
     * @tc.name testBigIntOperatorSubtract2Test028
     * @tc.desc Mindmap input: subtract result equals Long max, verify correctness
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMax = BigInt('9223372036854775807');
      expect(longMax.operatorSubtract(BigInt(1)).operatorAdd(BigInt(1)).equals(longMax)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_2900
     * @tc.name testBigIntOperatorSubtract2Test029
     * @tc.desc Mindmap input: subtract two negative numbers from longMin, result is larger than longMin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longMin = BigInt('-9223372036854775808');
      expect(longMin.operatorSubtract(BigInt(-1)).operatorSubtract(BigInt(-1)).equals(longMin)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_3000
     * @tc.name testBigIntOperatorSubtract2Test030
     * @tc.desc Mindmap input: subtract result is negative power of 2, verify result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(BigInt(4).operatorSubtract(BigInt(8)).toString()).assertEqual('-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT_OPERATOR_SUBTRACT_3100
     * @tc.name testBigIntOperatorSubtract2Test031
     * @tc.desc Mindmap input: huge number self subtract, result is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtract2Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const huge = BigInt('9007199254740993000');
      expect(huge.operatorSubtract(huge).toString()).assertEqual('0');
    });
  });
}