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

export default function int32ArrayFindPart04Test(): void {
  describe('Int32ArrayFindPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayFindPart04TestMindmapTest001
     * @tc.desc Verify find does not modify array length on successful match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let before: int = arr.length;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 30;
      });
      expect(result).assertEqual(30);
      let after: int = arr.length;
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayFindPart04TestMindmapTest002
     * @tc.desc Verify find does not modify byteLength when no element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let before: int = arr.byteLength;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v < 0;
      });
      expect(result).assertEqual(undefined);
      let after: int = arr.byteLength;
      expect(after).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayFindPart04TestMindmapTest003
     * @tc.desc Verify find returns undefined and preserves elements when no element exceeds threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v > 100;
      });
      expect(result).assertEqual(undefined);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayFindPart04TestMindmapTest004
     * @tc.desc Verify find does not modify byteOffset of view with non-zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      let before: int = arr.byteOffset;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(result).assertEqual(undefined);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayFindPart04TestMindmapTest005
     * @tc.desc Verify find does not change the underlying ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let bufBefore = arr.buffer;
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 2;
      });
      expect(result).assertEqual(2);
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayFindPart04TestMindmapTest006
     * @tc.desc Verify find on zero-length array returns undefined and preserves zero length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let result = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return true;
      });
      expect(result).assertEqual(undefined);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayFindPart04TestMindmapTest007
     * @tc.desc Verify find with side-effect flag matches element where both flag and value conditions hold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let flag: boolean = false;
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v === 3) {
          flag = true;
        }
        return flag && v === 4;
      });
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayFindPart04TestMindmapTest008
     * @tc.desc Verify find invokes callback four times to reach match at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let calls: int = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return v === 40;
      });
      expect(calls).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayFindPart04TestMindmapTest009
     * @tc.desc Verify find iterates all six elements when no match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5, 6]);
      let calls: int = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        calls++;
        return v < 0;
      });
      expect(calls).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayFindPart04TestMindmapTest010
     * @tc.desc Verify find callback receives sequential indices from 0 to length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let seen: int[] = [];
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        seen.push(i);
        return false;
      });
      expect(seen.length).assertEqual(3);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(1);
      expect(seen[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayFindPart04TestMindmapTest011
     * @tc.desc Verify find callback receives correct element values in iteration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let vals: number[] = [];
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        vals.push(v);
        return false;
      });
      expect(vals.length).assertEqual(3);
      expect(vals[0]).assertEqual(7);
      expect(vals[1]).assertEqual(8);
      expect(vals[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayFindPart04TestMindmapTest012
     * @tc.desc Verify find callback captures matching element via captured variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let captured: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v === 22) {
          captured = v;
          return true;
        }
        return false;
      });
      expect(captured).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayFindPart04TestMindmapTest013
     * @tc.desc Verify find accumulates values via sum and stops at matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let sum: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        sum = sum + v;
        return v === 6;
      });
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayFindPart04TestMindmapTest014
     * @tc.desc Verify find callback captures index of matching element at position 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hitIdx: int = -1;
      let arr: Int32Array = new Int32Array([100, 200, 300, 400]);
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (hitIdx === -1 && v === 300) {
          hitIdx = i;
          return true;
        }
        return false;
      });
      expect(hitIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayFindPart04TestMindmapTest015
     * @tc.desc Verify find callback toggles boolean flag when matching element is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let toggled: boolean = false;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v === 2) {
          toggled = true;
          return true;
        }
        return false;
      });
      expect(toggled).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayFindPart04TestMindmapTest016
     * @tc.desc Verify nested find returns element when outer predicate depends on inner find result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5, 9]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        let inner = a.find((w: number, j: int, b: Int32Array): boolean => {
          return w === 9 && j > i;
        });
        return v === 5 && inner === 9;
      });
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayFindPart04TestMindmapTest017
     * @tc.desc Verify find across two different Int32Array instances returning matching cross-reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1, 2, 3]);
      let b: Int32Array = new Int32Array([30, 10, 20]);
      let res = a.find((v: number, i: int, arr: Int32Array): boolean => {
        let hit = b.find((w: number, j: int, brr: Int32Array): boolean => {
          return w === v * 10;
        });
        return hit !== undefined;
      });
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayFindPart04TestMindmapTest018
     * @tc.desc Verify outer find returns undefined when inner find returns undefined and predicate relies on it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        let inner = a.find((w: number, j: int, b: Int32Array): boolean => {
          return w < 0;
        });
        return v > 100 && inner === undefined;
      });
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayFindPart04TestMindmapTest019
     * @tc.desc Verify nested find callback receives correct array instance as third argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let outer: Int32Array = new Int32Array([7, 8]);
      let innerArr: Int32Array = new Int32Array([9]);
      let same: boolean = false;
      outer.find((v: number, i: int, oa: Int32Array): boolean => {
        innerArr.find((w: number, j: int, ia: Int32Array): boolean => {
          same = ia === innerArr;
          return true;
        });
        return false;
      });
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayFindPart04TestMindmapTest020
     * @tc.desc Verify triple nested find returns first element when innermost predicate matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1]);
      let b: Int32Array = new Int32Array([2]);
      let c: Int32Array = new Int32Array([3]);
      let res = a.find((av: number, ai: int, aa: Int32Array): boolean => {
        return b.find((bv: number, bi: int, ba: Int32Array): boolean => {
          return c.find((cv: number, ci: int, ca: Int32Array): boolean => {
            return cv === 3;
          }) !== undefined;
        }) !== undefined;
      });
      expect(res).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayFindPart04TestMindmapTest021
     * @tc.desc Verify consecutive find calls on same array return identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6, 7]);
      let r1 = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 6;
      });
      let r2 = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 6;
      });
      expect(r1).assertEqual(6);
      expect(r2).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayFindPart04TestMindmapTest022
     * @tc.desc Verify multiple find calls on same array can locate different elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let first = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 11;
      });
      let second = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 33;
      });
      expect(first).assertEqual(11);
      expect(second).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayFindPart04TestMindmapTest023
     * @tc.desc Verify find matches element modified by a.$_set at earlier iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(2, 999);
        }
        return v === 999;
      });
      expect(res).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayFindPart04TestMindmapTest024
     * @tc.desc Verify find matches negative value -1 set by a.$_set during earlier iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(3, -1);
        }
        return v === -1;
      });
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayFindPart04TestMindmapTest025
     * @tc.desc Verify find returns current element when earlier element was modified by a.$_set later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 2) {
          a.$_set(0, 999);
        }
        return v === 3;
      });
      expect(res).assertEqual(3);
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayFindPart04TestMindmapTest026
     * @tc.desc Verify find returns first match among multiple elements modified by a.$_set during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let hitIdx: int = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          a.$_set(2, 77);
          a.$_set(3, 77);
        }
        if (v === 77 && hitIdx === -1) {
          hitIdx = i;
          return true;
        }
        return false;
      });
      expect(hitIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayFindPart04TestMindmapTest027
     * @tc.desc Verify find returns original element value even when callback modifies it via a.$_set and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v === 2) {
          a.$_set(i, 999);
          return true;
        }
        return false;
      });
      expect(res).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayFindPart04TestMindmapTest028
     * @tc.desc Verify find matches zero value set by a.$_set during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          a.$_set(2, 0);
          a.$_set(3, 0);
          a.$_set(4, 0);
        }
        return v === 0;
      });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayFindPart04TestMindmapTest029
     * @tc.desc Verify a.$_set with NaN results in ToInt32 value 0 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, Number.NaN);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayFindPart04TestMindmapTest030
     * @tc.desc Verify a.$_set with positive infinity results in ToInt32 value 0 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, Number.POSITIVE_INFINITY);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayFindPart04TestMindmapTest031
     * @tc.desc Verify a.$_set with negative infinity results in ToInt32 value 0 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, -1.0 / 0.0);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayFindPart04TestMindmapTest032
     * @tc.desc Verify a.$_set with fractional value 0.5 results in ToInt32 value 0 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 0.5);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayFindPart04TestMindmapTest033
     * @tc.desc Verify a.$_set with negative fractional value -0.9 results in ToInt32 value 0 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, -0.9);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayFindPart04TestMindmapTest034
     * @tc.desc Verify a.$_set with value just above INT32_MAX truncates to INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 2147483647.9);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayFindPart04TestMindmapTest035
     * @tc.desc Verify a.$_set with overflow value 2147483648 wraps to INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 2147483648 as number);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayFindPart04TestMindmapTest036
     * @tc.desc Verify a.$_set with overflow value 2147483649 wraps to -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 2147483649 as number);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayFindPart04TestMindmapTest037
     * @tc.desc Verify a.$_set with underflow value -2147483649 wraps to INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, -2147483649 as number);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayFindPart04TestMindmapTest038
     * @tc.desc Verify a.$_set with value 2^32 results in ToInt32 value 0 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 4294967296 as number);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayFindPart04TestMindmapTest039
     * @tc.desc Verify a.$_set with value 2^32+1 results in ToInt32 value 1 visible to find callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let seen: number = -1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 4294967297 as number);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayFindPart04TestMindmapTest040
     * @tc.desc Verify a.$_set with INT32_MAX value is visible to find callback as INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let seen: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 2147483647);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayFindPart04TestMindmapTest041
     * @tc.desc Verify a.$_set with INT32_MIN value is visible to find callback as INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let seen: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, -2147483648);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayFindPart04TestMindmapTest042
     * @tc.desc Verify find observes element modified by another view sharing the same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      a.$_set(3, 4);
      let res = a.find((v: number, i: int, arr: Int32Array): boolean => {
        if (i === 0) {
          b.$_set(2, 777);
        }
        return v === 777;
      });
      expect(res).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayFindPart04TestMindmapTest043
     * @tc.desc Verify parent find with a.$_set modifies shared buffer visible to subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(1, 3);
      parent.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(2, 999);
        }
        return false;
      });
      expect(child.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayFindPart04TestMindmapTest044
     * @tc.desc Verify subarray find with a.$_set modifies shared buffer visible to parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(1, 4);
      child.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 888);
        }
        return false;
      });
      expect(parent.$_get(2)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayFindPart04TestMindmapTest045
     * @tc.desc Verify find with a.$_set on view modifies shared buffer visible to another view with same byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let secondView: Int32Array = new Int32Array(buf, 4, 4);
      let thirdView: Int32Array = new Int32Array(buf, 4, 4);
      secondView.$_set(0, 11);
      secondView.$_set(1, 22);
      secondView.$_set(2, 33);
      secondView.$_set(3, 44);
      secondView.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          a.$_set(2, 555);
        }
        return false;
      });
      expect(thirdView.$_get(2)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayFindPart04TestMindmapTest046
     * @tc.desc Verify find reads element values set via DataView on shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0, 2);
      let dv: DataView = new DataView(buf);
      dv.setInt32(0, 1, true);
      dv.setInt32(4, 2, true);
      let res = view.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 2;
      });
      expect(res).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayFindPart04TestMindmapTest047
     * @tc.desc Verify find on subarray does not modify its length or byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0, 0]);
      let child: Int32Array = parent.subarray(2, 5);
      let beforeLen: int = child.length;
      let beforeOff: int = child.byteOffset;
      child.find((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(0, 7);
        return v === 7;
      });
      expect(child.length).assertEqual(beforeLen);
      expect(child.byteOffset).assertEqual(beforeOff);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayFindPart04TestMindmapTest048
     * @tc.desc Verify find on one subarray with a.$_set affects another overlapping subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let secondView: Int32Array = base.subarray(0, 4);
      let thirdView: Int32Array = base.subarray(2, 5);
      secondView.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 2) {
          a.$_set(3, 111);
        }
        return false;
      });
      expect(thirdView.$_get(1)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayFindPart04TestMindmapTest049
     * @tc.desc Verify find reads element value zeroed by Uint8Array view on shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let i32: Int32Array = new Int32Array(buf, 0, 2);
      let u8: Uint8Array = new Uint8Array(buf);
      i32.$_set(0, 123);
      i32.$_set(1, 456);
      let seen: number = -1;
      i32.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          u8.$_set(4, 0);
          u8.$_set(5, 0);
          u8.$_set(6, 0);
          u8.$_set(7, 0);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayFindPart04TestMindmapTest050
     * @tc.desc Verify a.$_set modifications persist even after find throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) {
            a.$_set(2, 77);
          }
          if (i === 1) {
            throw new Error('stop');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(2)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayFindPart04TestMindmapTest051
     * @tc.desc Verify find invokes callback three times before throwing exception at index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let calls: int = 0;
      try {
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          calls++;
          if (i === 2) {
            throw new Error('x');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayFindPart04TestMindmapTest052
     * @tc.desc Verify find does not modify array length even when predicate throws an exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      try {
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          throw new Error('e');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayFindPart04TestMindmapTest053
     * @tc.desc Verify find propagates exception with error name Error when predicate throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.find((v: number, i: int, a: Int32Array): boolean => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayFindPart04TestMindmapTest054
     * @tc.desc Verify find returns correct element matching value 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 30;
      });
      expect(res).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayFindPart04TestMindmapTest055
     * @tc.desc Verify find with always-false predicate returns undefined on two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayFindPart04TestMindmapTest056
     * @tc.desc Verify find with always-false predicate returns undefined on three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return false;
      });
      expect(res).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayFindPart04TestMindmapTest057
     * @tc.desc Verify find callback receives the same Int32Array instance across all iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let allSame: boolean = true;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (a !== arr) {
          allSame = false;
        }
        return false;
      });
      expect(allSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayFindPart04TestMindmapTest058
     * @tc.desc Verify array length in callback remains consistent despite element modifications during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let allLenFive: boolean = true;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (a.length !== 5) {
          allLenFive = false;
        }
        if (i === 2) {
          a.$_set(0, 99);
        }
        return false;
      });
      expect(allLenFive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayFindPart04TestMindmapTest059
     * @tc.desc Verify find returns third even number using count-based state in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6, 8, 10]);
      let count: int = 0;
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v % 2 === 0) {
          count++;
        }
        return count === 3;
      });
      expect(res).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayFindPart04TestMindmapTest060
     * @tc.desc Verify find returns first positive element using count-based state in predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9, 12]);
      let count: int = 0;
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v > 0) {
          count++;
        }
        return count === 1;
      });
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayFindPart04TestMindmapTest061
     * @tc.desc Verify find returns undefined when count-based predicate never reaches target threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let count: int = 0;
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (v > 0) {
          count++;
        }
        return count === 999;
      });
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayFindPart04TestMindmapTest062
     * @tc.desc Verify a.$_set of INT32_MIN during iteration is visible to find callback as INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, 0]);
      let seen: number = 0;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, -2147483648);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayFindPart04TestMindmapTest063
     * @tc.desc Verify a.$_set of zero during iteration is visible to find callback as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 0]);
      let seen: number = 1;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(1, 0);
        }
        if (i === 1) {
          seen = v;
          return true;
        }
        return false;
      });
      expect(seen).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayFindPart04TestMindmapTest064
     * @tc.desc Verify find matches zero element when array contains both 0 and -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -0]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return v === 0;
      });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayFindPart04TestMindmapTest065
     * @tc.desc Verify find uses a.$_get to peek at next element and returns element preceding match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i < a.length - 1) {
          return a.$_get(i + 1) === 4;
        }
        return false;
      });
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayFindPart04TestMindmapTest066
     * @tc.desc Verify find uses a.at with negative index to peek at earlier element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 2) {
          return a.at(-3) === 10;
        }
        return false;
      });
      expect(res).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayFindPart04TestMindmapTest067
     * @tc.desc Verify find with a.$_set on middle view does not affect guard or tail views on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let guard: Int32Array = new Int32Array(buf, 0, 1);
      let middle: Int32Array = new Int32Array(buf, 4, 4);
      let tail: Int32Array = new Int32Array(buf, 20, 1);
      guard.$_set(0, 111);
      tail.$_set(0, 999);
      middle.$_set(0, 1);
      middle.$_set(1, 2);
      middle.$_set(2, 3);
      middle.$_set(3, 4);
      middle.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          a.$_set(2, 2147483648 as number);
        }
        return false;
      });
      expect(guard.$_get(0)).assertEqual(111);
      expect(tail.$_get(0)).assertEqual(999);
      expect(middle.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayFindPart04TestMindmapTest068
     * @tc.desc Verify sequential find calls with phase variable produce distinct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let phase: int = 0;
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let r1 = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return phase === 0 && v === 10;
      });
      phase = 1;
      let r2 = arr.find((v: number, i: int, a: Int32Array): boolean => {
        return phase === 1 && v === 30;
      });
      expect(r1).assertEqual(10);
      expect(r2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayFindPart04TestMindmapTest069
     * @tc.desc Verify find returns first element that breaks monotonic increasing sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 3, 5, 4, 6]);
      let prev: number = -1000000;
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        let isDrop: boolean = v < prev;
        prev = v;
        return isDrop;
      });
      expect(res).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayFindPart04TestMindmapTest070
     * @tc.desc Verify find returns undefined when array is strictly increasing with no value drop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let prev: number = -1000000;
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        let isDrop: boolean = v < prev;
        prev = v;
        return isDrop;
      });
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayFindPart04TestMindmapTest071
     * @tc.desc Verify a.$_set modification on shared buffer persists even when find throws exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(0, 1);
      a.$_set(1, 2);
      a.$_set(2, 3);
      try {
        a.find((v: number, i: int, arr: Int32Array): boolean => {
          arr.$_set(2, 777);
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom');
      }
      expect(b.$_get(2)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayFindPart04TestMindmapTest072
     * @tc.desc Verify a.$_set modification works correctly on Int32Array created with of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(2, 42);
        }
        return false;
      });
      expect(arr.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayFindPart04TestMindmapTest073
     * @tc.desc Verify a.$_set modification works correctly on Int32Array created with from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [1, 2, 3, 4];
      let arr: Int32Array = Int32Array.from(src);
      let res = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(3, -5);
        }
        return v === -5;
      });
      expect(res).assertEqual(-5);
    });
  });
}
