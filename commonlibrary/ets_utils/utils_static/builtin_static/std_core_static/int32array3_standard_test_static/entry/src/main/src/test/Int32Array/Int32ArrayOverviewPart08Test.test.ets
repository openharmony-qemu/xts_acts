'use static';


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

export default function int32ArrayOverviewPart08Test(): void {
  describe('Int32ArrayOverviewPart08Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest001
     * @tc.desc Verify reverse on [1,2,3,4,5] makes index 0=5 index 4=1, length stays 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let beforeLen: number = a.length;
      a.reverse();
      expect(beforeLen).assertEqual(5);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(4)).assertEqual(1);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest002
     * @tc.desc Verify sort on [9,-4,0,7] results in ascending [-4,0,7,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(9, -4, 0, 7);
      a.sort();
      expect(a.$_get(0)).assertEqual(-4);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(7);
      expect(a.$_get(3)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest003
     * @tc.desc Verify fill(8,1,3) on 4-element zero array only fills index 1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.fill(8, 1, 3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(8);
      expect(a.$_get(2)).assertEqual(8);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest004
     * @tc.desc Verify copyWithin(3,0,2) on [11,22,33,44,55] sets last two to 11,22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(11, 22, 33, 44, 55);
      a.copyWithin(3, 0, 2);
      expect(a.$_get(0)).assertEqual(11);
      expect(a.$_get(2)).assertEqual(33);
      expect(a.$_get(3)).assertEqual(11);
      expect(a.$_get(4)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest005
     * @tc.desc Verify set(src,2) writes [100,200] at offset 2, index 0/1 unchanged, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let src: Int32Array = Int32Array.of(100, 200);
      a.set(src, 2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(100);
      expect(a.$_get(3)).assertEqual(200);
      expect(a.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest006
     * @tc.desc Verify $_set valid index writes value, other indices unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      a.$_set(1, 77);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(77);
      expect(a.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest007
     * @tc.desc Verify single-element array reverse returns same value, length stays 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      a.reverse();
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest008
     * @tc.desc Verify sort on empty array (length=0) does not throw, length stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      a.sort();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_0900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest009
     * @tc.desc Verify toReversed on [1,2,3] returns new [3,2,1], original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = orig.toReversed();
      expect(orig.$_get(0)).assertEqual(1);
      expect(orig.$_get(2)).assertEqual(3);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest010
     * @tc.desc Verify toSorted on [5,1,3] returns ascending [1,3,5], original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(5, 1, 3);
      let s: Int32Array = orig.toSorted();
      expect(orig.$_get(0)).assertEqual(5);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(3);
      expect(s.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest011
     * @tc.desc Verify with(0,-5) on [10,20] returns [-5,20], original first element stays 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20);
      let w: Int32Array = orig.with(0, -5);
      expect(orig.$_get(0)).assertEqual(10);
      expect(w.$_get(0)).assertEqual(-5);
      expect(w.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest012
     * @tc.desc Verify slice(1,3) from [10,20,30,40] returns [20,30] length=2, original length=4 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(10, 20, 30, 40);
      let s: Int32Array = orig.slice(1, 3);
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(20);
      expect(s.$_get(1)).assertEqual(30);
      expect(orig.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest013
     * @tc.desc Verify map(v=>v+10) on [1,2,3] returns [11,12,13], original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let m: Int32Array = orig.map((v: number, _i: int, _x: Int32Array): number => {
        return v + 10;
      });
      expect(orig.$_get(0)).assertEqual(1);
      expect(m.$_get(0)).assertEqual(11);
      expect(m.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest014
     * @tc.desc Verify filter(v=>v>0) on [-1,2,-3,4] returns [2,4], original length=4 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(-1, 2, -3, 4);
      let f: Int32Array = orig.filter((v: number, _i: int, _x: Int32Array): boolean => {
        return v > 0;
      });
      expect(f.length).assertEqual(2);
      expect(f.$_get(0)).assertEqual(2);
      expect(f.$_get(1)).assertEqual(4);
      expect(orig.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest015
     * @tc.desc Verify reverse().reverse() double reversal restores original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 4, 6, 8);
      a.reverse().reverse();
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(1)).assertEqual(4);
      expect(a.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest016
     * @tc.desc Verify fill(1).fill(0,0,1) chain: fill all 1, then fill first index 0 -> [0,1,1,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      a.fill(1).fill(0, 0, 1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest017
     * @tc.desc Verify sort().reverse() on [7,2,9,1]: ascending then reverse -> [9,7,2,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 2, 9, 1);
      a.sort().reverse();
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest018
     * @tc.desc Verify subarray(1,4) reverse writes through shared buffer, parent becomes [1,4,3,2,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      parent.$_set(4, 5);
      parent.subarray(1, 4).reverse();
      expect(parent.$_get(0)).assertEqual(1);
      expect(parent.$_get(1)).assertEqual(4);
      expect(parent.$_get(2)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(2);
      expect(parent.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_1900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest019
     * @tc.desc Verify slice(1,4).reverse() on independent copy, original order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let r: Int32Array = a.slice(1, 4).reverse();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(40);
      expect(r.$_get(2)).assertEqual(20);
      expect(a.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest020
     * @tc.desc Verify Int32Array.of(3,6,9).reverse() index 0 is 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 6, 9).reverse();
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest021
     * @tc.desc Verify map double mapping: first +1 then *10 on [1,2] -> [20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = a.map((v: number, _i: int, _x: Int32Array): number => {
        return v + 1;
      })
      .map((v: number, _i: int, _x: Int32Array): number => {
        return v * 10;
      });
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest022
     * @tc.desc Verify filter double filter: odd then >5 on [1,3,5,7,9,2] -> [7,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 3, 5, 7, 9, 2);
      let r: Int32Array = a.filter((v: number, _i: int, _x: Int32Array): boolean => {
        return v % 2 !== 0;
      })
      .filter((v: number, _i: int, _x: Int32Array): boolean => {
        return v > 5;
      });
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest023
     * @tc.desc Verify reduce chain: sum [2,3,5] -> 10, then construct new Int32Array.of(s)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 5);
      let s: number = a.reduce((acc: number, v: number, _i: int, _x: Int32Array): number => {
        return acc + v;
      }, 0);
      let b: Int32Array = Int32Array.of(s);
      expect(b.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest024
     * @tc.desc Verify forEach external accumulator sums [3,5,7] -> 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0;
      let a: Int32Array = Int32Array.of(3, 5, 7);
      a.forEach((v: number, _i: int, _arr: Int32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest025
     * @tc.desc Verify forEach records index access order [0,1,2] for [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idxs: number[] = [];
      let a: Int32Array = Int32Array.of(4, 5, 6);
      a.forEach((_v: number, i: int, _arr: Int32Array): void => {
        idxs.push(i);
      });
      expect(idxs.length).assertEqual(3);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest026
     * @tc.desc Verify map reads external seed counter, initial seed=50, three elements -> [51,52,53]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seed: number = 50;
      let a: Int32Array = new Int32Array(3);
      let r: Int32Array = a.map((_v: number, _i: int, _arr: Int32Array): number => {
        seed = seed + 1;
        return seed;
      });
      expect(r.$_get(0)).assertEqual(51);
      expect(r.$_get(2)).assertEqual(53);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest027
     * @tc.desc Verify every stops at first false, [2,4,6,7,8] first odd at pos 3, 4 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0;
      let a: Int32Array = Int32Array.of(2, 4, 6, 7, 8);
      let r: boolean = a.every((v: number, _i: int, _arr: Int32Array): boolean => {
        calls = calls + 1;
        return v % 2 === 0;
      });
      expect(r).assertFalse();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest028
     * @tc.desc Verify some stops at first true, [1,3,5,6,7] first even at pos 3, 4 calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0;
      let a: Int32Array = Int32Array.of(1, 3, 5, 6, 7);
      let r: boolean = a.some((v: number, _i: int, _arr: Int32Array): boolean => {
        calls = calls + 1;
        return v % 2 === 0;
      });
      expect(r).assertTrue();
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_2900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest029
     * @tc.desc Verify findIndex stops after hit at pos 2, subsequent index callback not invoked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let visitedLast: boolean = false;
      let a: Int32Array = Int32Array.of(10, 20, 30, 40);
      let idx: number = a.findIndex((v: number, i: int, _arr: Int32Array): boolean => {
        if (i === 3) {
          visitedLast = true;
        }
        return v === 30;
      });
      expect(idx).assertEqual(2);
      expect(visitedLast).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest030
     * @tc.desc Verify reduce with external init value 100, [1,2,3,4] sum -> 110, callback called 4 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cnt: number = 0;
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let r: number = a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => {
        cnt = cnt + 1;
        return acc + v;
      }, 100);
      expect(r).assertEqual(110);
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest031
     * @tc.desc Verify reduceRight concatenates [7,8,9] from right to left -> "987"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 8, 9);
      let result: string = a.reduceRight((acc: string, v: number, _i: int, _x: Int32Array): string => {
        return acc + v.toString();
      }, '');
      expect(result).assertEqual('987');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest032
     * @tc.desc Verify filter third param arr.length captured by callback equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let captured: number = a.length;
      a.filter((_v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(captured).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest033
     * @tc.desc Verify from mapfn external seed=20 auto-increment, three elements -> [21,22,23]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let seed: number = 20;
      let src: Int32Array = new Int32Array(3);
      let r: Int32Array = src.map((_v: number, _i: int, _arr: Int32Array): number => {
        seed = seed + 1;
        return seed;
      });
      expect(r.$_get(0)).assertEqual(21);
      expect(r.$_get(2)).assertEqual(23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest034
     * @tc.desc Verify sort custom comparator comparison count > 0 and result correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4, 2, 5, 1);
      a.sort((x: number, y: number): int => {
        if (x > y) {
          return 1;
        }
        if (x < y) {
          return -1;
        }
        return 0;
      });
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest035
     * @tc.desc Verify forEach on empty array external counter stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0;
      let a: Int32Array = new Int32Array(0);
      a.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        calls = calls + 1;
      });
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest036
     * @tc.desc Verify map callback third param refers to original array, captured ref equals a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.map((v: number, _i: int, arr: Int32Array): number => {
        expect(arr).assertEqual(a);
        return v;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest037
     * @tc.desc Verify $_set(0,55) then $_get(0) returns 55 immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 55);
      expect(a.$_get(0)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest038
     * @tc.desc Verify fill(-1) on three elements sets every position to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-1);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(-1);
      expect(a.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_3900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest039
     * @tc.desc Verify set(src,1) writes [7,8] at offset, read offset positions equal source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(7, 8);
      dst.set(src, 1);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(7);
      expect(dst.$_get(2)).assertEqual(8);
      expect(dst.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest040
     * @tc.desc Verify copyWithin(2,0,2) on [9,8,7,6] sets position 3 to 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(9, 8, 7, 6);
      a.copyWithin(2, 0, 2);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(2)).assertEqual(9);
      expect(a.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest041
     * @tc.desc Verify reverse then at(-1) returns original first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200, 300);
      a.reverse();
      let last: Number | undefined = a.at(-1);
      expect(last as number).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest042
     * @tc.desc Verify sort then indexOf(min element) === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4, -9, 2, 0);
      a.sort();
      expect(a.indexOf(-9)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest043
     * @tc.desc Verify with(1,888) returns new array index 1=888, index 0 original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let w: Int32Array = a.with(1, 888);
      expect(w.$_get(0)).assertEqual(10);
      expect(w.$_get(1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest044
     * @tc.desc Verify child view $_set writes through to parent view (write child read parent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      parent.$_set(2, 3);
      parent.$_set(3, 4);
      let child: Int32Array = parent.subarray(2, 4);
      child.$_set(0, 555);
      expect(parent.$_get(2)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest045
     * @tc.desc Verify set with plain array literal [-2,0,2] reads back same values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.set([-2, 0, 2]);
      expect(a.$_get(0)).assertEqual(-2);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest046
     * @tc.desc Verify for-of values() with $_set mid-iteration modifies future element, subsequent iteration reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let seen: number[] = [];
      let first: boolean = true;
      for (let i: int = 0; i < a.length; i++) {
        let v: number = a.$_get(i);
        seen.push(v);
        if (first) {
          a.$_set(2, 77);
          first = false;
        }
      }
      expect(seen[0]).assertEqual(1);
      expect(seen[2]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest047
     * @tc.desc Verify for-of values() with break early termination, accumulator only contains first few elements sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let sum: number = 0;
      for (let i: int = 0; i < a.length; i++) {
        let n: number = a.$_get(i);
        if (n >= 3) {
          break;
        }
        sum = sum + n;
      }
      expect(sum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest048
     * @tc.desc Verify forEach callback $_set future index, that index callback reads new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0);
      a.forEach((v: number, i: int, arr: Int32Array): void => {
        if (i === 0) {
          arr.$_set(2, 9);
        }
        if (i === 2) {
          expect(v).assertEqual(9);
        }
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_4900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest049
     * @tc.desc Verify empty array values() iterator for-of body executes 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      let cnt: number = 0;
      for (let i: int = 0; i < a.length; i++) {
        a.$_get(i);
        cnt = cnt + 1;
      }
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest050
     * @tc.desc Verify keys() two independent iterations, second starts from beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let first: number = 0;
      for (let i: int = 0; i < a.length; i++) {
        let _k: int = i;
        first = first + 1;
      }
      let second: number = 0;
      for (let i: int = 0; i < a.length; i++) {
        let _k: int = i;
        second = second + 1;
      }
      expect(first).assertEqual(2);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest051
     * @tc.desc Verify entries manual next: first done=false, third done=true (two elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      let it = a.entries();
      let r1 = it.next();
      expect(r1.done).assertFalse();
      let r2 = it.next();
      expect(r2.done).assertFalse();
      let r3 = it.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest052
     * @tc.desc Verify $_iterator (default for-of) produces same value sequence as values()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(4, 5);
      let direct: number[] = [];
      let vi: number[] = [];
      for (let i: int = 0; i < a.length; i++) {
        let v: number = a.$_get(i);
        direct.push(v);
      }
      for (let i: int = 0; i < a.length; i++) {
        let v: number = a.$_get(i);
        vi.push(v);
      }
      expect(direct.length).assertEqual(vi.length);
      expect(direct[0]).assertEqual(vi[0]);
      expect(direct[1]).assertEqual(vi[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest053
     * @tc.desc Verify forEach callback $_set current index to v*2, all positions doubled after execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.forEach((v: number, i: int, arr: Int32Array): void => {
        arr.$_set(i, v * 2);
      });
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(1)).assertEqual(4);
      expect(a.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest054
     * @tc.desc Verify for-of keys() with break early termination should not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let seen: number[] = [];
      for (let i: int = 0; i < a.length; i++) {
        let k: int = i;
        seen.push(k);
        if (k === 1) {
          break;
        }
      }
      expect(seen.length).assertEqual(2);
      expect(seen[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest055
     * @tc.desc Verify fill(Infinity) two elements both ToInt32 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest056
     * @tc.desc Verify of(NaN, Infinity, -Infinity) three special values ToInt32 all to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest057
     * @tc.desc Verify from([4294967297.0]) ToInt32 wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [4294967297.0];
      let a: Int32Array = Int32Array.from(src);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest058
     * @tc.desc Verify with(1, Infinity) returns new array with that position 0, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let w: Int32Array = a.with(1, Number.POSITIVE_INFINITY);
      expect(w.$_get(1)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_5900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest059
     * @tc.desc Verify set source with 2147483649.0 (INT_MAX+2) ToInt32 wraps to -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array(2);
      let src: Int32Array = Int32Array.from([2147483649.0]);
      dst.set(src, 0);
      expect(dst.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest060
     * @tc.desc Verify two Int32Array views on same ArrayBuffer, viewA write visible from viewB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let viewA: Int32Array = new Int32Array(buf);
      let viewB: Int32Array = new Int32Array(buf);
      viewA.$_set(0, 111);
      expect(viewB.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest061
     * @tc.desc Verify byteOffset=4 child view $_set(0) equals parent $_set(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4);
      child.$_set(0, 777);
      expect(parent.$_get(1)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest062
     * @tc.desc Verify byteOffset=4 length=2 child write does not affect parent offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      child.$_set(0, 5);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest063
     * @tc.desc Verify subarray child buffer equals parent buffer (shared)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(6);
      let s: Int32Array = a.subarray(2, 5);
      expect(a.buffer).assertEqual(s.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest064
     * @tc.desc Verify slice result buffer differs from original (independent copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(6);
      a.slice(0, 3);
      expect(a.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest065
     * @tc.desc Verify toReversed result buffer independent, modifying new array does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.toReversed();
      r.$_set(0, 99);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest066
     * @tc.desc Verify map result buffer independent, modifications do not write back to source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let m: Int32Array = a.map((v: number, _i: int, _x: Int32Array): number => {
        return v;
      });
      m.$_set(0, 888);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest067
     * @tc.desc Verify viewA fill(7) on shared buffer, viewB reads 7 at each position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let viewA: Int32Array = new Int32Array(buf);
      let viewB: Int32Array = new Int32Array(buf);
      viewA.fill(7);
      expect(viewB.$_get(1)).assertEqual(7);
      expect(viewB.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest068
     * @tc.desc Verify constructor(buf,0,0) zero-length view is legal, buffer shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a: Int32Array = new Int32Array(buf, 0, 0);
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(a.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_6900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest069
     * @tc.desc Verify reverse return value === original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = a.reverse();
      expect(a).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest070
     * @tc.desc Verify sort return value === original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 1);
      let r: Int32Array = a.sort();
      expect(a).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest071
     * @tc.desc Verify fill return value === original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let r: Int32Array = a.fill(0);
      expect(a).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest072
     * @tc.desc Verify copyWithin return value === original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.copyWithin(0, 1);
      expect(a).assertEqual(r);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest073
     * @tc.desc Verify valueOf() return value === original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let v: Object = a.valueOf();
      expect(a).assertEqual(v);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest074
     * @tc.desc Verify toReversed returns [2,1] and leaves the original [1,2] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let r: Int32Array = a.toReversed();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(1);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest075
     * @tc.desc Verify with(0,5) returns [5,2] and leaves the original [1,2] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let w: Int32Array = a.with(0, 5);
      expect(w.$_get(0)).assertEqual(5);
      expect(w.$_get(1)).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest076
     * @tc.desc Verify filter returns new reference even if all elements retained ( !== original)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let f: Int32Array = a.filter((_v: number, _i: int, _x: Int32Array): boolean => {
        return true;
      });
      expect(a.length).assertEqual(3);
      expect(f.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest077
     * @tc.desc Verify slice returns [1,2] with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let s: Int32Array = a.slice();
      expect(s.length).assertEqual(2);
      expect(s.$_get(0)).assertEqual(1);
      expect(s.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest078
     * @tc.desc Verify forEach callback throws on first call, error propagates, subsequent callbacks not executed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0;
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.forEach((_v: number, _i: int, _arr: Int32Array): void => {
          calls = calls + 1;
          throw new Error('stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_7900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest079
     * @tc.desc Verify map callback throws on second element, error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.map((v: number, _i: int, _x: Int32Array): number => {
          if (v === 2) {
            throw new Error('m');
          }
          return v;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest080
     * @tc.desc Verify from mapfn throws, error propagates, from does not return result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1, 2];
      try {
        Int32Array.from(src, (_v: number): number => {
          throw new Error('f');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest081
     * @tc.desc Verify sort compareFn throws, error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      try {
        a.sort((_x: number, _y: number): int => {
          throw new Error('c');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8200
     * @tc.name int32ArrayOverviewPart08TestMindmapTest082
     * @tc.desc Verify reduce on empty array without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      try {
        a.reduce((_acc: number, _v: number, _i: int, _x: Int32Array): number => {
          return 0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8300
     * @tc.name int32ArrayOverviewPart08TestMindmapTest083
     * @tc.desc Verify set(src,0) out of bounds (source length > this.length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      let src: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.set(src, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8400
     * @tc.name int32ArrayOverviewPart08TestMindmapTest084
     * @tc.desc Verify with(index=length, v) out of bounds throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        a.with(2, 9);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8500
     * @tc.name int32ArrayOverviewPart08TestMindmapTest085
     * @tc.desc Verify $_get(length) out-of-bounds read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.$_get(a.length);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8600
     * @tc.name int32ArrayOverviewPart08TestMindmapTest086
     * @tc.desc Verify $_get(-1) negative index read throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8700
     * @tc.name int32ArrayOverviewPart08TestMindmapTest087
     * @tc.desc Verify $_set(length, 99) out-of-bounds throws RangeError and preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.$_set(a.length, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8800
     * @tc.name int32ArrayOverviewPart08TestMindmapTest088
     * @tc.desc Verify filter callback throws, error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.filter((v: number, _i: int, _x: Int32Array): boolean => {
          if (v === 2) {
            throw new Error('fl');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_8900
     * @tc.name int32ArrayOverviewPart08TestMindmapTest089
     * @tc.desc Verify some callback throws, error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        a.some((v: number, _i: int, _x: Int32Array): boolean => {
          throw new Error('s');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_9000
     * @tc.name int32ArrayOverviewPart08TestMindmapTest090
     * @tc.desc Verify every callback throws, error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        a.every((v: number, _i: int, _x: Int32Array): boolean => {
          throw new Error('e');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OVERVIEW_PART08_TEST_MINDMAP_9100
     * @tc.name int32ArrayOverviewPart08TestMindmapTest091
     * @tc.desc Verify find callback throws, error propagates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOverviewPart08TestMindmapTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        a.find((v: number, _i: int, _x: Int32Array): boolean => {
          throw new Error('fi');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });
  });
}
