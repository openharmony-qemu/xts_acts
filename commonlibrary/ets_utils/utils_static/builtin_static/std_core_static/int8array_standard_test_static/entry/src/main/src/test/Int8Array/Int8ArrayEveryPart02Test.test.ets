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
  Level,
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function int8ArrayEveryPart02Test(): void {
  describe('Int8ArrayEveryPart02Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0100
     * @tc.name int8ArrayEveryPart02Test001
     * @tc.desc Verify every return typeof===boolean when all elements pass predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0200
     * @tc.name int8ArrayEveryPart02Test002
     * @tc.desc Verify every return typeof===boolean when all elements fail predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0300
     * @tc.name int8ArrayEveryPart02Test003
     * @tc.desc Verify every return typeof===boolean when short-circuit on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0400
     * @tc.name int8ArrayEveryPart02Test004
     * @tc.desc Verify every return typeof===boolean with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0500
     * @tc.name int8ArrayEveryPart02Test005
     * @tc.desc Verify every return typeof===boolean with single truthy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0600
     * @tc.name int8ArrayEveryPart02Test006
     * @tc.desc Verify every return typeof===boolean with single falsy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0700
     * @tc.name int8ArrayEveryPart02Test007
     * @tc.desc Verify every returns true when all elements pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0800
     * @tc.name int8ArrayEveryPart02Test008
     * @tc.desc Verify every returns false when all elements fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_0900
     * @tc.name int8ArrayEveryPart02Test009
     * @tc.desc Verify every returns false short-circuit on first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1000
     * @tc.name int8ArrayEveryPart02Test010
     * @tc.desc Verify every returns false when last element fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1100
     * @tc.name int8ArrayEveryPart02Test011
     * @tc.desc Verify every returns false when middle element fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 2]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1200
     * @tc.name int8ArrayEveryPart02Test012
     * @tc.desc Verify every returns true for empty array (vacuous truth)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1300
     * @tc.name int8ArrayEveryPart02Test013
     * @tc.desc Verify every returns true with single truthy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1400
     * @tc.name int8ArrayEveryPart02Test014
     * @tc.desc Verify every returns false with single falsy element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1500
     * @tc.name int8ArrayEveryPart02Test015
     * @tc.desc Verify every returns true when callback always returns true with mixed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 0, INT8_MAX, -128]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1600
     * @tc.name int8ArrayEveryPart02Test016
     * @tc.desc Verify every returns false when callback always returns false (short-circuit on first)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1700
     * @tc.name int8ArrayEveryPart02Test017
     * @tc.desc Verify every element>= -128 with minValue -128 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, -1, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e >= -128);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1800
     * @tc.name int8ArrayEveryPart02Test018
     * @tc.desc Verify every element<=127 with maxValue 127 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e <= INT8_MAX);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_1900
     * @tc.name int8ArrayEveryPart02Test019
     * @tc.desc Verify every element>0 with negative value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, -1, 2]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2000
     * @tc.name int8ArrayEveryPart02Test020
     * @tc.desc Verify every element>0 all positive returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2100
     * @tc.name int8ArrayEveryPart02Test021
     * @tc.desc Verify every element===0 all zero returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 0, 0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2200
     * @tc.name int8ArrayEveryPart02Test022
     * @tc.desc Verify every element===0 with non-zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 0]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2300
     * @tc.name int8ArrayEveryPart02Test023
     * @tc.desc Verify every element!==0 with zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, 1]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e !== -128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2400
     * @tc.name int8ArrayEveryPart02Test024
     * @tc.desc Verify every index>=0 all satisfy returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => i >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2500
     * @tc.name int8ArrayEveryPart02Test025
     * @tc.desc Verify every index<array.length all satisfy returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => i < a.length);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2600
     * @tc.name int8ArrayEveryPart02Test026
     * @tc.desc Verify every index===0 only first element satisfies returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => i === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2700
     * @tc.name int8ArrayEveryPart02Test027
     * @tc.desc Verify callback array.length===originalLength all satisfy returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        expect(a.length).assertEqual(3);
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2800
     * @tc.name int8ArrayEveryPart02Test028
     * @tc.desc Verify callback array.byteOffset with non-zero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        expect(a.byteOffset).assertEqual(2);
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_2900
     * @tc.name int8ArrayEveryPart02Test029
     * @tc.desc Verify callback array===original reference returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        expect(a).assertEqual(arr);
        return true;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3000
     * @tc.name int8ArrayEveryPart02Test030
     * @tc.desc Verify length unchanged after every call with multi elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.length;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3100
     * @tc.name int8ArrayEveryPart02Test031
     * @tc.desc Verify length unchanged after every call with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let before: int = arr.length;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3200
     * @tc.name int8ArrayEveryPart02Test032
     * @tc.desc Verify length unchanged after every call with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5]);
      let before: int = arr.length;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3300
     * @tc.name int8ArrayEveryPart02Test033
     * @tc.desc Verify byteLength unchanged after every call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.byteLength;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3400
     * @tc.name int8ArrayEveryPart02Test034
     * @tc.desc Verify byteLength===length relationship maintained after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.byteLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3500
     * @tc.name int8ArrayEveryPart02Test035
     * @tc.desc Verify underlying buffer.byteLength unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.buffer.byteLength;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3600
     * @tc.name int8ArrayEveryPart02Test036
     * @tc.desc Verify element values unchanged one by one after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3700
     * @tc.name int8ArrayEveryPart02Test037
     * @tc.desc Verify -128 boundary element unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > -200);
      expect(arr.$_get(0)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3800
     * @tc.name int8ArrayEveryPart02Test038
     * @tc.desc Verify 127 boundary element unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, 0, INT8_MAX]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e < 200);
      expect(arr.$_get(2)).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_3900
     * @tc.name int8ArrayEveryPart02Test039
     * @tc.desc Verify 0 element unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e >= 0);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4000
     * @tc.name int8ArrayEveryPart02Test040
     * @tc.desc Verify toString result unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: string = arr.toString();
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4100
     * @tc.name int8ArrayEveryPart02Test041
     * @tc.desc Verify join result unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: string = arr.join(',');
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.join(',')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4200
     * @tc.name int8ArrayEveryPart02Test042
     * @tc.desc Verify underlying buffer bytes unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let view: Int8Array = new Int8Array(arr.buffer);
      let b0: number = view.$_get(0);
      let b1: number = view.$_get(1);
      let b2: number = view.$_get(2);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(view.$_get(0)).assertEqual(b0);
      expect(view.$_get(1)).assertEqual(b1);
      expect(view.$_get(2)).assertEqual(b2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4300
     * @tc.name int8ArrayEveryPart02Test043
     * @tc.desc Verify buffer reference unchanged after every (same ArrayBuffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: ArrayBuffer = arr.buffer;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4400
     * @tc.name int8ArrayEveryPart02Test044
     * @tc.desc Verify shared view buffer content consistent after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let shared: Int8Array = new Int8Array(arr.buffer);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(shared.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4500
     * @tc.name int8ArrayEveryPart02Test045
     * @tc.desc Verify byteOffset unchanged after every with default zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.byteOffset;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4600
     * @tc.name int8ArrayEveryPart02Test046
     * @tc.desc Verify byteOffset unchanged after every with non-zero offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let before: int = arr.byteOffset;
      arr.every((e: number, i: int, a: Int8Array): boolean => e >= 0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4700
     * @tc.name int8ArrayEveryPart02Test047
     * @tc.desc Verify original array elements unchanged after every on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      view.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4800
     * @tc.name int8ArrayEveryPart02Test048
     * @tc.desc Verify subarray view elements unchanged after every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3, 4]);
      let view: Int8Array = arr.subarray(1, 3);
      view.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(view.$_get(0)).assertEqual(2);
      expect(view.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_4900
     * @tc.name int8ArrayEveryPart02Test049
     * @tc.desc Verify other view elements unchanged after every on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view1: Int8Array = new Int8Array(buf, 0, 2);
      let view2: Int8Array = new Int8Array(buf, 2, 2);
      view1.$_set(0, 1);
      view1.$_set(1, 2);
      view2.$_set(0, 3);
      view2.$_set(1, 4);
      view1.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(view2.$_get(0)).assertEqual(3);
      expect(view2.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5000
     * @tc.name int8ArrayEveryPart02Test050
     * @tc.desc Verify callback executed once and returns false on first-element short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, 2]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5100
     * @tc.name int8ArrayEveryPart02Test051
     * @tc.desc Verify callback executed 3 times and returns false on third-element short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0, 4]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5200
     * @tc.name int8ArrayEveryPart02Test052
     * @tc.desc Verify callback executed length times when all elements pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5300
     * @tc.name int8ArrayEveryPart02Test053
     * @tc.desc Verify callback executed 0 times and returns true for empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: number = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5400
     * @tc.name int8ArrayEveryPart02Test054
     * @tc.desc Verify callback executed length times when last element fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 0]);
      let count: number = 0;
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => {
        count = count + 1;
        return e > 0;
      });
      expect(count).assertEqual(3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5500
     * @tc.name int8ArrayEveryPart02Test055
     * @tc.desc Verify callback not executed for indices after short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3, 4]);
      let visited: boolean = false;
      arr.every((e: number, i: int, a: Int8Array): boolean => {
        if (i >= 2) {
          visited = true;
        }
        return e > 0;
      });
      expect(visited).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5600
     * @tc.name int8ArrayEveryPart02Test056
     * @tc.desc Verify all element values unchanged after short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3, 4]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5700
     * @tc.name int8ArrayEveryPart02Test057
     * @tc.desc Verify length unchanged after short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 3, 4]);
      let before: int = arr.length;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5800
     * @tc.name int8ArrayEveryPart02Test058
     * @tc.desc Verify unvisited elements keep original values after short-circuit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 0, 99, 99]);
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr.$_get(2)).assertEqual(99);
      expect(arr.$_get(3)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_5900
     * @tc.name int8ArrayEveryPart02Test059
     * @tc.desc Verify length unchanged after callback throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.length;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6000
     * @tc.name int8ArrayEveryPart02Test060
     * @tc.desc Verify element values unchanged after callback throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6100
     * @tc.name int8ArrayEveryPart02Test061
     * @tc.desc Verify buffer reference unchanged after callback throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: ArrayBuffer = arr.buffer;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6200
     * @tc.name int8ArrayEveryPart02Test062
     * @tc.desc Verify byteOffset unchanged after callback throws error (non-zero offset view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let before: int = arr.byteOffset;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6300
     * @tc.name int8ArrayEveryPart02Test063
     * @tc.desc Verify byteLength unchanged after callback throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let before: int = arr.byteLength;
      try {
        arr.every((e: number, i: int, a: Int8Array): boolean => {
          throw new Error('boom');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6400
     * @tc.name int8ArrayEveryPart02Test064
     * @tc.desc Verify arr reference unchanged after every (not replaced)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let ref: Int8Array = arr;
      arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(arr).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6500
     * @tc.name int8ArrayEveryPart02Test065
     * @tc.desc Verify modifying return value does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      result = false;
      expect(arr.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6600
     * @tc.name int8ArrayEveryPart02Test066
     * @tc.desc Verify multiple every calls return consistent results (idempotence)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let r1: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      let r2: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6700
     * @tc.name int8ArrayEveryPart02Test067
     * @tc.desc Verify truncated element 200 becomes -56 and callback element===-56 returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([200]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e === -56);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6800
     * @tc.name int8ArrayEveryPart02Test068
     * @tc.desc Verify large array (100 elements) all pass returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      arr.fill(1);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_6900
     * @tc.name int8ArrayEveryPart02Test069
     * @tc.desc Verify large array last element fails returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      arr.fill(1);
      arr.$_set(99, 0);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_7000
     * @tc.name int8ArrayEveryPart02Test070
     * @tc.desc Verify all same elements callback===that value returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e === 7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_7100
     * @tc.name int8ArrayEveryPart02Test071
     * @tc.desc Verify all same elements callback!==that value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7, 7, 7]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e !== 7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_7200
     * @tc.name int8ArrayEveryPart02Test072
     * @tc.desc Verify element>=0 all non-negative returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, 1, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_7300
     * @tc.name int8ArrayEveryPart02Test073
     * @tc.desc Verify element>=0 with negative value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0, -1, INT8_MAX]);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => e >= 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_EVERY_PART02_7400
     * @tc.name int8ArrayEveryPart02Test074
     * @tc.desc Verify empty array with callback returning false still returns true (vacuous truth)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayEveryPart02Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let result: boolean = arr.every((e: number, i: int, a: Int8Array): boolean => false);
      expect(result).assertTrue();
    });
  });
}
