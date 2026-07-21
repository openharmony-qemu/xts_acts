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

export default function uint16ArrayFindLastIndex02Test(): void {
  describe('Uint16ArrayFindLastIndex02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0100
     * @tc.name testUint16ArrayFindLastIndexTwo001
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0200
     * @tc.name testUint16ArrayFindLastIndexTwo002
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => (value + 10) > 30);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0300
     * @tc.name testUint16ArrayFindLastIndexTwo003
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10 || value === 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0400
     * @tc.name testUint16ArrayFindLastIndexTwo004
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 10 && value !== 20);
      expect(result).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0500
     * @tc.name testUint16ArrayFindLastIndexTwo005
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value / 10 === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0600
     * @tc.name testUint16ArrayFindLastIndexTwo006
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value / 10 === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0700
     * @tc.name testUint16ArrayFindLastIndexTwo007
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(3, 6, 9);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0800
     * @tc.name testUint16ArrayFindLastIndexTwo008
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 10 && index < 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_0900
     * @tc.name testUint16ArrayFindLastIndexTwo009
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let count: number = 0;
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => {
        count++;
        return value < 15;
      });
      expect(result).assertEqual(0);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1000
     * @tc.name testUint16ArrayFindLastIndexTwo010
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let threshold: number = 15;
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > threshold);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1100
     * @tc.name testUint16ArrayFindLastIndexTwo011
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sum: number = 0;
      let arr: Uint16Array = Uint16Array.of(5, 10, 15);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => {
        sum = sum + value;
        return value > 10;
      });
      expect(result).assertEqual(2);
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1200
     * @tc.name testUint16ArrayFindLastIndexTwo012
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let external: Uint16Array = Uint16Array.of(0, 0, 0);
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => {
        external[index] = value;
        return value === 20;
      });
      expect(result).assertEqual(1);
      expect(external.at(0)).assertEqual(0);
      expect(external.at(1)).assertEqual(20);
      expect(external.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1300
     * @tc.name testUint16ArrayFindLastIndexTwo013
     * @tc.desc Verify findLastIndex propagates a callback-thrown Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      try {
        arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => {
          throw new Error("findLastIndex error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("findLastIndex error");
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1400
     * @tc.name testUint16ArrayFindLastIndexTwo014
     * @tc.desc Verify findLastIndex propagates an Error thrown at the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      try {
        arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => {
          if (index === 2) {
            throw new Error("error at last");
          }
          return value > 5;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
        expect(e.message).assertEqual("error at last");
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1500
     * @tc.name testUint16ArrayFindLastIndexTwo015
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      try {
        arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => {
          throw new RangeError("range index error");
        });
        expect().assertFail();
      } catch (e) {
        let err: Error = e as Error;
        expect(err.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1600
     * @tc.name testUint16ArrayFindLastIndexTwo016
     * @tc.desc Verify findLastIndex int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 20);
      expect(typeof result).assertEqual("int");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1700
     * @tc.name testUint16ArrayFindLastIndexTwo017
     * @tc.desc Verify findLastIndex on Uint16Array.from with mapFn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.from(Array.of<number>(1.0, 2.0, 3.0, 4.0), (x: number): number => x * 10);
      let result: int = arr.findLastIndex((value: number): boolean => value > 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1800
     * @tc.name testUint16ArrayFindLastIndexTwo018
     * @tc.desc Verify findLastIndex on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40).reverse();
      let result: int = arr.findLastIndex((value: number): boolean => value < 25);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_1900
     * @tc.name testUint16ArrayFindLastIndexTwo019
     * @tc.desc Verify findLastIndex empty receiver returns minus one without callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: int = new Uint16Array().findLastIndex((value: number): boolean => { count++; return true; });
            expect(result).assertEqual(-1);
            expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2000
     * @tc.name testUint16ArrayFindLastIndexTwo020
     * @tc.desc Verify findLastIndex rightmost matching index is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.of(2, 4, 2).findLastIndex((value: number): boolean => value === 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2100
     * @tc.name testUint16ArrayFindLastIndexTwo021
     * @tc.desc Verify findLastIndex always-true predicate invokes callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: int = Uint16Array.of(1, 2, 3).findLastIndex((value: number): boolean => { count++; return true; });
            expect(result).assertEqual(2);
            expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2200
     * @tc.name testUint16ArrayFindLastIndexTwo022
     * @tc.desc Verify findLastIndex no match scans indices in descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let order: Array<number> = [];
            let result: int = Uint16Array.of(1, 2, 3).findLastIndex((value: number, index: int): boolean => { order.push(index); return false; });
            expect(result).assertEqual(-1);
            expect(order.length).assertEqual(3);
            expect(order.at(0)).assertEqual(2);
            expect(order.at(1)).assertEqual(1);
            expect(order.at(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2300
     * @tc.name testUint16ArrayFindLastIndexTwo023
     * @tc.desc Verify findLastIndex mutation of a lower unvisited index can create a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let result: int = source.findLastIndex((value: number, index: int, array: Uint16Array): boolean => { if (index === 2) { array[1] = 20; } return value > 10; });
            expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2400
     * @tc.name testUint16ArrayFindLastIndexTwo024
     * @tc.desc Verify findLastIndex mutation of a higher visited index is not revisited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let count: int = 0;
            let result: int = source.findLastIndex((value: number, index: int, array: Uint16Array): boolean => { count++; if (index === 1) { array[2] = 30; } return false; });
            expect(result).assertEqual(-1);
            expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2500
     * @tc.name testUint16ArrayFindLastIndexTwo025
     * @tc.desc Verify findLastIndex alias mutation affects a lower unvisited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let source: Uint16Array = new Uint16Array(buffer);
            source.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let result: int = source.findLastIndex((value: number, index: int): boolean => { if (index === 2) { alias[1] = 40; } return value > 10; });
            expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2600
     * @tc.name testUint16ArrayFindLastIndexTwo026
     * @tc.desc Verify findLastIndex offset view returns a view-relative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 2, 3, 9);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.findLastIndex((value: number): boolean => value < 9)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2700
     * @tc.name testUint16ArrayFindLastIndexTwo027
     * @tc.desc Verify findLastIndex callback-thrown RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { Uint16Array.of(1).findLastIndex((value: number): boolean => { throw new RangeError('findLastIndex range'); }); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('RangeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_TWO_2800
     * @tc.name testUint16ArrayFindLastIndexTwo028
     * @tc.desc Verify findLastIndex rightmost zero index is found among boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.of(0, 65535, 0).findLastIndex((value: number): boolean => value === 0)).assertEqual(2);
    });

  });
}
