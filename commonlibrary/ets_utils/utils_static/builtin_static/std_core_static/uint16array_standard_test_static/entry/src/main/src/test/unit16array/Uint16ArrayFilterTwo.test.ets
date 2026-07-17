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

export default function uint16ArrayFilter02Test(): void {
  describe('Uint16ArrayFilter02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0001
     * @tc.name testUint16ArrayFilterTwo001
     * @tc.desc Verify slice filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let sliced: Uint16Array = arr.slice(1, 4);
      let result: Uint16Array = sliced.filter((v: number): boolean => v % 2 === 0);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0002
     * @tc.name testUint16ArrayFilterTwo002
     * @tc.desc Verify map filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let mapped: Uint16Array = arr.map((v: number): number => v * 10);
      let result: Uint16Array = mapped.filter((v: number): boolean => v > 30);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(40);
      expect(result.at(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0003
     * @tc.name testUint16ArrayFilterTwo003
     * @tc.desc Verify Uint16Array.of filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 25);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(30);
      expect(result.at(1)).assertEqual(40);
      expect(result.at(2)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0004
     * @tc.name testUint16ArrayFilterTwo004
     * @tc.desc Verify Uint16Array.from filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: number[] = [5, 10, 15, 20, 25];
      let arr: Uint16Array = Uint16Array.from(src);
      let result: Uint16Array = arr.filter((v: number): boolean => v % 10 === 0);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0005
     * @tc.name testUint16ArrayFilterTwo005
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 0, 2]);
      let result: Uint16Array = arr.filter((v: number): boolean => v !== 0);
      expect(result.length).assertEqual(2);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0006
     * @tc.name testUint16ArrayFilterTwo006
     * @tc.desc Verify 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 65535, 2, 65535]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 0 || v === 65535);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(65535);
      expect(result.at(2)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0007
     * @tc.name testUint16ArrayFilterTwo007
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      arr.filter((v: number): boolean => {
        callCount++;
        return true;
      });
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0008
     * @tc.name testUint16ArrayFilterTwo008
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 20]);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 10);
      let arr1: number[] = [];
      for (let i: int = 0; i < result.length; i++) {
        arr1.push(result[i]);
      }
      expect(arr1.length).assertEqual(2);
      expect(arr1.at(0)).assertEqual(15);
      expect(arr1.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0009
     * @tc.name testUint16ArrayFilterTwo009
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 20, 25, 30]);
      let result: Uint16Array = arr.filter((v: number): boolean => (v > 10 && v < 30) || v === 5);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(5);
      expect(result.at(1)).assertEqual(15);
      expect(result.at(2)).assertEqual(20);
      expect(result.at(3)).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0010
     * @tc.name testUint16ArrayFilterTwo010
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 0, 1, 0]);
      let result: Uint16Array = arr.filter((v: number): boolean => v === 1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0011
     * @tc.name testUint16ArrayFilterTwo011
     * @tc.desc Verify filter !==
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 3]);
      let result: Uint16Array = arr.filter((v: number): boolean => v !== 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0012
     * @tc.name testUint16ArrayFilterTwo012
     * @tc.desc Verify filter after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(5);
      arr.fill(42);
      arr[2] = 99;
      let result: Uint16Array = arr.filter((v: number): boolean => v === 42);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(42);
      expect(result[3]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0013
     * @tc.name testUint16ArrayFilterTwo013
     * @tc.desc Verify filter after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(6);
      arr.set([10, 20, 30], 0);
      let result: Uint16Array = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0014
     * @tc.name testUint16ArrayFilterTwo014
     * @tc.desc Verify filter empty receiver returns an empty result without callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: Uint16Array = new Uint16Array().filter((value: number): boolean => { count++; return true; });
            expect(result.length).assertEqual(0);
            expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0015
     * @tc.name testUint16ArrayFilterTwo015
     * @tc.desc Verify filter always-false predicate returns an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(1, 2).filter((value: number): boolean => false);
            expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0016
     * @tc.name testUint16ArrayFilterTwo016
     * @tc.desc Verify filter always-true predicate preserves order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(3, 1, 2).filter((value: number): boolean => true);
            expect(result.at(0)).assertEqual(3);
            expect(result.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0017
     * @tc.name testUint16ArrayFilterTwo017
     * @tc.desc Verify filter duplicate matching values are all preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(2, 1, 2, 2).filter((value: number): boolean => value === 2);
            expect(result.length).assertEqual(3);
            expect(result[0]).assertEqual(2);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0018
     * @tc.name testUint16ArrayFilterTwo018
     * @tc.desc Verify filter result is independent from the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let result: Uint16Array = source.filter((value: number): boolean => true);
            result[0] = 9;
            expect(source.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0019
     * @tc.name testUint16ArrayFilterTwo019
     * @tc.desc Verify filter callback receives increasing indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expected: int = 0;
            Uint16Array.of(1, 2, 3).filter((value: number, index: int): boolean => { expect(index).assertEqual(expected); expected++; return true; });
            expect(expected).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0020
     * @tc.name testUint16ArrayFilterTwo020
     * @tc.desc Verify filter callback receives the original receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let same: boolean = false;
            let callCount: int = 0;
            let result: Uint16Array = source.filter((value: number, index: int, array: Uint16Array): boolean => { same = array === source; callCount++; return true; });
            expect(callCount).assertEqual(2);
            expect(result.length).assertEqual(2);
            expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0021
     * @tc.name testUint16ArrayFilterTwo021
     * @tc.desc Verify filter mutation of a later element affects later filtering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let result: Uint16Array = source.filter((value: number, index: int, array: Uint16Array): boolean => { if (index === 0) { array[1] = 20; } return value > 10; });
            expect(result.at(0)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0022
     * @tc.name testUint16ArrayFilterTwo022
     * @tc.desc Verify filter alias mutation affects an unvisited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let source: Uint16Array = new Uint16Array(buffer);
            source.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let result: Uint16Array = source.filter((value: number, index: int): boolean => { if (index === 0) { alias[1] = 40; } return value > 10; });
            expect(result.at(0)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0023
     * @tc.name testUint16ArrayFilterTwo023
     * @tc.desc Verify filter offset view filters only view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 3, 4);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            let result: Uint16Array = view.filter((value: number): boolean => value > 1);
            expect(result.length).assertEqual(2);
            expect(result.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0024
     * @tc.name testUint16ArrayFilterTwo024
     * @tc.desc Verify filter callback-thrown RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { Uint16Array.of(1).filter((value: number): boolean => { throw new RangeError('filter range'); }); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('RangeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0025
     * @tc.name testUint16ArrayFilterTwo025
     * @tc.desc Verify filter boundary values can be selected independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(0, 32768, 65535).filter((value: number): boolean => value === 0 || value === 65535);
            expect(result.length).assertEqual(2);
            expect(result.at(1)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FILTER_TWO_0026
     * @tc.name testUint16ArrayFilterTwo026
     * @tc.desc Verify filter read-only predicate leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFilterTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(4, 5);
            source.filter((value: number): boolean => value > 0);
            expect(source.at(0)).assertEqual(4);
            expect(source.at(1)).assertEqual(5);
    });

  });
}
