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

class CustomError extends Error {
  constructor(m: string) { super(m); this.name = 'CustomError'; }
}

export default function uint32ArrayFindLastIndexTest2(): void {
  describe('Uint32ArrayFindLastIndexTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0100
     * @tc.name testUint32ArrayFindLastIndexPartTwo001
     * @tc.desc Verify predicate callCount = length - foundIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let calls: number = 0;
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        calls = calls + 1;
        return v === 3;
      });
      expect(r).assertEqual(2);
      expect(calls).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0200
     * @tc.name testUint32ArrayFindLastIndexPartTwo002
     * @tc.desc Verify predicate length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let calls: number = 0;
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        calls = calls + 1;
        return false;
      });
      expect(r).assertEqual(-1);
      expect(calls).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0300
     * @tc.name testUint32ArrayFindLastIndexPartTwo003
     * @tc.desc Verify predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      let calls: number = 0;
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        calls = calls + 1;
        return true;
      });
      expect(r).assertEqual(-1);
      expect(calls).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0400
     * @tc.name testUint32ArrayFindLastIndexPartTwo004
     * @tc.desc Verify predicate index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      let firstIdx: number = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        if (firstIdx === -1) { firstIdx = i; }
        return false;
      });
      expect(firstIdx).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0500
     * @tc.name testUint32ArrayFindLastIndexPartTwo005
     * @tc.desc Verify predicate index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let lastIdx: number = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        lastIdx = i;
        return false;
      });
      expect(lastIdx).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0600
     * @tc.name testUint32ArrayFindLastIndexPartTwo006
     * @tc.desc Verify predicate index number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      let capturedIndex: int = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        capturedIndex = i;
        return false;
      });
      expect(capturedIndex).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0700
     * @tc.name testUint32ArrayFindLastIndexPartTwo007
     * @tc.desc Verify predicate index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(7);
      let captured: number = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        captured = i;
        return false;
      });
      expect(captured).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0800
     * @tc.name testUint32ArrayFindLastIndexPartTwo008
     * @tc.desc Verify predicate value $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22, 33);
      let lastVal: number = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        if (i === arr.length - 1) { lastVal = v; }
        return false;
      });
      expect(lastVal).assertEqual(33);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_0900
     * @tc.name testUint32ArrayFindLastIndexPartTwo009
     * @tc.desc Verify predicate value -1 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, -1, 3);
      let storedVal: number = 0;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        if (i === 1) { storedVal = v; }
        return false;
      });
      expect(storedVal).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1000
     * @tc.name testUint32ArrayFindLastIndexPartTwo010
     * @tc.desc Verify predicate value Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(Number.NaN, 2, 3);
      let storedVal: number = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        if (i === 0) { storedVal = v; }
        return false;
      });
      expect(storedVal).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1100
     * @tc.name testUint32ArrayFindLastIndexPartTwo011
     * @tc.desc Verify predicate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30);
      let allMatch: boolean = true;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        if (a[i] !== arr[i]) { allMatch = false; }
        return false;
      });
      expect(allMatch).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1200
     * @tc.name testUint32ArrayFindLastIndexPartTwo012
     * @tc.desc Verify predicate array byteOffset offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint32Array = new Uint32Array(buf, 8, 2);
      arr[0] = 100;
      arr[1] = 200;
      let capturedOffset: number = -1;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        capturedOffset = a.byteOffset;
        return false;
      });
      expect(capturedOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1300
     * @tc.name testUint32ArrayFindLastIndexPartTwo013
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const before: number = arr.length;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 3);
      expect(arr.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1400
     * @tc.name testUint32ArrayFindLastIndexPartTwo014
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const before: number = arr.byteLength;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 2);
      expect(arr.byteLength).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1500
     * @tc.name testUint32ArrayFindLastIndexPartTwo015
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const arr: Uint32Array = new Uint32Array(buf, 4, 3);
      const before: number = arr.byteOffset;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0);
      expect(arr.byteOffset).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1600
     * @tc.name testUint32ArrayFindLastIndexPartTwo016
     * @tc.desc Verify length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(0);
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0);
      expect(arr.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1700
     * @tc.name testUint32ArrayFindLastIndexPartTwo017
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = new Uint32Array(100);
      arr[99] = 42;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 42);
      expect(arr.length).assertEqual(100);
      expect(arr.byteLength).assertEqual(400);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1800
     * @tc.name testUint32ArrayFindLastIndexPartTwo018
     * @tc.desc Verify findLastIndex no mutate first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22, 33);
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 22);
      expect(arr[0]).assertEqual(11);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_1900
     * @tc.name testUint32ArrayFindLastIndexPartTwo019
     * @tc.desc Verify findLastIndex no mutate last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22, 33);
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 22);
      expect(arr[arr.length - 1]).assertEqual(33);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2000
     * @tc.name testUint32ArrayFindLastIndexPartTwo020
     * @tc.desc Verify findLastIndex index access value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(11, 22, 33);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 22);
      expect(arr[r]).assertEqual(22);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2100
     * @tc.name testUint32ArrayFindLastIndexPartTwo021
     * @tc.desc Verify findLastIndex no mutate snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const snapshot: number[] = [arr[0], arr[1], arr[2], arr[3]];
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 999);
      expect(arr[0]).assertEqual(snapshot[0]);
      expect(arr[1]).assertEqual(snapshot[1]);
      expect(arr[2]).assertEqual(snapshot[2]);
      expect(arr[3]).assertEqual(snapshot[3]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2200
     * @tc.name testUint32ArrayFindLastIndexPartTwo022
     * @tc.desc Verify findLastIndex boundary no mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 4294967295, 2147483648);
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(4294967295);
      expect(arr[2]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2300
     * @tc.name testUint32ArrayFindLastIndexPartTwo023
     * @tc.desc Verify buffer ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const buf: ArrayBuffer = arr.buffer;
      arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 2);
      expect(arr.buffer).assertEqual(buf);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2400
     * @tc.name testUint32ArrayFindLastIndexPartTwo024
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const view: Uint32Array = parent.subarray(1, 4);
      const off: number = view.byteOffset;
      view.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 3);
      expect(view.byteOffset).assertEqual(off);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2500
     * @tc.name testUint32ArrayFindLastIndexPartTwo025
     * @tc.desc Verify subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const view: Uint32Array = parent.subarray(1, 4);
      const r: int = view.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 30);
      expect(r).assertEqual(1);
      expect(view[r]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2600
     * @tc.name testUint32ArrayFindLastIndexPartTwo026
     * @tc.desc Verify findLastIndex subarray no mutate parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const view: Uint32Array = parent.subarray(1, 4);
      view.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 30);
      expect(parent[2]).assertEqual(30);
      expect(parent.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2700
     * @tc.name testUint32ArrayFindLastIndexPartTwo027
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = parent.subarray(0, 4);
      view.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 3);
      parent[3] = 999;
      expect(view[3]).assertEqual(999);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2800
     * @tc.name testUint32ArrayFindLastIndexPartTwo028
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const view: Uint32Array = parent.subarray(0, 4);
      const r: int = view.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 3);
      expect(r).assertEqual(2);
      view[r] = 888;
      expect(parent[2]).assertEqual(888);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_2900
     * @tc.name testUint32ArrayFindLastIndexPartTwo029
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 10, 15, 20);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 15);
      expect(arr[r]).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3000
     * @tc.name testUint32ArrayFindLastIndexPartTwo030
     * @tc.desc Verify [index]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(5, 10, 15, 20);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 20);
      expect(arr[r]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3100
     * @tc.name testUint32ArrayFindLastIndexPartTwo031
     * @tc.desc Verify -1 $_get(-1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 99);
      expect(r).assertEqual(-1);
      try {
        arr[-1];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3200
     * @tc.name testUint32ArrayFindLastIndexPartTwo032
     * @tc.desc Verify findLastIndex index arithmetic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 4);
      expect(r + 1).assertEqual(4);
      expect(r * 2).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3300
     * @tc.name testUint32ArrayFindLastIndexPartTwo033
     * @tc.desc Verify with()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 3);
      const next: Uint32Array = arr.with(r, 99);
      expect(next[r]).assertEqual(99);
      expect(arr[r]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3400
     * @tc.name testUint32ArrayFindLastIndexPartTwo034
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const inner: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 4);
      const outer: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === arr[inner]);
      expect(outer).assertEqual(inner);
      expect(outer).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3500
     * @tc.name testUint32ArrayFindLastIndexPartTwo035
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 30);
      expect(arr.at(r)).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3600
     * @tc.name testUint32ArrayFindLastIndexPartTwo036
     * @tc.desc Verify 0 -1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1, 2);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0);
      expect(r).assertEqual(0);
      expect(arr.at(r)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3700
     * @tc.name testUint32ArrayFindLastIndexPartTwo037
     * @tc.desc Verify predicate Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2);
      try {
        arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
          throw new CustomError('custom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('CustomError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3800
     * @tc.name testUint32ArrayFindLastIndexPartTwo038
     * @tc.desc Verify callCount length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(9, 2, 3, 4);
      let calls: number = 0;
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        calls = calls + 1;
        return v === 9;
      });
      expect(r).assertEqual(0);
      expect(calls).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_3900
     * @tc.name testUint32ArrayFindLastIndexPartTwo039
     * @tc.desc Verify callCount = length - foundIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      let calls: number = 0;
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => {
        calls = calls + 1;
        return v === 3;
      });
      expect(r).assertEqual(2);
      expect(calls).assertEqual(arr.length - r);
      expect(calls).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4000
     * @tc.name testUint32ArrayFindLastIndexPartTwo040
     * @tc.desc Verify 0o
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 0o777, 2);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0o777);
      expect(r).assertEqual(1);
      expect(arr[r]).assertEqual(511);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4100
     * @tc.name testUint32ArrayFindLastIndexPartTwo041
     * @tc.desc Verify 0b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 0b1010, 2);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0b1010);
      expect(r).assertEqual(1);
      expect(arr[r]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4200
     * @tc.name testUint32ArrayFindLastIndexPartTwo042
     * @tc.desc Verify findLastIndex 1e3 index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(1, 1e3, 2);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 1e3);
      expect(r).assertEqual(1);
      expect(arr[r]).assertEqual(1000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4300
     * @tc.name testUint32ArrayFindLastIndexPartTwo043
     * @tc.desc Verify uint32 0x80000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 0x80000000, 0);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0x80000000);
      expect(r).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4400
     * @tc.name testUint32ArrayFindLastIndexPartTwo044
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(0, 1, 0, 2, 0);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0);
      expect(r).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4500
     * @tc.name testUint32ArrayFindLastIndexPartTwo045
     * @tc.desc Verify MAX MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967295, 1, 4294967295, 2, 4294967295);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 4294967295);
      expect(r).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FINDLASTINDEX_PARTTWO_4600
     * @tc.name testUint32ArrayFindLastIndexPartTwo046
     * @tc.desc Verify 4294967296 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFindLastIndexPartTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint32Array = Uint32Array.of(4294967296, 5, 4294967296);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      const r: int = arr.findLastIndex((v: number, i: int, a: Uint32Array): boolean => v === 0);
      expect(r).assertEqual(2);
    });

  });
}
