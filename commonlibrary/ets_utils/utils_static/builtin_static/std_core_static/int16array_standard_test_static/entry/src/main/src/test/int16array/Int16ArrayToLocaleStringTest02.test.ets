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

interface UnknownNumberFormatOptions {
  roundingMode?: string;
}

export default function Int16ArrayToLocaleStringTest02(): void {
  describe('Int16ArrayToLocaleStringTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0100
     * @tc.name testInt16ArrayToLocaleStringTestTwo001
     * @tc.desc Verify Int16Array.toLocaleString keeps array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let beforeLength: int = arr.length;
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualLength: int = arr.length;
      expect(actualLength).assertEqual(beforeLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0200
     * @tc.name testInt16ArrayToLocaleStringTestTwo002
     * @tc.desc Verify Int16Array.toLocaleString keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let beforeByteLength: int = arr.byteLength;
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualByteLength: int = arr.byteLength;
      expect(actualByteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0300
     * @tc.name testInt16ArrayToLocaleStringTestTwo003
     * @tc.desc Verify Int16Array.toLocaleString with 'en-US' keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 32767);
      let beforeByteLength: int = arr.byteLength;
      let localeOutput: string = arr.toLocaleString('en-US');
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString('en-US');
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualByteLength: int = arr.byteLength;
      expect(actualByteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0400
     * @tc.name testInt16ArrayToLocaleStringTestTwo004
     * @tc.desc Verify Int16Array.toLocaleString keeps byteOffset 0 for non-buffer array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualByteOffset: int = arr.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0500
     * @tc.name testInt16ArrayToLocaleStringTestTwo005
     * @tc.desc Verify Int16Array.toLocaleString keeps BYTES_PER_ELEMENT unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let beforeBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      expect(actualBytesPerElement).assertEqual(beforeBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0600
     * @tc.name testInt16ArrayToLocaleStringTestTwo006
     * @tc.desc Verify Int16Array.BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualBytesPerElement: int = arr.BYTES_PER_ELEMENT;
      let expectedBytesPerElement: int = 2;
      expect(actualBytesPerElement).assertEqual(expectedBytesPerElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0700
     * @tc.name testInt16ArrayToLocaleStringTestTwo007
     * @tc.desc Verify Int16Array.toLocaleString keeps buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf);
      let beforeBuffer: ArrayBuffer = arr.buffer;
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualBuffer: ArrayBuffer = arr.buffer;
      expect(actualBuffer).assertEqual(beforeBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0800
     * @tc.name testInt16ArrayToLocaleStringTestTwo008
     * @tc.desc Verify Int16Array.toLocaleString with style decimal option keeps buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf);
      let beforeBuffer: ArrayBuffer = arr.buffer;
      let opts: Intl.NumberFormatOptions = {
        style: 'decimal',
      };
      let localeOutput: string = arr.toLocaleString('en-US', opts);
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString('en-US', opts);
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualBuffer: ArrayBuffer = arr.buffer;
      expect(actualBuffer).assertEqual(beforeBuffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_0900
     * @tc.name testInt16ArrayToLocaleStringTestTwo009
     * @tc.desc Verify Int16Array.toLocaleString keeps byteOffset of buffer view unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 3);
      let beforeByteOffset: int = arr.byteOffset;
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let actualByteOffset: int = arr.byteOffset;
      expect(actualByteOffset).assertEqual(beforeByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1000
     * @tc.name testInt16ArrayToLocaleStringTestTwo010
     * @tc.desc Verify Int16Array.toLocaleString on shared-buffer views keeps element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0, 2);
      let view2: Int16Array = new Int16Array(buf, 4, 2);
      view1.$_set(0, 111);
      view2.$_set(0, 222);
      let localeOutput: string = view1.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < view1.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += view1.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let elementAt0: number = view1.$_get(0);
      let expectedElementAt0: number = 111;
      expect(elementAt0).assertEqual(expectedElementAt0);
      let elementAt02: number = view2.$_get(0);
      let expectedElementAt02: number = 222;
      expect(elementAt02).assertEqual(expectedElementAt02);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1100
     * @tc.name testInt16ArrayToLocaleStringTestTwo011
     * @tc.desc Verify Int16Array.toLocaleString on buffer-backed array keeps element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = 1;
      expect(elementAt0).assertEqual(expectedElementAt0);
      let elementAt1: number = arr.$_get(1);
      let expectedElementAt1: number = 2;
      expect(elementAt1).assertEqual(expectedElementAt1);
      let elementAt2: number = arr.$_get(2);
      let expectedElementAt2: number = 3;
      expect(elementAt2).assertEqual(expectedElementAt2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1200
     * @tc.name testInt16ArrayToLocaleStringTestTwo012
     * @tc.desc Verify Int16Array.toLocaleString preserves all element values from snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let snapshot: number[] = [arr.$_get(0), arr.$_get(1), arr.$_get(2)];
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let elementAt0: number = arr.$_get(0);
      expect(elementAt0).assertEqual(snapshot[0]);
      let elementAt1: number = arr.$_get(1);
      expect(elementAt1).assertEqual(snapshot[1]);
      let elementAt2: number = arr.$_get(2);
      expect(elementAt2).assertEqual(snapshot[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1300
     * @tc.name testInt16ArrayToLocaleStringTestTwo013
     * @tc.desc Verify Int16Array.toLocaleString with 'en-US' does not mutate element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 32767;
      let arr: Int16Array = Int16Array.of(val);
      let localeOutput: string = arr.toLocaleString('en-US');
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString('en-US');
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = 32767;
      expect(elementAt0).assertEqual(expectedElementAt0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1400
     * @tc.name testInt16ArrayToLocaleStringTestTwo014
     * @tc.desc Verify Int16Array.toLocaleString with 'zh-CN' does not mutate element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -32768;
      let arr: Int16Array = Int16Array.of(val);
      let localeOutput: string = arr.toLocaleString('zh-CN');
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString('zh-CN');
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = -32768;
      expect(elementAt0).assertEqual(expectedElementAt0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1500
     * @tc.name testInt16ArrayToLocaleStringTestTwo015
     * @tc.desc Verify Int16Array.toLocaleString keeps negative element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-5, -10, -15);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = -5;
      expect(elementAt0).assertEqual(expectedElementAt0);
      let elementAt1: number = arr.$_get(1);
      let expectedElementAt1: number = -10;
      expect(elementAt1).assertEqual(expectedElementAt1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1600
     * @tc.name testInt16ArrayToLocaleStringTestTwo016
     * @tc.desc Verify Int16Array.toLocaleString across multiple calls leaves element values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200);
      let localeOutput: string = arr.toLocaleString();
      let expectedLocaleOutput: string = '';
      for (let localeIndex: int = 0; localeIndex < arr.length; localeIndex++) {
        if (localeIndex > 0) {
          expectedLocaleOutput += ',';
        }
        expectedLocaleOutput += arr.$_get(localeIndex).toLocaleString();
      }
      expect(localeOutput).assertEqual(expectedLocaleOutput);
      let enUsLocaleOutput: string = arr.toLocaleString('en-US');
      let expectedEnUsLocaleOutput: string = '';
      for (let enUsLocaleIndex: int = 0; enUsLocaleIndex < arr.length; enUsLocaleIndex++) {
        if (enUsLocaleIndex > 0) {
          expectedEnUsLocaleOutput += ',';
        }
        expectedEnUsLocaleOutput += arr.$_get(enUsLocaleIndex).toLocaleString('en-US');
      }
      expect(enUsLocaleOutput).assertEqual(expectedEnUsLocaleOutput);
      let zhCnLocaleOutput: string = arr.toLocaleString('zh-CN');
      let expectedZhCnLocaleOutput: string = '';
      for (let zhCnLocaleIndex: int = 0; zhCnLocaleIndex < arr.length; zhCnLocaleIndex++) {
        if (zhCnLocaleIndex > 0) {
          expectedZhCnLocaleOutput += ',';
        }
        expectedZhCnLocaleOutput += arr.$_get(zhCnLocaleIndex).toLocaleString('zh-CN');
      }
      expect(zhCnLocaleOutput).assertEqual(expectedZhCnLocaleOutput);
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = 100;
      expect(elementAt0).assertEqual(expectedElementAt0);
      let elementAt1: number = arr.$_get(1);
      let expectedElementAt1: number = 200;
      expect(elementAt1).assertEqual(expectedElementAt1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1700
     * @tc.name testInt16ArrayToLocaleStringTestTwo017
     * @tc.desc Verify Int16Array.toLocaleString with empty options object returns default format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {};
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1800
     * @tc.name testInt16ArrayToLocaleStringTestTwo018
     * @tc.desc Verify Int16Array.toLocaleString with currencySign accounting option wraps negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
        currencySign: 'accounting',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(-1000) + ',' + expectedFormatter.format(2000);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_1900
     * @tc.name testInt16ArrayToLocaleStringTestTwo019
     * @tc.desc Verify Int16Array.toLocaleString with notation standard keeps grouping separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        notation: 'standard',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2000
     * @tc.name testInt16ArrayToLocaleStringTestTwo020
     * @tc.desc Verify Int16Array.toLocaleString with notation scientific outputs exponent marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        notation: 'scientific',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('en-US', opts);
      let expectedResult: string = expectedFormatter.format(1000) + ',' + expectedFormatter.format(2000);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2100
     * @tc.name testInt16ArrayToLocaleStringTestTwo021
     * @tc.desc Verify Int16Array.toLocaleString with signDisplay never hides minus signs of negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1000, -2000);
      let opts: Intl.NumberFormatOptions = {
        signDisplay: 'never',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2200
     * @tc.name testInt16ArrayToLocaleStringTestTwo022
     * @tc.desc Verify Int16Array.toLocaleString with signDisplay exceptZero leaves zero unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1000, 0, 2000);
      let opts: Intl.NumberFormatOptions = {
        signDisplay: 'exceptZero',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '-1,000,0,+2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2300
     * @tc.name testInt16ArrayToLocaleStringTestTwo023
     * @tc.desc Verify Int16Array.toLocaleString with minimumIntegerDigits 21 groups padded elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumIntegerDigits: 21,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let firstFormattedElement: string = '000,000,000,000,000,001,000';
      let secondFormattedElement: string = '000,000,000,000,000,002,000';
      let elementSeparator: string = ',';
      let expectedPaddedElements: string = firstFormattedElement + elementSeparator + secondFormattedElement;
      expect(result).assertEqual(expectedPaddedElements);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2400
     * @tc.name testInt16ArrayToLocaleStringTestTwo024
     * @tc.desc Verify Int16Array.toLocaleString with minimumFractionDigits 0 keeps integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: 0,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2500
     * @tc.name testInt16ArrayToLocaleStringTestTwo025
     * @tc.desc Verify Int16Array.toLocaleString with minimumFractionDigits 1 adds one fraction digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: 1,
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1,000.0,2,000.0';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2600
     * @tc.name testInt16ArrayToLocaleStringTestTwo026
     * @tc.desc Verify Int16Array.toLocaleString with localeMatcher lookup option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        localeMatcher: 'lookup',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '1,000,2,000';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2700
     * @tc.name testInt16ArrayToLocaleStringTestTwo027
     * @tc.desc Verify Int16Array.toLocaleString with invalid currency code throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'XYZ',
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2800
     * @tc.name testInt16ArrayToLocaleStringTestTwo028
     * @tc.desc Verify Int16Array.toLocaleString with currency style missing currency throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_2900
     * @tc.name testInt16ArrayToLocaleStringTestTwo029
     * @tc.desc Verify Int16Array.toLocaleString with invalid unit throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'unit',
        unit: 'not-a-valid-unit',
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3000
     * @tc.name testInt16ArrayToLocaleStringTestTwo030
     * @tc.desc Verify Int16Array.toLocaleString with unit style missing unit throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 1000;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        style: 'unit',
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3100
     * @tc.name testInt16ArrayToLocaleStringTestTwo031
     * @tc.desc Verify Int16Array.toLocaleString with minimumIntegerDigits -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumIntegerDigits: -1,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3200
     * @tc.name testInt16ArrayToLocaleStringTestTwo032
     * @tc.desc Verify Int16Array.toLocaleString with minimumIntegerDigits 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumIntegerDigits: 0,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3300
     * @tc.name testInt16ArrayToLocaleStringTestTwo033
     * @tc.desc Verify Int16Array.toLocaleString with minimumFractionDigits -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: -1,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3400
     * @tc.name testInt16ArrayToLocaleStringTestTwo034
     * @tc.desc Verify Int16Array.toLocaleString with maximumFractionDigits -1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        maximumFractionDigits: -1,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3500
     * @tc.name testInt16ArrayToLocaleStringTestTwo035
     * @tc.desc Verify Int16Array.toLocaleString with maximumFractionDigits 101 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 7;
      let arr: Int16Array = Int16Array.of(val);
      let opts: Intl.NumberFormatOptions = {
        maximumFractionDigits: 101,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3600
     * @tc.name testInt16ArrayToLocaleStringTestTwo036
     * @tc.desc Verify Int16Array.toLocaleString with minimum fraction greater than maximum fraction throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumFractionDigits: 5,
        maximumFractionDigits: 2,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3700
     * @tc.name testInt16ArrayToLocaleStringTestTwo037
     * @tc.desc Verify Int16Array.toLocaleString with minimumSignificantDigits 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumSignificantDigits: 0,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3800
     * @tc.name testInt16ArrayToLocaleStringTestTwo038
     * @tc.desc Verify Int16Array.toLocaleString with minimumSignificantDigits 22 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        minimumSignificantDigits: 22,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_3900
     * @tc.name testInt16ArrayToLocaleStringTestTwo039
     * @tc.desc Verify Int16Array.toLocaleString with maximumSignificantDigits 0 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        maximumSignificantDigits: 0,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4000
     * @tc.name testInt16ArrayToLocaleStringTestTwo040
     * @tc.desc Verify Int16Array.toLocaleString with maximumSignificantDigits 22 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        maximumSignificantDigits: 22,
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4100
     * @tc.name testInt16ArrayToLocaleStringTestTwo041
     * @tc.desc Verify Int16Array.toLocaleString with compact notation missing compactDisplay throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        notation: 'compact',
      };
      try {
        arr.toLocaleString('en-US', opts);
        expect().assertFail();
      } catch (e) {
        let expectedErrorName: string = 'RangeError';
        expect(e.name).assertEqual(expectedErrorName);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4200
     * @tc.name testInt16ArrayToLocaleStringTestTwo042
     * @tc.desc Verify Int16Array.toLocaleString with invalid locale and valid options falls back to default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
      };
      let result: string = arr.toLocaleString('xx-XX', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('xx-XX', opts);
      let expectedResult: string = expectedFormatter.format(1000) + ',' + expectedFormatter.format(2000);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4300
     * @tc.name testInt16ArrayToLocaleStringTestTwo043
     * @tc.desc Verify Int16Array.toLocaleString on empty array with options returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'USD',
      };
      let result: string = arr.toLocaleString('en-US', opts);
      let expectedResult: string = '';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4400
     * @tc.name testInt16ArrayToLocaleStringTestTwo044
     * @tc.desc Verify Int16Array.toLocaleString on single element 0 with 'en-US'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '0';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4500
     * @tc.name testInt16ArrayToLocaleStringTestTwo045
     * @tc.desc Verify Int16Array.toLocaleString on single element -1 with 'en-US'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = -1;
      let arr: Int16Array = Int16Array.of(val);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '-1';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4600
     * @tc.name testInt16ArrayToLocaleStringTestTwo046
     * @tc.desc Verify Int16Array.toLocaleString on all-minimum array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, -32768, -32768);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '-32,768,-32,768,-32,768';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4700
     * @tc.name testInt16ArrayToLocaleStringTestTwo047
     * @tc.desc Verify Int16Array.toLocaleString on maximum and minimum mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '32,767,-32,768';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4800
     * @tc.name testInt16ArrayToLocaleStringTestTwo048
     * @tc.desc Verify Int16Array.toLocaleString on maximum minimum and zero mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768, 0);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '32,767,-32,768,0';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_4900
     * @tc.name testInt16ArrayToLocaleStringTestTwo049
     * @tc.desc Verify Int16Array.toLocaleString on boundary large array formats every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32767, -32768, 0, -1, 1, 32766, -32767, 32765, -32766, 100);
      let result: string = arr.toLocaleString('en-US');
      let expectedResult: string = '32,767,-32,768,0,-1,1,32,766,-32,767,32,765,-32,766,100';
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_5000
     * @tc.name testInt16ArrayToLocaleStringTestTwo050
     * @tc.desc Verify Int16Array.toLocaleString with currency CNY option on minimum and maximum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 32767);
      let opts: Intl.NumberFormatOptions = {
        style: 'currency',
        currency: 'CNY',
      };
      let result: string = arr.toLocaleString('zh-CN', opts);
      let expectedFormatter: Intl.NumberFormat = new Intl.NumberFormat('zh-CN', opts);
      let expectedResult: string = expectedFormatter.format(-32768) + ',' + expectedFormatter.format(32767);
      expect(result).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_5100
     * @tc.name testInt16ArrayToLocaleStringTestTwo051
     * @tc.desc Verify Int16Array.toLocaleString does not mutate element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      arr.toLocaleString('en-US');
      let elementAt0: number = arr.$_get(0);
      let expectedElementAt0: number = 1000;
      expect(elementAt0).assertEqual(expectedElementAt0);
      let elementAt1: number = arr.$_get(1);
      let expectedElementAt1: number = 2000;
      expect(elementAt1).assertEqual(expectedElementAt1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_5200
     * @tc.name testInt16ArrayToLocaleStringTestTwo052
     * @tc.desc Verify Int16Array.toLocaleString repeated calls return equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1000, 2000);
      let firstResult: string = arr.toLocaleString('en-US');
      let expectedFirstResult: string = '1,000,2,000';
      expect(firstResult).assertEqual(expectedFirstResult);
      let secondResult: string = arr.toLocaleString('en-US');
      expect(secondResult).assertEqual(firstResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOLOCALESTRING_TWO_5300
     * @tc.name testInt16ArrayToLocaleStringTestTwo053
     * @tc.desc Verify toLocaleString rejects an object cast to locales with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToLocaleStringTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Int16Array = Int16Array.of(1000, 2000);
      const unsupported: Object = new Object();
      try {
        const invalidLocales: Intl.LocalesArgument = unsupported as object as Intl.LocalesArgument;
        arr.toLocaleString(invalidLocales);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

  });
}
