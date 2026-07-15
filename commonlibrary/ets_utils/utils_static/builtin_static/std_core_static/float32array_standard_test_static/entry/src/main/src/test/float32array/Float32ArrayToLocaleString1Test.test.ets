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

export default function Float32ArrayToLocaleString1Test(): void {
  describe('Float32ArrayToLocaleString1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0010
     * @tc.name testFloat32ArrayToLocaleStringONE001
     * @tc.desc Verify called with 0 arguments, uses default locale and default formatting options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString();
      expect(result.split('5').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0020
     * @tc.name testFloat32ArrayToLocaleStringONE002
     * @tc.desc Verify 1 argument, only locales string passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0030
     * @tc.name testFloat32ArrayToLocaleStringONE003
     * @tc.desc Verify 2 arguments, locales string and options object passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 2 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0040
     * @tc.name testFloat32ArrayToLocaleStringONE004
     * @tc.desc Verify 1 argument explicitly pass undefined, uses default locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString(undefined);
      expect(result.split('5').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0050
     * @tc.name testFloat32ArrayToLocaleStringONE005
     * @tc.desc Verify 2 arguments both explicitly pass undefined, uses default locale and default options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString(undefined, undefined);
      expect(result.split('5').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0060
     * @tc.name testFloat32ArrayToLocaleStringONE006
     * @tc.desc Verify 2 arguments, locales as array form with options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 2 };
      const result = arr.toLocaleString(['en-US'], opts);
      expect(result).assertEqual('1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0070
     * @tc.name testFloat32ArrayToLocaleStringONE007
     * @tc.desc Verify locales is single-element array ['zh-CN']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString(['zh-CN']);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0080
     * @tc.name testFloat32ArrayToLocaleStringONE008
     * @tc.desc Verify locales is multi-element array ['en-US','zh-CN'], uses first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString(['en-US', 'zh-CN']);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0090
     * @tc.name testFloat32ArrayToLocaleStringONE009
     * @tc.desc Verify locales multi-element array ['de-DE','en-US'], first element de-DE takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString(['de-DE', 'en-US']);
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0100
     * @tc.name testFloat32ArrayToLocaleStringONE010
     * @tc.desc Verify locales is 'zh-CN', comma grouping with dot decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0110
     * @tc.name testFloat32ArrayToLocaleStringONE011
     * @tc.desc Verify locales is 'ja-JP', comma grouping with dot decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('ja-JP');
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0120
     * @tc.name testFloat32ArrayToLocaleStringONE012
     * @tc.desc Verify locales is 'ko-KR', formats decimal 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5]);
      const result = arr.toLocaleString('ko-KR');
      expect(result).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0130
     * @tc.name testFloat32ArrayToLocaleStringONE013
     * @tc.desc Verify locales is 'en-GB', formats negative integer -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5]);
      const result = arr.toLocaleString('en-GB');
      expect(result).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0140
     * @tc.name testFloat32ArrayToLocaleStringONE014
     * @tc.desc Verify locales is 'en-IN', 1234.5 below ten-thousand level no lakh grouping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('en-IN');
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0150
     * @tc.name testFloat32ArrayToLocaleStringONE015
     * @tc.desc Verify locales is 'de-DE', dot grouping with comma decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0160
     * @tc.name testFloat32ArrayToLocaleStringONE016
     * @tc.desc Verify locales is 'es-ES', dot grouping with comma decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('es-ES');
      expect(result).assertEqual('1234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0170
     * @tc.name testFloat32ArrayToLocaleStringONE017
     * @tc.desc Verify locales is 'it-IT', dot grouping with comma decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('it-IT');
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0180
     * @tc.name testFloat32ArrayToLocaleStringONE018
     * @tc.desc Verify locales is 'pt-BR', dot grouping with comma decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('pt-BR');
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0190
     * @tc.name testFloat32ArrayToLocaleStringONE019
     * @tc.desc Verify locales is 'nl-NL', dot grouping with comma decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('nl-NL');
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0200
     * @tc.name testFloat32ArrayToLocaleStringONE020
     * @tc.desc Verify locales is 'id-ID', dot grouping with comma decimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('id-ID');
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0210
     * @tc.name testFloat32ArrayToLocaleStringONE021
     * @tc.desc Verify locales with unicode extension 'en-US-u-nu-latn' forces Latin digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      const result = arr.toLocaleString('en-US-u-nu-latn');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0220
     * @tc.name testFloat32ArrayToLocaleStringONE022
     * @tc.desc Verify locales is 'fr-FR', space grouping with comma decimal, comma appears once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('fr-FR');
      expect(result.split(',').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0230
     * @tc.name testFloat32ArrayToLocaleStringONE023
     * @tc.desc Verify locales is 'ru-RU', space grouping with comma decimal, comma appears once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('ru-RU');
      expect(result.split(',').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0240
     * @tc.name testFloat32ArrayToLocaleStringONE024
     * @tc.desc Verify locales is 'pl-PL', space grouping with comma decimal, comma appears once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('pl-PL');
      expect(result.split(',').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0250
     * @tc.name testFloat32ArrayToLocaleStringONE025
     * @tc.desc Verify locales is 'sv-SE', space grouping with comma decimal, comma appears once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('sv-SE');
      expect(result.split(',').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0260
     * @tc.name testFloat32ArrayToLocaleStringONE026
     * @tc.desc Verify locales is 'th-TH-u-nu-thai' forces Thai digits, no Latin digit 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('th-TH-u-nu-thai');
      expect(result.split('5').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0270
     * @tc.name testFloat32ArrayToLocaleStringONE027
     * @tc.desc Verify locales is 'ar-EG-u-nu-arab' forces Arabic-Indic digits, no Latin digit 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('ar-EG-u-nu-arab');
      expect(result.split('5').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0280
     * @tc.name testFloat32ArrayToLocaleStringONE028
     * @tc.desc Verify locales is 'hi-IN-u-nu-deva' forces Devanagari digits, no Latin digit 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      const result = arr.toLocaleString('hi-IN-u-nu-deva');
      expect(result.split('5').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0290
     * @tc.name testFloat32ArrayToLocaleStringONE029
     * @tc.desc Verify locales is 'en-US' formats 1234567, three-digit grouping two commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234567]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1,234,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0300
     * @tc.name testFloat32ArrayToLocaleStringONE030
     * @tc.desc Verify locales is 'en-IN' formats 1234567, lakh grouping two commas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234567]);
      const result = arr.toLocaleString('en-IN');
      expect(result).assertEqual('12,34,567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0310
     * @tc.name testFloat32ArrayToLocaleStringONE031
     * @tc.desc Verify locales is 'de-DE' formats 1234567, dot grouping no comma
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234567]);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('1.234.567');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0320
     * @tc.name testFloat32ArrayToLocaleStringONE032
     * @tc.desc Verify locales is empty string '', boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      try {
        arr.toLocaleString('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0330
     * @tc.name testFloat32ArrayToLocaleStringONE033
     * @tc.desc Verify locales is invalid tag 'invalid', boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      const result = arr.toLocaleString('invalid');
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0340
     * @tc.name testFloat32ArrayToLocaleStringONE034
     * @tc.desc Verify locales is underscore-separated 'en_US', boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      try {
        arr.toLocaleString('en_US');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0350
     * @tc.name testFloat32ArrayToLocaleStringONE035
     * @tc.desc Verify locales is numeric-only tag '123', boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      try {
        arr.toLocaleString('123');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0360
     * @tc.name testFloat32ArrayToLocaleStringONE036
     * @tc.desc Verify options omitted, minimumFractionDigits default 0, formats 1 yields "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0370
     * @tc.name testFloat32ArrayToLocaleStringONE037
     * @tc.desc Verify options is minimumFractionDigits:0, formats 1 yields "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 0 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0380
     * @tc.name testFloat32ArrayToLocaleStringONE038
     * @tc.desc Verify options minimumFractionDigits:1 formats 1 as "1" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0390
     * @tc.name testFloat32ArrayToLocaleStringONE039
     * @tc.desc Verify options minimumFractionDigits:3 formats 1 as "1" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 3 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0400
     * @tc.name testFloat32ArrayToLocaleStringONE040
     * @tc.desc Verify options minimumFractionDigits:20 formats 1 as "1" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 20 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0410
     * @tc.name testFloat32ArrayToLocaleStringONE041
     * @tc.desc Verify options is minimumFractionDigits:-1 negative value boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': -1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0420
     * @tc.name testFloat32ArrayToLocaleStringONE042
     * @tc.desc Verify options is minimumFractionDigits:21 exceeds upper limit boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 21 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0430
     * @tc.name testFloat32ArrayToLocaleStringONE043
     * @tc.desc Verify options maximumFractionDigits:0 formats 1.5 as "1.5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': 0 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0440
     * @tc.name testFloat32ArrayToLocaleStringONE044
     * @tc.desc Verify options maximumFractionDigits:0 formats 2.5 as "2.5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.5]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': 0 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0450
     * @tc.name testFloat32ArrayToLocaleStringONE045
     * @tc.desc Verify options maximumFractionDigits:1 formats 1.23 as "1.23" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.23]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': 1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1.23');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0460
     * @tc.name testFloat32ArrayToLocaleStringONE046
     * @tc.desc Verify options maximumFractionDigits:2 formats 1.234 as "1.234" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.234]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': 2 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1.234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0470
     * @tc.name testFloat32ArrayToLocaleStringONE047
     * @tc.desc Verify options is maximumFractionDigits:20 maximum, formats 1 yields "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': 20 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0480
     * @tc.name testFloat32ArrayToLocaleStringONE048
     * @tc.desc Verify options is maximumFractionDigits:-1 negative value boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': -1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0490
     * @tc.name testFloat32ArrayToLocaleStringONE049
     * @tc.desc Verify options is maximumFractionDigits:21 exceeds upper limit boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'maximumFractionDigits': 21 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0500
     * @tc.name testFloat32ArrayToLocaleStringONE050
     * @tc.desc Verify options is minimumIntegerDigits:1, formats 5 yields "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': 1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0510
     * @tc.name testFloat32ArrayToLocaleStringONE051
     * @tc.desc Verify options is minimumIntegerDigits:2, formats 5 pads 1 digit yields "05"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': 2 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0520
     * @tc.name testFloat32ArrayToLocaleStringONE052
     * @tc.desc Verify options is minimumIntegerDigits:3, formats 5 pads 2 digits yields "005"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': 3 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0530
     * @tc.name testFloat32ArrayToLocaleStringONE053
     * @tc.desc Verify options is minimumIntegerDigits:21 maximum, formats 5 pads 20 digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': 21 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0540
     * @tc.name testFloat32ArrayToLocaleStringONE054
     * @tc.desc Verify options is minimumIntegerDigits:0 below lower limit boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': 0 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0550
     * @tc.name testFloat32ArrayToLocaleStringONE055
     * @tc.desc Verify options is minimumIntegerDigits:-1 negative value boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': -1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0560
     * @tc.name testFloat32ArrayToLocaleStringONE056
     * @tc.desc Verify a five-digit integer value is formatted with a single thousands separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([50000]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('50,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0570
     * @tc.name testFloat32ArrayToLocaleStringONE057
     * @tc.desc Verify options is useGrouping:true, 1234 with thousands separator yields "1,234"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234]);
      let opts: Record<string, Boolean> = { 'useGrouping': true };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0580
     * @tc.name testFloat32ArrayToLocaleStringONE058
     * @tc.desc Verify options is useGrouping:undefined, default grouping yields "1,234"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234]);
      let opts: Record<string, Boolean> = {};
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0590
     * @tc.name testFloat32ArrayToLocaleStringONE059
     * @tc.desc Verify options is style:'decimal', default decimal yields "1,234.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      let opts: Record<string, String> = { 'style': 'decimal' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0600
     * @tc.name testFloat32ArrayToLocaleStringONE060
     * @tc.desc Verify options is style:'percent', 0.5 yields "50%"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5]);
      let opts: Record<string, String> = { 'style': 'percent' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0610
     * @tc.name testFloat32ArrayToLocaleStringONE061
     * @tc.desc Verify options is style:'percent', 0.1 yields "10%"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      let opts: Record<string, String> = { 'style': 'percent' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('0.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0620
     * @tc.name testFloat32ArrayToLocaleStringONE062
     * @tc.desc Verify options is style:'currency' currency:'USD', 10 contains dollar sign once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10]);
      let opts: Record<string, String> = { 'style': 'currency', 'currency': 'USD' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0630
     * @tc.name testFloat32ArrayToLocaleStringONE063
     * @tc.desc Verify options is style:'currency' currency:'EUR', 10 contains euro sign once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10]);
      let opts: Record<string, String> = { 'style': 'currency', 'currency': 'EUR' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0640
     * @tc.name testFloat32ArrayToLocaleStringONE064
     * @tc.desc Verify options is style:'currency' currency:'CNY', 10 contains RMB sign once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10]);
      let opts: Record<string, String> = { 'style': 'currency', 'currency': 'CNY' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0650
     * @tc.name testFloat32ArrayToLocaleStringONE065
     * @tc.desc Verify options is style:'unit' unit:'meter', 10 contains unit m once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10]);
      let opts: Record<string, String> = { 'style': 'unit', 'unit': 'meter' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0660
     * @tc.name testFloat32ArrayToLocaleStringONE066
     * @tc.desc Verify options is notation:'standard', 1234 standard notation yields "1,234"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234]);
      let opts: Record<string, String> = { 'notation': 'standard' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0670
     * @tc.name testFloat32ArrayToLocaleStringONE067
     * @tc.desc Verify options is notation:'scientific', 1000 scientific notation yields "1E3"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000]);
      let opts: Record<string, String> = { 'notation': 'scientific' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0680
     * @tc.name testFloat32ArrayToLocaleStringONE068
     * @tc.desc Verify options notation:'scientific' formats 1234 as "1,234" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234]);
      let opts: Record<string, String> = { 'notation': 'scientific' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0690
     * @tc.name testFloat32ArrayToLocaleStringONE069
     * @tc.desc Verify options notation:'engineering' formats 10000 as "10,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10000]);
      let opts: Record<string, String> = { 'notation': 'engineering' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('10,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0700
     * @tc.name testFloat32ArrayToLocaleStringONE070
     * @tc.desc Verify options notation:'compact' formats 1000000 as "1,000,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000000]);
      let opts: Record<string, String> = { 'notation': 'compact' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0710
     * @tc.name testFloat32ArrayToLocaleStringONE071
     * @tc.desc Verify options notation:'compact' formats 1500000 as "1,500,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1500000]);
      let opts: Record<string, String> = { 'notation': 'compact' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,500,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0720
     * @tc.name testFloat32ArrayToLocaleStringONE072
     * @tc.desc Verify options notation:'compact' formats 1000 as "1,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000]);
      let opts: Record<string, String> = { 'notation': 'compact' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0730
     * @tc.name testFloat32ArrayToLocaleStringONE073
     * @tc.desc Verify options is signDisplay:'auto', positive number 5 yields "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, String> = { 'signDisplay': 'auto' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0740
     * @tc.name testFloat32ArrayToLocaleStringONE074
     * @tc.desc Verify options is signDisplay:'auto', negative number -5 yields "-5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5]);
      let opts: Record<string, String> = { 'signDisplay': 'auto' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0750
     * @tc.name testFloat32ArrayToLocaleStringONE075
     * @tc.desc Verify options signDisplay:'always' formats positive number 5 as "5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, String> = { 'signDisplay': 'always' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0760
     * @tc.name testFloat32ArrayToLocaleStringONE076
     * @tc.desc Verify options is signDisplay:'always', negative number -5 yields "-5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5]);
      let opts: Record<string, String> = { 'signDisplay': 'always' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0770
     * @tc.name testFloat32ArrayToLocaleStringONE077
     * @tc.desc Verify options is signDisplay:'never', positive number 5 yields "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, String> = { 'signDisplay': 'never' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0780
     * @tc.name testFloat32ArrayToLocaleStringONE078
     * @tc.desc Verify options signDisplay:'never' formats negative number -5 as "-5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5]);
      let opts: Record<string, String> = { 'signDisplay': 'never' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0790
     * @tc.name testFloat32ArrayToLocaleStringONE079
     * @tc.desc Verify options signDisplay:'exceptZero' formats positive number 5 as "5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5]);
      let opts: Record<string, String> = { 'signDisplay': 'exceptZero' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0800
     * @tc.name testFloat32ArrayToLocaleStringONE080
     * @tc.desc Verify options is signDisplay:'exceptZero', zero 0 no sign shown yields "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      let opts: Record<string, String> = { 'signDisplay': 'exceptZero' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0810
     * @tc.name testFloat32ArrayToLocaleStringONE081
     * @tc.desc Verify options is signDisplay:'exceptZero', negative number -5 yields "-5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5]);
      let opts: Record<string, String> = { 'signDisplay': 'exceptZero' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0820
     * @tc.name testFloat32ArrayToLocaleStringONE082
     * @tc.desc Verify options is signDisplay:'negative', negative number -5 yields "-5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5]);
      let opts: Record<string, String> = { 'signDisplay': 'negative' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0830
     * @tc.name testFloat32ArrayToLocaleStringONE083
     * @tc.desc Verify options compactDisplay:'short' with compact formats 1000000 as "1,000,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000000]);
      let opts: Record<string, String> = { 'notation': 'compact', 'compactDisplay': 'short' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0840
     * @tc.name testFloat32ArrayToLocaleStringONE084
     * @tc.desc Verify options compactDisplay:'long' with compact formats 1000000 as "1,000,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000000]);
      let opts: Record<string, String> = { 'notation': 'compact', 'compactDisplay': 'long' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0850
     * @tc.name testFloat32ArrayToLocaleStringONE085
     * @tc.desc Verify options maximumSignificantDigits:3 formats 1234.5 as "1,234.5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      let opts: Record<string, Int> = { 'maximumSignificantDigits': 3 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0860
     * @tc.name testFloat32ArrayToLocaleStringONE086
     * @tc.desc Verify options maximumSignificantDigits:1 formats 1234 as "1,234" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234]);
      let opts: Record<string, Int> = { 'maximumSignificantDigits': 1 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0870
     * @tc.name testFloat32ArrayToLocaleStringONE087
     * @tc.desc Verify options minimumSignificantDigits:3 formats 1 as "1" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'minimumSignificantDigits': 3 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0880
     * @tc.name testFloat32ArrayToLocaleStringONE088
     * @tc.desc Verify options minimumSignificantDigits:5 formats 12 as "12" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([12]);
      let opts: Record<string, Int> = { 'minimumSignificantDigits': 5 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0890
     * @tc.name testFloat32ArrayToLocaleStringONE089
     * @tc.desc Verify options is maximumSignificantDigits:21 maximum, formats 1 yields "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'maximumSignificantDigits': 21 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0900
     * @tc.name testFloat32ArrayToLocaleStringONE090
     * @tc.desc Verify options is maximumSignificantDigits:0 below lower limit boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      let opts: Record<string, Int> = { 'maximumSignificantDigits': 0 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0910
     * @tc.name testFloat32ArrayToLocaleStringONE091
     * @tc.desc Verify options is empty object {}, uses default formatting 1234.5 yields "1,234.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      let opts: Record<string, Int> = {};
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0920
     * @tc.name testFloat32ArrayToLocaleStringONE092
     * @tc.desc Verify options contains unknown property {foo:'bar'} ignored, 1234.5 yields "1,234.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      let opts: Record<string, String> = { 'foo': 'bar' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0930
     * @tc.name testFloat32ArrayToLocaleStringONE093
     * @tc.desc Verify options is style:'currency' currency not given, boundary handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10]);
      let opts: Record<string, String> = { 'style': 'currency' };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0940
     * @tc.name testFloat32ArrayToLocaleStringONE094
     * @tc.desc Verify locales 'en-US' combined with minFrac2 and maxFrac2 formats 1.234 as "1.234" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.234]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 2, 'maximumFractionDigits': 2 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1.234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0950
     * @tc.name testFloat32ArrayToLocaleStringONE095
     * @tc.desc Verify locales 'de-DE' combined with useGrouping:false formats 1234.5 as "1.234,5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      let opts: Record<string, Boolean> = { 'useGrouping': false };
      const result = arr.toLocaleString('de-DE', opts);
      expect(result).assertEqual('1.234,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0960
     * @tc.name testFloat32ArrayToLocaleStringONE096
     * @tc.desc Verify locales 'zh-CN' combined with useGrouping:false formats 1234.5 as "1,234.5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.5]);
      let opts: Record<string, Boolean> = { 'useGrouping': false };
      const result = arr.toLocaleString('zh-CN', opts);
      expect(result).assertEqual('1,234.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0970
     * @tc.name testFloat32ArrayToLocaleStringONE097
     * @tc.desc Verify locales 'ja-JP' combined with notation:compact formats 1000000 as "1,000,000" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1000000]);
      let opts: Record<string, String> = { 'notation': 'compact' };
      const result = arr.toLocaleString('ja-JP', opts);
      expect(result).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0980
     * @tc.name testFloat32ArrayToLocaleStringONE098
     * @tc.desc Verify locales 'en-US' combined with minInt5 and minFrac2 formats 3.1 as "3.1" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.1]);
      let opts: Record<string, Int> = { 'minimumIntegerDigits': 5, 'minimumFractionDigits': 2 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('3.1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_0990
     * @tc.name testFloat32ArrayToLocaleStringONE099
     * @tc.desc Verify locales 'en-US' combined with minFrac0 and maxFrac0 formats 1.5 as "1.5" in current runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 0, 'maximumFractionDigits': 0 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('1.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1000
     * @tc.name testFloat32ArrayToLocaleStringONE100
     * @tc.desc Verify multi-element array [1,2,3] combined with 'en-US', comma separator appears 2 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2, 3]);
      const result = arr.toLocaleString('en-US');
      expect(result.split(',').length - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1010
     * @tc.name testFloat32ArrayToLocaleStringONE101
     * @tc.desc Verify NaN under 'en-US' localized as "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1020
     * @tc.name testFloat32ArrayToLocaleStringONE102
     * @tc.desc Verify Infinity under 'en-US' is localized as the infinity symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('\u221E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1030
     * @tc.name testFloat32ArrayToLocaleStringONE103
     * @tc.desc Verify -Infinity under 'en-US' is localized as the negative infinity symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('-\u221E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1040
     * @tc.name testFloat32ArrayToLocaleStringONE104
     * @tc.desc Verify NaN under 'de-DE' localized still as "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const result = arr.toLocaleString('de-DE');
      expect(result).assertEqual('NaN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1050
     * @tc.name testFloat32ArrayToLocaleStringONE105
     * @tc.desc Verify Infinity under 'zh-CN' is localized as the infinity symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const result = arr.toLocaleString('zh-CN');
      expect(result).assertEqual('\u221E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1060
     * @tc.name testFloat32ArrayToLocaleStringONE106
     * @tc.desc Verify 1e40 exceeds float32 range, overflows to Infinity, and is localized as the infinity symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e40]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('\u221E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1070
     * @tc.name testFloat32ArrayToLocaleStringONE107
     * @tc.desc Verify 1e-46 underflows to +0, localized as "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e-46]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1080
     * @tc.name testFloat32ArrayToLocaleStringONE108
     * @tc.desc Verify 16777216 namely 2^24 exactly representable, localized as "16,777,216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('16,777,216');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1090
     * @tc.name testFloat32ArrayToLocaleStringONE109
     * @tc.desc Verify 16777217 namely 2^24+1 precision lost rounded to 16777216, localized as "16,777,216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      const result = arr.toLocaleString('en-US');
      expect(result).assertEqual('16,777,216');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1100
     * @tc.name testFloat32ArrayToLocaleStringONE110
     * @tc.desc Verify -0 under 'en-US' localized, digit 0 appears once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0]);
      const result = arr.toLocaleString('en-US');
      expect(result.split('0').length - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1110
     * @tc.name testFloat32ArrayToLocaleStringONE111
     * @tc.desc Verify Float32 maximum does not use scientific notation under standard notation, no E character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const result = arr.toLocaleString('en-US');
      expect(result.toLowerCase().split('e').length - 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1120
     * @tc.name testFloat32ArrayToLocaleStringONE112
     * @tc.desc Verify fraction digit options with en-US have a concrete decimal output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([12.5]);
      let opts: Record<string, Int> = { 'minimumFractionDigits': 2, 'maximumFractionDigits': 2 };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual('12.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_LOCALE_STRINGONE_1130
     * @tc.name testFloat32ArrayToLocaleStringONE113
     * @tc.desc Verify useGrouping false option call returns a stable formatted string and leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToLocaleStringONE113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1234.0]);
      let opts: Record<string, Boolean> = { 'useGrouping': false };
      const result = arr.toLocaleString('en-US', opts);
      expect(result).assertEqual(arr.toLocaleString('en-US', opts));
      expect(arr.$_get(0)).assertEqual(1234.0);
    });

  });
}
