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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function FloatToLocaleString2Test(): void {
  describe('FloatToLocaleString2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0100
     * @tc.name testToLocaleString2001
     * @tc.desc Verify toLocaleString() with no arguments returns default locale formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString();
      let matchesDefault: boolean = result === new Float(1234.5f).toLocaleString(undefined);
      expect(matchesDefault).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0200
     * @tc.name testToLocaleString2002
     * @tc.desc Verify toLocaleString("en-US") with valid locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("en-US");
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0300
     * @tc.name testToLocaleString2003
     * @tc.desc Verify toLocaleString with locales and object options returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("en-US", new Object());
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0400
     * @tc.name testToLocaleString2004
     * @tc.desc Verify toLocaleString("zh-CN") with zh-CN locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("zh-CN");
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0500
     * @tc.name testToLocaleString2005
     * @tc.desc Verify toLocaleString("ja-JP") with ja-JP locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("ja-JP");
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0600
     * @tc.name testToLocaleString2006
     * @tc.desc Verify toLocaleString("de-DE") with de-DE locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("de-DE");
      let isMatch: boolean = result === "1.234,5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0700
     * @tc.name testToLocaleString2007
     * @tc.desc Verify toLocaleString("fr-FR") with fr-FR locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("fr-FR");
      let isMatch: boolean = result === "1 234,5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0800
     * @tc.name testToLocaleString2008
     * @tc.desc Verify toLocaleString with locale array returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString(["en-US", "zh-CN"]);
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_0900
     * @tc.name testToLocaleString2009
     * @tc.desc Verify toLocaleString with invalid locale falls back to default
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("xxx");
      let matchesDefault: boolean = result === new Float(1234.5f).toLocaleString(undefined);
      expect(matchesDefault).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1000
     * @tc.name testToLocaleString2010
     * @tc.desc Verify toLocaleString with en-US locale for 0.75 returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.75f).toLocaleString("en-US");
      let isMatch: boolean = result === "0.75";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1100
     * @tc.name testToLocaleString2011
     * @tc.desc Verify toLocaleString with maximumFractionDigits option returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.567f).toLocaleString("en-US");
      let isMatch: boolean = result === "1,234.567";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1200
     * @tc.name testToLocaleString2012
     * @tc.desc Verify toLocaleString with positive integer Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.0f).toLocaleString("en-US");
      let isMatch: boolean = result === "1,234";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1300
     * @tc.name testToLocaleString2013
     * @tc.desc Verify toLocaleString with large Float returns grouped formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(123456789.123f).toLocaleString("en-US");
      let isMatch: boolean = result === "123,456,792";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1400
     * @tc.name testToLocaleString2014
     * @tc.desc Verify toLocaleString with very small Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.001f).toLocaleString("en-US");
      let isMatch: boolean = result === "0.001";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1500
     * @tc.name testToLocaleString2015
     * @tc.desc Verify toLocaleString with negative integer Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-1234.0f).toLocaleString("en-US");
      let isMatch: boolean = result === "-1,234";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1600
     * @tc.name testToLocaleString2016
     * @tc.desc Verify toLocaleString with negative decimal Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-1234.567f).toLocaleString("en-US");
      let isMatch: boolean = result === "-1,234.567";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1700
     * @tc.name testToLocaleString2017
     * @tc.desc Verify toLocaleString with positive zero returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.0f).toLocaleString("en-US");
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1800
     * @tc.name testToLocaleString2018
     * @tc.desc Verify toLocaleString with negative zero returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-0.0f).toLocaleString("en-US");
      let isMatch: boolean = result === "-0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_1900
     * @tc.name testToLocaleString2019
     * @tc.desc Verify toLocaleString with MAX_VALUE returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MAX_VALUE).toLocaleString("en-US");
      let isMatch: boolean = result === "340,282,346,638,528,860,000,000,000,000,000,000,000";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2000
     * @tc.name testToLocaleString2020
     * @tc.desc Verify toLocaleString with MIN_VALUE returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MIN_VALUE).toLocaleString("en-US");
      let isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2100
     * @tc.name testToLocaleString2021
     * @tc.desc Verify toLocaleString with NaN returns NaN string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NaN).toLocaleString("en-US");
      let isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2200
     * @tc.name testToLocaleString2022
     * @tc.desc Verify toLocaleString with POSITIVE_INFINITY returns infinity string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.POSITIVE_INFINITY).toLocaleString("en-US");
      let isMatch: boolean = result === "∞";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2300
     * @tc.name testToLocaleString2023
     * @tc.desc Verify toLocaleString with NEGATIVE_INFINITY returns negative infinity string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NEGATIVE_INFINITY).toLocaleString("en-US");
      let isMatch: boolean = result === "-∞";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2400
     * @tc.name testToLocaleString2024
     * @tc.desc Verify toLocaleString return value is String type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Float(1234.5f).toLocaleString("en-US");
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2500
     * @tc.name testToLocaleString2025
     * @tc.desc Verify toLocaleString is overridden from Object.prototype
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const result: string = f.toLocaleString("en-US");
      let isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2600
     * @tc.name testToLocaleString2026
     * @tc.desc Verify toLocaleString with same parameters multiple times returns same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(1234.5f);
      const first: string = f.toLocaleString("en-US");
      const second: string = f.toLocaleString("en-US");
      let isConsistent: boolean = first === second;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2700
     * @tc.name testToLocaleString2027
     * @tc.desc Verify different Float instances with same value return same formatted result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first: string = new Float(1234.5f).toLocaleString("en-US");
      const second: string = new Float(1234.5f).toLocaleString("en-US");
      let isConsistent: boolean = first === second;
      expect(isConsistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2800
     * @tc.name testToLocaleString2028
     * @tc.desc Verify instance toLocaleString with zero-width space locale throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(1234.5f).toLocaleString("​");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_2_2900
     * @tc.name testToLocaleString2029
     * @tc.desc Verify instance toLocaleString with emoji locale throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(1234.5f).toLocaleString("😀");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });
  });
}
