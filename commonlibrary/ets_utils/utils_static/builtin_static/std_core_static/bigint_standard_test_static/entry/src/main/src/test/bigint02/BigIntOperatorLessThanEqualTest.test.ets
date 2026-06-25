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
  describe('BigInt.operatorLessThanEqual (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0100
     * @tc.name testBigIntOperatorLessThanEqualBasic0100
     * @tc.desc Mindmap input and return value: operatorLessThanEqual basic compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(10).operatorLessThanEqual(BigInt(10))).assertTrue();
      expect(BigInt(5).operatorLessThanEqual(BigInt(10))).assertTrue();
      expect(BigInt(10).operatorLessThanEqual(BigInt(5))).assertFalse();
      expect(BigInt(-5).operatorLessThanEqual(BigInt(-10))).assertFalse();
      expect(BigInt(0).operatorLessThanEqual(BigInt(0))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0200
     * @tc.name testBigIntOperatorLessThanEqualBoundary0200
     * @tc.desc Mindmap input: operatorLessThanEqual near double safe-integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualBoundary0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740991').operatorLessThanEqual(BigInt('9007199254740991'))).assertTrue();
      expect(BigInt('9007199254740990').operatorLessThanEqual(BigInt('9007199254740991'))).assertTrue();
      expect(BigInt('9007199254740991').operatorLessThanEqual(BigInt('9007199254740990'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0300
     * @tc.name testBigIntOperatorLessThanEqualReturnType0300
     * @tc.desc Mindmap return value: operatorLessThanEqual returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorLessThanEqual(BigInt(2)))).assertEqual(Class.from<boolean>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0400
     * @tc.name testBigIntOperatorLessThanEqualInvalidArg0400
     * @tc.desc Mindmap error handling: operatorLessThanEqual rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0500
     * @tc.name testBigIntOperatorLessThanEqualCrossSign0500
     * @tc.desc Mindmap input: operatorLessThanEqual cross-sign operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualCrossSign0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-1).operatorLessThanEqual(BigInt(1))).assertTrue();
      expect(BigInt(1).operatorLessThanEqual(BigInt(-1))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LTE_0600
     * @tc.name testBigIntOperatorLessThanEqualLongBounds0600
     * @tc.desc Mindmap input: operatorLessThanEqual at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanEqualLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(max.operatorLessThanEqual(max)).assertTrue();
      expect(min.operatorLessThanEqual(min)).assertTrue();
      expect(min.operatorLessThanEqual(max)).assertTrue();
      expect(max.operatorLessThanEqual(min)).assertFalse();
      expect(max.operatorLessThanEqual(BigInt('9223372036854775806'))).assertFalse();
      expect(BigInt('9223372036854775808').operatorLessThanEqual(max)).assertFalse();
    });
  });
}
