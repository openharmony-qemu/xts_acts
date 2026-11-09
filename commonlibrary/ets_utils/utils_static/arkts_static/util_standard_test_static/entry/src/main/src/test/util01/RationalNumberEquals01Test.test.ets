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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import util from '@ohos.util';

class Payload {
  id: number = 1;
}

export default function rationalNumberEquals01Test(): void {
  describe('rationalNumberEquals01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0100
     * @tc.name rationalNumberEqualsOneTest001
     * @tc.desc Verify equals true arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let result: boolean = a.equals(b);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0200
     * @tc.name rationalNumberEqualsOneTest002
     * @tc.desc Verify equals false arity=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(5, 6);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(7, 8);
      let result: boolean = a.equals(b);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0300
     * @tc.name rationalNumberEqualsOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, -2).equals(RationalNumber.parseRationalNumber(1, 2)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(-1, -2);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0400
     * @tc.name rationalNumberEqualsOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).equals(RationalNumber.parseRationalNumber(0, 5)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 5);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0500
     * @tc.name rationalNumberEqualsOneTest005
     * @tc.desc Verify new RationalNumber() equals parse(0,7) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = new util.RationalNumber();
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 7);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0600
     * @tc.name rationalNumberEqualsOneTest006
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').equals(RationalNumber.parseRationalNumber(1, 2)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.createRationalFromString('1/2');
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0700
     * @tc.name rationalNumberEqualsOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 8).equals(same instance) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 8);
      let actual1: boolean = a.equals(a);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0800
     * @tc.name rationalNumberEqualsOneTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).equals(RationalNumber.parseRationalNumber(9223372036854775807, 1)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_0900
     * @tc.name rationalNumberEqualsOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).equals(RationalNumber.parseRationalNumber(2, 0)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(2, 0);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_1000
     * @tc.name rationalNumberEqualsOneTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).equals(RationalNumber.parseRationalNumber(0, 0)) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_1100
     * @tc.name rationalNumberEqualsOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).equals(RationalNumber.parseRationalNumber(-1, 2)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_1200
     * @tc.name rationalNumberEqualsOneTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).equals(RationalNumber.parseRationalNumber(0, 0)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_1300
     * @tc.name rationalNumberEqualsOneTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).equals(RationalNumber.parseRationalNumber(-9223372036854775808, 1)) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let b: util.RationalNumber = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 1);
      let actual1: boolean = a.equals(b);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_1400
     * @tc.name rationalNumberEqualsOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).equals('1/2') returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = a.equals('1/2');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_EQUALS_ONE_1500
     * @tc.name rationalNumberEqualsOneTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).equals(new Object()) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberEqualsOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: util.RationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = a.equals(new Object());
      expect(actual1).assertFalse();
    });
  });
}
