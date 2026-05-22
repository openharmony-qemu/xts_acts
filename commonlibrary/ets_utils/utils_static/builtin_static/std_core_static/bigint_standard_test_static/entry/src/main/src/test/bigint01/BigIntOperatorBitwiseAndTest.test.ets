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

export default function BigIntOperatorBitwiseAndTest(): void {
  describe('BigInt.operatorBitwiseAnd (mindmap operatorBitwiseAnd)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0100
     * @tc.name testBigIntOperatorBitwiseAndBasic0100
     * @tc.desc Verify basic bitwise AND results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(12).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('4');
        expect(BigInt(0).operatorBitwiseAnd(BigInt(5)).toString()).assertEqual('0');
        expect(BigInt(5).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
        expect(BigInt(-1).operatorBitwiseAnd(BigInt(7)).toString()).assertEqual('7');
        expect(BigInt(7).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('7');
        expect(BigInt(-3).operatorBitwiseAnd(BigInt(-5)).toString()).assertEqual('-7');
        expect(BigInt(15).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('15');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0200
     * @tc.name testBigIntOperatorBitwiseAndLaws0200
     * @tc.desc Verify zero absorption, minus-one mask, and idempotent x and x
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLaws0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(12345).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
        expect(BigInt(-12345).operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
        expect(BigInt(42).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('42');
        expect(BigInt(-42).operatorBitwiseAnd(BigInt(-1)).toString()).assertEqual('-42');
        const val = BigInt(99);
        expect(val.operatorBitwiseAnd(val).toString()).assertEqual('99');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0300
     * @tc.name testBigIntOperatorBitwiseAndCommutative0300
     * @tc.desc Verify commutative property of bitwise AND
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndCommutative0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt(12);
        const b = BigInt(10);
        expect(a.operatorBitwiseAnd(b).toString()).assertEqual(b.operatorBitwiseAnd(a).toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0400
     * @tc.name testBigIntOperatorBitwiseAndImmutability0400
     * @tc.desc Verify operatorBitwiseAnd does not mutate operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndImmutability0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const left = BigInt(12);
        const right = BigInt(5);
        const origL = left.toString();
        const origR = right.toString();
        left.operatorBitwiseAnd(right);
        expect(left.toString()).assertEqual(origL);
        expect(right.toString()).assertEqual(origR);
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0500
     * @tc.name testBigIntOperatorBitwiseAndInvalidArg0500
     * @tc.desc Verify operatorBitwiseAnd rejects invalid operand types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const left = BigInt(12);
        expect((): void => {
          left.operatorBitwiseAnd(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          left.operatorBitwiseAnd(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          left.operatorBitwiseAnd(5 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          left.operatorBitwiseAnd('5' as object as BigInt);
        }).assertThrowError('ClassCastError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_BITWISE_AND_0600
     * @tc.name testBigIntOperatorBitwiseAndLarge0600
     * @tc.desc Verify bitwise AND on magnitudes beyond Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorBitwiseAndLarge0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const mask = BigInt('18446744073709551615');
        const huge = BigInt('999999999999999999999999999999');
        expect(huge.operatorBitwiseAnd(mask).toString()).assertEqual('5076944270305263615');
        expect(huge.operatorBitwiseAnd(BigInt(0)).toString()).assertEqual('0');
        expect(BigInt('-9223372036854775808').operatorBitwiseAnd(mask).toString())
          .assertEqual('9223372036854775808');
      });
  });
}
