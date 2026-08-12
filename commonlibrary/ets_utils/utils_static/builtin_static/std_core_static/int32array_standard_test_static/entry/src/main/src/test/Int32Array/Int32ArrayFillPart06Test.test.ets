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
export default function int32ArrayFillPart06TestMindmapTest(): void {
  describe('Int32ArrayFillPart06TestMindmapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0100
     * @tc.name int32ArrayFillPart06TestMindmapTest001
     * @tc.desc Verify small integer literal 4 fills through E overload and reads back equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(4);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0200
     * @tc.name int32ArrayFillPart06TestMindmapTest002
     * @tc.desc Verify INT_MAX literal 2147483647 fills via E overload without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(2147483647);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0300
     * @tc.name int32ArrayFillPart06TestMindmapTest003
     * @tc.desc Verify INT_MIN literal -2147483648 fills via E overload without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      let minVal: int = -2147483648;
      arr.fill(minVal);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0400
     * @tc.name int32ArrayFillPart06TestMindmapTest004
     * @tc.desc Verify zero literal 0 fills all elements to 0 via E overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(9);
      arr.fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0500
     * @tc.name int32ArrayFillPart06TestMindmapTest005
     * @tc.desc Verify -1 literal fills all elements to -1 via E overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let negOne: int = -1;
      arr.fill(negOne);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0600
     * @tc.name int32ArrayFillPart06TestMindmapTest006
     * @tc.desc Verify float 2.6 through number overload truncates toward zero to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(2.6);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0700
     * @tc.name int32ArrayFillPart06TestMindmapTest007
     * @tc.desc Verify Number.NaN via number overload normalizes to 0 by ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(7);
      let nanVal: number = Double.NaN;
      arr.fill(nanVal);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0800
     * @tc.name int32ArrayFillPart06TestMindmapTest008
     * @tc.desc Verify +Number.POSITIVE_INFINITY via number overload normalizes to 0 by ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(7);
      let infVal: number = Double.POSITIVE_INFINITY;
      arr.fill(infVal);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_0900
     * @tc.name int32ArrayFillPart06TestMindmapTest009
     * @tc.desc Verify Double.NEGATIVE_INFINITY via number overload normalizes to 0 by ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(7);
      arr.fill(Double.NEGATIVE_INFINITY);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1000
     * @tc.name int32ArrayFillPart06TestMindmapTest010
     * @tc.desc Verify 2^32 float 4294967296.0 wraps to 0 via number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(11);
      arr.fill(4294967296.0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1100
     * @tc.name int32ArrayFillPart06TestMindmapTest011
     * @tc.desc Verify two arrays filled with identical normalized int 0 produce equal read-back values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let b: Int32Array = new Int32Array(3);
      a.fill(1);
      b.fill(1);
      a.fill(0);
      b.fill(0);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1200
     * @tc.name int32ArrayFillPart06TestMindmapTest012
     * @tc.desc Verify fill with int -1 via variable and via literal produce identical results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let b: Int32Array = new Int32Array(3);
      let negOne: int = -1;
      a.fill(negOne);
      b.fill(-1);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1300
     * @tc.name int32ArrayFillPart06TestMindmapTest013
     * @tc.desc Verify E overload omitting start/end defaults fill the entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(0);
      arr.fill(8);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(8);
      expect(arr.$_get(2)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1400
     * @tc.name int32ArrayFillPart06TestMindmapTest014
     * @tc.desc Verify number overload omitting start/end defaults fill the entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(0);
      arr.fill(8.0);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1500
     * @tc.name int32ArrayFillPart06TestMindmapTest015
     * @tc.desc Verify E overload omitting end defaults end to length, fills from start to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(0);
      arr.fill(6, 2, arr.length);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(4)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1600
     * @tc.name int32ArrayFillPart06TestMindmapTest016
     * @tc.desc Verify number overload omitting end defaults end to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(0);
      arr.fill(6.0, 2, arr.length);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(4)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1700
     * @tc.name int32ArrayFillPart06TestMindmapTest017
     * @tc.desc Verify E overload with explicit start=0 end=length equals default fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let b: Int32Array = new Int32Array(4);
      a.fill(5);
      b.fill(5, 0, 4);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
      expect(a.$_get(3)).assertEqual(b.$_get(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1800
     * @tc.name int32ArrayFillPart06TestMindmapTest018
     * @tc.desc Verify negative start=-2 normalizes to length-2 for both overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let b: Int32Array = new Int32Array(5);
      a.fill(0);
      b.fill(0);
      a.fill(8, -2, a.length);
      b.fill(8.0, -2, b.length);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(8);
      expect(a.$_get(4)).assertEqual(8);
      expect(a.$_get(3)).assertEqual(b.$_get(3));
      expect(a.$_get(4)).assertEqual(b.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_1900
     * @tc.name int32ArrayFillPart06TestMindmapTest019
     * @tc.desc Verify negative end=-1 normalizes to length-1 for both overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(5);
      let b: Int32Array = new Int32Array(5);
      a.fill(0);
      b.fill(0);
      a.fill(6, 1, -1);
      b.fill(6.0, 1, -1);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(6);
      expect(a.$_get(3)).assertEqual(6);
      expect(a.$_get(4)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(4)).assertEqual(b.$_get(4));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2000
     * @tc.name int32ArrayFillPart06TestMindmapTest020
     * @tc.desc Verify E overload default start=0 and end=length both apply when omitted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0);
      arr.fill(42);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(1)).assertEqual(42);
      expect(arr.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2100
     * @tc.name int32ArrayFillPart06TestMindmapTest021
     * @tc.desc Verify number overload default start=0 and end=length both apply
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0);
      arr.fill(42.0);
      expect(arr.$_get(0)).assertEqual(42);
      expect(arr.$_get(2)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2200
     * @tc.name int32ArrayFillPart06TestMindmapTest022
     * @tc.desc Verify E overload fill return value is strictly the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let ret: Int32Array = arr.fill(4);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2300
     * @tc.name int32ArrayFillPart06TestMindmapTest023
     * @tc.desc Verify E overload chained fill calls return the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let r1: Int32Array = arr.fill(1);
      let r2: Int32Array = r1.fill(2, 2, r1.length);
      expect(r1).assertEqual(arr);
      expect(r2).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2400
     * @tc.name int32ArrayFillPart06TestMindmapTest024
     * @tc.desc Verify E overload chained toString returns non-empty string reflecting fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let s: string = arr.fill(5).toString();
      expect(s).assertEqual('5,5,5');
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2500
     * @tc.name int32ArrayFillPart06TestMindmapTest025
     * @tc.desc Verify both overloads produce identical toString after filling same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      let b: Int32Array = new Int32Array(3);
      a.fill(7);
      b.fill(7.0);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2600
     * @tc.name int32ArrayFillPart06TestMindmapTest026
     * @tc.desc Verify E overload fill keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let before: int = arr.length;
      arr.fill(9);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2700
     * @tc.name int32ArrayFillPart06TestMindmapTest027
     * @tc.desc Verify number overload fill keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let before: int = arr.length;
      arr.fill(9.0);
      expect(arr.length).assertEqual(before);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2800
     * @tc.name int32ArrayFillPart06TestMindmapTest028
     * @tc.desc Verify E overload fill keeps byteLength equal to length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(0);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_2900
     * @tc.name int32ArrayFillPart06TestMindmapTest029
     * @tc.desc Verify E overload fill on offset view keeps byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.fill(3);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3000
     * @tc.name int32ArrayFillPart06TestMindmapTest030
     * @tc.desc Verify BYTES_PER_ELEMENT is 4 after E overload fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(1);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
      let b: Int32Array = new Int32Array(2);
      b.fill(1);
      expect(b.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3100
     * @tc.name int32ArrayFillPart06TestMindmapTest031
     * @tc.desc Verify E overload fill then join with separator reflects filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2);
      expect(arr.join(',')).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3200
     * @tc.name int32ArrayFillPart06TestMindmapTest032
     * @tc.desc Verify E overload empty interval start==end is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7);
      arr.fill(99, 2, 2);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3300
     * @tc.name int32ArrayFillPart06TestMindmapTest033
     * @tc.desc Verify number overload empty interval start==end is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7.0);
      arr.fill(99.0, 2, 2);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3400
     * @tc.name int32ArrayFillPart06TestMindmapTest034
     * @tc.desc Verify E overload start>end with positive indices is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7);
      arr.fill(99, 3, 1);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3500
     * @tc.name int32ArrayFillPart06TestMindmapTest035
     * @tc.desc Verify number overload start>end with positive indices is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7.0);
      arr.fill(99.0, 3, 1);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3600
     * @tc.name int32ArrayFillPart06TestMindmapTest036
     * @tc.desc Verify E overload negative start/end resulting in start>=end is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7);
      arr.fill(99, -1, -3);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3700
     * @tc.name int32ArrayFillPart06TestMindmapTest037
     * @tc.desc Verify number overload negative start/end resulting in start>=end is no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(7.0);
      arr.fill(99.0, -1, -3);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3800
     * @tc.name int32ArrayFillPart06TestMindmapTest038
     * @tc.desc Verify E overload fill with normalized int 11 fills correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(11);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(2)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_3900
     * @tc.name int32ArrayFillPart06TestMindmapTest039
     * @tc.desc Verify number overload fill with float 11.0 truncates to 11 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(11.0);
      expect(arr.$_get(0)).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4000
     * @tc.name int32ArrayFillPart06TestMindmapTest040
     * @tc.desc Verify constructing Int32Array with non-4-aligned byteOffset=1 throws RangeError (fill unreachable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      try {
        let bad: Int32Array = new Int32Array(buf, 1, 2);
        bad.fill(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4100
     * @tc.name int32ArrayFillPart06TestMindmapTest041
     * @tc.desc Verify constructing Int32Array with negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let negLen: int = -1;
        let bad: Int32Array = new Int32Array(negLen);
        bad.fill(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4200
     * @tc.name int32ArrayFillPart06TestMindmapTest042
     * @tc.desc Verify after fill success a thrown error does not roll back the fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      try {
        arr.fill(1);
        expect(arr.$_get(0)).assertEqual(1);
        throw new Error('stop');
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4300
     * @tc.name int32ArrayFillPart06TestMindmapTest043
     * @tc.desc Verify after fill and external throw, catch block holds same array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(42);
      let captured: Int32Array | undefined = undefined;
      try {
        expect(arr.$_get(0)).assertEqual(42);
        throw new Error('x');
      } catch (e) {
        captured = arr;
        expect(e.name).assertEqual('Error');
      }
      expect(captured!).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4400
     * @tc.name int32ArrayFillPart06TestMindmapTest044
     * @tc.desc Verify sibling view sees fill writes even when wrapped in try-catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      try {
        a.fill(42);
        expect(a.$_get(0)).assertEqual(42);
        throw new Error('probe');
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(b.$_get(0)).assertEqual(42);
      expect(b.$_get(3)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4500
     * @tc.name int32ArrayFillPart06TestMindmapTest045
     * @tc.desc Verify E overload fill INT_MAX reads back 2147483647 for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(2147483647);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4600
     * @tc.name int32ArrayFillPart06TestMindmapTest046
     * @tc.desc Verify E overload fill INT_MIN reads back -2147483648 for every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let minVal: int = -2147483648;
      arr.fill(minVal);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(-2147483648);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4700
     * @tc.name int32ArrayFillPart06TestMindmapTest047
     * @tc.desc Verify number overload 2147483647.9 truncates toward zero to 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647.9);
      expect(arr.$_get(0)).assertEqual(2147483647);
      expect(arr.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4800
     * @tc.name int32ArrayFillPart06TestMindmapTest048
     * @tc.desc Verify number overload -2147483648.9 truncates toward zero to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-2147483648.9);
      expect(arr.$_get(0)).assertEqual(-2147483648);
      expect(arr.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_4900
     * @tc.name int32ArrayFillPart06TestMindmapTest049
     * @tc.desc Verify E overload fill 0 then $_set rewrites a position, fill does not freeze writability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0);
      arr.$_set(1, 55);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(55);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5000
     * @tc.name int32ArrayFillPart06TestMindmapTest050
     * @tc.desc Verify for-of iteration over filled arrays produces length elements for both overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let b: Int32Array = new Int32Array(4);
      a.fill(6);
      b.fill(6.0);
      let ca: int = 0;
      let cb: int = 0;
      for (const v of a) {
        expect(v).assertEqual(6);
        ca++;
      }
      for (const v of b) {
        expect(v).assertEqual(6);
        cb++;
      }
      expect(ca).assertEqual(4);
      expect(cb).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5100
     * @tc.name int32ArrayFillPart06TestMindmapTest051
     * @tc.desc Verify E overload fill visible in sibling view sharing the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.fill(19);
      expect(b.$_get(0)).assertEqual(19);
      expect(b.$_get(3)).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5200
     * @tc.name int32ArrayFillPart06TestMindmapTest052
     * @tc.desc Verify number overload fill visible in sibling view sharing the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.fill(19.0);
      expect(b.$_get(0)).assertEqual(19);
      expect(b.$_get(3)).assertEqual(19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5300
     * @tc.name int32ArrayFillPart06TestMindmapTest053
     * @tc.desc Verify E overload partial range fill only modifies the corresponding buffer region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.fill(0);
      b.fill(77, 1, 3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(77);
      expect(a.$_get(2)).assertEqual(77);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5400
     * @tc.name int32ArrayFillPart06TestMindmapTest054
     * @tc.desc Verify number overload partial range fill only modifies corresponding buffer bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.fill(0);
      b.fill(77.0, 1, 3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(77);
      expect(a.$_get(2)).assertEqual(77);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5500
     * @tc.name int32ArrayFillPart06TestMindmapTest055
     * @tc.desc Verify E overload fill on byteOffset subview writes at correct parent offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let outer: Int32Array = new Int32Array(buf, 0, 6);
      outer.fill(0);
      let inner: Int32Array = new Int32Array(buf, 8, 3);
      inner.fill(88);
      expect(outer.$_get(0)).assertEqual(0);
      expect(outer.$_get(1)).assertEqual(0);
      expect(outer.$_get(2)).assertEqual(88);
      expect(outer.$_get(4)).assertEqual(88);
      expect(outer.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5600
     * @tc.name int32ArrayFillPart06TestMindmapTest056
     * @tc.desc Verify number overload fill on byteOffset subview writes at correct parent offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let outer: Int32Array = new Int32Array(buf, 0, 6);
      outer.fill(0);
      let inner: Int32Array = new Int32Array(buf, 8, 3);
      inner.fill(88.0);
      expect(outer.$_get(0)).assertEqual(0);
      expect(outer.$_get(2)).assertEqual(88);
      expect(outer.$_get(4)).assertEqual(88);
      expect(outer.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5700
     * @tc.name int32ArrayFillPart06TestMindmapTest057
     * @tc.desc Verify cross-overload fills on same buffer, last write wins for all views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      a.fill(11);
      b.fill(22.0);
      expect(a.$_get(0)).assertEqual(22);
      expect(a.$_get(3)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5800
     * @tc.name int32ArrayFillPart06TestMindmapTest058
     * @tc.desc Verify E overload fill on subarray propagates to parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      parent.fill(0);
      let sub: Int32Array = parent.subarray(2, 5);
      sub.fill(99);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(1)).assertEqual(0);
      expect(parent.$_get(2)).assertEqual(99);
      expect(parent.$_get(4)).assertEqual(99);
      expect(parent.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_5900
     * @tc.name int32ArrayFillPart06TestMindmapTest059
     * @tc.desc Verify number overload fill on subarray propagates to parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(6);
      parent.fill(0);
      let sub: Int32Array = parent.subarray(2, 5);
      sub.fill(99.0);
      expect(parent.$_get(0)).assertEqual(0);
      expect(parent.$_get(2)).assertEqual(99);
      expect(parent.$_get(4)).assertEqual(99);
      expect(parent.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6000
     * @tc.name int32ArrayFillPart06TestMindmapTest060
     * @tc.desc Verify two Int32Arrays from same ArrayBuffer share identical buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 4);
      let b: Int32Array = new Int32Array(buf, 0, 4);
      expect(a.buffer).assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6100
     * @tc.name int32ArrayFillPart06TestMindmapTest061
     * @tc.desc Verify E overload fill does not replace the underlying buffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0, 4);
      let before: ArrayBuffer = arr.buffer;
      arr.fill(3);
      expect(arr.buffer).assertEqual(before);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6200
     * @tc.name int32ArrayFillPart06TestMindmapTest062
     * @tc.desc Verify two new Int32Array(length) create independent buffers that do not interfere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let b: Int32Array = new Int32Array(4);
      a.fill(1);
      b.fill(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(b.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6300
     * @tc.name int32ArrayFillPart06TestMindmapTest063
     * @tc.desc Verify fill returns this, not a clone; chained calls return the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r1: Int32Array = arr.fill(1);
      let r2: Int32Array = r1.fill(2);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6400
     * @tc.name int32ArrayFillPart06TestMindmapTest064
     * @tc.desc Verify consecutive fills with different values overwrite previous fills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(1);
      arr.fill(2);
      arr.fill(3);
      expect(arr.$_get(0)).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(3);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6500
     * @tc.name int32ArrayFillPart06TestMindmapTest065
     * @tc.desc Verify empty Int32Array(0) E overload fill does not throw and returns this with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let ret: Int32Array = arr.fill(5);
      expect(arr.length).assertEqual(0);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6600
     * @tc.name int32ArrayFillPart06TestMindmapTest066
     * @tc.desc Verify slice copy does not share buffer with original and is unaffected by later fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.fill(1);
      let cp: Int32Array = arr.slice();
      arr.fill(2);
      expect(cp.$_get(0)).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6700
     * @tc.name int32ArrayFillPart06TestMindmapTest067
     * @tc.desc Verify number overload 2147483648.0 wraps to -2147483648 observed via DataView little-endian
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 2);
      arr.fill(2147483648.0);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(-2147483648);
      expect(dv.getInt32(4, true)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6800
     * @tc.name int32ArrayFillPart06TestMindmapTest068
     * @tc.desc Verify number overload -0 truncates toward zero to 0 not -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(1);
      arr.fill(-0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_6900
     * @tc.name int32ArrayFillPart06TestMindmapTest069
     * @tc.desc Verify number overload 0 truncates toward zero to 0 not 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(1);
      arr.fill(0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_7000
     * @tc.name int32ArrayFillPart06TestMindmapTest070
     * @tc.desc Verify number overload -1 truncates toward zero to -1 not -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(0);
      arr.fill(-1);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_7100
     * @tc.name int32ArrayFillPart06TestMindmapTest071
     * @tc.desc Verify number overload -0 truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(5);
      arr.fill(-0);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_7200
     * @tc.name int32ArrayFillPart06TestMindmapTest072
     * @tc.desc Verify E overload fill -1 produces all-FF little-endian bytes observed via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 2);
      let negOne: int = -1;
      arr.fill(negOne);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(-1);
      expect(dv.getInt32(4, true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_7300
     * @tc.name int32ArrayFillPart06TestMindmapTest073
     * @tc.desc Verify number overload fill -1 matches E overload byte pattern observed via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 2);
      arr.fill(-1);
      let dv: DataView = new DataView(buf);
      expect(dv.getInt32(0, true)).assertEqual(-1);
      expect(dv.getInt32(4, true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_7400
     * @tc.name int32ArrayFillPart06TestMindmapTest074
     * @tc.desc Verify number overload 1e20 large float does not throw and array length preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(1e20);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FILL_PART06_TEST_MINDMAP_7500
     * @tc.name int32ArrayFillPart06TestMindmapTest075
     * @tc.desc Verify E and number overload produce identical byte sequences for -1 via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFillPart06TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf1: ArrayBuffer = new ArrayBuffer(4);
      let buf2: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf1, 0, 1);
      let b: Int32Array = new Int32Array(buf2, 0, 1);
      let negOne: int = -1;
      a.fill(negOne);
      b.fill(-1);
      let dv1: DataView = new DataView(buf1);
      let dv2: DataView = new DataView(buf2);
      expect(dv1.getInt32(0, true)).assertEqual(dv2.getInt32(0, true));
    });
  });
}
