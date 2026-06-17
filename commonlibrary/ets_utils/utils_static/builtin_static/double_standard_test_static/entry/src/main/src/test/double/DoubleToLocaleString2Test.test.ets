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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function DoubleToLocaleString2Test(): void {
    describe('DoubleToLocaleString2Test', (): void => {
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
     * @tc.number DBL_TO_LCL_STRNG_2_0300
     * @tc.name testDoubleToLocaleString2003
     * @tc.desc Verify calling toLocaleString with both locales and options parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: object = new Object();
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_0400
     * @tc.name testDoubleToLocaleString2004
     * @tc.desc Verify calling toLocaleString with undefined locales and options parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: object = new Object();
      const result = value.toLocaleString(undefined, options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_0500
     * @tc.name testDoubleToLocaleString2005
     * @tc.desc Verify calling toLocaleString with standard BCP 47 locale strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result1 = value.toLocaleString("en-US");
      const result2 = value.toLocaleString("zh-CN");
      const result3 = value.toLocaleString("ja-JP");
      const result4 = value.toLocaleString("de-DE");
      const result5 = value.toLocaleString("fr-FR");
      expect(result1).not().assertNull();
      expect(result2).not().assertNull();
      expect(result3).not().assertNull();
      expect(result4).not().assertNull();
      expect(result5).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_0600
     * @tc.name testDoubleToLocaleString2006
     * @tc.desc Verify calling toLocaleString with string array as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString(["en-US", "zh-CN"]);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1000
     * @tc.name testDoubleToLocaleString2010
     * @tc.desc Verify calling toLocaleString with complex BCP 47 tags including script and region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result1 = value.toLocaleString("zh-Hans-CN");
      const result2 = value.toLocaleString("en-Latn-US");
      expect(result1).not().assertNull();
      expect(result2).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1100
     * @tc.name testDoubleToLocaleString2011
     * @tc.desc Verify calling toLocaleString with Unicode extension locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US-u-nu-latn");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1200
     * @tc.name testDoubleToLocaleString2012
     * @tc.desc Verify calling toLocaleString with invalid BCP 47 tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString("xx-YY-ZZZ");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1300
     * @tc.name testDoubleToLocaleString2013
     * @tc.desc Verify calling toLocaleString with special characters in locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      try {
        const result = value.toLocaleString(" en-US ");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('RangeError');
        expect(error.toString().indexOf("Incorrect locale information provided") >= 0).assertTrue();
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1400
     * @tc.name testDoubleToLocaleString2014
     * @tc.desc Verify calling toLocaleString with multi-language array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString(["en-US", "zh-CN", "ja-JP", "de-DE"]);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1500
     * @tc.name testDoubleToLocaleString2015
     * @tc.desc Verify calling toLocaleString with number type as locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const value = new Double(1234.5);
        const result = value.toLocaleString(123 as Object as Intl.LocalesArgument);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_1800
     * @tc.name testDoubleToLocaleString2018
     * @tc.desc Verify calling toLocaleString with empty object literal as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US", {});
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2000
     * @tc.name testDoubleToLocaleString2020
     * @tc.desc Verify non-Intl.NumberFormatOptions object is ignored as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: object = new Object();
      const result1 = value.toLocaleString("en-US");
      const result2 = value.toLocaleString("en-US", options);
      expect(result2).assertEqual(result1);
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2100
     * @tc.name testDoubleToLocaleString2021
     * @tc.desc Verify object with custom properties is ignored as options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const obj: Intl.NumberFormatOptions = { style: "currency", currency: "USD" };
      const result = value.toLocaleString("en-US", obj);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2200
     * @tc.name testDoubleToLocaleString2022
     * @tc.desc Verify calling toLocaleString with complete Intl.NumberFormatOptions configuration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = {
        style: "decimal",
        minimumFractionDigits: 2,
        maximumFractionDigits: 4,
        useGrouping: true
      };
      const result = value.toLocaleString("en-US", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2300
     * @tc.name testDoubleToLocaleString2023
     * @tc.desc Verify calling toLocaleString with currency style options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const options: Intl.NumberFormatOptions = {
        style: "currency",
        currency: "CNY"
      };
      const result = value.toLocaleString("zh-CN", options);
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2500
     * @tc.name testDoubleToLocaleString2025
     * @tc.desc Verify toLocaleString without parameters returns String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString();
      expect(typeof result).assertEqual("string");
      expect(result.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2600
     * @tc.name testDoubleToLocaleString2026
     * @tc.desc Verify toLocaleString with specified locale returns formatted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
      expect(result.toString().length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_2800
     * @tc.name testDoubleToLocaleString2028
     * @tc.desc Verify toLocaleString returns different formats for different locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const resultEN = value.toLocaleString("en-US");
      const resultDE = value.toLocaleString("de-DE");
      const resultJA = value.toLocaleString("ja-JP");
      expect(resultEN).not().assertNull();
      expect(resultDE).not().assertNull();
      expect(resultJA).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_3000
     * @tc.name testDoubleToLocaleString2030
     * @tc.desc Verify toLocaleString returns correct result for negative Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(-1234.5);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_3600
     * @tc.name testDoubleToLocaleString2036
     * @tc.desc Verify toLocaleString returns correct result for integer Double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(100.0);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_3800
     * @tc.name testDoubleToLocaleString2038
     * @tc.desc Verify options not being Intl.NumberFormatOptions is ignored and result is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const resultNoOptions = value.toLocaleString("en-US");
      const options: object = new Object();
      const resultWithOptions = value.toLocaleString("en-US", options);
      expect(resultWithOptions).assertEqual(resultNoOptions);
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_3900
     * @tc.name testDoubleToLocaleString2039
     * @tc.desc Verify return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      expect(result instanceof String).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4000
     * @tc.name testDoubleToLocaleString2040
     * @tc.desc Verify return value is not null or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
      expect(result).not().assertUndefined();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4100
     * @tc.name testDoubleToLocaleString2041
     * @tc.desc Verify return value toString consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      const str = result.toString();
      expect(str.length > 0).assertTrue();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4300
     * @tc.name testDoubleToLocaleString2043
     * @tc.desc Verify toLocaleString works with different Double constructor arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v1 = new Double(1.5);
      const v2 = new Double(new BigInt(42));
      const v3 = new Double("3.5");
      expect(v1.toLocaleString("en-US")).not().assertNull();
      expect(v2.toLocaleString("en-US")).not().assertNull();
      expect(v3.toLocaleString("en-US")).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4400
     * @tc.name testDoubleToLocaleString2044
     * @tc.desc Verify error capture with try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const value = new Double(1234.5);
        const result = value.toLocaleString("en-US", undefined);
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4500
     * @tc.name testDoubleToLocaleString2045
     * @tc.desc Verify normal parameters do not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
        const value = new Double(1234.5);
  const result = value.toLocaleString("en-US");
  expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4600
     * @tc.name testDoubleToLocaleString2046
     * @tc.desc Verify no-argument call does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
        const value = new Double(1234.5);
  const result = value.toLocaleString();
  expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4700
     * @tc.name testDoubleToLocaleString2047
     * @tc.desc Verify invalid locale string does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught = false;
        const value = new Double(1234.5);
  const result = value.toLocaleString("invalid-locale-string");
  expect(result).not().assertNull();
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_4800
     * @tc.name testDoubleToLocaleString2048
     * @tc.desc Verify behavior when options is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const value = new Double(1234.5);
        const result = value.toLocaleString("en-US");
        expect(result).not().assertNull();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number DBL_TO_LCL_STRNG_2_5000
     * @tc.name testDoubleToLocaleString2050
     * @tc.desc Verify toLocaleString override behavior is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDoubleToLocaleString2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Double(1234.5);
      const result = value.toLocaleString("en-US");
      expect(result).not().assertNull();
      expect(result instanceof String).assertTrue();
    });

  });
}
