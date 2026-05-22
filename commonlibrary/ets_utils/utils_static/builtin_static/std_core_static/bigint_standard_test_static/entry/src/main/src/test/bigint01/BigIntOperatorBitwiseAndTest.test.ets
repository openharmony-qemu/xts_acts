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
        expect(new BigInt(12).operatorBitwiseAnd(new BigInt(5)).toString()).assertEqual('4');
        expect(new BigInt(0).operatorBitwiseAnd(new BigInt(5)).toString()).assertEqual('0');
        expect(new BigInt(5).operatorBitwiseAnd(new BigInt(0)).toString()).assertEqual('0');
        expect(new BigInt(-1).operatorBitwiseAnd(new BigInt(7)).toString()).assertEqual('7');
        expect(new BigInt(7).operatorBitwiseAnd(new BigInt(-1)).toString()).assertEqual('7');
        expect(new BigInt(-3).operatorBitwiseAnd(new BigInt(-5)).toString()).assertEqual('-7');
        expect(new BigInt(15).operatorBitwiseAnd(new BigInt(-1)).toString()).assertEqual('15');
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
        expect(new BigInt(12345).operatorBitwiseAnd(new BigInt(0)).toString()).assertEqual('0');
        expect(new BigInt(-12345).operatorBitwiseAnd(new BigInt(0)).toString()).assertEqual('0');
        expect(new BigInt(42).operatorBitwiseAnd(new BigInt(-1)).toString()).assertEqual('42');
        expect(new BigInt(-42).operatorBitwiseAnd(new BigInt(-1)).toString()).assertEqual('-42');
        const val = new BigInt(99);
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
        const a = new BigInt(12);
        const b = new BigInt(10);
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
        const left = new BigInt(12);
        const right = new BigInt(5);
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
        const left = new BigInt(12);
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
  });
}
