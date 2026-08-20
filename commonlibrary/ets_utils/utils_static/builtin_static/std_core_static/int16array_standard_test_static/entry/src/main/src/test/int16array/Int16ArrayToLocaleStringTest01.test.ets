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

interface UnknownNumberFormatOptions {
  roundingMode?: string;
}

export default function Int16ArrayToLocaleStringTest01(): void {
  describe('Int16ArrayToLocaleStringTest01', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0100
     * @tc.name testInt16ArrayToLocaleStringTestOne001
     * @tc.desc Verify Int16Array.toLocaleString with string locale 'en-US'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '1,234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0200
     * @tc.name testInt16ArrayToLocaleStringTestOne002
     * @tc.desc Verify Int16Array.toLocaleString with string array locale ['en-US']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString(['en-US']);
      let expectedResult: string = '1,234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0300
     * @tc.name testInt16ArrayToLocaleStringTestOne003
     * @tc.desc Verify Int16Array.toLocaleString with undefined locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 500;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString(undefined);
      let expectedResult: string = '500';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0400
     * @tc.name testInt16ArrayToLocaleStringTestOne004
     * @tc.desc Verify Int16Array.toLocaleString with string locale and currency options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(1000);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0500
     * @tc.name testInt16ArrayToLocaleStringTestOne005
     * @tc.desc Verify Int16Array.toLocaleString with string array locales and currency options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2500;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'EUR',
      };
      let result: string = arr.toLocaleString(['de-DE', 'en-US'], opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat(['de-DE', 'en-US'], opts);
      let expectedResult: string = expectedFormatter.format(2500);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0600
     * @tc.name testInt16ArrayToLocaleStringTestOne006
     * @tc.desc Verify Int16Array.toLocaleString with default locale and percent options groups output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 75;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'percent',
      };
      let result: string = arr.toLocaleString(undefined, opts);
      let expectedResult: string = '7,500%';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0700
     * @tc.name testInt16ArrayToLocaleStringTestOne007
     * @tc.desc Verify Int16Array.toLocaleString with locale 'en-US' and undefined options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2000;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US', undefined);
      let expectedResult: string = '2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0800
     * @tc.name testInt16ArrayToLocaleStringTestOne008
     * @tc.desc Verify Int16Array.toLocaleString with locale 'de-DE' groups with dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('de-DE');
      let expectedResult: string = '1.234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_0900
     * @tc.name testInt16ArrayToLocaleStringTestOne009
     * @tc.desc Verify Int16Array.toLocaleString with locale 'ja-JP' groups with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5000;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('ja-JP');
      let expectedResult: string = '5,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1000
     * @tc.name testInt16ArrayToLocaleStringTestOne010
     * @tc.desc Verify Int16Array.toLocaleString with locale 'ar-SA' uses arabic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('ar-SA');
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('ar-SA');
      let expectedResult: string = expectedFormatter.format(1234);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1100
     * @tc.name testInt16ArrayToLocaleStringTestOne011
     * @tc.desc Verify Int16Array.toLocaleString with locale 'en-GB' groups with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-GB');
      let expectedResult: string = '1,234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1200
     * @tc.name testInt16ArrayToLocaleStringTestOne012
     * @tc.desc Verify Int16Array.toLocaleString with locale 'fr-FR' uses non-breaking space group separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('fr-FR');
      let expectedResult: string = '1\u202F234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1300
     * @tc.name testInt16ArrayToLocaleStringTestOne013
     * @tc.desc Verify Int16Array.toLocaleString with locale 'ko-KR' groups with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 8888;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('ko-KR');
      let expectedResult: string = '8,888';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1400
     * @tc.name testInt16ArrayToLocaleStringTestOne014
     * @tc.desc Verify Int16Array.toLocaleString with locale 'es-ES' preserves four-digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('es-ES');
      let expectedResult: string = '1234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1500
     * @tc.name testInt16ArrayToLocaleStringTestOne015
     * @tc.desc Verify Int16Array.toLocaleString with locale 'pt-BR' groups with dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 9999;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('pt-BR');
      let expectedResult: string = '9.999';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1600
     * @tc.name testInt16ArrayToLocaleStringTestOne016
     * @tc.desc Verify Int16Array.toLocaleString with locale 'ru-RU' uses non-breaking space group separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5678;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('ru-RU');
      let expectedResult: string = '5 678';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1700
     * @tc.name testInt16ArrayToLocaleStringTestOne017
     * @tc.desc Verify Int16Array.toLocaleString with locale 'th-TH' groups with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('th-TH');
      let expectedResult: string = '1,234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1800
     * @tc.name testInt16ArrayToLocaleStringTestOne018
     * @tc.desc Verify Int16Array.toLocaleString with locale 'zh-Hans-CN' groups with comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 7777;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('zh-Hans-CN');
      let expectedResult: string = '7,777';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_1900
     * @tc.name testInt16ArrayToLocaleStringTestOne019
     * @tc.desc Verify Int16Array.toLocaleString with locale 'pt-PT' preserves four-digit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 6543;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('pt-PT');
      let expectedResult: string = '6543';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2000
     * @tc.name testInt16ArrayToLocaleStringTestOne020
     * @tc.desc Verify Int16Array.toLocaleString with case-insensitive locale 'EN-us'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 2222;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('EN-us');
      let expectedResult: string = '2,222';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2100
     * @tc.name testInt16ArrayToLocaleStringTestOne021
     * @tc.desc Verify Int16Array.toLocaleString with locale 'vi-VN' groups with dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 3333;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('vi-VN');
      let expectedResult: string = '3.333';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2200
     * @tc.name testInt16ArrayToLocaleStringTestOne022
     * @tc.desc Verify Int16Array.toLocaleString accepts Intl.Locale object as locales argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let locale: Intl.Locale = new Intl.Locale('en-US');
      let result: string = arr.toLocaleString(locale);
      let expectedResult: string = '1,234';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2300
     * @tc.name testInt16ArrayToLocaleStringTestOne023
     * @tc.desc Verify Int16Array.toLocaleString accepts Intl.Locale array as locales argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5000;
      let arr: Int16Array = Int16Array.of(val);
      let locales: Intl.Locale[] = [new Intl.Locale('en-US'), new Intl.Locale('zh-CN')];
      let result: string = arr.toLocaleString(locales);
      let expectedResult: string = '5,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2400
     * @tc.name testInt16ArrayToLocaleStringTestOne024
     * @tc.desc Verify Int16Array.toLocaleString with 'en-US-u-nu-thai' extension uses thai digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1234;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US-u-nu-thai');
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US-u-nu-thai');
      let expectedResult: string = expectedFormatter.format(1234);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2500
     * @tc.name testInt16ArrayToLocaleStringTestOne025
     * @tc.desc Verify Int16Array.toLocaleString with 'en-US-u-nu-arab' extension uses arabic digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 567;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US-u-nu-arab');
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US-u-nu-arab');
      let expectedResult: string = expectedFormatter.format(567);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2600
     * @tc.name testInt16ArrayToLocaleStringTestOne026
     * @tc.desc Verify Int16Array.toLocaleString with invalid locale 'xx-XX' falls back to default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 4321;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('xx-XX');
      let expectedResult: string = '4,321';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2700
     * @tc.name testInt16ArrayToLocaleStringTestOne027
     * @tc.desc Verify Int16Array.toLocaleString with single-element locales array ['ja-JP']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 9876;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString(['ja-JP']);
      let expectedResult: string = '9,876';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2800
     * @tc.name testInt16ArrayToLocaleStringTestOne028
     * @tc.desc Verify Int16Array.toLocaleString with invalid empty locale tag throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1500;
      let arr: Int16Array = Int16Array.of(val);
      let emptyTagLocales: string[] = [''];
      try {
        arr.toLocaleString(emptyTagLocales);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_2900
     * @tc.name testInt16ArrayToLocaleStringTestOne029
     * @tc.desc Verify Int16Array.toLocaleString with style decimal option on value 9999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 9999;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'decimal',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '9,999';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3000
     * @tc.name testInt16ArrayToLocaleStringTestOne030
     * @tc.desc Verify Int16Array.toLocaleString with currency CNY under locale 'zh-CN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 8888;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'CNY',
      };
      let result: string = arr.toLocaleString('zh-CN', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN', opts);
      let expectedResult: string = expectedFormatter.format(8888);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3100
     * @tc.name testInt16ArrayToLocaleStringTestOne031
     * @tc.desc Verify Int16Array.toLocaleString with currencyDisplay symbol option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
        currencyDisplay: 'symbol',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(1000);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3200
     * @tc.name testInt16ArrayToLocaleStringTestOne032
     * @tc.desc Verify Int16Array.toLocaleString with currencySign standard option on negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -500;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
        currencySign: 'standard',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(-500);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3300
     * @tc.name testInt16ArrayToLocaleStringTestOne033
     * @tc.desc Verify Int16Array.toLocaleString with currencySign accounting option wraps negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -750;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
        currencySign: 'accounting',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(-750);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3400
     * @tc.name testInt16ArrayToLocaleStringTestOne034
     * @tc.desc Verify Int16Array.toLocaleString with minimumFractionDigits 0 keeps integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 100;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: 0,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '100';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3500
     * @tc.name testInt16ArrayToLocaleStringTestOne035
     * @tc.desc Verify Int16Array.toLocaleString with minimumFractionDigits 20 pads twenty fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: 20,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1.00000000000000000000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3600
     * @tc.name testInt16ArrayToLocaleStringTestOne036
     * @tc.desc Verify Int16Array.toLocaleString with maximumFractionDigits 0 keeps integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 99;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        maximumFractionDigits: 0,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '99';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3700
     * @tc.name testInt16ArrayToLocaleStringTestOne037
     * @tc.desc Verify Int16Array.toLocaleString with scientific notation and maximumSignificantDigits 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 12345;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        notation: 'scientific',
        maximumSignificantDigits: 3,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(12345);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3800
     * @tc.name testInt16ArrayToLocaleStringTestOne038
     * @tc.desc Verify Int16Array.toLocaleString with useGrouping false removes grouping separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 10000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        useGrouping: false,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '10000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_3900
     * @tc.name testInt16ArrayToLocaleStringTestOne039
     * @tc.desc Verify Int16Array.toLocaleString with signDisplay always adds plus sign to positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 200;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        signDisplay: 'always',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '+200';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4000
     * @tc.name testInt16ArrayToLocaleStringTestOne040
     * @tc.desc Verify Int16Array.toLocaleString with signDisplay never hides minus sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -300;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        signDisplay: 'never',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '300';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4100
     * @tc.name testInt16ArrayToLocaleStringTestOne041
     * @tc.desc Verify Int16Array.toLocaleString ignores unknown options field roundingMode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 333;
      let arr: Int16Array = Int16Array.of(val);
      let opts: UnknownNumberFormatOptions = {
        roundingMode: 'ceil',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '333';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4200
     * @tc.name testInt16ArrayToLocaleStringTestOne042
     * @tc.desc Verify Int16Array.toLocaleString on empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: string = arr.toLocaleString();
      let expectedResult: string = '';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4300
     * @tc.name testInt16ArrayToLocaleStringTestOne043
     * @tc.desc Verify Int16Array.toLocaleString on negative elements keeps minus signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, -200, -300);
      let result: string = arr.toLocaleString();
      let expectedResult: string = '-100,-200,-300';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4400
     * @tc.name testInt16ArrayToLocaleStringTestOne044
     * @tc.desc Verify Int16Array.toLocaleString on maximum Int16 value with 'en-US' groups thousands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32767;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '32,767';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4500
     * @tc.name testInt16ArrayToLocaleStringTestOne045
     * @tc.desc Verify Int16Array.toLocaleString on minimum Int16 value with 'en-US' keeps minus sign and grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '-32,768';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4600
     * @tc.name testInt16ArrayToLocaleStringTestOne046
     * @tc.desc Verify Int16Array.toLocaleString on empty array with locale 'en-US' returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4700
     * @tc.name testInt16ArrayToLocaleStringTestOne047
     * @tc.desc Verify Int16Array.toLocaleString on empty array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4800
     * @tc.name testInt16ArrayToLocaleStringTestOne048
     * @tc.desc Verify Int16Array.toLocaleString on empty array keeps byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualByteLength: int = arr.byteLength;
      let expectedByteLength: int = 0;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_4900
     * @tc.name testInt16ArrayToLocaleStringTestOne049
     * @tc.desc Verify Int16Array.toLocaleString on empty array across multiple calls keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let enUsLocaleOutput: string = arr.toLocaleString('en-US');
      let expectedEnUsLocaleOutput: string = '';
      for (let enUsLocaleIndex: int = 0; enUsLocaleIndex < arr.length; enUsLocaleIndex++) {
        if (enUsLocaleIndex > 0) {
          expectedEnUsLocaleOutput += ',';
        }
        expectedEnUsLocaleOutput += arr.$_get(enUsLocaleIndex).toLocaleString('en-US');
      }
      expect(enUsLocaleOutput).assertEqual(expectedEnUsLocaleOutput);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5000
     * @tc.name testInt16ArrayToLocaleStringTestOne050
     * @tc.desc Verify Int16Array.toLocaleString on single element 0 keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualLength: int = arr.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5100
     * @tc.name testInt16ArrayToLocaleStringTestOne051
     * @tc.desc Verify Int16Array.toLocaleString on single element -1000 with 'en-US' keeps minus sign and grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1000;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '-1,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5200
     * @tc.name testInt16ArrayToLocaleStringTestOne052
     * @tc.desc Verify Int16Array.toLocaleString on single element -32768 returns '-32,768'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString();
      let expectedResult: string = '-32,768';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5300
     * @tc.name testInt16ArrayToLocaleStringTestOne053
     * @tc.desc Verify Int16Array.toLocaleString on single element -32768 with 'zh-CN' returns '-32,768'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('zh-CN');
      let expectedResult: string = '-32,768';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5400
     * @tc.name testInt16ArrayToLocaleStringTestOne054
     * @tc.desc Verify Int16Array.toLocaleString on single element 88 keeps length 1 and element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 88;
      let arr: Int16Array = Int16Array.of(val);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualLength: int = arr.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = 88;
      expect(elementAt0).assertEqual(expectedElementAt0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5500
     * @tc.name testInt16ArrayToLocaleStringTestOne055
     * @tc.desc Verify Int16Array.toLocaleString on mixed negative and zero elements returns signed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, 0, 5);
      let result: string = arr.toLocaleString();
      let expectedResult: string = '-5,0,5';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5600
     * @tc.name testInt16ArrayToLocaleStringTestOne056
     * @tc.desc Verify Int16Array.toLocaleString on 1000 with 'en-US' inserts grouping comma at index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '1,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5700
     * @tc.name testInt16ArrayToLocaleStringTestOne057
     * @tc.desc Verify Int16Array.toLocaleString passes options to every element of multiple-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8);
      let opts: Intl.NumberFormatOptions = {
        minimumIntegerDigits: 3,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '007,008';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5800
     * @tc.name testInt16ArrayToLocaleStringTestOne058
     * @tc.desc Verify Int16Array.toLocaleString with minimumFractionDigits 2 formats fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 3;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: 2,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '3.00';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_5900
     * @tc.name testInt16ArrayToLocaleStringTestOne059
     * @tc.desc Verify Int16Array.toLocaleString with maximumFractionDigits 0 keeps integer value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        maximumFractionDigits: 0,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '42';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_6100
     * @tc.name testInt16ArrayToLocaleStringTestOne061
     * @tc.desc Verify Int16Array.toLocaleString with currency CNY option under 'zh-CN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 500;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'CNY',
      };
      let result: string = arr.toLocaleString('zh-CN', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN', opts);
      let expectedResult: string = expectedFormatter.format(500);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_6200
     * @tc.name testInt16ArrayToLocaleStringTestOne062
     * @tc.desc Verify Int16Array.toLocaleString with currency CNY and useGrouping false removes grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 9999;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'CNY',
        useGrouping: false,
      };
      let result: string = arr.toLocaleString('zh-CN', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN', opts);
      let expectedResult: string = expectedFormatter.format(9999);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_6300
     * @tc.name testInt16ArrayToLocaleStringTestOne063
     * @tc.desc Verify Int16Array.toLocaleString with invalid language tag 'xx' falls back to default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let result: string = arr.toLocaleString('xx');
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_6400
     * @tc.name testInt16ArrayToLocaleStringTestOne064
     * @tc.desc Verify Int16Array.toLocaleString with long valid locale tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let result: string = arr.toLocaleString('en-US-u-ca-gregory-u-nu-latn-u-co-emoji');
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_ONE_6500
     * @tc.name testInt16ArrayToLocaleStringTestOne065
     * @tc.desc Verify Int16Array.toLocaleString with large locales array uses first supported tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let largeLocales: string[] = ['en-US', 'zh-CN', 'ja-JP', 'ko-KR', 'fr-FR', 'de-DE', 'es-ES', 'it-IT', 'pt-BR', 'ru-RU',];
      let result: string = arr.toLocaleString(largeLocales);
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

  });
}
