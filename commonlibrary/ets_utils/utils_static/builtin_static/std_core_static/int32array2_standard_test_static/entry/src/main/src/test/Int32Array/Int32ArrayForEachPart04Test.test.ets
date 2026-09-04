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

export default function int32ArrayForEachPart04Test(): void {
  describe('Int32ArrayForEachPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayForEachPart04TestMindmapTest001
     * @tc.desc Verify forEach() index=0 index=1 index=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 0) {
          a.$_set(1, 99);
        }
      });
      expect(seen[0]).assertEqual(10);
      expect(seen[1]).assertEqual(99);
      expect(seen[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayForEachPart04TestMindmapTest002
     * @tc.desc Verify forEach() index=0 index=2 index=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let thirdVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(2, 77);
        }
        if (i === 2) {
          thirdVal = v;
        }
      });
      expect(thirdVal).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayForEachPart04TestMindmapTest003
     * @tc.desc Verify forEach() index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let captured: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        captured.push(v);
        a.$_set(i, v + 1000);
      });
      expect(captured[0]).assertEqual(10);
      expect(captured[1]).assertEqual(20);
      expect(captured[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayForEachPart04TestMindmapTest004
     * @tc.desc Verify forEach() array.$_set MAX_INT32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 2147483647);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayForEachPart04TestMindmapTest005
     * @tc.desc Verify forEach() array.$_set MIN_INT32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let lastVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(2, -2147483648);
        }
        if (i === 2) {
          lastVal = v;
        }
      });
      expect(lastVal).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayForEachPart04TestMindmapTest006
     * @tc.desc Verify forEach() index i=1 index=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let indices: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        indices.push(i);
        if (i === 1) {
          a.$_set(0, 999);
        }
      });
      expect(indices.length).assertEqual(3);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayForEachPart04TestMindmapTest007
     * @tc.desc Verify forEach() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let count: number = 0;
      let lastSeen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
        if (i === arr.length - 1) {
          lastSeen = v;
          a.$_set(i, 88);
        }
      });
      expect(count).assertEqual(3);
      expect(lastSeen).assertEqual(30);
      expect(arr.$_get(2)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayForEachPart04TestMindmapTest008
     * @tc.desc Verify forEach() array set Number.NaN ToInt32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let secondVal: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, Number.NaN);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayForEachPart04TestMindmapTest009
     * @tc.desc Verify forEach() array Number.POSITIVE_INFINITY ToInt32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1, 1]);
      let secondVal: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, Number.POSITIVE_INFINITY);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayForEachPart04TestMindmapTest010
     * @tc.desc Verify forEach() array -Number.POSITIVE_INFINITY ToInt32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 2, 2]);
      let secondVal: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, -Number.POSITIVE_INFINITY);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayForEachPart04TestMindmapTest011
     * @tc.desc Verify forEach() array 3.999 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let secondVal: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 3.999);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayForEachPart04TestMindmapTest012
     * @tc.desc Verify forEach() array -3.5 -3 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, -3.5);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayForEachPart04TestMindmapTest013
     * @tc.desc Verify forEach() array 2147483647.9 INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 2147483647.9);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayForEachPart04TestMindmapTest014
     * @tc.desc Verify forEach() array 2147483648 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 2147483648);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayForEachPart04TestMindmapTest015
     * @tc.desc Verify forEach() array 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 2147483649);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayForEachPart04TestMindmapTest016
     * @tc.desc Verify forEach() array -2147483649 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, -2147483649);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayForEachPart04TestMindmapTest017
     * @tc.desc Verify forEach() array 4294967295(0xFFFFFFFF) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let secondVal: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 4294967295);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayForEachPart04TestMindmapTest018
     * @tc.desc Verify forEach() array 4294967296(2^32) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let secondVal: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          a.$_set(1, 4294967296);
        }
        if (i === 1) {
          secondVal = v;
        }
      });
      expect(secondVal).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayForEachPart04TestMindmapTest019
     * @tc.desc Verify forEach() array.$_set index === length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let lenBefore: number = arr.length;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          if (i === 0) {
            a.$_set(a.length, 999);
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayForEachPart04TestMindmapTest020
     * @tc.desc Verify forEach() index index 0..length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let indices: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        indices.push(i);
      });
      expect(indices.length).assertEqual(4);
      expect(indices[0]).assertEqual(0);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayForEachPart04TestMindmapTest021
     * @tc.desc Verify forEach() number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let last: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        last = v;
      });
      expect(last).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayForEachPart04TestMindmapTest022
     * @tc.desc Verify forEach() number[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let collected: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        collected.push(v);
      });
      expect(collected[0]).assertEqual(11);
      expect(collected[1]).assertEqual(22);
      expect(collected[2]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayForEachPart04TestMindmapTest023
     * @tc.desc Verify forEach on empty array does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let count: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayForEachPart04TestMindmapTest024
     * @tc.desc Verify forEach() 1 value/index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let count: number = 0;
      let seenV: number = 0;
      let seenI: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
        seenV = v;
        seenI = i;
      });
      expect(count).assertEqual(1);
      expect(seenV).assertEqual(42);
      expect(seenI).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayForEachPart04TestMindmapTest025
     * @tc.desc Verify forEach() value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9]);
      let expected: number[] = [3, 6, 9];
      let callbackCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        expect(v).assertEqual(expected[i]);
        callbackCount++;
      });
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayForEachPart04TestMindmapTest026
     * @tc.desc Verify forEach() index index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let idxSum: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        idxSum = idxSum + i * i;
      });
      expect(idxSum).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayForEachPart04TestMindmapTest027
     * @tc.desc Verify forEach() Map index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let m: Map<number, number> = new Map<number, number>();
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        m.set(i, v);
      });
      expect(m.get(0)).assertEqual(100);
      expect(m.get(1)).assertEqual(200);
      expect(m.get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayForEachPart04TestMindmapTest028
     * @tc.desc Verify forEach() array ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let sameRef: boolean = false;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a === arr) {
          sameRef = true;
        }
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayForEachPart04TestMindmapTest029
     * @tc.desc Verify forEach() value index number[] pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8]);
      let pairs: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        pairs.push(i);
        pairs.push(v);
      });
      expect(pairs[0]).assertEqual(0);
      expect(pairs[1]).assertEqual(7);
      expect(pairs[2]).assertEqual(1);
      expect(pairs[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayForEachPart04TestMindmapTest030
     * @tc.desc Verify forEach() value (index+1) value/index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let weighted: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        weighted = weighted + v * (i + 1);
      });
      expect(weighted).assertEqual(10 * 1 + 20 * 2 + 30 * 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayForEachPart04TestMindmapTest031
     * @tc.desc Verify forEach() Set value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let s: Set<number> = new Set<number>();
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        s.add(v);
      });
      expect(s.has(1)).assertTrue();
      expect(s.has(2)).assertTrue();
      expect(s.has(3)).assertTrue();
      expect(s.has(4)).assertTrue();
      expect(s.size).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayForEachPart04TestMindmapTest032
     * @tc.desc Verify forEach() 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1, 1, 1]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i + 1 < a.length) {
          a.$_set(i + 1, a.$_get(i + 1) * 2);
        }
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
      expect(seen[2]).assertEqual(2);
      expect(seen[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayForEachPart04TestMindmapTest033
     * @tc.desc Verify forEach() -1 value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        for (let j: int = i + 1; j < a.length; j++) {
          a.$_set(j, -1);
        }
      });
      expect(seen[0]).assertEqual(10);
      expect(seen[1]).assertEqual(-1);
      expect(seen[2]).assertEqual(-1);
      expect(seen[3]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayForEachPart04TestMindmapTest034
     * @tc.desc Verify forEach can modify element at index 0 from last callback invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === a.length - 1) {
          a.$_set(0, 100);
        }
      });
      expect(arr.$_get(0)).assertEqual(100);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayForEachPart04TestMindmapTest035
     * @tc.desc Verify forEach() array.fill fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 1) {
          a.fill(77, 2);
        }
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
      expect(seen[2]).assertEqual(77);
      expect(seen[3]).assertEqual(77);
      expect(seen[4]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayForEachPart04TestMindmapTest036
     * @tc.desc Verify forEach() array.reverse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 0) {
          a.reverse();
        }
      });
      expect(seen.length).assertEqual(4);
      expect(seen[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayForEachPart04TestMindmapTest037
     * @tc.desc Verify forEach() array.sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 2]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 0) {
          a.sort();
        }
      });
      expect(seen[0]).assertEqual(3);
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayForEachPart04TestMindmapTest038
     * @tc.desc Verify forEach() array.set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let seen: number[] = [];
      let src: Int32Array = new Int32Array([99, 98]);
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 1) {
          a.set(src, 2);
        }
      });
      expect(seen[1]).assertEqual(20);
      expect(seen[2]).assertEqual(99);
      expect(seen[3]).assertEqual(98);
      expect(seen[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayForEachPart04TestMindmapTest039
     * @tc.desc Verify forEach() array.copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 0) {
          a.copyWithin(1, 3);
        }
      });
      expect(seen[0]).assertEqual(1);
      expect(seen.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayForEachPart04TestMindmapTest040
     * @tc.desc Verify forEach() index=0 swap i i+1 swap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i + 1 < a.length) {
          let cur: number = a.$_get(i);
          let nxt: number = a.$_get(i + 1);
          a.$_set(i, nxt);
          a.$_set(i + 1, cur);
        }
      });
      expect(seen[0]).assertEqual(10);
      expect(seen.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayForEachPart04TestMindmapTest041
     * @tc.desc Verify forEach visits all 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let count: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayForEachPart04TestMindmapTest042
     * @tc.desc Verify forEach Int32Array forEach index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = new Int32Array([10, 20]);
      let inner: Int32Array = new Int32Array([1, 2]);
      let pairs: number[] = [];
      outer.forEach((ov: number, oi: int, oa: Int32Array): void => {
        inner.forEach((iv: number, ii: int, ia: Int32Array): void => {
          pairs.push(ov * 100 + iv);
        });
      });
      expect(pairs.length).assertEqual(4);
      expect(pairs[0]).assertEqual(1001);
      expect(pairs[1]).assertEqual(1002);
      expect(pairs[2]).assertEqual(2001);
      expect(pairs[3]).assertEqual(2002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayForEachPart04TestMindmapTest043
     * @tc.desc Verify forEach array forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let depth: number = 0;
      let totalCalls: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        totalCalls++;
        if (depth === 0) {
          depth++;
          a.forEach((v2: number, i2: int, a2: Int32Array): void => {
            totalCalls++;
          });
        }
      });
      expect(totalCalls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayForEachPart04TestMindmapTest044
     * @tc.desc Verify array.map forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let mappedSum: number = 0;
      let selfSeen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        selfSeen.push(v);
        let m: Int32Array = a.map((x: number): number => x * 10);
        m.forEach((mv: number, mi: int, ma: Int32Array): void => {
          mappedSum = mappedSum + mv;
        });
      });
      expect(selfSeen.length).assertEqual(3);
      expect(mappedSum).assertEqual(180);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayForEachPart04TestMindmapTest045
     * @tc.desc Verify filter+forEach filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let evens: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        a.filter((x: number): boolean => x % 2 === 0).forEach((ev: number, ei: int, ea: Int32Array): void => {
          evens.push(ev);
        });
      });
      expect(evens.length).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayForEachPart04TestMindmapTest046
     * @tc.desc Verify slice forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let snapshots: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        let snap: Int32Array = a.slice();
        snap.forEach((sv: number, si: int, sa: Int32Array): void => {
          snapshots.push(sv);
        });
        a.$_set(i, v + 100);
      });
      expect(snapshots.length).assertEqual(9);
      expect(snapshots[0]).assertEqual(1);
      expect(snapshots[1]).assertEqual(2);
      expect(snapshots[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayForEachPart04TestMindmapTest047
     * @tc.desc Verify subarray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let collected: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        let tail: Int32Array = a.subarray(i);
        tail.forEach((tv: number, ti: int, ta: Int32Array): void => {
          collected.push(tv);
        });
      });
      expect(collected.length).assertEqual(10);
      expect(collected[0]).assertEqual(10);
      expect(collected[3]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayForEachPart04TestMindmapTest048
     * @tc.desc Verify forEach arr->subarray->subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let triple: number = 0;
      arr.forEach((v1: number, i1: int, a1: Int32Array): void => {
        let a2: Int32Array = a1.subarray(0);
        a2.forEach((v2: number, i2: int, a2Value: Int32Array): void => {
          let a3: Int32Array = a2.subarray(0);
          a3.forEach((v3: number, i3: int, a3Value: Int32Array): void => {
            triple++;
          });
        });
      });
      expect(triple).assertEqual(27);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayForEachPart04TestMindmapTest049
     * @tc.desc Verify Int32Array ArrayBuffer forEach forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a1: Int32Array = new Int32Array(buf, 0, 3);
      let a2: Int32Array = new Int32Array(buf, 0, 3);
      a1.$_set(0, 11);
      a1.$_set(1, 22);
      a1.$_set(2, 33);
      let seen: number[] = [];
      a1.forEach((v: number, i: int, ax: Int32Array): void => {
        seen.push(v);
        a2.$_set(i, v + 100);
      });
      expect(a1.$_get(0)).assertEqual(111);
      expect(a1.$_get(1)).assertEqual(122);
      expect(a1.$_get(2)).assertEqual(133);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayForEachPart04TestMindmapTest050
     * @tc.desc Verify subarray buffer forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      parent.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          child.$_set(0, 999);
        }
      });
      expect(parent.$_get(1)).assertEqual(999);
      expect(child.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayForEachPart04TestMindmapTest051
     * @tc.desc Verify subarray forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(0, 2);
      let seenInChild: number[] = [];
      child.forEach((v: number, i: int, a: Int32Array): void => {
        seenInChild.push(v);
        if (i === 0) {
          parent.$_set(3, 888);
        }
      });
      expect(parent.$_get(3)).assertEqual(888);
      expect(seenInChild.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayForEachPart04TestMindmapTest052
     * @tc.desc Verify slice buffer forEach slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cp: Int32Array = arr.slice();
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        cp.$_set(i, v + 500);
      });
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(501);
      expect(cp.$_get(1)).assertEqual(502);
      expect(cp.$_get(2)).assertEqual(503);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayForEachPart04TestMindmapTest053
     * @tc.desc Verify forEach() Int32Array buffer int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let secondView: Int32Array = new Int32Array(buf, 0, 3);
      let thirdView: Int32Array = new Int32Array(buf, 4, 3);
      secondView.$_set(0, 111);
      secondView.$_set(1, 222);
      secondView.$_set(2, 333);
      let seenFromV2: number[] = [];
      thirdView.forEach((v: number, i: int, a: Int32Array): void => {
        seenFromV2.push(v);
      });
      expect(seenFromV2[0]).assertEqual(222);
      expect(seenFromV2[1]).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayForEachPart04TestMindmapTest054
     * @tc.desc Verify forEach Uint8Array Int32Array int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf, 0, 2);
      i32.$_set(0, 0);
      i32.$_set(1, 0);
      let u8: Uint8Array = new Uint8Array(buf);
      let seen: number[] = [];
      i32.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
        if (i === 0) {
          u8.$_set(4, 255);
          u8.$_set(5, 255);
          u8.$_set(6, 255);
          u8.$_set(7, 127);
        }
      });
      expect(seen[1]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayForEachPart04TestMindmapTest055
     * @tc.desc Verify ArrayBuffer Int32Array byteOffset=0 length=0 forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let empty: Int32Array = new Int32Array(buf, 0, 0);
      let count: number = 0;
      empty.forEach((v: number, i: int, a: Int32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
      expect(empty.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayForEachPart04TestMindmapTest056
     * @tc.desc Verify subarray(1) length-1 forEach forEach buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1);
      let parentCount: number = 0;
      let childCount: number = 0;
      parent.forEach((v: number, i: int, a: Int32Array): void => {
        parentCount++;
      });
      child.forEach((v: number, i: int, a: Int32Array): void => {
        childCount++;
      });
      expect(parentCount).assertEqual(5);
      expect(childCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayForEachPart04TestMindmapTest057
     * @tc.desc Verify Float32Array ArrayBuffer Int32Array forEach Float32Array Int32Array float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf, 0, 2);
      let f32: Float32Array = new Float32Array(buf);
      i32.$_set(0, 0);
      i32.$_set(1, 0);
      let secondSlot: number = 0;
      i32.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          f32.$_set(1, 1.0);
        }
        if (i === 1) {
          secondSlot = v;
        }
      });
      expect(secondSlot).assertEqual(1065353216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayForEachPart04TestMindmapTest058
     * @tc.desc Verify DataView ArrayBuffer Int32Array forEach int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf, 0, 2);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, 123456, true);
      dv.setInt32(4, 0, true);
      let seen0: number = 0;
      let seen1: number = 0;
      i32.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          seen0 = v;
          dv.setInt32(4, -778899, true);
        }
        if (i === 1) {
          seen1 = v;
        }
      });
      expect(seen0).assertEqual(123456);
      expect(seen1).assertEqual(-778899);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayForEachPart04TestMindmapTest059
     * @tc.desc Verify forEach stops at first element when callback throws immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let visited: number = 0;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          visited++;
          throw new Error('first element boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visited).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayForEachPart04TestMindmapTest060
     * @tc.desc Verify forEach stops at index 2 with exception, visited elements collected correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let seen: number[] = [];
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          seen.push(v);
          if (i === 2) {
            throw new Error('middle');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(seen.length).assertEqual(3);
      expect(seen[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayForEachPart04TestMindmapTest061
     * @tc.desc Verify forEach visits all elements when exception thrown on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number[] = [];
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          seen.push(v);
          if (i === a.length - 1) {
            throw new Error('last');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(seen.length).assertEqual(2);
      expect(seen[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayForEachPart04TestMindmapTest062
     * @tc.desc Verify forEach() RangeError name RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new RangeError('oob');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayForEachPart04TestMindmapTest063
     * @tc.desc Verify forEach() TypeError name TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let errName: string = '';
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          throw new TypeError('bad type');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
        errName = e.name;
      }
      expect(errName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayForEachPart04TestMindmapTest064
     * @tc.desc Verify forEach() Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          a.$_set(i, i + 1);
          if (i === 1) {
            throw new Error('stop');
          }
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayForEachPart04TestMindmapTest065
     * @tc.desc Verify forEach() RangeError set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          if (i === 0) {
            throw new RangeError('early');
          }
          a.$_set(i, 0);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayForEachPart04TestMindmapTest066
     * @tc.desc Verify forEach() throw Error catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let count: number = 0;
      try {
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          count++;
          throw new Error('string error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayForEachPart04TestMindmapTest067
     * @tc.desc Verify forEach with side-effect-free callback does not mutate array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayForEachPart04TestMindmapTest068
     * @tc.desc Verify forEach MAX/MIN/0/-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648, 0, -1]);
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayForEachPart04TestMindmapTest069
     * @tc.desc Verify forEach length N length N length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let beforeLen: number = arr.length;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      let afterLen: number = arr.length;
      expect(beforeLen).assertEqual(5);
      expect(afterLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayForEachPart04TestMindmapTest070
     * @tc.desc Verify forEach byteLength length*4 byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let before: number = arr.byteLength;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      let after: number = arr.byteLength;
      expect(before).assertEqual(16);
      expect(after).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayForEachPart04TestMindmapTest071
     * @tc.desc Verify forEach byteOffset 0 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let before: number = arr.byteOffset;
      let seen: number[] = [];
      let callCount: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
      let after: number = arr.byteOffset;
      expect(before).assertEqual(4);
      expect(after).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayForEachPart04TestMindmapTest072
     * @tc.desc Verify forEach found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let seen: number = 0;
      let found: boolean = false;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen++;
        if (v === 3) {
          found = true;
        }
      });
      expect(found).assertTrue();
      expect(seen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayForEachPart04TestMindmapTest073
     * @tc.desc Verify forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let allSeven: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== 7) {
          allSeven = false;
        }
      });
      expect(allSeven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayForEachPart04TestMindmapTest074
     * @tc.desc Verify forEach value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      let allNeg: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v >= 0) {
          allNeg = false;
        }
      });
      expect(allNeg).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayForEachPart04TestMindmapTest075
     * @tc.desc Verify forEach Int32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(5, 10, 15);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayForEachPart04TestMindmapTest076
     * @tc.desc Verify forEach Int32Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [2, 4, 6];
      let arr: Int32Array = Int32Array.from(src);
      let prod: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        prod = prod * v;
      });
      expect(prod).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayForEachPart04TestMindmapTest077
     * @tc.desc Verify forEach array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let ok: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.length !== 4) {
          ok = false;
        }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayForEachPart04TestMindmapTest078
     * @tc.desc Verify forEach -0 -0 ToInt32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      let seen: number = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayForEachPart04TestMindmapTest079
     * @tc.desc Verify forEach undefined void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number[] = [];
      let callCount: number = 0;
      let ret: Object | undefined = arr.forEach((v: number, i: int, a: Int32Array): void => {
        callCount++;
        seen.push(v);
      });
      expect(ret).assertUndefined();
      expect(callCount).assertEqual(arr.length);
      for (let idx: int = 0; idx < seen.length; idx = idx + 1) {
        expect(seen[idx]).assertEqual(arr.$_get(idx));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayForEachPart04TestMindmapTest080
     * @tc.desc Verify forEach new Int32Array(3) value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let allZero: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== 0) {
          allZero = false;
        }
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayForEachPart04TestMindmapTest081
     * @tc.desc Verify forEach ArrayBuffer(byteOffset=4) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      let mid: Int32Array = new Int32Array(buf, 4, 2);
      let seen: number[] = [];
      mid.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
      });
      expect(seen[0]).assertEqual(200);
      expect(seen[1]).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayForEachPart04TestMindmapTest082
     * @tc.desc Verify forEach() array.BYTES_PER_ELEMENT 4 Int32Array 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let ok: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.BYTES_PER_ELEMENT !== 4) {
          ok = false;
        }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayForEachPart04TestMindmapTest083
     * @tc.desc Verify forEach() array.buffer buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf, 0, 3);
      let sameBuf: boolean = false;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.buffer === buf) {
          sameBuf = true;
        }
      });
      expect(sameBuf).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayForEachPart04TestMindmapTest084
     * @tc.desc Verify modifications from first forEach are visible to second forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        a.$_set(i, i + 1);
      });
      let seen: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen.push(v);
      });
      expect(seen[0]).assertEqual(1);
      expect(seen[1]).assertEqual(2);
      expect(seen[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArrayForEachPart04TestMindmapTest085
     * @tc.desc Verify forEach() number Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6]);
      let marker: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          marker = v;
        } else {
          marker = marker + v;
        }
      });
      expect(marker).assertEqual(11);
    });
  });
}
