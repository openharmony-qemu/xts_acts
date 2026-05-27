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
import { LONG_MAX, LONG_MIN, LONG_MAX_PLUS_ONE_STR, LONG_MAX_MINUS_ONE_STR, DOUBLE_MAX_SAFE_INTEGER_STR, DOUBLE_MAX_SAFE_INTEGER_MINUS_ONE_STR } from '../BigIntTestLimits.test';

export default function BigIntOperatorGreaterThanEqualTest(): void {
  describe('BigInt.operatorGreaterThanEqual (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0100
     * @tc.name testBigIntOperatorGreaterThanEqualBasic0100
     * @tc.desc Mindmap input and return value: operatorGreaterThanEqual basic compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorGreaterThanEqual(BigInt(10))).assertTrue();
      expect(BigInt(5).operatorGreaterThanEqual(BigInt(10))).assertFalse();
      expect(BigInt(10).operatorGreaterThanEqual(BigInt(5))).assertTrue();
      expect(BigInt(-5).operatorGreaterThanEqual(BigInt(-10))).assertTrue();
      expect(BigInt(0).operatorGreaterThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0200
     * @tc.name testBigIntOperatorGreaterThanEqualBoundary0200
     * @tc.desc Mindmap input: operatorGreaterThanEqual near double safe-integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualBoundary0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(DOUBLE_MAX_SAFE_INTEGER_STR).operatorGreaterThanEqual(BigInt(DOUBLE_MAX_SAFE_INTEGER_STR))).assertTrue();
      expect(BigInt(DOUBLE_MAX_SAFE_INTEGER_MINUS_ONE_STR).operatorGreaterThanEqual(BigInt(DOUBLE_MAX_SAFE_INTEGER_STR))).assertFalse();
      expect(BigInt(DOUBLE_MAX_SAFE_INTEGER_MINUS_ONE_STR).operatorGreaterThanEqual(BigInt(DOUBLE_MAX_SAFE_INTEGER_MINUS_ONE_STR))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0300
     * @tc.name testBigIntOperatorGreaterThanEqualReturnType0300
     * @tc.desc Mindmap return value: operatorGreaterThanEqual returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorGreaterThanEqual(BigInt(2)))).assertEqual(Class.from<boolean>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0400
     * @tc.name testBigIntOperatorGreaterThanEqualInvalidArg0400
     * @tc.desc Mindmap error handling: operatorGreaterThanEqual rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0500
     * @tc.name testBigIntOperatorGreaterThanEqualCrossSign0500
     * @tc.desc Mindmap input: operatorGreaterThanEqual cross-sign operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualCrossSign0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).operatorGreaterThanEqual(BigInt(-2))).assertTrue();
      expect(BigInt(2).operatorGreaterThanEqual(BigInt(-1))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GTE_0600
     * @tc.name testBigIntOperatorGreaterThanEqualLongBounds0600
     * @tc.desc Mindmap input: operatorGreaterThanEqual at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanEqualLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(LONG_MAX);
      const min = BigInt(LONG_MIN);

      expect(max.operatorGreaterThanEqual(max)).assertTrue();
      expect(min.operatorGreaterThanEqual(min)).assertTrue();
      expect(max.operatorGreaterThanEqual(min)).assertTrue();
      expect(min.operatorGreaterThanEqual(max)).assertFalse();
      expect(max.operatorGreaterThanEqual(BigInt(LONG_MAX_MINUS_ONE_STR))).assertTrue();
      expect(BigInt(LONG_MAX_PLUS_ONE_STR).operatorGreaterThanEqual(max)).assertTrue();
    });
  });
}
