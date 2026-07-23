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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayFind02Test(): void {
  describe('Uint16ArrayFind02Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0100
     * @tc.name testUint16ArrayFindTwo001
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = -1;
      const result = arr.find((value: number): boolean => value === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0200
     * @tc.name testUint16ArrayFindTwo002
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65536;
      const result = arr.find((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0300
     * @tc.name testUint16ArrayFindTwo003
     * @tc.desc Verify Uint16Array.of find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300, 400, 500);
      const result = arr.find((value: number): boolean => value > 250);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0400
     * @tc.name testUint16ArrayFindTwo004
     * @tc.desc Verify Buffer Uint16Array find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const arr = new Uint16Array(buffer);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const result = arr.find((value: number): boolean => value > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0500
     * @tc.name testUint16ArrayFindTwo005
     * @tc.desc Verify find returns the first matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.find((value: number): boolean => value > 5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0600
     * @tc.name testUint16ArrayFindTwo006
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const r1 = arr.find((value: number): boolean => value > 15);
      const r2 = arr.find((value: number): boolean => value > 35);
      const r3 = arr.find((value: number): boolean => value > 55);
      expect(r1).assertEqual(20);
      expect(r2).assertEqual(40);
      expect(r3).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0700
     * @tc.name testUint16ArrayFindTwo007
     * @tc.desc Verify find value%2===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 3, 5, 6, 7);
      const result = arr.find((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0800
     * @tc.name testUint16ArrayFindTwo008
     * @tc.desc Verify find value%2===1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(2, 4, 6, 7, 8);
      const result = arr.find((value: number): boolean => value % 2 === 1);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_0900
     * @tc.name testUint16ArrayFindTwo009
     * @tc.desc Verify find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 4, 8, 16);
      const result = arr.find((value: number): boolean => (value & 8) === 8);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1000
     * @tc.name testUint16ArrayFindTwo010
     * @tc.desc Verify 0b1111 find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0b1111, 100, 200);
      const result = arr.find((value: number): boolean => value === 15);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1100
     * @tc.name testUint16ArrayFindTwo011
     * @tc.desc Verify find on empty array does not call predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      let called: boolean = false;
      const result = arr.find((value: number): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1200
     * @tc.name testUint16ArrayFindTwo012
     * @tc.desc Verify find predicate throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      try {
        arr.find((value: number): boolean => {
          throw new TypeError('type error in find');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1300
     * @tc.name testUint16ArrayFindTwo013
     * @tc.desc Verify find on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const subarr = arr.subarray(1, 4);
      const result = subarr.find((value: number): boolean => value > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1400
     * @tc.name testUint16ArrayFindTwo014
     * @tc.desc Verify find after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
      arr.fill(65535);
      const result = arr.find((value: number): boolean => value === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1500
     * @tc.name testUint16ArrayFindTwo015
     * @tc.desc Verify find after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
      arr.set([100, 200, 300], 0);
      const result = arr.find((value: number): boolean => value > 150);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1600
     * @tc.name testUint16ArrayFindTwo016
     * @tc.desc Verify find with Uint16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.from([1, 2, 3, 4, 5]);
      const result = arr.find((value: number): boolean => value > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1700
     * @tc.name testUint16ArrayFindTwo017
     * @tc.desc Verify find on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50).reverse();
      const result = arr.find((value: number): boolean => value < 30);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1800
     * @tc.name testUint16ArrayFindTwo018
     * @tc.desc Verify find on sorted array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(50, 20, 40, 10, 30).sort();
      const result = arr.find((value: number): boolean => value > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_1900
     * @tc.name testUint16ArrayFindTwo019
     * @tc.desc Verify find with byteOffset in constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const arr = new Uint16Array(buffer, 4, 4);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const result = arr.find((value: number): boolean => value > 15);
      expect(result).assertEqual(20);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_2000
     * @tc.name testUint16ArrayFindTwo020
     * @tc.desc Verify find no match visits the full receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: Number | undefined = Uint16Array.of(1, 2, 3).find((value: number): boolean => { count++; return false; });
            expect(result).assertUndefined();
            expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_2100
     * @tc.name testUint16ArrayFindTwo021
     * @tc.desc Verify find mutation of a later element can create a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let result: Number | undefined = source.find((value: number, index: int, array: Uint16Array): boolean => { if (index === 0) { array[1] = 20; } return value > 10; });
            expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_2200
     * @tc.name testUint16ArrayFindTwo022
     * @tc.desc Verify find offset view returns a view element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.find((value: number): boolean => value > 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_TWO_2300
     * @tc.name testUint16ArrayFindTwo023
     * @tc.desc Verify find callback-thrown Error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { Uint16Array.of(1).find((value: number): boolean => { throw new Error('find marker'); }); expect().assertFail(); } catch (e) { expect(e.message).assertEqual('find marker'); }
    });

  });
}
