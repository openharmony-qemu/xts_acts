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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayFindLastTest(): void {
  describe('Uint32ArrayFindLastTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0100
     * @tc.name testUint32ArrayFindLastPartOne001
     * @tc.desc Verify findLast predicate v===30 returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 30);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0200
     * @tc.name testUint32ArrayFindLastPartOne002
     * @tc.desc Verify findLast predicate v===20 returns 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 20);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0300
     * @tc.name testUint32ArrayFindLastPartOne003
     * @tc.desc Verify findLast predicate v===10 returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 10);
      expect(r).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0400
     * @tc.name testUint32ArrayFindLastPartOne004
     * @tc.desc Verify findLast single element v===7 returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 7);
      expect(r).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0500
     * @tc.name testUint32ArrayFindLastPartOne005
     * @tc.desc Verify predicate 1 3 (4 ) ( 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 20 || v === 40);
      expect(r).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0600
     * @tc.name testUint32ArrayFindLastPartOne006
     * @tc.desc Verify predicate 0 (5 ) ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44, 55);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 11);
      expect(r).assertEqual(11);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0700
     * @tc.name testUint32ArrayFindLastPartOne007
     * @tc.desc Verify predicate 25 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 15, 25, 35, 45);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v > 25);
      expect(r).assertEqual(45);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0800
     * @tc.name testUint32ArrayFindLastPartOne008
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let calls: number = 0;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { calls = calls + 1; return v === 30; });
      expect(calls).assertEqual(1);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_0900
     * @tc.name testUint32ArrayFindLastPartOne009
     * @tc.desc Verify array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => a[a.length - 1] === 9);
      expect(r).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1000
     * @tc.name testUint32ArrayFindLastPartOne010
     * @tc.desc Verify value array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3, 6, 9);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === a[a.length - 1]);
      expect(r).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1100
     * @tc.name testUint32ArrayFindLastPartOne011
     * @tc.desc Verify index length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => i === a.length - 2);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1200
     * @tc.name testUint32ArrayFindLastPartOne012
     * @tc.desc Verify value array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(30, 20, 30, 20);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === a[0]);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1300
     * @tc.name testUint32ArrayFindLastPartOne013
     * @tc.desc Verify 4 1 index [3,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      let order: number[] = [];
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { order.push(i); return v === 20; });
      expect(order.length).assertEqual(3);
      expect(order[0]).assertEqual(3);
      expect(order[2]).assertEqual(1);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1400
     * @tc.name testUint32ArrayFindLastPartOne014
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 200);
      let calls: number = 0;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { calls = calls + 1; return v === 200; });
      expect(calls).assertEqual(1);
      expect(r).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1500
     * @tc.name testUint32ArrayFindLastPartOne015
     * @tc.desc Verify 5 ( 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 9, 5, 9, 5);
      let matchIndex: number = -1;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (v === 5) { matchIndex = i; return true; } return false; });
      expect(matchIndex).assertEqual(4);
      expect(r).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1600
     * @tc.name testUint32ArrayFindLastPartOne016
     * @tc.desc Verify 20 0 3 ( 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(20, 30, 40, 20, 50);
      let matchIndex: number = -1;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (v === 20) { matchIndex = i; return true; } return false; });
      expect(matchIndex).assertEqual(3);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1700
     * @tc.name testUint32ArrayFindLastPartOne017
     * @tc.desc Verify 10 5 index [9,8,7,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      let order: number[] = [];
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { order.push(i); return v === 5; });
      expect(order.length).assertEqual(5);
      expect(order[0]).assertEqual(9);
      expect(order[4]).assertEqual(5);
      expect(r).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1800
     * @tc.name testUint32ArrayFindLastPartOne018
     * @tc.desc Verify predicate (index 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      try {
        arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (i === 0) { throw new Error('error'); } return false; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_1900
     * @tc.name testUint32ArrayFindLastPartOne019
     * @tc.desc Verify predicate 0 (index 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(99, 88, 77);
      try {
        arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (i === 1) { throw new Error('before-match'); } return v === 99; });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2000
     * @tc.name testUint32ArrayFindLastPartOne020
     * @tc.desc Verify 0 predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 0, 2);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2100
     * @tc.name testUint32ArrayFindLastPartOne021
     * @tc.desc Verify uint32.MAX (4294967295) predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 4294967295, 2);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 4294967295);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2200
     * @tc.name testUint32ArrayFindLastPartOne022
     * @tc.desc Verify 0xFFFFFFFF( ) predicate 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 0xFFFFFFFF, 2);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 4294967295);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2300
     * @tc.name testUint32ArrayFindLastPartOne023
     * @tc.desc Verify 0x80000000(=2147483648) predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 0x80000000, 2);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 2147483648);
      expect(r).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2400
     * @tc.name testUint32ArrayFindLastPartOne024
     * @tc.desc Verify 2147483647(int32 ) predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2147483647, 2);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 2147483647);
      expect(r).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2500
     * @tc.name testUint32ArrayFindLastPartOne025
     * @tc.desc Verify $_set -1( 4294967295) predicate 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      arr[0] = -1;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 4294967295);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2600
     * @tc.name testUint32ArrayFindLastPartOne026
     * @tc.desc Verify $_set 4294967296( 0) predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      arr[0] = 4294967296;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2700
     * @tc.name testUint32ArrayFindLastPartOne027
     * @tc.desc Verify $_set 3.14( 3) predicate 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      arr[0] = 3.14;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 3);
      expect(r).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2800
     * @tc.name testUint32ArrayFindLastPartOne028
     * @tc.desc Verify $_set Number.NaN( 0) predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      arr[0] = Number.NaN;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 0);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_2900
     * @tc.name testUint32ArrayFindLastPartOne029
     * @tc.desc Verify $_set 9007199254740991(2^53-1 uint32 ) predicate 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(3);
      arr[0] = 9007199254740991;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 4294967295);
      expect(r).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3000
     * @tc.name testUint32ArrayFindLastPartOne030
     * @tc.desc Verify 0o17( =15) predicate 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0o17, 16, 17);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 15);
      expect(r).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3100
     * @tc.name testUint32ArrayFindLastPartOne031
     * @tc.desc Verify 0b1111( =15) predicate 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0b1111, 16, 17);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 15);
      expect(r).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3200
     * @tc.name testUint32ArrayFindLastPartOne032
     * @tc.desc Verify 0 predicate 0( 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      let matchIndex: number = -1;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (v === 0) { matchIndex = i; return true; } return false; });
      expect(matchIndex).assertEqual(2);
      expect(r).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3300
     * @tc.name testUint32ArrayFindLastPartOne033
     * @tc.desc Verify 5 predicate ( 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      let matchIndex: number = -1;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (v === 5) { matchIndex = i; return true; } return false; });
      expect(matchIndex).assertEqual(2);
      expect(r).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3400
     * @tc.name testUint32ArrayFindLastPartOne034
     * @tc.desc Verify 50 (49)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      for (let i = 0; i < 50; i++) { src.push(i); }
      const arr: Uint32Array = Uint32Array.from(src);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 49);
      expect(r).assertEqual(49);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3500
     * @tc.name testUint32ArrayFindLastPartOne035
     * @tc.desc Verify 50 (1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      for (let i = 0; i < 50; i++) { src.push(i + 1); }
      const arr: Uint32Array = Uint32Array.from(src);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === 1);
      expect(r).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3600
     * @tc.name testUint32ArrayFindLastPartOne036
     * @tc.desc Verify predicate value ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.findLast((v: number) => v === 20);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3700
     * @tc.name testUint32ArrayFindLastPartOne037
     * @tc.desc Verify predicate value index ( array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.findLast((v: number, i: int) => i === 1);
      expect(r).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3800
     * @tc.name testUint32ArrayFindLastPartOne038
     * @tc.desc Verify predicate sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4, 5);
      let sum: number = 0;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { sum = sum + v; return sum > 12; });
      expect(r).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_3900
     * @tc.name testUint32ArrayFindLastPartOne039
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40, 50);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => i % 2 === 0);
      expect(r).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4000
     * @tc.name testUint32ArrayFindLastPartOne040
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40, 50);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => i % 2 === 1);
      expect(r).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4100
     * @tc.name testUint32ArrayFindLastPartOne041
     * @tc.desc Verify predicate index===0 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => i === 0);
      expect(r).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4200
     * @tc.name testUint32ArrayFindLastPartOne042
     * @tc.desc Verify predicate v===a[a.length-1]-10 returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === a[a.length - 1] - 10);
      expect(r).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4300
     * @tc.name testUint32ArrayFindLastPartOne043
     * @tc.desc Verify predicate 35 ( ) 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 50, 20, 40, 30);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v > 35);
      expect(r).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4400
     * @tc.name testUint32ArrayFindLastPartOne044
     * @tc.desc Verify predicate 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33, 44, 55);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v % 2 === 0);
      expect(r).assertEqual(44);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4500
     * @tc.name testUint32ArrayFindLastPartOne045
     * @tc.desc Verify predicate v===i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 2, 5, 4);
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => v === i);
      expect(r).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLAST_PARTONE_4600
     * @tc.name testUint32ArrayFindLastPartOne046
     * @tc.desc Verify 0 predicate 0( 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 1, 0, 2, 0);
      let matchIndex: number = -1;
      const r = arr.findLast(
        (v: number, i: int, a: Uint32Array) => { if (v === 0) { matchIndex = i; return true; } return false; });
      expect(matchIndex).assertEqual(4);
      expect(r).assertEqual(0);
    });

  });
}
