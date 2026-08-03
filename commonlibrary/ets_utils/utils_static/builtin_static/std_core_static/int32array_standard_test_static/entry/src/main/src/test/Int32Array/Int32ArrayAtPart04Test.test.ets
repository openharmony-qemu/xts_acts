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
export default function int32ArrayAtPart04TestMindmapTestTest(): void {
  describe('Int32ArrayAtPart04TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayAtPart04TestMindmapTest001
     * @tc.desc Verify at() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let before: number = arr.length;
      arr.at(2);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayAtPart04TestMindmapTest002
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let v = arr.at(0)!;
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayAtPart04TestMindmapTest003
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let v = arr.at(-1)!;
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayAtPart04TestMindmapTest004
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let v = arr.at(-2)!;
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayAtPart04TestMindmapTest005
     * @tc.desc Verify at() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let before: number = arr.byteLength;
      let v = arr.at(1)!;
      expect(v).assertEqual(2);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayAtPart04TestMindmapTest006
     * @tc.desc Verify at() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      let before: number = arr.byteOffset;
      let v = arr.at(0)!;
      expect(v).assertEqual(0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayAtPart04TestMindmapTest007
     * @tc.desc Verify positive and negative extreme out-of-bounds access does not corrupt the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      expect(arr.at(99)).assertEqual(undefined);
      expect(arr.at(-99)).assertEqual(undefined);
      expect(arr.$_get(0)).assertEqual(11);
      expect(arr.$_get(1)).assertEqual(22);
      expect(arr.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayAtPart04TestMindmapTest008
     * @tc.desc Verify at() length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let v = arr.at(0);
      expect(v).assertEqual(undefined);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayAtPart04TestMindmapTest009
     * @tc.desc Verify $_set at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      arr.$_set(0, 777);
      expect(arr.at(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayAtPart04TestMindmapTest010
     * @tc.desc Verify $_set at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      arr.$_set(2, 888);
      expect(arr.at(-1)).assertEqual(888);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayAtPart04TestMindmapTest011
     * @tc.desc Verify $_set at(1) equals at(-3) for length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      arr.$_set(1, 555);
      expect(arr.at(1)).assertEqual(arr.at(-3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayAtPart04TestMindmapTest012
     * @tc.desc Verify $_set out-of-range index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.$_set(5, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayAtPart04TestMindmapTest013
     * @tc.desc Verify $_set negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      try {
        arr.$_set(-1, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayAtPart04TestMindmapTest014
     * @tc.desc Verify fill makes both positive and negative endpoint access return the filled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(42);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(-1)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayAtPart04TestMindmapTest015
     * @tc.desc Verify reverse updates both positive and negative endpoint access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.reverse();
      expect(arr.at(0)).assertEqual(4);
      expect(arr.at(-1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayAtPart04TestMindmapTest016
     * @tc.desc Verify sort updates both positive and negative endpoint access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([30, 10, 50, 20, 40]);
      arr.sort();
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(-1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayAtPart04TestMindmapTest017
     * @tc.desc Verify copyWithin at(target)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      arr.copyWithin(3, 0, 1);
      expect(arr.at(3)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayAtPart04TestMindmapTest018
     * @tc.desc Verify set writes both elements at the destination endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let src: Int32Array = new Int32Array([7, 8]);
      arr.set(src, 2);
      expect(arr.at(2)).assertEqual(7);
      expect(arr.at(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayAtPart04TestMindmapTest019
     * @tc.desc Verify int32 at() MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483647);
      expect(arr.at(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayAtPart04TestMindmapTest020
     * @tc.desc Verify int32 at() MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648);
      expect(arr.at(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayAtPart04TestMindmapTest021
     * @tc.desc Verify MAX+1=2147483648 MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483648);
      expect(arr.at(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayAtPart04TestMindmapTest022
     * @tc.desc Verify MIN-1=-2147483649 MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483649);
      expect(arr.at(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayAtPart04TestMindmapTest023
     * @tc.desc Verify -3 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -3);
      expect(arr.at(0)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayAtPart04TestMindmapTest024
     * @tc.desc Verify 4294967295 (0xFFFFFFFF) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967295);
      expect(arr.at(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayAtPart04TestMindmapTest025
     * @tc.desc Verify 4294967296 (0x100000000) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967296);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayAtPart04TestMindmapTest026
     * @tc.desc Verify -0 at() 0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayAtPart04TestMindmapTest027
     * @tc.desc Verify at(at(0))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 10, 20, 30]);
      let idx = arr.at(0)!;
      expect(arr.at(Double.toInt(idx))).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayAtPart04TestMindmapTest028
     * @tc.desc Verify at(0) 0 at(at(0))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 100, 200]);
      let idx = arr.at(0)!;
      expect(arr.at(Double.toInt(idx))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayAtPart04TestMindmapTest029
     * @tc.desc Verify at(0) length-1 at(at(0))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 11, 22, 33, 44]);
      let idx = arr.at(0)!;
      expect(arr.at(Double.toInt(idx))).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayAtPart04TestMindmapTest030
     * @tc.desc Verify at(0) -1 at(at(0) )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 11, 22, 33]);
      let idx = arr.at(0)!;
      expect(arr.at(Double.toInt(idx))).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayAtPart04TestMindmapTest031
     * @tc.desc Verify at(0) at(at(0)) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([99, 10, 20]);
      let idx = arr.at(0)!;
      let v: number | undefined = arr.at(Double.toInt(idx));
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayAtPart04TestMindmapTest032
     * @tc.desc Verify at(0) <-length at(at(0)) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-99, 10, 20]);
      let idx = arr.at(0)!;
      let v: number | undefined = arr.at(Double.toInt(idx));
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayAtPart04TestMindmapTest033
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 0]);
      let idx = arr.at(-1)!;
      expect(arr.at(Double.toInt(idx))).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayAtPart04TestMindmapTest034
     * @tc.desc Verify at(at(at(0)))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 300]);
      let i1 = arr.at(0)!;
      let i2 = arr.at(Double.toInt(i1))!;
      let v: number | undefined = arr.at(Double.toInt(i2));
      expect(v).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayAtPart04TestMindmapTest035
     * @tc.desc Verify fill(7).at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      expect(arr.fill(7).at(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayAtPart04TestMindmapTest036
     * @tc.desc Verify reverse().at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.reverse().at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayAtPart04TestMindmapTest037
     * @tc.desc Verify sort().at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 1, 3]);
      expect(arr.sort().at(-1)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayAtPart04TestMindmapTest038
     * @tc.desc Verify reverse().at(0) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(arr.reverse().at(0)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayAtPart04TestMindmapTest039
     * @tc.desc Verify subarray at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      parent.$_set(1, 77);
      expect(child.at(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayAtPart04TestMindmapTest040
     * @tc.desc Verify subarray at(offset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      child.$_set(0, 88);
      expect(parent.at(1)).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayAtPart04TestMindmapTest041
     * @tc.desc Verify subarray at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let child: Int32Array = parent.subarray(2);
      child.$_set(child.length - 1, 99);
      expect(parent.at(-1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayAtPart04TestMindmapTest042
     * @tc.desc Verify subarray at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(1, 3);
      expect(child.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayAtPart04TestMindmapTest043
     * @tc.desc Verify subarray(0) at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([5, 6, 7]);
      let child: Int32Array = parent.subarray(0);
      expect(child.at(0)).assertEqual(parent.at(0));
      expect(child.at(-1)).assertEqual(parent.at(-1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayAtPart04TestMindmapTest044
     * @tc.desc Verify slice at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let child: Int32Array = parent.slice();
      parent.$_set(0, 999);
      expect(child.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayAtPart04TestMindmapTest045
     * @tc.desc Verify slice at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let child: Int32Array = parent.slice();
      child.$_set(0, 888);
      expect(parent.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayAtPart04TestMindmapTest046
     * @tc.desc Verify Int32Array ArrayBuffer at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let valFirst: Int32Array = new Int32Array(buf, 0, 4);
      let valSecond: Int32Array = new Int32Array(buf, 0, 4);
      valFirst.$_set(0, 111);
      expect(valSecond.at(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayAtPart04TestMindmapTest047
     * @tc.desc Verify Int32Array at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let valFirst: Int32Array = new Int32Array(buf, 0, 4);
      let valSecond: Int32Array = new Int32Array(buf, 8, 4);
      valFirst.$_set(3, 222);
      expect(valSecond.at(1)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayAtPart04TestMindmapTest048
     * @tc.desc Verify subarray fill at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let child: Int32Array = parent.subarray(1, 4);
      child.fill(7);
      expect(parent.at(1)).assertEqual(7);
      expect(parent.at(2)).assertEqual(7);
      expect(parent.at(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayAtPart04TestMindmapTest049
     * @tc.desc Verify reverse subarray at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      parent.reverse();
      expect(child.at(0)).assertEqual(3);
      expect(child.at(-1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayAtPart04TestMindmapTest050
     * @tc.desc Verify ArrayBuffer at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 10);
      base.$_set(1, 20);
      base.$_set(2, 30);
      base.$_set(3, 40);
      let offset: Int32Array = new Int32Array(buf, 8, 2);
      expect(offset.at(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayAtPart04TestMindmapTest051
     * @tc.desc Verify at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let base: Int32Array = new Int32Array(buf);
      base.$_set(0, 10);
      base.$_set(1, 20);
      base.$_set(2, 30);
      base.$_set(3, 40);
      let offset: Int32Array = new Int32Array(buf, 4, 2);
      expect(offset.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayAtPart04TestMindmapTest052
     * @tc.desc Verify for at(i) $_get(i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.at(i)).assertEqual(arr.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayAtPart04TestMindmapTest053
     * @tc.desc Verify for at(-(i+1)) $_get(len-1-i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.at(-(i + 1))).assertEqual(arr.$_get(arr.length - 1 - i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayAtPart04TestMindmapTest054
     * @tc.desc Verify forEach at(index) value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 15, 25, 35]);
      arr.forEach((value: number, index: int, _arr: Int32Array): void => {
        expect(arr.at(Double.toInt(index))).assertEqual(value);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayAtPart04TestMindmapTest055
     * @tc.desc Verify map at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([1, 2, 3]);
      let dst: Int32Array = src.map((v: number, _i: int, _a: Int32Array): number => v * 10);
      expect(dst.at(0)).assertEqual(10);
      expect(dst.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayAtPart04TestMindmapTest056
     * @tc.desc Verify $_set at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      for (let i = 0; i < arr.length; i++) {
        arr.$_set(i, i + 1);
        expect(arr.at(i)).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayAtPart04TestMindmapTest057
     * @tc.desc Verify at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      for (let i = 0; i < arr.length - 1; i++) {
        arr.$_set(i + 1, i * 100);
      }
      expect(arr.at(3)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayAtPart04TestMindmapTest058
     * @tc.desc Verify indexOf at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let idx: number = arr.indexOf(30);
      expect(arr.at(Double.toInt(idx))).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayAtPart04TestMindmapTest059
     * @tc.desc Verify lastIndexOf at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 20]);
      let idx: number = arr.lastIndexOf(20);
      expect(Double.toInt(idx)).assertEqual(3);
      expect(arr.at(Double.toInt(idx))).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayAtPart04TestMindmapTest060
     * @tc.desc Verify findIndex at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 22, 333, 4444]);
      let idx: number = arr.findIndex((v) => v > 100);
      expect(arr.at(Double.toInt(idx))).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayAtPart04TestMindmapTest061
     * @tc.desc Verify indexOf returns -1 for not found, then at(-1) returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let idx: number = arr.indexOf(999);
      expect(idx).assertEqual(-1);
      expect(arr.at(Double.toInt(idx))).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayAtPart04TestMindmapTest062
     * @tc.desc Verify includes true at(indexOf(v))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 15, 25]);
      let found: boolean = arr.includes(15);
      expect(found).assertTrue();
      expect(arr.at(arr.indexOf(15))).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayAtPart04TestMindmapTest063
     * @tc.desc Verify forEach at() finds max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 7, 2, 9, 4]);
      let maxIdx: int = 0;
      arr.forEach((v: number, i: int, _arr: Int32Array): void => {
        if (v > arr.at(Double.toInt(maxIdx))!) {
          maxIdx = i;
        }
      });
      expect(arr.at(Double.toInt(maxIdx))).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayAtPart04TestMindmapTest064
     * @tc.desc Verify every at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2, 4, 6]);
      let allEven: boolean = arr.every((v) => v % 2 === 0);
      expect(allEven).assertTrue();
      expect(arr.at(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayAtPart04TestMindmapTest065
     * @tc.desc Verify some at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 3, 5, 6]);
      let hasEven = arr.some((v) => v % 2 === 0);
      expect(hasEven).assertTrue();
      expect(arr.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayAtPart04TestMindmapTest066
     * @tc.desc Verify toString at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let s: string = arr.toString();
      expect(s).assertEqual('1,2,3');
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayAtPart04TestMindmapTest067
     * @tc.desc Verify join at(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let s = arr.join('-');
      expect(s).assertEqual('10-20-30');
      expect(arr.at(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayAtPart04TestMindmapTest068
     * @tc.desc Verify ArrayBuffer buffer at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int32Array = new Int32Array(buf);
      arr.$_set(0, 111);
      arr.$_set(1, 222);
      arr.$_set(2, 333);
      expect(arr.at(0)).assertEqual(111);
      expect(arr.at(1)).assertEqual(222);
      expect(arr.at(2)).assertEqual(333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayAtPart04TestMindmapTest069
     * @tc.desc Verify subarray buffer length TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      expect(child.length).assertEqual(2);
      parent.$_set(2, 55);
      expect(child.at(1)).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayAtPart04TestMindmapTest070
     * @tc.desc Verify Int32Array.from( ) at(i) i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [100, 200, 300];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(1)).assertEqual(200);
      expect(arr.at(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayAtPart04TestMindmapTest071
     * @tc.desc Verify Int32Array.from( TypedArray) at(i)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7, 8, 9]);
      let dst: Int32Array = Int32Array.from(src);
      src.$_set(0, 999);
      expect(dst.at(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayAtPart04TestMindmapTest072
     * @tc.desc Verify Int32Array.of(...) at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(111, 222, 333, 444);
      expect(arr.at(-1)).assertEqual(444);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayAtPart04TestMindmapTest073
     * @tc.desc Verify subarray at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 10, 20, 30, 40, 50]);
      let mid: Int32Array = parent.subarray(1, 5);
      let inner: Int32Array = mid.subarray(1, 3);
      expect(inner.at(0)).assertEqual(20);
      expect(inner.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayAtPart04TestMindmapTest074
     * @tc.desc Verify subarray at()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      let mid: Int32Array = parent.subarray(1);
      let inner: Int32Array = mid.subarray(1);
      inner.$_set(0, 777);
      expect(parent.at(2)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayAtPart04TestMindmapTest075
     * @tc.desc Verify forEach at() accumulates sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let idxSum: number = 0;
      arr.forEach((_v: number, i: int, _arr: Int32Array): void => {
        idxSum = idxSum + (arr.at(i) as number);
      });
      expect(idxSum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_AT_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayAtPart04TestMindmapTest076
     * @tc.desc Verify at(i) at(i-length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayAtPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      for (let i = 0; i < arr.length; i++) {
        let pos = arr.at(i);
        let neg = arr.at(i - arr.length);
        expect(pos).assertEqual(neg);
      }
    });

  });
}
