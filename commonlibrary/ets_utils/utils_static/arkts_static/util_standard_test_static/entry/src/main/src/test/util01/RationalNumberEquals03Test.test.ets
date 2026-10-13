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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';
import util from '@ohos.util';

export default function rationalNumberEquals03Test(): void {
  describe('rationalNumberEquals03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0100
     * @tc.name rationalNumberEqualsThreeTest001
     * @tc.desc Verify equals 9/12 3/4 true arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9, 12);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 4);
      let result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0200
     * @tc.name rationalNumberEqualsThreeTest002
     * @tc.desc Verify equals 13/17 17/19 false arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(13, 17);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(17, 19);
      let result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0300
     * @tc.name rationalNumberEqualsThreeTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775806, 1).equals(RationalNumber.parseRationalNumber(9223372036854775806, 1)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775806, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775806, 1);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0400
     * @tc.name rationalNumberEqualsThreeTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(9007199254740991, 1).equals(RationalNumber.parseRationalNumber(9007199254740990, 1)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9007199254740991, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(9007199254740990, 1);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0500
     * @tc.name rationalNumberEqualsThreeTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775806, 2).equals(RationalNumber.parseRationalNumber(9223372036854775806, 3)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775806, 2);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775806, 3);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0600
     * @tc.name rationalNumberEqualsThreeTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 9007199254740991).equals(RationalNumber.parseRationalNumber(1, -9007199254740991)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 9007199254740991);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, -9007199254740991);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0700
     * @tc.name rationalNumberEqualsThreeTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807).equals(RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -9223372036854775807 - 1,)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(
        -9223372036854775807 - 1,
        -9223372036854775807 - 1,
      );
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0800
     * @tc.name rationalNumberEqualsThreeTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 1).equals(RationalNumber.parseRationalNumber(2000000000000000000, 1000000000000000000)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(2000000000000000000, 1000000000000000000);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_0900
     * @tc.name rationalNumberEqualsThreeTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 8).equals(Number.NaN) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 8);
      let actual1: boolean = a.equals(Number.NaN);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1000
     * @tc.name rationalNumberEqualsThreeTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 8).equals(Number.POSITIVE_INFINITY) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 8);
      let actual1: boolean = a.equals(Number.POSITIVE_INFINITY);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1100
     * @tc.name rationalNumberEqualsThreeTest011
     * @tc.desc Verify equals("1") is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 8);
      let actual1: boolean = a.equals('1');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1200
     * @tc.name rationalNumberEqualsThreeTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).equals(new Int8Array([1, -2])) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ia: Int8Array = new Int8Array([1, -2]);
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = a.equals(ia);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1300
     * @tc.name rationalNumberEqualsThreeTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).equals(Promise.resolve(1)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p: Promise<int> = Promise.resolve(1);
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = a.equals(p);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1400
     * @tc.name rationalNumberEqualsThreeTest014
     * @tc.desc Verify array forms of 1/2 all equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let forms: util.RationalNumber[] = [];
      forms.push(util.RationalNumber.parseRationalNumber(1, 2));
      forms.push(util.RationalNumber.parseRationalNumber(2, 4));
      forms.push(util.RationalNumber.parseRationalNumber(5, 10));
      forms.push(util.RationalNumber.parseRationalNumber(25, 50));
      let first: util.RationalNumber = forms[0];
      let actual1: boolean = first.equals(forms[1]);
      expect(actual1).assertTrue();
      let actual2: boolean = first.equals(forms[2]);
      expect(actual2).assertTrue();
      let actual3: boolean = first.equals(forms[3]);
      expect(actual3).assertTrue();
      let actual4: boolean = forms[1].equals(forms[2]);
      expect(actual4).assertTrue();
      let actual5: boolean = forms[2].equals(forms[3]);
      expect(actual5).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1500
     * @tc.name rationalNumberEqualsThreeTest015
     * @tc.desc Verify cross-construction transitivity: parse vs createFromString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c1: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let c2: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let c3: util.RationalNumber = util.RationalNumber.createRationalFromString('1/2');
      let actual1: boolean = c1.equals(c2);
      expect(actual1).assertTrue();
      let actual2: boolean = c2.equals(c3);
      expect(actual2).assertTrue();
      let actual3: boolean = c1.equals(c3);
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1600
     * @tc.name rationalNumberEqualsThreeTest016
     * @tc.desc Verify infinity forms all equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infs: util.RationalNumber[] = [];
      infs.push(util.RationalNumber.parseRationalNumber(1, 0));
      infs.push(util.RationalNumber.parseRationalNumber(2, 0));
      infs.push(util.RationalNumber.parseRationalNumber(7, 0));
      let actual1: boolean = infs[0].equals(infs[1]);
      expect(actual1).assertTrue();
      let actual2: boolean = infs[0].equals(infs[2]);
      expect(actual2).assertTrue();
      let actual3: boolean = infs[1].equals(infs[2]);
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_THREE_1700
     * @tc.name rationalNumberEqualsThreeTest017
     * @tc.desc Verify negative forms all equal each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsThreeTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negs: util.RationalNumber[] = [];
      negs.push(util.RationalNumber.parseRationalNumber(-1, 2));
      negs.push(util.RationalNumber.parseRationalNumber(-2, 4));
      negs.push(util.RationalNumber.parseRationalNumber(-5, 10));
      let actual1: boolean = negs[0].equals(negs[1]);
      expect(actual1).assertTrue();
      let actual2: boolean = negs[0].equals(negs[2]);
      expect(actual2).assertTrue();
      let actual3: boolean = negs[1].equals(negs[2]);
      expect(actual3).assertTrue();
    });
  });
}
