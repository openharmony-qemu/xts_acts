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

export default function rationalNumberGetCommonFactor02Test(): void {
  describe('rationalNumberGetCommonFactor02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0100
     * @tc.name rationalNumberGetCommonFactorTwoTest001
     * @tc.desc Verify typeof RationalNumber.getCommonFactor(4, 6) returns 'long'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(4, 6);
      let t: string = typeof result;
      expect(t).assertEqual('long');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0200
     * @tc.name rationalNumberGetCommonFactorTwoTest002
     * @tc.desc Verify RationalNumber.getCommonFactor(4, 6) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(4, 6);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0300
     * @tc.name rationalNumberGetCommonFactorTwoTest003
     * @tc.desc Verify RationalNumber.getCommonFactor(8, 12) returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(8, 12);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0400
     * @tc.name rationalNumberGetCommonFactorTwoTest004
     * @tc.desc Verify RationalNumber.getCommonFactor(24, 36) returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(24, 36);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0500
     * @tc.name rationalNumberGetCommonFactorTwoTest005
     * @tc.desc Verify RationalNumber.getCommonFactor(12345, 67890) returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(12345, 67890);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0600
     * @tc.name rationalNumberGetCommonFactorTwoTest006
     * @tc.desc Verify RationalNumber.getCommonFactor(256, 128) returns 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(256, 128);
      expect(result).assertEqual(128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0700
     * @tc.name rationalNumberGetCommonFactorTwoTest007
     * @tc.desc Verify RationalNumber.getCommonFactor(7, 14) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(7, 14);
      expect(g).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0800
     * @tc.name rationalNumberGetCommonFactorTwoTest008
     * @tc.desc Verify getCommonFactor(6, 9) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(6, 9);
      expect(g).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_0900
     * @tc.name rationalNumberGetCommonFactorTwoTest009
     * @tc.desc Verify RationalNumber.getCommonFactor(3, 5) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(3, 5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1000
     * @tc.name rationalNumberGetCommonFactorTwoTest010
     * @tc.desc Verify RationalNumber.getCommonFactor(1000000007, 1000000009) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(1000000007, 1000000009);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1100
     * @tc.name rationalNumberGetCommonFactorTwoTest011
     * @tc.desc Verify RationalNumber.getCommonFactor(9007199254740991, 9007199254740990) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(9007199254740991, 9007199254740990);
      expect(g).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1200
     * @tc.name rationalNumberGetCommonFactorTwoTest012
     * @tc.desc Verify RationalNumber.getCommonFactor(7, 7) returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(7, 7);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1300
     * @tc.name rationalNumberGetCommonFactorTwoTest013
     * @tc.desc Verify getCommonFactor(12345, 12345) returns 12345
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(12345, 12345);
      expect(g).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1400
     * @tc.name rationalNumberGetCommonFactorTwoTest014
     * @tc.desc Verify getCommonFactor(1000000000000, 1000000000) returns 1000000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(1000000000000, 1000000000);
      expect(result).assertEqual(1000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1500
     * @tc.name rationalNumberGetCommonFactorTwoTest015
     * @tc.desc Verify getCommonFactor(1000000009, 2000000018) returns 1000000009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(1000000009, 2000000018);
      expect(result).assertEqual(1000000009);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1600
     * @tc.name rationalNumberGetCommonFactorTwoTest016
     * @tc.desc Verify RationalNumber.getCommonFactor(-4, 6) returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(-4, 6);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1700
     * @tc.name rationalNumberGetCommonFactorTwoTest017
     * @tc.desc Verify getCommonFactor(0, 5) throws BusinessError (parameter cannot be zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.getCommonFactor(0, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1800
     * @tc.name rationalNumberGetCommonFactorTwoTest018
     * @tc.desc Verify getCommonFactor(5, 0) throws BusinessError (parameter cannot be zero)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.getCommonFactor(5, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_1900
     * @tc.name rationalNumberGetCommonFactorTwoTest019
     * @tc.desc Verify getCommonFactor(48, 36) does not mutate n1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: long = 48;
      let n2: long = 36;
      util.RationalNumber.getCommonFactor(n1, n2);
      expect(n1).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2000
     * @tc.name rationalNumberGetCommonFactorTwoTest020
     * @tc.desc Verify getCommonFactor(x, y) returns g2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 48;
      let y: long = 18;
      let g1: long = util.RationalNumber.getCommonFactor(x, y);
      let g2: long = util.RationalNumber.getCommonFactor(y, x);
      expect(g1).assertEqual(g2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2100
     * @tc.name rationalNumberGetCommonFactorTwoTest021
     * @tc.desc Verify RationalNumber.getCommonFactor(RationalNumber.getCommonFactor(12, 18), 24) returns RationalNumber.getCommonFactor(12, RationalNumber.getCommonFactor(18, 24))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g1: long = util.RationalNumber.getCommonFactor(util.RationalNumber.getCommonFactor(12, 18), 24);
      let g2: long = util.RationalNumber.getCommonFactor(12, util.RationalNumber.getCommonFactor(18, 24));
      expect(g1).assertEqual(g2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2200
     * @tc.name rationalNumberGetCommonFactorTwoTest022
     * @tc.desc Verify getCommonFactor(4, 6) returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(4, 6);
      let div: long = 6 / result;
      expect(div).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2300
     * @tc.name rationalNumberGetCommonFactorTwoTest023
     * @tc.desc Verify (4 * 6) / getCommonFactor(4, 6) returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(4, 6);
      let lcm: long = (4 * 6) / result;
      expect(lcm).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2400
     * @tc.name rationalNumberGetCommonFactorTwoTest024
     * @tc.desc Verify RationalNumber.getCommonFactor((48 / RationalNumber.getCommonFactor(48, 36)), (36 / RationalNumber.getCommonFactor(48, 36))) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n1: long = 48;
      let n2: long = 36;
      let g: long = util.RationalNumber.getCommonFactor(n1, n2);
      let q1: long = n1 / g;
      let q2: long = n2 / g;
      let actual1: number = util.RationalNumber.getCommonFactor(q1, q2);
      let expected1: number = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2500
     * @tc.name rationalNumberGetCommonFactorTwoTest025
     * @tc.desc Verify RationalNumber.getCommonFactor(2147483647, 2147483647) returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(2147483647, 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2600
     * @tc.name rationalNumberGetCommonFactorTwoTest026
     * @tc.desc Verify RationalNumber.getCommonFactor(2147483647, 2147483646) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(2147483647, 2147483646);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2700
     * @tc.name rationalNumberGetCommonFactorTwoTest027
     * @tc.desc Verify RationalNumber.getCommonFactor(2147483648, 2147483648) returns 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(2147483648, 2147483648);
      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2800
     * @tc.name rationalNumberGetCommonFactorTwoTest028
     * @tc.desc Verify getCommonFactor(9223372036854775807, 9223372036854775806) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(9223372036854775807, 9223372036854775806);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_2900
     * @tc.name rationalNumberGetCommonFactorTwoTest029
     * @tc.desc Verify getCommonFactor(-9223372036854775807 - 1, -9223372036854775807 - 1) returns -9223372036854775807 - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = util.RationalNumber.getCommonFactor(-9223372036854775807 - 1, -9223372036854775807 - 1);
      expect(result).assertEqual(-9223372036854775807 - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_COMMON_FACTOR_TWO_3000
     * @tc.name rationalNumberGetCommonFactorTwoTest030
     * @tc.desc Verify getCommonFactor(9223372036854775807, -6) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetCommonFactorTwoTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g: number = util.RationalNumber.getCommonFactor(9223372036854775807, -6);
      expect(g).assertEqual(1);
    });
  });
}
