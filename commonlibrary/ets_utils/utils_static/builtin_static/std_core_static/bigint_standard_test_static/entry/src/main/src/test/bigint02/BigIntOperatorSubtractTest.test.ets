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

export default function BigIntOperatorSubtractTest(): void {
  describe('BigInt.operatorSubtract (mindmap operatorSubtract)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0100
     * @tc.name testBigIntOperatorSubtractBasic0100
     * @tc.desc Verify operatorSubtract basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(12).operatorSubtract(BigInt(5)).toString()).assertEqual('7');
        expect(BigInt(20).operatorSubtract(BigInt(-5)).toString()).assertEqual('25');
        expect(BigInt(-10).operatorSubtract(BigInt(5)).toString()).assertEqual('-15');
        expect(BigInt(-8).operatorSubtract(BigInt(-3)).toString()).assertEqual('-5');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0200
     * @tc.name testBigIntOperatorSubtractZero0200
     * @tc.desc Verify operatorSubtract zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(42).operatorSubtract(BigInt(0)).toString()).assertEqual('42');
        expect(BigInt(0).operatorSubtract(BigInt(0)).toString()).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0300
     * @tc.name testBigIntOperatorSubtractLarge0300
     * @tc.desc Verify operatorSubtract large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractLarge0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('99999999999999999999').operatorSubtract(BigInt('12345678901234567890')).toString()).assertEqual('87654321098765432109');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0400
     * @tc.name testBigIntOperatorSubtractReturnType0400
     * @tc.desc Verify operatorSubtract returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = BigInt(10).operatorSubtract(BigInt(3));
        expect(typeof result === 'bigint').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0500
     * @tc.name testBigIntOperatorSubtractInvalidArg0500
     * @tc.desc Verify operatorSubtract rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt(10);
        expect((): void => {
          a.operatorSubtract(null as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorSubtract(undefined as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorSubtract('abc' as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorSubtract(123 as Object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorSubtract(true as Object as BigInt);
        }).assertThrowError('ClassCastError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0600
     * @tc.name testBigIntOperatorSubtractSelfZero0600
     * @tc.desc Verify x.operatorSubtract(x) yields zero for varied magnitudes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractSelfZero0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = BigInt(0);
        expect(BigInt(42).operatorSubtract(BigInt(42)).equals(zero)).assertTrue();
        expect(BigInt(-99).operatorSubtract(BigInt(-99)).toString()).assertEqual('0');
        const huge = BigInt('999999999999999999999999999999');
        expect(huge.operatorSubtract(huge).toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_SUBTRACT_0700
     * @tc.name testBigIntOperatorSubtractBorrow0700
     * @tc.desc Verify operatorSubtract borrow across digit boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorSubtractBorrow0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(1000).operatorSubtract(BigInt(1)).toString()).assertEqual('999');
        expect(BigInt('100000000000000000000').operatorSubtract(BigInt(1)).toString())
          .assertEqual('99999999999999999999');
        expect(BigInt(0).operatorSubtract(BigInt(1)).toString()).assertEqual('-1');
        expect(BigInt('9223372036854775808').operatorSubtract(BigInt('9223372036854775807')).toString())
          .assertEqual('1');
      });
  });
}
