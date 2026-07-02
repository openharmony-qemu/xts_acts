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
import Utils from '../Util.test';

class LocaleStringItemOne {
  value: string = '';

  toLocaleString(): string {
    return 'local-' + this.value;
  }

  toString(): string {
    return 'local-' + this.value;
  }
}

function createLocaleStringItemOne(value: string): LocaleStringItemOne {
  const item = new LocaleStringItemOne();
  item.value = value;
  return item;
}

function toLocaleStringWithOptionsOne<T>(
  arr: Array<T>,
  locales: Intl.LocalesArgument,
  options: Intl.NumberFormatOptions
): string {
  return arr.toLocaleString(locales, options);
}

function normalizeFrenchGroupingSpacesOne(text: string): string {
  let normalized = text.split(String.fromCharCode(0x202F)).join(' ');
  normalized = normalized.split(String.fromCharCode(0x00A0)).join(' ');
  return normalized;
}

export default function ArrayToLocaleString1Test(): void {
  describe('ArrayToLocaleString1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0100
     * @tc.name testArrayToLocaleStringOne001
     * @tc.desc Verify toLocaleString with both required parameters can be invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'decimal', useGrouping: false };
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0200
     * @tc.name testArrayToLocaleStringOne002
     * @tc.desc Verify locales parameter uses Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales: Intl.LocalesArgument = new Intl.Locale('zh-CN');
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0300
     * @tc.name testArrayToLocaleStringOne003
     * @tc.desc Verify options parameter uses Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales: Intl.LocalesArgument = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('$1,000.00,$2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0400
     * @tc.name testArrayToLocaleStringOne004
     * @tc.desc Verify locales must be passed as an object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const locales: Intl.LocalesArgument = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0500
     * @tc.name testArrayToLocaleStringOne005
     * @tc.desc Verify locales object can include the lang property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Intl.Locale('fr-FR');
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(locales, options);
      expect(normalizeFrenchGroupingSpacesOne(output)).assertEqual('1 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0600
     * @tc.name testArrayToLocaleStringOne006
     * @tc.desc Verify options must be passed as an object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales: Intl.LocalesArgument = new Array<string>();
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0700
     * @tc.name testArrayToLocaleStringOne007
     * @tc.desc Verify the overload returns a string value or throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0800
     * @tc.name testArrayToLocaleStringOne008
     * @tc.desc Verify decimal formatting with en-US locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_0900
     * @tc.name testArrayToLocaleStringOne009
     * @tc.desc Verify toLocaleString handles an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1000
     * @tc.name testArrayToLocaleStringOne010
     * @tc.desc Verify toLocaleString handles a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1,000');
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1100
     * @tc.name testArrayToLocaleStringOne011
     * @tc.desc Verify toLocaleString handles a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Array<string>(), options);
      let expected = '0';
      for (let i: int = 1; i < 1000; i++) {
        expected += ',' + i.toString();
      }
      expect(output).assertEqual(expected);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1200
     * @tc.name testArrayToLocaleStringOne012
     * @tc.desc Verify en-US locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1300
     * @tc.name testArrayToLocaleStringOne013
     * @tc.desc Verify zh-CN locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Intl.Locale('zh-CN'), options);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1400
     * @tc.name testArrayToLocaleStringOne014
     * @tc.desc Verify fr-FR locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Intl.Locale('fr-FR'), options);
      expect(normalizeFrenchGroupingSpacesOne(output)).assertEqual('1 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1500
     * @tc.name testArrayToLocaleStringOne015
     * @tc.desc Verify an empty locales object can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales: Intl.LocalesArgument = new Array<string>();
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1600
     * @tc.name testArrayToLocaleStringOne016
     * @tc.desc Verify decimal style option can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000.5, 2000.5);
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('1,000.5,2,000.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1700
     * @tc.name testArrayToLocaleStringOne017
     * @tc.desc Verify useGrouping option can be configured
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000000);
      const options1: Intl.NumberFormatOptions = { useGrouping: true };
      const options2: Intl.NumberFormatOptions = { useGrouping: false };
      const output1 = arr.toLocaleString(new Intl.Locale('en-US'), options1);
      const output2 = arr.toLocaleString(new Intl.Locale('en-US'), options2);
      expect(output1).assertEqual('1,000,000');
      expect(output2).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1800
     * @tc.name testArrayToLocaleStringOne018
     * @tc.desc Verify an empty options object can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_1900
     * @tc.name testArrayToLocaleStringOne019
     * @tc.desc Verify multiple formatting options can be combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000.123);
      const options: Intl.NumberFormatOptions = {
        style: 'decimal',
        useGrouping: true,
        minimumFractionDigits: 2
      };
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('1,000.123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2000
     * @tc.name testArrayToLocaleStringOne020
     * @tc.desc Verify decimal formatting can be applied repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      let output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2100
     * @tc.name testArrayToLocaleStringOne021
     * @tc.desc Verify toLocaleString can disable grouping for multiple numeric elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const options: Intl.NumberFormatOptions = { useGrouping: false };
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2200
     * @tc.name testArrayToLocaleStringOne022
     * @tc.desc Verify toLocaleString can round numeric output with maximumFractionDigits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1234.56);
      const options: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1,235');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2300
     * @tc.name testArrayToLocaleStringOne023
     * @tc.desc Verify the overload can be compared with one-arg and no-arg forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const options: Intl.NumberFormatOptions = {};
      const output1 = arr.toLocaleString(new Array<string>(), options);
      const output2 = arr.toLocaleString(new Array<string>());
      const output3 = arr.toLocaleString();
      expect(output1).assertEqual('1,000,2,000');
      expect(output2).assertEqual('1,000,2,000');
      expect(output3).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2400
     * @tc.name testArrayToLocaleStringOne024
     * @tc.desc Verify overloads differ by parameter count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const options: Intl.NumberFormatOptions = {};
      const output2 = arr.toLocaleString(new Array<string>(), options);
      const output1 = arr.toLocaleString(new Array<string>());
      const output0 = arr.toLocaleString();
      expect(output2).assertEqual('1,000');
      expect(output1).assertEqual('1,000');
      expect(output0).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2500
     * @tc.name testArrayToLocaleStringOne025
     * @tc.desc Verify floating-point values can be passed to the overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000.567, 2000.89);
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1,000.567,2,000.89');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2600
     * @tc.name testArrayToLocaleStringOne026
     * @tc.desc Verify negative numbers can be passed to the overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1000, -2000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('-1,000,-2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2700
     * @tc.name testArrayToLocaleStringOne027
     * @tc.desc Verify zero values can be passed to the overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('0,1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2800
     * @tc.name testArrayToLocaleStringOne028
     * @tc.desc Verify toLocaleString does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('1,000,2,000');
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_2900
     * @tc.name testArrayToLocaleStringOne029
     * @tc.desc Verify parameter types can be supplied as Object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales: Intl.LocalesArgument = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3000
     * @tc.name testArrayToLocaleStringOne030
     * @tc.desc Verify currency formatting options can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const output = arr.toLocaleString(locales, options);
      expect(output).assertEqual('$1,000.00,$2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3100
     * @tc.name testArrayToLocaleStringOne031
     * @tc.desc Verify percent formatting options can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0.25, 0.5, 0.75);
      const options: Intl.NumberFormatOptions = { style: 'percent' };
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(output).assertEqual('25%,50%,75%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3200
     * @tc.name testArrayToLocaleStringOne032
     * @tc.desc Verify multiple locale inputs can be iterated for the overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000000);
      const localesList = new Array<Intl.Locale>(
        new Intl.Locale('en-US'),
        new Intl.Locale('zh-CN'),
        new Intl.Locale('de-DE')
      );
      const options: Intl.NumberFormatOptions = { useGrouping: true };
      expect(arr.toLocaleString(localesList[0], options)).assertEqual('1,000,000');
      expect(arr.toLocaleString(localesList[1], options)).assertEqual('1,000,000');
      expect(arr.toLocaleString(localesList[2], options)).assertEqual('1.000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3300
     * @tc.name testArrayToLocaleStringOne033
     * @tc.desc Verify toLocaleString can be compared with toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const plain = arr.toString();
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Array<string>(), options);
      expect(plain).assertEqual('1000,2000');
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3400
     * @tc.name testArrayToLocaleStringOne034
     * @tc.desc Verify localized output uses element separators when it succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const options: Intl.NumberFormatOptions = {};
      const output = arr.toLocaleString(new Intl.Locale('en-US'), options);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3500
     * @tc.name testArrayToLocaleStringOne035
     * @tc.desc Verify fr-FR decimal options use localized grouping and decimal separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234.5, 6789.25);
      const locales = new Intl.Locale('fr-FR');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      const result = arr.toLocaleString(locales, options);
      expect(normalizeFrenchGroupingSpacesOne(result)).assertEqual('1 234,50,6 789,25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3600
     * @tc.name testArrayToLocaleStringOne036
     * @tc.desc Verify de-DE percent options localize decimal separators for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0.125, 1.5);
      const locales = new Intl.Locale('de-DE');
      const options: Intl.NumberFormatOptions = { style: 'percent', maximumFractionDigits: 1 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('12,5' + String.fromCharCode(0xA0) + '%,150' + String.fromCharCode(0xA0) + '%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3700
     * @tc.name testArrayToLocaleStringOne037
     * @tc.desc Verify ja-JP currency options omit fractional digits for JPY values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1200, 3400);
      const locales = new Intl.Locale('ja-JP');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'JPY' };
      const result = arr.toLocaleString(locales, options);
      expect(result.indexOf('1,200') >= 0).assertTrue();
      expect(result.indexOf('3,400') >= 0).assertTrue();
      expect(result.indexOf('.00')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3800
     * @tc.name testArrayToLocaleStringOne038
     * @tc.desc Verify USD currency options are applied to every numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234, -56.7);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,234.00,-$56.70');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_3900
     * @tc.name testArrayToLocaleStringOne039
     * @tc.desc Verify maximumFractionDigits rounds each element before joining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234.56, 78.91);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1,235,79');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4000
     * @tc.name testArrayToLocaleStringOne040
     * @tc.desc Verify minimumFractionDigits pads integer and fractional elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8.5);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2, useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('7.00,8.50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4100
     * @tc.name testArrayToLocaleStringOne041
     * @tc.desc Verify explicit null becomes an empty field with numeric options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1000, null, 2000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,000.00,,$2,000.00');
      expect(arr.lastIndexOf(null)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4200
     * @tc.name testArrayToLocaleStringOne042
     * @tc.desc Verify explicit undefined values remain empty fields with numeric options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1000;
      arr[2] = 2000;
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 1 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1,000.0,,2,000.0');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4300
     * @tc.name testArrayToLocaleStringOne043
     * @tc.desc Verify an all-undefined dense array contributes separators while preserving values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual(',,,');
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4400
     * @tc.name testArrayToLocaleStringOne044
     * @tc.desc Verify object element toLocaleString is used instead of toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<LocaleStringItemOne>(
        createLocaleStringItemOne('alpha'),
        createLocaleStringItemOne('beta')
      );
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('local-alpha,local-beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4500
     * @tc.name testArrayToLocaleStringOne045
     * @tc.desc Verify string elements ignore numeric options while number elements use them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1000, '2000');
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,000.00,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4600
     * @tc.name testArrayToLocaleStringOne046
     * @tc.desc Verify boolean elements keep their own locale strings beside formatted numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | boolean>(1000, true, false);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1,000.00,true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4700
     * @tc.name testArrayToLocaleStringOne047
     * @tc.desc Verify a mixed array can include object, empty field, and formatted number output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<LocaleStringItemOne | number | undefined>(
        createLocaleStringItemOne('head'),
        undefined,
        3000
      );
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('local-head,,$3,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4800
     * @tc.name testArrayToLocaleStringOne048
     * @tc.desc Verify filtered numeric values keep locale and option formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(500, 1500, 2500).filter((value: number): boolean => value >= 1500);
      const locales = new Intl.Locale('de-DE');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 1 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1.500,0,2.500,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_4900
     * @tc.name testArrayToLocaleStringOne049
     * @tc.desc Verify mapped floating-point values are rounded by options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.234, 5.678).map((value: number): number => value * 10);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { maximumFractionDigits: 1, useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('12.3,56.8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5000
     * @tc.name testArrayToLocaleStringOne050
     * @tc.desc Verify sliced arrays preserve explicit undefined empty fields with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | undefined>(4, (_index) => undefined);
      source[0] = 1000;
      source[3] = 4000;
      const arr = source.slice(1, 4);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual(',,4000');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5100
     * @tc.name testArrayToLocaleStringOne051
     * @tc.desc Verify sorted numeric output still uses the supplied locale options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3000, 1000, 2000).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,000.00,$2,000.00,$3,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5200
     * @tc.name testArrayToLocaleStringOne052
     * @tc.desc Verify reversed numeric output keeps option formatting and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000).toReversed();
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 1 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('3,000.0,2,000.0,1,000.0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5300
     * @tc.name testArrayToLocaleStringOne053
     * @tc.desc Verify generic helper preserves locale and option formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = toLocaleStringWithOptionsOne<number>(arr, new Intl.Locale('en-US'), options);
      expect(result).assertEqual('$1,000.00,$2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5400
     * @tc.name testArrayToLocaleStringOne054
     * @tc.desc Verify locale arrays choose the first supported locale for option formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000.5);
      const locales = new Array<string>('de-DE', 'en-US');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1.000,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5500
     * @tc.name testArrayToLocaleStringOne055
     * @tc.desc Verify NaN and Infinity are still serialized with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Infinity);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result.indexOf('NaN')).assertEqual(0);
      expect(result.indexOf('Infinity') > 0 || result.indexOf(String.fromCharCode(0x221E)) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5600
     * @tc.name testArrayToLocaleStringOne056
     * @tc.desc Verify negative zero retains a minus sign before option-formatted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 1000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('-0,1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5700
     * @tc.name testArrayToLocaleStringOne057
     * @tc.desc Verify large grouped and ungrouped option outputs differ for the same data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000000, 2000000);
      const locales = new Intl.Locale('en-US');
      const groupedOptions: Intl.NumberFormatOptions = { useGrouping: true };
      const ungroupedOptions: Intl.NumberFormatOptions = { useGrouping: false };
      const grouped = arr.toLocaleString(locales, groupedOptions);
      const ungrouped = arr.toLocaleString(locales, ungroupedOptions);
      expect(grouped).assertEqual('1,000,000,2,000,000');
      expect(ungrouped).assertEqual('1000000,2000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5800
     * @tc.name testArrayToLocaleStringOne058
     * @tc.desc Verify toLocaleString with locale and options suppresses grouping for thousands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1200, 3400);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1200,3400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_5900
     * @tc.name testArrayToLocaleStringOne059
     * @tc.desc Verify toLocaleString with locale and options preserves minus signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 4);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { useGrouping: false };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('-3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6000
     * @tc.name testArrayToLocaleStringOne060
     * @tc.desc Verify localized formatting differs from plain toString for grouped decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234.5, 6789.25);
      const locales = new Intl.Locale('fr-FR');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      const result = arr.toLocaleString(locales, options);
      expect(arr.toString()).assertEqual('1234.5,6789.25');
      expect(normalizeFrenchGroupingSpacesOne(result)).assertEqual('1 234,50,6 789,25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6100
     * @tc.name testArrayToLocaleStringOne061
     * @tc.desc Verify an empty array remains empty with locale and options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const locales = new Intl.Locale('de-DE');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'EUR' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6200
     * @tc.name testArrayToLocaleStringOne062
     * @tc.desc Verify single object elements use toLocaleString with options present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<LocaleStringItemOne>(1, createLocaleStringItemOne('single'));
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('local-single');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6300
     * @tc.name testArrayToLocaleStringOne063
     * @tc.desc Verify slice keeps numeric subset before option formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(500, 1500, 2500, 3500).slice(1, 3);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      expect(arr.toLocaleString(locales, options)).assertEqual('$1,500.00,$2,500.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6400
     * @tc.name testArrayToLocaleStringOne064
     * @tc.desc Verify mapped numeric values use the supplied currency options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).map((value: number): number => value * 1000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      expect(arr.toLocaleString(locales, options)).assertEqual('$1,000.00,$2,000.00,$3,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6500
     * @tc.name testArrayToLocaleStringOne065
     * @tc.desc Verify filtering null and undefined before formatting leaves numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | null | undefined>(1000, null, 2000, undefined);
      const arr = source.filter((value: number | null | undefined): boolean => {
        return value !== null && value !== undefined;
      });
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { minimumFractionDigits: 1 };
      expect(arr.toLocaleString(locales, options)).assertEqual('1,000.0,2,000.0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6600
     * @tc.name testArrayToLocaleStringOne066
     * @tc.desc Verify toReversed keeps option-formatted element order observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000).toReversed();
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      expect(arr.toLocaleString(locales, options)).assertEqual('$3,000.00,$2,000.00,$1,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6700
     * @tc.name testArrayToLocaleStringOne067
     * @tc.desc Verify toSorted keeps option-formatted numeric order observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3000, 1000, 2000).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      expect(arr.toLocaleString(locales, options)).assertEqual('$1,000.00,$2,000.00,$3,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6800
     * @tc.name testArrayToLocaleStringOne068
     * @tc.desc Verify dense arrays with undefined values keep empty fields with option formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      arr[1] = 1000;
      arr[3] = 3000;
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      expect(arr.toLocaleString(locales, options)).assertEqual(',$1,000.00,,$3,000.00,');
      expect(arr.lastIndexOf(undefined)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_6900
     * @tc.name testArrayToLocaleStringOne069
     * @tc.desc Verify explicit undefined remains searchable after option formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      expect(arr.toLocaleString(locales, options)).assertEqual(',$1,000.00');
      expect(arr.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7000
     * @tc.name testArrayToLocaleStringOne070
     * @tc.desc Verify JPY currency options are propagated without decimal fraction digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('ja-JP');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'JPY' };
      const result = arr.toLocaleString(locales, options);
      expect(result.indexOf('1,000') >= 0).assertTrue();
      expect(result.indexOf('2,000') >= 0).assertTrue();
      expect(result.indexOf('.00')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7100
     * @tc.name testArrayToLocaleStringOne071
     * @tc.desc Verify string elements ignore numeric currency options while numbers format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1000, 'abc');
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,000.00,abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7200
     * @tc.name testArrayToLocaleStringOne072
     * @tc.desc Verify explicit undefined values remain empty strings when currency options are used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1000;
      arr[2] = 2000;
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,000.00,,$2,000.00');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7300
     * @tc.name testArrayToLocaleStringOne073
     * @tc.desc Verify explicit undefined remains an empty field when currency options are used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1000, undefined, 2000);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('$1,000.00,,$2,000.00');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7400
     * @tc.name testArrayToLocaleStringOne074
     * @tc.desc Verify percent options can preserve one fractional digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 0.123);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'percent', maximumFractionDigits: 1 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('12.3%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7500
     * @tc.name testArrayToLocaleStringOne075
     * @tc.desc Verify an all-undefined dense array only contributes separators with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'currency', currency: 'USD' };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual(',');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7600
     * @tc.name testArrayToLocaleStringOne076
     * @tc.desc Verify long decimal fractions can be rounded with maximumFractionDigits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234.56789123, 0.123456789);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'decimal', maximumFractionDigits: 4 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1,234.5679,0.1235');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7700
     * @tc.name testArrayToLocaleStringOne077
     * @tc.desc Verify long decimal fractions can preserve trailing digits with minimumFractionDigits and maximumFractionDigits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.23456789, 9.8);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = {
        style: 'decimal',
        minimumFractionDigits: 6,
        maximumFractionDigits: 6
      };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('1.234568,9.800000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_ONE_7800
     * @tc.name testArrayToLocaleStringOne078
     * @tc.desc Verify long negative decimal fractions keep the minus sign after localized rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1234.987654321, -0.00000049);
      const locales = new Intl.Locale('en-US');
      const options: Intl.NumberFormatOptions = { style: 'decimal', maximumFractionDigits: 6 };
      const result = arr.toLocaleString(locales, options);
      expect(result).assertEqual('-1,234.987654,-0');
    });

  });
}

