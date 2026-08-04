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

export default function uint32ArrayFindIndexTest2(): void {
  describe('Uint32ArrayFindIndexTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0100
     * @tc.name testUint32ArrayFindIndexPartTwo001
     * @tc.desc Verify findIndex 50-element value===49 returns 49
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(50);
      for (let i = 0; i < 50; i++) {
        values[i] = i;
      }
      const r = values.findIndex((value: number, index: int, array: Uint32Array) => value === 49);
      expect(r).assertEqual(49);
    });







    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0200
     * @tc.name testUint32ArrayFindIndexPartTwo002
     * @tc.desc Verify length-1 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(10);
      for (let i = 0; i < 10; i++) {
        values[i] = i;
      }
      const r = values.findIndex((value: number, index: int, array: Uint32Array) => value === 9);
      expect(r).assertEqual(9);
    });






    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0300
     * @tc.name testUint32ArrayFindIndexPartTwo003
     * @tc.desc Verify index (index > 3) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(8);
      for (let i = 0; i < 8; i++) {
        values[i] = i;
      }
      const r = values.findIndex((value: number, index: int, array: Uint32Array) => index > 3);
      expect(r).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0400
     * @tc.name testUint32ArrayFindIndexPartTwo004
     * @tc.desc Verify (100 ) 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        values[i] = i;
      }
      const r = values.findIndex((value: number, index: int, array: Uint32Array) => value > 98);
      expect(r).assertEqual(99);
    });















    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0500
     * @tc.name testUint32ArrayFindIndexPartTwo005
     * @tc.desc Verify findIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const before: number = values.length;
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(r).assertEqual(1);
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0600
     * @tc.name testUint32ArrayFindIndexPartTwo006
     * @tc.desc Verify findIndex length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      const before: number = values.length;
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 0);
      expect(r).assertEqual(-1);
      expect(values.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0700
     * @tc.name testUint32ArrayFindIndexPartTwo007
     * @tc.desc Verify findIndex byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 30);
      expect(r).assertEqual(2);
      expect(values.byteLength).assertEqual(values.length * 4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0800
     * @tc.name testUint32ArrayFindIndexPartTwo008
     * @tc.desc Verify findIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(6);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 1);
      expect(r).assertEqual(-1);
      expect(values.length).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_0900
     * @tc.name testUint32ArrayFindIndexPartTwo009
     * @tc.desc Verify findIndex byteOffset 0 (of )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 10);
      expect(r).assertEqual(0);
      expect(values.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1000
     * @tc.name testUint32ArrayFindIndexPartTwo010
     * @tc.desc Verify findIndex length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(7);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 7);
      expect(r).assertEqual(0);
      expect(values.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1100
     * @tc.name testUint32ArrayFindIndexPartTwo011
     * @tc.desc Verify findIndex byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(0);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 0);
      expect(r).assertEqual(-1);
      expect(values.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1200
     * @tc.name testUint32ArrayFindIndexPartTwo012
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(r).assertEqual(1);
      expect(values[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1300
     * @tc.name testUint32ArrayFindIndexPartTwo013
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const snapshot: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 30);
      expect(r).assertEqual(2);
      for (let i = 0; i < values.length; i++) {
        expect(values[i]).assertEqual(snapshot[i]);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1400
     * @tc.name testUint32ArrayFindIndexPartTwo014
     * @tc.desc Verify findIndex 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 4294967295, 0);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 4294967295);
      expect(r).assertEqual(1);
      expect(values[1]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1500
     * @tc.name testUint32ArrayFindIndexPartTwo015
     * @tc.desc Verify findIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 1, 2);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 1);
      expect(r).assertEqual(1);
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1600
     * @tc.name testUint32ArrayFindIndexPartTwo016
     * @tc.desc Verify findIndex buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      const bufBefore: ArrayBuffer = values.buffer;
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(r).assertEqual(1);
      expect(values.buffer).assertEqual(bufBefore);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1700
     * @tc.name testUint32ArrayFindIndexPartTwo017
     * @tc.desc Verify findIndex 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 30);
      expect(r).assertEqual(2);
      expect(values[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1800
     * @tc.name testUint32ArrayFindIndexPartTwo018
     * @tc.desc Verify 5 findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const r: int = values.findIndex((value: number, index: int, array: Uint32Array) => value === 3);
      expect(r).assertEqual(2);
      expect(values[0]).assertEqual(1);
      expect(values[4]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_1900
     * @tc.name testUint32ArrayFindIndexPartTwo019
     * @tc.desc Verify findIndex toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(values.toString()).assertEqual('10,20,30');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2000
     * @tc.name testUint32ArrayFindIndexPartTwo020
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      values.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      values[0] = 777;
      expect(values[0]).assertEqual(777);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2100
     * @tc.name testUint32ArrayFindIndexPartTwo021
     * @tc.desc Verify findIndex subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      const before: number = view.length;
      view.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(view.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2200
     * @tc.name testUint32ArrayFindIndexPartTwo022
     * @tc.desc Verify findIndex on subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      const r = view.findIndex((value: number, index: int, array: Uint32Array) => value === 30);
      expect(r).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2300
     * @tc.name testUint32ArrayFindIndexPartTwo023
     * @tc.desc Verify findIndex on buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const a: Uint32Array = new Uint32Array(buf, 0, 4);
      const b: Uint32Array = new Uint32Array(buf, 0, 4);
      a[0] = 50;
      a[1] = 60;
      b.findIndex((value: number, index: int, array: Uint32Array) => value === 50);
      expect(a[0]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2400
     * @tc.name testUint32ArrayFindIndexPartTwo024
     * @tc.desc Verify findIndex view buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      values.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(view.buffer).assertEqual(values.buffer);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2500
     * @tc.name testUint32ArrayFindIndexPartTwo025
     * @tc.desc Verify findIndex byteOffset byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const view: Uint32Array = new Uint32Array(buf, 4, 3);
      view[0] = 10;
      view[1] = 20;
      view[2] = 30;
      const before: number = view.byteOffset;
      view.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(view.byteOffset).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2600
     * @tc.name testUint32ArrayFindIndexPartTwo026
     * @tc.desc Verify findIndex on subarray -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      const r = view.findIndex((value: number, index: int, array: Uint32Array) => value === 99);
      expect(r).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2700
     * @tc.name testUint32ArrayFindIndexPartTwo027
     * @tc.desc Verify findIndex subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      view.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(values.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2800
     * @tc.name testUint32ArrayFindIndexPartTwo028
     * @tc.desc Verify findIndex subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const view: Uint32Array = values.subarray(1, 3);
      view.findIndex((value: number, index: int, array: Uint32Array) => value === 20);
      expect(view[0]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_2900
     * @tc.name testUint32ArrayFindIndexPartTwo029
     * @tc.desc Verify value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30);
      let captured: number = 0;
      values.findIndex((value: number, index: int, array: Uint32Array) => {
        if (index === 0) {
          captured = value;
        }
        return false;
      });
      expect(captured).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_3000
     * @tc.name testUint32ArrayFindIndexPartTwo030
     * @tc.desc Verify array length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let capLen: number = -1;
      values.findIndex((value: number, index: int, array: Uint32Array) => {
        if (index === 0) {
          capLen = array.length;
        }
        return false;
      });
      expect(capLen).assertEqual(values.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_3100
     * @tc.name testUint32ArrayFindIndexPartTwo031
     * @tc.desc Verify 5 index 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let callCount: number = 0;
      try {
        values.findIndex((value: number, index: int, array: Uint32Array) => {
          callCount++;
          if (index === 2) {
            throw new Error('error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(3);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_3200
     * @tc.name testUint32ArrayFindIndexPartTwo032
     * @tc.desc Verify index 3 index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(1, 2, 3, 9, 5);
      let reached: boolean = false;
      try {
        values.findIndex((value: number, index: int, array: Uint32Array) => {
          if (index === 1) {
            throw new Error('before-match');
          }
          if (value === 9) {
            reached = true;
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(reached).assertFalse();
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_3300
     * @tc.name testUint32ArrayFindIndexPartTwo033
     * @tc.desc Verify (50 ) 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = new Uint32Array(50);
      for (let i = 0; i < 50; i++) {
        values[i] = i;
      }
      const r = values.findIndex((value: number, index: int, array: Uint32Array) => value === 25);
      expect(r).assertEqual(25);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDINDEX_PARTTWO_3400
     * @tc.name testUint32ArrayFindIndexPartTwo034
     * @tc.desc Verify 2 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindIndexPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Uint32Array = Uint32Array.of(0, 0, 5, 0);
      const r = values.findIndex((value: number, index: int, array: Uint32Array) => value === 5);
      expect(r).assertEqual(2);
    });

  });
}
