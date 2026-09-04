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

class Empty {
}

class GroupOff {
  useGrouping: boolean = false;
}

class GroupOn {
  useGrouping: boolean = true;
}

class O {
  useGrouping: boolean = true;
  style: string = 'decimal';
  currency: string = '';
  currencyDisplay: string = 'symbol';
  notation: string = 'standard';
  compactDisplay: string = 'short';
  signDisplay: string = 'auto';
  localeMatcher: string = 'best fit';
  minimumIntegerDigits: number = 1;
  minimumFractionDigits: number = 0;
  maximumFractionDigits: number = 3;
  minimumSignificantDigits: number = 1;
  maximumSignificantDigits: number = 21;
  notARealOption: string = '';
}

export default function int32ArrayToLocaleStringPart01Test(): void {
  describe('int32ArrayToLocaleStringPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0010
     * @tc.name int32ArrayToLocaleStringPart01Test001
     * @tc.desc Verify Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0020
     * @tc.name int32ArrayToLocaleStringPart01Test002
     * @tc.desc Verify 0 '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0030
     * @tc.name int32ArrayToLocaleStringPart01Test003
     * @tc.desc Verify 1 '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0040
     * @tc.name int32ArrayToLocaleStringPart01Test004
     * @tc.desc Verify -1 '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0050
     * @tc.name int32ArrayToLocaleStringPart01Test005
     * @tc.desc Verify [1,2] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0060
     * @tc.name int32ArrayToLocaleStringPart01Test006
     * @tc.desc Verify [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0070
     * @tc.name int32ArrayToLocaleStringPart01Test007
     * @tc.desc Verify INT_MAX 2147483647 '2147483647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r: string = arr.toLocaleString();
      expect(r.replace(new RegExp('\\D', 'g'), '')).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0080
     * @tc.name int32ArrayToLocaleStringPart01Test008
     * @tc.desc Verify INT_MIN -2147483648 '-2147483648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: string = arr.toLocaleString();
      expect(r.replace(new RegExp('[,\\s]', 'g'), '')).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0090
     * @tc.name int32ArrayToLocaleStringPart01Test009
     * @tc.desc Verify 999 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(999);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayToLocaleStringPart01Test010
     * @tc.desc Verify 1000 '1000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let r: string = arr.toLocaleString();
      expect(r.replace(new RegExp('[^\\d-]', 'g'), '')).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0110
     * @tc.name int32ArrayToLocaleStringPart01Test011
     * @tc.desc Verify locales=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(99);
      let r1: string = arr.toLocaleString();
      let r2: string = arr.toLocaleString(undefined);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0120
     * @tc.name int32ArrayToLocaleStringPart01Test012
     * @tc.desc Verify locales='en-US'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0130
     * @tc.name int32ArrayToLocaleStringPart01Test013
     * @tc.desc Verify locales='en-US' 0 '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0140
     * @tc.name int32ArrayToLocaleStringPart01Test014
     * @tc.desc Verify locales='en-US' 1000 '1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0150
     * @tc.name int32ArrayToLocaleStringPart01Test015
     * @tc.desc Verify locales='en-US' 999 '999' <1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(999);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0160
     * @tc.name int32ArrayToLocaleStringPart01Test016
     * @tc.desc Verify locales='en-US' 1000000 '1,000,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0170
     * @tc.name int32ArrayToLocaleStringPart01Test017
     * @tc.desc Verify locales='en-US' -2147483648 '-2,147,483,648'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('-2,147,483,648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0180
     * @tc.name int32ArrayToLocaleStringPart01Test018
     * @tc.desc Verify locales='en-US' 2147483647 '2,147,483,647'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('2,147,483,647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0190
     * @tc.name int32ArrayToLocaleStringPart01Test019
     * @tc.desc Verify locales='en-US' [1000, 2000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000, 2000);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1,000,2,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayToLocaleStringPart01Test020
     * @tc.desc Verify locales='en-US' -1 '-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0210
     * @tc.name int32ArrayToLocaleStringPart01Test021
     * @tc.desc Verify locales='de-DE' 1000 '1000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let r: string = arr.toLocaleString('de-DE');
      expect(r.replace(new RegExp('\\D', 'g'), '')).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0220
     * @tc.name int32ArrayToLocaleStringPart01Test022
     * @tc.desc Verify locales='de-DE' 1000000 '.'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString('de-DE');
      expect(r).assertEqual('1.000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0230
     * @tc.name int32ArrayToLocaleStringPart01Test023
     * @tc.desc Verify locales='fr-FR' 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString('fr-FR');
      expect(r.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0240
     * @tc.name int32ArrayToLocaleStringPart01Test024
     * @tc.desc Verify locales='zh-CN' 1000000 '1000000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString('zh-CN');
      expect(r.replace(new RegExp('\\D', 'g'), '')).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0250
     * @tc.name int32ArrayToLocaleStringPart01Test025
     * @tc.desc Verify locales='ar-EG' 1234 - U+0660-U+0669
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1234);
      let r: string = arr.toLocaleString('ar-EG');
      let hasArabic: boolean = false;
      for (let i: int = 0; i < r.length; i++) {
        let cp: number = r.charCodeAt(i);
        if (cp >= 0x0660 && cp <= 0x0669) {
          hasArabic = true;
          break;
        }
      }
      expect(hasArabic).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0260
     * @tc.name int32ArrayToLocaleStringPart01Test026
     * @tc.desc Verify locales='hi-IN' 10000000 en-US
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10000000);
      let r: string = arr.toLocaleString('hi-IN');
      expect(r).assertEqual('1,00,00,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0270
     * @tc.name int32ArrayToLocaleStringPart01Test027
     * @tc.desc Verify 'en' 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString('en');
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0280
     * @tc.name int32ArrayToLocaleStringPart01Test028
     * @tc.desc Verify 'EN-US' 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString('EN-US');
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0290
     * @tc.name int32ArrayToLocaleStringPart01Test029
     * @tc.desc Verify script 'zh-Hans-CN' 5678
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5678);
      let r: string = arr.toLocaleString('zh-Hans-CN');
      expect(r).assertEqual('5,678');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayToLocaleStringPart01Test030
     * @tc.desc Verify nu-latn 'en-US-u-nu-latn' 1234 '1,234'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1234);
      let r: string = arr.toLocaleString('en-US-u-nu-latn');
      expect(r).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0310
     * @tc.name int32ArrayToLocaleStringPart01Test031
     * @tc.desc Verify nu-hanidec 'zh-Hans-CN-u-nu-hanidec' 123 0-9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(123);
      let r: string = arr.toLocaleString('zh-Hans-CN-u-nu-hanidec');
      let hasLatin: boolean = false;
      for (let i: int = 0; i < r.length; i++) {
        let cp: number = r.charCodeAt(i);
        if (cp >= 0x30 && cp <= 0x39) {
          hasLatin = true;
          break;
        }
      }
      expect(hasLatin).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0320
     * @tc.name int32ArrayToLocaleStringPart01Test032
     * @tc.desc Verify nu-arab 'ar-SA-u-nu-arab' 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(50);
      let r: string = arr.toLocaleString('ar-SA-u-nu-arab');
      let hasArabicDigit: boolean = false;
      for (let i: int = 0; i < r.length; i++) {
        let cp: number = r.charCodeAt(i);
        if (cp >= 0x0660 && cp <= 0x0669) {
          hasArabicDigit = true;
          break;
        }
      }
      expect(hasArabicDigit).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0330
     * @tc.name int32ArrayToLocaleStringPart01Test033
     * @tc.desc Verify locale tag 'xyz' is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: string = arr.toLocaleString('xyz');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0340
     * @tc.name int32ArrayToLocaleStringPart01Test034
     * @tc.desc Verify locale tag 'not-a-real-locale' is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let r: string = arr.toLocaleString('not-a-real-locale');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0350
     * @tc.name int32ArrayToLocaleStringPart01Test035
     * @tc.desc Verify locales='' RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString('');
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        thrown = e.name;
      }
      expect(thrown).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0360
     * @tc.name int32ArrayToLocaleStringPart01Test036
     * @tc.desc Verify locales='123' RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString('123');
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
        thrown = e.name;
      }
      expect(thrown).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0370
     * @tc.name int32ArrayToLocaleStringPart01Test037
     * @tc.desc Verify a null locale cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString(null as Object as string);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        thrown = e.name;
      }
      expect(thrown).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0380
     * @tc.name int32ArrayToLocaleStringPart01Test038
     * @tc.desc Verify a numeric locale cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString(123 as Object as string);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        thrown = e.name;
      }
      expect(thrown).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0390
     * @tc.name int32ArrayToLocaleStringPart01Test039
     * @tc.desc Verify a boolean locale cast throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString(true as Object as string);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        thrown = e.name;
      }
      expect(thrown).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayToLocaleStringPart01Test040
     * @tc.desc Verify locales=['en-US'] 'en-US' 1000 '1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let rArr: string = arr.toLocaleString(['en-US']);
      let rStr: string = arr.toLocaleString('en-US');
      expect(rArr).assertEqual(rStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0410
     * @tc.name int32ArrayToLocaleStringPart01Test041
     * @tc.desc Verify locales=['de-DE','en-US'] de-DE '.'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString(['de-DE', 'en-US']);
      expect(r).assertEqual('1.000.000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0420
     * @tc.name int32ArrayToLocaleStringPart01Test042
     * @tc.desc Verify locales=['zz-ZZ','en-US'] en-US ','
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let r: string = arr.toLocaleString(['zz-ZZ', 'en-US']);
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0430
     * @tc.name int32ArrayToLocaleStringPart01Test043
     * @tc.desc Verify locales=[] locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r1: string = arr.toLocaleString();
      let r2: string = arr.toLocaleString(new Array<string>());
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0440
     * @tc.name int32ArrayToLocaleStringPart01Test044
     * @tc.desc Verify locales=['en-US','en-US'] 'en-US'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1234);
      let r1: string = arr.toLocaleString('en-US');
      let r2: string = arr.toLocaleString(['en-US', 'en-US']);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0450
     * @tc.name int32ArrayToLocaleStringPart01Test045
     * @tc.desc Verify locales=['fr-FR','de-DE','en-US'] fr-FR
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let r: string = arr.toLocaleString(['fr-FR', 'de-DE', 'en-US']);
      expect(r.replace(new RegExp('\\D', 'g'), '')).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0460
     * @tc.name int32ArrayToLocaleStringPart01Test046
     * @tc.desc Verify an unsupported locale list is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString(['zz-ZZ', 'xx-XX']);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0470
     * @tc.name int32ArrayToLocaleStringPart01Test047
     * @tc.desc Verify locales=['en-US']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let r: string = arr.toLocaleString(['en-US']);
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0480
     * @tc.name int32ArrayToLocaleStringPart01Test048
     * @tc.desc Verify options=undefined locales
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let r1: string = arr.toLocaleString('en-US');
      let r2: string = arr.toLocaleString('en-US', undefined);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0490
     * @tc.name int32ArrayToLocaleStringPart01Test049
     * @tc.desc Verify options 'en-US' 1000 '1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let r: string = arr.toLocaleString('en-US', new Empty());
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayToLocaleStringPart01Test050
     * @tc.desc Verify useGrouping=true 'en-US' 1000000 contains ','
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let __g = new GroupOn();
      let r: string = arr.toLocaleString('en-US', __g);
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0510
     * @tc.name int32ArrayToLocaleStringPart01Test051
     * @tc.desc Verify useGrouping=false 'en-US' 1000000 does not contain ','
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let options: Intl.NumberFormatOptions = { useGrouping: false };
      let r: string = arr.toLocaleString('en-US', options);
      expect(r.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0520
     * @tc.name int32ArrayToLocaleStringPart01Test052
     * @tc.desc Verify useGrouping=false 'en-US' 1000 equals '1000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let options: Intl.NumberFormatOptions = { useGrouping: false };
      let r: string = arr.toLocaleString('en-US', options);
      expect(r).assertEqual('1000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0530
     * @tc.name int32ArrayToLocaleStringPart01Test053
     * @tc.desc Verify useGrouping='min2' 'en-US' 100 equals '100'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100);
      let __o = new O();
      __o.useGrouping = true;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0540
     * @tc.name int32ArrayToLocaleStringPart01Test054
     * @tc.desc Verify useGrouping='min2' 'en-US' 1000 equals '1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let __o = new O();
      __o.useGrouping = true;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0550
     * @tc.name int32ArrayToLocaleStringPart01Test055
     * @tc.desc Verify options.useGrouping='always' 'en-US' 100 '100'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100);
      let __o = new O();
      __o.useGrouping = true;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.replace(new RegExp('\\D', 'g'), '')).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0560
     * @tc.name int32ArrayToLocaleStringPart01Test056
     * @tc.desc Verify options 1 useGrouping 'en-US' 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let __o = new O();
      __o.useGrouping = true;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0570
     * @tc.name int32ArrayToLocaleStringPart01Test057
     * @tc.desc Verify options.style='decimal' 'en-US' 42 '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.style = 'decimal';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0580
     * @tc.name int32ArrayToLocaleStringPart01Test058
     * @tc.desc Verify options.style='percent' 'en-US' 1 '%'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let __o = new O();
      __o.style = 'percent';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('%') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0590
     * @tc.name int32ArrayToLocaleStringPart01Test059
     * @tc.desc Verify options.style='percent' 'en-US' 0 '0' '%'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let __o = new O();
      __o.style = 'percent';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayToLocaleStringPart01Test060
     * @tc.desc Verify options.style='percent' useGrouping=false 'en-US' 50 '50'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(50);
      let __o = new O();
      __o.style = 'percent';
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.replace(new RegExp('[^\\d-]', 'g'), '')).assertEqual('50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0610
     * @tc.name int32ArrayToLocaleStringPart01Test061
     * @tc.desc Verify options.style='currency' currency='USD' 'en-US' 1 '$'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'USD';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('$') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0620
     * @tc.name int32ArrayToLocaleStringPart01Test062
     * @tc.desc Verify options.style='currency' currency='USD' 'en-US' -1 '$'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'USD';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0630
     * @tc.name int32ArrayToLocaleStringPart01Test063
     * @tc.desc Verify options.style='currency' currency='EUR' 'de-DE' 1000 ' '
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'EUR';
      let r: string = arr.toLocaleString('de-DE', __o);
      expect(r.indexOf('€') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0640
     * @tc.name int32ArrayToLocaleStringPart01Test064
     * @tc.desc Verify options.style='currency' currency='JPY' 'ja-JP' 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'JPY';
      let r: string = arr.toLocaleString('ja-JP', __o);
      expect(r.indexOf('￥') >= 0 || r.indexOf('¥') >= 0 || r.indexOf('JPY') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0650
     * @tc.name int32ArrayToLocaleStringPart01Test065
     * @tc.desc Verify options.currencyDisplay='code' style='currency' currency='USD' 'en-US' 'USD'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'USD';
      __o.currencyDisplay = 'code';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('USD') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0660
     * @tc.name int32ArrayToLocaleStringPart01Test066
     * @tc.desc Verify options.minimumIntegerDigits=5 useGrouping=false 'en-US' 42 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.minimumIntegerDigits = 5;
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0670
     * @tc.name int32ArrayToLocaleStringPart01Test067
     * @tc.desc Verify options.minimumIntegerDigits=1 useGrouping=false 'en-US' 42 '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.minimumIntegerDigits = 1;
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0680
     * @tc.name int32ArrayToLocaleStringPart01Test068
     * @tc.desc Verify options.minimumFractionDigits=2 is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let __o = new O();
      __o.minimumFractionDigits = 2;
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0690
     * @tc.name int32ArrayToLocaleStringPart01Test069
     * @tc.desc Verify options.maximumFractionDigits=0 'en-US' 1 '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let __o = new O();
      __o.maximumFractionDigits = 0;
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('.') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayToLocaleStringPart01Test070
     * @tc.desc Verify options.notation='scientific' is accepted and output remains grouped '1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let __o = new O();
      __o.notation = 'scientific';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0710
     * @tc.name int32ArrayToLocaleStringPart01Test071
     * @tc.desc Verify options.notation='engineering' 'en-US' 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10000);
      let __o = new O();
      __o.notation = 'engineering';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('10,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0720
     * @tc.name int32ArrayToLocaleStringPart01Test072
     * @tc.desc Verify options.notation='compact' 'en-US' 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let __o = new O();
      __o.notation = 'compact';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0730
     * @tc.name int32ArrayToLocaleStringPart01Test073
     * @tc.desc Verify options.notation='compact' compactDisplay='long' 'en-US' 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let __o = new O();
      __o.notation = 'compact';
      __o.compactDisplay = 'long';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0740
     * @tc.name int32ArrayToLocaleStringPart01Test074
     * @tc.desc Verify options.signDisplay='always' useGrouping=false 'en-US' 42 '+'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.signDisplay = 'always';
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('+') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0750
     * @tc.name int32ArrayToLocaleStringPart01Test075
     * @tc.desc Verify options.signDisplay='never' useGrouping=false 'en-US' -42 '-'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-42);
      let __o = new O();
      __o.signDisplay = 'never';
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('-') < 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0760
     * @tc.name int32ArrayToLocaleStringPart01Test076
     * @tc.desc Verify options.signDisplay='exceptZero' useGrouping=false 'en-US' 0 '+'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let __o = new O();
      __o.signDisplay = 'exceptZero';
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('+') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0770
     * @tc.name int32ArrayToLocaleStringPart01Test077
     * @tc.desc Verify options 'en-US' 1000 '1,000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let __o = new O();
      __o.notARealOption = 'ignored';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0780
     * @tc.name int32ArrayToLocaleStringPart01Test078
     * @tc.desc Verify toLocaleString with en-US grouping options does not mutate source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000, 2000, 3000);
      let __g = new GroupOn();
      arr.toLocaleString('en-US', __g);
      expect(arr.$_get(0)).assertEqual(1000);
      expect(arr.$_get(1)).assertEqual(2000);
      expect(arr.$_get(2)).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0790
     * @tc.name int32ArrayToLocaleStringPart01Test079
     * @tc.desc Verify null options throw ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        arr.toLocaleString('en-US', null as Object);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
        thrown = e.name;
      }
      expect(thrown).assertEqual('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayToLocaleStringPart01Test080
     * @tc.desc Verify an unsupported style option is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.style = 'bogus';
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0810
     * @tc.name int32ArrayToLocaleStringPart01Test081
     * @tc.desc Verify an unsupported currency option is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.style = 'currency';
        __o.currency = 'bogus';
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0820
     * @tc.name int32ArrayToLocaleStringPart01Test082
     * @tc.desc Verify useGrouping=false is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.useGrouping = false;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0830
     * @tc.name int32ArrayToLocaleStringPart01Test083
     * @tc.desc Verify minimumFractionDigits=-1 is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumFractionDigits = -1;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0840
     * @tc.name int32ArrayToLocaleStringPart01Test084
     * @tc.desc Verify minimumFractionDigits=21 is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumFractionDigits = 21;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0850
     * @tc.name int32ArrayToLocaleStringPart01Test085
     * @tc.desc Verify options.minimumFractionDigits=2.7 is accepted and output remains '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.minimumFractionDigits = 2.7;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0860
     * @tc.name int32ArrayToLocaleStringPart01Test086
     * @tc.desc Verify minimumFractionDigits=NaN is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumFractionDigits = Number.NaN;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0870
     * @tc.name int32ArrayToLocaleStringPart01Test087
     * @tc.desc Verify minimumFractionDigits=positive infinity is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumFractionDigits = Number.POSITIVE_INFINITY;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0880
     * @tc.name int32ArrayToLocaleStringPart01Test088
     * @tc.desc Verify minimumIntegerDigits=0 is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumIntegerDigits = 0;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0890
     * @tc.name int32ArrayToLocaleStringPart01Test089
     * @tc.desc Verify minimumIntegerDigits=22 is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumIntegerDigits = 22;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayToLocaleStringPart01Test090
     * @tc.desc Verify inverted fraction digit limits are accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.minimumFractionDigits = 5;
        __o.maximumFractionDigits = 2;
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0910
     * @tc.name int32ArrayToLocaleStringPart01Test091
     * @tc.desc Verify options.localeMatcher='lookup' 'en-US' 1234 '1,234'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1234);
      let __o = new O();
      __o.localeMatcher = 'lookup';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,234');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0920
     * @tc.name int32ArrayToLocaleStringPart01Test092
     * @tc.desc Verify an unsupported localeMatcher is accepted without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let thrown: string = '';
      try {
        let __o = new O();
        __o.localeMatcher = 'bogus';
        arr.toLocaleString('en-US', __o);
      } catch (e) {
        expect(e.name).assertEqual('');
        thrown = e.name;
      }
      expect(thrown).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0930
     * @tc.name int32ArrayToLocaleStringPart01Test093
     * @tc.desc Verify 0 'en-US' useGrouping:false '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let __f = new GroupOff();
      let r: string = arr.toLocaleString('en-US', __f);
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0940
     * @tc.name int32ArrayToLocaleStringPart01Test094
     * @tc.desc Verify -0 Int32 0 'en-US' useGrouping:false '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      arr.$_set(0, 0);
      let __f = new GroupOff();
      let r: string = arr.toLocaleString('en-US', __f);
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0950
     * @tc.name int32ArrayToLocaleStringPart01Test095
     * @tc.desc Verify [-2147483648, 0, 2147483647] 'en-US' useGrouping:true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      let __g = new GroupOn();
      let r: string = arr.toLocaleString('en-US', __g);
      expect(r).assertEqual('-2,147,483,648,0,2,147,483,647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0960
     * @tc.name int32ArrayToLocaleStringPart01Test096
     * @tc.desc Verify 0 [0,0,0] 'en-US' split(',')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, 0, 0);
      let r: string = arr.toLocaleString('en-US');
      let parts: string[] = r.split(',');
      expect(parts.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0970
     * @tc.name int32ArrayToLocaleStringPart01Test097
     * @tc.desc Verify 42 minimumSignificantDigits=3 useGrouping=false 'en-US' 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let __o = new O();
      __o.minimumSignificantDigits = 3;
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.replace(new RegExp('\\D', 'g'), '').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0980
     * @tc.name int32ArrayToLocaleStringPart01Test098
     * @tc.desc Verify 1234 maximumSignificantDigits=2 useGrouping=false 'en-US' 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1234);
      let __o = new O();
      __o.maximumSignificantDigits = 2;
      __o.useGrouping = false;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.replace(new RegExp('\\D', 'g'), '').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_0990
     * @tc.name int32ArrayToLocaleStringPart01Test099
     * @tc.desc Verify locales=undefined options.useGrouping=false returns ungrouped '1000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000);
      let options: Intl.NumberFormatOptions = { useGrouping: false };
      let r: string = arr.toLocaleString(undefined, options);
      expect(r.replace(new RegExp('\\D', 'g'), '')).assertEqual('1000');
      expect(r.indexOf(',') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayToLocaleStringPart01Test100
     * @tc.desc Verify 'de-DE' useGrouping=false returns locale-grouped '1.000.000'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart01Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1000000);
      let __f = new GroupOff();
      let r: string = arr.toLocaleString('de-DE', __f);
      expect(r).assertEqual('1.000.000');
    });



  });
}
