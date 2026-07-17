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

export default function uint16ArrayFrom02Test(): void {
  describe('Uint16ArrayFrom02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0100
     * @tc.name testUint16ArrayFromTwo001
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      source.add(3.0);
      let multiplier: number = 10;
      let result = Uint16Array.from(source, (v: number, k: number): number => v * multiplier);
      expect(result.at(0)).assertEqual(10);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0200
     * @tc.name testUint16ArrayFromTwo002
     * @tc.desc Verify Iterable<number> 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Set<number>();
      let i: number = 0;
      while (i < 100) {
        source.add(i);
        i++;
      }
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(100);
      expect(result.at(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0300
     * @tc.name testUint16ArrayFromTwo003
     * @tc.desc Verify Uint16Array from Uint16Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = new Uint16Array();
      let result = Uint16Array.from(source);
      expect((result.buffer) !== (source.buffer)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0400
     * @tc.name testUint16ArrayFromTwo004
     * @tc.desc Verify FixedArray<int> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: FixedArray<int> = [0, 0, 0, 0];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0500
     * @tc.name testUint16ArrayFromTwo005
     * @tc.desc Verify from Uint16Array with values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(100, 200, 300, 400);
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(100);
      expect(result.at(3)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0600
     * @tc.name testUint16ArrayFromTwo006
     * @tc.desc Verify from with mapfn on Uint16Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3);
      let result = Uint16Array.from(source, (v: number, k: number): number => v * 100);
      expect(result.at(0)).assertEqual(100);
      expect(result.at(1)).assertEqual(200);
      expect(result.at(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0700
     * @tc.name testUint16ArrayFromTwo007
     * @tc.desc Verify from empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [];
      let result = Uint16Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0800
     * @tc.name testUint16ArrayFromTwo008
     * @tc.desc Verify from array with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [-1, -2, -32768];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
      expect(result.at(1)).assertEqual(65534);
      expect(result.at(2)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_0900
     * @tc.name testUint16ArrayFromTwo009
     * @tc.desc Verify from with mapfn using index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [10, 20, 30, 40];
      let result = Uint16Array.from(source, (v: number, k: number): number => k * 500);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(500);
      expect(result.at(3)).assertEqual(1500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1000
     * @tc.name testUint16ArrayFromTwo010
     * @tc.desc Verify from with mapfn on empty source (no calls)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let called: boolean = false;
      let source: Array<number> = [];
      let result = Uint16Array.from(source, (v: number, k: number): number => { called = true; return v; });
      expect(called).assertFalse();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1100
     * @tc.name testUint16ArrayFromTwo011
     * @tc.desc Verify from array with 0xFFFF and 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0xFFFF, 0x8000, 0x7FFF];
      let result = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(65535);
      expect(result.at(1)).assertEqual(32768);
      expect(result.at(2)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1200
     * @tc.name testUint16ArrayFromTwo012
     * @tc.desc Verify from source after modification (copy is independent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result = Uint16Array.from(source);
      source[0] = 999;
      expect(result.at(0)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1300
     * @tc.name testUint16ArrayFromTwo013
     * @tc.desc Verify Uint16Array.from result mutation does not affect the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [1.0, 2.0];
            let result: Uint16Array = Uint16Array.from(source);
            result[0] = 9;
            expect(source.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1400
     * @tc.name testUint16ArrayFromTwo014
     * @tc.desc Verify Uint16Array.from map callback output wraps to Uint16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Uint16Array = Uint16Array.from(Array.of<number>(1.0, 2.0), (value: number): number => value + 65535);
            expect(result.at(0)).assertEqual(0);
            expect(result.at(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1500
     * @tc.name testUint16ArrayFromTwo015
     * @tc.desc Verify Uint16Array.from empty source produces an empty result without map callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let source: Array<number> = [];
            let result: Uint16Array = Uint16Array.from(source, (value: number): number => { count++; return value; });
            expect(result.length).assertEqual(0);
            expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1600
     * @tc.name testUint16ArrayFromTwo016
     * @tc.desc Verify Uint16Array.from copies only the visible range of an offset source view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let source: Uint16Array = new Uint16Array(backing.buffer, 2, 2);
      let result: Uint16Array = Uint16Array.from(source);
      backing[1] = 99;
      result[1] = 77;
      expect(result.length).assertEqual(2);
      expect(result.byteOffset).assertEqual(0);
      expect(result.at(0)).assertEqual(20);
      expect(backing.at(2)).assertEqual(30);
      result[0] = 88;
      expect(source.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1700
     * @tc.name testUint16ArrayFromTwo017
     * @tc.desc Verify Uint16Array.from map callback receives source values before Uint16 conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [-1.0, 65536.0, 3.9];
      let observed: Array<number> = [];
      let result: Uint16Array = Uint16Array.from(source, (value: number): number => {
        observed.push(value);
        return value;
      });
      expect(observed.at(0)).assertEqual(-1);
      expect(observed.at(1)).assertEqual(65536);
      expect(observed.at(2)).assertEqual(3.9);
      expect(result.at(0)).assertEqual(65535);
      expect(result.at(1)).assertEqual(0);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1800
     * @tc.name testUint16ArrayFromTwo018
     * @tc.desc Verify Uint16Array.from collects a Set before invoking the mapping callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Set<number> = new Set<number>();
      source.add(1.0);
      source.add(2.0);
      let count: int = 0;
      let result: Uint16Array = Uint16Array.from(source, (value: number, index: number): number => {
        count++;
        if (index === 0.0) {
          source.add(3.0);
        }
        return value;
      });
      expect(count).assertEqual(3);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(source.size).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_TWO_1900
     * @tc.name testUint16ArrayFromTwo019
     * @tc.desc Verify Uint16Array.from preserves duplicate positions for forward and reverse searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [7.0, 1.0, 7.0, 2.0, 7.0];
      let result: Uint16Array = Uint16Array.from(source);
      expect(result.includes(7)).assertTrue();
      expect(result.indexOf(7)).assertEqual(0);
      expect(result.lastIndexOf(7)).assertEqual(4);
      expect(result.indexOf(7, 1)).assertEqual(2);
      expect(result.lastIndexOf(7, 3)).assertEqual(2);
    });

  });
}
