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

class RationalNumberOverviewThreeHArr {
  public values: int[] = [1, 2, 3];
}

export default function rationalNumberOverview03Test(): void {
  describe('rationalNumberOverview03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0100
     * @tc.name rationalNumberOverviewThreeTest001
     * @tc.desc Verify RationalNumber.parseRationalNumber(4611686018427387904, 2).getNumerator() returns 2305843009213693952
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a7 = util.RationalNumber.parseRationalNumber(4611686018427387904, 2);
      let actual1: number = a7.getNumerator();
      let expected1: number = 2305843009213693952;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0200
     * @tc.name rationalNumberOverviewThreeTest002
     * @tc.desc Verify createRationalFromString('NaN/1') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.createRationalFromString('NaN/1');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0300
     * @tc.name rationalNumberOverviewThreeTest003
     * @tc.desc Verify createRationalFromString('3/') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.createRationalFromString('3/');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0400
     * @tc.name rationalNumberOverviewThreeTest004
     * @tc.desc Verify createRationalFromString('3 4') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.createRationalFromString('3 4');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0500
     * @tc.name rationalNumberOverviewThreeTest005
     * @tc.desc Verify createRationalFromString('1/abc') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.createRationalFromString('1/abc');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0600
     * @tc.name rationalNumberOverviewThreeTest006
     * @tc.desc Verify equals(Map) RationalNumber false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hm1: Map<string, int> = new Map<string, int>();
      hm1.set('k', 1);
      let rh1 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = rh1.equals(hm1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0700
     * @tc.name rationalNumberOverviewThreeTest007
     * @tc.desc Verify equals(Set) RationalNumber false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hs1: Set<string> = new Set<string>();
      hs1.add('x');
      let rh2 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = rh2.equals(hs1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0800
     * @tc.name rationalNumberOverviewThreeTest008
     * @tc.desc Verify equals(RegExp) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hr1: RegExp = new RegExp('ab');
      let rh3 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = rh3.equals(hr1);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_0900
     * @tc.name rationalNumberOverviewThreeTest009
     * @tc.desc Verify equals(new Object()) returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rh5 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = rh5.equals(new Object());
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_1000
     * @tc.name rationalNumberOverviewThreeTest010
     * @tc.desc Verify equals(true) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rh8 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = rh8.equals(true);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_THREE_1100
     * @tc.name rationalNumberOverviewThreeTest011
     * @tc.desc Verify equals(Double.NaN) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewThreeTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rh11 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = rh11.equals(Double.NaN);
      expect(actual1).assertFalse();
    });
  });
}
