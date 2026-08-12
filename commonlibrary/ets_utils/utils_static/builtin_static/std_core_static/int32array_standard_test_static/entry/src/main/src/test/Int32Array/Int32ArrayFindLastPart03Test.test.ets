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

export default function int32ArrayFindLastPart03Test(): void {
  describe('Int32ArrayFindLastPart03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest001
     * @tc.desc Verify findLast predicate true undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return true; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest002
     * @tc.desc Verify findLast predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return true; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest003
     * @tc.desc Verify findLast predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('boom'); });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest004
     * @tc.desc Verify findLast predicate false undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest005
     * @tc.desc Verify empty findLast throws and preserves zero result properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return true; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest006
     * @tc.desc Verify findLast predicate array cnt 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let sawArray: boolean = false;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { sawArray = (a === arr); return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(sawArray).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest007
     * @tc.desc Verify ArrayBuffer findLast undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int32Array = new Int32Array(buf);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return true; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest008
     * @tc.desc Verify [9] predicate 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 9; });
      expect(res).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest009
     * @tc.desc Verify [9] predicate undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 42; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest010
     * @tc.desc Verify [0] predicate 0 0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest011
     * @tc.desc Verify [-1] predicate -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === -1; });
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest012
     * @tc.desc Verify INT_MAX (2147483647) 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 2147483647; });
      expect(res).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest013
     * @tc.desc Verify INT_MIN (-2147483648) -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === -2147483648; });
      expect(res).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest014
     * @tc.desc Verify predicate index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8]);
      let seenIdx: int = -99;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { seenIdx = i; return true; });
      expect(seenIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest015
     * @tc.desc Verify predicate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8]);
      let sameRef: boolean = false;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { sameRef = (a === arr); return true; });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest016
     * @tc.desc Verify predicate 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8]);
      let cnt: int = 0;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 8; });
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest017
     * @tc.desc Verify predicate 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([8]);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 999; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest018
     * @tc.desc Verify predicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([73]);
      let seenVal: number = 0;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { seenVal = v; return true; });
      expect(seenVal).assertEqual(73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest019
     * @tc.desc Verify [1] predicate i===-1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === -1; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest020
     * @tc.desc Verify [1] predicate i===length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === a.length; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest021
     * @tc.desc Verify [6,6,6] predicate findLast 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 6, 6]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return true; });
      expect(res).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest022
     * @tc.desc Verify [6,6,6] predicate 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 6, 6]);
      let cnt: int = 0;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return true; });
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest023
     * @tc.desc Verify [6,6,6] predicate length-1=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 6, 6]);
      let hitIdx: int = -1;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { hitIdx = i; return true; });
      expect(hitIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest024
     * @tc.desc Verify [0,0,0] predicate v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest025
     * @tc.desc Verify [-1,-1,-1] predicate v===-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === -1; });
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest026
     * @tc.desc Verify INT_MAX 2147483647 hitIdx=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 2147483647, 2147483647]);
      let hitIdx: int = -1;
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { hitIdx = i; return v === 2147483647; });
      expect(res).assertEqual(2147483647);
      expect(hitIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest027
     * @tc.desc Verify INT_MIN -2147483648 hitIdx=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
      let hitIdx: int = -1;
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { hitIdx = i; return v === -2147483648; });
      expect(res).assertEqual(-2147483648);
      expect(hitIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest028
     * @tc.desc Verify [5,5,5] predicate undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 999; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest029
     * @tc.desc Verify [5,5,5] predicate predicate 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return v === 999; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest030
     * @tc.desc Verify [5,5,5] predicate i===0 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === 0; });
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest031
     * @tc.desc Verify [5,5,5] predicate i===0 predicate 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let cnt: int = 0;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return i === 0; });
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest032
     * @tc.desc Verify predicate array.length ( ) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return a.length === 4; });
      expect(res).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest033
     * @tc.desc Verify predicate Error findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      let errName: string = '';
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('first-call'); });
      } catch (e) {
        threw = true;
        errName = (e as Error).name;
      }
      expect(threw).assertTrue();
      expect(errName).assertEqual('Error');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest034
     * @tc.desc Verify predicate RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let errName: string = '';
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new RangeError('oob'); });
      } catch (e) {
        errName = (e as Error).name;
      }
      expect(errName).assertEqual('RangeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest035
     * @tc.desc Verify predicate TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let errName: string = '';
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new TypeError('bad'); });
      } catch (e) {
        errName = (e as Error).name;
      }
      expect(errName).assertEqual('TypeError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest036
     * @tc.desc Verify predicate false i=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 0) { throw new Error('at-head'); }
          return false;
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest037
     * @tc.desc Verify predicate index=1 index=2 cnt=2 i=2 false i=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          cnt++;
          if (i === 1) { throw new Error('mid'); }
          return false;
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest038
     * @tc.desc Verify predicate i=length-1( ) cnt=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cnt: int = 0;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          cnt++;
          throw new Error('tail');
        });
      } catch (e) {}
      expect(cnt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest039
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('x'); });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest040
     * @tc.desc Verify
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let reached: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('e'); });
        reached = true;
      } catch (e) {}
      expect(reached).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest041
     * @tc.desc Verify predicate Error catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let caught: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('string-error'); });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest042
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('x'); });
      } catch (e) {}
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest043
     * @tc.desc Verify message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let msg: string = '';
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('marker-findlast'); });
      } catch (e) {
        msg = (e as Error).message;
      }
      expect(msg).assertEqual('marker-findlast');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest044
     * @tc.desc Verify predicate value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let lastSeenVal: number = 0;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          lastSeenVal = v;
          if (i === 1) { throw new Error('boom'); }
          return false;
        });
      } catch (e) {}
      expect(lastSeenVal).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest045
     * @tc.desc Verify predicate throw 0 catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let caught: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('0'); });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest046
     * @tc.desc Verify predicate undefined throw undefined catch Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      let caught: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { throw new Error('undefined'); });
      } catch (e) {
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest047
     * @tc.desc Verify predicate false findLast undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest048
     * @tc.desc Verify predicate false predicate length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest049
     * @tc.desc Verify predicate undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v > 1000; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest050
     * @tc.desc Verify predicate v<0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v < 0; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest051
     * @tc.desc Verify predicate i=length-1..0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let idxs: Array<number> = new Array<number>();
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { idxs.push(i); return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(idxs.length).assertEqual(3);
      expect(idxs[0]).assertEqual(2);
      expect(idxs[1]).assertEqual(1);
      expect(idxs[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest052
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let vals: Array<number> = new Array<number>();
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { vals.push(v); return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(vals.length).assertEqual(3);
      expect(vals[0]).assertEqual(30);
      expect(vals[1]).assertEqual(20);
      expect(vals[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest053
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let allSame: boolean = true;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { if (a !== arr) { allSame = false; } return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(allSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest054
     * @tc.desc Verify array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let allLen: boolean = true;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { if (a.length !== 5) { allLen = false; } return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(allLen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest055
     * @tc.desc Verify predicate i < 0 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i < 0; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest056
     * @tc.desc Verify predicate i >= length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i >= a.length; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest057
     * @tc.desc Verify predicate i === -length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let threw: boolean = false;
      let targetIdx: int = -(arr.length) - 1;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === targetIdx; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest058
     * @tc.desc Verify predicate i === length + 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === a.length + 1; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest059
     * @tc.desc Verify predicate i === 99999 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === 99999; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest060
     * @tc.desc Verify predicate $_set i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          if (i === 2) { a.$_set(0, 99); return false; }
          return v === 1;
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest061
     * @tc.desc Verify predicate v v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let seenV: number = 0;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => {
        seenV = v;
        a.$_set(i, 999);
        return true;
      });
      expect(seenV).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest062
     * @tc.desc Verify predicate true findLast i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let visited: Array<number> = new Array<number>();
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { visited.push(i); return i === 2; });
      expect(visited.length).assertEqual(2);
      expect(visited[0]).assertEqual(3);
      expect(visited[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest063
     * @tc.desc Verify predicate /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sum: number = 0;
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { sum += v; return v === 2; });
      expect(res).assertEqual(2);
      expect(sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest064
     * @tc.desc Verify findLast /
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 3, 7, 1]);
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 7; });
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest065
     * @tc.desc Verify predicate length subarray length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let observedLen: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => { observedLen = a.length; return false; });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(observedLen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest066
     * @tc.desc Verify predicate 1 truthy ECMA ToBoolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let res: number | undefined = undefined;
      let done: boolean = false;
      res = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
        if (!done && i === 2) { done = true; return true; }
        return false;
      });
      expect(res).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest067
     * @tc.desc Verify predicate 0 falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          cnt++;
          return false;
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest068
     * @tc.desc Verify predicate -1 truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let hitIdx: int = -1;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => {
        if (i === 1) { hitIdx = i; return true; }
        return false;
      });
      expect(hitIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest069
     * @tc.desc Verify predicate undefined falsy undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          return false;
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest070
     * @tc.desc Verify predicate '' falsy undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let cnt: int = 0;
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          cnt++;
          return false;
        });
      } catch (e) {
        threw = true;
      }
      expect(threw).assertTrue();
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest071
     * @tc.desc Verify predicate 'x' truthy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let res: number | undefined = undefined;
      let done: boolean = false;
      res = arr.findLast((v: number, i: int, a: Int32Array): boolean => {
        if (!done && i === 1) { done = true; return true; }
        return false;
      });
      expect(res).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest072
     * @tc.desc Verify predicate NaN falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let threw: boolean = false;
      try {
        arr.findLast((v: number, i: int, a: Int32Array): boolean => {
          return Float.NaN as boolean;
        });
      } catch (e) {
        threw = true;
        expect((e as Error).name).assertEqual('ClassCastError');
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest073
     * @tc.desc Verify $_set NaN ToInt32 0 findLast v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let nanVal: number = Float.NaN;
      arr.$_set(0, nanVal);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest074
     * @tc.desc Verify $_set +Infinity ToInt32 0 findLast v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let infVal: number = Number.POSITIVE_INFINITY;
      arr.$_set(0, infVal);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayFindLastPart03TestMindmapTest075
     * @tc.desc Verify $_set Double.NEGATIVE_INFINITY ToInt32 0 findLast v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let ninfVal: number = Float.NEGATIVE_INFINITY;
      arr.$_set(0, ninfVal);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayFindLastPart03TestMindmapTest076
     * @tc.desc Verify $_set 3.7 3 findLast v===3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let fracVal: number = 3.7;
      arr.$_set(0, fracVal);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 3; });
      expect(res).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayFindLastPart03TestMindmapTest077
     * @tc.desc Verify $_set -3.7 -3 findLast v===-3 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let nfracVal: number = -3.7;
      arr.$_set(0, nfracVal);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === -3; });
      expect(res).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayFindLastPart03TestMindmapTest078
     * @tc.desc Verify $_set 0xFFFFFFFF 4294967295 ToInt32 -1 findLast v===-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let wrapVal: number = 0xFFFFFFFF;
      arr.$_set(0, wrapVal);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === -1; });
      expect(res).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayFindLastPart03TestMindmapTest079
     * @tc.desc Verify $_set 4294967296 0x100000000 ToInt32 0 findLast v===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let wrapZero: number = 4294967296;
      arr.$_set(0, wrapZero);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 0; });
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayFindLastPart03TestMindmapTest080
     * @tc.desc Verify predicate array 1 array.length===1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return a.length === 1; });
      expect(res).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArrayFindLastPart03TestMindmapTest081
     * @tc.desc Verify predicate i===0 arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77, 88]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === 0; });
      expect(res).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_8200
     * @tc.name int32ArrayFindLastPart03TestMindmapTest082
     * @tc.desc Verify predicate i===1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77, 88]);
      let res: number = arr.findLast((v: number, i: int, a: Int32Array): boolean => { return i === 1; });
      expect(res).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_8300
     * @tc.name int32ArrayFindLastPart03TestMindmapTest083
     * @tc.desc Verify predicate i===0 cnt=2 i=1 i=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([77, 88]);
      let cnt: int = 0;
      arr.findLast((v: number, i: int, a: Int32Array): boolean => { cnt++; return i === 0; });
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FIND_LAST_PART03_TEST_MINDMAP_8400
     * @tc.name int32ArrayFindLastPart03TestMindmapTest084
     * @tc.desc Verify ArrayBuffer findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFindLastPart03TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let view: Int32Array = new Int32Array(buf, 8, 1);
      view.$_set(0, 123);
      let res: number = view.findLast((v: number, i: int, a: Int32Array): boolean => { return v === 123; });
      expect(res).assertEqual(123);
    });
  });
}
