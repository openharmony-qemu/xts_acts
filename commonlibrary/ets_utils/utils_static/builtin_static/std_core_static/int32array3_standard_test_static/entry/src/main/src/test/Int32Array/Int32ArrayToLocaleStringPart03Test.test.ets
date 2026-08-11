'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

class GroupOff {
  useGrouping: boolean = false;
}

class O {
  style: string = 'CURRENCY';
  currency: string = 'USD';
  notation: string = '';
  localeMatcher: string = '';
  signDisplay: string = '';
  minimumFractionDigits: number = 0;
  maximumFractionDigits: number = 0;
  minimumSignificantDigits: number = 1;
  maximumSignificantDigits: number = 1;
  minimumIntegerDigits: number = 1;
  useGrouping: boolean = false;
  currencyDisplay: string = '';
}

export default function int32ArrayToLocaleStringPart03Test(): void {
  describe('int32ArrayToLocaleStringPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayToLocaleStringPart03Test001
     * @tc.desc Verify "i" RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('i');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayToLocaleStringPart03Test002
     * @tc.desc Verify "en--US" RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('en--US');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayToLocaleStringPart03Test003
     * @tc.desc Verify "-en-US" RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('-en-US');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayToLocaleStringPart03Test004
     * @tc.desc Verify ASCII "en-US " RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('en-US ');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayToLocaleStringPart03Test005
     * @tc.desc Verify "en US" RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('en US');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayToLocaleStringPart03Test006
     * @tc.desc Verify "eN-uSx" RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('eN-uSx');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayToLocaleStringPart03Test007
     * @tc.desc Verify "en-001" UN M.49 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let r: string = arr.toLocaleString('en-001');
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayToLocaleStringPart03Test008
     * @tc.desc Verify valid locale "en-999" formats the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.toLocaleString('en-999');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayToLocaleStringPart03Test009
     * @tc.desc Verify "und" undetermined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let r1: string = arr.toLocaleString('und');
      let r2: string = arr.toLocaleString();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayToLocaleStringPart03Test010
     * @tc.desc Verify locales [undefined as string] undefined locale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([42]);
        let arrUndef: Array<string | undefined> = [undefined];
        arr.toLocaleString(arrUndef as Object as string[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayToLocaleStringPart03Test011
     * @tc.desc Verify locales [null] null TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let arrNull: Array<string | null> = [null];
      try {
        arr.toLocaleString(arrNull as Object as string[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayToLocaleStringPart03Test012
     * @tc.desc Verify locales [123 as Object as string] TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let arrNum: Array<Object> = [123];
      try {
        arr.toLocaleString(arrNum as Object as string[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayToLocaleStringPart03Test013
     * @tc.desc Verify locales [true as Object as string] TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let arrBool: Array<Object> = [true];
      try {
        arr.toLocaleString(arrBool as Object as string[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayToLocaleStringPart03Test014
     * @tc.desc Verify locales ['','en-US'] RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString(['', 'en-US']);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayToLocaleStringPart03Test015
     * @tc.desc Verify locales ['en-US','en-US','en-US']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000]);
      let rArr: string = arr.toLocaleString(['en-US', 'en-US', 'en-US']);
      let rStr: string = arr.toLocaleString('en-US');
      expect(rArr).assertEqual(rStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayToLocaleStringPart03Test016
     * @tc.desc Verify locales undefined ['en-US' , undefined]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let arr: Int32Array = new Int32Array([1000000]);
        let locs: Array<string | undefined> = [undefined, 'en-US'];
        arr.toLocaleString(locs as Object as string[]);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayToLocaleStringPart03Test017
     * @tc.desc Verify numeric options -1 are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.toLocaleString('en-US', -1 as Object);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayToLocaleStringPart03Test018
     * @tc.desc Verify numeric options 1.5 are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.toLocaleString('en-US', 1.5 as Object);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayToLocaleStringPart03Test019
     * @tc.desc Verify string options are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let r: string = arr.toLocaleString('en-US', '' as Object);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayToLocaleStringPart03Test020
     * @tc.desc Verify ArrayBuffer options are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let r: string = arr.toLocaleString('en-US', buf as Object);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayToLocaleStringPart03Test021
     * @tc.desc Verify string array options are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let sa: string[] = ['a'];
      let r: string = arr.toLocaleString('en-US', sa as Object);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayToLocaleStringPart03Test022
     * @tc.desc Verify unsupported options.style="CURRENCY" is accepted and output remains '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let __o = new O();
      __o.style = 'CURRENCY';
      __o.currency = 'USD';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayToLocaleStringPart03Test023
     * @tc.desc Verify options.style="Decimal" is accepted and output remains '42'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let __o = new O();
      __o.style = 'Decimal';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayToLocaleStringPart03Test024
     * @tc.desc Verify options.notation="STANDARD" is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.notation = 'STANDARD';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayToLocaleStringPart03Test025
     * @tc.desc Verify options.notation="compact " is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.notation = 'compact ';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayToLocaleStringPart03Test026
     * @tc.desc Verify options.localeMatcher="best fit" succeeds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.localeMatcher = 'best fit';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayToLocaleStringPart03Test027
     * @tc.desc Verify options.signDisplay="auto" ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let __o = new O();
      __o.signDisplay = 'auto';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayToLocaleStringPart03Test028
     * @tc.desc Verify options.signDisplay="negative"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let aPos: Int32Array = new Int32Array([42]);
      let aNeg: Int32Array = new Int32Array([-42]);
      let __o = new O();
      __o.signDisplay = 'negative';
      expect(aPos.toLocaleString('en-US', __o)).assertEqual('42');
      let __o2 = new O();
      __o2.signDisplay = 'negative';
      expect(aNeg.toLocaleString('en-US', __o2).charAt(0).toString()).assertEqual('-');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayToLocaleStringPart03Test029
     * @tc.desc Verify options.minimumFractionDigits=100 is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.minimumFractionDigits = 100;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayToLocaleStringPart03Test030
     * @tc.desc Verify options.minimumFractionDigits=101 is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.minimumFractionDigits = 101;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayToLocaleStringPart03Test031
     * @tc.desc Verify options.maximumFractionDigits=100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let __o = new O();
      __o.maximumFractionDigits = 100;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayToLocaleStringPart03Test032
     * @tc.desc Verify options.minimumSignificantDigits=21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([123]);
      let __o = new O();
      __o.minimumSignificantDigits = 21;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.replace(new RegExp('\\D', 'g'), '').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayToLocaleStringPart03Test033
     * @tc.desc Verify options.minimumSignificantDigits=21 + maximumSignificantDigits=21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([123]);
      let __o = new O();
      __o.minimumSignificantDigits = 21;
      __o.maximumSignificantDigits = 21;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.replace(new RegExp('\\D', 'g'), '').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayToLocaleStringPart03Test034
     * @tc.desc Verify options.minimumFractionDigits=Number.NaN is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.minimumFractionDigits = Number.NaN;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayToLocaleStringPart03Test035
     * @tc.desc Verify options.maximumFractionDigits=-Number.POSITIVE_INFINITY is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.maximumFractionDigits = Number.NEGATIVE_INFINITY;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayToLocaleStringPart03Test036
     * @tc.desc Verify options.minimumIntegerDigits 3.9 3 0 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let __o = new O();
      __o.minimumIntegerDigits = 3.9;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayToLocaleStringPart03Test037
     * @tc.desc Verify options.minimumIntegerDigits=-0.0 is accepted and output remains '1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.minimumIntegerDigits = -0.0;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayToLocaleStringPart03Test038
     * @tc.desc Verify options.minimumFractionDigits=-5 is accepted and empty output remains ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let __o = new O();
      __o.minimumFractionDigits = -5;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayToLocaleStringPart03Test039
     * @tc.desc Verify options.style="bogus" is accepted and empty output remains ''
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let __o = new O();
      __o.style = 'bogus';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayToLocaleStringPart03Test040
     * @tc.desc Verify currency options preserve the negative sign but emit no '$' symbol
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'USD';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.charAt(0).toString()).assertEqual('-');
      expect(r.indexOf('$')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayToLocaleStringPart03Test041
     * @tc.desc Verify Number.NaN is stored as 0 and currency options still output '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'USD';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayToLocaleStringPart03Test042
     * @tc.desc Verify style=percent is accepted and output remains '-1,-1,-1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let __o = new O();
      __o.style = 'percent';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('-1,-1,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayToLocaleStringPart03Test043
     * @tc.desc Verify 0 + signDisplay="always" "+0,+0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let __o = new O();
      __o.signDisplay = 'always';
      let r: string = arr.toLocaleString('en-US', __o);
      let parts: string[] = r.split(',');
      expect(parts.length).assertEqual(2);
      for (let i: int = 0; i < parts.length; i++) {
        expect(parts[i].indexOf('+') >= 0).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayToLocaleStringPart03Test044
     * @tc.desc Verify 100 (5) toLocaleString ,split 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        data.push(5);
      }
      let arr: Int32Array = new Int32Array(data);
      let r: string = arr.toLocaleString();
      let parts: string[] = r.split(',');
      expect(parts.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayToLocaleStringPart03Test045
     * @tc.desc Verify MAX_INT32 + useGrouping=false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let __f = new GroupOff();
      let r: string = arr.toLocaleString('en-US', __f);
      expect(r.indexOf(',') < 0).assertFalse();
      expect(r).assertEqual('2,147,483,647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayToLocaleStringPart03Test046
     * @tc.desc Verify 42 subarray , toLocaleString "42"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([0, 42, 0]);
      let sub1: Int32Array = base.subarray(1, 2);
      let sub2: Int32Array = sub1.subarray(0, 1);
      expect(sub2.toLocaleString('en-US')).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayToLocaleStringPart03Test047
     * @tc.desc Verify locale length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let lenBefore: number = arr.length;
      try {
        arr.toLocaleString('zz_ZZ');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayToLocaleStringPart03Test048
     * @tc.desc Verify negative minimumFractionDigits is ignored and array values remain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3]);
      let __o5 = new O();
      __o5.minimumFractionDigits = -3;
      expect(arr.toLocaleString('en-US', __o5)).assertEqual('1,-2,3');
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayToLocaleStringPart03Test049
     * @tc.desc Verify options=null buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bufBefore: ArrayBuffer = arr.buffer;
      try {
        arr.toLocaleString('en-US', null as Object);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayToLocaleStringPart03Test050
     * @tc.desc Verify locale BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString('');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayToLocaleStringPart03Test051
     * @tc.desc Verify ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let t1: boolean = false;
      try {
        arr.toLocaleString(123 as Object as string);
      } catch (e) {
        t1 = true;
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(t1).assertTrue();
      let r: string = arr.toLocaleString('bogus-locale');
      expect(r).assertEqual('1');
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayToLocaleStringPart03Test052
     * @tc.desc Verify null locales + undefined options TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.toLocaleString(null as Object as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayToLocaleStringPart03Test053
     * @tc.desc Verify locales en-US options useGrouping:true 2 ToBoolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      let __o = new O();
      __o.useGrouping = true;
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r).assertEqual('1,000,000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayToLocaleStringPart03Test054
     * @tc.desc Verify currency symbol options are accepted but output contains no '$'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let __o = new O();
      __o.style = 'currency';
      __o.currency = 'USD';
      __o.currencyDisplay = 'symbol';
      let r: string = arr.toLocaleString('en-US', __o);
      expect(r.indexOf('$') >= 0).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayToLocaleStringPart03Test055
     * @tc.desc Verify $_set 2147483649 -2147483647 , "-"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483649);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('-2,147,483,647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayToLocaleStringPart03Test056
     * @tc.desc Verify $_set -2147483649 2147483647 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483649);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('2,147,483,647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayToLocaleStringPart03Test057
     * @tc.desc Verify $_set 2147483647.1 2147483647 , 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array(1);
      a1.$_set(0, 2147483647.1);
      let a2: Int32Array = new Int32Array([2147483647]);
      expect(a1.toLocaleString('en-US')).assertEqual(a2.toLocaleString('en-US'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayToLocaleStringPart03Test058
     * @tc.desc Verify $_set -0 -0.0 0, "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0.0);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayToLocaleStringPart03Test059
     * @tc.desc Verify $_set Number.MIN_SAFE_INTEGER ToInt32 int32 ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -9007199254740991);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayToLocaleStringPart03Test060
     * @tc.desc Verify $_set Number.MAX_SAFE_INTEGER ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 9007199254740991);
      let r: string = arr.toLocaleString('en-US');
      expect(r).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayToLocaleStringPart03Test061
     * @tc.desc Verify unsupported valid locale falls back without changing the shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let firstVal: Int32Array = new Int32Array(buf, 0, 2);
      let secondVal: Int32Array = new Int32Array(buf, 8, 2);
      firstVal.$_set(0, 10);
      firstVal.$_set(1, 20);
      secondVal.$_set(0, 30);
      secondVal.$_set(1, 40);
      expect(firstVal.toLocaleString('bogus')).assertEqual('10,20');
      expect(secondVal.$_get(0)).assertEqual(30);
      expect(secondVal.$_get(1)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayToLocaleStringPart03Test062
     * @tc.desc Verify ArrayBuffer toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let empty: Int32Array = new Int32Array(buf, 0, 0);
      expect(empty.toLocaleString('en-US')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayToLocaleStringPart03Test063
     * @tc.desc Verify ArrayBuffer 12 toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let v: Int32Array = new Int32Array(buf, 12, 1);
      v.$_set(0, 777);
      expect(v.toLocaleString('en-US')).assertEqual('777');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_LOCALE_STRING_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayToLocaleStringPart03Test064
     * @tc.desc Verify subarray [1000,2000]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToLocaleStringPart03Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 1000, 2000, 0]);
      let mid: Int32Array = parent.subarray(1, 3);
      let r: string = mid.toLocaleString('en-US');
      expect(r).assertEqual('1,000,2,000');
    });
  });
}
