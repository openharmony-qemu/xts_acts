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
import Utils from './../Util.test';

export default function int8ArrayToLocaleStringPart01Test(): void {
  describe('Int8ArrayToLocaleStringPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0100
     * @tc.name int8ArrayToLocaleStringPart01Test001
     * @tc.desc Verify toLocaleString() returns empty string for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let s: string = arr.toLocaleString();
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0200
     * @tc.name int8ArrayToLocaleStringPart01Test002
     * @tc.desc Verify toLocaleString() on of()-created [0] returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let s: string = arr.toLocaleString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0300
     * @tc.name int8ArrayToLocaleStringPart01Test003
     * @tc.desc Verify toLocaleString() on [1, -2, 3] includes each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, -2, 3);
      let s: string = arr.toLocaleString();
      let r1: boolean = s.includes('1') && s.includes('-2') && s.includes('3');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0400
     * @tc.name int8ArrayToLocaleStringPart01Test004
     * @tc.desc Verify toLocaleString arity 1 locales 'en-US'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0500
     * @tc.name int8ArrayToLocaleStringPart01Test005
     * @tc.desc Verify toLocaleString arity 2 locales options,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 3 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('005');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0600
     * @tc.name int8ArrayToLocaleStringPart01Test006
     * @tc.desc Verify toLocaleString locales='en-US' 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127);
      let s: string = arr.toLocaleString('en-US');
      expect(s).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0700
     * @tc.name int8ArrayToLocaleStringPart01Test007
     * @tc.desc Verify toLocaleString locales='zh-CN' -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-128);
      let s: string = arr.toLocaleString('zh-CN');
      let r1: boolean = s.includes('128');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0800
     * @tc.name int8ArrayToLocaleStringPart01Test008
     * @tc.desc Verify toLocaleString('ja-JP') returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(0);
      let s: string = arr.toLocaleString('ja-JP');
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_0900
     * @tc.name int8ArrayToLocaleStringPart01Test009
     * @tc.desc Verify toLocaleString('de-DE') includes both elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1, 2);
      let s: string = arr.toLocaleString('de-DE');
      let r1: boolean = s.includes('1') && s.includes('2');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1000
     * @tc.name int8ArrayToLocaleStringPart01Test010
     * @tc.desc Verify toLocaleString locales='fr-FR' 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(127);
      let s: string = arr.toLocaleString('fr-FR');
      let r1: boolean = s.includes('127');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1100
     * @tc.name int8ArrayToLocaleStringPart01Test011
     * @tc.desc Verify toLocaleString locales='en-GB' 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(64);
      let s: string = arr.toLocaleString('en-GB');
      expect(s).assertEqual('64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1200
     * @tc.name int8ArrayToLocaleStringPart01Test012
     * @tc.desc Verify toLocaleString locales='ko-KR' 88
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(88);
      let s: string = arr.toLocaleString('ko-KR');
      let r1: boolean = s.includes('88');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1300
     * @tc.name int8ArrayToLocaleStringPart01Test013
     * @tc.desc Verify toLocaleString locales='ar-SA' , ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let sEn: string = arr.toLocaleString('en-US');
      let sAr: string = arr.toLocaleString('ar-SA');
      let r1: int = sAr.length;
      let e1: int = sEn.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1400
     * @tc.name int8ArrayToLocaleStringPart01Test014
     * @tc.desc Verify toLocaleString locales='th-TH' 123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(123);
      let s: string = arr.toLocaleString('th-TH');
      let r1: int = s.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1500
     * @tc.name int8ArrayToLocaleStringPart01Test015
     * @tc.desc Verify toLocaleString locales='hi-IN' returns a non-empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99);
      let s: string = arr.toLocaleString('hi-IN');
      let r1: boolean = s.length > 0;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1600
     * @tc.name int8ArrayToLocaleStringPart01Test016
     * @tc.desc Verify toLocaleString locales='ru-RU' 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(55);
      let s: string = arr.toLocaleString('ru-RU');
      let r1: boolean = s.includes('55');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1700
     * @tc.name int8ArrayToLocaleStringPart01Test017
     * @tc.desc Verify toLocaleString locales='en' ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let s: string = arr.toLocaleString('en');
      expect(s).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1800
     * @tc.name int8ArrayToLocaleStringPart01Test018
     * @tc.desc Verify toLocaleString locales='zh' ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(8);
      let s: string = arr.toLocaleString('zh');
      let r1: boolean = s.includes('8');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_1900
     * @tc.name int8ArrayToLocaleStringPart01Test019
     * @tc.desc Verify toLocaleString locales=undefined undefined locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(11);
      let s: string = arr.toLocaleString(undefined);
      let r1: boolean = s.includes('11');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2000
     * @tc.name int8ArrayToLocaleStringPart01Test020
     * @tc.desc Verify toLocaleString locales='' ( locale, )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(22);
      try {
        let s: string = arr.toLocaleString('');
        let r1: boolean = s.includes('22');
        expect(r1).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2100
     * @tc.name int8ArrayToLocaleStringPart01Test021
     * @tc.desc Verify toLocaleString locales=null throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(44);
      let loc: string | null = null;
      try {
        let s: string = arr.toLocaleString(loc as string | undefined);
        let r1: boolean = s.includes('44');
        expect(r1).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2200
     * @tc.name int8ArrayToLocaleStringPart01Test022
     * @tc.desc Verify toLocaleString locales=['en-US','zh-CN'] locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(66);
      let locs: string[] = ['en-US', 'zh-CN'];
      let s: string = arr.toLocaleString(locs);
      let r1: boolean = s.includes('66');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2300
     * @tc.name int8ArrayToLocaleStringPart01Test023
     * @tc.desc Verify toLocaleString locales=['fr-CA','fr'] fallback( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(77);
      let locs: string[] = ['fr-CA', 'fr'];
      let s: string = arr.toLocaleString(locs);
      let r1: boolean = s.includes('77');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2400
     * @tc.name int8ArrayToLocaleStringPart01Test024
     * @tc.desc Verify toLocaleString locales='en-US-u-nu-latn' Unicode
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(99);
      let s: string = arr.toLocaleString('en-US-u-nu-latn');
      expect(s).assertEqual('99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2500
     * @tc.name int8ArrayToLocaleStringPart01Test025
     * @tc.desc Verify toLocaleString locales='ar-EG-u-nu-arab' Unicode - ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let sLatn: string = arr.toLocaleString('en-US-u-nu-latn');
      let sArab: string = arr.toLocaleString('ar-EG-u-nu-arab');
      let r1: int = sArab.length;
      let e1: int = sLatn.length;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2600
     * @tc.name int8ArrayToLocaleStringPart01Test026
     * @tc.desc Verify toLocaleString locales='zh-CN-u-nu-hanidec' Unicode ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let s: string = arr.toLocaleString('zh-CN-u-nu-hanidec');
      let r1: int = s.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2700
     * @tc.name int8ArrayToLocaleStringPart01Test027
     * @tc.desc Verify toLocaleString locales='th-TH-u-nu-thai' Unicode ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7);
      let s: string = arr.toLocaleString('th-TH-u-nu-thai');
      let r1: int = s.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2800
     * @tc.name int8ArrayToLocaleStringPart01Test028
     * @tc.desc Verify toLocaleString locales ( , SDK )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(1);
      let loc: string =
        'en-US-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';
      try {
        let s: string = arr.toLocaleString(loc);
        let r1: boolean = s.includes('1');
        expect(r1).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_2900
     * @tc.name int8ArrayToLocaleStringPart01Test029
     * @tc.desc Verify toLocaleString locales=' en-US ' locale ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(2);
      try {
        let s: string = arr.toLocaleString(' en-US ');
        let r1: boolean = s.includes('2');
        expect(r1).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3000
     * @tc.name int8ArrayToLocaleStringPart01Test030
     * @tc.desc Verify toLocaleString options=undefined undefined,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let s: string = arr.toLocaleString('en-US', undefined);
      expect(s).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3100
     * @tc.name int8ArrayToLocaleStringPart01Test031
     * @tc.desc Verify toLocaleString options={} ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = {};
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3200
     * @tc.name int8ArrayToLocaleStringPart01Test032
     * @tc.desc Verify toLocaleString options=undefined throws ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions | undefined = undefined;
      try {
        let s: string = arr.toLocaleString('en-US', opts as Intl.NumberFormatOptions);
        let r1: boolean = s.includes('42');
        expect(r1).assertTrue();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3300
     * @tc.name int8ArrayToLocaleStringPart01Test033
     * @tc.desc Verify toLocaleString options={useGrouping:true} (int8 <1000 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = { useGrouping: true };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3400
     * @tc.name int8ArrayToLocaleStringPart01Test034
     * @tc.desc Verify toLocaleString with useGrouping false returns '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = { useGrouping: false };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3500
     * @tc.name int8ArrayToLocaleStringPart01Test035
     * @tc.desc Verify toLocaleString options={minimumIntegerDigits:1} 1( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 1 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3600
     * @tc.name int8ArrayToLocaleStringPart01Test036
     * @tc.desc Verify toLocaleString throws RangeError when minimumIntegerDigits is 0 outside ECMA-402 valid range [1,21]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 0 };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3700
     * @tc.name int8ArrayToLocaleStringPart01Test037
     * @tc.desc Verify toLocaleString options={minimumFractionDigits:0} 0( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 0 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3800
     * @tc.name int8ArrayToLocaleStringPart01Test038
     * @tc.desc Verify toLocaleString options={minimumFractionDigits:2} 2( .00)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_3900
     * @tc.name int8ArrayToLocaleStringPart01Test039
     * @tc.desc Verify toLocaleString options={minimumFractionDigits:5} 5( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 5 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5.00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4000
     * @tc.name int8ArrayToLocaleStringPart01Test040
     * @tc.desc Verify toLocaleString options={maximumFractionDigits:5} 5( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { maximumFractionDigits: 5 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4100
     * @tc.name int8ArrayToLocaleStringPart01Test041
     * @tc.desc Verify toLocaleString options={minimumSignificantDigits:3} 3( 3 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumSignificantDigits: 3 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4200
     * @tc.name int8ArrayToLocaleStringPart01Test042
     * @tc.desc Verify toLocaleString options={maximumSignificantDigits:1} 1(42 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = { maximumSignificantDigits: 1 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4300
     * @tc.name int8ArrayToLocaleStringPart01Test043
     * @tc.desc Verify toLocaleString options={minimumIntegerDigits:3, useGrouping:false} : +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 3, useGrouping: false };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('005');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4400
     * @tc.name int8ArrayToLocaleStringPart01Test044
     * @tc.desc Verify toLocaleString options={minimumFractionDigits:2, maximumFractionDigits:2} : 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumFractionDigits: 2, maximumFractionDigits: 2 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('5.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4500
     * @tc.name int8ArrayToLocaleStringPart01Test045
     * @tc.desc Verify toLocaleString options={minimumIntegerDigits:3, minimumFractionDigits:2} : +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 3, minimumFractionDigits: 2 };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('005.00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4600
     * @tc.name int8ArrayToLocaleStringPart01Test046
     * @tc.desc Verify toLocaleString options={notation:'standard'} ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = { notation: 'standard' };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4700
     * @tc.name int8ArrayToLocaleStringPart01Test047
     * @tc.desc Verify toLocaleString options={notation:'scientific'} (int8 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = { notation: 'scientific' };
      let s: string = arr.toLocaleString('en-US', opts);
      let r1: boolean = s.includes('4');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4800
     * @tc.name int8ArrayToLocaleStringPart01Test048
     * @tc.desc Verify toLocaleString options={signDisplay:'always'} ( +)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { signDisplay: 'always' };
      let s: string = arr.toLocaleString('en-US', opts);
      let r1: boolean = s.startsWith('+');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_4900
     * @tc.name int8ArrayToLocaleStringPart01Test049
     * @tc.desc Verify toLocaleString options={signDisplay:'never'} ( -)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(-5);
      let opts: Intl.NumberFormatOptions = { signDisplay: 'never' };
      let s: string = arr.toLocaleString('en-US', opts);
      let r1: boolean = s.includes('-');
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_5000
     * @tc.name int8ArrayToLocaleStringPart01Test050
     * @tc.desc Verify toLocaleString locales=undefined + options={minimumIntegerDigits:3} locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(5);
      let opts: Intl.NumberFormatOptions = { minimumIntegerDigits: 3 };
      let s: string = arr.toLocaleString(undefined, opts);
      let r1: boolean = s.includes('005');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_5100
     * @tc.name int8ArrayToLocaleStringPart01Test051
     * @tc.desc Verify toLocaleString locales='fr-FR' + options={useGrouping:true}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let opts: Intl.NumberFormatOptions = { useGrouping: true };
      let s: string = arr.toLocaleString('fr-FR', opts);
      let r1: boolean = s.includes('42');
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART01_TEST_5200
     * @tc.name int8ArrayToLocaleStringPart01Test052
     * @tc.desc Verify toLocaleString locales=['en-US','zh-CN'] + options={useGrouping:false} locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(42);
      let locs: string[] = ['en-US', 'zh-CN'];
      let opts: Intl.NumberFormatOptions = { useGrouping: false };
      let s: string = arr.toLocaleString(locs, opts);
      expect(s).assertEqual('42');
    });
  });
}
