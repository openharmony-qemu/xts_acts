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

export default function int32ArrayForEachPart01Test(): void {
  describe('Int32ArrayForEachPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayForEachPart01TestMindmapTest001
     * @tc.desc Verify forEach callback is invoked exactly length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6]);
      let seen: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen++;
      });
      expect(seen).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayForEachPart01TestMindmapTest002
     * @tc.desc Verify forEach invokes callback once for single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let seen: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen++;
      });
      expect(seen).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayForEachPart01TestMindmapTest003
     * @tc.desc Verify forEach with empty callback preserves single-element array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10]);
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
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayForEachPart01TestMindmapTest004
     * @tc.desc Verify forEach() 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0);
      let got: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayForEachPart01TestMindmapTest005
     * @tc.desc Verify forEach() 1 value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1);
      let got: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayForEachPart01TestMindmapTest006
     * @tc.desc Verify forEach() -1 value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let got: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayForEachPart01TestMindmapTest007
     * @tc.desc Verify forEach() -2 value -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2);
      let got: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayForEachPart01TestMindmapTest008
     * @tc.desc Verify forEach() INT_MAX=2147483647 value 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let got: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayForEachPart01TestMindmapTest009
     * @tc.desc Verify forEach() INT_MIN=-2147483648 value -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let got: number = Number.NaN;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayForEachPart01TestMindmapTest010
     * @tc.desc Verify forEach() Number.NaN of ToInt32(Number.NaN)=0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nanVal: number = Number.NaN;
      let arr: Int32Array = Int32Array.of(nanVal);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayForEachPart01TestMindmapTest011
     * @tc.desc Verify forEach() +Number.POSITIVE_INFINITY of ToInt32(+Number.POSITIVE_INFINITY)=0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let infVal: number = Number.POSITIVE_INFINITY;
      let arr: Int32Array = Int32Array.of(infVal);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayForEachPart01TestMindmapTest012
     * @tc.desc Verify forEach() -Number.POSITIVE_INFINITY of ToInt32(-Number.POSITIVE_INFINITY)=0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ninfVal: number = -Number.POSITIVE_INFINITY;
      let arr: Int32Array = Int32Array.of(ninfVal);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayForEachPart01TestMindmapTest013
     * @tc.desc Verify forEach() 0.5 of 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0.5);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayForEachPart01TestMindmapTest014
     * @tc.desc Verify forEach() -0.5 of 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0.5);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayForEachPart01TestMindmapTest015
     * @tc.desc Verify forEach() -0.9 of 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-0.9);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayForEachPart01TestMindmapTest016
     * @tc.desc Verify forEach() 2147483647.9 of 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647.9);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayForEachPart01TestMindmapTest017
     * @tc.desc Verify forEach() 1.5 of 1 value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1.5);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayForEachPart01TestMindmapTest018
     * @tc.desc Verify forEach() -1.5 of -1 value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1.5);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayForEachPart01TestMindmapTest019
     * @tc.desc Verify forEach() 2147483648.0(MAX+1) of int32 -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483648.0);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayForEachPart01TestMindmapTest020
     * @tc.desc Verify forEach() 2147483649.0(MAX+2) of -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483649.0);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayForEachPart01TestMindmapTest021
     * @tc.desc Verify forEach() -2147483649.0(MIN-1) of 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483649.0);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayForEachPart01TestMindmapTest022
     * @tc.desc Verify forEach() 4294967295.0(0xFFFFFFFF) of -1 value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967295.0);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayForEachPart01TestMindmapTest023
     * @tc.desc Verify forEach() 4294967296.0(2^32) of 2^32 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967296.0);
      let got: number = 1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayForEachPart01TestMindmapTest024
     * @tc.desc Verify forEach() 4294967297.0(2^32+1) of 1 value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(4294967297.0);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayForEachPart01TestMindmapTest025
     * @tc.desc Verify forEach() 0,-1,1,INT_MAX,INT_MIN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -1, 1, 2147483647, -2147483648);
      let collected: number[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        collected.push(v);
      });
      expect(collected.length).assertEqual(5);
      expect(collected[0]).assertEqual(0);
      expect(collected[1]).assertEqual(-1);
      expect(collected[2]).assertEqual(1);
      expect(collected[3]).assertEqual(2147483647);
      expect(collected[4]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayForEachPart01TestMindmapTest026
     * @tc.desc Verify forEach() 0 value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let allZero: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== 0) {
          allZero = false;
        }
      });
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayForEachPart01TestMindmapTest027
     * @tc.desc Verify forEach() -1 -1 value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let allNeg1: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== -1) {
          allNeg1 = false;
        }
      });
      expect(allNeg1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayForEachPart01TestMindmapTest028
     * @tc.desc Verify forEach() [1,-1,2,-2] value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [1, -1, 2, -2];
      let arr: Int32Array = new Int32Array(src);
      let idx: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        expect(v).assertEqual(src[idx]);
        idx++;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayForEachPart01TestMindmapTest029
     * @tc.desc Verify forEach() 0b1010(10) value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0b1010);
      let got: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        got = v;
      });
      expect(got).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayForEachPart01TestMindmapTest030
     * @tc.desc Verify Int32Array.of forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayForEachPart01TestMindmapTest031
     * @tc.desc Verify Int32Array.from(int[]) forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [5, 15, 25];
      let arr: Int32Array = Int32Array.from(src);
      let got0: number = 0;
      let got1: number = 0;
      let got2: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          got0 = v;
        } else if (i === 1) {
          got1 = v;
        } else if (i === 2) {
          got2 = v;
        }
      });
      expect(got0).assertEqual(5);
      expect(got1).assertEqual(15);
      expect(got2).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayForEachPart01TestMindmapTest032
     * @tc.desc Verify new Int32Array(int[]) forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [7, 14];
      let arr: Int32Array = new Int32Array(src);
      let got0: number = 0;
      let got1: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          got0 = v;
        } else {
          got1 = v;
        }
      });
      expect(got0).assertEqual(7);
      expect(got1).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayForEachPart01TestMindmapTest033
     * @tc.desc Verify ArrayBuffer (buf,0,length) forEach value int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf, 0, 2);
      view.$_set(0, 100);
      view.$_set(1, 200);
      let got0: number = 0;
      let got1: number = 0;
      view.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          got0 = v;
        } else {
          got1 = v;
        }
      });
      expect(got0).assertEqual(100);
      expect(got1).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayForEachPart01TestMindmapTest034
     * @tc.desc Verify subarray(1,3) forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let sub: Int32Array = parent.subarray(1, 3);
      let got: number[] = [];
      sub.forEach((v: number, i: int, a: Int32Array): void => {
        got.push(v);
      });
      expect(got.length).assertEqual(2);
      expect(got[0]).assertEqual(20);
      expect(got[1]).assertEqual(30);
      {
        let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
        let sub: Int32Array = parent.subarray(1, 3);
        let order: int[] = [];
        sub.forEach((v: number, i: int, a: Int32Array): void => {
          order.push(i);
        });
        expect(order.length).assertEqual(2);
        expect(order[0]).assertEqual(0);
        expect(order[1]).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayForEachPart01TestMindmapTest035
     * @tc.desc Verify byteOffset=4 forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 111);
      base.$_set(1, 222);
      base.$_set(2, 333);
      base.$_set(3, 444);
      let shifted: Int32Array = new Int32Array(buf, 4, 2);
      let first: number = 0;
      shifted.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          first = v;
        }
      });
      expect(first).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayForEachPart01TestMindmapTest036
     * @tc.desc Verify forEach on Int32Array copy from constructor sums elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([9, 99]);
      let dst: Int32Array = new Int32Array(src);
      let sum: number = 0;
      dst.forEach((v: number, i: int, a: Int32Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(108);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayForEachPart01TestMindmapTest037
     * @tc.desc Verify slice forEach value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(3, 6, 9);
      let cp: Int32Array = src.slice(0);
      let ok: boolean = true;
      cp.forEach((v: number, i: int, a: Int32Array): void => {
        if (v !== src.$_get(i)) {
          ok = false;
        }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayForEachPart01TestMindmapTest038
     * @tc.desc Verify forEach() length=1 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(77);
      let gotIdx: int = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        gotIdx = i;
      });
      expect(gotIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayForEachPart01TestMindmapTest039
     * @tc.desc Verify forEach() length=2 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20);
      let firstIdx: int = -1;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (firstIdx === -1) {
          firstIdx = i;
        }
      });
      expect(firstIdx).assertEqual(0);
      {
        let arr: Int32Array = Int32Array.of(10, 20);
        let lastIdx: int = -1;
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          lastIdx = i;
        });
        expect(lastIdx).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayForEachPart01TestMindmapTest040
     * @tc.desc Verify forEach() length=3 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let firstIdx: int = 99;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (firstIdx === 99) {
          firstIdx = i;
        }
      });
      expect(firstIdx).assertEqual(0);
      {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let lastIdx: int = -1;
        arr.forEach((v: number, i: int, a: Int32Array): void => {
          lastIdx = i;
        });
        expect(lastIdx).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayForEachPart01TestMindmapTest041
     * @tc.desc Verify forEach() 4 index 0,1,2,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let order: int[] = [];
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        order.push(i);
      });
      expect(order[0]).assertEqual(0);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(2);
      expect(order[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayForEachPart01TestMindmapTest042
     * @tc.desc Verify forEach() ArrayBuffer byteOffset=8 index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let v: Int32Array = new Int32Array(buf, 8, 2);
      let firstIdx: int = -1;
      v.forEach((val: number, i: int, a: Int32Array): void => {
        if (firstIdx < 0) {
          firstIdx = i;
        }
      });
      expect(firstIdx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayForEachPart01TestMindmapTest043
     * @tc.desc Verify forEach() index i>=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayForEachPart01TestMindmapTest044
     * @tc.desc Verify forEach() array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6, 7]);
      let reportedLen: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        reportedLen = a.length;
      });
      expect(reportedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayForEachPart01TestMindmapTest045
     * @tc.desc Verify forEach() array.$_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 43]);
      let peeked: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (i === 0) {
          peeked = a.$_get(0);
        }
      });
      expect(peeked).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayForEachPart01TestMindmapTest046
     * @tc.desc Verify subarray forEach array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = parent.subarray(1, 3);
      let gotLen: int = 0;
      let isSub: boolean = true;
      sub.forEach((v: number, i: int, a: Int32Array): void => {
        gotLen = a.length;
        if (a !== sub) {
          isSub = false;
        }
      });
      expect(gotLen).assertEqual(2);
      expect(isSub).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayForEachPart01TestMindmapTest047
     * @tc.desc Verify forEach() array.$_get(i) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let consistent: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.$_get(i) !== v) {
          consistent = false;
        }
      });
      expect(consistent).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayForEachPart01TestMindmapTest048
     * @tc.desc Verify forEach() array.byteLength length*4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let ok: boolean = true;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        if (a.byteLength !== a.length * 4) {
          ok = false;
        }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayForEachPart01TestMindmapTest049
     * @tc.desc Verify forEach() ArrayBuffer array ===
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let v: Int32Array = new Int32Array(buf, 0, 4);
      let ok: boolean = true;
      v.forEach((val: number, i: int, a: Int32Array): void => {
        if (a !== v) {
          ok = false;
        }
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayForEachPart01TestMindmapTest050
     * @tc.desc Verify forEach returns undefined after visiting both elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5]);
      let cnt: int = 0;
      let result: void = arr.forEach((v: number, i: int, a: Int32Array): void => {
        cnt++;
        return;
      });
      expect(result).assertUndefined();
      expect(cnt).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayForEachPart01TestMindmapTest051
     * @tc.desc Verify forEach with only value parameter sums all elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6]);
      let sum: number = 0;
      arr.forEach((v: number): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayForEachPart01TestMindmapTest052
     * @tc.desc Verify v,i a forEach i length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let lastIdx: int = -1;
      arr.forEach((v: number, i: int): void => {
        lastIdx = i;
      });
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayForEachPart01TestMindmapTest053
     * @tc.desc Verify forEach() noop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
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
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayForEachPart01TestMindmapTest054
     * @tc.desc Verify two consecutive forEach calls each iterate all three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let first: int = 0;
      let second: int = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        first++;
      });
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        second++;
      });
      expect(first).assertEqual(3);
      expect(second).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayForEachPart01TestMindmapTest055
     * @tc.desc Verify forEach on two independent Int32Array instances sums correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1: Int32Array = new Int32Array([1, 2]);
      let a2: Int32Array = new Int32Array([10, 20, 30]);
      let s1: number = 0;
      let s2: number = 0;
      a1.forEach((v: number, i: int, a: Int32Array): void => {
        s1 = s1 + v;
      });
      a2.forEach((v: number, i: int, a: Int32Array): void => {
        s2 = s2 + v;
      });
      expect(s1).assertEqual(3);
      expect(s2).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayForEachPart01TestMindmapTest056
     * @tc.desc Verify forEach() factor=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let factor: number = 2;
      let sum: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        sum = sum + v * factor;
      });
      expect(sum).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayForEachPart01TestMindmapTest057
     * @tc.desc Verify forEach() sum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let total: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        total = total + v;
      });
      expect(total).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FOR_EACH_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayForEachPart01TestMindmapTest058
     * @tc.desc Verify forEach() preserves INT32_MAX-1 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayForEachPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483646);
      let seen: number = 0;
      arr.forEach((v: number, i: int, a: Int32Array): void => {
        seen = v;
      });
      expect(seen).assertEqual(2147483646);
    });


  });
}
