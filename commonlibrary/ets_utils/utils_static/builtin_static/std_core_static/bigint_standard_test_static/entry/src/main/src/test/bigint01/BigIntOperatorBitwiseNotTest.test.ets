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

export default function BigIntOperatorBitwiseNotTest(): void {
  describe('BigInt.operatorBitwiseNot (mindmap operatorBitwiseNot)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0100
     * @tc.name testBigIntOperatorBitwiseNotBasic0100
     * @tc.desc Verify basic bitwise NOT results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(0).operatorBitwiseNot().toString()).assertEqual('-1');
        expect(BigInt(-1).operatorBitwiseNot().toString()).assertEqual('0');
        expect(BigInt(1).operatorBitwiseNot().toString()).assertEqual('-2');
        expect(BigInt(-2).operatorBitwiseNot().toString()).assertEqual('1');
        expect(BigInt(5).operatorBitwiseNot().toString()).assertEqual('-6');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0200
     * @tc.name testBigIntOperatorBitwiseNotFormula0200
     * @tc.desc Verify ~x equals -(x+1) for sample values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotFormula0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const x = BigInt(100);
        const notX = x.operatorBitwiseNot();
        const minusXPlus1 = x.operatorAdd(BigInt(1)).negate();
        expect(notX.toString()).assertEqual(minusXPlus1.toString());
        expect(BigInt(999).operatorBitwiseNot().toString()).assertEqual('-1000');
        expect(BigInt(-100).operatorBitwiseNot().toString()).assertEqual('99');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0300
     * @tc.name testBigIntOperatorBitwiseNotDouble0300
     * @tc.desc Verify double bitwise NOT restores original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotDouble0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(42).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('42');
        expect(BigInt(-42).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('-42');
        expect(BigInt(0).operatorBitwiseNot().operatorBitwiseNot().toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0400
     * @tc.name testBigIntOperatorBitwiseNotLarge0400
     * @tc.desc Verify bitwise NOT on large BigInt magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotLarge0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const big = '999999999999999999999999999999';
        const notBig = BigInt(big).operatorBitwiseNot();
        const expected = BigInt(big).operatorAdd(BigInt(1)).negate();
        expect(notBig.toString()).assertEqual(expected.toString());
        expect(BigInt('18446744073709551616').operatorBitwiseNot().toString()).assertEqual('-18446744073709551617');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0500
     * @tc.name testBigIntOperatorBitwiseNotReturnType0500
     * @tc.desc Verify operatorBitwiseNot returns BigInt distinct from operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const five = BigInt(5);
        const result = five.operatorBitwiseNot();
        expect(typeof result === 'bigint').assertTrue();
        expect(result.equals(five)).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_NOT_0600
     * @tc.name testBigIntOperatorBitwiseNotNoThrow0600
     * @tc.desc Verify operatorBitwiseNot does not throw on normal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseNotNoThrow0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let ok = true;
        try {
          BigInt(5).operatorBitwiseNot();
          BigInt('9999999999999999999999999').operatorBitwiseNot();
        } catch (_e) {
          ok = false;
        }
        expect(ok).assertTrue();
      });
  });
}
