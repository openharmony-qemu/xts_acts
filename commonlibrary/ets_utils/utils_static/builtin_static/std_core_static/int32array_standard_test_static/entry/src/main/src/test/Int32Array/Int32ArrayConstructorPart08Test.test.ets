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
export default function int32ArrayConstructorPart08TestMindmapTestTest(): void {
  describe('Int32ArrayConstructorPart08TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest001
     * @tc.desc Verify Set&lt;number&gt;( ) ,length Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2); s.add(3);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest002
     * @tc.desc Verify length and byteLength for empty Set<number> construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(0);
      expect(dst.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest003
     * @tc.desc Verify Float64Array Iterable&lt;Number&gt; , 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2.9, -3.7);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest004
     * @tc.desc Verify Float64Array 2.9 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2.9, -3.7);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest005
     * @tc.desc Verify Float64Array -3.7 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2.9, -3.7);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(2)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest006
     * @tc.desc Verify Int16Array Iterable ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(100, -200, 300);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(100);
      expect(dst.$_get(1)).assertEqual(-200);
      expect(dst.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest007
     * @tc.desc Verify Map.values() ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 10); m.set(1, 20); m.set(2, 30);
      let dst: Int32Array = new Int32Array(m.values());
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(10);
      expect(dst.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest008
     * @tc.desc Verify Map.keys() ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(7, 0); m.set(8, 0); m.set(9, 0);
      let dst: Int32Array = new Int32Array(m.keys());
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_0900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest009
     * @tc.desc Verify Iterable (yield 0,1,2) ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 1, 2] as Array<int>);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(1);
      expect(dst.$_get(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1000
     * @tc.name int32ArrayConstructorPart08TestMindmapTest010
     * @tc.desc Verify Iterable Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([42] as Array<int>);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest011
     * @tc.desc Verify done Iterable Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([] as Array<int>);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest012
     * @tc.desc Verify Set 5,5,5 5(length=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5); s.add(5); s.add(5);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest013
     * @tc.desc Verify Set +0 -0 SameValueZero (length=1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0); s.add(-0);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest014
     * @tc.desc Verify Set 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest015
     * @tc.desc Verify Set -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest016
     * @tc.desc Verify Set INT_MAX(2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(2147483647);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest017
     * @tc.desc Verify Set INT_MIN(-2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-2147483648);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest018
     * @tc.desc Verify Set (1 2 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2); s.add(3);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_1900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest019
     * @tc.desc Verify Set ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2); s.add(3);
      s.delete(2);
      s.add(4);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(3);
      expect(dst.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2000
     * @tc.name int32ArrayConstructorPart08TestMindmapTest020
     * @tc.desc Verify Set Number.NaN SameValueZero , ToInt32(Number.NaN)=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(Double.NaN);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest021
     * @tc.desc Verify Float64Array Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(Double.NaN);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest022
     * @tc.desc Verify Float64Array +Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(Double.POSITIVE_INFINITY);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest023
     * @tc.desc Verify Float64Array Double.NEGATIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(Double.NEGATIVE_INFINITY);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest024
     * @tc.desc Verify Float64Array 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest025
     * @tc.desc Verify Float64Array -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(-0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest026
     * @tc.desc Verify Float64Array 2147483647.9 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(2147483647.9);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest027
     * @tc.desc Verify Float64Array 2147483648.0(2^31) INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(2147483648.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest028
     * @tc.desc Verify Float64Array 2147483649.0(2^31+1) -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(2147483649.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_2900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest029
     * @tc.desc Verify Float64Array -2147483649.0(-2^31-1) INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(-2147483649.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3000
     * @tc.name int32ArrayConstructorPart08TestMindmapTest030
     * @tc.desc Verify Float64Array 4294967296.0(2^32) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(4294967296.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest031
     * @tc.desc Verify Float64Array 4294967297.0(2^32+1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(4294967297.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest032
     * @tc.desc Verify Float64Array -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(-1);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest033
     * @tc.desc Verify Float64Array 0+0.2( ) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(0 + 0.2);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest034
     * @tc.desc Verify Float64Array Number.NaN/Number.POSITIVE_INFINITY/ / , ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(Double.NaN, Double.POSITIVE_INFINITY, 3.7, -2, 2147483648.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(5);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(0);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(-2);
      expect(dst.$_get(4)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest035
     * @tc.desc Verify Float64Array.of(9,8,7,6,5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(9, 8, 7, 6, 5);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(9);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(7);
      expect(dst.$_get(3)).assertEqual(6);
      expect(dst.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest036
     * @tc.desc Verify Set 30,20,10 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(30); s.add(20); s.add(10);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.$_get(0)).assertEqual(30);
      expect(dst.$_get(1)).assertEqual(20);
      expect(dst.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest037
     * @tc.desc Verify Set( ) Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2);
      let dst: Int32Array = new Int32Array(s);
      s.add(99);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest038
     * @tc.desc Verify Float64Array Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2, 3);
      let dst: Int32Array = new Int32Array(src);
      src.$_set(0, 99.0);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_3900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest039
     * @tc.desc Verify Float64Array buffer ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4000
     * @tc.name int32ArrayConstructorPart08TestMindmapTest040
     * @tc.desc Verify 4 Set byteLength 16(4*4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2); s.add(3); s.add(4);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest041
     * @tc.desc Verify Iterable byteOffset 0( buffer 0 )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest042
     * @tc.desc Verify 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0] as Array<int>);
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest043
     * @tc.desc Verify INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483647] as Array<int>);
      expect(dst.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest044
     * @tc.desc Verify INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-2147483648] as Array<int>);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest045
     * @tc.desc Verify Number.NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([Double.NaN] as Array<number>);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest046
     * @tc.desc Verify +Number.POSITIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([Double.POSITIVE_INFINITY] as Array<number>);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest047
     * @tc.desc Verify Double.NEGATIVE_INFINITY 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([Double.NEGATIVE_INFINITY] as Array<number>);
      expect(dst.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest048
     * @tc.desc Verify 3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([3] as Array<number>);
      expect(dst.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_4900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest049
     * @tc.desc Verify 2147483648.0 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([2147483648.0] as Array<number>);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5000
     * @tc.name int32ArrayConstructorPart08TestMindmapTest050
     * @tc.desc Verify 10 ,length=10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9] as Array<int>);
      expect(dst.length).assertEqual(10);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(9)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest051
     * @tc.desc Verify (-1,1,-1,1),
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([-1, 1, -1, 1] as Array<int>);
      expect(dst.length).assertEqual(4);
      expect(dst.$_get(0)).assertEqual(-1);
      expect(dst.$_get(1)).assertEqual(1);
      expect(dst.$_get(2)).assertEqual(-1);
      expect(dst.$_get(3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest052
     * @tc.desc Verify Float64Array length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = new Float64Array(0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest053
     * @tc.desc Verify Float64Array -2147483648.0 INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(-2147483648.0);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest054
     * @tc.desc Verify 4 Float64Array 1/2.2/3.3/4.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2.2, 3.3, 4.4);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(4);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(dst.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest055
     * @tc.desc Verify offset Float64Array ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(32);
      let dv: DataView = new DataView(buf);
      dv.setFloat64(0, 1, true);
      dv.setFloat64(8, 2, true);
      dv.setFloat64(16, 3, true);
      dv.setFloat64(24, 4, true);
      let src: Float64Array = new Float64Array(buf, 8, 2);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(2);
      expect(dst.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest056
     * @tc.desc Verify Uint8Array Iterable , int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Uint8Array = Uint8Array.of(0, 127, 255);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(0);
      expect(dst.$_get(1)).assertEqual(127);
      expect(dst.$_get(2)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest057
     * @tc.desc Verify Iterable for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(10, 20.0, 30.0);
      let out: number[] = [];
      let dst: Int32Array = new Int32Array(src);
      for (let v of dst) {
        out.push(v);
      }
      expect(out.length).assertEqual(3);
      expect(out[0]).assertEqual(10);
      expect(out[1]).assertEqual(20);
      expect(out[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest058
     * @tc.desc Verify Iterable for-of 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let dst: Int32Array = new Int32Array(s);
      let count: int = 0;
      for (let v of dst) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_5900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest059
     * @tc.desc Verify Set 1 2 3 constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2); s.add(3);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6000
     * @tc.name int32ArrayConstructorPart08TestMindmapTest060
     * @tc.desc Verify constructing Int32Array with negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Int32Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6100
     * @tc.name int32ArrayConstructorPart08TestMindmapTest061
     * @tc.desc Verify Set $_set , Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2); s.add(3);
      let dst: Int32Array = new Int32Array(s);
      dst.$_set(0, 100);
      expect(dst.$_get(0)).assertEqual(100);
      expect(dst.$_get(1)).assertEqual(2);
      expect(dst.$_get(2)).assertEqual(3);
      expect(s.has(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6200
     * @tc.name int32ArrayConstructorPart08TestMindmapTest062
     * @tc.desc Verify Float64Array Int32Array, Float64Array ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(5, 6.0);
      let dst: Int32Array = new Int32Array(src);
      dst.$_set(0, 999);
      expect(src.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6300
     * @tc.name int32ArrayConstructorPart08TestMindmapTest063
     * @tc.desc Verify Float64Array Float64Array,Int32Array ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(5, 6.0);
      let dst: Int32Array = new Int32Array(src);
      src.$_set(1, 77.0);
      expect(dst.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6400
     * @tc.name int32ArrayConstructorPart08TestMindmapTest064
     * @tc.desc Verify Set Int32Array,buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1); s.add(2);
      let a: Int32Array = new Int32Array(s);
      let b: Int32Array = new Int32Array(s);
      a.$_set(0, 99);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6500
     * @tc.name int32ArrayConstructorPart08TestMindmapTest065
     * @tc.desc Verify Float64Array Int32Array,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Float64Array = Float64Array.of(1, 2);
      let a: Int32Array = new Int32Array(src);
      let b: Int32Array = new Int32Array(src);
      a.$_set(0, 555);
      expect(b.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6600
     * @tc.name int32ArrayConstructorPart08TestMindmapTest066
     * @tc.desc Verify Int16Array Int32Array,buffer , Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(10, 20);
      let dst: Int32Array = new Int32Array(src);
      dst.$_set(0, 777);
      expect(src.$_get(0)).assertEqual(10);
      expect(dst.$_get(0)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6700
     * @tc.name int32ArrayConstructorPart08TestMindmapTest067
     * @tc.desc Verify Map.values()(Iterator ) Iterable ,length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let m: Map<number, number> = new Map<number, number>();
      m.set(0, 77);
      let dst: Int32Array = new Int32Array(m.values());
      expect(dst.length).assertEqual(1);
      expect(dst.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6800
     * @tc.name int32ArrayConstructorPart08TestMindmapTest068
     * @tc.desc Verify Symbol.iterator ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dst: Int32Array = new Int32Array([7, 8, 9] as Array<int>);
      expect(dst.length).assertEqual(3);
      expect(dst.$_get(0)).assertEqual(7);
      expect(dst.$_get(1)).assertEqual(8);
      expect(dst.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_CONSTRUCTOR_PART08_TEST_MINDMAP_6900
     * @tc.name int32ArrayConstructorPart08TestMindmapTest069
     * @tc.desc Verify Set Iterable, new Set([1,2]) ( Array )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayConstructorPart08TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>([1, 2]);
      let dst: Int32Array = new Int32Array(s);
      expect(dst.length).assertEqual(2);
      expect(dst.$_get(0)).assertEqual(1);
      expect(dst.$_get(1)).assertEqual(2);
    });
  });
}
