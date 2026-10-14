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

export default function rationalNumberOverview02Test(): void {
  describe('rationalNumberOverview02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0100
     * @tc.name rationalNumberOverviewTwoTest001
     * @tc.desc Verify RationalNumber.createRationalFromString('6/4').toString() returns '3/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.createRationalFromString('6/4');
      let result = r.toString();
      expect(result).assertEqual('3/2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0200
     * @tc.name rationalNumberOverviewTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).toString() returns 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, 0);
      let result = r.toString();
      expect(result).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0300
     * @tc.name rationalNumberOverviewTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).toString() returns 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(0, 0);
      let result = r.toString();
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0400
     * @tc.name rationalNumberOverviewTwoTest004
     * @tc.desc Verify parseRationalNumber(9223372036854775806, 9223372036854775806) returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(9223372036854775806, 9223372036854775806);
      let result = r.toString();
      expect(result).assertEqual('1/1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0500
     * @tc.name rationalNumberOverviewTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, 2);
      let result = r.isFinite();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0600
     * @tc.name rationalNumberOverviewTwoTest006
     * @tc.desc Verify parseRationalNumber(2, 4) getNumerator unchanged after compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(2, 4);
      let before = r.getNumerator();
      r.compare(util.RationalNumber.parseRationalNumber(1, 3));
      let after = r.getNumerator();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0700
     * @tc.name rationalNumberOverviewTwoTest007
     * @tc.desc Verify parseRationalNumber(3, 6) getDenominator unchanged after valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(3, 6);
      let before = r.getDenominator();
      r.valueOf();
      let after = r.getDenominator();
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_TWO_0800
     * @tc.name rationalNumberOverviewTwoTest008
     * @tc.desc Verify parseRationalNumber(6, 4) getNumerator returns same value on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(6, 4);
      let first = r.getNumerator();
      let second = r.getNumerator();
      expect(second).assertEqual(first);
    });
  });
}
