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

/**
 * @tc.desc POJO used for equals() cross-type comparison
 */
interface POJO {
  key: number;
}

/**
 * @tc.desc SampleClass used for equals() cross-type comparison
 */
class SampleClass {
  val: number = 7;
}

export default function rationalNumberConstructor01Test(): void {
  describe('rationalNumberConstructor01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0100
     * @tc.name rationalNumberConstructorOneTest001
     * @tc.desc Verify new RationalNumber().getNumerator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0200
     * @tc.name rationalNumberConstructorOneTest002
     * @tc.desc Verify new RationalNumber() instances are not reference-equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new util.RationalNumber();
      let r2 = new util.RationalNumber();
      let actual1: boolean = r1 === r2;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0300
     * @tc.name rationalNumberConstructorOneTest003
     * @tc.desc Verify typeof new RationalNumber().getNumerator() returns 'long'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: string = typeof rationalNumber.getNumerator();
      let expected1: string = 'long';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0400
     * @tc.name rationalNumberConstructorOneTest004
     * @tc.desc Verify equals(rationalNumber) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.equals(rationalNumber);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0500
     * @tc.name rationalNumberConstructorOneTest005
     * @tc.desc Verify equals(r2) is true for two default-constructed RationalNumber instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new util.RationalNumber();
      let r2 = new util.RationalNumber();
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0600
     * @tc.name rationalNumberConstructorOneTest006
     * @tc.desc Verify equals(RationalNumber.parseRationalNumber(1, 2)) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.equals(util.RationalNumber.parseRationalNumber(1, 2));
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0700
     * @tc.name rationalNumberConstructorOneTest007
     * @tc.desc Verify equals(RationalNumber.parseRationalNumber(1, 0)) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.equals(util.RationalNumber.parseRationalNumber(1, 0));
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0800
     * @tc.name rationalNumberConstructorOneTest008
     * @tc.desc Verify equals('0/1') is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.equals('0/1');
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_0900
     * @tc.name rationalNumberConstructorOneTest009
     * @tc.desc Verify equals(Date) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let d: Date = new Date(0);
      let actual1: boolean = rationalNumber.equals(d);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1000
     * @tc.name rationalNumberConstructorOneTest010
     * @tc.desc Verify equals(Error) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let err: Error = new Error('x');
      let actual1: boolean = rationalNumber.equals(err);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1100
     * @tc.name rationalNumberConstructorOneTest011
     * @tc.desc Verify equals(Array) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let arr: Array<number> = [];
      let actual1: boolean = rationalNumber.equals(arr);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1200
     * @tc.name rationalNumberConstructorOneTest012
     * @tc.desc Verify equals(POJO) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let pojo: POJO = { key: 1 };
      let actual1: boolean = rationalNumber.equals(pojo);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1300
     * @tc.name rationalNumberConstructorOneTest013
     * @tc.desc Verify equals() is symmetric for two default-constructed RationalNumber instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new util.RationalNumber();
      let r2 = new util.RationalNumber();
      let actual1: boolean = r1.equals(r2);
      let expected1: boolean = r2.equals(r1);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1400
     * @tc.name rationalNumberConstructorOneTest014
     * @tc.desc Verify new RationalNumber().compare(new RationalNumber()) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: number = rationalNumber.compare(rationalNumber);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1500
     * @tc.name rationalNumberConstructorOneTest015
     * @tc.desc Verify new RationalNumber().compare(RationalNumber.parseRationalNumber(-1, 2)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: number = rationalNumber.compare(util.RationalNumber.parseRationalNumber(-1, 2));
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1600
     * @tc.name rationalNumberConstructorOneTest016
     * @tc.desc Verify new RationalNumber().compare(RationalNumber.parseRationalNumber(-1, 0)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: number = rationalNumber.compare(util.RationalNumber.parseRationalNumber(-1, 0));
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1700
     * @tc.name rationalNumberConstructorOneTest017
     * @tc.desc Verify new RationalNumber().compare(RationalNumber.parseRationalNumber(1, 2)) returns -RationalNumber.parseRationalNumber(1, 2).compare(new RationalNumber())
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new util.RationalNumber();
      let r2 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: number = r1.compare(r2);
      let expected1: number = -r2.compare(r1);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1800
     * @tc.name rationalNumberConstructorOneTest018
     * @tc.desc Verify compare() === 0 iff equals() is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let other = util.RationalNumber.createRationalFromString('0/1');
      let actual1: boolean = rationalNumber.compare(other) === 0;
      let expected1: boolean = rationalNumber.equals(other);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_1900
     * @tc.name rationalNumberConstructorOneTest019
     * @tc.desc Verify equals() is transitive for three default-constructed RationalNumber instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = new util.RationalNumber();
      let r2 = new util.RationalNumber();
      let r3 = new util.RationalNumber();
      let actual1: boolean = r1.equals(r2) && r2.equals(r3) && r1.equals(r3);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_2000
     * @tc.name rationalNumberConstructorOneTest020
     * @tc.desc Verify compare(rationalNumber) returns same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let c1: number = rationalNumber.compare(rationalNumber);
      let c2: number = rationalNumber.compare(rationalNumber);
      expect(c1).assertEqual(c2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_2100
     * @tc.name rationalNumberConstructorOneTest021
     * @tc.desc Verify new RationalNumber() instanceof RationalNumber is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new util.RationalNumber();
      let b = new util.RationalNumber();
      let actual1: boolean = a instanceof util.RationalNumber;
      expect(actual1).assertTrue();
      let actual2: boolean = b instanceof util.RationalNumber;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CONSTRUCTOR_ONE_2200
     * @tc.name rationalNumberConstructorOneTest022
     * @tc.desc Verify equals(3.14) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberConstructorOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = new util.RationalNumber();
      let d: number = 3.14;
      let actual1: boolean = r.equals(d);
      expect(actual1).assertFalse();
    });
  });
}
