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
  describe('BigInt.operatorLessThan (mindmap)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0100
     * @tc.name testBigIntOperatorLessThanBasic0100
     * @tc.desc Mindmap input and return value: operatorLessThan basic compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanBasic0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        expect(new BigInt(3).operatorLessThan(new BigInt(5))).assertTrue();
        expect(new BigInt(-10).operatorLessThan(new BigInt(-3))).assertTrue();
        expect(new BigInt(50).operatorLessThan(new BigInt(100))).assertTrue();
        expect(new BigInt(5).operatorLessThan(new BigInt(3))).assertFalse();
        expect(new BigInt(0).operatorLessThan(new BigInt(0))).assertFalse();
        expect(new BigInt(42).operatorLessThan(new BigInt(42))).assertFalse();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0200
     * @tc.name testBigIntOperatorLessThanBoundary0200
     * @tc.desc Mindmap input: operatorLessThan near MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanBoundary0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
        const maxSafe = '9007199254740991';
        expect(new BigInt(maxSafe).operatorLessThan(new BigInt('9007199254740990'))).assertFalse();
        expect(new BigInt('9007199254740990').operatorLessThan(new BigInt(maxSafe))).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0300
     * @tc.name testBigIntOperatorLessThanReturnType0300
     * @tc.desc Mindmap return value: operatorLessThan returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(Class.of(BigInt(1).operatorLessThan(BigInt(2)))).assertEqual(Class.from<boolean>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0400
     * @tc.name testBigIntOperatorLessThanInvalidArg0400
     * @tc.desc Mindmap error handling: operatorLessThan rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanInvalidArg0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_BIGINT_STD_OPERATOR_LT_0500
     * @tc.name testBigIntOperatorLessThanCrossSign0500
     * @tc.desc Mindmap input: operatorLessThan cross-sign operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorLessThanCrossSign0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(BigInt(-5).operatorLessThan(BigInt(3))).assertTrue();
      expect(BigInt(3).operatorLessThan(BigInt(-5))).assertFalse();
    });
  });
}
