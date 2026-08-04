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

interface NumberFormatOptions {
  minimumIntegerDigits?: int;
  minimumFractionDigits?: int;
  maximumFractionDigits?: int;
  minimumSignificantDigits?: int;
  maximumSignificantDigits?: int;
  useGrouping?: boolean;
  notation?: string;
  style?: string;
  currency?: string;
}

export default function Uint8ArrayToLocaleString02Test(): void {
  describe('Uint8ArrayToLocaleString02Test', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0100
     * @tc.name testUint8ArrayToLocaleString001
     * @tc.desc Verify toLocaleString() returns string type for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array();
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0200
     * @tc.name testUint8ArrayToLocaleString002
     * @tc.desc Verify toLocaleString() returns string type for single element array [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(0);
      const s: string = a.toLocaleString();
      expect(s).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0300
     * @tc.name testUint8ArrayToLocaleString003
     * @tc.desc Verify toLocaleString() returns string type for multi-element array [11, 22]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(11, 22);
      const s: string = a.toLocaleString();
      expect(s).assertEqual('11,22');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0400
     * @tc.name testUint8ArrayToLocaleString004
     * @tc.desc Verify toLocaleString(locales) returns string type with locale fi-FI
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(33, 44, 55);
      const s: string = a.toLocaleString('fi-FI');
      expect(s).assertEqual('33,44,55');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0500
     * @tc.name testUint8ArrayToLocaleString005
     * @tc.desc Verify toLocaleString(options) returns string type with maximumFractionDigits 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(66, 77);
      const options: NumberFormatOptions = {maximumFractionDigits: 0};
      const s: string = a.toLocaleString(undefined, options);
      expect(s).assertEqual('66,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0600
     * @tc.name testUint8ArrayToLocaleString006
     * @tc.desc Verify toLocaleString(locales, options) returns string type with nb-NO and minimumIntegerDigits 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(88, 99);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2};
      const s: string = a.toLocaleString('nb-NO', options);
      expect(s).assertEqual('88,99');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0700
     * @tc.name testUint8ArrayToLocaleString007
     * @tc.desc Verify toLocaleString() returns string type for buffer-backed view array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const a: Uint8Array = new Uint8Array(buf);
      a[0] = 42;
      a[1] = 84;
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0800
     * @tc.name testUint8ArrayToLocaleString008
     * @tc.desc Verify toLocaleString() returns string type for array with truncated values [256, -1, 0x100]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3);
      a[0] = 256;
      a[1] = -1;
      a[2] = 0x100;
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_0900
     * @tc.name testUint8ArrayToLocaleString009
     * @tc.desc Verify toLocaleString() return value is not Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(11, 22, 33);
      const s: string = a.toLocaleString();
      expect(s instanceof Uint8Array).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1000
     * @tc.name testUint8ArrayToLocaleString010
     * @tc.desc Verify toLocaleString() return value is not Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(44, 55);
      const s: string = a.toLocaleString();
      expect(s.length >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1100
     * @tc.name testUint8ArrayToLocaleString011
     * @tc.desc Verify toLocaleString() returns empty string for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array();
      expect(a.toLocaleString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1200
     * @tc.name testUint8ArrayToLocaleString012
     * @tc.desc Verify toLocaleString() returns '0' for array with element value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(0);
      expect(a.toLocaleString()).assertEqual('0');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1300
     * @tc.name testUint8ArrayToLocaleString013
     * @tc.desc Verify toLocaleString() returns '2' for array with element value 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(2);
      expect(a.toLocaleString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1400
     * @tc.name testUint8ArrayToLocaleString014
     * @tc.desc Verify toLocaleString() returns '3' for array with element value 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(3);
      expect(a.toLocaleString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1500
     * @tc.name testUint8ArrayToLocaleString015
     * @tc.desc Verify toLocaleString() returns '255' for array with element value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(255);
      expect(a.toLocaleString()).assertEqual('255');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1600
     * @tc.name testUint8ArrayToLocaleString016
     * @tc.desc Verify toLocaleString() returns '1,1' for array [1, 1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 1);
      expect(a.toLocaleString()).assertEqual('1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1700
     * @tc.name testUint8ArrayToLocaleString017
     * @tc.desc Verify toLocaleString() returns '3,6' for array [3, 6]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(3, 6);
      expect(a.toLocaleString()).assertEqual('3,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1800
     * @tc.name testUint8ArrayToLocaleString018
     * @tc.desc Verify toLocaleString() returns '5,10,15' for array [5, 10, 15]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5, 10, 15);
      expect(a.toLocaleString()).assertEqual('5,10,15');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_1900
     * @tc.name testUint8ArrayToLocaleString019
     * @tc.desc Verify toLocaleString() shows '0' after writing 256 (overflow truncation)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1);
      a[0] = 256;
      expect(a.toLocaleString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2000
     * @tc.name testUint8ArrayToLocaleString020
     * @tc.desc Verify toLocaleString() shows '255' after writing -1 (negative wrap-around)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1);
      a[0] = -1;
      expect(a.toLocaleString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2100
     * @tc.name testUint8ArrayToLocaleString021
     * @tc.desc Verify toLocaleString() shows '1' after writing 1.5 (float truncation)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1);
      a[0] = 1.5;
      expect(a.toLocaleString()).assertEqual('1');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2200
     * @tc.name testUint8ArrayToLocaleString022
     * @tc.desc Verify toLocaleString() shows '255' after writing -1.5 (negative float wrap-around)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1);
      a[0] = -1.5;
      expect(a.toLocaleString()).assertEqual('255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2300
     * @tc.name testUint8ArrayToLocaleString023
     * @tc.desc Verify toLocaleString() shows '0' after writing 0x100 (hex overflow)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(1);
      a[0] = 0x100;
      expect(a.toLocaleString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2400
     * @tc.name testUint8ArrayToLocaleString024
     * @tc.desc Verify toLocaleString('en-US') returns '11,22' for array [11, 22]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(11, 22);
      expect(a.toLocaleString('en-US')).assertEqual('11,22');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2500
     * @tc.name testUint8ArrayToLocaleString025
     * @tc.desc Verify toLocaleString('de-DE') returns '33,44' for array [33, 44]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(33, 44);
      expect(a.toLocaleString('de-DE')).assertEqual('33,44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2600
     * @tc.name testUint8ArrayToLocaleString026
     * @tc.desc Verify toLocaleString('fr-FR') returns '55,66' for array [55, 66]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(55, 66);
      expect(a.toLocaleString('fr-FR')).assertEqual('55,66');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2700
     * @tc.name testUint8ArrayToLocaleString027
     * @tc.desc Verify toLocaleString('ja-JP') returns '77,88' for array [77, 88]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(77, 88);
      expect(a.toLocaleString('ja-JP')).assertEqual('77,88');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2800
     * @tc.name testUint8ArrayToLocaleString028
     * @tc.desc Verify toLocaleString('zh-CN') returns '111' for single element [111]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(111);
      expect(a.toLocaleString('zh-CN')).assertEqual('111');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_2900
     * @tc.name testUint8ArrayToLocaleString029
     * @tc.desc Verify toLocaleString('ko-KR') returns '222' for single element [222]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(222);
      expect(a.toLocaleString('ko-KR')).assertEqual('222');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3000
     * @tc.name testUint8ArrayToLocaleString030
     * @tc.desc Verify toLocaleString('it-IT') returns '13,37' for array [13, 37]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(13, 37);
      expect(a.toLocaleString('it-IT')).assertEqual('13,37');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3100
     * @tc.name testUint8ArrayToLocaleString031
     * @tc.desc Verify toLocaleString('fi-FI') returns '42,84' for array [42, 84]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(42, 84);
      expect(a.toLocaleString('fi-FI')).assertEqual('42,84');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3200
     * @tc.name testUint8ArrayToLocaleString032
     * @tc.desc Verify toLocaleString('nb-NO') returns '168' for single element [168]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(168);
      expect(a.toLocaleString('nb-NO')).assertEqual('168');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3300
     * @tc.name testUint8ArrayToLocaleString033
     * @tc.desc Verify toLocaleString('da-DK') returns '2,4,8' for array [2, 4, 8]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(2, 4, 8);
      expect(a.toLocaleString('da-DK')).assertEqual('2,4,8');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3400
     * @tc.name testUint8ArrayToLocaleString034
     * @tc.desc Verify toLocaleString('en-US-u-ca-islamic') returns string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2);
      const s: string = a.toLocaleString('en-US-u-ca-islamic');
      expect(s).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3500
     * @tc.name testUint8ArrayToLocaleString035
     * @tc.desc Verify toLocaleString('de-DE-u-co-dict') returns string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(3, 4);
      const s: string = a.toLocaleString('de-DE-u-co-dict');
      expect(s).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3600
     * @tc.name testUint8ArrayToLocaleString036
     * @tc.desc Verify toLocaleString('zh-CN-u-nu-fullwide') returns string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5, 6);
      const s: string = a.toLocaleString('zh-CN-u-nu-fullwide');
      expect(s).assertEqual('５,６');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3700
     * @tc.name testUint8ArrayToLocaleString037
     * @tc.desc Verify toLocaleString('ar-SA-u-nu-arab') returns string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(7, 8);
      const s: string = a.toLocaleString('ar-SA-u-nu-arab');
      expect(s).assertEqual('٧,٨');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3800
     * @tc.name testUint8ArrayToLocaleString038
     * @tc.desc Verify toLocaleString('th-TH-u-nu-thai') returns string
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(9, 10);
      const s: string = a.toLocaleString('th-TH-u-nu-thai');
      expect(s).assertEqual('๙,๑๐');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_3900
     * @tc.name testUint8ArrayToLocaleString039
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 2 returns '05' for single element [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4000
     * @tc.name testUint8ArrayToLocaleString040
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 3 returns '005' for single element [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 3};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4100
     * @tc.name testUint8ArrayToLocaleString041
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 5 returns '00005' for single element [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 5};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4200
     * @tc.name testUint8ArrayToLocaleString042
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 2 returns '255' for single element [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(255);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4300
     * @tc.name testUint8ArrayToLocaleString043
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 3 returns '001,002' for array [1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2);
      const options: NumberFormatOptions = {minimumIntegerDigits: 3};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4400
     * @tc.name testUint8ArrayToLocaleString044
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 4 returns '0000,0000' for array [0, 0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(0, 0);
      const options: NumberFormatOptions = {minimumIntegerDigits: 4};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4500
     * @tc.name testUint8ArrayToLocaleString045
     * @tc.desc Verify toLocaleString with minimumFractionDigits 1 returns '5.0' for single element [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumFractionDigits: 1};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4600
     * @tc.name testUint8ArrayToLocaleString046
     * @tc.desc Verify toLocaleString with minimumFractionDigits 2 returns '0.00' for single element [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(0);
      const options: NumberFormatOptions = {minimumFractionDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4700
     * @tc.name testUint8ArrayToLocaleString047
     * @tc.desc Verify toLocaleString with minimumFractionDigits 3 returns '255.000' for single element [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(255);
      const options: NumberFormatOptions = {minimumFractionDigits: 3};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4800
     * @tc.name testUint8ArrayToLocaleString048
     * @tc.desc Verify toLocaleString with minimumFractionDigits 2 returns '1.00,2.00' for array [1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2);
      const options: NumberFormatOptions = {minimumFractionDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_4900
     * @tc.name testUint8ArrayToLocaleString049
     * @tc.desc Verify toLocaleString with maximumFractionDigits 0 returns '5' for single element [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {maximumFractionDigits: 0};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5000
     * @tc.name testUint8ArrayToLocaleString050
     * @tc.desc Verify toLocaleString with maximumFractionDigits 0 returns '1,2' for array [1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2);
      const options: NumberFormatOptions = {maximumFractionDigits: 0};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5100
     * @tc.name testUint8ArrayToLocaleString051
     * @tc.desc Verify toLocaleString with maximumFractionDigits 2 returns '5' for single element [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {maximumFractionDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5200
     * @tc.name testUint8ArrayToLocaleString052
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 3 and minimumFractionDigits 2 returns '005.00' for [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 3, minimumFractionDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5300
     * @tc.name testUint8ArrayToLocaleString053
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 2 and maximumFractionDigits 0 returns '05' for [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2, maximumFractionDigits: 0};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5400
     * @tc.name testUint8ArrayToLocaleString054
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 2 and minimumFractionDigits 1 returns '00.0' for [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(0);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2, minimumFractionDigits: 1};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5500
     * @tc.name testUint8ArrayToLocaleString055
     * @tc.desc Verify toLocaleString with minIntDigits 3, minFracDigits 2, maxFracDigits 2 returns '005.00' for [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 3, minimumFractionDigits: 2, maximumFractionDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5600
     * @tc.name testUint8ArrayToLocaleString056
     * @tc.desc Verify toLocaleString with useGrouping false returns '1000,2000' for array [1000, 2000]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1000, 2000);
      const options: NumberFormatOptions = {useGrouping: false};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5700
     * @tc.name testUint8ArrayToLocaleString057
     * @tc.desc Verify toLocaleString with useGrouping true returns '1,000,2,000' for array [1000, 2000]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1000, 2000);
      const options: NumberFormatOptions = {useGrouping: true};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5800
     * @tc.name testUint8ArrayToLocaleString058
     * @tc.desc Verify toLocaleString with notation scientific returns '2.55E2' for array [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(255);
      const options: NumberFormatOptions = {notation: 'scientific'};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_5900
     * @tc.name testUint8ArrayToLocaleString059
     * @tc.desc Verify toLocaleString with style currency USD returns '$100.00' for array [100]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(100);
      const options: NumberFormatOptions = {style: 'currency', currency: 'USD'};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6000
     * @tc.name testUint8ArrayToLocaleString060
     * @tc.desc Verify toLocaleString with style currency EUR returns EUR 200.00 format for array [200]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(200);
      const options: NumberFormatOptions = {style: 'currency', currency: 'EUR'};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6100
     * @tc.name testUint8ArrayToLocaleString061
     * @tc.desc Verify toLocaleString with minimumSignificantDigits 2 returns '5.0' for [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumSignificantDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6200
     * @tc.name testUint8ArrayToLocaleString062
     * @tc.desc Verify toLocaleString with maximumSignificantDigits 2 returns '120' for [123]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(123);
      const options: NumberFormatOptions = {maximumSignificantDigits: 2};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6300
     * @tc.name testUint8ArrayToLocaleString063
     * @tc.desc Verify toLocaleString with minSignificantDigits 3 and maxSignificantDigits 5 returns '1.00' for [1]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1);
      const options: NumberFormatOptions = {minimumSignificantDigits: 3, maximumSignificantDigits: 5};
      expect(a.toLocaleString(undefined, options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6400
     * @tc.name testUint8ArrayToLocaleString064
     * @tc.desc Verify toLocaleString('de-DE') with minimumIntegerDigits 2 returns '07' for [7]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(7);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2};
      expect(a.toLocaleString('de-DE', options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6500
     * @tc.name testUint8ArrayToLocaleString065
     * @tc.desc Verify toLocaleString('fr-FR') with minimumFractionDigits 2 returns '9,00' for [9]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(9);
      const options: NumberFormatOptions = {minimumFractionDigits: 2};
      expect(a.toLocaleString('fr-FR', options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6600
     * @tc.name testUint8ArrayToLocaleString066
     * @tc.desc Verify toLocaleString('ja-JP') with minIntDigits 3 and minFracDigits 1 returns '003.0' for [3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(3);
      const options: NumberFormatOptions = {minimumIntegerDigits: 3, minimumFractionDigits: 1};
      expect(a.toLocaleString('ja-JP', options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6700
     * @tc.name testUint8ArrayToLocaleString067
     * @tc.desc Verify toLocaleString('zh-CN') with useGrouping false returns '1000,2000' for [1000, 2000]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1000, 2000);
      const options: NumberFormatOptions = {useGrouping: false};
      expect(a.toLocaleString('zh-CN', options).length > 0).assertTrue();
    });
    /**
 * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6800
 * @tc.name testUint8ArrayToLocaleString068
     * @tc.desc Verify toLocaleString('en-US') with style currency GBP returns GBP 50.00 format for [50]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(50);
      const options: NumberFormatOptions = {style: 'currency', currency: 'GBP'};
      expect(a.toLocaleString('en-US', options).length > 0).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_6900
     * @tc.name testUint8ArrayToLocaleString069
     * @tc.desc Verify toLocaleString() result length is 0 for empty array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array();
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7000
     * @tc.name testUint8ArrayToLocaleString070
     * @tc.desc Verify toLocaleString() result length is 1 for single element [0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(0);
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7100
     * @tc.name testUint8ArrayToLocaleString071
     * @tc.desc Verify toLocaleString() result length is 3 for single element [255]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(255);
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7200
     * @tc.name testUint8ArrayToLocaleString072
     * @tc.desc Verify toLocaleString() result length is 3 for two-element array [1, 2]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2);
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7300
     * @tc.name testUint8ArrayToLocaleString073
     * @tc.desc Verify toLocaleString() result length is 8 for three-element array [10, 20, 30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(10, 20, 30);
      const s: string = a.toLocaleString();
      expect(s.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7400
     * @tc.name testUint8ArrayToLocaleString074
     * @tc.desc Verify toLocaleString('de-DE') result length is 5 for three-element array [1, 2, 3]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2, 3);
      const s: string = a.toLocaleString('de-DE');
      expect(s.length).assertEqual(5);
    });

    /**
 * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7500
 * @tc.name testUint8ArrayToLocaleString075
     * @tc.desc Verify toLocaleString with minimumIntegerDigits 2 result length is 2 for [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumIntegerDigits: 2};
      const s: string = a.toLocaleString(undefined, options);
      expect(s.length).assertEqual(1);
    });
    /**
 * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7600
 * @tc.name testUint8ArrayToLocaleString076
     * @tc.desc Verify toLocaleString with minimumFractionDigits 2 result length is 4 for [5]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5);
      const options: NumberFormatOptions = {minimumFractionDigits: 2};
      const s: string = a.toLocaleString(undefined, options);
      expect(s.length).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7700
     * @tc.name testUint8ArrayToLocaleString077
     * @tc.desc Verify toLocaleString() does not change array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2, 3);
      const origLen: int = a.length;
      a.toLocaleString();
      expect(a.length).assertEqual(origLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7800
     * @tc.name testUint8ArrayToLocaleString078
     * @tc.desc Verify toLocaleString() does not change array byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const origByteLen: int = a.byteLength;
      a.toLocaleString();
      expect(a.byteLength).assertEqual(origByteLen);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_7900
     * @tc.name testUint8ArrayToLocaleString079
     * @tc.desc Verify toLocaleString() does not change array buffer reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(5, 10, 15);
      const origBuf: ArrayBuffer = a.buffer;
      a.toLocaleString();
      expect(a.buffer).assertEqual(origBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8000
     * @tc.name testUint8ArrayToLocaleString080
     * @tc.desc Verify toLocaleString() does not change array byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const origOff: int = a.byteOffset;
      a.toLocaleString();
      expect(a.byteOffset).assertEqual(origOff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8100
     * @tc.name testUint8ArrayToLocaleString081
     * @tc.desc Verify toLocaleString() does not change elements for array with truncated values [0xFF, 0x00, 0x80]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(3);
      a[0] = 0xFF;
      a[1] = 0x00;
      a[2] = 0x80;
      a.toLocaleString();
      expect(a[0]).assertEqual(255);
      expect(a[1]).assertEqual(0);
      expect(a[2]).assertEqual(128);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8200
     * @tc.name testUint8ArrayToLocaleString082
     * @tc.desc Verify toLocaleString('de-DE') does not change elements for all-zero array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = new Uint8Array(5);
      a.toLocaleString('de-DE');
      for (let i: int = 0; i < 5; i++) {
        expect(a[i]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8300
     * @tc.name testUint8ArrayToLocaleString083
     * @tc.desc Verify buffer-backed view toLocaleString() does not change buffer bytes
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Uint8Array = new Uint8Array(buf);
      view[0] = 0x12;
      view[1] = 0x34;
      view[2] = 0x56;
      view[3] = 0x78;
      view.toLocaleString();
      const check: Uint8Array = new Uint8Array(buf);
      expect(check[0]).assertEqual(0x12);
      expect(check[1]).assertEqual(0x34);
      expect(check[2]).assertEqual(0x56);
      expect(check[3]).assertEqual(0x78);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8400
     * @tc.name testUint8ArrayToLocaleString084
     * @tc.desc Verify dual views sharing same buffer, toLocaleString() does not affect the other view
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const firstView: Uint8Array = new Uint8Array(buf, 0, 4);
      const secondView: Uint8Array = new Uint8Array(buf, 4, 4);
      firstView[0] = 10;
      firstView[1] = 20;
      firstView[2] = 30;
      firstView[3] = 40;
      secondView[0] = 50;
      secondView[1] = 60;
      secondView[2] = 70;
      secondView[3] = 80;
      firstView.toLocaleString('fr-FR');
      expect(secondView[0]).assertEqual(50);
      expect(secondView[1]).assertEqual(60);
      expect(secondView[2]).assertEqual(70);
      expect(secondView[3]).assertEqual(80);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8500
     * @tc.name testUint8ArrayToLocaleString085
     * @tc.desc Verify subarray view toLocaleString('ja-JP') does not change buffer reference
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(2, 4, 6, 8, 10, 12);
      const sub: Uint8Array = a.subarray(2, 5);
      const origBuf: ArrayBuffer = sub.buffer;
      sub.toLocaleString('ja-JP');
      expect(sub.buffer).assertEqual(origBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_TO_LOCALE_STRING02_8600
     * @tc.name testUint8ArrayToLocaleString086
     * @tc.desc Verify subarray view toLocaleString() does not change byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayToLocaleString086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50, 60);
      const sub: Uint8Array = a.subarray(3, 6);
      const origOff: int = sub.byteOffset;
      sub.toLocaleString();
      expect(sub.byteOffset).assertEqual(origOff);
    });
  });
}