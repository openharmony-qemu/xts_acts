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

export default function int32ArrayFromPart02Test(): void {
  describe('Int32ArrayFromPart02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayFromPart02TestMindmapTest001
     * @tc.desc Verify from( Set) empty array creates Int32Array with length=0, byteLength=0, byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(0);
      expect(r.byteOffset).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayFromPart02TestMindmapTest002
     * @tc.desc Verify from( Set) forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let r = Int32Array.from(s);
      let cnt: int = 0;
      r.forEach((v: number, i: int, arr: Int32Array) => {
        cnt++;
      });
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayFromPart02TestMindmapTest003
     * @tc.desc Verify from( 0 Set) 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayFromPart02TestMindmapTest004
     * @tc.desc Verify from( -1 Set) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayFromPart02TestMindmapTest005
     * @tc.desc Verify from( INT_MAX Set) 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(2147483647);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayFromPart02TestMindmapTest006
     * @tc.desc Verify from( INT_MIN Set) -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-2147483648);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayFromPart02TestMindmapTest007
     * @tc.desc Verify from( 100 Set) 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayFromPart02TestMindmapTest008
     * @tc.desc Verify from( -100 Set) -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-100);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayFromPart02TestMindmapTest009
     * @tc.desc Verify from( Set) with 1 element yields BYTES_PER_ELEMENT=4 and byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(7);
      let r = Int32Array.from(s);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      expect(r.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayFromPart02TestMindmapTest010
     * @tc.desc Verify from( Set[3,7]) [3,7]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(3);
      s.add(7);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayFromPart02TestMindmapTest011
     * @tc.desc Verify from( Set[7,3]) [7,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(7);
      s.add(3);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayFromPart02TestMindmapTest012
     * @tc.desc Verify from( Set[-1,0,1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1);
      s.add(0);
      s.add(1);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-1);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayFromPart02TestMindmapTest013
     * @tc.desc Verify from( Set [INT_MAX,0,INT_MIN])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(2147483647);
      s.add(0);
      s.add(-2147483648);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(2147483647);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayFromPart02TestMindmapTest014
     * @tc.desc Verify from( Set[1..5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      s.add(4);
      s.add(5);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayFromPart02TestMindmapTest015
     * @tc.desc Verify from( Set[5..1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5);
      s.add(4);
      s.add(3);
      s.add(2);
      s.add(1);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayFromPart02TestMindmapTest016
     * @tc.desc Verify from( Set[1,-1,2,-2,3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(-1);
      s.add(2);
      s.add(-2);
      s.add(3);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(3)).assertEqual(-2);
      expect(r.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayFromPart02TestMindmapTest017
     * @tc.desc Verify from( Set[-5,-3,-1,-2,-4])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-5);
      s.add(-3);
      s.add(-1);
      s.add(-2);
      s.add(-4);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(-5);
      expect(r.$_get(2)).assertEqual(-1);
      expect(r.$_get(4)).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayFromPart02TestMindmapTest018
     * @tc.desc Verify from( add Set) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5);
      s.add(5);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayFromPart02TestMindmapTest019
     * @tc.desc Verify from( Set add)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayFromPart02TestMindmapTest020
     * @tc.desc Verify from(0 -0 add) int -0 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0);
      s.add(-0);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayFromPart02TestMindmapTest021
     * @tc.desc Verify from(-0 add add 0) 1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-0);
      s.add(0);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayFromPart02TestMindmapTest022
     * @tc.desc Verify from( delete add )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      s.delete(2);
      s.add(4);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayFromPart02TestMindmapTest023
     * @tc.desc Verify from(delete add )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      s.delete(1);
      s.add(1);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(3);
      expect(r.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayFromPart02TestMindmapTest024
     * @tc.desc Verify from(clear add) clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.clear();
      s.add(7);
      s.add(8);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayFromPart02TestMindmapTest025
     * @tc.desc Verify from(delete from)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      s.delete(10);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(20);
      expect(r.$_get(1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayFromPart02TestMindmapTest026
     * @tc.desc Verify from(delete from)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      s.delete(30);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayFromPart02TestMindmapTest027
     * @tc.desc Verify from(delete )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.delete(999);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayFromPart02TestMindmapTest028
     * @tc.desc Verify from(add clear Set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.clear();
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayFromPart02TestMindmapTest029
     * @tc.desc Verify from(30 int Set) 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      for (let i = 0; i < 30; i++) {
        s.add(i);
      }
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(30);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(29)).assertEqual(29);
      expect(r.byteLength).assertEqual(120);
      expect(r.$_get(15)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayFromPart02TestMindmapTest030
     * @tc.desc Verify from( Set) for-of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let expected: int[] = [5, 10, 15, 20, 25, 30];
      for (let i = 0; i < expected.length; i++) {
        s.add(expected[i]);
      }
      let r = Int32Array.from(s);
      let idx = 0;
      for (let v of r) {
        expect(v).assertEqual(expected[idx]);
        idx++;
      }
      expect(idx).assertEqual(expected.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayFromPart02TestMindmapTest031
     * @tc.desc Verify from(Set) constructor Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayFromPart02TestMindmapTest032
     * @tc.desc Verify from( Set) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayFromPart02TestMindmapTest033
     * @tc.desc Verify from( Set) byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      s.add(40);
      let r = Int32Array.from(s);
      expect(r.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayFromPart02TestMindmapTest034
     * @tc.desc Verify from(Set) ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let r1 = Int32Array.from(s);
      let r2 = Int32Array.from(s);
      expect(r1.buffer).not().assertEqual(r2.buffer);
      {
        let s: Set<number> = new Set<number>();
        s.add(10);
        s.add(20);
        let r1 = Int32Array.from(s);
        let r2 = Int32Array.from(s);
        r1.$_set(0, 111);
        expect(r2.$_get(0)).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayFromPart02TestMindmapTest035
     * @tc.desc Verify from(Set) length set.size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(11);
      s.add(22);
      s.add(33);
      s.add(44);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(s.size);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayFromPart02TestMindmapTest036
     * @tc.desc Verify from(Set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(77);
      s.add(88);
      let r = Int32Array.from(s);
      expect(r[0]).assertEqual(77);
      {
        let s: Set<number> = new Set<number>();
        s.add(77);
        s.add(88);
        let r = Int32Array.from(s);
        let v = r.at(0);
        expect(v).not().assertNull();
        expect(v).assertEqual(77);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayFromPart02TestMindmapTest037
     * @tc.desc Verify from( Set) at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let r = Int32Array.from(s);
      let v = r.at(-1);
      expect(v).not().assertNull();
      expect(v).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayFromPart02TestMindmapTest038
     * @tc.desc Verify from(Set) indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5);
      s.add(15);
      s.add(25);
      let r = Int32Array.from(s);
      expect(r.indexOf(15)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayFromPart02TestMindmapTest039
     * @tc.desc Verify from(Set) includes true false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      expect(r.includes(2)).assertTrue();
      expect(r.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayFromPart02TestMindmapTest040
     * @tc.desc Verify from(Set) join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      expect(r.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayFromPart02TestMindmapTest041
     * @tc.desc Verify from( Set) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(42);
      let r = Int32Array.from(s);
      expect(r.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayFromPart02TestMindmapTest042
     * @tc.desc Verify from(Set) Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let sizeBefore = s.size;
      let has1Before = s.has(1);
      let has2Before = s.has(2);
      let r = Int32Array.from(s);
      expect(s.size).assertEqual(sizeBefore);
      expect(s.has(1)).assertEqual(has1Before);
      expect(s.has(2)).assertEqual(has2Before);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayFromPart02TestMindmapTest043
     * @tc.desc Verify from(Set) $_set Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Int32Array.from(s);
      r.$_set(0, 999);
      expect(s.has(1)).assertTrue();
      expect(s.has(999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayFromPart02TestMindmapTest044
     * @tc.desc Verify from(Set) Set add
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      let r = Int32Array.from(s);
      s.add(2);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayFromPart02TestMindmapTest045
     * @tc.desc Verify from(Set) Set delete
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Int32Array.from(s);
      s.delete(1);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayFromPart02TestMindmapTest046
     * @tc.desc Verify from(Set) clear Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Int32Array.from(s);
      s.clear();
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayFromPart02TestMindmapTest047
     * @tc.desc Verify from(Set) Set has
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(3);
      s.add(-3);
      s.add(300);
      s.add(-300);
      let r = Int32Array.from(s);
      for (let i = 0; i < r.length; i++) {
        expect(s.has(r.$_get(i))).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayFromPart02TestMindmapTest048
     * @tc.desc Verify from(Set) forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(10);
      s.add(20);
      s.add(30);
      let r = Int32Array.from(s);
      let expected: int[] = [10, 20, 30];
      let idx = 0;
      r.forEach((v: number, i: int, arr: Int32Array) => {
        expect(i).assertEqual(idx);
        expect(v).assertEqual(expected[idx]);
        idx++;
      });
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayFromPart02TestMindmapTest049
     * @tc.desc Verify from(Set) keys 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(7);
      s.add(8);
      s.add(9);
      let r = Int32Array.from(s);
      let idx = 0;
      for (let k of r.keys()) {
        expect(k).assertEqual(idx);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayFromPart02TestMindmapTest050
     * @tc.desc Verify from(Set) values Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let vals: int[] = [4, 5, 6];
      for (let i = 0; i < vals.length; i++) {
        s.add(vals[i]);
      }
      let r = Int32Array.from(s);
      let idx = 0;
      for (let v of r.values()) {
        expect(v).assertEqual(vals[idx]);
        idx++;
      }
      expect(idx).assertEqual(vals.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayFromPart02TestMindmapTest051
     * @tc.desc Verify from(Set) entries [index,value] value Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100);
      s.add(200);
      let r = Int32Array.from(s);
      let expected: int[] = [100, 200];
      let idx = 0;
      for (let pair of r.entries()) {
        expect(pair[0]).assertEqual(idx);
        expect(pair[1]).assertEqual(expected[idx]);
        idx++;
      }
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayFromPart02TestMindmapTest052
     * @tc.desc Verify from(Set) every Set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-10);
      s.add(0);
      s.add(10);
      let r = Int32Array.from(s);
      let allIn = r.every((v: number, i: int, arr: Int32Array): boolean => {
        return s.has(v);
      });
      expect(allIn).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayFromPart02TestMindmapTest053
     * @tc.desc Verify from(Set) some
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      let found = r.some((v: number, i: int, arr: Int32Array): boolean => {
        return v === 2;
      });
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayFromPart02TestMindmapTest054
     * @tc.desc Verify from(Set) $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Int32Array.from(s);
      r.$_set(0, 100);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayFromPart02TestMindmapTest055
     * @tc.desc Verify from(Set) fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      r.fill(0);
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayFromPart02TestMindmapTest056
     * @tc.desc Verify from(Set) set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      let r = Int32Array.from(s);
      r.set(0, 111);
      expect(r.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayFromPart02TestMindmapTest057
     * @tc.desc Verify from(Set) from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(5);
      s.add(6);
      let r1 = Int32Array.from(s);
      let r2 = Int32Array.from(r1);
      expect(r2.length).assertEqual(r1.length);
      expect(r2.$_get(0)).assertEqual(r1.$_get(0));
      expect(r2.$_get(1)).assertEqual(r1.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayFromPart02TestMindmapTest058
     * @tc.desc Verify from(Set) subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      let sub = r.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.buffer).assertEqual(r.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayFromPart02TestMindmapTest059
     * @tc.desc Verify from( Set) for-of break
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(2);
      s.add(3);
      let r = Int32Array.from(s);
      let sum = 0;
      for (let v of r) {
        sum += v;
        if (v === 2) {
          break;
        }
      }
      expect(sum).assertEqual(3);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayFromPart02TestMindmapTest060
     * @tc.desc Verify from( INT_MAX/0/INT_MIN Set)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-2147483648);
      s.add(0);
      s.add(2147483647);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(-2147483648);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayFromPart02TestMindmapTest061
     * @tc.desc Verify from( 1 -1 Set) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(1);
      s.add(-1);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayFromPart02TestMindmapTest062
     * @tc.desc Verify from( 0xFF/0xFFFF/0xFFFFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(0xFF);
      s.add(0xFFFF);
      s.add(0xFFFFFF);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(255);
      expect(r.$_get(1)).assertEqual(65535);
      expect(r.$_get(2)).assertEqual(16777215);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayFromPart02TestMindmapTest063
     * @tc.desc Verify from( -1024 -1048576)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(-1024);
      s.add(-1048576);
      let r = Int32Array.from(s);
      expect(r.$_get(0)).assertEqual(-1024);
      expect(r.$_get(1)).assertEqual(-1048576);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayFromPart02TestMindmapTest064
     * @tc.desc Verify from(clear add Set add Set) from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: Set<number> = new Set<number>();
      s1.add(1);
      s1.clear();
      s1.add(7);
      s1.add(8);
      let s2: Set<number> = new Set<number>();
      s2.add(7);
      s2.add(8);
      let r1 = Int32Array.from(s1);
      let r2 = Int32Array.from(s2);
      expect(r1.length).assertEqual(r2.length);
      expect(r1.$_get(0)).assertEqual(r2.$_get(0));
      expect(r1.$_get(1)).assertEqual(r2.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_FROM_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayFromPart02TestMindmapTest065
     * @tc.desc Verify from( add Set[100,200,300])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayFromPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100).add(200).add(300);
      let r = Int32Array.from(s);
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(2)).assertEqual(300);
    });
  });
}
