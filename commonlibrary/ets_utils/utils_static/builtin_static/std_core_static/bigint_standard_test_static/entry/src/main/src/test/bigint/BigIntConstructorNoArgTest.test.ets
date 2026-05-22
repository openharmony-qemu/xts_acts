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

export default function BigIntConstructorNoArgTest(): void {
  describe('BigInt no-arg constructor (mindmap constructor_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0100
     * @tc.name testBigIntConstructorNoArgZero0100
     * @tc.desc Verify parameterless BigInt constructor yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgZero0100',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        expect(zero.toString()).assertEqual('0');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0200
     * @tc.name testBigIntConstructorNoArgEqualsZero0200
     * @tc.desc Verify parameterless constructor equals BigInt constructed from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgEqualsZero0200',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const noArg = new BigInt();
        const withZero = new BigInt(0);
        expect(noArg.equals(withZero)).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0300
     * @tc.name testBigIntConstructorNoArgInstance0300
     * @tc.desc Verify parameterless constructor returns a BigInt instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgInstance0300',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        expect(zero instanceof BigInt).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0400
     * @tc.name testBigIntConstructorNoArgRepeatedString0400
     * @tc.desc Verify repeated parameterless constructions stringify to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgRepeatedString0400',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a = new BigInt();
        const b = new BigInt();
        expect(a.toString()).assertEqual('0');
        expect(b.toString()).assertEqual('0');
        expect(a.toString()).assertEqual(b.toString());
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0500
     * @tc.name testBigIntConstructorNoArgLoop0500
     * @tc.desc Verify multiple parameterless constructions in a loop yield zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgLoop0500',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 10; i++) {
          const v = new BigInt();
          expect(v.toString()).assertEqual('0');
        }
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0600
     * @tc.name testBigIntConstructorNoArgAddOne0600
     * @tc.desc Verify parameterless BigInt plus one equals one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgAddOne0600',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        const one = new BigInt(1);
        expect(zero.operatorAdd(one).toString()).assertEqual('1');
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0700
     * @tc.name testBigIntConstructorNoArgCompareOne0700
     * @tc.desc Verify parameterless BigInt compares correctly against one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgCompareOne0700',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zero = new BigInt();
        const one = new BigInt(1);
        expect(zero.operatorLessThan(one)).assertTrue();
        expect(zero.operatorGreaterThan(one)).assertFalse();
        expect(zero.equals(zero)).assertTrue();
      });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0800
     * @tc.name testBigIntConstructorNoArgStress0800
     * @tc.desc Verify repeated parameterless constructions remain stable (up to 100 iterations)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgStress0800',
      TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        for (let i = 0; i < 100; i++) {
          const v = new BigInt();
          expect(v.toString()).assertEqual('0');
        }
      });
  });
}
