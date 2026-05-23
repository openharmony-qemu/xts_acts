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

export default function BigIntOperatorGreaterThanEqualTest(): void {
  describe('BigInt.operatorGreaterThanEqual (mindmap operatorGreaterThanEqual)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0100
     * @tc.name testBigIntOperatorGreaterThanEqualBasic0100
     * @tc.desc Verify operatorGreaterThanEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(10).operatorGreaterThanEqual(BigInt(10))).assertTrue();
        expect(BigInt(5).operatorGreaterThanEqual(BigInt(10))).assertFalse();
        expect(BigInt(10).operatorGreaterThanEqual(BigInt(5))).assertTrue();
        expect(BigInt(-5).operatorGreaterThanEqual(BigInt(-10))).assertTrue();
        expect(BigInt(0).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0200
     * @tc.name testBigIntOperatorGreaterThanEqualBoundary0200
     * @tc.desc Verify operatorGreaterThanEqual boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991'; // Number.MAX_SAFE_INTEGER (2^53 - 1)
        expect(BigInt(maxSafe).operatorGreaterThanEqual(BigInt(maxSafe))).assertTrue();
        expect(BigInt('9007199254740990').operatorGreaterThanEqual(BigInt(maxSafe))).assertFalse();
        expect(BigInt(maxSafe).operatorGreaterThanEqual(BigInt('9007199254740990'))).assertTrue();
        expect(BigInt('-9223372036854775808').operatorGreaterThanEqual(BigInt('-9223372036854775807'))).assertFalse();
        expect(BigInt('9223372036854775807').operatorGreaterThanEqual(BigInt('9223372036854775807'))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0300
     * @tc.name testBigIntOperatorGreaterThanEqualZeroSign0300
     * @tc.desc Verify operatorGreaterThanEqual zero and sign boundary cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualZeroSign0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(BigInt(-1).operatorGreaterThanEqual(BigInt(0))).assertFalse();
        expect(BigInt(0).operatorGreaterThanEqual(BigInt(1))).assertFalse();
        expect(BigInt(0).operatorGreaterThanEqual(BigInt(-1))).assertTrue();
        expect(BigInt(1).operatorGreaterThanEqual(BigInt(0))).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0400
     * @tc.name testBigIntOperatorGreaterThanEqualLarge0400
     * @tc.desc Verify operatorGreaterThanEqual on magnitudes beyond Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualLarge0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const base = BigInt('999999999999999999999999999990');
        const next = BigInt('999999999999999999999999999991');
        expect(base.operatorGreaterThanEqual(next)).assertFalse();
        expect(next.operatorGreaterThanEqual(base)).assertTrue();
        expect(next.operatorGreaterThanEqual(next)).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0500
     * @tc.name testBigIntOperatorGreaterThanEqualReturnType0500
     * @tc.desc Verify operatorGreaterThanEqual returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualReturnType0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof BigInt(1).operatorGreaterThanEqual(BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0600
     * @tc.name testBigIntOperatorGreaterThanEqualInvalidArg0600
     * @tc.desc Verify operatorGreaterThanEqual rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualInvalidArg0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = BigInt(10);
        expect((): void => {
          a.operatorGreaterThanEqual(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorGreaterThanEqual(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0700
     * @tc.name testBigIntOperatorGreaterThanEqualNumberBoundary0700
     * @tc.desc Verify operatorGreaterThanEqual aligns with double-constructible Number boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualNumberBoundary0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const fromDouble = BigInt(9007199254740991.0);
        const fromString = BigInt('9007199254740991');
        expect(fromDouble.operatorGreaterThanEqual(fromString)).assertTrue();
        expect(fromDouble.operatorGreaterThanEqual(BigInt(9007199254740990))).assertTrue();
        expect(BigInt(9007199254740992.0).operatorGreaterThanEqual(BigInt(9007199254740991.0))).assertTrue();
        expect(BigInt(9007199254740990.0).operatorGreaterThanEqual(BigInt(9007199254740991.0))).assertFalse();
      });
  });
}
