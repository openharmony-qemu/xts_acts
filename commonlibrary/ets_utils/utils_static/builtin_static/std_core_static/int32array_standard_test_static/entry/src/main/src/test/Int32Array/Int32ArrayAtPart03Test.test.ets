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
export default function int32ArrayAtPart03TestMindmapTestTest(): void {
  describe('Int32ArrayAtPart03TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayAtPart03TestMindmapTest001
     * @tc.desc Verify at(2) length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22);
      expect(arr.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayAtPart03TestMindmapTest002
     * @tc.desc Verify at(-3) -(length+1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(11, 22);
      expect(arr.at(-3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayAtPart03TestMindmapTest003
     * @tc.desc Verify at(3) 1 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, -6);
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayAtPart03TestMindmapTest004
     * @tc.desc Verify at(-4) 2 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-5, -6);
      expect(arr.at(-4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayAtPart03TestMindmapTest005
     * @tc.desc Verify positive and negative out-of-bounds indices on a six-element buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf);
      expect(arr.at(6)).assertEqual(undefined);
      expect(arr.at(-7)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayAtPart03TestMindmapTest006
     * @tc.desc Verify at(5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let r = arr.at(5);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayAtPart03TestMindmapTest007
     * @tc.desc Verify at(-6) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let r = arr.at(-6);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayAtPart03TestMindmapTest008
     * @tc.desc Verify representative out-of-bounds indices on an empty Int32Array.of result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of();
      expect(arr.at(0)).assertEqual(undefined);
      expect(arr.at(-1)).assertEqual(undefined);
      expect(arr.at(2147483647)).assertEqual(undefined);
      expect(arr.at(-2147483648)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayAtPart03TestMindmapTest009
     * @tc.desc Verify from FixedArray at(3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([4, 5, 6] as number[]);
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayAtPart03TestMindmapTest010
     * @tc.desc Verify from FixedArray at(-2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([99] as number[]);
      expect(arr.at(-2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayAtPart03TestMindmapTest011
     * @tc.desc Verify from Int32Array at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      let dst: Int32Array = Int32Array.from(src);
      expect(dst.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayAtPart03TestMindmapTest012
     * @tc.desc Verify from at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.from([] as number[]);
      expect(arr.at(0)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayAtPart03TestMindmapTest013
     * @tc.desc Verify positive and negative out-of-bounds indices on a two-element subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let child = parent.subarray(1, 3);
      expect(child.at(2)).assertEqual(undefined);
      expect(child.at(-3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayAtPart03TestMindmapTest014
     * @tc.desc Verify subarray at(0) 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      let child = parent.subarray(1, 3);
      let r = child.at(0);
      expect(r).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayAtPart03TestMindmapTest015
     * @tc.desc Verify representative out-of-bounds indices on an empty subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(1, 2, 3);
      let child = parent.subarray(0, 0);
      expect(child.at(0)).assertEqual(undefined);
      expect(child.at(-1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayAtPart03TestMindmapTest016
     * @tc.desc Verify subarray at(1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40);
      let child = parent.subarray(3);
      expect(child.at(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayAtPart03TestMindmapTest017
     * @tc.desc Verify subarray at(0) 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = Int32Array.of(10, 20, 30, 40);
      let child = parent.subarray(3);
      let r = child.at(0);
      expect(r).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayAtPart03TestMindmapTest018
     * @tc.desc Verify subarray subarray subarray at(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      let mid = base.subarray(1, 5);
      let leaf = mid.subarray(1, 3);
      expect(leaf.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayAtPart03TestMindmapTest019
     * @tc.desc Verify positive and negative out-of-bounds indices on a one-element buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 4, 1);
      expect(arr.at(1)).assertEqual(undefined);
      expect(arr.at(-2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayAtPart03TestMindmapTest020
     * @tc.desc Verify byteOffset=8 2 at(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      let r = arr.at(0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayAtPart03TestMindmapTest021
     * @tc.desc Verify byteOffset=8 2 at(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 8, 2);
      expect(arr.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayAtPart03TestMindmapTest022
     * @tc.desc Verify byteOffset=12 1 at(-1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 12, 1);
      let r = arr.at(-1);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayAtPart03TestMindmapTest023
     * @tc.desc Verify byteOffset 4 length 0 at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 0);
      expect(arr.at(0)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayAtPart03TestMindmapTest024
     * @tc.desc Verify shared buffer view at(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let longVal: Int32Array = new Int32Array(buf, 0, 4);
      let sh: Int32Array = new Int32Array(buf, 0, 2);
      longVal[2] = 333;
      expect(sh.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayAtPart03TestMindmapTest025
     * @tc.desc Verify at(viewLen) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      let partial: Int32Array = new Int32Array(buf, 0, 2);
      expect(partial.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayAtPart03TestMindmapTest026
     * @tc.desc Verify shared buffer child at(0) 777, at(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let parent: Int32Array = new Int32Array(buf, 0, 4);
      let child: Int32Array = new Int32Array(buf, 4, 2);
      parent.$_set(1, 777);
      let r0 = child.at(0);
      expect(r0).assertEqual(777);
      expect(child.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayAtPart03TestMindmapTest027
     * @tc.desc Verify shared buffer child at(0) 111, at(3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let p: Int32Array = new Int32Array(buf, 0, 6);
      let c: Int32Array = new Int32Array(buf, 8, 3);
      p.$_set(2, 111);
      p.$_set(3, 222);
      p.$_set(4, 333);
      expect(c.at(0)).assertEqual(111);
      expect(c.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayAtPart03TestMindmapTest028
     * @tc.desc Verify fill at(5) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(9, 1, 4);
      expect(arr.at(5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayAtPart03TestMindmapTest029
     * @tc.desc Verify fill at(0) 0, at(5) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(9, 1, 4);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayAtPart03TestMindmapTest030
     * @tc.desc Verify set at(5) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      let src: Int32Array = Int32Array.of(1, 2);
      arr.set(src, 0);
      expect(arr.at(5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayAtPart03TestMindmapTest031
     * @tc.desc Verify set at(length) out-of-bounds undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(6);
      let src: Int32Array = Int32Array.of(10, 20, 30);
      arr.set(src, 2);
      expect(arr.at(6)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayAtPart03TestMindmapTest032
     * @tc.desc Verify copyWithin at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      arr.copyWithin(2, 0, 2);
      expect(arr.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayAtPart03TestMindmapTest033
     * @tc.desc Verify sort at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 2);
      arr.sort();
      expect(arr.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayAtPart03TestMindmapTest034
     * @tc.desc Verify sort at(0) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(3, 1, 4, 2);
      arr.sort();
      let r = arr.at(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayAtPart03TestMindmapTest035
     * @tc.desc Verify reverse at(0) 40, at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      arr.reverse();
      expect(arr.at(0)).assertEqual(40);
      expect(arr.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayAtPart03TestMindmapTest036
     * @tc.desc Verify $_set at(length) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      try {
        arr.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayAtPart03TestMindmapTest037
     * @tc.desc Verify $_set at(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      try {
        arr.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayAtPart03TestMindmapTest038
     * @tc.desc Verify $_set then at(1) returns 555
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(1, 555);
      let r = arr.at(1);
      expect(r).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayAtPart03TestMindmapTest039
     * @tc.desc Verify $_set INT_MAX at(0) 2147483647, at(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, 2147483647);
      let r = arr.at(0);
      expect(r).assertEqual(2147483647);
      expect(arr.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayAtPart03TestMindmapTest040
     * @tc.desc Verify $_set INT_MIN at(1) -2147483648, at(-3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(1, -2147483648);
      let r = arr.at(1);
      expect(r).assertEqual(-2147483648);
      expect(arr.at(-3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayAtPart03TestMindmapTest041
     * @tc.desc Verify at(0) returns -2147483648, at(2) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(0, -2147483648);
      arr.$_set(1, 2147483647);
      expect(arr.at(0)).assertEqual(-2147483648);
      expect(arr.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayAtPart03TestMindmapTest042
     * @tc.desc Verify all -1 at(3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, -1);
      arr.$_set(1, -1);
      arr.$_set(2, -1);
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayAtPart03TestMindmapTest043
     * @tc.desc Verify 0/-0/1/-1 at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(0, -0, 1, -1);
      expect(arr.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayAtPart03TestMindmapTest044
     * @tc.desc Verify at(0) returns -2147483648, at(3) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648, 0, 2147483647);
      let r0 = arr.at(0);
      expect(r0).assertEqual(-2147483648);
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayAtPart03TestMindmapTest045
     * @tc.desc Verify INT_MAX and INT_MIN indices return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      expect(arr.at(2147483647)).assertEqual(undefined);
      expect(arr.at(-2147483648)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayAtPart03TestMindmapTest046
     * @tc.desc Verify INT_MAX and INT_MIN indices return undefined on a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      expect(arr.at(2147483647)).assertEqual(undefined);
      expect(arr.at(-2147483648)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayAtPart03TestMindmapTest047
     * @tc.desc Verify at(INT_MAX) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.at(2147483647)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayAtPart03TestMindmapTest048
     * @tc.desc Verify at(INT_MIN) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.at(-2147483648)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayAtPart03TestMindmapTest049
     * @tc.desc Verify positive and negative length-boundary indices return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.at(4)).assertEqual(undefined);
      expect(arr.at(-5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayAtPart03TestMindmapTest050
     * @tc.desc Verify at(OOB) does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      arr.at(999);
      arr.at(-999);
      arr.at(2147483647);
      arr.at(-2147483648);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayAtPart03TestMindmapTest051
     * @tc.desc Verify at byteOffset and length unchanged after OOB access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr: Int32Array = new Int32Array(buf, 4, 3);
      arr.at(100);
      arr.at(-100);
      expect(arr.byteOffset).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayAtPart03TestMindmapTest052
     * @tc.desc Verify at(999)/at(-999) does not corrupt $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.at(999);
      arr.at(-999);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(20);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayAtPart03TestMindmapTest053
     * @tc.desc Verify at(5) returns undefined on length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2);
      arr.at(5);
      expect(arr.at(5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayAtPart03TestMindmapTest054
     * @tc.desc Verify at(2) vs at(3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let last = arr.at(2);
      expect(last).assertEqual(30);
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayAtPart03TestMindmapTest055
     * @tc.desc Verify at(-3) vs at(-4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      let first = arr.at(-3);
      expect(first).assertEqual(10);
      expect(arr.at(-4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayAtPart03TestMindmapTest056
     * @tc.desc Verify at(0) vs at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      let r0 = arr.at(0);
      expect(r0).assertEqual(9);
      expect(arr.at(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayAtPart03TestMindmapTest057
     * @tc.desc Verify at(-1) vs at(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(9);
      let r1 = arr.at(-1);
      expect(r1).assertEqual(9);
      expect(arr.at(-2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayAtPart03TestMindmapTest058
     * @tc.desc Verify at(0) and $_get(0) both return 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(55);
      let boxed = arr.at(0);
      let raw: number = arr.$_get(0);
      expect(raw).assertEqual(55);
      expect(boxed).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayAtPart03TestMindmapTest059
     * @tc.desc Verify at(0) matches $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-100);
      let raw: number = arr.$_get(0);
      let boxed = arr.at(0);
      expect(boxed).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayAtPart03TestMindmapTest060
     * @tc.desc Verify at(0) returns INT_MIN -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-2147483648);
      let r = arr.at(0);
      expect(r).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayAtPart03TestMindmapTest061
     * @tc.desc Verify at(0) returns INT_MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(2147483647);
      let r = arr.at(0);
      expect(r).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayAtPart03TestMindmapTest062
     * @tc.desc Verify at(0) returns 0, at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      let r = arr.at(0);
      expect(r).assertEqual(0);
      expect(arr.at(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayAtPart03TestMindmapTest063
     * @tc.desc Verify at(0) returns -1, at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(-1);
      let r = arr.at(0);
      expect(r).assertEqual(-1);
      expect(arr.at(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayAtPart03TestMindmapTest064
     * @tc.desc Verify for-of at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let sum: number = 0;
      for (let v of arr) {
        sum += v;
      }
      expect(sum).assertEqual(6);
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayAtPart03TestMindmapTest065
     * @tc.desc Verify forEach count 4, at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30, 40);
      let n: int = 0;
      arr.forEach((_v: number, _i: int, _a: Int32Array): void => { n++; });
      expect(n).assertEqual(4);
      expect(arr.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayAtPart03TestMindmapTest066
     * @tc.desc Verify for-of break at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      for (let v of arr) {
        if (v === 3) { break; }
      }
      expect(arr.at(5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayAtPart03TestMindmapTest067
     * @tc.desc Verify at(0) 10, at(2) 30 after multiple OOB calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(10, 20, 30);
      arr.at(99);
      let a = arr.at(0);
      arr.at(-99);
      let b = arr.at(2);
      arr.at(2147483647);
      expect(a).assertEqual(10);
      expect(b).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayAtPart03TestMindmapTest068
     * @tc.desc Verify positive indices at(0)-at(3), at(4) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300, 400);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);
      expect(arr.at(3)).assertEqual(400);
      expect(arr.at(4)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayAtPart03TestMindmapTest069
     * @tc.desc Verify negative indices at(-4)-at(-1), at(-5) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300, 400);
      expect(arr.at(-4)).assertEqual(100);
      expect(arr.at(-3)).assertEqual(200);
      expect(arr.at(-2)).assertEqual(300);
      expect(arr.at(-1)).assertEqual(400);
      expect(arr.at(-5)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayAtPart03TestMindmapTest070
     * @tc.desc Verify positive and negative out-of-bounds indices on a 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      expect(arr.at(-101)).assertEqual(undefined);
      expect(arr.at(100)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayAtPart03TestMindmapTest071
     * @tc.desc Verify 100 at(50) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      expect(arr.at(50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayAtPart03TestMindmapTest072
     * @tc.desc Verify 100 at(-50) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(100);
      expect(arr.at(-50)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayAtPart03TestMindmapTest073
     * @tc.desc Verify slice() at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp = orig.slice();
      expect(cp.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayAtPart03TestMindmapTest074
     * @tc.desc Verify slice(1,2) at(1) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp = orig.slice(1, 2);
      expect(cp.length).assertEqual(1);
      expect(cp.at(1)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayAtPart03TestMindmapTest075
     * @tc.desc Verify slice(0,0) at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = Int32Array.of(1, 2, 3);
      let cp = orig.slice(0, 0);
      expect(cp.at(0)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayAtPart03TestMindmapTest076
     * @tc.desc Verify includes at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let found: boolean = arr.includes(2);
      expect(found).assertTrue();
      expect(arr.at(3)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayAtPart03TestMindmapTest077
     * @tc.desc Verify indexOf -1 at(length) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart03TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let idx: int = arr.indexOf(99);
      expect(idx).assertEqual(-1);
      expect(arr.at(3)).assertEqual(undefined);
    });

  });
}
