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

export default function BigIntOperatorDivideTest(): void {
  describe('BigInt.operatorDivide (mindmap operatorDivide)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0100
     * @tc.name testBigIntOperatorDivideBasic0100
     * @tc.desc Verify operatorDivide basic arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideBasic0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(12).operatorDivide(new BigInt(5)).toString()).assertEqual('2');
        expect(new BigInt(20).operatorDivide(new BigInt(-5)).toString()).assertEqual('-4');
        expect(new BigInt(-10).operatorDivide(new BigInt(5)).toString()).assertEqual('-2');
        expect(new BigInt(7).operatorDivide(new BigInt(7)).toString()).assertEqual('1');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0200
     * @tc.name testBigIntOperatorDivideZero0200
     * @tc.desc Verify operatorDivide zero cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(0).operatorDivide(new BigInt(5)).toString()).assertEqual('0');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0400
     * @tc.name testBigIntOperatorDivideReturnType0400
     * @tc.desc Verify operatorDivide returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideReturnType0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result = new BigInt(10).operatorDivide(new BigInt(3));
        expect(result instanceof BigInt).assertTrue();
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0500
     * @tc.name testBigIntOperatorDivideInvalidArg0500
     * @tc.desc Verify operatorDivide rejects invalid args
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideInvalidArg0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt(10);
        expect((): void => {
          a.operatorDivide(null as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorDivide(undefined as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorDivide('abc' as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorDivide(123 as object as BigInt);
        }).assertThrowError('ClassCastError');
        expect((): void => {
          a.operatorDivide(true as object as BigInt);
        }).assertThrowError('ClassCastError');
      });
    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0600
     * @tc.name testBigIntOperatorDivideDivByZero0600
     * @tc.desc Verify operatorDivide throws on zero divisor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideDivByZero0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect((): void => {
          new BigInt(10).operatorDivide(new BigInt(0));
        }).assertThrowError('Error');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0300
     * @tc.name testBigIntOperatorDivideNegativeTruncate0300
     * @tc.desc Verify operatorDivide truncates toward zero for negative operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideNegativeTruncate0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt(-7).operatorDivide(new BigInt(3)).toString()).assertEqual('-2');
        expect(new BigInt(7).operatorDivide(new BigInt(-3)).toString()).assertEqual('-2');
        expect(new BigInt(-7).operatorDivide(new BigInt(-3)).toString()).assertEqual('2');
        expect(new BigInt(-1).operatorDivide(new BigInt(2)).toString()).assertEqual('0');
        expect(new BigInt('100000000000000000001').operatorDivide(new BigInt('100000000000000000000')).toString())
          .assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_OPERATOR_DIVIDE_0700
     * @tc.name testBigIntOperatorDivideLarge0700
     * @tc.desc Verify operatorDivide with very large BigInt operands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntOperatorDivideLarge0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new BigInt('999999999999999999999999999999').operatorDivide(new BigInt('999999999999999999999999999999')).toString())
          .assertEqual('1');
        expect(new BigInt('-999999999999999999999999999999').operatorDivide(new BigInt('3')).toString())
          .assertEqual('-333333333333333333333333333333');
      });
  });
}
