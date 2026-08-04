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

export default function uint16ArrayMap02Test(): void {
  describe('Uint16ArrayMap02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0100
     * @tc.name testUint16ArrayMapTwo001
     * @tc.desc Verify map callback can mutate the source through its array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      arr.map((v: number, i: int, a: Uint16Array): number => {
        a[i] = v + 100;
        return v;
      });
      expect(arr.at(0)).assertEqual(110);
      expect(arr.at(1)).assertEqual(120);
      expect(arr.at(2)).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0200
     * @tc.name testUint16ArrayMapTwo002
     * @tc.desc Verify fn array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number, i: int, a: Uint16Array): number => {
        a[i] = 0;
        return v;
      });
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(0);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0300
     * @tc.name testUint16ArrayMapTwo003
     * @tc.desc Verify fn map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number, i: int, a: Uint16Array): number => {
        if (i === 0) {
          a[1] = 99;
        }
        return v;
      });
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(99);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0400
     * @tc.name testUint16ArrayMapTwo004
     * @tc.desc Verify fn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const external: number[] = [0, 0, 0];
      const arr: Uint16Array = Uint16Array.of(5, 10, 15);
      const result: Uint16Array = arr.map((v: number, i: int): number => {
        external[i] = v;
        return v + external[i];
      });
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0500
     * @tc.name testUint16ArrayMapTwo005
     * @tc.desc Verify fn map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2);
      const innerResult: Uint16Array = arr.map((x: number, _i: int, _a: Uint16Array): number => x * 3);
      const result: Uint16Array = arr.map((v: number, _i: int, _a: Uint16Array): number => v + innerResult.at(Double.toInt(v - 1))!);
      expect(result.at(0)).assertEqual(4);
      expect(result.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0600
     * @tc.name testUint16ArrayMapTwo006
     * @tc.desc Verify fn 0xA 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 0xA);
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0700
     * @tc.name testUint16ArrayMapTwo007
     * @tc.desc Verify fn 0o12 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 0o12);
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0800
     * @tc.name testUint16ArrayMapTwo008
     * @tc.desc Verify fn 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 0b1010);
      expect(result.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_0900
     * @tc.name testUint16ArrayMapTwo009
     * @tc.desc Verify fn 0x8000 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 0x8000);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1000
     * @tc.name testUint16ArrayMapTwo010
     * @tc.desc Verify fn 0xFFFF 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 0xFFFF);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1100
     * @tc.name testUint16ArrayMapTwo011
     * @tc.desc Verify fn 0xFF 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1);
      const result: Uint16Array = arr.map((v: number): number => 0xFF);
      expect(result.at(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1200
     * @tc.name testUint16ArrayMapTwo012
     * @tc.desc Verify fn value + index + array[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(5, 10, 15);
      const result: Uint16Array = arr.map((v: number, i: int, a: Uint16Array): number => v + i + a.at(0)!);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(16);
      expect(result.at(2)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1300
     * @tc.name testUint16ArrayMapTwo013
     * @tc.desc Verify fn value * 10 + index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3);
      const result: Uint16Array = arr.map((v: number, i: int): number => v * 10 + i);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(21);
      expect(result.at(2)).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1400
     * @tc.name testUint16ArrayMapTwo014
     * @tc.desc Verify fn (value << 1) | 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(0, 1, 2);
      const result: Uint16Array = arr.map((v: number): number => (v << 1) | 1);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(3);
      expect(result.at(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1500
     * @tc.name testUint16ArrayMapTwo015
     * @tc.desc Verify fn value & 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(256, 257, 1023);
      const result: Uint16Array = arr.map((v: number): number => v & 0xFF);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(1);
      expect(result.at(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1600
     * @tc.name testUint16ArrayMapTwo016
     * @tc.desc Verify map toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.map((v: number): number => v + 5);
      expect(result.toString()).assertEqual("15,25,35");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1700
     * @tc.name testUint16ArrayMapTwo017
     * @tc.desc Verify map join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(10, 20, 30);
      const result: Uint16Array = arr.map((v: number): number => v * 2);
      expect(result.join("|")).assertEqual("20|40|60");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1800
     * @tc.name testUint16ArrayMapTwo018
     * @tc.desc Verify map on filtered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6);
      const filtered: Uint16Array = arr.filter((v: number): boolean => v % 2 === 0);
      const mapped: Uint16Array = filtered.map((v: number): number => v * 10);
      expect(mapped.length).assertEqual(3);
      expect(mapped.at(0)).assertEqual(20);
      expect(mapped.at(1)).assertEqual(40);
      expect(mapped.at(2)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_1900
     * @tc.name testUint16ArrayMapTwo019
     * @tc.desc Verify map on filled array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint16Array = new Uint16Array(4);
      arr.fill(255);
      const result: Uint16Array = arr.map((v: number, i: int): number => v + i);
      expect(result.at(0)).assertEqual(255);
      expect(result.at(1)).assertEqual(256);
      expect(result.at(2)).assertEqual(257);
      expect(result.at(3)).assertEqual(258);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2000
     * @tc.name testUint16ArrayMapTwo020
     * @tc.desc Verify map empty receiver returns an empty result without callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: Uint16Array = new Uint16Array().map((value: number): number => { count++; return value; });
            expect(result.length).assertEqual(0);
            expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2100
     * @tc.name testUint16ArrayMapTwo021
     * @tc.desc Verify map result is independent from the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let result: Uint16Array = source.map((value: number): number => value);
            result[0] = 99;
            expect(source.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2200
     * @tc.name testUint16ArrayMapTwo022
     * @tc.desc Verify map callback receives the original receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let same: boolean = true;
            source.map((value: number, index: int, array: Uint16Array): number => { same = same && array === source; return value; });
            expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2300
     * @tc.name testUint16ArrayMapTwo023
     * @tc.desc Verify map callback indices increase from zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(3, 4, 5);
            let expected: int = 0;
            source.map((value: number, index: int): number => { expect(index).assertEqual(expected); expected++; return value; });
            expect(expected).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2400
     * @tc.name testUint16ArrayMapTwo024
     * @tc.desc Verify map returned negative value wraps to Uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(1).map((value: number): number => -1);
            expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2500
     * @tc.name testUint16ArrayMapTwo025
     * @tc.desc Verify map returned value above maximum wraps to Uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(1).map((value: number): number => 65536);
            expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2600
     * @tc.name testUint16ArrayMapTwo026
     * @tc.desc Verify map returned fractional value truncates toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(1).map((value: number): number => 9.8);
            expect(result.at(0)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2700
     * @tc.name testUint16ArrayMapTwo027
     * @tc.desc Verify map returned NaN converts to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(1).map((value: number): number => Number.NaN);
            expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2800
     * @tc.name testUint16ArrayMapTwo028
     * @tc.desc Verify map mutation of a later source element affects a later callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let result: Uint16Array = source.map((value: number, index: int, array: Uint16Array): number => { if (index === 0) { array[1] = 20; } return value; });
            expect(result.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_2900
     * @tc.name testUint16ArrayMapTwo029
     * @tc.desc Verify map mutation of an earlier source element does not alter its mapped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2);
            let result: Uint16Array = source.map((value: number, index: int, array: Uint16Array): number => { if (index === 1) { array[0] = 90; } return value; });
            expect(result.at(0)).assertEqual(1);
            expect(source.at(0)).assertEqual(90);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3000
     * @tc.name testUint16ArrayMapTwo030
     * @tc.desc Verify map alias mutation affects an unvisited source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let source: Uint16Array = new Uint16Array(buffer);
            source.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let result: Uint16Array = source.map((value: number, index: int): number => { if (index === 0) { alias[1] = 44; } return value; });
            expect(result.at(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3100
     * @tc.name testUint16ArrayMapTwo031
     * @tc.desc Verify map offset view maps only view elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(10);
            let all: Uint16Array = new Uint16Array(buffer);
            all.set([1, 2, 3, 4, 5]);
            let view: Uint16Array = new Uint16Array(buffer, 4, 2);
            let result: Uint16Array = view.map((value: number): number => value * 2);
            expect(result.at(0)).assertEqual(6);
            expect(result.at(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3200
     * @tc.name testUint16ArrayMapTwo032
     * @tc.desc Verify map callback-thrown RangeError propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { Uint16Array.of(1).map((value: number): number => { throw new RangeError('map range'); }); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('RangeError'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3300
     * @tc.name testUint16ArrayMapTwo033
     * @tc.desc Verify map value plus index preserves result order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.of(10, 10, 10).map((value: number, index: int): number => value + index);
            expect(result.at(0)).assertEqual(10);
            expect(result.at(2)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3400
     * @tc.name testUint16ArrayMapTwo034
     * @tc.desc Verify map read-only callback leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(2, 4);
            source.map((value: number): number => value * 3);
            expect(source.at(0)).assertEqual(2);
            expect(source.at(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3500
     * @tc.name testUint16ArrayMapTwo035
     * @tc.desc Verify map mapped result length equals offset-view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(12);
            let view: Uint16Array = new Uint16Array(buffer, 2, 4);
            let result: Uint16Array = view.map((value: number): number => value + 1);
            expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_MAP_TWO_3600
     * @tc.name testUint16ArrayMapTwo036
     * @tc.desc Verify map captures the current value before callback mutation of the current element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayMapTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1);
      let result: Uint16Array = source.map((value: number, index: int, array: Uint16Array): number => {
        array[index] = 99;
        return value;
      });
      expect(source.at(0)).assertEqual(99);
      expect(result.at(0)).assertEqual(1);
    });

  });
}
