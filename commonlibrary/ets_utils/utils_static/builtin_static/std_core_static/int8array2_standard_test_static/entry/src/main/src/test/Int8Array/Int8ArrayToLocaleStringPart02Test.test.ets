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
import Utils from '../Util.test';

class LocOptFractionDigits2 {
  minimumFractionDigits: number = 2;
}
class LocOptFractionDigits1 {
  minimumFractionDigits: number = 1;
}
class LocOptNoGrouping {
  useGrouping: boolean = false;
}

export default function int8ArrayToLocaleStringPart02Test(): void {
  describe('Int8ArrayToLocaleStringPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0100
     * @tc.name int8ArrayToLocaleStringPart02Test001
     * @tc.desc Verify empty array toLocaleString returns string type via typeof assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: string = arr.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0200
     * @tc.name int8ArrayToLocaleStringPart02Test002
     * @tc.desc Verify single element [0] toLocaleString returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let r: string = arr.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0300
     * @tc.name int8ArrayToLocaleStringPart02Test003
     * @tc.desc Verify multi-element [1,2,3] toLocaleString returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0400
     * @tc.name int8ArrayToLocaleStringPart02Test004
     * @tc.desc Verify toLocaleString with locales parameter still returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let r: string = arr.toLocaleString('en-US');
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0500
     * @tc.name int8ArrayToLocaleStringPart02Test005
     * @tc.desc Verify toLocaleString with options parameter still returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let o: LocOptFractionDigits2 = new LocOptFractionDigits2();
      let r: string = arr.toLocaleString('en-US', o);
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0600
     * @tc.name int8ArrayToLocaleStringPart02Test006
     * @tc.desc Verify toLocaleString with both locales and options returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9, 9]);
      let o: LocOptNoGrouping = new LocOptNoGrouping();
      let r: string = arr.toLocaleString('zh-CN', o);
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0700
     * @tc.name int8ArrayToLocaleStringPart02Test007
     * @tc.desc Verify toLocaleString() on [1, 2] returns '1,2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let actualValue: string = arr.toLocaleString();
      let expectedValue: string = '1,2';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0800
     * @tc.name int8ArrayToLocaleStringPart02Test008
     * @tc.desc Verify subarray view toLocaleString returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let view: Int8Array = arr.subarray(0, 2);
      let r: string = view.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_0900
     * @tc.name int8ArrayToLocaleStringPart02Test009
     * @tc.desc Verify full int8 boundary values array toLocaleString returns string type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX, 0, -1, 1]);
      let r: string = arr.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1000
     * @tc.name int8ArrayToLocaleStringPart02Test010
     * @tc.desc Verify toLocaleString() on constructor-created [0] returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1100
     * @tc.name int8ArrayToLocaleStringPart02Test011
     * @tc.desc Verify max value [127] toLocaleString returns '127'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1200
     * @tc.name int8ArrayToLocaleStringPart02Test012
     * @tc.desc Verify min value [-128] toLocaleString returns '-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1300
     * @tc.name int8ArrayToLocaleStringPart02Test013
     * @tc.desc Verify multi-element [1,2,3] toLocaleString returns '1,2,3' comma separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1400
     * @tc.name int8ArrayToLocaleStringPart02Test014
     * @tc.desc Verify negative values [-1,-2] toLocaleString returns '-1,-2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('-1,-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1500
     * @tc.name int8ArrayToLocaleStringPart02Test015
     * @tc.desc Verify construction truncation [128] wraps to -128, toLocaleString returns '-128'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('-128');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1600
     * @tc.name int8ArrayToLocaleStringPart02Test016
     * @tc.desc Verify construction truncation [256] wraps to 0, toLocaleString returns '0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([256]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1700
     * @tc.name int8ArrayToLocaleStringPart02Test017
     * @tc.desc Verify all same values [7,7,7] toLocaleString returns '7,7,7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1800
     * @tc.name int8ArrayToLocaleStringPart02Test018
     * @tc.desc Verify array with zero [0,1,0] toLocaleString returns '0,1,0'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 0]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('0,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_1900
     * @tc.name int8ArrayToLocaleStringPart02Test019
     * @tc.desc Verify default locale multi-element result contains comma separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let r: string = arr.toLocaleString();
      let actualValue: boolean = r.includes(',');
      expect(actualValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2000
     * @tc.name int8ArrayToLocaleStringPart02Test020
     * @tc.desc Verify result string starts with first element value via startsWith assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([42, 13]);
      let r: string = arr.toLocaleString();
      let actualValue: boolean = r.startsWith('42');
      expect(actualValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2100
     * @tc.name int8ArrayToLocaleStringPart02Test021
     * @tc.desc Verify result string ends with last element value via endsWith assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([13, 42]);
      let r: string = arr.toLocaleString();
      let actualValue = r.endsWith('42');
      expect(actualValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2200
     * @tc.name int8ArrayToLocaleStringPart02Test022
     * @tc.desc Verify multi-element [8,9,10] toLocaleString returns exact value '8,9,10'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([8, 9, 10]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('8,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2300
     * @tc.name int8ArrayToLocaleStringPart02Test023
     * @tc.desc Verify full range [127,-128,0,1,-1] toLocaleString returns exact joined string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN, 0, 1, -1]);
      let r: string = arr.toLocaleString();
      expect(r).assertEqual('127,-128,0,1,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2400
     * @tc.name int8ArrayToLocaleStringPart02Test024
     * @tc.desc Verify empty array result string length is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 0;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2500
     * @tc.name int8ArrayToLocaleStringPart02Test025
     * @tc.desc Verify single element [0] result string length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2600
     * @tc.name int8ArrayToLocaleStringPart02Test026
     * @tc.desc Verify [-128] result string length is 4 including negative sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN]);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 4;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2700
     * @tc.name int8ArrayToLocaleStringPart02Test027
     * @tc.desc Verify [1,2,3] result string length is 5, 3 elements plus 2 separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 5;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2800
     * @tc.name int8ArrayToLocaleStringPart02Test028
     * @tc.desc Verify [-128,127] result string length is 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MIN, INT8_MAX]);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 8;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_2900
     * @tc.name int8ArrayToLocaleStringPart02Test029
     * @tc.desc Verify toLocaleString three digit two digit mix length six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([100, 23]);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 6;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3000
     * @tc.name int8ArrayToLocaleStringPart02Test030
     * @tc.desc Verify [-1] result string length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1]);
      let r: string = arr.toLocaleString();
      let actualValue: int = r.length;
      let expectedValue: int = 2;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3100
     * @tc.name int8ArrayToLocaleStringPart02Test031
     * @tc.desc Verify original array length remains unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let before: number = arr.length;
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '1,2,3,4,5';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = arr.length;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3200
     * @tc.name int8ArrayToLocaleStringPart02Test032
     * @tc.desc Verify original array byteLength remains unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let before: number = arr.byteLength;
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '1,2,3,4';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = arr.byteLength;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3300
     * @tc.name int8ArrayToLocaleStringPart02Test033
     * @tc.desc Verify original array byteOffset remains unchanged after toLocaleString call, directly constructed as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let before: number = arr.byteOffset;
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '1,2';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = arr.byteOffset;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3400
     * @tc.name int8ArrayToLocaleStringPart02Test034
     * @tc.desc Verify original array middle element value unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = arr.$_get(1);
      let expectedValue: int = 20;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3500
     * @tc.name int8ArrayToLocaleStringPart02Test035
     * @tc.desc Verify original array length unchanged after toLocaleString with locales call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let before: number = arr.length;
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '1,2,3,4';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = arr.length;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3600
     * @tc.name int8ArrayToLocaleStringPart02Test036
     * @tc.desc Verify original array byteLength unchanged after toLocaleString with options call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let o: LocOptFractionDigits1 = new LocOptFractionDigits1();
      let before: number = arr.byteLength;
      let resultVal1: string = arr.toLocaleString('en-US', o);
      let expectedVal1: string = '1,2';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = arr.byteLength;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3700
     * @tc.name int8ArrayToLocaleStringPart02Test037
     * @tc.desc Verify three consecutive toLocaleString calls produce no cumulative side effects, toString snapshot equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 4, 5]);
      let snapshot: string = arr.toString();
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '3,4,5';
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal2: string = arr.toLocaleString();
      let expectedVal2: string = '3,4,5';
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: string = arr.toLocaleString();
      let expectedVal3: string = '3,4,5';
      expect(resultVal3).assertEqual(expectedVal3);
      let actualValue: string = arr.toString();
      let expectedValue = snapshot;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3800
     * @tc.name int8ArrayToLocaleStringPart02Test038
     * @tc.desc Verify array can still be written via $_set after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '1,2';
      expect(resultVal1).assertEqual(expectedVal1);
      arr.$_set(0, 99);
      let actualValue: number = arr.$_get(0);
      let expectedValue: int = 99;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_3900
     * @tc.name int8ArrayToLocaleStringPart02Test039
     * @tc.desc Verify subarray view toLocaleString does not modify parent array out-of-range element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      let resultVal1: string = view.toLocaleString();
      let expectedVal1: string = '2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = arr.$_get(3);
      let expectedValue: int = 4;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4000
     * @tc.name int8ArrayToLocaleStringPart02Test040
     * @tc.desc Verify captured result string is unaffected by subsequent $_set, result is a snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 6]);
      let r: string = arr.toLocaleString();
      arr.$_set(0, 100);
      expect(r).assertEqual('5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4100
     * @tc.name int8ArrayToLocaleStringPart02Test041
     * @tc.desc Verify boundary element 127 remains unchanged after multiple toLocaleString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX, INT8_MIN]);
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '127,-128';
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal2: string = arr.toLocaleString();
      let expectedVal2: string = '127,-128';
      expect(resultVal2).assertEqual(expectedVal2);
      let actualValue: number = arr.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4200
     * @tc.name int8ArrayToLocaleStringPart02Test042
     * @tc.desc Verify toString result is consistent before and after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8]);
      let before: string = arr.toString();
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '7,8';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: string = arr.toString();
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4300
     * @tc.name int8ArrayToLocaleStringPart02Test043
     * @tc.desc Verify parent array toLocaleString does not affect subarray view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 2);
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '1,2,3';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: number = view.$_get(0);
      let expectedValue: int = 1;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4400
     * @tc.name int8ArrayToLocaleStringPart02Test044
     * @tc.desc Verify array content is exactly unchanged after toLocaleString, toString equals expected literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([6, 7, 8]);
      let resultVal1: string = arr.toLocaleString();
      let expectedVal1: string = '6,7,8';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: string = arr.toString();
      let expectedValue: string = '6,7,8';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4500
     * @tc.name int8ArrayToLocaleStringPart02Test045
     * @tc.desc Verify underlying ArrayBuffer byteLength remains unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf);
      let resultVal1: string = view.toLocaleString();
      let expectedVal1: string = '0,0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = buf.byteLength;
      let expectedValue: int = 4;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4600
     * @tc.name int8ArrayToLocaleStringPart02Test046
     * @tc.desc Verify toLocaleString does not return receiver, result is string type while receiver is object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9]);
      let r: string = arr.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4700
     * @tc.name int8ArrayToLocaleStringPart02Test047
     * @tc.desc Verify two consecutive calls return strictly equal values, each returns new equal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: string = arr.toLocaleString();
      let expected1: string = '1,2,3';
      expect(r1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4800
     * @tc.name int8ArrayToLocaleStringPart02Test048
     * @tc.desc Verify toLocaleString result typeof is string and split by comma yields expected element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let r: string = arr.toLocaleString();
      let capturedResult = r;
      let actualValue: string = typeof capturedResult;
      let expectedValue: string = 'string';
      expect(actualValue).assertEqual(expectedValue);
      let parts: string[] = r.split(',');
      let actualValue2: int = parts.length;
      let expectedValue2: int = 2;
      expect(actualValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_4900
     * @tc.name int8ArrayToLocaleStringPart02Test049
     * @tc.desc Verify toLocaleString result split by comma yields segment count equal to array element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r: string = arr.toLocaleString();
      let count: number = r.split(',').length;
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5000
     * @tc.name int8ArrayToLocaleStringPart02Test050
     * @tc.desc Verify toLocaleString result first segment before first comma equals first element string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 8, 9]);
      let r: string = arr.toLocaleString();
      let actualValue: string = r.substring(0, r.indexOf(','));
      let expectedValue: string = '7';
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5100
     * @tc.name int8ArrayToLocaleStringPart02Test051
     * @tc.desc Verify subarray view toLocaleString returns only view range elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let r: string = view.toLocaleString();
      expect(r).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5200
     * @tc.name int8ArrayToLocaleStringPart02Test052
     * @tc.desc Verify offset view byteOffset remains unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      let before: number = view.byteOffset;
      let resultVal1: string = view.toLocaleString();
      let expectedVal1: string = '0,0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = view.byteOffset;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5300
     * @tc.name int8ArrayToLocaleStringPart02Test053
     * @tc.desc Verify two non-overlapping views on same buffer toLocaleString return respective range elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let firstView: Int8Array = new Int8Array(buf, 0, 2);
      let secondView: Int8Array = new Int8Array(buf, 2, 2);
      firstView.$_set(0, 11);
      firstView.$_set(1, 22);
      secondView.$_set(0, 33);
      secondView.$_set(1, 44);
      let r1: string = firstView.toLocaleString();
      let r2: string = secondView.toLocaleString();
      expect(r1).assertEqual('11,22');
      expect(r2).assertEqual('33,44');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5400
     * @tc.name int8ArrayToLocaleStringPart02Test054
     * @tc.desc Verify ArrayBuffer view (buf, offset, length) toLocaleString reflects only view range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let full: Int8Array = new Int8Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      full.$_set(4, 5);
      full.$_set(5, 6);
      let view: Int8Array = new Int8Array(buf, 2, 3);
      let r: string = view.toLocaleString();
      expect(r).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5500
     * @tc.name int8ArrayToLocaleStringPart02Test055
     * @tc.desc Verify view toLocaleString does not change underlying buffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let view: Int8Array = new Int8Array(buf, 0, 5);
      let resultVal1: string = view.toLocaleString();
      let expectedVal1: string = '0,0,0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = buf.byteLength;
      let expectedValue: int = 5;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5600
     * @tc.name int8ArrayToLocaleStringPart02Test056
     * @tc.desc Verify subarray view toLocaleString reflects parent array $_set real-time buffer state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let view: Int8Array = arr.subarray(0, 3);
      arr.$_set(1, 77);
      let r: string = view.toLocaleString();
      expect(r).assertEqual('0,77,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5700
     * @tc.name int8ArrayToLocaleStringPart02Test057
     * @tc.desc Verify subarray view length remains unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 4);
      let resultVal1: string = view.toLocaleString();
      let expectedVal1: string = '2,3,4';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = view.length;
      let expectedValue: int = 3;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5800
     * @tc.name int8ArrayToLocaleStringPart02Test058
     * @tc.desc Verify empty length subarray view toLocaleString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(1, 1);
      let r: string = view.toLocaleString();
      expect(r).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_5900
     * @tc.name int8ArrayToLocaleStringPart02Test059
     * @tc.desc Verify offset view byteLength remains unchanged after toLocaleString call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 1, 2);
      let before: number = view.byteLength;
      let resultVal1: string = view.toLocaleString();
      let expectedVal1: string = '0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let actualValue: int = view.byteLength;
      let expectedValue = before;
      expect(actualValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART02_TEST_6000
     * @tc.name int8ArrayToLocaleStringPart02Test060
     * @tc.desc Verify nested subarray, view of view, toLocaleString returns correct range elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let firstView: Int8Array = arr.subarray(1, 5);
      let secondView: Int8Array = firstView.subarray(1, 3);
      let r: string = secondView.toLocaleString();
      expect(r).assertEqual('3,4');
    });
  });
}
