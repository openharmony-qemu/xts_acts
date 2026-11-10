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
import Utils from './../Util.test';

export default function int8ArrayToLocaleStringPart03Test(): void {
  describe('Int8ArrayToLocaleStringPart03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;
    const INT8_ZERO = 0;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0100
     * @tc.name int8ArrayToLocaleStringPart03Test001
     * @tc.desc Verify toLocaleString: locales is undefined uses system default locale, does not throw, returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toLocaleString(undefined, undefined);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0200
     * @tc.name int8ArrayToLocaleStringPart03Test002
     * @tc.desc Verify toLocaleString: locales is empty string, illegal BCP-47 tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0300
     * @tc.name int8ArrayToLocaleStringPart03Test003
     * @tc.desc Verify toLocaleString: locales is single character 'x', illegal BCP-47 subtag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('x', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0400
     * @tc.name int8ArrayToLocaleStringPart03Test004
     * @tc.desc Verify toLocaleString: locales is 'EN-US' all uppercase, verify case tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toLocaleString('EN-US', undefined);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0500
     * @tc.name int8ArrayToLocaleStringPart03Test005
     * @tc.desc Verify toLocaleString: locales is '-en-US' leading hyphen, malformed tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('-en-US', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0600
     * @tc.name int8ArrayToLocaleStringPart03Test006
     * @tc.desc Verify toLocaleString: locales is pure digit string '123', illegal language subtag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('123', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0700
     * @tc.name int8ArrayToLocaleStringPart03Test007
     * @tc.desc Verify toLocaleString: locales is space ' ', illegal whitespace tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString(' ', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0800
     * @tc.name int8ArrayToLocaleStringPart03Test008
     * @tc.desc locales is lone surrogate '\ud83d', illegal Unicode half-codepoint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('\ud83d', undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_0900
     * @tc.name int8ArrayToLocaleStringPart03Test009
     * @tc.desc Verify toLocaleString: locales is empty array [], falls back to system default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let loc: string[] = [];
      let result = arr.toLocaleString(loc, undefined);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1000
     * @tc.name int8ArrayToLocaleStringPart03Test010
     * @tc.desc Verify toLocaleString: locales is single-element array ['en-US'], valid BCP-47 array form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let loc: string[] = ['en-US'];
      let result = arr.toLocaleString(loc, undefined);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1100
     * @tc.name int8ArrayToLocaleStringPart03Test011
     * @tc.desc Verify toLocaleString: locales is multi-element array ['en-US', 'zh-CN'], fallback chain multi-language
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let loc: string[] = ['en-US', 'zh-CN'];
      let result = arr.toLocaleString(loc, undefined);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1200
     * @tc.name int8ArrayToLocaleStringPart03Test012
     * @tc.desc Verify toLocaleString: locales is array containing empty string element [''], empty tag array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let loc: string[] = [''];
      try {
        arr.toLocaleString(loc, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1300
     * @tc.name int8ArrayToLocaleStringPart03Test013
     * @tc.desc Verify toLocaleString: minimumFractionDigits = 0 boundary minimum valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 0 };
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1400
     * @tc.name int8ArrayToLocaleStringPart03Test014
     * @tc.desc Verify toLocaleString maximumFractionDigits negative throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { maximumFractionDigits: -1 };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1500
     * @tc.name int8ArrayToLocaleStringPart03Test015
     * @tc.desc Verify toLocaleString fraction digits conflict throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 5, maximumFractionDigits: 2 };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1600
     * @tc.name int8ArrayToLocaleStringPart03Test016
     * @tc.desc Verify toLocaleString: minimumIntegerDigits = 1 boundary minimum valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 1 };
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1700
     * @tc.name int8ArrayToLocaleStringPart03Test017
     * @tc.desc Verify toLocaleString: minimumIntegerDigits = 22 exceeds upper bound (spec limit 21)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 22 };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1800
     * @tc.name int8ArrayToLocaleStringPart03Test018
     * @tc.desc Verify toLocaleString minimumIntegerDigits huge throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 100 };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_1900
     * @tc.name int8ArrayToLocaleStringPart03Test019
     * @tc.desc Verify toLocaleString: useGrouping = false valid boolean value, disables thousands grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { useGrouping: false };
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2000
     * @tc.name int8ArrayToLocaleStringPart03Test020
     * @tc.desc Verify toLocaleString: currency is empty string, illegal ISO 4217 currency code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { style: 'currency', currency: '' };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2100
     * @tc.name int8ArrayToLocaleStringPart03Test021
     * @tc.desc Verify toLocaleString currency='XXX' throws RangeError Invalid currency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { style: 'currency', currency: 'XXX' };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2200
     * @tc.name int8ArrayToLocaleStringPart03Test022
     * @tc.desc Empty array toLocaleString does not throw, returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2300
     * @tc.name int8ArrayToLocaleStringPart03Test023
     * @tc.desc Single element [0] toLocaleString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_ZERO]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2400
     * @tc.name int8ArrayToLocaleStringPart03Test024
     * @tc.desc Single element [-128] minimum value boundary toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2500
     * @tc.name int8ArrayToLocaleStringPart03Test025
     * @tc.desc Single element [127] maximum value boundary toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2600
     * @tc.name int8ArrayToLocaleStringPart03Test026
     * @tc.desc Single element [-1] negative one marker value toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([-1]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2700
     * @tc.name int8ArrayToLocaleStringPart03Test027
     * @tc.desc All identical elements [5, 5, 5] toLocaleString uses comma join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([5, 5, 5]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2800
     * @tc.name int8ArrayToLocaleStringPart03Test028
     * @tc.desc All zero elements [0, 0, 0] toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_ZERO, INT8_ZERO, INT8_ZERO]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_2900
     * @tc.name int8ArrayToLocaleStringPart03Test029
     * @tc.desc All minimum values [-128, -128, -128] toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_MIN, INT8_MIN]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('-128,-128,-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3000
     * @tc.name int8ArrayToLocaleStringPart03Test030
     * @tc.desc All maximum values [127, 127, 127] toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MAX, INT8_MAX, INT8_MAX]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('127,127,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3100
     * @tc.name int8ArrayToLocaleStringPart03Test031
     * @tc.desc Mixed boundary values [-128, 0, 127] toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([INT8_MIN, INT8_ZERO, INT8_MAX]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('-128,0,127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3200
     * @tc.name int8ArrayToLocaleStringPart03Test032
     * @tc.desc Truncated value array (construction 200->-56, 255->-1) toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([200, 255]);
      let result = arr.toLocaleString('en-US', undefined);
      expect(result).assertEqual('-56,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3300
     * @tc.name int8ArrayToLocaleStringPart03Test033
     * @tc.desc style='currency' but no currency provided, toLocaleString throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { style: 'currency' };
      let arr = new Int8Array([1, 2, 3]);
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3400
     * @tc.name int8ArrayToLocaleStringPart03Test034
     * @tc.desc style='currency' + currency='USD' valid combination, returns a non-empty currency string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let opts: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      let arr = new Int8Array([1, 2, 3]);
      let result = arr.toLocaleString('en-US', opts);
      let r1: boolean = result.length > 0;
      expect(r1).assertTrue();
      let r2: boolean = result.includes('1');
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3500
     * @tc.name int8ArrayToLocaleStringPart03Test035
     * @tc.desc Verify toLocaleString call keeps array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let beforeLen: number = arr.length;
      let resultVal1: string = arr.toLocaleString('en-US', undefined);
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualLen: number = arr.length;
      let expectedLen: number = beforeLen;
      expect(actualLen).assertEqual(expectedLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3600
     * @tc.name int8ArrayToLocaleStringPart03Test036
     * @tc.desc Verify toLocaleString: After call, original array first element is not modified
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let resultVal1: string = arr.toLocaleString('en-US', undefined);
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualFirst: number = arr[0];
      let expectedFirst: number = 1;
      expect(actualFirst).assertEqual(expectedFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART03_TEST_3700
     * @tc.name int8ArrayToLocaleStringPart03Test037
     * @tc.desc Verify toLocaleString: Same array called multiple times returns consistent value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array([1, 2, 3]);
      let r1 = arr.toLocaleString('en-US', undefined);
      let expected1: string = '1,2,3';
      expect(r1).assertEqual(expected1);
    });
  });
}
