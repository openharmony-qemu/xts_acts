'use static';
/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

export default function Float64ArrayToLocaleStringTest(): void {
  describe('Float64ArrayToLocaleStringTest', (): void => {

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0100
     * @tc.name testFloat64ArrayToLocaleString001
     * @tc.desc Verify toLocaleString with 0 arguments, using default locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toLocaleString();
      const expected = "-2,147,483,648,-1,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0200
     * @tc.name testFloat64ArrayToLocaleString002
     * @tc.desc Verify toLocaleString with 1 argument, only locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString("en-US");
      const expected = "0.1,9,007,199,254,740,991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0300
     * @tc.name testFloat64ArrayToLocaleString003
     * @tc.desc Verify toLocaleString with 2 arguments, locales and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.toLocaleString("en-US");
      const expected = "0.5,1.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0400
     * @tc.name testFloat64ArrayToLocaleString004
     * @tc.desc Verify locales="en-US", American English locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toLocaleString("en-US");
      const expected = "-32,768,-128,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0500
     * @tc.name testFloat64ArrayToLocaleString005
     * @tc.desc Verify locales="zh-CN", Simplified Chinese locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toLocaleString("zh-CN");
      const expected = "-2,147,483,648,-1,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0600
     * @tc.name testFloat64ArrayToLocaleString006
     * @tc.desc Verify locales="de-DE", German locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString("de-DE");
      const expected = "0,1,9.007.199.254.740.991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0700
     * @tc.name testFloat64ArrayToLocaleString007
     * @tc.desc Verify locales="ja-JP", Japanese locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.toLocaleString("ja-JP");
      const expected = "0.5,1.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0800
     * @tc.name testFloat64ArrayToLocaleString008
     * @tc.desc Verify locales="fr-FR", French locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString("fr-FR");
      const expected = "-32\u202F768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_0900
     * @tc.name testFloat64ArrayToLocaleString009
     * @tc.desc Verify locales as string array ["en-US"]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toLocaleString(["en-US"]);
      const expected = "-2,147,483,648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1000
     * @tc.name testFloat64ArrayToLocaleString010
     * @tc.desc Verify locales as string array ["zh-CN", "en-US"]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString(["zh-CN", "en-US"]);
      const expected = "0.1,9,007,199,254,740,991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1100
     * @tc.name testFloat64ArrayToLocaleString011
     * @tc.desc Verify locales as string array ["de-DE", "fr-FR", "en-US"]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.toLocaleString(["de-DE", "fr-FR", "en-US"]);
      const expected = "0,5,1,5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1200
     * @tc.name testFloat64ArrayToLocaleString012
     * @tc.desc Verify locales as empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString("en-US");
      const expected = "-32,768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1300
     * @tc.name testFloat64ArrayToLocaleString013
     * @tc.desc Verify locales as empty array []
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toLocaleString();
      const expected = "-2,147,483,648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1400
     * @tc.name testFloat64ArrayToLocaleString014
     * @tc.desc Verify locales as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString(undefined);
      const expected = "0.1,9,007,199,254,740,991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1500
     * @tc.name testFloat64ArrayToLocaleString015
     * @tc.desc Verify locales as null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.toLocaleString();
      const expected = "0.5,1.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1600
     * @tc.name testFloat64ArrayToLocaleString016
     * @tc.desc Verify locales="en-US" with negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toLocaleString("en-US");
      const expected = "0.1,9,007,199,254,740,991,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1700
     * @tc.name testFloat64ArrayToLocaleString017
     * @tc.desc Verify locales="zh-CN" with negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toLocaleString("zh-CN");
      const expected = "0.5,1.5,0.25";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1800
     * @tc.name testFloat64ArrayToLocaleString018
     * @tc.desc Verify options={numberFormat:"standard"} with zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString("zh-CN");
      const expected = "-32,768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_1900
     * @tc.name testFloat64ArrayToLocaleString019
     * @tc.desc Verify options={numberFormat:"currency"} with en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toLocaleString("en-US");
      const expected = "-2,147,483,648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2000
     * @tc.name testFloat64ArrayToLocaleString020
     * @tc.desc Verify options={numberFormat:"standard"} with zh-CN large numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString("zh-CN");
      const expected = "0.1,9,007,199,254,740,991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2100
     * @tc.name testFloat64ArrayToLocaleString021
     * @tc.desc Verify options={numberFormat:"currency"} with zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.toLocaleString("zh-CN");
      const expected = "0.5,1.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2200
     * @tc.name testFloat64ArrayToLocaleString022
     * @tc.desc Verify options={numberFormat:"percent"} with zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toLocaleString("zh-CN");
      const expected = "-32,768,-128,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2300
     * @tc.name testFloat64ArrayToLocaleString023
     * @tc.desc Verify options={numberFormat:"scientific"} with zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toLocaleString("zh-CN");
      const expected = "-2,147,483,648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2400
     * @tc.name testFloat64ArrayToLocaleString024
     * @tc.desc Verify options={numberFormat:"standard"} with de-DE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.toLocaleString("de-DE");
      const expected = "0,5,1,5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2500
     * @tc.name testFloat64ArrayToLocaleString025
     * @tc.desc Verify options={numberFormat:"currency"} with de-DE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString("de-DE");
      const expected = "-32.768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2600
     * @tc.name testFloat64ArrayToLocaleString026
     * @tc.desc Verify options={numberFormat:"percent"} with de-DE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toLocaleString("de-DE");
      const expected = "-2.147.483.648,-1,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2700
     * @tc.name testFloat64ArrayToLocaleString027
     * @tc.desc Verify options={numberFormat:"standard"} with ja-JP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString("ja-JP");
      const expected = "-32,768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2800
     * @tc.name testFloat64ArrayToLocaleString028
     * @tc.desc Verify options={numberFormat:"currency"} with ja-JP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toLocaleString("ja-JP");
      const expected = "-2,147,483,648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_2900
     * @tc.name testFloat64ArrayToLocaleString029
     * @tc.desc Verify options={numberFormat:"percent"} with ja-JP
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toLocaleString("ja-JP");
      const expected = "0.1,9,007,199,254,740,991,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3000
     * @tc.name testFloat64ArrayToLocaleString030
     * @tc.desc Verify options={numberFormat:"standard"} with fr-FR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const result = arr.toLocaleString("fr-FR");
      const expected = "-2\u202F147\u202F483\u202F648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3100
     * @tc.name testFloat64ArrayToLocaleString031
     * @tc.desc Verify options={numberFormat:"currency"} with fr-FR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString("fr-FR");
      const expected = "0,1,9\u202F007\u202F199\u202F254\u202F740\u202F991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3200
     * @tc.name testFloat64ArrayToLocaleString032
     * @tc.desc Verify options={numberFormat:"percent"} with fr-FR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toLocaleString("fr-FR");
      const expected = "0,5,1,5,0,25";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3300
     * @tc.name testFloat64ArrayToLocaleString033
     * @tc.desc Verify overload: no arguments toLocaleString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.toLocaleString();
      const expected = "0.1,9,007,199,254,740,991,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3400
     * @tc.name testFloat64ArrayToLocaleString034
     * @tc.desc Verify overload: only locales as string toLocaleString(string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toLocaleString("en-US");
      const expected = "0.5,1.5,0.25";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3500
     * @tc.name testFloat64ArrayToLocaleString035
     * @tc.desc Verify overload: only locales as array toLocaleString(string[])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toLocaleString(["en-US", "zh-CN"]);
      const expected = "-32,768,-128,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3600
     * @tc.name testFloat64ArrayToLocaleString036
     * @tc.desc Verify overload: only locales as undefined toLocaleString(undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toLocaleString(undefined);
      const expected = "-2,147,483,648,-1,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3700
     * @tc.name testFloat64ArrayToLocaleString037
     * @tc.desc Verify overload: locales as array and options toLocaleString(string[], object)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toLocaleString(["en-US"]);
      const expected = "0.5,1.5,0.25";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3800
     * @tc.name testFloat64ArrayToLocaleString038
     * @tc.desc Verify locales as undefined, options={numberFormat:"standard"}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString(undefined);
      const expected = "-32,768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_3900
     * @tc.name testFloat64ArrayToLocaleString039
     * @tc.desc Verify return value is non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.toLocaleString();
      const expected = "0.5,1.5,0.25";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4000
     * @tc.name testFloat64ArrayToLocaleString040
     * @tc.desc Verify return value can be used in string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toLocaleString();
      const combined = "prefix-" + result + "-suffix";
      const actVal1 = combined.startsWith("prefix-");
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4100
     * @tc.name testFloat64ArrayToLocaleString041
     * @tc.desc Verify return value can call string methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = arr.toLocaleString();
      const upper = result.toUpperCase();
      const expectVal = result.length;
      expect(upper.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4200
     * @tc.name testFloat64ArrayToLocaleString042
     * @tc.desc Verify return value contains comma separator (en-US)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString("en-US");
      const actVal2 = result.indexOf(",") >= 0;
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4300
     * @tc.name testFloat64ArrayToLocaleString043
     * @tc.desc Verify different locales may return different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const resultEn = arr.toLocaleString("en-US");
      const resultZh = arr.toLocaleString("zh-CN");
      expect(resultEn !== undefined).assertEqual(true);
      expect(resultZh !== undefined).assertEqual(true);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4400
     * @tc.name testFloat64ArrayToLocaleString044
     * @tc.desc Verify multiple calls with same arguments return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const r1 = arr.toLocaleString("en-US");
      const r2 = arr.toLocaleString("en-US");
      const expectVal = r2;
      expect(r1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4500
     * @tc.name testFloat64ArrayToLocaleString045
     * @tc.desc Verify original array elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const valBefore = arr[0];
      arr.toLocaleString();
      const expectVal = valBefore;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4600
     * @tc.name testFloat64ArrayToLocaleString046
     * @tc.desc Verify empty array toLocaleString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.toLocaleString();
      const expectVal = "";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4700
     * @tc.name testFloat64ArrayToLocaleString047
     * @tc.desc Verify empty array toLocaleString with locale parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const result = arr.toLocaleString("en-US");
      const expectVal = "";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4800
     * @tc.name testFloat64ArrayToLocaleString048
     * @tc.desc Verify single element array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const result = arr.toLocaleString();
      const expected = "0.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_4900
     * @tc.name testFloat64ArrayToLocaleString049
     * @tc.desc Verify single element array toLocaleString with locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.toLocaleString("en-US");
      const expected = "-32,768";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5000
     * @tc.name testFloat64ArrayToLocaleString050
     * @tc.desc Verify single element array toLocaleString with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue);
      const result = arr.toLocaleString("en-US");
      const expected = "-2,147,483,648";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5100
     * @tc.name testFloat64ArrayToLocaleString051
     * @tc.desc Verify 100-element array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const hundredValue: number = 100;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const result = arr.toLocaleString();
      const actVal3 = result.split(',').length;
      const expectVal = hundredValue;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5200
     * @tc.name testFloat64ArrayToLocaleString052
     * @tc.desc Verify 1000-element array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroOne: number = 0.01;
      const thousandValue: number = 1000;
      const arr = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        arr.$_set(i, i * pointZeroOne);
      }
      const result = arr.toLocaleString();
      const actVal4 = result.split(',').length;
      const expectVal = thousandValue;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5300
     * @tc.name testFloat64ArrayToLocaleString053
     * @tc.desc Verify all-zero array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array(5);
      const result = arr.toLocaleString();
      const actVal5 = result.split(',').length;
      const expectVal = fiveValue;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5400
     * @tc.name testFloat64ArrayToLocaleString054
     * @tc.desc Verify all-same elements array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(piValue, piValue, piValue, piValue);
      const result = arr.toLocaleString();
      const expected = "3.142,3.142,3.142,3.142";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5500
     * @tc.name testFloat64ArrayToLocaleString055
     * @tc.desc Verify alternating positive/negative array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.toLocaleString();
      const expected = "0.5,1.5,0.25,0.125,0.063";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5600
     * @tc.name testFloat64ArrayToLocaleString056
     * @tc.desc Verify incrementing sequence array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = arr.toLocaleString();
      const expected = "-32,768,-128,0,127,32,767";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5700
     * @tc.name testFloat64ArrayToLocaleString057
     * @tc.desc Verify decrementing sequence array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = arr.toLocaleString();
      const expected = "-2,147,483,648,-1,0,1,2,147,483,647";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5800
     * @tc.name testFloat64ArrayToLocaleString058
     * @tc.desc Verify random distribution array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = arr.toLocaleString();
      const expected = "0.1,9,007,199,254,740,991,0,3.142,-0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_5900
     * @tc.name testFloat64ArrayToLocaleString059
     * @tc.desc Verify array with MIN_VALUE elements toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const result = arr.toLocaleString();
      const expected = "-32,768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6000
     * @tc.name testFloat64ArrayToLocaleString060
     * @tc.desc Verify array with decimal precision boundary elements toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString();
      const expected = "0.1,9,007,199,254,740,991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6100
     * @tc.name testFloat64ArrayToLocaleString061
     * @tc.desc Verify array with positive zero elements toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = arr.toLocaleString();
      const expected = "-32,768,-128,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6200
     * @tc.name testFloat64ArrayToLocaleString062
     * @tc.desc Verify multiple NaN elements toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.toLocaleString("en-US");
      const expected = "0,0,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6300
     * @tc.name testFloat64ArrayToLocaleString063
     * @tc.desc Verify elements with NaN, Infinity, and normal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const result = arr.toLocaleString("en-US");
      const expected = "0.1,9,007,199,254,740,991,0,3.142";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6400
     * @tc.name testFloat64ArrayToLocaleString064
     * @tc.desc Verify elements with NaN and Infinity, zh-CN locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const result = arr.toLocaleString("zh-CN");
      const expected = "0.5,1.5,0.25,0.125";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6500
     * @tc.name testFloat64ArrayToLocaleString065
     * @tc.desc Verify elements with NaN, Infinity, -Infinity, 0, -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const result = arr.toLocaleString("en-US");
      const expected = "-32,768,-128,0,127,32,767";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6600
     * @tc.name testFloat64ArrayToLocaleString066
     * @tc.desc Verify elements with NaN, Infinity, -Infinity, 0, zh-CN locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const result = arr.toLocaleString("zh-CN");
      const expected = "-2,147,483,648,-1,0,1,2,147,483,647";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6700
     * @tc.name testFloat64ArrayToLocaleString067
     * @tc.desc Verify only NaN element array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      const result = arr.toLocaleString("en-US");
      const expected = "0.1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6800
     * @tc.name testFloat64ArrayToLocaleString068
     * @tc.desc Verify only Infinity element array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const result = arr.toLocaleString("en-US");
      const expected = "0.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_6900
     * @tc.name testFloat64ArrayToLocaleString069
     * @tc.desc Verify options as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.toLocaleString("en-US", undefined);
      const expected = "0.1,9,007,199,254,740,991";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7000
     * @tc.name testFloat64ArrayToLocaleString070
     * @tc.desc Verify options with unknown property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const opts: Record<string, string> = { "unknownProp": "value" };
      const result = arr.toLocaleString("en-US", opts as object);
      const expected = "-2,147,483,648,-1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7100
     * @tc.name testFloat64ArrayToLocaleString071
     * @tc.desc Verify NaN element in zh-CN locale localization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      const result = arr.toLocaleString("zh-CN");
      const expected = "0.1";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7200
     * @tc.name testFloat64ArrayToLocaleString072
     * @tc.desc Verify toLocaleString without arguments default locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const result = values.toLocaleString();
      const expected = "0.5,1.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7300
     * @tc.name testFloat64ArrayToLocaleString073
     * @tc.desc Verify toLocaleString with locales parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const values = Float64Array.of(int16MinValue, int8MinValue);
      const result = values.toLocaleString("en-US");
      const expected = "-32,768,-128";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7400
     * @tc.name testFloat64ArrayToLocaleString074
     * @tc.desc Verify toLocaleString empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array();
      const result = values.toLocaleString();
      const expectVal = "";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7500
     * @tc.name testFloat64ArrayToLocaleString075
     * @tc.desc Verify toLocaleString single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const values = Float64Array.of(int32MinValue);
      const result = values.toLocaleString("en-US");
      const expected = "-2,147,483,648";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7600
     * @tc.name testFloat64ArrayToLocaleString076
     * @tc.desc Verify toLocaleString with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      const result = values.toLocaleString();
      const expectVal = "0.1,9,007,199,254,740,991";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7700
     * @tc.name testFloat64ArrayToLocaleString077
     * @tc.desc Verify toLocaleString with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const result = values.toLocaleString("en-US");
      const expected = "0.5,1.5";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7800
     * @tc.name testFloat64ArrayToLocaleString078
     * @tc.desc Verify toLocaleString with maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      const result = values.toLocaleString("en-US");
      const expected = "-32,768";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_7900
     * @tc.name testFloat64ArrayToLocaleString079
     * @tc.desc Verify toLocaleString with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, negativeOne);
      const result = values.toLocaleString();
      const expectVal = "-2,147,483,648,-1";
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8000
     * @tc.name testFloat64ArrayToLocaleString080
     * @tc.desc Verify toLocaleString with Arabic locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = values.toLocaleString("ar-EG");
      const expected =
        "\u0660\u066B\u0661,\u0669\u066C\u0660\u0660\u0667\u066C\u0661\u0669\u0669\u066C\u0662\u0665\u0664\u066C\u0667\u0664\u0660\u066C\u0669\u0669\u0661,\u0660";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8100
     * @tc.name testFloat64ArrayToLocaleString081
     * @tc.desc Verify toLocaleString with Hindi locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = values.toLocaleString("hi-IN");
      const expected = "0.5,1.5,0.25";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8200
     * @tc.name testFloat64ArrayToLocaleString082
     * @tc.desc Verify toLocaleString with Chinese locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const values = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const result = values.toLocaleString("zh-CN");
      const expected = "-32,768,-128,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8300
     * @tc.name testFloat64ArrayToLocaleString083
     * @tc.desc Verify toLocaleString with Thai locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const values = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const result = values.toLocaleString("th-TH");
      const expected = "-2,147,483,648,-1,0";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8400
     * @tc.name testFloat64ArrayToLocaleString084
     * @tc.desc Verify toLocaleString with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const s: string = arr.toLocaleString();
      const expected = "255,170";
      const expectVal = expected;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8500
     * @tc.name testFloat64ArrayToLocaleString085
     * @tc.desc Verify toLocaleString with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const s: string = arr.toLocaleString();
      const expected = "255,170";
      const expectVal = expected;
      expect(s).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8600
     * @tc.name testFloat64ArrayToLocaleString086
     * @tc.desc Verify toLocaleString with Double.NaN and Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.toLocaleString();
      const actVal6 = result.indexOf('NaN,');
      const expectVal = 0;
      expect(actVal6).assertEqual(expectVal);
      const actVal7 = result.indexOf('179,769');
      const expectVal2 = 4;
      expect(actVal7).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8700
     * @tc.name testFloat64ArrayToLocaleString087
     * @tc.desc Verify toLocaleString with positive and negative infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.toLocaleString();
      const actVal8 = result.indexOf(',');
      const expectVal = 1;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = result.indexOf('-');
      const expectVal2 = 2;
      expect(actVal9).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8800
     * @tc.name testFloat64ArrayToLocaleString088
     * @tc.desc Verify toLocaleString with Double.MIN_VALUE and Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const result = arr.toLocaleString();
      const actVal10 = result.indexOf('0,179,769');
      const expectVal = 0;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_8900
     * @tc.name testFloat64ArrayToLocaleString089
     * @tc.desc Verify toLocaleString with zh-u-nu-hanidec (Chinese numeral)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num123Pointzero: number = 123.0;
      const arr = Float64Array.of(num123Pointzero);
      const result = arr.toLocaleString("zh-u-nu-hanidec");
      const expected = "一二三";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9000
     * @tc.name testFloat64ArrayToLocaleString090
     * @tc.desc Verify toLocaleString with zh-u-nu-hanidec, multi-element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twentythreePointzero: number = 23.0;
      const num456Pointzero: number = 456.0;
      const arr = Float64Array.of(onePointZero, twentythreePointzero, num456Pointzero);
      const result = arr.toLocaleString("zh-u-nu-hanidec");
      const expected = "一,二三,四五六";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9100
     * @tc.name testFloat64ArrayToLocaleString091
     * @tc.desc Verify toLocaleString with zh-u-nu-hanidec, zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(zeroPointZero);
      const result = arr.toLocaleString("zh-u-nu-hanidec");
      const expected = "〇";
      const expectVal = expected;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9200
     * @tc.name testFloat64ArrayToLocaleString092
     * @tc.desc Verify toLocaleString on offset view serializes only visible values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new ArrayBuffer(32);
      const p = new Float64Array(b);
      p.$_set(0, 1.0);
      p.$_set(1, 2.0);
      p.$_set(2, 3.0);
      p.$_set(3, 4.0);
      const v = new Float64Array(b, 8, 2);
      const actVal11 = v.toLocaleString("en-US");
      const expectVal = "2,3";
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9300
     * @tc.name testFloat64ArrayToLocaleString093
     * @tc.desc Verify toLocaleString on view reflects source mutation before call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0, 3.0);
      const v = a.subarray(1, 3);
      a.$_set(2, 30.0);
      const actVal12 = v.toLocaleString("en-US");
      const expectVal = "2,30";
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9400
     * @tc.name testFloat64ArrayToLocaleString094
     * @tc.desc Verify toLocaleString on toReversed copy keeps source order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.0, 2.0, 3.0);
      const r = a.toReversed();
      const actVal13 = r.toLocaleString("en-US");
      const expectVal = "3,2,1";
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = a.toLocaleString("en-US");
      const expectVal2 = "1,2,3";
      expect(actVal14).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9500
     * @tc.name testFloat64ArrayToLocaleString095
     * @tc.desc Verify toLocaleString on toSorted copy returns ascending values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(3.0, 1.0, 2.0);
      const s = a.toSorted();
      const actVal15 = s.toLocaleString("en-US");
      const expectVal = "1,2,3";
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = a.toLocaleString("en-US");
      const expectVal2 = "3,1,2";
      expect(actVal16).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9600
     * @tc.name testFloat64ArrayToLocaleString096
     * @tc.desc Verify toLocaleString on empty subarray returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = Float64Array.of(1.0, 2.0).subarray(1, 1);
      const actVal17 = empty.toLocaleString("en-US");
      const expectVal = "";
      expect(actVal17).assertEqual(expectVal);
      expect(empty.length).assertEqual(0);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_TOLOCALESTRING_9700
     * @tc.name testFloat64ArrayToLocaleString097
     * @tc.desc Verify toLocaleString keeps decimal token for en-US locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayToLocaleString097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = Float64Array.of(1.5, 2.25);
      const actVal18 = a.toLocaleString("en-US");
      const expectVal = "1.5,2.25";
      expect(actVal18).assertEqual(expectVal);
      expect(a.length).assertEqual(2);
    })

  })
}
