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

export default function BigIntOperatorLessThanEqualTest(): void {
  describe('BigInt.operatorLessThanEqual (mindmap operatorLessThanEqual)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0100
     * @tc.name testBigIntOperatorLessThanEqualBasic0100
     * @tc.desc Verify operatorLessThanEqual basic ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(10).operatorLessThanEqual(BigInt(10))).assertTrue();
        expect(BigInt(5).operatorLessThanEqual(BigInt(10))).assertTrue();
        expect(BigInt(10).operatorLessThanEqual(BigInt(5))).assertFalse();
        expect(BigInt(-5).operatorLessThanEqual(BigInt(-10))).assertFalse();
        expect(BigInt(0).operatorLessThanEqual(BigInt(0))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0200
     * @tc.name testBigIntOperatorLessThanEqualBoundary0200
     * @tc.desc Verify operatorLessThanEqual at MAX_SAFE_INTEGER and long boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(BigInt(maxSafe).operatorLessThanEqual(BigInt(maxSafe))).assertTrue();
        expect(BigInt('9007199254740990').operatorLessThanEqual(BigInt(maxSafe))).assertTrue();
        expect(BigInt(maxSafe).operatorLessThanEqual(BigInt('9007199254740990'))).assertFalse();
        expect(BigInt('-9223372036854775808').operatorLessThanEqual(BigInt('-9223372036854775807'))).assertTrue();
        expect(BigInt('9223372036854775807').operatorLessThanEqual(BigInt('9223372036854775807'))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0300
     * @tc.name testBigIntOperatorLessThanEqualZeroSign0300
     * @tc.desc Verify operatorLessThanEqual zero and sign boundary cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualZeroSign0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(-1).operatorLessThanEqual(BigInt(0))).assertTrue();
        expect(BigInt(0).operatorLessThanEqual(BigInt(1))).assertTrue();
        expect(BigInt(0).operatorLessThanEqual(BigInt(-1))).assertFalse();
        expect(BigInt(1).operatorLessThanEqual(BigInt(0))).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0400
     * @tc.name testBigIntOperatorLessThanEqualLarge0400
     * @tc.desc Verify operatorLessThanEqual on magnitudes beyond Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualLarge0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const base = BigInt('999999999999999999999999999990');
        const next = base.operatorAdd(BigInt(1));
        expect(base.operatorLessThanEqual(next)).assertTrue();
        expect(next.operatorLessThanEqual(base)).assertFalse();
        expect(next.operatorLessThanEqual(next)).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0500
     * @tc.name testBigIntOperatorLessThanEqualReturnType0500
     * @tc.desc Verify operatorLessThanEqual returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof BigInt(1).operatorLessThanEqual(BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0600
     * @tc.name testBigIntOperatorLessThanEqualInvalidArg0600
     * @tc.desc Verify operatorLessThanEqual rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualInvalidArg0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt(10);
        expect((): void => {
          a.operatorLessThanEqual(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorLessThanEqual(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0700
     * @tc.name testBigIntOperatorLessThanEqualConsecutive0700
     * @tc.desc Verify operatorLessThanEqual for consecutive increments on large values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualConsecutive0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const base = BigInt('999999999999999999999999999990');
        const next = base.operatorAdd(BigInt(1));
        const next2 = next.operatorAdd(BigInt(1));
        expect(base.operatorLessThanEqual(next)).assertTrue();
        expect(next.operatorLessThanEqual(next2)).assertTrue();
        expect(base.operatorLessThanEqual(next2)).assertTrue();
        expect(next2.operatorLessThanEqual(base)).assertFalse();
        expect(next.operatorLessThanEqual(next)).assertTrue();
      });
  });
}
