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

export default function int32ArrayFindPart03Test(): void {
  describe('Int32ArrayFindPart03Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayFindPart03TestMindmapTest001
     * @tc.desc Verify find does not invoke callback on empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let count: number = 0;
      arr.find((v: number): boolean => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayFindPart03TestMindmapTest002
     * @tc.desc Verify Int32Array ArrayBuffer(0) find undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      let result: number | undefined = arr.find((v: number): boolean => true);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayFindPart03TestMindmapTest003
     * @tc.desc Verify find returns undefined when no match in single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: number | undefined = arr.find((v: number): boolean => v === 99);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayFindPart03TestMindmapTest004
     * @tc.desc Verify find() 0 predicate v===0 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let result: number | undefined = arr.find((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayFindPart03TestMindmapTest005
     * @tc.desc Verify find() INT_MIN -2147483648 predicate INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let result: number | undefined = arr.find((v: number): boolean => v === -2147483648);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayFindPart03TestMindmapTest006
     * @tc.desc Verify find callback receives index 0 for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let seenIdx: int = -99;
      arr.find((v: number, i: int): boolean => {
        seenIdx = i;
        return false;
      });
      expect(seenIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayFindPart03TestMindmapTest007
     * @tc.desc Verify find invokes callback exactly once when predicate returns true on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let cnt: number = 0;
      arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return true;
      });
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayFindPart03TestMindmapTest008
     * @tc.desc Verify find returns first element in homogeneous array where all elements match predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5, 5]);
      let result: number | undefined = arr.find((v: number): boolean => v === 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayFindPart03TestMindmapTest009
     * @tc.desc Verify find stops after first match even when all elements satisfy predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7]);
      let cnt: number = 0;
      arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return true;
      });
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayFindPart03TestMindmapTest010
     * @tc.desc Verify find iterates all elements and returns undefined when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 3, 3]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return false;
      });
      expect(cnt).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayFindPart03TestMindmapTest011
     * @tc.desc Verify find returns undefined when all elements fail greater-than-zero predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let result: number | undefined = arr.find((v: number): boolean => v > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayFindPart03TestMindmapTest012
     * @tc.desc Verify find returns first element when all are -1 and predicate is v<0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let result: number | undefined = arr.find((v: number): boolean => v < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayFindPart03TestMindmapTest013
     * @tc.desc Verify find matches first element with minimal callback invocations and correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let cnt: number = 0;
      let lastIdx: int = -1;
      let result: number | undefined = arr.find((v: number, i: int): boolean => {
        cnt = cnt + 1;
        lastIdx = i;
        return v === 10;
      });
      expect(result).assertEqual(10);
      expect(cnt).assertEqual(1);
      expect(lastIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayFindPart03TestMindmapTest014
     * @tc.desc Verify find iterates to last element when match is at end of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 99]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return v === 99;
      });
      expect(result).assertEqual(99);
      expect(cnt).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayFindPart03TestMindmapTest015
     * @tc.desc Verify find propagates Error thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.find((v: number): boolean => {
          throw new Error('predicate error first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayFindPart03TestMindmapTest016
     * @tc.desc Verify find stops iteration and propagates error when predicate throws mid-iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let cnt: number = 0;
      let thrown: boolean = false;
      try {
        arr.find((v: number): boolean => {
          cnt = cnt + 1;
          if (v === 30) {
            throw new Error('mid error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayFindPart03TestMindmapTest017
     * @tc.desc Verify find propagates error when predicate throws on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cnt: number = 0;
      let thrown: boolean = false;
      try {
        arr.find((v: number): boolean => {
          cnt = cnt + 1;
          if (cnt === 3) {
            throw new Error('last err');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        thrown = true;
      }
      expect(thrown).assertTrue();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayFindPart03TestMindmapTest018
     * @tc.desc Verify find propagates RangeError and TypeError thrown by predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        let re: RangeError = new RangeError('range');
        arr.find((v: number): boolean => {
          throw re;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      try {
        let te: TypeError = new TypeError('type');
        arr.find((v: number): boolean => {
          throw te;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayFindPart03TestMindmapTest019
     * @tc.desc Verify find does not modify array elements when predicate throws on first call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      try {
        arr.find((v: number): boolean => {
          throw new Error('x');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayFindPart03TestMindmapTest020
     * @tc.desc Verify find does not invoke callback on empty Int32Array when predicate would return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let reached: boolean = false;
      arr.find((v: number): boolean => {
        reached = true;
        return false;
      });
      expect(reached).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayFindPart03TestMindmapTest021
     * @tc.desc Verify find observes element modifications made by callback via a.$_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let seen: Int32Array = new Int32Array(4);
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => {
        seen.$_set(i, v);
        if (i === 0) {
          a.$_set(2, 99);
        }
        return false;
      });
      expect(seen.$_get(0)).assertEqual(1);
      expect(seen.$_get(1)).assertEqual(2);
      expect(seen.$_get(2)).assertEqual(99);
      expect(seen.$_get(3)).assertEqual(4);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayFindPart03TestMindmapTest022
     * @tc.desc Verify find returns element modified by callback during earlier iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(3, 777);
        }
        return v === 777;
      });
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayFindPart03TestMindmapTest023
     * @tc.desc Verify find callback sees original value v even after callback modifies element via a.$_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => {
        a.$_set(i, 999);
        return v === 10;
      });
      expect(result).assertEqual(10);
      expect(arr.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayFindPart03TestMindmapTest024
     * @tc.desc Verify find observes element changes made by another view sharing the same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      arr.$_set(3, 4);
      let other: Int32Array = new Int32Array(buf);
      let seenThird: number = 0 as number;
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) {
          other.$_set(2, 888);
        }
        if (i === 2) {
          seenThird = v;
        }
        return false;
      });
      expect(seenThird).assertEqual(888);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayFindPart03TestMindmapTest025
     * @tc.desc Verify find returns undefined when all elements fail greater-than-100 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: number | undefined = arr.find((v: number, i: int, a: Int32Array): boolean => v > 100);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayFindPart03TestMindmapTest026
     * @tc.desc Verify find throws ClassCastError when predicate is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.find(undefined as Object as (v: number, i: int, a: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayFindPart03TestMindmapTest027
     * @tc.desc Verify find throws ClassCastError when predicate is a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        arr.find(123 as Object as (v: number, i: int, a: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayFindPart03TestMindmapTest028
     * @tc.desc Verify find throws ClassCastError when predicate is a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.find('notAFunction' as Object as (v: number, i: int, a: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayFindPart03TestMindmapTest029
     * @tc.desc Verify find throws ClassCastError when predicate is an Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      try {
        let obj: Object = new Object();
        arr.find(obj as (v: number, i: int, a: Int32Array) => boolean);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayFindPart03TestMindmapTest030
     * @tc.desc Verify find() predicate Boolean(0) false falsy-0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return Boolean(0);
      });
      expect(cnt).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayFindPart03TestMindmapTest031
     * @tc.desc Verify find() predicate Boolean('') false falsy undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return Boolean('');
      });
      expect(cnt).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayFindPart03TestMindmapTest032
     * @tc.desc Verify find() predicate Boolean(null) false null falsy undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return Boolean(null);
      });
      expect(cnt).assertEqual(2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayFindPart03TestMindmapTest033
     * @tc.desc Verify find() predicate Boolean(undefined) false undefined falsy undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return Boolean(undefined);
      });
      expect(cnt).assertEqual(3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayFindPart03TestMindmapTest034
     * @tc.desc Verify find returns undefined and iterates all elements when predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6]);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return false;
      });
      expect(cnt).assertEqual(2);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayFindPart03TestMindmapTest035
     * @tc.desc Verify find returns element at specified index when predicate conditionally returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => {
        if (i === 1) {
          return true;
        }
        return false;
      });
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayFindPart03TestMindmapTest036
     * @tc.desc Verify find matches element when predicate returns Boolean string which is truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => {
        if (i === 2) {
          return Boolean('yes');
        }
        return false;
      });
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayFindPart03TestMindmapTest037
     * @tc.desc Verify find matches first element when predicate returns Boolean object which is truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => {
        if (i === 0) {
          return Boolean(new Object());
        }
        return false;
      });
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayFindPart03TestMindmapTest038
     * @tc.desc Verify find returns undefined when predicate always returns false on two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let result: number | undefined = arr.find((v: number): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayFindPart03TestMindmapTest039
     * @tc.desc Verify find callback can perform arithmetic on element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let doubled: number = 0 as number;
      arr.find((v: number, i: int): boolean => {
        doubled = v * 2;
        return i === 0;
      });
      expect(doubled).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayFindPart03TestMindmapTest040
     * @tc.desc Verify find callback receives sequential index values 0 through length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let idxArr: Int32Array = new Int32Array(4);
      let valueArr: Int32Array = new Int32Array(4);
      let pos: int = 0;
      arr.find((v: number, i: int): boolean => {
        idxArr.$_set(pos, i);
        valueArr.$_set(pos, v);
        pos = pos + 1;
        return false;
      });
      expect(idxArr.$_get(0)).assertEqual(0);
      expect(idxArr.$_get(1)).assertEqual(1);
      expect(idxArr.$_get(2)).assertEqual(2);
      expect(idxArr.$_get(3)).assertEqual(3);
      expect(valueArr.$_get(0)).assertEqual(10);
      expect(valueArr.$_get(1)).assertEqual(20);
      expect(valueArr.$_get(2)).assertEqual(30);
      expect(valueArr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayFindPart03TestMindmapTest041
     * @tc.desc Verify find callback receives the original Int32Array as third argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sameAtLast: boolean = false;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === a.length - 1) {
          sameAtLast = a === arr;
        }
        return false;
      });
      expect(sameAtLast).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayFindPart03TestMindmapTest042
     * @tc.desc Verify find callback receives array argument with correct length for each invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50, 60]);
      let mismatch: boolean = false;
      arr.find((v: number, i: int, a: Int32Array): boolean => {
        if (a.length !== 6) {
          mismatch = true;
        }
        return false;
      });
      expect(mismatch).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayFindPart03TestMindmapTest043
     * @tc.desc Verify find returns undefined when all negative elements fail positive predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      let result: number | undefined = arr.find((v: number): boolean => v > 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayFindPart03TestMindmapTest044
     * @tc.desc Verify find returns undefined when no element differs from INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647]);
      let result: number | undefined = arr.find((v: number): boolean => v !== 2147483647);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayFindPart03TestMindmapTest045
     * @tc.desc Verify find returns undefined when all elements equal INT32_MIN and predicate seeks different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648, -2147483648]);
      let result: number | undefined = arr.find((v: number): boolean => v !== -2147483648);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayFindPart03TestMindmapTest046
     * @tc.desc Verify find returns undefined after iterating four-element array with false predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: number | undefined = arr.find((v: number): boolean => false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayFindPart03TestMindmapTest047
     * @tc.desc Verify find result is strictly undefined but not null when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: number | undefined = arr.find((v: number): boolean => v === 999);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayFindPart03TestMindmapTest048
     * @tc.desc Verify find returns zero element when predicate uses falsy negation of value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 0, 3]);
      let result: number | undefined = arr.find((v: number): boolean => !v as boolean);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayFindPart03TestMindmapTest049
     * @tc.desc Verify find on subarray with non-zero byteOffset returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      full.$_set(3, 400);
      let sub: Int32Array = new Int32Array(buf, 8, 2);
      let result: number | undefined = sub.find((v: number): boolean => v === 400);
      expect(result).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayFindPart03TestMindmapTest050
     * @tc.desc Verify find callback modifications via a.$_set on subarray affect underlying shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let sub: Int32Array = new Int32Array(buf, 4, 3);
      sub.find((v: number, i: int, a: Int32Array): boolean => {
        if (i === 0) {
          a.$_set(0, 999);
        }
        return true;
      });
      expect(full.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayFindPart03TestMindmapTest051
     * @tc.desc Verify find iterates up to and including matching element in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      arr.$_set(50, 5555);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return v === 5555;
      });
      expect(result).assertEqual(5555);
      expect(cnt).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayFindPart03TestMindmapTest052
     * @tc.desc Verify find iterates all 100 elements and returns undefined when no match in large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      let cnt: number = 0;
      let result: number | undefined = arr.find((v: number): boolean => {
        cnt = cnt + 1;
        return v < 0;
      });
      expect(cnt).assertEqual(100);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayFindPart03TestMindmapTest053
     * @tc.desc Verify find accumulates element values when predicate returns false for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sum: number = 0;
      arr.find((v: number): boolean => {
        sum = sum + v;
        return false;
      });
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayFindPart03TestMindmapTest054
     * @tc.desc Verify find returns correct element from three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayFindPart03TestMindmapTest055
     * @tc.desc Verify find stops iteration immediately when predicate throws and does not visit remaining elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let visitedLast: boolean = false;
      try {
        arr.find((v: number): boolean => {
          if (v === 50) {
            visitedLast = true;
          }
          if (v === 20) {
            throw new Error('stop at 20');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visitedLast).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayFindPart03TestMindmapTest056
     * @tc.desc Verify find propagates error message from predicate throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      try {
        arr.find((v: number): boolean => {
          throw new Error('boom-xyz');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom-xyz');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayFindPart03TestMindmapTest057
     * @tc.desc Verify find returns undefined when all elements are zero and predicate seeks non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let result: number | undefined = arr.find((v: number): boolean => v !== 0);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayFindPart03TestMindmapTest058
     * @tc.desc Verify find matches first zero element at index 0 in zero-initialized array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let firstIdx: int = -1;
      let result: number | undefined = arr.find((v: number, i: int): boolean => {
        firstIdx = i;
        return v === 0;
      });
      expect(result).assertEqual(0);
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayFindPart03TestMindmapTest059
     * @tc.desc Verify find returns first non-zero element in array with leading zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 5, 0]);
      let result: number | undefined = arr.find((v: number, i: int): boolean => v !== 0);
      expect(result).assertEqual(5);
    });
  });
}
