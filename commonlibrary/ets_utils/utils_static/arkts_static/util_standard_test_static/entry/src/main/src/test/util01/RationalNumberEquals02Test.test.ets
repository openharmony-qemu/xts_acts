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

class Item {
  name: string = 'x';
}

export default function rationalNumberEquals02Test(): void {
  describe('rationalNumberEquals02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0100
     * @tc.name rationalNumberEqualsTwoTest001
     * @tc.desc Verify equals true arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(6, 8);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 4);
      let result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0200
     * @tc.name rationalNumberEqualsTwoTest002
     * @tc.desc Verify equals false arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9, 11);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(11, 13);
      let result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0300
     * @tc.name rationalNumberEqualsTwoTest003
     * @tc.desc Verify equals true/false/true consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 5);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(6, 10);
      let c: util.RationalNumber = util.RationalNumber.parseRationalNumber(7, 9);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
      let actual2: boolean = a.equals(c);
      expect(actual2).assertFalse();
      let actual3: boolean = a.equals(b);
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0400
     * @tc.name rationalNumberEqualsTwoTest004
     * @tc.desc Verify RationalNumber.createRationalFromString('6/9').equals(RationalNumber.parseRationalNumber(2, 3)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.createRationalFromString('6/9');
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 3);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0500
     * @tc.name rationalNumberEqualsTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).equals(RationalNumber.parseRationalNumber(9223372036854775807, 2)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 2);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0600
     * @tc.name rationalNumberEqualsTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).equals(same instance) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = a.equals(a);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0700
     * @tc.name rationalNumberEqualsTwoTest007
     * @tc.desc Verify transitivity of equals for 4/10, 2/5, 20/50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(4, 10);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 5);
      let c: util.RationalNumber = util.RationalNumber.parseRationalNumber(20, 50);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
      let actual2: boolean = b.equals(c);
      expect(actual2).assertTrue();
      let actual3: boolean = a.equals(c);
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0800
     * @tc.name rationalNumberEqualsTwoTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).equals(RationalNumber.parseRationalNumber(1, 0)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
      let actual2: boolean = b.equals(a);
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_0900
     * @tc.name rationalNumberEqualsTwoTest009
     * @tc.desc Verify equals if true valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(4, 10);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 5);
      let v: double = 0;
      if (a.equals(b)) {
        v = a.valueOf();
      }
      expect(v).assertEqual(0.4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_TWO_1000
     * @tc.name rationalNumberEqualsTwoTest010
     * @tc.desc Verify equals true 4/10 2/5 compare 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(4, 10);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 5);
      let eq: boolean = a.equals(b);
      let cmp: number = a.compare(b);
      expect(eq).assertTrue();
      expect(cmp).assertEqual(0);
    });
  });
}
