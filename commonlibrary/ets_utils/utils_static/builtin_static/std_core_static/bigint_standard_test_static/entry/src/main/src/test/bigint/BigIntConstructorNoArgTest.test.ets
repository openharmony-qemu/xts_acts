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
import { describe, it, expect } from '../../../../hypium/index';
import { TestType, Size, Level } from '../../../../hypium/Constant';

export default function BigIntConstructorNoArgTest(): void {
  describe('BigInt no-arg constructor (mindmap constructor_1)', () => {
    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0100
     * @tc.name testBigIntConstructorNoArgZero0100
     * @tc.desc Mindmap input: parameterless constructor yields zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgZero0100', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();

      expect(zero.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0200
     * @tc.name testBigIntConstructorNoArgEqualsZero0200
     * @tc.desc Mindmap return value: equals BigInt constructed from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgEqualsZero0200', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const noArg = new BigInt();
      const withZero = BigInt(0);

      expect(noArg.equals(withZero)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0300
     * @tc.name testBigIntConstructorNoArgReturnType0300
     * @tc.desc Mindmap return value: parameterless constructor returns BigInt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgReturnType0300', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();

      expect(Class.of(zero as Object)).assertEqual(Class.from<BigInt>());
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0400
     * @tc.name testBigIntConstructorNoArgRepeated0400
     * @tc.desc Mindmap return value: separate instances do not share mutable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgRepeated0400', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const first = new BigInt();
      const second = new BigInt();

      expect(first.toString()).assertEqual('0');
      expect(second.toString()).assertEqual('0');
      expect(first.operatorIncrement().toString()).assertEqual('1');
      expect(second.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0500
     * @tc.name testBigIntConstructorNoArgLoop0500
     * @tc.desc Mindmap return value: looped parameterless constructions remain zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgLoop0500', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let repeat = 0;
      while (repeat < 10) {
        const instance = new BigInt();

        expect(instance.operatorAdd(BigInt(repeat)).toString()).assertEqual(repeat.toString());
        repeat += 1;
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0600
     * @tc.name testBigIntConstructorNoArgAddOne0600
     * @tc.desc Mindmap return value: zero plus one via operatorAdd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgAddOne0600', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const one = BigInt(1);

      expect(zero.operatorAdd(one).toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0700
     * @tc.name testBigIntConstructorNoArgCompareOne0700
     * @tc.desc Mindmap return value: compare zero against one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgCompareOne0700', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const zero = new BigInt();
      const one = BigInt(1);

      expect(zero.operatorLessThan(one)).assertTrue();
      expect(zero.operatorGreaterThan(one)).assertFalse();
      expect(zero.equals(zero)).assertTrue();
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0800
     * @tc.name testBigIntConstructorNoArgStress0800
     * @tc.desc Mindmap error handling: many parameterless constructions remain stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgStress0800', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let repeat = 0;
      while (repeat < 100) {
        expect(new BigInt().toString()).assertEqual('0');
        repeat += 1;
      }
    });

    /**
     * @tc.number SUB_BIGINT_STD_CONSTRUCTOR_NOARG_0900
     * @tc.name testBigIntConstructorNoArgInvalidArg0900
     * @tc.desc Mindmap error handling: null and undefined cast as no-arg overload input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigIntConstructorNoArgInvalidArg0900', TestType.STANDARD | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect((): void => {
        new BigInt(null as Object as int);
      }).assertThrowError('ClassCastError');
      expect((): void => {
        new BigInt(undefined as Object as int);
      }).assertThrowError('ClassCastError');
    });
  });
}
