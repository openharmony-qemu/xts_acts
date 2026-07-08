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
import Utils from '../Util.test';

class LocaleStringItemTwo {
  value: string = '';

  toLocaleString(): string {
    return 'local-' + this.value;
  }

  toString(): string {
    return 'local-' + this.value;
  }
}

function createLocaleStringItemTwo(value: string): LocaleStringItemTwo {
  const item = new LocaleStringItemTwo();
  item.value = value;
  return item;
}

function createLocaleWithRegion(lang: string, region: string): Intl.Locale {
  const options: Intl.LocaleOptions = { region: region };
  return new Intl.Locale(lang, options);
}

function createEmptyLocalesOneArg(): Array<string> {
  return new Array<string>();
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function normalizeFrenchGroupingSpacesTwo(text: string): string {
  let normalized = text.split(String.fromCharCode(0x202F)).join(' ');
  normalized = normalized.split(String.fromCharCode(0x00A0)).join(' ');
  return normalized;
}

export default function ArrayToLocaleString2Test(): void {
  describe('ArrayToLocaleString2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0100
     * @tc.name testArrayToLocaleStringTwo001
     * @tc.desc Verify toLocaleString can be invoked with one locales parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0200
     * @tc.name testArrayToLocaleStringTwo002
     * @tc.desc Verify locales is required for the one-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      const noArgOutput = arr.toLocaleString();
      expect(output).assertEqual('1,000');
      expect(noArgOutput).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0300
     * @tc.name testArrayToLocaleStringTwo003
     * @tc.desc Verify locales parameter uses Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales: Intl.LocalesArgument = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0400
     * @tc.name testArrayToLocaleStringTwo004
     * @tc.desc Verify locales object can include the lang property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Intl.Locale('fr-FR');
      const output = arr.toLocaleString(locales);
      expect(normalizeFrenchGroupingSpacesTwo(output)).assertEqual('1 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0500
     * @tc.name testArrayToLocaleStringTwo005
     * @tc.desc Verify an empty locales object can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = createEmptyLocalesOneArg();
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0600
     * @tc.name testArrayToLocaleStringTwo006
     * @tc.desc Verify localized string formatting can be requested
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0700
     * @tc.name testArrayToLocaleStringTwo007
     * @tc.desc Verify toLocaleString handles an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      expect(output).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0800
     * @tc.name testArrayToLocaleStringTwo008
     * @tc.desc Verify toLocaleString handles a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Intl.Locale('zh-CN');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_0900
     * @tc.name testArrayToLocaleStringTwo009
     * @tc.desc Verify toLocaleString handles a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(1000);
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      let expected = '0';
      for (let i: int = 1; i < 1000; i++) {
        expected += ',' + i.toString();
      }
      expect(output).assertEqual(expected);
      expect(arr.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1000
     * @tc.name testArrayToLocaleStringTwo010
     * @tc.desc Verify en-US locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1100
     * @tc.name testArrayToLocaleStringTwo011
     * @tc.desc Verify zh-CN locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('zh-CN');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1200
     * @tc.name testArrayToLocaleStringTwo012
     * @tc.desc Verify de-DE locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('de-DE');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1.000,2.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1300
     * @tc.name testArrayToLocaleStringTwo013
     * @tc.desc Verify ja-JP locale input is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('ja-JP');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1400
     * @tc.name testArrayToLocaleStringTwo014
     * @tc.desc Verify locales objects can include multiple properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = createLocaleWithRegion('en-US', 'US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1500
     * @tc.name testArrayToLocaleStringTwo015
     * @tc.desc Verify toLocaleString accepts a helper-produced empty locale list for numeric formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1600
     * @tc.name testArrayToLocaleStringTwo016
     * @tc.desc Verify toLocaleString formats multiple numeric elements with an empty locale helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      expect(output).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1700
     * @tc.name testArrayToLocaleStringTwo017
     * @tc.desc Verify en-US locale formatting for the one-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1800
     * @tc.name testArrayToLocaleStringTwo018
     * @tc.desc Verify the one-argument overload can be compared with the no-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const output1 = arr.toLocaleString();
      const output2 = arr.toLocaleString(createEmptyLocalesOneArg());
      expect(output1).assertEqual('1,000,2,000');
      expect(output2).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_1900
     * @tc.name testArrayToLocaleStringTwo019
     * @tc.desc Verify the one-argument overload can be compared with the two-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Intl.Locale('en-US');
      const oneArgOutput = arr.toLocaleString(locales);
      const options: Intl.NumberFormatOptions = { style: 'decimal' };
      const twoArgsOutput = arr.toLocaleString(locales, options);
      expect(oneArgOutput).assertEqual('1,000');
      expect(twoArgsOutput).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2000
     * @tc.name testArrayToLocaleStringTwo020
     * @tc.desc Verify floating-point elements are accepted by the one-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000.567, 2000.89);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000.567,2,000.89');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2100
     * @tc.name testArrayToLocaleStringTwo021
     * @tc.desc Verify negative elements are accepted by the one-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1000, -2000);
      const locales = new Intl.Locale('zh-CN');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('-1,000,-2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2200
     * @tc.name testArrayToLocaleStringTwo022
     * @tc.desc Verify zero values are accepted by the one-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1000);
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      expect(output).assertEqual('0,1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2300
     * @tc.name testArrayToLocaleStringTwo023
     * @tc.desc Verify large numeric elements are accepted by the one-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000000, 1000000000);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,000,1,000,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2400
     * @tc.name testArrayToLocaleStringTwo024
     * @tc.desc Verify toLocaleString does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000');
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2500
     * @tc.name testArrayToLocaleStringTwo025
     * @tc.desc Verify repeated calls stay consistent when they succeed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = createEmptyLocalesOneArg();
      const output1 = arr.toLocaleString(locales);
      const output2 = arr.toLocaleString(locales);
      expect(output1).assertEqual('1,000');
      expect(output2).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2600
     * @tc.name testArrayToLocaleStringTwo026
     * @tc.desc Verify locales type constraints use Object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales: Intl.LocalesArgument = createEmptyLocalesOneArg();
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2700
     * @tc.name testArrayToLocaleStringTwo027
     * @tc.desc Verify multiple locale values can be used for number display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const localesList = new Array<Intl.Locale>(
        new Intl.Locale('en-US'),
        new Intl.Locale('zh-CN'),
        new Intl.Locale('ja-JP'),
        new Intl.Locale('fr-FR')
      );
      expect(arr.toLocaleString(localesList[0])).assertEqual('1,000,2,000');
      expect(arr.toLocaleString(localesList[1])).assertEqual('1,000,2,000');
      expect(arr.toLocaleString(localesList[2])).assertEqual('1,000,2,000');
      expect(normalizeFrenchGroupingSpacesTwo(arr.toLocaleString(localesList[3]))).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2800
     * @tc.name testArrayToLocaleStringTwo028
     * @tc.desc Verify UI display style usage can pass a user locale object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Array<number>(100, 200, 300);
      const userLocale = new Intl.Locale('en-US');
      const output = values.toLocaleString(userLocale);
      expect(output).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_2900
     * @tc.name testArrayToLocaleStringTwo029
     * @tc.desc Verify export-style usage can pass a locale object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data = new Array<number>(1000, 2000, 3000);
      const exportLocale = new Intl.Locale('zh-CN');
      const output = data.toLocaleString(exportLocale);
      expect(output).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3000
     * @tc.name testArrayToLocaleStringTwo030
     * @tc.desc Verify toLocaleString can be used after map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const mapped = arr.map((v: number): number => v * 1000);
      const locales = new Intl.Locale('en-US');
      const output = mapped.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3100
     * @tc.name testArrayToLocaleStringTwo031
     * @tc.desc Verify toLocaleString can be used after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(500, 1000, 1500, 2000);
      const filtered = arr.filter((v: number): boolean => v >= 1000);
      const output = filtered.toLocaleString(createEmptyLocalesOneArg());
      expect(output).assertEqual('1,000,1,500,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3200
     * @tc.name testArrayToLocaleStringTwo032
     * @tc.desc Verify language-only locale codes can be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Intl.Locale('en');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3300
     * @tc.name testArrayToLocaleStringTwo033
     * @tc.desc Verify localized output keeps element order when formatting three numeric elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000);
      const output = arr.toLocaleString(createEmptyLocalesOneArg());
      expect(output).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3400
     * @tc.name testArrayToLocaleStringTwo034
     * @tc.desc Verify localized output handles multiple elements when it succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000, 4000);
      const locales = new Intl.Locale('en-US');
      const output = arr.toLocaleString(locales);
      expect(output).assertEqual('1,000,2,000,3,000,4,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3500
     * @tc.name testArrayToLocaleStringTwo035
     * @tc.desc Verify fr-FR locale applies localized grouping to each numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('fr-FR');
      const result = arr.toLocaleString(locales);
      expect(normalizeFrenchGroupingSpacesTwo(result)).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3600
     * @tc.name testArrayToLocaleStringTwo036
     * @tc.desc Verify de-DE locale applies period grouping to multiple numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000000);
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1.000,2.000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3700
     * @tc.name testArrayToLocaleStringTwo037
     * @tc.desc Verify de-DE locale applies comma decimal separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234.5, 6.75);
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1.234,5,6,75');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3800
     * @tc.name testArrayToLocaleStringTwo038
     * @tc.desc Verify language-only locale objects still format grouped numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000);
      const locales = new Intl.Locale('en');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_3900
     * @tc.name testArrayToLocaleStringTwo039
     * @tc.desc Verify locale objects with region options format grouped numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000000);
      const locales = createLocaleWithRegion('en-US', 'US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4000
     * @tc.name testArrayToLocaleStringTwo040
     * @tc.desc Verify a locale list uses the first supported locale for formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1000);
      const locales = new Array<string>('de-DE', 'en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4100
     * @tc.name testArrayToLocaleStringTwo041
     * @tc.desc Verify explicit undefined becomes an empty field with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1000, undefined, 2000);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,,2,000');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4200
     * @tc.name testArrayToLocaleStringTwo042
     * @tc.desc Verify explicit null becomes an empty field with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1000, null, 2000);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,,2,000');
      expect(arr.lastIndexOf(null)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4300
     * @tc.name testArrayToLocaleStringTwo043
     * @tc.desc Verify explicit undefined values stay empty with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1000;
      arr[2] = 2000;
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,,2,000');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4400
     * @tc.name testArrayToLocaleStringTwo044
     * @tc.desc Verify an all-undefined dense array contributes only separators with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual(',,,');
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4500
     * @tc.name testArrayToLocaleStringTwo045
     * @tc.desc Verify object element toLocaleString is preferred over toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<LocaleStringItemTwo>(
        createLocaleStringItemTwo('alpha'),
        createLocaleStringItemTwo('beta')
      );
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('local-alpha,local-beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4600
     * @tc.name testArrayToLocaleStringTwo046
     * @tc.desc Verify string elements are preserved beside locale-formatted numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1000, '2000');
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4700
     * @tc.name testArrayToLocaleStringTwo047
     * @tc.desc Verify boolean elements keep their locale strings beside numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | boolean>(1000, true, false);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4800
     * @tc.name testArrayToLocaleStringTwo048
     * @tc.desc Verify mixed object, empty field, and number output with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<LocaleStringItemTwo | number | undefined>(
        createLocaleStringItemTwo('head'),
        undefined,
        3000
      );
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('local-head,,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_4900
     * @tc.name testArrayToLocaleStringTwo049
     * @tc.desc Verify filtered numeric values keep locale formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(500, 1500, 2500).filter((value: number): boolean => value >= 1500);
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1.500,2.500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5000
     * @tc.name testArrayToLocaleStringTwo050
     * @tc.desc Verify mapped fractional values are serialized with locale decimals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.25, 2.5).map((value: number): number => value * 10);
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('12,5,25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5100
     * @tc.name testArrayToLocaleStringTwo051
     * @tc.desc Verify sliced arrays preserve explicit undefined empty fields with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | undefined>(4, (_index) => undefined);
      source[0] = 1000;
      source[3] = 4000;
      const arr = source.slice(1, 4);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual(',,4,000');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5200
     * @tc.name testArrayToLocaleStringTwo052
     * @tc.desc Verify sorted numeric output still uses the supplied locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5300
     * @tc.name testArrayToLocaleStringTwo053
     * @tc.desc Verify reversed numeric output keeps the supplied locale and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000).toReversed();
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('3,000,2,000,1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5400
     * @tc.name testArrayToLocaleStringTwo054
     * @tc.desc Verify NaN and Infinity are serialized with a supplied locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Infinity);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result.indexOf('NaN')).assertEqual(0);
      expect(result.indexOf('Infinity') > 0 || result.indexOf(String.fromCharCode(0x221E)) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5500
     * @tc.name testArrayToLocaleStringTwo055
     * @tc.desc Verify negative zero keeps a minus sign with a supplied locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 1000);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('-0,1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5600
     * @tc.name testArrayToLocaleStringTwo056
     * @tc.desc Verify large grouped values produce distinguishable locale output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000000, 2000000);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,000,2,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5700
     * @tc.name testArrayToLocaleStringTwo057
     * @tc.desc Verify date elements use their own locale strings in arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<Date>(1, new Date(1593604800000));
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('7/1/2020, 8:00:00 PM');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5800
     * @tc.name testArrayToLocaleStringTwo058
     * @tc.desc Verify nested arrays are serialized as element locale strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(1000, 2000);
      const arr = new Array<Array<number> | number>(nested, 3000);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_5900
     * @tc.name testArrayToLocaleStringTwo059
     * @tc.desc Verify toLocaleString with a locales argument serializes a single numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 200);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6000
     * @tc.name testArrayToLocaleStringTwo060
     * @tc.desc Verify toLocaleString with a locales argument serializes a negative pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 4);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('-3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6100
     * @tc.name testArrayToLocaleStringTwo061
     * @tc.desc Verify a single object element uses its toLocaleString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<LocaleStringItemTwo>(1, createLocaleStringItemTwo('single'));
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('local-single');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6200
     * @tc.name testArrayToLocaleStringTwo062
     * @tc.desc Verify an empty array stays empty when a non-default locale is supplied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6300
     * @tc.name testArrayToLocaleStringTwo063
     * @tc.desc Verify decimal output differs between de-DE locale and toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1234.5, 6.75);
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(arr.toString()).assertEqual('1234.5,6.75');
      expect(result).assertEqual('1.234,5,6,75');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6400
     * @tc.name testArrayToLocaleStringTwo064
     * @tc.desc Verify locale formatting is applied after slice keeps a numeric subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(500, 1500, 2500, 3500).slice(1, 3);
      const locales = new Intl.Locale('en-US');
      expect(arr.toLocaleString(locales)).assertEqual('1,500,2,500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6500
     * @tc.name testArrayToLocaleStringTwo065
     * @tc.desc Verify mapped values use the supplied locale after transformation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).map((value: number): number => value * 1000);
      const locales = new Intl.Locale('fr-FR');
      expect(normalizeFrenchGroupingSpacesTwo(arr.toLocaleString(locales))).assertEqual('1 000,2 000,3 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6600
     * @tc.name testArrayToLocaleStringTwo066
     * @tc.desc Verify filtering null and undefined before formatting leaves only numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number | null | undefined>(1000, null, 2000, undefined);
      const arr = source.filter((value: number | null | undefined): boolean => {
        return value !== null && value !== undefined;
      });
      const locales = new Intl.Locale('en-US');
      expect(arr.toLocaleString(locales)).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6700
     * @tc.name testArrayToLocaleStringTwo067
     * @tc.desc Verify toReversed keeps locale-formatted element order observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 2000, 3000).toReversed();
      const locales = new Intl.Locale('en-US');
      expect(arr.toLocaleString(locales)).assertEqual('3,000,2,000,1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6800
     * @tc.name testArrayToLocaleStringTwo068
     * @tc.desc Verify toSorted keeps locale-formatted numeric order observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      expect(arr.toLocaleString(locales)).assertEqual('1,000,2,000,3,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_6900
     * @tc.name testArrayToLocaleStringTwo069
     * @tc.desc Verify dense arrays with undefined values keep empty fields during locale serialization checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      arr[1] = 1000;
      arr[3] = 3000;
      const locales = new Intl.Locale('en-US');
      expect(arr.toLocaleString(locales)).assertEqual(',1,000,,3,000,');
      expect(arr.lastIndexOf(undefined)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_7000
     * @tc.name testArrayToLocaleStringTwo070
     * @tc.desc Verify explicit undefined remains searchable after locale serialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1000);
      const locales = new Intl.Locale('en-US');
      expect(arr.toLocaleString(locales)).assertEqual(',1,000');
      expect(arr.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_7100
     * @tc.name testArrayToLocaleStringTwo071
     * @tc.desc Verify an all-undefined dense array only contributes separators with a locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual(',');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_7200
     * @tc.name testArrayToLocaleStringTwo072
     * @tc.desc Verify NaN and Infinity are formatted when a locale is supplied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Infinity);
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result.indexOf('NaN')).assertEqual(0);
      expect(result.indexOf('Infinity') > 0 || result.indexOf('\u221e') > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_7300
     * @tc.name testArrayToLocaleStringTwo073
     * @tc.desc Verify string elements are preserved while numeric elements use the locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1000, 'abc');
      const locales = new Intl.Locale('en-US');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_LOCALE_STRING_TWO_7400
     * @tc.name testArrayToLocaleStringTwo074
     * @tc.desc Verify de-DE locale is applied around explicit undefined empty fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToLocaleStringTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1000;
      arr[2] = 2000;
      const locales = new Intl.Locale('de-DE');
      const result = arr.toLocaleString(locales);
      expect(result).assertEqual('1.000,,2.000');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

  });
}

