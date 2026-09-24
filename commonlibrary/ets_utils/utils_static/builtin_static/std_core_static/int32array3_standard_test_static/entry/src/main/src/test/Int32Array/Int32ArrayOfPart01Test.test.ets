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

export default function int32ArrayOfPart01Test(): void {
  describe('Int32ArrayOfPart01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayOfPart01TestMindmapTest001
     * @tc.desc Verify zero-arg of() returns an empty Int32Array with zero length, byteLength, and byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.length).assertEqual(0);
      expect(a.byteLength).assertEqual(0);
      expect(a.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayOfPart01TestMindmapTest002
     * @tc.desc Verify zero-arg of() buffer.byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayOfPart01TestMindmapTest003
     * @tc.desc Verify single-arg of(0) returns length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayOfPart01TestMindmapTest004
     * @tc.desc Verify dual-arg of(1,2) length=2 and byteLength=8; Also verify verify return value constructor strictly equals Int32Array; Also verify verify valueOf() returns the array itself (same reference)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(a.length).assertEqual(2);
      expect(a.byteLength).assertEqual(8);

      {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      }

      {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(a.valueOf()).assertEqual(a);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayOfPart01TestMindmapTest005
     * @tc.desc Verify three-arg of(10,20,30) length=3; Also verify verify join default separator result same as toString; Also verify verify of returned array findIndex returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.length).assertEqual(3);

      {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.join()).assertEqual(a.toString());
      }

      {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.findIndex((v: number, _i: int, _arr: Int32Array): boolean => v === 20)).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayOfPart01TestMindmapTest006
     * @tc.desc Verify four-arg of(1,2,3,4) length*4 equals byteLength; Also verify verify of() returned array buffer byteLength matches view byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(a.length * 4).assertEqual(a.byteLength);

      {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      expect(a.buffer.byteLength).assertEqual(a.byteLength);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayOfPart01TestMindmapTest007
     * @tc.desc Verify five-arg of(10,20,30,40,50) last element is 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 40, 50);
      expect(a.$_get(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayOfPart01TestMindmapTest008
     * @tc.desc Verify six-arg of(1,2,3,4,5,6) length=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6);
      expect(a.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayOfPart01TestMindmapTest009
     * @tc.desc Verify eight-arg all-zero length=8 and BYTES_PER_ELEMENT=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0, 0, 0, 0, 0, 0);
      expect(a.length).assertEqual(8);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayOfPart01TestMindmapTest010
     * @tc.desc Verify single element 0 reads back 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayOfPart01TestMindmapTest011
     * @tc.desc Verify single element 1 reads back 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayOfPart01TestMindmapTest012
     * @tc.desc Verify single element -1 reads back -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayOfPart01TestMindmapTest013
     * @tc.desc Verify single element -2 reads back -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2);
      expect(a.$_get(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayOfPart01TestMindmapTest014
     * @tc.desc Verify INT_MAX 2147483647 writes and reads back exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayOfPart01TestMindmapTest015
     * @tc.desc Verify INT_MIN -2147483648 writes and reads back exactly; Also verify verify negative hex -0x80000000 (INT_MIN) writes and reads -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648);
      expect(a.$_get(0)).assertEqual(-2147483648);

      {
      let a: Int32Array = Int32Array.of(-0x80000000);
      expect(a.$_get(0)).assertEqual(-2147483648);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayOfPart01TestMindmapTest016
     * @tc.desc Verify MAX neighbor 2147483646 writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483646);
      expect(a.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayOfPart01TestMindmapTest017
     * @tc.desc Verify MIN neighbor -2147483647 writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483647);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayOfPart01TestMindmapTest018
     * @tc.desc Verify hex 0x7FFFFFFF (INT_MAX) writes and reads 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0x7FFFFFFF);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayOfPart01TestMindmapTest019
     * @tc.desc Verify large positive 1000000 writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1000000);
      expect(a.$_get(0)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayOfPart01TestMindmapTest020
     * @tc.desc Verify large negative -1000000 writes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1000000);
      expect(a.$_get(0)).assertEqual(-1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayOfPart01TestMindmapTest021
     * @tc.desc Verify binary 0b1010 (=10) writes as 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0b1010);
      expect(a.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayOfPart01TestMindmapTest022
     * @tc.desc Verify octal 0o777 (=511) writes as 511
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0o777);
      expect(a.$_get(0)).assertEqual(511);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayOfPart01TestMindmapTest023
     * @tc.desc Verify negative octal -0o10 (=-8) writes as -8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0o10);
      expect(a.$_get(0)).assertEqual(-8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayOfPart01TestMindmapTest024
     * @tc.desc Verify hex 0xFF (=255) writes as 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0xFF);
      expect(a.$_get(0)).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayOfPart01TestMindmapTest025
     * @tc.desc Verify hex 0x1 (=1) writes as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0x1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayOfPart01TestMindmapTest026
     * @tc.desc Verify int variable arguments write correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 7;
      let y: int = -3;
      let a: Int32Array = Int32Array.of(x, y);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayOfPart01TestMindmapTest027
     * @tc.desc Verify arithmetic expressions 1+1 and 2*3 evaluate and write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1 + 1, 2 * 3);
      expect(a.$_get(0)).assertEqual(2);
      expect(a.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayOfPart01TestMindmapTest028
     * @tc.desc Verify subtraction expression 100-1 evaluates to 99 and writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100 - 1);
      expect(a.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayOfPart01TestMindmapTest029
     * @tc.desc Verify negation expression -0 evaluates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayOfPart01TestMindmapTest030
     * @tc.desc Verify [-1,0,1] order and signs are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, 0, 1);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayOfPart01TestMindmapTest031
     * @tc.desc Verify [INT_MAX, INT_MIN] both extremes side-by-side order correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647, -2147483648);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayOfPart01TestMindmapTest032
     * @tc.desc Verify [INT_MAX, 0, INT_MIN, 42] extremes interleaved with normal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647, 0, -2147483648, 42);
      expect(a.$_get(0)).assertEqual(2147483647);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(-2147483648);
      expect(a.$_get(3)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayOfPart01TestMindmapTest033
     * @tc.desc Verify all same value [7,7,7,7,7] each position is 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 7, 7, 7, 7);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(7);
      expect(a.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayOfPart01TestMindmapTest034
     * @tc.desc Verify all zeros [0,0,0,0] head and tail are 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0, 0);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayOfPart01TestMindmapTest035
     * @tc.desc Verify descending [5,4,3,2,1] of does not auto-sort order preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 4, 3, 2, 1);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(4)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayOfPart01TestMindmapTest036
     * @tc.desc Verify alternating signs [1,-1,2,-2,3,-3] sign bits correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -1, 2, -2, 3, -3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(-1);
      expect(a.$_get(5)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayOfPart01TestMindmapTest037
     * @tc.desc Verify single-argument of() returns an Int32Array with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.length).assertEqual(1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayOfPart01TestMindmapTest038
     * @tc.desc Verify return value buffer has the expected byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayOfPart01TestMindmapTest039
     * @tc.desc Verify two of() calls return different object instances (no singleton/cache)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      let b: Int32Array = Int32Array.of(1);
      expect(a).not().assertEqual(b);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayOfPart01TestMindmapTest040
     * @tc.desc Verify two of(1,2) return arrays with non-shared buffer (=== is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let b: Int32Array = Int32Array.of(1, 2);
      expect(a.length).assertEqual(2);
      expect(b.length).assertEqual(2);
      expect(a.buffer).not().assertEqual(b.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayOfPart01TestMindmapTest041
     * @tc.desc Verify modifying one of() result does not affect another same-arg call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 6);
      let b: Int32Array = Int32Array.of(5, 6);
      a.$_set(0, 999);
      expect(b.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayOfPart01TestMindmapTest042
     * @tc.desc Verify of() returned array visible modification via $_set (buffer writable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(999);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayOfPart01TestMindmapTest043
     * @tc.desc Verify bracket access [] reads of(77) first element as 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(77);
      expect(a.$_get(0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayOfPart01TestMindmapTest044
     * @tc.desc Verify [] accesses three-element [1,2,3] all positions correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayOfPart01TestMindmapTest045
     * @tc.desc Verify empty array $_get(0) returns undefined without throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let v: number | undefined = a.at(0);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayOfPart01TestMindmapTest046
     * @tc.desc Verify empty array [0] bracket access returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let v = a.at(0);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayOfPart01TestMindmapTest047
     * @tc.desc Verify two-element $_get(-1) out-of-bounds negative returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let v: number | undefined = a.at(-3);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayOfPart01TestMindmapTest048
     * @tc.desc Verify two-element $_get(2) just out-of-bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let v: number | undefined = a.at(2);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayOfPart01TestMindmapTest049
     * @tc.desc Verify length position access returns undefined (not null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20);
      expect(a.at(2)).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayOfPart01TestMindmapTest050
     * @tc.desc Verify forEach iteration count strictly equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let cnt: int = 0;
      a.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        cnt = cnt + 1;
      });
      expect(cnt).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayOfPart01TestMindmapTest051
     * @tc.desc Verify forEach callback value param order matches input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let acc: number[] = [];
      a.forEach((v: number, _i: int, _arr: Int32Array): void => {
        acc.push(v);
      });
      expect(acc[0]).assertEqual(10);
      expect(acc[1]).assertEqual(20);
      expect(acc[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayOfPart01TestMindmapTest052
     * @tc.desc Verify empty array forEach callback executes 0 times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let called: boolean = false;
      a.forEach((_v: number, _i: int, _arr: Int32Array): void => {
        called = true;
      });
      expect(called).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayOfPart01TestMindmapTest053
     * @tc.desc Verify for-of iterate three elements sum equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let sum: number = 0;
      for (const v of a) {
        sum = sum + v;
      }
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayOfPart01TestMindmapTest054
     * @tc.desc Verify for-of on empty array does not enter loop body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let cnt: int = 0;
      for (const v of a) {
        cnt = cnt + 1;
        (v);
      }
      expect(cnt).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayOfPart01TestMindmapTest055
     * @tc.desc Verify empty array toString() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayOfPart01TestMindmapTest056
     * @tc.desc Verify single element 0 toString() is "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      expect(a.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayOfPart01TestMindmapTest057
     * @tc.desc Verify three elements [1,-2,3] toString is "1,-2,3" preserves minus
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -2, 3);
      expect(a.toString()).assertEqual('1,-2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayOfPart01TestMindmapTest058
     * @tc.desc Verify [INT_MAX,INT_MIN] toString outputs both extreme strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647, -2147483648);
      expect(a.toString()).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayOfPart01TestMindmapTest059
     * @tc.desc Verify of(1,2,3) and new Int32Array([1,2,3]) have same length; Also verify verify of(1,2,3) and new Int32Array([1,2,3]) each element value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = new Int32Array([1, 2, 3]);
      expect(a.length).assertEqual(b.length);

      {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = new Int32Array([1, 2, 3]);
      expect(a.$_get(0)).assertEqual(b.$_get(0));
      expect(a.$_get(1)).assertEqual(b.$_get(1));
      expect(a.$_get(2)).assertEqual(b.$_get(2));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayOfPart01TestMindmapTest060
     * @tc.desc Verify of() result as TypedArray source into new Int32Array preserves values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let b: Int32Array = new Int32Array(a);
      expect(b.$_get(0)).assertEqual(10);
      expect(b.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayOfPart01TestMindmapTest061
     * @tc.desc Verify $_set(5, 999) out-of-bounds throws RangeError and preserves length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        a.$_set(5, 999);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayOfPart01TestMindmapTest062
     * @tc.desc Verify $_set(-1, 99) negative index throws RangeError and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      try {
        a.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayOfPart01TestMindmapTest063
     * @tc.desc Verify $_set(1, 99) tail out-of-bounds throws RangeError and preserves value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      try {
        a.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(a.$_get(0)).assertEqual(1);
      expect(a.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayOfPart01TestMindmapTest064
     * @tc.desc Verify of returned array set with insufficient target length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = Int32Array.of(9, 9);
      try {
        a.set(b, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayOfPart01TestMindmapTest065
     * @tc.desc Verify empty array reduce without initialValue throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      try {
        a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayOfPart01TestMindmapTest066
     * @tc.desc Verify empty array some always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let result: boolean = a.some((_v: number, _i: int, _arr: Int32Array): boolean => true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayOfPart01TestMindmapTest067
     * @tc.desc Verify empty array every always returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      let result: boolean = a.every((_v: number, _i: int, _arr: Int32Array): boolean => false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayOfPart01TestMindmapTest068
     * @tc.desc Verify of returned array fill(7) all elements become 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0, 0, 0);
      a.fill(7);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayOfPart01TestMindmapTest069
     * @tc.desc Verify of returned array sort default numeric ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      a.sort();
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayOfPart01TestMindmapTest070
     * @tc.desc Verify of returned array copyWithin overlapping region copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.copyWithin(2, 0);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(1);
      expect(a.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayOfPart01TestMindmapTest071
     * @tc.desc Verify of returned array subarray shares buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = a.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      a.$_set(1, 999);
      expect(sub.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayOfPart01TestMindmapTest072
     * @tc.desc Verify of returned array indexOf existing element returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, 10, 15, 20);
      expect(a.indexOf(15)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayOfPart01TestMindmapTest073
     * @tc.desc Verify of returned array indexOf nonexistent element returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayOfPart01TestMindmapTest074
     * @tc.desc Verify of returned array includes existing element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, 0, 1);
      expect(a.includes(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayOfPart01TestMindmapTest075
     * @tc.desc Verify of returned array includes nonexistent element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7600
     * @tc.name int32ArrayOfPart01TestMindmapTest076
     * @tc.desc Verify of returned array lastIndexOf duplicate returns last occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30, 20);
      expect(a.lastIndexOf(20)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7700
     * @tc.name int32ArrayOfPart01TestMindmapTest077
     * @tc.desc Verify of returned array some with matching element returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, -2, 3);
      let result: boolean = a.some((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7800
     * @tc.name int32ArrayOfPart01TestMindmapTest078
     * @tc.desc Verify of returned array some all non-matching returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, -2, -3);
      expect(a.some((v: number, _i: int, _arr: Int32Array): boolean => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_7900
     * @tc.name int32ArrayOfPart01TestMindmapTest079
     * @tc.desc Verify of returned array every all matching returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.every((v: number, _i: int, _arr: Int32Array): boolean => v > 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_8000
     * @tc.name int32ArrayOfPart01TestMindmapTest080
     * @tc.desc Verify of returned array every with non-match returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, -3);
      expect(a.every((v: number, _i: int, _arr: Int32Array): boolean => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_8100
     * @tc.name int32ArrayOfPart01TestMindmapTest081
     * @tc.desc Verify of returned array reduce with initialValue sums correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let sum: number = a.reduce((acc: number, v: number, _i: int, _arr: Int32Array): number => acc + v, 0);
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_8200
     * @tc.name int32ArrayOfPart01TestMindmapTest082
     * @tc.desc Verify of returned array map multiply each by 2 result correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let m: Int32Array = a.map((v: number, _i: int, _arr: Int32Array): number => v * 2);
      expect(m.$_get(0)).assertEqual(2);
      expect(m.$_get(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_8300
     * @tc.name int32ArrayOfPart01TestMindmapTest083
     * @tc.desc Verify of returned array filter preserves positive elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -2, 3, -4);
      let pos: Int32Array = a.filter((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(pos.length).assertEqual(2);
      expect(pos.$_get(0)).assertEqual(1);
      expect(pos.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_8400
     * @tc.name int32ArrayOfPart01TestMindmapTest084
     * @tc.desc Verify of returned array find first positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, -2, 3, 4);
      let v: number | undefined = a.find((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(v).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART01_TEST_MINDMAP_8500
     * @tc.name int32ArrayOfPart01TestMindmapTest085
     * @tc.desc Verify of returned array find no match returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart01TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, -2, -3);
      let v: number | undefined = a.find((v: number, _i: int, _arr: Int32Array): boolean => v > 0);
      expect(v).assertEqual(undefined);
    });
  });
}
