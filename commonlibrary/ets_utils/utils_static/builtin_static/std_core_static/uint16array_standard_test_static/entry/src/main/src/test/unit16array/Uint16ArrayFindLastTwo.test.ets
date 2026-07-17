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

export default function uint16ArrayFindLast02Test(): void {
  describe('Uint16ArrayFindLast02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0100
     * @tc.name testUint16ArrayFindLast02_001
     * @tc.desc Verify 0b10 ===2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0b10]);
      let result: number = arr.findLast((v: number): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0200
     * @tc.name testUint16ArrayFindLast02_002
     * @tc.desc Verify new Uint16Array(buffer) findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buffer);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      let result: number = arr.findLast((v: number): boolean => v > 15);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0300
     * @tc.name testUint16ArrayFindLast02_003
     * @tc.desc Verify byteOffset findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buffer: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buffer, 2, 3);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 300;
      let result: number = arr.findLast((v: number): boolean => v > 150);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0400
     * @tc.name testUint16ArrayFindLast02_004
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.findLast((v: number): boolean => v > 20 && v < 50);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0500
     * @tc.name testUint16ArrayFindLast02_005
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.findLast((v: number): boolean => v === 10 || v === 50);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0600
     * @tc.name testUint16ArrayFindLast02_006
     * @tc.desc Verify map findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let mapped: Uint16Array = arr.map((v: number): number => v * 10);
      let result: number = mapped.findLast((v: number): boolean => v > 25);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0700
     * @tc.name testUint16ArrayFindLast02_007
     * @tc.desc Verify filter findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let filtered: Uint16Array = arr.filter((v: number): boolean => v > 20);
      let result: number = filtered.findLast((v: number): boolean => v < 45);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0800
     * @tc.name testUint16ArrayFindLast02_008
     * @tc.desc Verify reverse findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let rev: Uint16Array = arr.reverse();
      let result: number = rev.findLast((v: number): boolean => v > 3);
      expect(result).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_0900
     * @tc.name testUint16ArrayFindLast02_009
     * @tc.desc Verify findLast returns the rightmost value divisible by 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let findLastResult: number = arr.findLast((v: number): boolean => v % 20 === 0);
      expect(findLastResult).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1000
     * @tc.name testUint16ArrayFindLast02_010
     * @tc.desc Verify Uint16Array.of findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(5, 10, 15, 20);
      let result: number = arr.findLast((v: number): boolean => v > 12);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1100
     * @tc.name testUint16ArrayFindLast02_011
     * @tc.desc Verify Uint16Array.from findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.from([1, 2, 3, 4, 5]);
      let result: number = arr.findLast((v: number): boolean => v > 3);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1200
     * @tc.name testUint16ArrayFindLast02_012
     * @tc.desc Verify Uint16Array.from with mapFn findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.from(Array.of<number>(1.0, 2.0, 3.0), (v: number): number => v * 10);
      let result: number = arr.findLast((v: number): boolean => v > 15);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1300
     * @tc.name testUint16ArrayFindLast02_013
     * @tc.desc Verify sorted array findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(30, 10, 40, 20).sort();
      let result: number = arr.findLast((v: number): boolean => v > 25);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1400
     * @tc.name testUint16ArrayFindLast02_014
     * @tc.desc Verify findLast rightmost matching value is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.of(2, 4, 6).findLast((value: number): boolean => value % 2 === 0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1500
     * @tc.name testUint16ArrayFindLast02_015
     * @tc.desc Verify findLast always-true predicate invokes callback once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
            let result: Number | undefined = Uint16Array.of(1, 2, 3).findLast((value: number): boolean => { count++; return true; });
            expect(result).assertEqual(3);
            expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1600
     * @tc.name testUint16ArrayFindLast02_016
     * @tc.desc Verify findLast mutation of a lower unvisited index is observed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Uint16Array = Uint16Array.of(1, 2, 3);
            let result: Number | undefined = source.findLast((value: number, index: int, array: Uint16Array): boolean => { if (index === 2) { array[1] = 20; } return value > 10; });
            expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1700
     * @tc.name testUint16ArrayFindLast02_017
     * @tc.desc Verify findLast alias mutation affects a lower unvisited element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let source: Uint16Array = new Uint16Array(buffer);
            source.set([1, 2, 3]);
            let alias: Uint16Array = new Uint16Array(buffer);
            let result: Number | undefined = source.findLast((value: number, index: int): boolean => { if (index === 2) { alias[1] = 40; } return value > 10; });
            expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1800
     * @tc.name testUint16ArrayFindLast02_018
     * @tc.desc Verify findLast offset view searches only its own range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 2, 3, 8);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.findLast((value: number): boolean => value < 9)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_1900
     * @tc.name testUint16ArrayFindLast02_019
     * @tc.desc Verify findLast callback-thrown Error propagates with message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try { Uint16Array.of(1).findLast((value: number): boolean => { throw new Error('findLast marker'); }); expect().assertFail(); } catch (e) { expect(e.name).assertEqual('Error'); expect(e.message).assertEqual('findLast marker'); }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST02_2000
     * @tc.name testUint16ArrayFindLast02_020
     * @tc.desc Verify findLast rightmost Uint16 maximum is returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast02_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Uint16Array.of(65534, 0, 65535).findLast((value: number): boolean => value >= 65534)).assertEqual(65535);
    });

  });
}
