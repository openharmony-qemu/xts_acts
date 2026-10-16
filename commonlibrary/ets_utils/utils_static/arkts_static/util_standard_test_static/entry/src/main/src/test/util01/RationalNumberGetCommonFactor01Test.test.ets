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

export default function rationalNumberGetCommonFactor01Test(): void {
  describe('rationalNumberGetCommonFactor01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0100
     * @tc.name rationalNumberGetCommonFactorOneTest001
     * @tc.desc Verify getCommonFactor(8, 12) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(8, 12);
      expect(g).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0200
     * @tc.name rationalNumberGetCommonFactorOneTest002
     * @tc.desc Verify RationalNumber.getCommonFactor(16, 24) returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: int = 16;
      let n2: int = 24;
      let g: number = util.RationalNumber.getCommonFactor(n1, n2);
      expect(g).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0300
     * @tc.name rationalNumberGetCommonFactorOneTest003
     * @tc.desc Verify getCommonFactor(7, 21) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(7, 21);
      expect(g).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0400
     * @tc.name rationalNumberGetCommonFactorOneTest004
     * @tc.desc Verify getCommonFactor(0x18, 0x24) returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(0x18, 0x24);
      expect(g).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0500
     * @tc.name rationalNumberGetCommonFactorOneTest005
     * @tc.desc Verify getCommonFactor(0x400, 0x280) returns 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(0x400, 0x280);
      expect(g).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0600
     * @tc.name rationalNumberGetCommonFactorOneTest006
     * @tc.desc Verify RationalNumber.getCommonFactor(3, 6) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(3, 6);
      expect(g).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0700
     * @tc.name rationalNumberGetCommonFactorOneTest007
     * @tc.desc Verify RationalNumber.getCommonFactor(36, 48) returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(36, 48);
      expect(g).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0800
     * @tc.name rationalNumberGetCommonFactorOneTest008
     * @tc.desc Verify RationalNumber.getCommonFactor(169, 13) returns 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(169, 13);
      expect(g).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_0900
     * @tc.name rationalNumberGetCommonFactorOneTest009
     * @tc.desc Verify RationalNumber.getCommonFactor(16, 32) returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(16, 32);
      expect(g).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1000
     * @tc.name rationalNumberGetCommonFactorOneTest010
     * @tc.desc Verify RationalNumber.getCommonFactor(18, 48) returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(18, 48);
      expect(g).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1100
     * @tc.name rationalNumberGetCommonFactorOneTest011
     * @tc.desc Verify RationalNumber.getCommonFactor(1, 23) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(1, 23);
      expect(g).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1200
     * @tc.name rationalNumberGetCommonFactorOneTest012
     * @tc.desc Verify RationalNumber.getCommonFactor(1, -29) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(1, -29);
      expect(g).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1300
     * @tc.name rationalNumberGetCommonFactorOneTest013
     * @tc.desc Verify RationalNumber.getCommonFactor(11, 9223372036854775807) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(11, 9223372036854775807);
      expect(g).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1400
     * @tc.name rationalNumberGetCommonFactorOneTest014
     * @tc.desc Verify RationalNumber.getCommonFactor(-12, 4) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(-12, 4);
      expect(g).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1500
     * @tc.name rationalNumberGetCommonFactorOneTest015
     * @tc.desc Verify RationalNumber.getCommonFactor(-14, 21) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(-14, 21);
      expect(g).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1600
     * @tc.name rationalNumberGetCommonFactorOneTest016
     * @tc.desc Verify RationalNumber.getCommonFactor(2, -9223372036854775807 - 1) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(2, -9223372036854775807 - 1);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1700
     * @tc.name rationalNumberGetCommonFactorOneTest017
     * @tc.desc Verify RationalNumber.getCommonFactor(-9223372036854775807 - 1, 2) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(-9223372036854775807 - 1, 2);
      expect(g).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1800
     * @tc.name rationalNumberGetCommonFactorOneTest018
     * @tc.desc Verify RationalNumber.getCommonFactor(4, -9223372036854775807 - 1) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(4, -9223372036854775807 - 1);
      expect(g).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_1900
     * @tc.name rationalNumberGetCommonFactorOneTest019
     * @tc.desc Verify getCommonFactor(9223372036854775807, 9223372036854775807) returns 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(9223372036854775807, 9223372036854775807);
      expect(g).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_2000
     * @tc.name rationalNumberGetCommonFactorOneTest020
     * @tc.desc Verify getCommonFactor(9223372036854775807, 7) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(9223372036854775807, 7);
      expect(g).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_2100
     * @tc.name rationalNumberGetCommonFactorOneTest021
     * @tc.desc Verify typeof RationalNumber.getCommonFactor(-9223372036854775807 - 1, -9223372036854775807 - 1) returns 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(-9223372036854775807 - 1, -9223372036854775807 - 1);
      let actual1: string = typeof g;
      let expected1: string = 'number';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_2200
     * @tc.name rationalNumberGetCommonFactorOneTest022
     * @tc.desc Verify loop getCommonFactor(11, 22) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = true;
      for (let i = 0; i < 4; i++) {
        let g: number = util.RationalNumber.getCommonFactor(11, 22);
        if (g !== 11) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_2300
     * @tc.name rationalNumberGetCommonFactorOneTest023
     * @tc.desc Verify getCommonFactor(0, 7) throws BusinessError (parameter cannot be zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.getCommonFactor(0, 7);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_2400
     * @tc.name rationalNumberGetCommonFactorOneTest024
     * @tc.desc Verify getCommonFactor(7, 0) throws BusinessError (parameter cannot be zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.getCommonFactor(7, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_ONE_2500
     * @tc.name rationalNumberGetCommonFactorOneTest025
     * @tc.desc Verify getCommonFactor(0, 0) throws BusinessError (parameter cannot be zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.getCommonFactor(0, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });
  });
}
