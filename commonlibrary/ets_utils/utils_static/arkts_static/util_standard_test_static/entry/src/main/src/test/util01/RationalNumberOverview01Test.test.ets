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

export default function rationalNumberOverview01Test(): void {
  describe('rationalNumberOverview01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_ONE_0100
     * @tc.name rationalNumberOverviewOneTest001
     * @tc.desc Verify isNaN(new RationalNumber().valueOf()) returns true across 8 repeated constructions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 8; i++) {
        let cAr4 = new util.RationalNumber();
        let actual1: number = cAr4.valueOf();
        expect(isNaN(actual1)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_ONE_0200
     * @tc.name rationalNumberOverviewOneTest002
     * @tc.desc Verify RationalNumber.getCommonFactor(17, 19) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g2: number = util.RationalNumber.getCommonFactor(17, 19);
      expect(g2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_ONE_0300
     * @tc.name rationalNumberOverviewOneTest003
     * @tc.desc Verify RationalNumber.getCommonFactor(-4, 6) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g4: number = util.RationalNumber.getCommonFactor(-4, 6);
      expect(g4).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_ONE_0400
     * @tc.name rationalNumberOverviewOneTest004
     * @tc.desc Verify RationalNumber.getCommonFactor(6, -4) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h2: number = util.RationalNumber.getCommonFactor(6, -4);
      expect(h2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_OVERVIEW_ONE_0500
     * @tc.name rationalNumberOverviewOneTest005
     * @tc.desc Verify RationalNumber.getCommonFactor(1, 9223372036854775807) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberOverviewOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let h3: number = util.RationalNumber.getCommonFactor(1, 9223372036854775807);
      expect(h3).assertEqual(1);
    });
  });
}
