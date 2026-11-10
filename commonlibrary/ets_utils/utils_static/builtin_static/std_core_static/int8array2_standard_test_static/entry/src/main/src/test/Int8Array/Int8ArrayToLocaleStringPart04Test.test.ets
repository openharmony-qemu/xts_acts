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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

interface TlsOptsGrouping {
  useGrouping?: boolean;
}

export default function int8ArrayToLocaleStringPart04Test(): void {
  describe('Int8ArrayToLocaleStringPart04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0100
     * @tc.name int8ArrayToLocaleStringPart04Test001
     * @tc.desc Verify toLocaleString does not change array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let beforeLen: number = arr.length;
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.length;
      let e1 = beforeLen;
      expect(r1).assertEqual(e1);
      let r2 = arr.length;
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0200
     * @tc.name int8ArrayToLocaleStringPart04Test002
     * @tc.desc Verify toLocaleString does not change element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.$_get(0);
      let e1 = 10;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(1);
      let e2 = 20;
      expect(r2).assertEqual(e2);
      let r3 = arr.$_get(2);
      let e3 = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0300
     * @tc.name int8ArrayToLocaleStringPart04Test003
     * @tc.desc Verify toLocaleString does not change byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let beforeByte: number = arr.byteLength;
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.byteLength;
      let e1: number = beforeByte;
      expect(r1).assertEqual(e1);
      let r2 = arr.byteLength;
      let e2 = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0400
     * @tc.name int8ArrayToLocaleStringPart04Test004
     * @tc.desc Verify toLocaleString does not change byteOffset with offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 3);
      let beforeOff: number = arr.byteOffset;
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.byteOffset;
      let e1 = beforeOff;
      expect(r1).assertEqual(e1);
      let r2 = arr.byteOffset;
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0500
     * @tc.name int8ArrayToLocaleStringPart04Test005
     * @tc.desc Verify toLocaleString preserves buffer reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '0,0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.buffer;
      let e1 = buf;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0600
     * @tc.name int8ArrayToLocaleStringPart04Test006
     * @tc.desc Verify underlying buffer byteLength unchanged after toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      let beforeBufByte: number = buf.byteLength;
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '0,0,0,0';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = buf.byteLength;
      let e1: number = beforeBufByte;
      expect(r1).assertEqual(e1);
      let r2 = buf.byteLength;
      let e2 = 4;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0700
     * @tc.name int8ArrayToLocaleStringPart04Test007
     * @tc.desc Verify toString still outputs correct value after toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let s2: string = arr.toString();
      expect(s2).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0800
     * @tc.name int8ArrayToLocaleStringPart04Test008
     * @tc.desc Verify array state unchanged after multiple toLocaleString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let resultVal2: string = arr.toLocaleString('en-US');
      let expectedVal2: string = '10,20,30';
      expect(resultVal2).assertEqual(expectedVal2);
      let resultVal3: string = arr.toLocaleString('en-US');
      let expectedVal3: string = '10,20,30';
      expect(resultVal3).assertEqual(expectedVal3);
      let r1 = arr.length;
      let e1 = 3;
      expect(r1).assertEqual(e1);
      let r2 = arr.$_get(0);
      let e2 = 10;
      expect(r2).assertEqual(e2);
      let r3 = arr.$_get(2);
      let e3 = 30;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_0900
     * @tc.name int8ArrayToLocaleStringPart04Test009
     * @tc.desc Verify $_set still works after toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      arr.$_set(1, 99);
      let r1 = arr.$_get(1);
      let e1 = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1000
     * @tc.name int8ArrayToLocaleStringPart04Test010
     * @tc.desc Verify subarray view state unchanged after toLocaleString on parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let view: Int8Array = arr.subarray(1, 3);
      let beforeView0: number = view.$_get(0);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30,40';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = view.$_get(0);
      let e1 = beforeView0;
      expect(r1).assertEqual(e1);
      let r2 = view.length;
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1100
     * @tc.name int8ArrayToLocaleStringPart04Test011
     * @tc.desc Verify toLocaleString on empty array returns empty string and length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let s: string = arr.toLocaleString('en-US');
      let r1 = arr.length;
      let e1 = 0;
      expect(r1).assertEqual(e1);
      expect(s).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1200
     * @tc.name int8ArrayToLocaleStringPart04Test012
     * @tc.desc Verify toLocaleString result length equals expected char count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let s: string = arr.toLocaleString('en-US');
      let r1 = s.length;
      let e1 = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1300
     * @tc.name int8ArrayToLocaleStringPart04Test013
     * @tc.desc Verify toLocaleString split count equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30, 40]);
      let s: string = arr.toLocaleString('en-US');
      let parts: string[] = s.split(',');
      let r1 = parts.length;
      let e1 = 4;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1400
     * @tc.name int8ArrayToLocaleStringPart04Test014
     * @tc.desc Verify split parts match original element strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let s: string = arr.toLocaleString('en-US');
      let parts: string[] = s.split(',');
      let r1 = parts[0];
      let e1 = '10';
      expect(r1).assertEqual(e1);
      let r2 = parts[1];
      let e2 = '20';
      expect(r2).assertEqual(e2);
      let r3 = parts[2];
      let e3 = '30';
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1500
     * @tc.name int8ArrayToLocaleStringPart04Test015
     * @tc.desc Verify idempotency of two toLocaleString calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, -20, 30]);
      let s2: string = arr.toLocaleString('en-US');
      expect(s2).assertEqual('10,-20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1600
     * @tc.name int8ArrayToLocaleStringPart04Test016
     * @tc.desc Verify toLocaleString and toString consistency for small integers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, -5, 100]);
      let tls: string = arr.toLocaleString('en-US');
      let ts: string = arr.toString();
      expect(tls).assertEqual(ts);
      expect(tls).assertEqual('5,-5,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1700
     * @tc.name int8ArrayToLocaleStringPart04Test017
     * @tc.desc Verify concat of toLocaleString result with itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let s: string = arr.toLocaleString('en-US');
      let combined: string = s.concat(s);
      expect(combined).assertEqual('1,21,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1800
     * @tc.name int8ArrayToLocaleStringPart04Test018
     * @tc.desc Verify replace separator in toLocaleString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let s: string = arr.toLocaleString('en-US');
      let replaced: string = s.replace(',', ';');
      expect(replaced).assertEqual('10;20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_1900
     * @tc.name int8ArrayToLocaleStringPart04Test019
     * @tc.desc Verify valueOf returns same array reference after toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20]);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.valueOf();
      let e1: Int8Array = arr;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2000
     * @tc.name int8ArrayToLocaleStringPart04Test020
     * @tc.desc Verify toLocaleString reflects $_set between calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let s1: string = arr.toLocaleString('en-US');
      arr.$_set(0, 9);
      let s2: string = arr.toLocaleString('en-US');
      expect(s1).assertEqual('1,2');
      expect(s2).assertEqual('9,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2100
     * @tc.name int8ArrayToLocaleStringPart04Test021
     * @tc.desc Verify at(-1) returns tail element after toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([10, 20, 30]);
      let resultVal1: string = arr.toLocaleString('en-US');
      let expectedVal1: string = '10,20,30';
      expect(resultVal1).assertEqual(expectedVal1);
      let r1 = arr.at(-1);
      let e1 = 30;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2200
     * @tc.name int8ArrayToLocaleStringPart04Test022
     * @tc.desc Verify $_set positive value reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0]);
      arr.$_set(0, 50);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '50,0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2300
     * @tc.name int8ArrayToLocaleStringPart04Test023
     * @tc.desc Verify $_set negative value reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, -50);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '-50';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2400
     * @tc.name int8ArrayToLocaleStringPart04Test024
     * @tc.desc Verify $_set zero reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9]);
      arr.$_set(0, 0);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2500
     * @tc.name int8ArrayToLocaleStringPart04Test025
     * @tc.desc Verify $_set max int8 value 127 reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, INT8_MAX);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '127';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2600
     * @tc.name int8ArrayToLocaleStringPart04Test026
     * @tc.desc Verify $_set min int8 value -128 reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, INT8_MIN);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '-128';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2700
     * @tc.name int8ArrayToLocaleStringPart04Test027
     * @tc.desc Verify toLocaleString reflects latest value after write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let s1: string = arr.toLocaleString('en-US');
      arr.$_set(0, 7);
      let s2: string = arr.toLocaleString('en-US');
      expect(s1).assertEqual('5');
      expect(s2).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2800
     * @tc.name int8ArrayToLocaleStringPart04Test028
     * @tc.desc Verify toLocaleString reflects last of consecutive $_set writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, 11);
      arr.$_set(0, 22);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '22';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_2900
     * @tc.name int8ArrayToLocaleStringPart04Test029
     * @tc.desc Verify $_set out of bounds throws RangeError and does not affect toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      try {
        arr.$_set(5, 99);

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      let r1 = arr.toLocaleString('en-US');
      let e1 = '1,2';
      expect(r1).assertEqual(e1);
      let r2 = arr.length;
      let e2 = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3000
     * @tc.name int8ArrayToLocaleStringPart04Test030
     * @tc.desc Verify $_set 128 truncates to -128 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, 128);
      let r1 = arr.$_get(0);
      let e1 = INT8_MIN;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '-128';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3100
     * @tc.name int8ArrayToLocaleStringPart04Test031
     * @tc.desc Verify $_set -129 truncates to 127 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, -129);
      let r1 = arr.$_get(0);
      let e1 = INT8_MAX;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '127';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3200
     * @tc.name int8ArrayToLocaleStringPart04Test032
     * @tc.desc Verify $_set 255 wraps to -1 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, 255);
      let r1 = arr.$_get(0);
      let e1 = -1;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '-1';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3300
     * @tc.name int8ArrayToLocaleStringPart04Test033
     * @tc.desc Verify $_set 256 wraps to 0 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9]);
      arr.$_set(0, 256);
      let r1 = arr.$_get(0);
      let e1 = 0;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '0';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3400
     * @tc.name int8ArrayToLocaleStringPart04Test034
     * @tc.desc Verify $_set Number.NaN truncates to 0 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9]);
      arr.$_set(0, Number.NaN);
      let r1 = arr.$_get(0);
      let e1 = 0;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '0';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3500
     * @tc.name int8ArrayToLocaleStringPart04Test035
     * @tc.desc Verify $_set 1.9 truncates to 1 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, 1.9);
      let r1 = arr.$_get(0);
      let e1 = 1;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '1';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3600
     * @tc.name int8ArrayToLocaleStringPart04Test036
     * @tc.desc Verify $_set -1.9 truncates to -1 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, -1.9);
      let r1 = arr.$_get(0);
      let e1 = -1;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '-1';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3700
     * @tc.name int8ArrayToLocaleStringPart04Test037
     * @tc.desc Verify $_set -0.0 normalizes to 0 in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9]);
      arr.$_set(0, -0.0);
      let r1 = arr.$_get(0);
      let e1 = 0;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '0';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3800
     * @tc.name int8ArrayToLocaleStringPart04Test038
     * @tc.desc Verify DataView write reflected in Int8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int8Array = new Int8Array(buf);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, -1);
      dv.setInt8(1, 2);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '-1,2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_3900
     * @tc.name int8ArrayToLocaleStringPart04Test039
     * @tc.desc Verify two Int8Array views share buffer writes in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let a1: Int8Array = new Int8Array(buf);
      let a2: Int8Array = new Int8Array(buf);
      a1.$_set(0, 99);
      a1.$_set(1, -99);
      let r1 = a2.toLocaleString('en-US');
      let e1 = '99,-99';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4000
     * @tc.name int8ArrayToLocaleStringPart04Test040
     * @tc.desc Verify Int8Array and Uint8Array shared buffer toLocaleString difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let i8: Int8Array = new Int8Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      i8.$_set(0, -1);
      let r1 = u8.toLocaleString('en-US');
      let e1 = '255';
      expect(r1).assertEqual(e1);
      let r2 = i8.toLocaleString('en-US');
      let e2 = '-1';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4100
     * @tc.name int8ArrayToLocaleStringPart04Test041
     * @tc.desc Verify DataView setInt8 changes reflected in Int8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf);
      let dv: DataView = new DataView(buf);
      let s1: string = arr.toLocaleString('en-US');
      dv.setInt8(0, 100);
      let s2: string = arr.toLocaleString('en-US');
      expect(s1).assertEqual('0');
      expect(s2).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4200
     * @tc.name int8ArrayToLocaleStringPart04Test042
     * @tc.desc Verify subarray toLocaleString reflects parent modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(0, 2);
      arr.$_set(0, 9);
      let r1 = view.toLocaleString('en-US');
      let e1 = '9,2';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4300
     * @tc.name int8ArrayToLocaleStringPart04Test043
     * @tc.desc Verify parent toLocaleString reflects subarray modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = arr.subarray(1, 3);
      view.$_set(0, 8);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '1,8,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4400
     * @tc.name int8ArrayToLocaleStringPart04Test044
     * @tc.desc Verify offset view toLocaleString reflects only its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int8Array = new Int8Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let view: Int8Array = new Int8Array(buf, 1, 2);
      let r1 = view.toLocaleString('en-US');
      let e1 = '2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4500
     * @tc.name int8ArrayToLocaleStringPart04Test045
     * @tc.desc Verify overlapping offset views reflect shared modification in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(3);
      let viewA: Int8Array = new Int8Array(buf, 0, 2);
      let viewB: Int8Array = new Int8Array(buf, 1, 2);
      viewA.$_set(1, 7);
      let r1 = viewB.toLocaleString('en-US');
      let e1 = '7,0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4600
     * @tc.name int8ArrayToLocaleStringPart04Test046
     * @tc.desc Verify DataView setUint8 200 reflected as -56 in Int8Array toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let dv: DataView = new DataView(buf);
      let i8: Int8Array = new Int8Array(buf);
      dv.setUint8(0, 200);
      let r1 = i8.toLocaleString('en-US');
      let e1 = '-56';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4700
     * @tc.name int8ArrayToLocaleStringPart04Test047
     * @tc.desc Verify slice copy toLocaleString independent of original modifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let copy: Int8Array = arr.slice(0, 3);
      arr.$_set(0, 9);
      let r1 = copy.toLocaleString('en-US');
      let e1 = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4800
     * @tc.name int8ArrayToLocaleStringPart04Test048
     * @tc.desc Verify subarray shared vs slice copy toLocaleString behavior contrast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sub: Int8Array = arr.subarray(0, 2);
      let slc: Int8Array = arr.slice(0, 2);
      arr.$_set(0, 9);
      let r1 = sub.toLocaleString('en-US');
      let e1 = '9,2';
      expect(r1).assertEqual(e1);
      let r2 = slc.toLocaleString('en-US');
      let e2 = '1,2';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_4900
     * @tc.name int8ArrayToLocaleStringPart04Test049
     * @tc.desc Verify three views Int8Array Uint8Array DataView consistent toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let i8: Int8Array = new Int8Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      let dv: DataView = new DataView(buf);
      dv.setInt8(0, 42);
      let r1 = i8.toLocaleString('en-US');
      let e1 = '42';
      expect(r1).assertEqual(e1);
      let r2 = u8.toLocaleString('en-US');
      let e2 = '42';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5000
     * @tc.name int8ArrayToLocaleStringPart04Test050
     * @tc.desc Verify offset view toLocaleString reflects offset content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(5);
      let base: Int8Array = new Int8Array(buf);
      base.$_set(0, 10);
      base.$_set(1, 20);
      base.$_set(2, 30);
      base.$_set(3, 40);
      base.$_set(4, 50);
      let view: Int8Array = new Int8Array(buf, 3, 2);
      let r1 = view.toLocaleString('en-US');
      let e1 = '40,50';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5100
     * @tc.name int8ArrayToLocaleStringPart04Test051
     * @tc.desc Verify empty ArrayBuffer view toLocaleString returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int8Array = new Int8Array(buf);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '';
      expect(r1).assertEqual(e1);
      let r2 = arr.length;
      let e2 = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5200
     * @tc.name int8ArrayToLocaleStringPart04Test052
     * @tc.desc Verify $_set write consistent with DataView getInt8 and toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      let arr: Int8Array = new Int8Array(buf);
      let dv: DataView = new DataView(buf);
      arr.$_set(0, -7);
      let r1 = dv.getInt8(0);
      let e1 = -7;
      expect(r1).assertEqual(e1);
      let r2 = arr.toLocaleString('en-US');
      let e2 = '-7';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5300
     * @tc.name int8ArrayToLocaleStringPart04Test053
     * @tc.desc Verify independent buffers isolation in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int8Array = new Int8Array([1, 2]);
      let b: Int8Array = new Int8Array([1, 2]);
      a.$_set(0, 9);
      let r1 = a.toLocaleString('en-US');
      let e1 = '9,2';
      expect(r1).assertEqual(e1);
      let r2 = b.toLocaleString('en-US');
      let e2 = '1,2';
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5400
     * @tc.name int8ArrayToLocaleStringPart04Test054
     * @tc.desc Verify nested subarray toLocaleString reflects original modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let outerView: Int8Array = arr.subarray(1, 4);
      let innerView: Int8Array = outerView.subarray(0, 2);
      arr.$_set(1, 9);
      let r1 = innerView.toLocaleString('en-US');
      let e1 = '9,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5500
     * @tc.name int8ArrayToLocaleStringPart04Test055
     * @tc.desc Verify fill reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(7);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '7,7,7';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5600
     * @tc.name int8ArrayToLocaleStringPart04Test056
     * @tc.desc Verify reverse reflected in toLocaleString order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.reverse();
      let r1 = arr.toLocaleString('en-US');
      let e1 = '3,2,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5700
     * @tc.name int8ArrayToLocaleStringPart04Test057
     * @tc.desc Verify sort reflected in toLocaleString numerical order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([3, 1, 2]);
      arr.sort();
      let r1 = arr.toLocaleString('en-US');
      let e1 = '1,2,3';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5800
     * @tc.name int8ArrayToLocaleStringPart04Test058
     * @tc.desc Verify copyWithin reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '3,4,3,4';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_5900
     * @tc.name int8ArrayToLocaleStringPart04Test059
     * @tc.desc Verify copyWithin overlapping range reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      arr.copyWithin(1, 3);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '1,4,5,4,5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_6000
     * @tc.name int8ArrayToLocaleStringPart04Test060
     * @tc.desc Verify set with offset reflected in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(4);
      let src: Int8Array = new Int8Array([10, 20]);
      arr.set(src, 1);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '0,10,20,0';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_6100
     * @tc.name int8ArrayToLocaleStringPart04Test061
     * @tc.desc Verify fill and $_set interleaved final state in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(3);
      arr.fill(5);
      arr.$_set(1, 9);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '5,9,5';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_6200
     * @tc.name int8ArrayToLocaleStringPart04Test062
     * @tc.desc Verify fill overwrites truncated value in toLocaleString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(2);
      arr.$_set(0, 128);
      arr.fill(1);
      let r1 = arr.toLocaleString('en-US');
      let e1 = '1,1';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_6300
     * @tc.name int8ArrayToLocaleStringPart04Test063
     * @tc.desc Verify toLocaleString useGrouping false outputs plain value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, INT8_MAX);
      let opts: TlsOptsGrouping = { useGrouping: false };
      let s: string = arr.toLocaleString('en-US', opts);
      expect(s).assertEqual('127');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_TOLOCALESTRING_PART04_TEST_6400
     * @tc.name int8ArrayToLocaleStringPart04Test064
     * @tc.desc Verify different locales with same write reflected correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayToLocaleStringPart04Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      arr.$_set(0, 42);
      let sEn: string = arr.toLocaleString('en-US');
      let sZh: string = arr.toLocaleString('zh-CN');
      expect(sEn).assertEqual('42');
      expect(sZh).assertEqual('42');
    });
  });
}
