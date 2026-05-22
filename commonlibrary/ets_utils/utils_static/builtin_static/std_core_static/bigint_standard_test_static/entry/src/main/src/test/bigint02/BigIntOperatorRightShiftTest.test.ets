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

export default function BigIntOperatorRightShiftTest(): void {
  describe('BigInt.operatorRightShift (mindmap operatorRightShift)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0100
     * @tc.name testBigIntOperatorRightShiftBasic0100
     * @tc.desc Verify operatorRightShift basic cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(256).operatorRightShift(new BigInt(8)).toString()).assertEqual('1');
        expect(new BigInt(10).operatorRightShift(new BigInt(1)).toString()).assertEqual('5');
        expect(new BigInt(-8).operatorRightShift(new BigInt(1)).toString()).assertEqual('-4');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0200
     * @tc.name testBigIntOperatorRightShiftNegative0200
     * @tc.desc Verify operatorRightShift on negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(-1).operatorRightShift(new BigInt(100)).toString()).assertEqual('-1');
        expect(new BigInt('-9223372036854775808').operatorRightShift(new BigInt(1)).toString())
          .assertEqual('-4611686018427387904');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0300
     * @tc.name testBigIntOperatorRightShiftInvalid0300
     * @tc.desc Verify operatorRightShift rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftInvalid0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(256);
        expect((): void => {
          a.operatorRightShift(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorRightShift(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0400
     * @tc.name testBigIntOperatorRightShiftZero0400
     * @tc.desc Verify operatorRightShift with zero shift amount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftZero0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(42).operatorRightShift(new BigInt(0)).toString()).assertEqual('42');
        expect(new BigInt(0).operatorRightShift(new BigInt(5)).toString()).assertEqual('0');
        expect(new BigInt(-8).operatorRightShift(new BigInt(0)).toString()).assertEqual('-8');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0500
     * @tc.name testBigIntOperatorRightShiftNegativeShift0500
     * @tc.desc Verify negative shift reverses direction: rightShift(n, -k) equals leftShift(n, k)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftNegativeShift0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(10).operatorRightShift(new BigInt(-1)).toString()).assertEqual('20');
        expect(new BigInt(256).operatorRightShift(new BigInt(-2)).toString()).assertEqual('1024');
        const v = new BigInt(10);
        expect(v.operatorRightShift(new BigInt(-1)).toString())
          .assertEqual(v.operatorLeftShift(new BigInt(1)).toString());
        const w = new BigInt(256);
        expect(w.operatorRightShift(new BigInt(-2)).toString())
          .assertEqual(w.operatorLeftShift(new BigInt(2)).toString());
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_RSHIFT_0600
     * @tc.name testBigIntOperatorRightShiftHuge0600
     * @tc.desc Verify operatorRightShift with extremely large shift amounts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorRightShiftHuge0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('18446744073709551616').operatorRightShift(new BigInt(64)).toString())
          .assertEqual('1');
        expect(new BigInt(8).operatorRightShift(new BigInt(1000)).toString()).assertEqual('0');
        expect(new BigInt(1).operatorRightShift(new BigInt(10000)).toString()).assertEqual('0');
      });
  });
}
