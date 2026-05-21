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

export default function BigIntConstructorDoubleTest(): void {
  describe('BigInt double 构造（导图 constructor_6）', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0100
     * @tc.name testBigIntConstructorDoubleIntegerSmall0100
     * @tc.desc Verify integer doubles 0, 1, and -1 construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleIntegerSmall0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0.0).toString()).assertEqual('0');
        expect(new BigInt(1.0).toString()).assertEqual('1');
        expect(new BigInt(-1.0).toString()).assertEqual('-1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0200
     * @tc.name testBigIntConstructorDoubleIntegerLarge0200
     * @tc.desc Verify larger integer doubles construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleIntegerLarge0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(100.0).toString()).assertEqual('100');
        expect(new BigInt(-999999.0).toString()).assertEqual('-999999');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0300
     * @tc.name testBigIntConstructorDoubleZeroSign0300
     * @tc.desc Verify positive and negative zero doubles construct BigInt zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleZeroSign0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(+0.0).toString()).assertEqual('0');
        expect(new BigInt(-0.0).toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0400
     * @tc.name testBigIntConstructorDoubleSafeInteger0400
     * @tc.desc Verify safe integer boundary doubles construct expected BigInt values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleSafeInteger0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(9007199254740991.0).toString()).assertEqual('9007199254740991');
        expect(new BigInt(-9007199254740991.0).toString()).assertEqual('-9007199254740991');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0500
     * @tc.name testBigIntConstructorDoubleNonInteger0500
     * @tc.desc Verify non-integer doubles throw RangeError when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleNonInteger0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(1.5);
        }).assertThrowError('RangeError');
        expect((): void => {
          new BigInt(3.14);
        }).assertThrowError('RangeError');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_DOUBLE_0600
     * @tc.name testBigIntConstructorDoubleNaNInfinity0600
     * @tc.desc Verify NaN and Infinity doubles throw RangeError when constructing BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorDoubleNaNInfinity0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(Number.NaN);
        }).assertThrowError('RangeError');
        expect((): void => {
          new BigInt(Number.POSITIVE_INFINITY);
        }).assertThrowError('RangeError');
        expect((): void => {
          new BigInt(Number.NEGATIVE_INFINITY);
        }).assertThrowError('RangeError');
      });
  });
}
