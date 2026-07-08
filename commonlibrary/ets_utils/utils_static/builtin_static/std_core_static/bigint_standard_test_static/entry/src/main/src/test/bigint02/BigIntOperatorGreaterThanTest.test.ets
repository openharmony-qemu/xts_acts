'use static';
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
import { describe, it, expect } from '@ohos/hypium-binary/src/main/indexStatic';
import { TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic/Constant';

export default function BigIntOperatorGreaterThanTest(): void {
  describe('BigInt.operatorGreaterThan (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0100
     * @tc.name testBigIntOperatorGreaterThanBasic0100
     * @tc.desc Mindmap input and return value: operatorGreaterThan basic compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(100).operatorGreaterThan(BigInt(50))).assertTrue();
      expect(BigInt(5).operatorGreaterThan(BigInt(3))).assertTrue();
      expect(BigInt(10).operatorGreaterThan(BigInt(-10))).assertTrue();
      expect(BigInt(-3).operatorGreaterThan(BigInt(-10))).assertTrue();
      expect(BigInt(-10).operatorGreaterThan(BigInt(-3))).assertFalse();
      expect(BigInt(0).operatorGreaterThan(BigInt(0))).assertFalse();
      expect(BigInt(42).operatorGreaterThan(BigInt(42))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0200
     * @tc.name testBigIntOperatorGreaterThanBoundary0200
     * @tc.desc Mindmap input: operatorGreaterThan near double safe-integer boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanBoundary0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt('9007199254740991').operatorGreaterThan(BigInt('9007199254740990'))).assertTrue();
      expect(BigInt('9007199254740990').operatorGreaterThan(BigInt('9007199254740991'))).assertFalse();
      expect(BigInt('9007199254740991').operatorGreaterThan(BigInt('9007199254740991'))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0300
     * @tc.name testBigIntOperatorGreaterThanReturnType0300
     * @tc.desc Mindmap return value: operatorGreaterThan returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorGreaterThan(BigInt(2)))).assertEqual(Class.from<boolean>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0400
     * @tc.name testBigIntOperatorGreaterThanInvalidArg0400
     * @tc.desc Mindmap error handling: operatorGreaterThan rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a = BigInt(10);
      expect((): void => {
        a.operatorGreaterThan(null as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorGreaterThan(undefined as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorGreaterThan('abc' as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorGreaterThan(123 as object as BigInt);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        a.operatorGreaterThan(true as object as BigInt);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0500
     * @tc.name testBigIntOperatorGreaterThanCrossSign0500
     * @tc.desc Mindmap input: operatorGreaterThan cross-sign operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanCrossSign0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).operatorGreaterThan(BigInt(3))).assertFalse();
      expect(BigInt(3).operatorGreaterThan(BigInt(-5))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0600
     * @tc.name testBigIntOperatorGreaterThanLongBounds0600
     * @tc.desc Mindmap input: operatorGreaterThan at signed long extrema
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanLongBounds0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const max = BigInt(9223372036854775807);
      const min = BigInt(-9223372036854775808);

      expect(max.operatorGreaterThan(min)).assertTrue();
      expect(min.operatorGreaterThan(max)).assertFalse();
      expect(max.operatorGreaterThan(BigInt('9223372036854775806'))).assertTrue();
      expect(BigInt('9223372036854775808').operatorGreaterThan(max)).assertTrue();
      expect(min.operatorGreaterThan(BigInt('9223372036854775808'))).assertFalse();
    });
  });
}
