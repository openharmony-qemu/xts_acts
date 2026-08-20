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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayToLocaleStringOneTest(): void {
  describe('Uint32ArrayToLocaleStringOneTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0100
     * @tc.name testUint32ArrayToLocaleStringOne001
     * @tc.desc Verify toLocaleString(), locale options,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const s = values.toLocaleString();
      expect(s).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0200
     * @tc.name testUint32ArrayToLocaleStringOne002
     * @tc.desc Verify locales zh-CN,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000, 2000);
      const s = values.toLocaleString("zh-CN");
      expect(s.length).assertEqual(11);
      expect(s).assertEqual("1,000,2,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0300
     * @tc.name testUint32ArrayToLocaleStringOne003
     * @tc.desc Verify locales en-US, 1234567 1,234,567
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1234567);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("1,234,567");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0400
     * @tc.name testUint32ArrayToLocaleStringOne004
     * @tc.desc Verify locales de-DE, 1234567
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1234567);
      const s = values.toLocaleString("de-DE");
      expect(s.length).assertEqual(9);
      expect(s).assertEqual("1.234.567");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0500
     * @tc.name testUint32ArrayToLocaleStringOne005
     * @tc.desc Verify locales hi-IN, 934567
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(934567);
      const s = values.toLocaleString("hi-IN");
      expect(s.length).assertEqual(8);
      expect(s).assertEqual("9,34,567");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0600
     * @tc.name testUint32ArrayToLocaleStringOne006
     * @tc.desc Verify locales ["zh-CN","en-US"], locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1234567);
      const locales: string[] = ["zh-CN", "en-US"];
      const s = values.toLocaleString(locales);
      expect(s.length).assertEqual(9);
      expect(s).assertEqual("1,234,567");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0700
     * @tc.name testUint32ArrayToLocaleStringOne007
     * @tc.desc Verify locales "xx-XX", locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const s = values.toLocaleString("xx-XX");
      expect(s.length).assertEqual(5);
      expect(s).assertEqual("1,2,3");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0800
     * @tc.name testUint32ArrayToLocaleStringOne008
     * @tc.desc Verify locales number 0 options ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000, 2000);
      try {
        values.toLocaleString('0', {} as Intl.NumberFormatOptions);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_0900
     * @tc.name testUint32ArrayToLocaleStringOne009
     * @tc.desc Verify locales number 1234567, locale,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      try {
        values.toLocaleString('1234567');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1000
     * @tc.name testUint32ArrayToLocaleStringOne010
     * @tc.desc Verify uint32 MAX-1 4294967294 en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967294);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("4,294,967,294");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1100
     * @tc.name testUint32ArrayToLocaleStringOne011
     * @tc.desc Verify uint32 2147483648 en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483648);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("2,147,483,648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1200
     * @tc.name testUint32ArrayToLocaleStringOne012
     * @tc.desc Verify int32 MAX 2147483647 en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("2,147,483,647");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1300
     * @tc.name testUint32ArrayToLocaleStringOne013
     * @tc.desc Verify 0 en-US "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1400
     * @tc.name testUint32ArrayToLocaleStringOne014
     * @tc.desc Verify 1 en-US "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1500
     * @tc.name testUint32ArrayToLocaleStringOne015
     * @tc.desc Verify 1000 en-US "1,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("1,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1600
     * @tc.name testUint32ArrayToLocaleStringOne016
     * @tc.desc Verify 1000000 en-US "1,000,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000000);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("1,000,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1700
     * @tc.name testUint32ArrayToLocaleStringOne017
     * @tc.desc Verify 1000000000 en-US "1,000,000,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000000000);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("1,000,000,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1800
     * @tc.name testUint32ArrayToLocaleStringOne018
     * @tc.desc Verify 1000000 zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000000);
      const s = values.toLocaleString("zh-CN");
      expect(s).assertEqual("1,000,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_1900
     * @tc.name testUint32ArrayToLocaleStringOne019
     * @tc.desc Verify [1000, 2000, 3000] en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000, 2000, 3000);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("1,000,2,000,3,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2000
     * @tc.name testUint32ArrayToLocaleStringOne020
     * @tc.desc Verify 0xFFFFFFFF( 4294967295) en-US uint32 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFFFFFF);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("4,294,967,295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2100
     * @tc.name testUint32ArrayToLocaleStringOne021
     * @tc.desc Verify 0xFFFFFFFF zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0xFFFFFFFF);
      const s = values.toLocaleString("zh-CN");
      expect(s.length).assertEqual(13);
      expect(s).assertEqual("4,294,967,295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2200
     * @tc.name testUint32ArrayToLocaleStringOne022
     * @tc.desc Verify 0o777(511) en-US "511"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0o777);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("511");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2300
     * @tc.name testUint32ArrayToLocaleStringOne023
     * @tc.desc Verify 0o777 zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0o777);
      const s = values.toLocaleString("zh-CN");
      expect(s.length).assertEqual(3);
      expect(s).assertEqual("511");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2400
     * @tc.name testUint32ArrayToLocaleStringOne024
     * @tc.desc Verify 0b11111111(255) en-US "255"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0b11111111);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2500
     * @tc.name testUint32ArrayToLocaleStringOne025
     * @tc.desc Verify 0b11111111 undefined "255"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0b11111111);
      const s = values.toLocaleString();
      expect(s).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2600
     * @tc.name testUint32ArrayToLocaleStringOne026
     * @tc.desc Verify 1e3 zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1e3);
      const s = values.toLocaleString("zh-CN");
      expect(s.length).assertEqual(5);
      expect(s).assertEqual("1,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2700
     * @tc.name testUint32ArrayToLocaleStringOne027
     * @tc.desc Verify 1e6 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1e6);
      const s = values.toLocaleString();
      expect(s.length).assertEqual(9);
      expect(s).assertEqual("1,000,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2800
     * @tc.name testUint32ArrayToLocaleStringOne028
     * @tc.desc Verify empty options object en-US produces grouped form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000, 2000);
      const s = values.toLocaleString("en-US", {} as Intl.NumberFormatOptions);
      expect(s).assertEqual("1,000,2,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_2900
     * @tc.name testUint32ArrayToLocaleStringOne029
     * @tc.desc Verify options.useGrouping=false,en-US 1000 "1000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000);
      const s = values.toLocaleString("en-US", { useGrouping: false } as Intl.NumberFormatOptions);
      expect(s).assertEqual("1000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3000
     * @tc.name testUint32ArrayToLocaleStringOne030
     * @tc.desc Verify options.useGrouping=false, 1234567 en-US "1234567"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1234567);
      const s = values.toLocaleString("en-US", { useGrouping: false } as Intl.NumberFormatOptions);
      expect(s).assertEqual("1234567");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3100
     * @tc.name testUint32ArrayToLocaleStringOne031
     * @tc.desc Verify options.minimumIntegerDigits=5,en-US 42 "00,042"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const s = values.toLocaleString("en-US", { minimumIntegerDigits: 5 } as Intl.NumberFormatOptions);
      expect(s).assertEqual("00,042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3200
     * @tc.name testUint32ArrayToLocaleStringOne032
     * @tc.desc Verify options.minimumIntegerDigits=6,en-US 1000 "001,000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000);
      const s = values.toLocaleString("en-US", { minimumIntegerDigits: 6 } as Intl.NumberFormatOptions);
      expect(s).assertEqual("001,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3300
     * @tc.name testUint32ArrayToLocaleStringOne033
     * @tc.desc Verify options.minimumIntegerDigits=3,en-US 7 "007"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(7);
      const s = values.toLocaleString(
        "en-US",
        { minimumIntegerDigits: 3, useGrouping: false } as Intl.NumberFormatOptions);
      expect(s).assertEqual("007");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3400
     * @tc.name testUint32ArrayToLocaleStringOne034
     * @tc.desc Verify options.minimumIntegerDigits=1,en-US 0 "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0);
      const s = values.toLocaleString(
        "en-US",
        { minimumIntegerDigits: 1, useGrouping: false } as Intl.NumberFormatOptions);
      expect(s).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3500
     * @tc.name testUint32ArrayToLocaleStringOne035
     * @tc.desc Verify options useGrouping=false minimumIntegerDigits=4,en-US 12 "0012"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(12);
      const s = values.toLocaleString(
        "en-US",
        { useGrouping: false, minimumIntegerDigits: 4 } as Intl.NumberFormatOptions);
      expect(s).assertEqual("0012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3600
     * @tc.name testUint32ArrayToLocaleStringOne036
     * @tc.desc Verify options useGrouping=true minimumIntegerDigits=4,en-US 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(12);
      const s = values.toLocaleString(
        "en-US",
        { useGrouping: true, minimumIntegerDigits: 4 } as Intl.NumberFormatOptions);
      expect(s).assertEqual("0,012");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3700
     * @tc.name testUint32ArrayToLocaleStringOne037
     * @tc.desc Verify locales=zh-CN options.minimumIntegerDigits=2,42 "42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const s = values.toLocaleString(
        "zh-CN",
        { minimumIntegerDigits: 2, useGrouping: false } as Intl.NumberFormatOptions);
      expect(s).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3800
     * @tc.name testUint32ArrayToLocaleStringOne038
     * @tc.desc Verify en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_3900
     * @tc.name testUint32ArrayToLocaleStringOne039
     * @tc.desc Verify uint32 MAX zh-CN options.useGrouping=false "4294967295"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295);
      const s = values.toLocaleString("zh-CN", { useGrouping: false } as Intl.NumberFormatOptions);
      expect(s).assertEqual("4294967295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_4000
     * @tc.name testUint32ArrayToLocaleStringOne040
     * @tc.desc Verify 100 [1..100] en-US 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        values.$_set(i, i + 1);
      }
      const s = values.toLocaleString("en-US");
      expect(s.length).assertEqual(291);
      expect(s.startsWith("1,2,3,")).assertTrue();
      expect(s.endsWith(",99,100")).assertTrue();
      expect(s.includes(",50,")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_4100
     * @tc.name testUint32ArrayToLocaleStringOne041
     * @tc.desc Verify [0, 0, 0] en-US "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 0, 0);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_4200
     * @tc.name testUint32ArrayToLocaleStringOne042
     * @tc.desc Verify uint32 MAX [4294967295, 4294967295] en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295, 4294967295);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("4,294,967,295,4,294,967,295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_4300
     * @tc.name testUint32ArrayToLocaleStringOne043
     * @tc.desc Verify [1000, 1000, 1000] zh-CN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1000, 1000, 1000);
      const s = values.toLocaleString("zh-CN");
      expect(s.length).assertEqual(17);
      expect(s).assertEqual("1,000,1,000,1,000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_4400
     * @tc.name testUint32ArrayToLocaleStringOne044
     * @tc.desc Verify negative -1 wraps to 4294967295 and toLocaleString en-US outputs grouped form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(-1);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("4,294,967,295");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_TOLOCALESTRING_4500
     * @tc.name testUint32ArrayToLocaleStringOne045
     * @tc.desc Verify negative int32 min -2147483648 wraps to 2147483648 and toLocaleString en-US outputs grouped form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayToLocaleStringOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(-2147483648);
      const s = values.toLocaleString("en-US");
      expect(s).assertEqual("2,147,483,648");
    });

  });
}
