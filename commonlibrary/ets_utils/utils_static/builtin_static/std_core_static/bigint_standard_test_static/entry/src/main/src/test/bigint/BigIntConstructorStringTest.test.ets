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

export default function BigIntConstructorStringTest(): void {
  describe('BigInt string constructor (mindmap constructor_7)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0100
     * @tc.name testBigIntConstructorStringDecimalPositive0100
     * @tc.desc Verify BigInt construction from positive decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringDecimalPositive0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('0').toString()).assertEqual('0');
        expect(new BigInt('42').toString()).assertEqual('42');
        expect(new BigInt('9007199254740993').toString()).assertEqual('9007199254740993');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0200
     * @tc.name testBigIntConstructorStringDecimalNegative0200
     * @tc.desc Verify BigInt construction from negative decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringDecimalNegative0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('-1').toString()).assertEqual('-1');
        expect(new BigInt('-256').toString()).assertEqual('-256');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0300
     * @tc.name testBigIntConstructorStringLeadingZeros0300
     * @tc.desc Verify BigInt construction ignores leading zeros in decimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringLeadingZeros0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('007').toString()).assertEqual('7');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0400
     * @tc.name testBigIntConstructorStringEmptyString0400
     * @tc.desc Verify empty decimal string constructs BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringEmptyString0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('').toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_STRING_0500
     * @tc.name testBigIntConstructorStringInvalidDecimal0500
     * @tc.desc Verify invalid decimal string throws when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorStringInvalidDecimal0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const invalidMsg = 'BigInt.parseFromString(): provided string is invalid';
        expect((): void => {
          new BigInt('abc');
        }).assertThrow(invalidMsg);
      });
  });
}
