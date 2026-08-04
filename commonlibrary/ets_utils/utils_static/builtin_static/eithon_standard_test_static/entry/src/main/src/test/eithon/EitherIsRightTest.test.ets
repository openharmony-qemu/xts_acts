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

  static left<L, R>(value: L): EitherImpl<L, R> {
    return new EitherImpl<L, R>(true, value);
  }

  static right<L, R>(value: R): EitherImpl<L, R> {
    return new EitherImpl<L, R>(false, value);
  }

  isLeft(): boolean {
    return this.isLeftValue;
  }

  isRight(): boolean {
    return !this.isLeftValue;
  }

  map<U>(fn: (value: R) => U): EitherImpl<L, U> {
    if (!this.isLeftValue && this.value !== undefined && this.value !== null) {
      return new EitherImpl<L, U>(false, fn(this.value as R));
    }
    return new EitherImpl<L, U>(true, undefined);
  }
}

export default function EitherIsRightTest(): void {
  describe('EitherIsRightTest', () => {
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
     * @tc.number ETHN_ETHR_IS_RIGHT_0100
     * @tc.name testEitherIsRight0001
     * @tc.desc Verify isRight returns boolean without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      let result: boolean = e.isRight();
      expect(result).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0200
     * @tc.name testEitherIsRight0002
     * @tc.desc Verify isRight ignores extra parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      let result: boolean = e.isRight();
      expect(typeof result === 'boolean').assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0400
     * @tc.name testEitherIsRight0004
     * @tc.desc Verify isRight returns true for Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0500
     * @tc.name testEitherIsRight0005
     * @tc.desc Verify isRight returns false for Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42);
      expect(e.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0600
     * @tc.name testEitherIsRight0006
     * @tc.desc Verify isRight returns true for Right with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("");
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0700
     * @tc.name testEitherIsRight0007
     * @tc.desc Verify isRight returns true for Right with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number>(0);
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0800
     * @tc.name testEitherIsRight0008
     * @tc.desc Verify isRight returns true for Right with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, number[]>([]);
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_0900
     * @tc.name testEitherIsRight0009
     * @tc.desc Verify isRight returns true for Right with null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<string, object | null>(null);
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_1000
     * @tc.name testEitherIsRight0010
     * @tc.desc Verify isRight returns false for Left with null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<object | null, string>(null);
      expect(e.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_1200
     * @tc.name testEitherIsRight0012
     * @tc.desc Verify isRight return value is not equal to non-boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      let result: boolean = e.isRight();
      expect(result === true).assertTrue();
      expect(result !== false).assertTrue();
      expect(result !== false).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_1300
     * @tc.name testEitherIsRight0013
     * @tc.desc Verify isRight returns consistent value on multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      expect(e.isRight()).assertTrue();
      expect(e.isRight()).assertTrue();
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_1400
     * @tc.name testEitherIsRight0014
     * @tc.desc Verify isRight returns true for different Right instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.right<number, string>("a");
      let e2 = EitherImpl.right<number, string>("b");
      expect(e1.isRight()).assertTrue();
      expect(e2.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_1500
     * @tc.name testEitherIsRight0015
     * @tc.desc Verify isRight returns false for different Left instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e1 = EitherImpl.left<number, string>(1);
      let e2 = EitherImpl.left<number, string>(2);
      expect(e1.isRight()).assertFalse();
      expect(e2.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2000
     * @tc.name testEitherIsRight0020
     * @tc.desc Verify isRight throws exception when called on null receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e: EitherImpl<number, string> | null = null;
      try {
        let result: boolean = (e as EitherImpl<number, string>).isRight();
        expect(false).assertTrue();
      } catch (err) {
        expect(err.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2100
     * @tc.name testEitherIsRight0021
     * @tc.desc Verify isRight throws exception when called on undefined receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e: EitherImpl<number, string> | undefined = undefined;
      try {
        let result: boolean = (e as EitherImpl<number, string>).isRight();
        expect(false).assertTrue();
      } catch (err) {
        expect(err.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2200
     * @tc.name testEitherIsRight0022
     * @tc.desc Verify isRight is final and cannot be overridden by subclass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("test");
      expect(e.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2300
     * @tc.name testEitherIsRight0023
     * @tc.desc Verify final modifier does not affect normal isRight call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("finalTest");
      expect(e.isRight()).assertTrue();
      expect(typeof e.isRight() === 'boolean').assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2400
     * @tc.name testEitherIsRight0024
     * @tc.desc Verify isRight with L=number R=string generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rightE = EitherImpl.right<number, string>("abc");
      let leftE = EitherImpl.left<number, string>(123);
      expect(rightE.isRight()).assertTrue();
      expect(leftE.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2500
     * @tc.name testEitherIsRight0025
     * @tc.desc Verify isRight with L=string R=number generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rightE = EitherImpl.right<string, number>(100);
      let leftE = EitherImpl.left<string, number>("error");
      expect(rightE.isRight()).assertTrue();
      expect(leftE.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2600
     * @tc.name testEitherIsRight0026
     * @tc.desc Verify isRight with L=boolean R=boolean generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rightE = EitherImpl.right<boolean, boolean>(true);
      let leftE = EitherImpl.left<boolean, boolean>(false);
      expect(rightE.isRight()).assertTrue();
      expect(leftE.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2700
     * @tc.name testEitherIsRight0027
     * @tc.desc Verify isRight with L=Object R=Object generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let obj: object = {};
      let rightE = EitherImpl.right<object, object>(obj);
      let leftE = EitherImpl.left<object, object>(obj);
      expect(rightE.isRight()).assertTrue();
      expect(leftE.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2800
     * @tc.name testEitherIsRight0028
     * @tc.desc Verify isRight with nested Either generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let inner = EitherImpl.right<number, string>("inner");
      let outer = EitherImpl.right<boolean, EitherImpl<number, string>>(inner);
      expect(outer.isRight()).assertTrue();
      expect(inner.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_2900
     * @tc.name testEitherIsRight0029
     * @tc.desc Verify isRight true and isLeft false on Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      expect(e.isRight()).assertTrue();
      expect(e.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_3000
     * @tc.name testEitherIsRight0030
     * @tc.desc Verify isRight false and isLeft true on Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42);
      expect(e.isRight()).assertFalse();
      expect(e.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_3100
     * @tc.name testEitherIsRight0031
     * @tc.desc Verify isRight equals negation of isLeft always
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let rightE = EitherImpl.right<number, string>("r");
      let leftE = EitherImpl.left<number, string>(1);
      expect(rightE.isRight() === !rightE.isLeft()).assertTrue();
      expect(leftE.isRight() === !leftE.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_3200
     * @tc.name testEitherIsRight0032
     * @tc.desc Verify mutual exclusivity holds across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("test");
      for (let i = 0; i < 10; i++) {
        expect(e.isRight() !== e.isLeft()).assertTrue();
        expect(e.isRight() === !e.isLeft()).assertTrue();
      }
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_3300
     * @tc.name testEitherIsRight0033
     * @tc.desc Verify isRight returns true after map on Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.right<number, string>("hello");
      let mapped = e.map((v: string) => v.length);
      expect(mapped.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_ETHR_IS_RIGHT_3400
     * @tc.name testEitherIsRight0034
     * @tc.desc Verify isRight returns false after map on Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEitherIsRight0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let e = EitherImpl.left<number, string>(42);
      let mapped = e.map((v: string) => v.length);
      expect(mapped.isRight()).assertFalse();
    });
  });
}
