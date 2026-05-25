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

export default function BigIntOperatorLeftShiftTest(): void {
  describe('BigInt.operatorLeftShift (mindmap operatorLeftShift)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0100
     * @tc.name testBigIntOperatorLeftShiftBasic0100
     * @tc.desc Verify operatorLeftShift basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(1).operatorLeftShift(BigInt(8)).toString()).assertEqual('256');
        expect(BigInt(5).operatorLeftShift(BigInt(1)).toString()).assertEqual('10');
        expect(BigInt(-1).operatorLeftShift(BigInt(1)).toString()).assertEqual('-2');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0200
     * @tc.name testBigIntOperatorLeftShiftZero0200
     * @tc.desc Verify operatorLeftShift with zero shift amount and zero operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(42).operatorLeftShift(BigInt(0)).toString()).assertEqual('42');
        expect(BigInt(0).operatorLeftShift(BigInt(5)).toString()).assertEqual('0');
        expect(BigInt(-8).operatorLeftShift(BigInt(0)).toString()).assertEqual('-8');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0300
     * @tc.name testBigIntOperatorLeftShiftLarge0300
     * @tc.desc Verify operatorLeftShift with large operands and shift amounts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftLarge0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(1).operatorLeftShift(BigInt(64)).toString())
          .assertEqual('18446744073709551616');
        expect(BigInt('9223372036854775807').operatorLeftShift(BigInt(1)).toString())
          .assertEqual('18446744073709551614');
        expect(BigInt(-1).operatorLeftShift(BigInt(100)).toString())
          .assertEqual('-1267650600228229401496703205376');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0400
     * @tc.name testBigIntOperatorLeftShiftReturn0400
     * @tc.desc Verify operatorLeftShift returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftReturn0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof BigInt(1).operatorLeftShift(BigInt(2)) === 'bigint').assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LSHIFT_0500
     * @tc.name testBigIntOperatorLeftShiftInvalid0500
     * @tc.desc Verify operatorLeftShift rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLeftShiftInvalid0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt(1);
        expect((): void => {
          a.operatorLeftShift(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLeftShift(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLeftShift('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLeftShift(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLeftShift(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
  });
}
