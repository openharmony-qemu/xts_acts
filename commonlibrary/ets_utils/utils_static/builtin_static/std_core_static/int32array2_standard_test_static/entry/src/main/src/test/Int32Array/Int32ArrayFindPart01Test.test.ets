'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int32ArrayFindPart01Test(): void {
  describe('Int32ArrayFindPart01Test', () => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayFindPart01TestMindmapTest001
     * @tc.desc Verify find() 1 predicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest001',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let result: number | undefined = arr.find((v: number): boolean => v > 25);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayFindPart01TestMindmapTest002
     * @tc.desc Verify find() 1 predicate value index index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest002',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => i === 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayFindPart01TestMindmapTest003
     * @tc.desc Verify find() 1 predicate value/index/array array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest003',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => i === 0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayFindPart01TestMindmapTest004
     * @tc.desc Verify 0 find predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest004',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        let fn: (() => number | undefined) = arr.find as (() => number | undefined);
        fn();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayFindPart01TestMindmapTest005
     * @tc.desc Verify find() predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest005',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: number | undefined = arr.find((v: number): boolean => v === 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayFindPart01TestMindmapTest006
     * @tc.desc Verify find() predicate false 1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest006',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([42]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayFindPart01TestMindmapTest007
     * @tc.desc Verify find() returns the first matching value 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest007',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let result: number | undefined = arr.find((v: number): boolean => v === 6);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayFindPart01TestMindmapTest008
     * @tc.desc Verify find() value 0 predicate 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest008',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2, 3]);
      let result: number | undefined = arr.find((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayFindPart01TestMindmapTest009
     * @tc.desc Verify find() value -1 predicate -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest009',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3]);
      let result: number | undefined = arr.find((v: number): boolean => v === -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayFindPart01TestMindmapTest010
     * @tc.desc Verify find() value INT_MAX 2147483647 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest010',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, -1]);
      let result: number | undefined = arr.find((v: number): boolean => v === 2147483647);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayFindPart01TestMindmapTest011
     * @tc.desc Verify find() value INT_MIN -2147483648 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest011',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
      let result: number | undefined = arr.find((v: number): boolean => v === -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayFindPart01TestMindmapTest012
     * @tc.desc Verify find() 0 predicate v===0 truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest012',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayFindPart01TestMindmapTest013
     * @tc.desc Verify find() 0 predicate v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest013',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayFindPart01TestMindmapTest014
     * @tc.desc Verify find() predicate v<0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest014',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, -1, 2, -2, 3]);
      let result: number | undefined = arr.find((v: number): boolean => v < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayFindPart01TestMindmapTest015
     * @tc.desc Verify find() 0x7FFFFFFF INT_MAX predicate INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest015',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([0x7FFFFFFF, 0]);
      let result: number | undefined = arr.find((v: number): boolean => v === 0x7FFFFFFF);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayFindPart01TestMindmapTest016
     * @tc.desc Verify find() -0x80000000 INT_MIN predicate INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest016',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-0x80000000, 0]);
      let result: number | undefined = arr.find((v: number): boolean => v === -0x80000000);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayFindPart01TestMindmapTest017
     * @tc.desc Verify find() DataView ArrayBuffer -2147483648 predicate INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest017',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, -2147483648, true);
      dv.setInt32(4, 0, true);
      let arr: Int32Array = new Int32Array(buf);
      let result: number | undefined = arr.find((v: number): boolean => v === -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayFindPart01TestMindmapTest018
     * @tc.desc Verify find() predicate INT_MAX-1 2147483646 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest018',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 2147483647, -1]);
      let result: number | undefined = arr.find((v: number): boolean => v > 2147483646);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayFindPart01TestMindmapTest019
     * @tc.desc Verify find() predicate INT_MIN+1 -2147483647 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest019',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648, 1]);
      let result: number | undefined = arr.find((v: number): boolean => v < -2147483647);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayFindPart01TestMindmapTest020
     * @tc.desc Verify find() predicate i===arr.length-1 value=30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest020',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => i === arr.length - 1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayFindPart01TestMindmapTest021
     * @tc.desc Verify find() predicate i===1 value=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest021',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => i === 1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayFindPart01TestMindmapTest022
     * @tc.desc Verify find() predicate callCount=0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest022',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(0);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number, i: int): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayFindPart01TestMindmapTest023
     * @tc.desc Verify find() predicate i===0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest023',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([99]);
      let seenIdx: int = -1;
      arr.find((v: number, i: int): boolean => {
        seenIdx = i;
        return true;
      });
      expect(seenIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayFindPart01TestMindmapTest024
     * @tc.desc Verify find() predicate index 0 [0,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest024',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let idxs: Array<int> = new Array<int>();
      arr.find((v: number, i: int): boolean => {
        idxs.push(i);
        return v === 30;
      });
      expect(idxs.length).assertEqual(3);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
      expect(idxs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayFindPart01TestMindmapTest025
     * @tc.desc Verify find() predicate index int i<1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest025',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => i < 1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayFindPart01TestMindmapTest026
     * @tc.desc Verify find() predicate i>0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest026',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([100, 200]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => i > 0);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayFindPart01TestMindmapTest027
     * @tc.desc Verify predicate array === find Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest027',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sameRef: boolean = false;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        sameRef = a === arr;
        return true;
      });
      expect(sameRef).assertTrue();
      {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let bl: int = -1;
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          bl = a.byteLength;
          return true;
        });
        expect(bl).assertEqual(12);
      }
      {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let bo: int = -1;
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          bo = a.byteOffset;
          return true;
        });
        expect(bo).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayFindPart01TestMindmapTest028
     * @tc.desc Verify find() predicate array a.length arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest028',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let reportedLen: int = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        reportedLen = a.length;
        return true;
      });
      expect(reportedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayFindPart01TestMindmapTest029
     * @tc.desc Verify find() predicate a.$_get(i) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest029',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let consistent: boolean = true;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (a.$_get(i) !== v) {
          consistent = false;
        }
        return i === a.length - 1;
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayFindPart01TestMindmapTest030
     * @tc.desc Verify find() predicate a.BYTES_PER_ELEMENT 4 Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest030',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let bpe: int = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        bpe = a.BYTES_PER_ELEMENT;
        return true;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayFindPart01TestMindmapTest031
     * @tc.desc Verify find() offset ArrayBuffer Int32Array byteOffset=4 length=2 predicate a.length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest031',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let viewLen: int = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        viewLen = a.length;
        return true;
      });
      expect(viewLen).assertEqual(2);
      {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let arr: Int32Array = new Int32Array(buf, 4, 2);
        let bo: int = -1;
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          bo = a.byteOffset;
          return true;
        });
        expect(bo).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayFindPart01TestMindmapTest032
     * @tc.desc Verify find() predicate i===0 a.$_set(1,99) 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest032',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 99);
        }
        return v === 99;
      });
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayFindPart01TestMindmapTest033
     * @tc.desc Verify find() predicate true truthy callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest033',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return v === 1;
      });
      expect(result).assertEqual(1);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayFindPart01TestMindmapTest034
     * @tc.desc Verify find() predicate false falsy undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest034',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: number | undefined = arr.find((v: number): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayFindPart01TestMindmapTest035
     * @tc.desc Verify find() predicate false true callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest035',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return v === 2;
      });
      expect(result).assertEqual(2);
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayFindPart01TestMindmapTest036
     * @tc.desc Verify find() predicate true 3 seenLast false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest036',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let seenLast: boolean = false;
      arr.find((v: number, i: int): boolean => {
        if (i === 3) {
          seenLast = true;
        }
        return i === 0;
      });
      expect(seenLast).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayFindPart01TestMindmapTest037
     * @tc.desc Verify find() predicate true callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest037',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertEqual(10);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayFindPart01TestMindmapTest038
     * @tc.desc Verify find() predicate false 5 callCount=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest038',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return false;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayFindPart01TestMindmapTest039
     * @tc.desc Verify find() predicate number 1 truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest039',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let hitIdx: int = -1;
      arr.find((v: number, i: int): boolean => {
        hitIdx = i;
        return v === 6;
      });
      expect(hitIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayFindPart01TestMindmapTest040
     * @tc.desc Verify find() INT_MIN predicate v===-2147483648 callCount=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest040',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return v === -2147483648;
      });
      expect(result).assertEqual(-2147483648);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayFindPart01TestMindmapTest041
     * @tc.desc Verify find() INT_MAX predicate v<INT_MAX undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest041',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647]);
      let result: number | undefined = arr.find((v: number): boolean => v < 2147483647);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayFindPart01TestMindmapTest042
     * @tc.desc Verify find() predicate target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest042',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let target: int = 30;
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: number | undefined = arr.find((v: number): boolean => v === target);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayFindPart01TestMindmapTest043
     * @tc.desc Verify find() predicate v%2===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest043',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 3, 5, 6, 7]);
      let result: number | undefined = arr.find((v: number): boolean => v % 2 === 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayFindPart01TestMindmapTest044
     * @tc.desc Verify find() predicate v<0&&v%2!==0 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest044',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2, -2, 4, -3, 6]);
      let result: number | undefined = arr.find((v: number): boolean => v < 0 && v % 2 !== 0);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayFindPart01TestMindmapTest045
     * @tc.desc Verify find() predicate i!==0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest045',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => i !== 0 && v > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayFindPart01TestMindmapTest046
     * @tc.desc Verify find() predicate v*v===1 1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest046',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2, 3, -1, 1, 4]);
      let result: number | undefined = arr.find((v: number): boolean => v * v === 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayFindPart01TestMindmapTest047
     * @tc.desc Verify find() 64 i*2 predicate v===60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest047',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(64);
      for (let i: int = 0; i < 64; i++) {
        arr.$_set(i, i * 2);
      }
      let result: number | undefined = arr.find((v: number): boolean => v === 60);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayFindPart01TestMindmapTest048
     * @tc.desc Verify find() predicate value number v+0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest048',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([7]);
      let receivedAsNumber: boolean = false;
      arr.find((v: number, i: int): boolean => {
        receivedAsNumber = (v + 0.5 === 7.5);
        return true;
      });
      expect(receivedAsNumber).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayFindPart01TestMindmapTest049
     * @tc.desc Verify new Int32Array() find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest049',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array();
      let callCount: int = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        callCount++;
        return true;
      });
      expect(result).assertUndefined();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayFindPart01TestMindmapTest050
     * @tc.desc Verify find() new Int32Array(3) predicate v!==0 undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest050',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(3);
      let result: number | undefined = arr.find((v: number): boolean => v !== 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayFindPart01TestMindmapTest051
     * @tc.desc Verify find() new Int32Array(3) predicate v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest051',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(3);
      let result: number | undefined = arr.find((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayFindPart01TestMindmapTest052
     * @tc.desc Verify find() Int32Array.of(11,22,33,44) predicate 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest052',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33, 44);
      let result: number | undefined = arr.find((v: number): boolean => v === 33);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayFindPart01TestMindmapTest053
     * @tc.desc Verify find() Int32Array.from predicate from 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest053',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = Int32Array.from([5, 15, 25, 35]);
      let result: number | undefined = arr.find((v: number): boolean => v === 15);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayFindPart01TestMindmapTest054
     * @tc.desc Verify ArrayBuffer offset DataView [100,200,300] find 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest054',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, 100, true);
      dv.setInt32(4, 200, true);
      dv.setInt32(8, 300, true);
      let arr: Int32Array = new Int32Array(buf);
      let result: number | undefined = arr.find((v: number): boolean => v === 200);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayFindPart01TestMindmapTest055
     * @tc.desc Verify ArrayBuffer byteOffset=4 length=2 find 222
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest055',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, 111, true);
      dv.setInt32(4, 222, true);
      dv.setInt32(8, 333, true);
      dv.setInt32(12, 444, true);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let result: number | undefined = arr.find((v: number): boolean => v === 222);
      expect(result).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayFindPart01TestMindmapTest056
     * @tc.desc Verify find() byteOffset=4 length=2 predicate false callCount=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest056',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, 999, true);
      dv.setInt32(4, 10, true);
      dv.setInt32(8, 20, true);
      dv.setInt32(12, 888, true);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let callCount: int = 0;
      arr.find((v: number): boolean => {
        callCount++;
        return false;
      });
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayFindPart01TestMindmapTest057
     * @tc.desc Verify subarray(1,4) 3 find v===3 a.length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest057',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1, 4);
      let resultLen: int = -1;
      let result: number | undefined = child.find((v: number, i: int, a: Int32Array): boolean => {
        resultLen = a.length;
        return v === 3;
      });
      expect(result).assertEqual(3);
      expect(resultLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayFindPart01TestMindmapTest058
     * @tc.desc Verify find() INT_MAX INT_MIN predicate v<0 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest058',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0]);
      let result: number | undefined = arr.find((v: number): boolean => v < 0);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayFindPart01TestMindmapTest059
     * @tc.desc Verify find() 0 -1 predicate v!==0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest059',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array([0, -1, -2]);
      let result: number | undefined = arr.find((v: number): boolean => v !== 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayFindPart01TestMindmapTest060
     * @tc.desc Verify find() length=1 predicate v!==0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart01TestMindmapTest060',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,(): void => {
      let arr: Int32Array = new Int32Array(1);
      let result: number | undefined = arr.find((v: number): boolean => v !== 0);
      expect(result).assertUndefined();
    });



  });
}
