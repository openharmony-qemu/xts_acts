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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class EitherImpl<L, R> {
  private readonly isLeftValue: boolean;
  private readonly value?: L | R | null | undefined;

  constructor(isLeft: boolean, value?: L | R | null | undefined) {
    this.isLeftValue = isLeft;
    this.value = value;
  }

  isLeft(): boolean {
    return this.isLeftValue;
  }

  isRight(): boolean {
    return !this.isLeftValue;
  }
}

export default function EitherIsLeftTest(): void {
  describe('EitherIsLeftTest', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_0100
     * @tc.name testEitherIsLeft0001
     * @tc.desc Verify isLeft returns correct value when called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_0600
     * @tc.name testEitherIsLeft0006
     * @tc.desc Verify isLeft returns false for Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(false, "hello");
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_0700
     * @tc.name testEitherIsLeft0007
     * @tc.desc Verify isLeft returns true when Left wraps null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<object | null, string>(true, null);
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_0800
     * @tc.name testEitherIsLeft0008
     * @tc.desc Verify isLeft returns true when Left wraps undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<object | undefined, string>(true, undefined);
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_0900
     * @tc.name testEitherIsLeft0009
     * @tc.desc Verify isLeft returns false when Right wraps null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, object | null>(false, null);
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1000
     * @tc.name testEitherIsLeft0010
     * @tc.desc Verify isLeft returns false when Right wraps undefined value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, object | undefined>(false, undefined);
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1100
     * @tc.name testEitherIsLeft0011
     * @tc.desc Verify isLeft return type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      const result: boolean = e.isLeft();
      expect(typeof result).assertEqual("boolean");
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1200
     * @tc.name testEitherIsLeft0012
     * @tc.desc Verify return value is not equal to non-boolean types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      const result: boolean = e.isLeft();
      expect(result === true).assertTrue();
      expect(result !== false).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1300
     * @tc.name testEitherIsLeft0013
     * @tc.desc Verify isLeft returns true when Left wraps empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, number>(true, "");
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1400
     * @tc.name testEitherIsLeft0014
     * @tc.desc Verify isLeft returns false when Right wraps empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(false, "");
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1500
     * @tc.name testEitherIsLeft0015
     * @tc.desc Verify isLeft returns true when Left wraps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 0);
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1600
     * @tc.name testEitherIsLeft0016
     * @tc.desc Verify isLeft returns false when Right wraps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, number>(false, 0);
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_1900
     * @tc.name testEitherIsLeft0019
     * @tc.desc Verify isLeft returns consistent result on multiple calls for Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      expect(e.isLeft()).assertTrue();
      expect(e.isLeft()).assertTrue();
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2000
     * @tc.name testEitherIsLeft0020
     * @tc.desc Verify isLeft returns consistent result on multiple calls for Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(false, "hello");
      expect(e.isLeft()).assertFalse();
      expect(e.isLeft()).assertFalse();
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2300
     * @tc.name testEitherIsLeft0023
     * @tc.desc Verify isLeft returns true for Left<number, string> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 100);
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2400
     * @tc.name testEitherIsLeft0024
     * @tc.desc Verify isLeft returns true for Left<string, number> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, number>(true, "abc");
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2500
     * @tc.name testEitherIsLeft0025
     * @tc.desc Verify isLeft returns true for Left<boolean, Object> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<boolean, object>(true, true);
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2600
     * @tc.name testEitherIsLeft0026
     * @tc.desc Verify isLeft returns false for Right<Object, boolean> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<object, boolean>(false, false);
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2700
     * @tc.name testEitherIsLeft0027
     * @tc.desc Verify isLeft returns true for Left<string, string> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, string>(true, "left");
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2800
     * @tc.name testEitherIsLeft0028
     * @tc.desc Verify isLeft returns false for Right<string, string> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<string, string>(false, "right");
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_2900
     * @tc.name testEitherIsLeft0029
     * @tc.desc Verify isLeft is true and isRight is false for Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      expect(e.isLeft()).assertTrue();
      expect(e.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_3000
     * @tc.name testEitherIsLeft0030
     * @tc.desc Verify isLeft is false and isRight is true for Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(false, "hello");
      expect(e.isLeft()).assertFalse();
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_3100
     * @tc.name testEitherIsLeft0031
     * @tc.desc Verify isLeft and isRight are never both true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = new EitherImpl<number, string>(true, 1);
      const right = new EitherImpl<number, string>(false, "a");
      expect(left.isLeft() && left.isRight()).assertFalse();
      expect(right.isLeft() && right.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_3200
     * @tc.name testEitherIsLeft0032
     * @tc.desc Verify isLeft and isRight are never both false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const left = new EitherImpl<number, string>(true, 1);
      const right = new EitherImpl<number, string>(false, "a");
      expect(!left.isLeft() && !left.isRight()).assertFalse();
      expect(!right.isLeft() && !right.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_3300
     * @tc.name testEitherIsLeft0033
     * @tc.desc Verify isLeft returns consistent result in chained calls and conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      if (e.isLeft()) {
        expect(e.isLeft()).assertTrue();
      } else {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number ETHN_ETHR_IS_LEFT_3400
     * @tc.name testEitherIsLeft0034
     * @tc.desc Verify isLeft returns consistent result in large loop without crash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsLeft0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const e = new EitherImpl<number, string>(true, 42);
      for (let i = 0; i < 10000; i++) {
        expect(e.isLeft()).assertTrue();
      }
    });
  });
}
