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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function FloatToLocaleString1Test(): void {
  describe('FloatToLocaleString1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0100
     * @tc.name testToLocaleString1001
     * @tc.desc Verify toLocaleString() with no arguments returns String type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString();
      const matchesUndefinedLocale: boolean = result === new Float(1234.5f).toLocaleString(undefined);
      expect(matchesUndefinedLocale).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0200
     * @tc.name testToLocaleString1002
     * @tc.desc Verify toLocaleString("en-US") with locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("en-US");
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0300
     * @tc.name testToLocaleString1003
     * @tc.desc Verify toLocaleString("zh-CN") with zh-CN locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("zh-CN");
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0400
     * @tc.name testToLocaleString1004
     * @tc.desc Verify toLocaleString("ja-JP") with ja-JP locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("ja-JP");
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0500
     * @tc.name testToLocaleString1005
     * @tc.desc Verify toLocaleString("de-DE") with de-DE locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("de-DE");
      const isMatch: boolean = result === "1.234,5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0600
     * @tc.name testToLocaleString1006
     * @tc.desc Verify toLocaleString("fr-FR") with fr-FR locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("fr-FR");
      const isMatch: boolean = result === "1 234,5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0700
     * @tc.name testToLocaleString1007
     * @tc.desc Verify toLocaleString("ko-KR") with ko-KR locale returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("ko-KR");
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0800
     * @tc.name testToLocaleString1008
     * @tc.desc Verify toLocaleString with locale array returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString(["en-US"]);
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_0900
     * @tc.name testToLocaleString1009
     * @tc.desc Verify toLocaleString with multiple locale array returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString(["en-US", "zh-CN"]);
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1000
     * @tc.name testToLocaleString1010
     * @tc.desc Verify toLocaleString with en-US locale for 0.75 returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.75f).toLocaleString("en-US");
      const isMatch: boolean = result === "0.75";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1100
     * @tc.name testToLocaleString1011
     * @tc.desc Verify toLocaleString with positive integer Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234f).toLocaleString("en-US");
      const isMatch: boolean = result === "1,234";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1200
     * @tc.name testToLocaleString1012
     * @tc.desc Verify toLocaleString with very small positive Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0.001f).toLocaleString("en-US");
      const isMatch: boolean = result === "0.001";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1300
     * @tc.name testToLocaleString1013
     * @tc.desc Verify toLocaleString with large Float returns grouped format
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(999999999.99f).toLocaleString("en-US");
      const isMatch: boolean = result === "1,000,000,000";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1400
     * @tc.name testToLocaleString1014
     * @tc.desc Verify toLocaleString with negative integer Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-1234f).toLocaleString("en-US");
      const isMatch: boolean = result === "-1,234";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1500
     * @tc.name testToLocaleString1015
     * @tc.desc Verify toLocaleString with negative decimal Float returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-1234.5f).toLocaleString("en-US");
      const isMatch: boolean = result === "-1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1600
     * @tc.name testToLocaleString1016
     * @tc.desc Verify toLocaleString with positive zero returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(0f).toLocaleString("en-US");
      const isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1700
     * @tc.name testToLocaleString1017
     * @tc.desc Verify toLocaleString with negative zero returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(-0f).toLocaleString("en-US");
      const isMatch: boolean = result === "-0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1800
     * @tc.name testToLocaleString1018
     * @tc.desc Verify toLocaleString with NaN returns NaN string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NaN).toLocaleString("en-US");
      const isMatch: boolean = result === "NaN";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_1900
     * @tc.name testToLocaleString1019
     * @tc.desc Verify toLocaleString with POSITIVE_INFINITY returns infinity string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.POSITIVE_INFINITY).toLocaleString("en-US");
      const isMatch: boolean = result === "∞";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2000
     * @tc.name testToLocaleString1020
     * @tc.desc Verify toLocaleString with NEGATIVE_INFINITY returns negative infinity string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.NEGATIVE_INFINITY).toLocaleString("en-US");
      const isMatch: boolean = result === "-∞";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2100
     * @tc.name testToLocaleString1021
     * @tc.desc Verify toLocaleString with MAX_VALUE returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MAX_VALUE).toLocaleString("en-US");
      const isMatch: boolean = result === "340,282,346,638,528,860,000,000,000,000,000,000,000";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2200
     * @tc.name testToLocaleString1022
     * @tc.desc Verify toLocaleString with MIN_VALUE returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(Float.MIN_VALUE).toLocaleString("en-US");
      const isMatch: boolean = result === "0";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2300
     * @tc.name testToLocaleString1023
     * @tc.desc Verify toLocaleString return value is String type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Float(1234.5f).toLocaleString("en-US");
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2400
     * @tc.name testToLocaleString1024
     * @tc.desc Verify different locales produce different formatted results
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const enResult: string = new Float(1234.5f).toLocaleString("en-US");
      const deResult: string = new Float(1234.5f).toLocaleString("de-DE");
      const enMatchesExpected: boolean = enResult === "1,234.5";
      expect(enMatchesExpected).assertTrue();
      const deMatchesExpected: boolean = deResult === "1.234,5";
      expect(deMatchesExpected).assertTrue();
      let areDifferent: boolean = enResult !== deResult;
      expect(areDifferent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2500
     * @tc.name testToLocaleString1025
     * @tc.desc Verify instance toLocaleString with invalid locale falls back to default
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("xxx");
      const matchesUndefinedLocale: boolean = result === new Float(1234.5f).toLocaleString(undefined);
      expect(matchesUndefinedLocale).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2600
     * @tc.name testToLocaleString1026
     * @tc.desc Verify instance toLocaleString with en-US locale and new Object() options returns formatted string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("en-US", new Object());
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2700
     * @tc.name testToLocaleString1027
     * @tc.desc Verify instance toLocaleString with empty string locale throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(1234.5f).toLocaleString("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2800
     * @tc.name testToLocaleString1028
     * @tc.desc Verify instance toLocaleString with zero-width space locale throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Float(1234.5f).toLocaleString("​");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOLOCALESTRING_1_2900
     * @tc.name testToLocaleString1029
     * @tc.desc Verify instance toLocaleString with undefined options is equivalent to no options
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testToLocaleString1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = new Float(1234.5f).toLocaleString("en-US", undefined);
      const isMatch: boolean = result === "1,234.5";
      expect(isMatch).assertTrue();
    });
  });
}
