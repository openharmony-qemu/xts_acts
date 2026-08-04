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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayToLocaleStringPart1Test(): void {
  describe('Uint16ArrayToLocaleStringPart1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0100
     * @tc.name testUint16ArrayToLocaleStringPart1001
      * @tc.desc Verify default locale formatting applies grouping to each array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString();
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0200
     * @tc.name testUint16ArrayToLocaleStringPart1002
      * @tc.desc Verify en-US formatting applies comma grouping to each element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("en-US");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0300
     * @tc.name testUint16ArrayToLocaleStringPart1003
      * @tc.desc Verify empty en-US formatting options preserve default grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {};
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0400
     * @tc.name testUint16ArrayToLocaleStringPart1004
      * @tc.desc Verify an undefined locale uses default grouped formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let locales: string | undefined = undefined;
      let result: string = arr.toLocaleString(locales);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0500
     * @tc.name testUint16ArrayToLocaleStringPart1005
      * @tc.desc Verify zh-CN formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("zh-CN");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0600
     * @tc.name testUint16ArrayToLocaleStringPart1006
      * @tc.desc Verify de-DE formatting uses periods as grouping separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("de-DE");
      expect(result).assertEqual('1.000,2.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0700
     * @tc.name testUint16ArrayToLocaleStringPart1007
      * @tc.desc Verify ja-JP formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("ja-JP");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0800
     * @tc.name testUint16ArrayToLocaleStringPart1008
      * @tc.desc Verify ar-SA formatting uses Arabic digits and grouping marks
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("ar-SA");
      expect(result).assertEqual('١٬٠٠٠,٢٬٠٠٠');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_0900
     * @tc.name testUint16ArrayToLocaleStringPart1009
      * @tc.desc Verify th-TH formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("th-TH");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1000
     * @tc.name testUint16ArrayToLocaleStringPart1010
      * @tc.desc Verify en-GB formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("en-GB");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1100
     * @tc.name testUint16ArrayToLocaleStringPart1011
      * @tc.desc Verify fr-FR formatting uses narrow no-break grouping spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("fr-FR");
      expect(result).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1200
     * @tc.name testUint16ArrayToLocaleStringPart1012
      * @tc.desc Verify ko-KR formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("ko-KR");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1300
     * @tc.name testUint16ArrayToLocaleStringPart1013
      * @tc.desc Verify ru-RU formatting uses no-break grouping spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("ru-RU");
      expect(result).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1400
     * @tc.name testUint16ArrayToLocaleStringPart1014
      * @tc.desc Verify es-ES leaves four-digit values ungrouped
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("es-ES");
      expect(result).assertEqual('1000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1500
     * @tc.name testUint16ArrayToLocaleStringPart1015
      * @tc.desc Verify it-IT formatting uses periods as grouping separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("it-IT");
      expect(result).assertEqual('1.000,2.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1600
     * @tc.name testUint16ArrayToLocaleStringPart1016
      * @tc.desc Verify pt-BR formatting uses periods as grouping separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("pt-BR");
      expect(result).assertEqual('1.000,2.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1700
     * @tc.name testUint16ArrayToLocaleStringPart1017
      * @tc.desc Verify zh-TW formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("zh-TW");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1800
     * @tc.name testUint16ArrayToLocaleStringPart1018
      * @tc.desc Verify zh-HK formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("zh-HK");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_1900
     * @tc.name testUint16ArrayToLocaleStringPart1019
      * @tc.desc Verify en-AU formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("en-AU");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2000
     * @tc.name testUint16ArrayToLocaleStringPart1020
      * @tc.desc Verify en-CA formatting groups both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("en-CA");
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2100
     * @tc.name testUint16ArrayToLocaleStringPart1021
      * @tc.desc Verify sv-SE formatting uses no-break grouping spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("sv-SE");
      expect(result).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2200
     * @tc.name testUint16ArrayToLocaleStringPart1022
      * @tc.desc Verify nb-NO formatting uses no-break grouping spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("nb-NO");
      expect(result).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2300
     * @tc.name testUint16ArrayToLocaleStringPart1023
      * @tc.desc Verify da-DK formatting uses periods as grouping separators
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("da-DK");
      expect(result).assertEqual('1.000,2.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2400
     * @tc.name testUint16ArrayToLocaleStringPart1024
      * @tc.desc Verify fi-FI formatting uses no-break grouping spaces
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("fi-FI");
      expect(result).assertEqual('1 000,2 000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2500
     * @tc.name testUint16ArrayToLocaleStringPart1025
      * @tc.desc Verify pl-PL leaves four-digit values ungrouped
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("pl-PL");
      expect(result).assertEqual('1000,2000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2600
     * @tc.name testUint16ArrayToLocaleStringPart1026
      * @tc.desc Verify an empty locale tag throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1837, 426);
      try {
        arr.toLocaleString("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2700
     * @tc.name testUint16ArrayToLocaleStringPart1027
      * @tc.desc Verify an empty locale preference list uses default formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1350, 2400);
      let localeList: string[] = [];
      let result: string = arr.toLocaleString(localeList);
      expect(result).assertEqual('1,350,2,400');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2800
     * @tc.name testUint16ArrayToLocaleStringPart1028
      * @tc.desc Verify locale preference lists use the first supported locale
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2468, 1357);
      let localeList: string[] = ["en-US", "de-DE"];
      let result: string = arr.toLocaleString(localeList);
      expect(result).assertEqual('2,468,1,357');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_2900
     * @tc.name testUint16ArrayToLocaleStringPart1029
      * @tc.desc Verify the und locale applies default grouped decimal formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3210, 4500);
      let result: string = arr.toLocaleString("und");
      expect(result).assertEqual('3,210,4,500');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3000
     * @tc.name testUint16ArrayToLocaleStringPart1030
      * @tc.desc Verify the non-BCP47 C locale tag throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(764, 2891);
      try {
        arr.toLocaleString("C");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3100
     * @tc.name testUint16ArrayToLocaleStringPart1031
      * @tc.desc Verify an invalid locale tag throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5073, 918);
      try {
        arr.toLocaleString("invalid-locale-tag");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3200
     * @tc.name testUint16ArrayToLocaleStringPart1032
      * @tc.desc Verify undefined options retain en-US default grouping
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5678, 9012);
      let result: string = arr.toLocaleString("en-US", undefined);
      expect(result).assertEqual('5,678,9,012');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3300
     * @tc.name testUint16ArrayToLocaleStringPart1033
      * @tc.desc Verify minimumIntegerDigits pads only the single-digit element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let options: Intl.NumberFormatOptions = { minimumIntegerDigits: 2 };
      let result: string = arr.toLocaleString("en-US", options);
      expect(result).assertEqual("05,50");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3400
     * @tc.name testUint16ArrayToLocaleStringPart1034
      * @tc.desc Verify five minimum integer digits add grouped leading zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 5 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('00,005,00,050');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3500
     * @tc.name testUint16ArrayToLocaleStringPart1035
       * @tc.desc Verify minimumFractionDigits set to zero omits the decimal separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 0 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3600
     * @tc.name testUint16ArrayToLocaleStringPart1036
      * @tc.desc Verify two minimum fraction digits append decimal zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000.00,2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3700
     * @tc.name testUint16ArrayToLocaleStringPart1037
      * @tc.desc Verify three minimum fraction digits append three decimal zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 3 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000.000,2,000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3800
     * @tc.name testUint16ArrayToLocaleStringPart1038
      * @tc.desc Verify zero maximum fraction digits preserve integer formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { maximumFractionDigits: 0 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_3900
     * @tc.name testUint16ArrayToLocaleStringPart1039
      * @tc.desc Verify maximum fraction digits do not add decimals to integers
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { maximumFractionDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4000
     * @tc.name testUint16ArrayToLocaleStringPart1040
      * @tc.desc Verify minimum significant digits pad the one-digit element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumSignificantDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("5.0,50");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4100
     * @tc.name testUint16ArrayToLocaleStringPart1041
      * @tc.desc Verify five minimum significant digits pad both elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumSignificantDigits: 5 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("5.0000,50.000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4200
     * @tc.name testUint16ArrayToLocaleStringPart1042
      * @tc.desc Verify two maximum significant digits round each large element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(12345, 67890);
      let opts: Intl.NumberFormatOptions = { maximumSignificantDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("12,000,2,400");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4300
     * @tc.name testUint16ArrayToLocaleStringPart1043
      * @tc.desc Verify five maximum significant digits retain expected precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(12345, 67890);
      let opts: Intl.NumberFormatOptions = { maximumSignificantDigits: 5 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('12,345,2,354');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4400
     * @tc.name testUint16ArrayToLocaleStringPart1044
      * @tc.desc Verify disabling grouping emits unseparated decimal elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10000, 20000);
      let opts: Intl.NumberFormatOptions = { useGrouping: false };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('10000,20000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4500
     * @tc.name testUint16ArrayToLocaleStringPart1045
      * @tc.desc Verify enabling grouping emits comma-separated thousands elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10000, 20000);
      let opts: Intl.NumberFormatOptions = { useGrouping: true };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('10,000,20,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4600
     * @tc.name testUint16ArrayToLocaleStringPart1046
      * @tc.desc Verify explicit decimal style matches default number formatting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "decimal" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4700
     * @tc.name testUint16ArrayToLocaleStringPart1047
      * @tc.desc Verify percent style scales and suffixes each array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "percent" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('100,000%,200,000%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4800
     * @tc.name testUint16ArrayToLocaleStringPart1048
      * @tc.desc Verify USD currency style formats each element with dollar symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "USD" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("$1,000.00,$2,000.00");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_4900
     * @tc.name testUint16ArrayToLocaleStringPart1049
      * @tc.desc Verify EUR currency style formats each element with euro symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "EUR" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('€1,000.00,€2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5000
     * @tc.name testUint16ArrayToLocaleStringPart1050
      * @tc.desc Verify JPY currency style formats whole-yen elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "JPY" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("¥1,000,¥2,000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5100
     * @tc.name testUint16ArrayToLocaleStringPart1051
      * @tc.desc Verify GBP currency style formats each element with pound symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "GBP" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('£1,000.00,£2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5200
     * @tc.name testUint16ArrayToLocaleStringPart1052
      * @tc.desc Verify scientific notation formats each thousand as an exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { notation: "scientific" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("1E3,2E3");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5300
     * @tc.name testUint16ArrayToLocaleStringPart1053
      * @tc.desc Verify engineering notation formats each thousand as an exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { notation: "engineering" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("1E3,2E3");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5400
     * @tc.name testUint16ArrayToLocaleStringPart1054
      * @tc.desc Verify compact notation abbreviates thousands with K suffixes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { notation: "compact", compactDisplay: "short" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("1K,2K");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5500
     * @tc.name testUint16ArrayToLocaleStringPart1055
      * @tc.desc Verify compactDisplay alone does not enable compact notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { compactDisplay: "short" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("1,000,2,000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5600
     * @tc.name testUint16ArrayToLocaleStringPart1056
      * @tc.desc Verify long compactDisplay alone does not enable compact notation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { compactDisplay: "long" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("1,000,2,000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5700
     * @tc.name testUint16ArrayToLocaleStringPart1057
      * @tc.desc Verify currency symbol display renders dollar symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "USD", currencyDisplay: "symbol" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("$1,000.00,$2,000.00");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5800
     * @tc.name testUint16ArrayToLocaleStringPart1058
      * @tc.desc Verify currency code display prefixes each USD amount
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "USD", currencyDisplay: "code" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('USD 1,000.00,USD 2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_5900
     * @tc.name testUint16ArrayToLocaleStringPart1059
      * @tc.desc Verify currency name display spells out US dollars
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "USD", currencyDisplay: "name" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000.00 US dollars,2,000.00 US dollars');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6000
     * @tc.name testUint16ArrayToLocaleStringPart1060
      * @tc.desc Verify disabled grouping overrides a two-digit minimum for three-digit values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 2, useGrouping: false };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('100,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6100
     * @tc.name testUint16ArrayToLocaleStringPart1061
      * @tc.desc Verify matching fraction digit bounds produce fixed two-decimal output
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000.00,2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6200
     * @tc.name testUint16ArrayToLocaleStringPart1062
      * @tc.desc Verify integer and fraction minimums pad both portions of each value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 3, minimumFractionDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('005.00,050.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6300
     * @tc.name testUint16ArrayToLocaleStringPart1063
      * @tc.desc Verify EUR currency code display prefixes both formatted amounts
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "EUR", currencyDisplay: "code" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('EUR 1,000.00,EUR 2,000.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6400
     * @tc.name testUint16ArrayToLocaleStringPart1064
      * @tc.desc Verify long compact notation spells out thousands
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10000, 20000);
      let opts: Intl.NumberFormatOptions = { notation: "compact", compactDisplay: "long" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("10 thousand,20 thousand");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6500
     * @tc.name testUint16ArrayToLocaleStringPart1065
      * @tc.desc Verify grouped zero padding and fixed decimal padding combine correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 4, useGrouping: true, minimumFractionDigits: 2 };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual("0,100.00,0,200.00");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6600
     * @tc.name testUint16ArrayToLocaleStringPart1066
      * @tc.desc Verify de-DE fixed fractions use a comma decimal separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      let result: string = arr.toLocaleString("de-DE", opts);
      expect(result).assertEqual("1.000,00,2.000,00");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6700
     * @tc.name testUint16ArrayToLocaleStringPart1067
      * @tc.desc Verify zh-CN percent style scales each integer value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "percent" };
      let result: string = arr.toLocaleString("zh-CN", opts);
      expect(result).assertEqual('100,000%,200,000%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6800
     * @tc.name testUint16ArrayToLocaleStringPart1068
      * @tc.desc Verify ja-JP scientific notation formats both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { notation: "scientific" };
      let result: string = arr.toLocaleString("ja-JP", opts);
      expect(result).assertEqual("1E3,2E3");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_6900
     * @tc.name testUint16ArrayToLocaleStringPart1069
      * @tc.desc Verify ar-SA integer padding uses Arabic zero digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 3 };
      let result: string = arr.toLocaleString("ar-SA", opts);
      expect(result).assertEqual('٠٠٥,٠٥٠');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7000
     * @tc.name testUint16ArrayToLocaleStringPart1070
      * @tc.desc Verify th-TH fixed fractions append two decimal zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      let result: string = arr.toLocaleString("th-TH", opts);
      expect(result).assertEqual("1,000.00,2,000.00");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7100
     * @tc.name testUint16ArrayToLocaleStringPart1071
      * @tc.desc Verify en-US grouping is stable for a repeated call pattern
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let result: string = arr.toLocaleString("en-US");
      expect(result).assertEqual("1,000,2,000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7200
     * @tc.name testUint16ArrayToLocaleStringPart1072
      * @tc.desc Verify de-DE USD currency uses localized separators and suffix symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "USD" };
      let result: string = arr.toLocaleString("de-DE", opts);
      expect(result).assertEqual('1.000,00 $,2.000,00 $');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7300
     * @tc.name testUint16ArrayToLocaleStringPart1073
      * @tc.desc Verify zh-CN four-digit padding groups leading zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 4 };
      let result: string = arr.toLocaleString("zh-CN", opts);
      expect(result).assertEqual("0,005,0,050");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7400
     * @tc.name testUint16ArrayToLocaleStringPart1074
      * @tc.desc Verify ko-KR disables grouping when requested
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10000, 20000);
      let opts: Intl.NumberFormatOptions = { useGrouping: false };
      let result: string = arr.toLocaleString("ko-KR", opts);
      expect(result).assertEqual("10000,20000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7500
     * @tc.name testUint16ArrayToLocaleStringPart1075
      * @tc.desc Verify it-IT engineering notation formats both thousands values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { notation: "engineering" };
      let result: string = arr.toLocaleString("it-IT", opts);
      expect(result).assertEqual("1E3,2E3");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7600
     * @tc.name testUint16ArrayToLocaleStringPart1076
      * @tc.desc Verify en-US GBP name display spells out British pounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "GBP", currencyDisplay: "name" };
      let result: string = arr.toLocaleString("en-US", opts);
      expect(result).assertEqual('1,000.00 British pounds,2,000.00 British pounds');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7700
     * @tc.name testUint16ArrayToLocaleStringPart1077
      * @tc.desc Verify ja-JP JPY currency uses full-width yen symbols
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = { style: "currency", currency: "JPY" };
      let result: string = arr.toLocaleString("ja-JP", opts);
      expect(result).assertEqual("￥1,000,￥2,000");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_TOLOCALESTRING_PART1_7800
     * @tc.name testUint16ArrayToLocaleStringPart1078
      * @tc.desc Verify es-ES significant-digit padding uses localized decimal commas
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArrayToLocaleStringPart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 50);
      let opts: Intl.NumberFormatOptions = { minimumSignificantDigits: 3 };
      let result: string = arr.toLocaleString("es-ES", opts);
      expect(result).assertEqual("5,00,50,0");

    });

  });
}
