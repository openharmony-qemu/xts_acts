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

export default function int32ArrayMapPart01Test(): void {
  describe('Int32ArrayMapPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayMapPart01TestMindmapTest001
     * @tc.desc Verify map rejects an undefined callback with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([13, 27]);
      try {
        arr.map(undefined as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayMapPart01TestMindmapTest002
     * @tc.desc Verify map invokes the callback once for each of three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 6, 9]);
      let calls: int = 0;
      arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return _v;
      });
      expect(calls).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayMapPart01TestMindmapTest003
     * @tc.desc Verify map returns each element plus 777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 8]);
      let calls: int = 0;
      let mapped: Int32Array = arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return _v + 777;
      });
      expect(calls).assertEqual(2);
      expect(mapped.$_get(0)).assertEqual(781);
      expect(mapped.$_get(1)).assertEqual(785);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayMapPart01TestMindmapTest004
     * @tc.desc Verify mapping null converts each result to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 11]);
      let calls: int = 0;
      let mapped: Int32Array = arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return Number(null);
      });
      expect(mapped.$_get(0)).assertEqual(0);
      expect(mapped.$_get(1)).assertEqual(0);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayMapPart01TestMindmapTest005
     * @tc.desc Verify mapping undefined converts each result to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([6, 12]);
      let calls: int = 0;
      let mapped: Int32Array = arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return Number(undefined);
      });
      expect(mapped.$_get(0)).assertEqual(0);
      expect(mapped.$_get(1)).assertEqual(0);
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayMapPart01TestMindmapTest006
     * @tc.desc Verify mapping a false condition returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let calls: int = 0;
      let mapped: Int32Array = arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return false ? 1 : 0;
      });
      expect(calls).assertEqual(1);
      expect(mapped.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayMapPart01TestMindmapTest007
     * @tc.desc Verify mapping every element to six produces three sixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let calls: int = 0;
      let mapped: Int32Array = arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return 6;
      });
      expect(calls).assertEqual(3);
      expect(mapped.$_get(0)).assertEqual(6);
      expect(mapped.$_get(1)).assertEqual(6);
      expect(mapped.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayMapPart01TestMindmapTest008
     * @tc.desc Verify map preserves a single source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Int32Array = new Int32Array([99]);
      let calls: int = 0;
      let mapped: Int32Array = source.map((_v: number, _i: int, _arr: Int32Array): number => {
        calls++;
        return _v;
      });
      expect(calls).assertEqual(1);
      expect(mapped.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayMapPart01TestMindmapTest009
     * @tc.desc Verify fn 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      try {
        arr.map(0 as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayMapPart01TestMindmapTest010
     * @tc.desc Verify fn 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      try {
        arr.map(1 as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayMapPart01TestMindmapTest011
     * @tc.desc Verify fn true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      try {
        arr.map(true as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayMapPart01TestMindmapTest012
     * @tc.desc Verify fn false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      try {
        arr.map(false as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayMapPart01TestMindmapTest013
     * @tc.desc Verify fn "fn"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      try {
        arr.map('fn' as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayMapPart01TestMindmapTest014
     * @tc.desc Verify fn Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      let other: Int32Array = new Int32Array([1]);
      try {
        arr.map(other as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayMapPart01TestMindmapTest015
     * @tc.desc Verify fn ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        arr.map(buf as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayMapPart01TestMindmapTest016
     * @tc.desc Verify fn Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      let obj: Object = new Object();
      try {
        arr.map(obj as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayMapPart01TestMindmapTest017
     * @tc.desc Verify fn number[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      let nums: number[] = [1.0, 2.0, 3.0];
      try {
        arr.map(nums as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayMapPart01TestMindmapTest018
     * @tc.desc Verify fn int[]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
      let ints: int[] = [7, 8];
      try {
        arr.map(ints as Object as (v: number, i: int, a: Int32Array) => number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayMapPart01TestMindmapTest019
     * @tc.desc Verify 0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let got: number = Number.NaN;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayMapPart01TestMindmapTest020
     * @tc.desc Verify -1 val -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let got: number = Number.NaN;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayMapPart01TestMindmapTest021
     * @tc.desc Verify 7 val 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayMapPart01TestMindmapTest022
     * @tc.desc Verify -13 val -13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-13);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayMapPart01TestMindmapTest023
     * @tc.desc Verify INT_MAX=2147483647 val 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayMapPart01TestMindmapTest024
     * @tc.desc Verify INT_MIN=-2147483648 val -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayMapPart01TestMindmapTest025
     * @tc.desc Verify NaN of ToInt32(NaN)=0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: number = Number.NaN;
      let arr: Int32Array = Int32Array.of(nanVal);
      let got: number = 1;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayMapPart01TestMindmapTest026
     * @tc.desc Verify +Infinity of ToInt32(+Infinity)=0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: number = Number.POSITIVE_INFINITY;
      let arr: Int32Array = Int32Array.of(infVal);
      let got: number = 1;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayMapPart01TestMindmapTest027
     * @tc.desc Verify -Infinity of ToInt32(-Infinity)=0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ninfVal: number = -Number.POSITIVE_INFINITY;
      let arr: Int32Array = Int32Array.of(ninfVal);
      let got: number = 1;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayMapPart01TestMindmapTest028
     * @tc.desc Verify 0.3 of 0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0.3);
      let got: number = 1;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayMapPart01TestMindmapTest029
     * @tc.desc Verify -0.7 of 0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0.7);
      let got: number = 1;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayMapPart01TestMindmapTest030
     * @tc.desc Verify 1.3 of 1 val 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1.3);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayMapPart01TestMindmapTest031
     * @tc.desc Verify -1.7 of -1 val -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1.7);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayMapPart01TestMindmapTest032
     * @tc.desc Verify 2147483647.5 of 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647.5);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayMapPart01TestMindmapTest033
     * @tc.desc Verify -2147483647.9 of -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483647.9);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayMapPart01TestMindmapTest034
     * @tc.desc Verify 2147483648.0(MAX+1) of int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483648.0);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayMapPart01TestMindmapTest035
     * @tc.desc Verify 2147483649.0(MAX+2) of -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483649.0);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayMapPart01TestMindmapTest036
     * @tc.desc Verify -2147483649.0(MIN-1) of 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483649.0);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayMapPart01TestMindmapTest037
     * @tc.desc Verify 4294967295.0(0xFFFFFFFF) of -1 val -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967295.0);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayMapPart01TestMindmapTest038
     * @tc.desc Verify 4294967296.0(2^32) of 2^32 0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967296.0);
      let got: number = 1;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayMapPart01TestMindmapTest039
     * @tc.desc Verify 4294967297.0(2^32+1) of 1 val 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967297.0);
      let got: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => v);
      got = mapped.$_get(mapped.length - 1);
      expect(got).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayMapPart01TestMindmapTest040
     * @tc.desc Verify 0,-1,1,INT_MAX,INT_MIN val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 1, 2147483647, -2147483648);
      let collected: number[] = [];
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => {
        collected.push(v);
        return v;
      });
      expect(mapped.length).assertEqual(arr.length);
      expect(collected.length).assertEqual(5);
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(-1);
      expect(collected[2]).assertEqual(1);
      expect(collected[3]).assertEqual(2147483647);
      expect(collected[4]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayMapPart01TestMindmapTest041
     * @tc.desc Verify 0 val 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let allZero: boolean = true;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => {
        if (v !== 0) {
          allZero = false;
        }
        return v;
      });
      expect(allZero).assertTrue();
      expect(mapped.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayMapPart01TestMindmapTest042
     * @tc.desc Verify -1 val -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1, -1]);
      let allNeg1: boolean = true;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => {
        if (v !== -1) {
          allNeg1 = false;
        }
        return v;
      });
      expect(allNeg1).assertTrue();
      expect(mapped.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayMapPart01TestMindmapTest043
     * @tc.desc Verify [3,-3,7,-7] val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [3, -3, 7, -7];
      let arr: Int32Array = new Int32Array(src);
      let idx: int = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => {
        expect(v).assertEqual(src.$_get(idx));
        idx++;
        return v;
      });
      expect(mapped.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayMapPart01TestMindmapTest044
     * @tc.desc Verify Int32Array.of map val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22, 33);
      let sum: number = 0;
      let mapped: Int32Array = arr.map((v: number, _i: int, _arr: Int32Array): number => {
        sum = sum + v;
        return v;
      });
      expect(sum).assertEqual(66);
      expect(mapped.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayMapPart01TestMindmapTest045
     * @tc.desc Verify Int32Array.from(int[]) map val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [4, 16, 64];
      let arr: Int32Array = Int32Array.from(src);
      let g0: number = 0;
      let g1: number = 0;
      let g2: number = 0;
      let mapped: Int32Array = arr.map((v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          g0 = v;
        } else if (i === 1) {
          g1 = v;
        } else if (i === 2) {
          g2 = v;
        }
        return v;
      });
      expect(g0).assertEqual(4);
      expect(g1).assertEqual(16);
      expect(g2).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayMapPart01TestMindmapTest046
     * @tc.desc Verify new Int32Array(int[]) map val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [9, 18];
      let arr: Int32Array = new Int32Array(src);
      let g0: number = 0;
      let g1: number = 0;
      let mapped: Int32Array = arr.map((v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          g0 = v;
        } else {
          g1 = v;
        }
        return v;
      });
      expect(g0).assertEqual(9);
      expect(g1).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayMapPart01TestMindmapTest047
     * @tc.desc Verify ArrayBuffer (buf,0,length) map val int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0, 2);
      view.$_set(0, 300);
      view.$_set(1, 500);
      let g0: number = 0;
      let g1: number = 0;
      let mapped: Int32Array = view.map((v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          g0 = v;
        } else {
          g1 = v;
        }
        return v;
      });
      expect(g0).assertEqual(300);
      expect(g1).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayMapPart01TestMindmapTest048
     * @tc.desc Verify subarray(1,3) map val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([11, 22, 33, 44]);
      let sub: Int32Array = parent.subarray(1, 3);
      let got: number[] = [];
      let gotLen: int = 0;
      let isSub: boolean = false;
      let callbackCount: int = 0;
      let mapped: Int32Array = sub.map((v: number, _i: int, a: Int32Array): number => {
        got.push(v);
        gotLen = a.length;
        isSub = (a === sub);
        callbackCount++;
        return v;
      });
      expect(got.length).assertEqual(2);
      expect(mapped.length).assertEqual(2);
      expect(got.$_get(0)).assertEqual(22);
      expect(got.$_get(1)).assertEqual(33);
      expect(gotLen).assertEqual(2);
      expect(isSub).assertTrue();
      expect(callbackCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayMapPart01TestMindmapTest049
     * @tc.desc Verify byteOffset=4 map val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 111);
      base.$_set(1, 222);
      base.$_set(2, 333);
      base.$_set(3, 444);
      let shifted: Int32Array = new Int32Array(buf, 4, 2);
      let first: number = 0;
      let mapped: Int32Array = shifted.map((v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          first = v;
        }
        return v;
      });
      expect(first).assertEqual(222);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayMapPart01TestMindmapTest050
     * @tc.desc Verify Int32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([12, 24]);
      let dst: Int32Array = new Int32Array(src);
      let sum: number = 0;
      let mapped: Int32Array = dst.map((v: number, _i: int, _arr: Int32Array): number => {
        sum = sum + v;
        return v;
      });
      expect(sum).assertEqual(36);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayMapPart01TestMindmapTest051
     * @tc.desc Verify slice map val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(2, 4, 8);
      let cp: Int32Array = src.slice(0);
      let ok: boolean = true;
      let mapped: Int32Array = cp.map((v: number, i: int, _arr: Int32Array): number => {
        if (v !== src.$_get(i)) {
          ok = false;
        }
        return v;
      });
      expect(ok).assertTrue();
      expect(mapped.length).assertEqual(cp.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayMapPart01TestMindmapTest052
     * @tc.desc Verify new Int32Array(length) set map val set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 777);
      arr.$_set(1, 888);
      let g0: number = 0;
      let g1: number = 0;
      let mapped: Int32Array = arr.map((v: number, i: int, _arr: Int32Array): number => {
        if (i === 0) {
          g0 = v;
        } else {
          g1 = v;
        }
        return v;
      });
      expect(g0).assertEqual(777);
      expect(g1).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayMapPart01TestMindmapTest053
     * @tc.desc Verify length=2 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 18);
      let firstIdx: int = -1;
      arr.map((_v: number, i: int, _arr: Int32Array): number => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
        return _v;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayMapPart01TestMindmapTest054
     * @tc.desc Verify length=2 index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9, 18);
      let lastIdx: int = -1;
      arr.map((_v: number, i: int, _arr: Int32Array): number => {
        lastIdx = i;
        return _v;
      });
      expect(lastIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayMapPart01TestMindmapTest055
     * @tc.desc Verify length=5 index 0,1,2,3,4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let order: number[] = [];
      arr.map((_v: number, i: int, _arr: Int32Array): number => {
        order.push(i);
        return _v;
      });
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
      expect(order[3]).assertEqual(3);
      expect(order[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayMapPart01TestMindmapTest056
     * @tc.desc Verify subarray index 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = parent.subarray(2, 4);
      let order: number[] = [];
      sub.map((_v: number, i: int, _arr: Int32Array): number => {
        order.push(i);
        return _v;
      });
      expect(order.length).assertEqual(2);
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayMapPart01TestMindmapTest057
     * @tc.desc Verify ArrayBuffer byteOffset=8 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let v: Int32Array = new Int32Array(buf, 8, 3);
      let firstIdx: int = -1;
      v.map((_v: number, i: int, _arr: Int32Array): number => {
        if (firstIdx < 0) {
          firstIdx = i;
        }
        return _v;
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayMapPart01TestMindmapTest058
     * @tc.desc Verify index i>=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let minIdx: int = 999;
      let maxIdx: int = -1;
      let count: int = 0;
      arr.map((_v: number, i: int, _arr: Int32Array): number => {
        if (i < minIdx) {
          minIdx = i;
        }
        if (i > maxIdx) {
          maxIdx = i;
        }
        count++;
        return _v;
      });
      expect(minIdx).assertEqual(0);
      expect(maxIdx).assertEqual(4);
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayMapPart01TestMindmapTest059
     * @tc.desc Verify array map ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let callbackCount: int = 0;
      let same: boolean = false;
      arr.map((v: number, i: int, a: Int32Array): number => {
        same = (a === arr);
        callbackCount++;
        return v;
      });
      expect(same).assertTrue();
      expect(callbackCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayMapPart01TestMindmapTest060
     * @tc.desc Verify array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6, 7, 8]);
      let reportedLen: int = 0;
      arr.map((v: number, i: int, a: Int32Array): number => {
        reportedLen = a.length;
        return v;
      });
      expect(reportedLen).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayMapPart01TestMindmapTest061
     * @tc.desc Verify array.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([51, 52]);
      let peeked: number = 0;
      arr.map((v: number, i: int, a: Int32Array): number => {
        if (i === 0) {
          peeked = a.$_get(0);
        }
        return v;
      });
      expect(peeked).assertEqual(51);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayMapPart01TestMindmapTest062
     * @tc.desc Verify array.$_get(i) val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let mismatchCount: int = 0;
      let callbackCount: int = 0;
      arr.map((v: number, i: int, a: Int32Array): number => {
        if (a.$_get(i) !== v) {
          mismatchCount++;
        }
        callbackCount++;
        return v;
      });
      expect(mismatchCount).assertEqual(0);
      expect(callbackCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayMapPart01TestMindmapTest063
     * @tc.desc Verify array.byteLength length*4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let ok: boolean = false;
      arr.map((v: number, i: int, a: Int32Array): number => {
        ok = (a.byteLength === a.length * 4);
        return v;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayMapPart01TestMindmapTest064
     * @tc.desc Verify ArrayBuffer array ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let v: Int32Array = new Int32Array(buf, 0, 4);
      let ok: boolean = false;
      v.map((val: number, i: int, a: Int32Array): number => {
        ok = (a === v);
        return val;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayMapPart01TestMindmapTest065
     * @tc.desc Verify Int32Array.of array.BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      let bpe: int = 0;
      arr.map((v: number, i: int, a: Int32Array): number => {
        bpe = a.BYTES_PER_ELEMENT;
        return v;
      });
      expect(bpe).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayMapPart01TestMindmapTest066
     * @tc.desc Verify factor=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let factor: number = 3;
      let weighted: number = 0;
      arr.map((v: number, i: int, a: Int32Array): number => {
        weighted = weighted + v * factor;
        return v;
      });
      expect(weighted).assertEqual(180);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayMapPart01TestMindmapTest067
     * @tc.desc Verify map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let c1: int = 0;
      let c2: int = 0;
      arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        c1++;
        return _v;
      });
      arr.map((_v: number, _i: int, _arr: Int32Array): number => {
        c2++;
        return _v;
      });
      expect(c1).assertEqual(3);
      expect(c2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayMapPart01TestMindmapTest068
     * @tc.desc Verify Int32Array map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2, 3]);
      let a2: Int32Array = new Int32Array([10, 20]);
      let s1: number = 0;
      let s2: number = 0;
      a1.map((v: number, _i: int, _arr: Int32Array): number => {
        s1 = s1 + v;
        return v;
      });
      a2.map((v: number, _i: int, _arr: Int32Array): number => {
        s2 = s2 + v;
        return v;
      });
      expect(s1).assertEqual(6);
      expect(s2).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_MAP_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayMapPart01TestMindmapTest069
     * @tc.desc Verify val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayMapPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 0, 5]);
      let seenIdx: boolean[] = [false, false, false];
      arr.map((v: number, i: int, a: Int32Array): number => {
        seenIdx[i] = true;
        return v;
      });
      expect(seenIdx[0]).assertTrue();
      expect(seenIdx[1]).assertTrue();
      expect(seenIdx[2]).assertTrue();
    });

  });
}
