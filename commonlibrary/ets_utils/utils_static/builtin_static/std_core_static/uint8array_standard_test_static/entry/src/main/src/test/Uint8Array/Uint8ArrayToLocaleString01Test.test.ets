'use static'

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
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

interface ToLocaleStringOptions {
  style?: string;
  currency?: string;
  currencyDisplay?: string;
  useGrouping?: boolean;
  minimumIntegerDigits?: number;
  minimumFractionDigits?: number;
  maximumFractionDigits?: number;
  minimumSignificantDigits?: number;
  maximumSignificantDigits?: number;
  notation?: string;
  compactDisplay?: string;
  localeMatcher?: string;
}

export default function Uint8ArrayToLocaleString01Test(): void {
  describe('Uint8ArrayToLocaleString01Test', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0100
     * @tc.name testUint8ArrayToLocaleString001
     * @tc.desc Verify toLocaleString() with no parameters returns string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const result = arr.toLocaleString();
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0200
     * @tc.name testUint8ArrayToLocaleString002
     * @tc.desc Verify toLocaleString(locales) with single valid string parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0300
     * @tc.name testUint8ArrayToLocaleString003
     * @tc.desc Verify toLocaleString(undefined) with explicit undefined parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const result = arr.toLocaleString(undefined);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0400
     * @tc.name testUint8ArrayToLocaleString004
     * @tc.desc Verify toLocaleString(locales, options) with two parameters
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0500
     * @tc.name testUint8ArrayToLocaleString005
     * @tc.desc Verify toLocaleString(undefined, options) with undefined locales and empty options
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {};
      const result = arr.toLocaleString(undefined, options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0600
     * @tc.name testUint8ArrayToLocaleString006
     * @tc.desc Verify toLocaleString(undefined, undefined) with both parameters undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const result = arr.toLocaleString(undefined, undefined);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0700
     * @tc.name testUint8ArrayToLocaleString007
     * @tc.desc Verify toLocaleString with zh-CN locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0800
     * @tc.name testUint8ArrayToLocaleString008
     * @tc.desc Verify toLocaleString with ja-JP locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 0, 128);
      const result = arr.toLocaleString('ja-JP');
      expect(result).assertEqual('255,0,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_0900
     * @tc.name testUint8ArrayToLocaleString009
     * @tc.desc Verify toLocaleString with de-DE locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1000
     * @tc.name testUint8ArrayToLocaleString010
     * @tc.desc Verify toLocaleString with fr-FR locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.toLocaleString('fr-FR');
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1100
     * @tc.name testUint8ArrayToLocaleString011
     * @tc.desc Verify toLocaleString with ko-KR locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7);
      const result = arr.toLocaleString('ko-KR');
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1200
     * @tc.name testUint8ArrayToLocaleString012
     * @tc.desc Verify toLocaleString with ar-SA locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(12, 34);
      const result = arr.toLocaleString('ar-SA');
      expect(result).assertEqual('١٢,٣٤');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1300
     * @tc.name testUint8ArrayToLocaleString013
     * @tc.desc Verify toLocaleString with th-TH locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200, 55);
      const result = arr.toLocaleString('th-TH');
      expect(result).assertEqual('200,55');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1400
     * @tc.name testUint8ArrayToLocaleString014
     * @tc.desc Verify toLocaleString with en-GB locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(99, 77);
      const result = arr.toLocaleString('en-GB');
      expect(result).assertEqual('99,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1500
     * @tc.name testUint8ArrayToLocaleString015
     * @tc.desc Verify toLocaleString with es-ES locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 1, 1, 1);
      const result = arr.toLocaleString('es-ES');
      expect(result).assertEqual('1,1,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1600
     * @tc.name testUint8ArrayToLocaleString016
     * @tc.desc Verify toLocaleString with pt-BR locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(50, 60, 70, 80);
      const result = arr.toLocaleString('pt-BR');
      expect(result).assertEqual('50,60,70,80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1700
     * @tc.name testUint8ArrayToLocaleString017
     * @tc.desc Verify toLocaleString with ru-RU locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20);
      const result = arr.toLocaleString('ru-RU');
      expect(result).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1800
     * @tc.name testUint8ArrayToLocaleString018
     * @tc.desc Verify toLocaleString with it-IT locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.toLocaleString('it-IT');
      expect(result).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_1900
     * @tc.name testUint8ArrayToLocaleString019
     * @tc.desc Verify toLocaleString with pl-PL locale
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.toLocaleString('pl-PL');
      expect(result).assertEqual('0,0,0');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2000
     * @tc.name testUint8ArrayToLocaleString020
     * @tc.desc Verify toLocaleString with th-TH-u-nu-thai locale extension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(12, 34);
      const result = arr.toLocaleString('th-TH-u-nu-thai');
      expect(result).assertEqual('๑๒,๓๔');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2100
     * @tc.name testUint8ArrayToLocaleString021
     * @tc.desc Verify toLocaleString with de-DE-u-co-phonebk locale extension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const result = arr.toLocaleString('de-DE-u-co-phonebk');
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2200
     * @tc.name testUint8ArrayToLocaleString022
     * @tc.desc Verify toLocaleString with en-US-u-ca-buddhist locale extension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.toLocaleString('en-US-u-ca-buddhist');
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2300
     * @tc.name testUint8ArrayToLocaleString023
     * @tc.desc Verify toLocaleString with ar-SA-u-nu-arab locale extension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200, 55);
      const result = arr.toLocaleString('ar-SA-u-nu-arab');
      expect(result).assertEqual('٢٠٠,٥٥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2400
     * @tc.name testUint8ArrayToLocaleString024
     * @tc.desc Verify toLocaleString with zh-CN-u-nu-hanidec locale extension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 0, 128);
      const result = arr.toLocaleString('zh-CN-u-nu-hanidec');
      expect(result).assertEqual('二五五,〇,一二八');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2500
     * @tc.name testUint8ArrayToLocaleString025
     * @tc.desc Verify toLocaleString with ja-JP-u-ca-japanese locale extension
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100);
      const result = arr.toLocaleString('ja-JP-u-ca-japanese');
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2600
     * @tc.name testUint8ArrayToLocaleString026
     * @tc.desc Verify toLocaleString with EN-US uppercase locale tag
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7);
      const result = arr.toLocaleString('EN-US');
      expect(result).assertEqual('7');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2700
     * @tc.name testUint8ArrayToLocaleString027
     * @tc.desc Verify toLocaleString with i-default deprecated locale tag
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      try {
        arr.toLocaleString('i-default');
        expect().assertFail();
      } catch (e) {
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2800
     * @tc.name testUint8ArrayToLocaleString028
     * @tc.desc Verify toLocaleString with und undefined language tag
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(12, 34);
      const result = arr.toLocaleString('und');
      expect(result).assertEqual('12,34');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_2900
     * @tc.name testUint8ArrayToLocaleString029
     * @tc.desc Verify toLocaleString with zh-Hans-CN locale tag
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200, 55);
      const result = arr.toLocaleString('zh-Hans-CN');
      expect(result).assertEqual('200,55');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3000
     * @tc.name testUint8ArrayToLocaleString030
     * @tc.desc Verify toLocaleString with sr-RS locale tag
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 0, 128);
      const result = arr.toLocaleString('sr-RS');
      expect(result).assertEqual('255,0,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3100
     * @tc.name testUint8ArrayToLocaleString031
     * @tc.desc Verify toLocaleString with en-US locale and locales array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const result = arr.toLocaleString(['en-US']);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3200
     * @tc.name testUint8ArrayToLocaleString032
     * @tc.desc Verify toLocaleString with zh-CN locale and locales array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.toLocaleString(['zh-CN']);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3300
     * @tc.name testUint8ArrayToLocaleString033
     * @tc.desc Verify toLocaleString with multiple locales array fallback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 0, 128);
      const result = arr.toLocaleString(['zh-CN', 'en-US']);
      expect(result).assertEqual('255,0,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3400
     * @tc.name testUint8ArrayToLocaleString034
     * @tc.desc Verify toLocaleString with empty locales array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100);
      const result = arr.toLocaleString(new Array<string>());
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3500
     * @tc.name testUint8ArrayToLocaleString035
     * @tc.desc Verify toLocaleString with empty locales array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.toLocaleString(new Array<string>());
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3600
     * @tc.name testUint8ArrayToLocaleString036
     * @tc.desc Verify toLocaleString with locales array containing multiple fallback locales
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7);
      const result = arr.toLocaleString(['de-DE', 'fr-FR', 'en-US']);
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3700
     * @tc.name testUint8ArrayToLocaleString037
     * @tc.desc Verify toLocaleString with style decimal option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {style: 'decimal'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3800
     * @tc.name testUint8ArrayToLocaleString038
     * @tc.desc Verify toLocaleString with style currency and USD does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {style: 'currency', currency: 'USD'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_3900
     * @tc.name testUint8ArrayToLocaleString039
     * @tc.desc Verify toLocaleString with style percent does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 0, 128);
      const options: ToLocaleStringOptions = {style: 'percent'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('255,0,128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4000
     * @tc.name testUint8ArrayToLocaleString040
     * @tc.desc Verify toLocaleString with useGrouping true does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {useGrouping: true};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4100
     * @tc.name testUint8ArrayToLocaleString041
     * @tc.desc Verify toLocaleString with useGrouping false does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {useGrouping: false};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4200
     * @tc.name testUint8ArrayToLocaleString042
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 1 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {minimumIntegerDigits: 1};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4300
     * @tc.name testUint8ArrayToLocaleString043
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 2 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {minimumIntegerDigits: 2};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4400
     * @tc.name testUint8ArrayToLocaleString044
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 3 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {minimumIntegerDigits: 3};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4500
     * @tc.name testUint8ArrayToLocaleString045
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 5 option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {minimumIntegerDigits: 5};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4600
     * @tc.name testUint8ArrayToLocaleString046
     * @tc.desc Verify toLocaleString with minimumFractionDigits 0 option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumFractionDigits: 0};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4700
     * @tc.name testUint8ArrayToLocaleString047
     * @tc.desc Verify toLocaleString with minimumFractionDigits 2 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumFractionDigits: 2};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4800
     * @tc.name testUint8ArrayToLocaleString048
     * @tc.desc Verify toLocaleString with minimumFractionDigits 3 option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumFractionDigits: 3};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_4900
     * @tc.name testUint8ArrayToLocaleString049
     * @tc.desc Verify toLocaleString with maximumFractionDigits 3 option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {maximumFractionDigits: 3};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5000
     * @tc.name testUint8ArrayToLocaleString050
     * @tc.desc Verify toLocaleString with minimumFractionDigits 2 does not throw and maximumFractionDigits 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumFractionDigits: 2, maximumFractionDigits: 4};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5100
     * @tc.name testUint8ArrayToLocaleString051
     * @tc.desc Verify toLocaleString with minimumFractionDigits 3 and maximumFractionDigits 5 options does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumFractionDigits: 3, maximumFractionDigits: 5};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5200
     * @tc.name testUint8ArrayToLocaleString052
     * @tc.desc Verify toLocaleString with minimumSignificantDigits 1 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumSignificantDigits: 1};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5300
     * @tc.name testUint8ArrayToLocaleString053
     * @tc.desc Verify toLocaleString with minimumSignificantDigits 2 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {minimumSignificantDigits: 2};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5400
     * @tc.name testUint8ArrayToLocaleString054
     * @tc.desc Verify toLocaleString with maximumSignificantDigits 1 option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {maximumSignificantDigits: 1};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5500
     * @tc.name testUint8ArrayToLocaleString055
     * @tc.desc Verify toLocaleString with maximumSignificantDigits 3 does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(123, 45, 67);
      const options: ToLocaleStringOptions = {maximumSignificantDigits: 3};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('123,45,67');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5600
     * @tc.name testUint8ArrayToLocaleString056
     * @tc.desc Verify toLocaleString with currencyDisplay symbol does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {style: 'currency', currency: 'USD', currencyDisplay: 'symbol'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5700
     * @tc.name testUint8ArrayToLocaleString057
     * @tc.desc Verify toLocaleString with currencyDisplay name option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {style: 'currency', currency: 'USD', currencyDisplay: 'name'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5800
     * @tc.name testUint8ArrayToLocaleString058
     * @tc.desc Verify toLocaleString with currencyDisplay name for EUR option does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const options: ToLocaleStringOptions = {style: 'currency', currency: 'EUR', currencyDisplay: 'name'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_5900
     * @tc.name testUint8ArrayToLocaleString059
     * @tc.desc Verify toLocaleString with notation scientific does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100);
      const options: ToLocaleStringOptions = {notation: 'scientific'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_6000
     * @tc.name testUint8ArrayToLocaleString060
     * @tc.desc Verify toLocaleString with notation engineering does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const options: ToLocaleStringOptions = {notation: 'engineering'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_6100
     * @tc.name testUint8ArrayToLocaleString061
     * @tc.desc Verify toLocaleString with notation compact does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(7);
      const options: ToLocaleStringOptions = {notation: 'compact'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_6200
     * @tc.name testUint8ArrayToLocaleString062
     * @tc.desc Verify toLocaleString with notation compact does not throw and compactDisplay long
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(99, 77);
      const options: ToLocaleStringOptions = {notation: 'compact', compactDisplay: 'long'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('99,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_6300
     * @tc.name testUint8ArrayToLocaleString063
     * @tc.desc Verify toLocaleString with localeMatcher lookup does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(12, 34);
      const options: ToLocaleStringOptions = {localeMatcher: 'lookup'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('12,34');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING01_6400
     * @tc.name testUint8ArrayToLocaleString064
     * @tc.desc Verify toLocaleString with localeMatcher best fit does not throw
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 1, 1, 1);
      const options: ToLocaleStringOptions = {localeMatcher: 'best fit'};
      const result = arr.toLocaleString('en-US', options);
      expect(result).assertEqual('1,1,1,1');
    });});
}