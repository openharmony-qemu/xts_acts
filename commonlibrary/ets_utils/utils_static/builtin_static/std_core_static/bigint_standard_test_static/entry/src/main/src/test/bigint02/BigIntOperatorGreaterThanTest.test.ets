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

export default function BigIntOperatorGreaterThanTest(): void {
  describe('BigInt.operatorGreaterThan（导图）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0100
     * @tc.name testBigIntOperatorGreaterThanBasic0100
     * @tc.desc Verify operatorGreaterThan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(100).operatorGreaterThan(new BigInt(50))).assertTrue();
        expect(new BigInt(5).operatorGreaterThan(new BigInt(3))).assertTrue();
        expect(new BigInt(10).operatorGreaterThan(new BigInt(-10))).assertTrue();
        expect(new BigInt(-3).operatorGreaterThan(new BigInt(-10))).assertTrue();
        expect(new BigInt(-10).operatorGreaterThan(new BigInt(-3))).assertFalse();
        expect(new BigInt(0).operatorGreaterThan(new BigInt(0))).assertFalse();
        expect(new BigInt(42).operatorGreaterThan(new BigInt(42))).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0200
     * @tc.name testBigIntOperatorGreaterThanBoundary0200
     * @tc.desc Verify operatorGreaterThan boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanBoundary0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const maxSafe = '9007199254740991';
        expect(new BigInt(maxSafe).operatorGreaterThan(new BigInt('9007199254740990'))).assertTrue();
        expect(new BigInt('9007199254740990').operatorGreaterThan(new BigInt(maxSafe))).assertFalse();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0300
     * @tc.name testBigIntOperatorGreaterThanReturnType0300
     * @tc.desc Verify operatorGreaterThan returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanReturnType0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(typeof new BigInt(1).operatorGreaterThan(new BigInt(2)) === 'boolean').assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_GT_0400
     * @tc.name testBigIntOperatorGreaterThanInvalidArg0400
     * @tc.desc Verify operatorGreaterThan rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorGreaterThanInvalidArg0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
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
  });
}
