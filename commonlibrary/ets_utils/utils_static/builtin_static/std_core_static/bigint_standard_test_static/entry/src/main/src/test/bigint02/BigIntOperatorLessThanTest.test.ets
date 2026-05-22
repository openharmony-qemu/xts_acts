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

export default function BigIntOperatorLessThanTest(): void {
  describe('BigInt.operatorLessThan (operatorLessThan)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0100
     * @tc.name testBigIntOperatorLessThanBasic0100
     * @tc.desc Verify operatorLessThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(3).operatorLessThan(BigInt(5))).assertTrue();
        expect(BigInt(-10).operatorLessThan(BigInt(-3))).assertTrue();
        expect(BigInt(50).operatorLessThan(BigInt(100))).assertTrue();
        expect(BigInt(5).operatorLessThan(BigInt(3))).assertFalse();
        expect(BigInt(0).operatorLessThan(BigInt(0))).assertFalse();
        expect(BigInt(42).operatorLessThan(BigInt(42))).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0200
     * @tc.name testBigIntOperatorLessThanBoundary0200
     * @tc.desc Verify operatorLessThan boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(BigInt(maxSafe).operatorLessThan(BigInt('9007199254740990'))).assertFalse();
        expect(BigInt('9007199254740990').operatorLessThan(BigInt(maxSafe))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0500
     * @tc.name testBigIntOperatorLessThanZero0500
     * @tc.desc Verify operatorLessThan zero and sign boundary cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanZero0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(-1).operatorLessThan(BigInt(0))).assertTrue();
        expect(BigInt(0).operatorLessThan(BigInt(1))).assertTrue();
        expect(BigInt(-100).operatorLessThan(BigInt(0))).assertTrue();
        expect(BigInt(0).operatorLessThan(BigInt(-1))).assertFalse();
        expect(BigInt(0).operatorLessThan(BigInt(0))).assertFalse();
        expect(BigInt(1).operatorLessThan(BigInt(0))).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0300
     * @tc.name testBigIntOperatorLessThanReturnType0300
     * @tc.desc Verify operatorLessThan returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof BigInt(1).operatorLessThan(BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0400
     * @tc.name testBigIntOperatorLessThanInvalidArg0400
     * @tc.desc Verify operatorLessThan rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanInvalidArg0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt(10);
        expect((): void => {
          a.operatorLessThan(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThan(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThan('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThan(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThan(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0600
     * @tc.name testBigIntOperatorLessThanLongBoundary0600
     * @tc.desc Verify operatorLessThan at long min and max boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanLongBoundary0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt('-9223372036854775808').operatorLessThan(BigInt('-9223372036854775807'))).assertTrue();
        expect(BigInt('9223372036854775806').operatorLessThan(BigInt('9223372036854775807'))).assertTrue();
        expect(BigInt('9223372036854775807').operatorLessThan(BigInt('9223372036854775807'))).assertFalse();
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0700
     * @tc.name testBigIntOperatorLessThanConsecutive0700
     * @tc.desc Verify operatorLessThan for consecutive increments on large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanConsecutive0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const base = BigInt('999999999999999999999999999990');
        const next = base.operatorAdd(BigInt(1));
        const next2 = next.operatorAdd(BigInt(1));
        expect(base.operatorLessThan(next)).assertTrue();
        expect(next.operatorLessThan(next2)).assertTrue();
        expect(base.operatorLessThan(next2)).assertTrue();
        expect(next2.operatorLessThan(base)).assertFalse();
      });
  });
}
